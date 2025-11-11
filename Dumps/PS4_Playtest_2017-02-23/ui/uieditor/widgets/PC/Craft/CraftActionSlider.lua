require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )

local UpdateVisuals = function ( self, fraction )
	local lleft, ltop, lright, lbottom = self.sliderBack:getLocalRect()
	local xPos = fraction * (lright - lleft)
	self.sliderBar:setLeftRight( true, false, lleft + xPos - self.m_markerHalfWidth, lleft + xPos + self.m_markerHalfWidth )
	self.sliderFill:setLeftRight( true, false, lleft, lleft + xPos )
end

local Update = function ( self, fraction )
	if type( self.updateAction ) == "function" then
		self.updateAction( self.m_menu, self, fraction )
	end
	UpdateVisuals( self, fraction )
end

local UpdateBar = function ( self, event )
	local gleft, gtop, gright, gbottom = self.sliderBack:getRect()
	local barWidth = gright - gleft
	local xPos = CoD.ColorUtility.ClampColor( event.x - gleft, 0, barWidth )
	local fraction = xPos / barWidth
	Update( self, fraction )
end

local SetupPC = function ( self, controller, menu )
	self:setHandleMouse( true )
	self.m_forceMouseEventDispatch = true
	self.m_menu = menu
	local barLeft, barTop, barRight, barBottom = self.sliderBar:getLocalRect()
	self.m_markerHalfWidth = (barRight - barLeft) / 2
	self:registerEventHandler( "leftmouseup", function ( self, event )
		UpdateBar( self, event )
		return true
	end )
	self:registerEventHandler( "mousedrag", function ( self, event )
		UpdateBar( self, event )
	end )
	LUI.OverrideFunction_CallOriginalFirst( self, "setModel", function ( self, model )
		local values = CoD.PCUtil.GetModelValues( model, {
			"actionName",
			"perControllerValueModel",
			"perControllerStatusModel",
			"lowValue",
			"highValue",
			"getStatusTable"
		} )
		if values then
			if values.perControllerValueModel and values.lowValue and values.highValue then
				self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), values.perControllerValueModel ), function ( model )
					local opacity = Engine.GetModelValue( model )
					local fraction = opacity / (values.highValue - values.lowValue)
					UpdateVisuals( self, fraction )
				end )
			end
			if values.perControllerStatusModel then
				self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), values.perControllerStatusModel ), function ( model )
					local modelValue = Engine.GetModelValue( model )
					if values.getStatusTable then
						local table = values.getStatusTable()
						local f9_local0 = table
						local status = table[modelValue]
						local f9_local1 = f9_local0 and status
						if f9_local1 then
							self.disabled = f9_local1.disabled
						else
							self.disabled = nil
						end
						self:processEvent( {
							name = "update_state",
							menu = self.m_menu
						} )
					end
				end )
			end
		end
	end )
end

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		SetupPC( self, controller, menu )
	end
end

CoD.CraftActionSlider = InheritFrom( LUI.UIElement )
CoD.CraftActionSlider.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CraftActionSlider )
	self.id = "CraftActionSlider"
	self.soundSet = "SelectColor"
	self:setLeftRight( 0, 0, 0, 375 )
	self:setTopBottom( 0, 0, 0, 60 )
	self.anyChildUsesUpdateState = true
	
	local fullBackground = LUI.UIImage.new()
	fullBackground:setLeftRight( 0, 1, 0, 0 )
	fullBackground:setTopBottom( 0, 1, 0, 0 )
	fullBackground:setRGB( 0.1, 0.1, 0.1 )
	self:addElement( fullBackground )
	self.fullBackground = fullBackground
	
	local actionName = LUI.UIText.new()
	actionName:setLeftRight( 0, 0, 10, 310 )
	actionName:setTopBottom( 0, 0, 0, 30 )
	actionName:setTTF( "fonts/default.ttf" )
	actionName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	actionName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( actionName )
	self.actionName = actionName
	
	local sliderBack = CoD.FE_TitleNumBrdr.new( menu, controller )
	sliderBack:setLeftRight( 0, 0, 20, 365 )
	sliderBack:setTopBottom( 0, 0, 36, 48 )
	self:addElement( sliderBack )
	self.sliderBack = sliderBack
	
	local sliderFill = LUI.UIImage.new()
	sliderFill:setLeftRight( 0, 0, 23, 206 )
	sliderFill:setTopBottom( 0.5, 0.5, 9, 16 )
	self:addElement( sliderFill )
	self.sliderFill = sliderFill
	
	local sliderBar = LUI.UIImage.new()
	sliderBar:setLeftRight( 0, 0, 206, 212 )
	sliderBar:setTopBottom( 0, 0, 36, 48 )
	self:addElement( sliderBar )
	self.sliderBar = sliderBar
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( 0, 1, 4, 0 )
	FocusBarT:setTopBottom( 0, 0, -3, 3 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( 0, 1, 0, 0 )
	FocusBarB:setTopBottom( 1, 1, -4, 4 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	self.actionName:linkToElementModel( self, "actionName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			actionName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.resetProperties = function ()
		FocusBarB:completeAnimation()
		FocusBarT:completeAnimation()
		sliderFill:completeAnimation()
		sliderBar:completeAnimation()
		actionName:completeAnimation()
		FocusBarB:setAlpha( 0 )
		FocusBarT:setAlpha( 0 )
		sliderFill:setRGB( 1, 1, 1 )
		sliderFill:setAlpha( 1 )
		sliderBar:setRGB( 1, 1, 1 )
		sliderBar:setAlpha( 1 )
		actionName:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Over = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				sliderFill:completeAnimation()
				self.sliderFill:setRGB( 0.87, 0.37, 0 )
				self.clipFinished( sliderFill, {} )
				sliderBar:completeAnimation()
				self.sliderBar:setRGB( 0.87, 0.37, 0 )
				self.clipFinished( sliderBar, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0.5 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0.5 )
				self.clipFinished( FocusBarB, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				actionName:completeAnimation()
				self.actionName:setAlpha( 0.25 )
				self.clipFinished( actionName, {} )
				sliderFill:completeAnimation()
				self.sliderFill:setAlpha( 0.25 )
				self.clipFinished( sliderFill, {} )
				sliderBar:completeAnimation()
				self.sliderBar:setAlpha( 0.25 )
				self.clipFinished( sliderBar, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsDisabled( element, controller )
			end
		}
	} )
	self:linkToElementModel( self, "disabled", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.sliderBack:close()
		self.FocusBarT:close()
		self.FocusBarB:close()
		self.actionName:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

