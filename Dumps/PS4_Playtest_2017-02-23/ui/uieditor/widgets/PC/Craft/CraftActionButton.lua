require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

local SetupPC = function ( self, controller, menu )
	self:setHandleMouse( true )
	self:registerEventHandler( "leftmouseup", function ( element, event )
		if self.m_button then
			self:playClip( "Flash" )
			if self.m_isDpad then
				CoD.PCUtil.SimulateDPadButtonPress( controller, self.m_button )
			else
				CoD.PCUtil.SimulateButtonPress( controller, self.m_button )
			end
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( self, "setModel", function ( self, model )
		local values = CoD.PCUtil.GetModelValues( model, {
			"perControllerStatusModel",
			"getStatusTable"
		} )
		if values and values.perControllerStatusModel then
			self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), values.perControllerStatusModel ), function ( model )
				local modelValue = Engine.GetModelValue( model )
				if values.getStatusTable then
					local table = values.getStatusTable()
					local status = table[modelValue]
					if status and status.label then
						self.actionName:setText( Engine.Localize( status.label ) )
					end
				end
			end )
		end
	end )
end

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		SetupPC( self, controller, menu )
	end
end

CoD.CraftActionButton = InheritFrom( LUI.UIElement )
CoD.CraftActionButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CraftActionButton )
	self.id = "CraftActionButton"
	self.soundSet = "SelectColor"
	self:setLeftRight( 0, 0, 0, 375 )
	self:setTopBottom( 0, 0, 0, 30 )
	self.anyChildUsesUpdateState = true
	
	local fullBackground = LUI.UIImage.new()
	fullBackground:setLeftRight( 0, 1, 0, 0 )
	fullBackground:setTopBottom( 0, 1, 0, 0 )
	fullBackground:setRGB( 0.1, 0.1, 0.1 )
	self:addElement( fullBackground )
	self.fullBackground = fullBackground
	
	local flash = LUI.UIImage.new()
	flash:setLeftRight( 0, 1, 0, 0 )
	flash:setTopBottom( 0, 1, 0, 0 )
	flash:setRGB( 1, 0.47, 0 )
	flash:setAlpha( 0 )
	self:addElement( flash )
	self.flash = flash
	
	local actionName = LUI.UIText.new()
	actionName:setLeftRight( 0, 0, 10, 310 )
	actionName:setTopBottom( 0, 0, 0, 30 )
	actionName:setTTF( "fonts/default.ttf" )
	actionName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	actionName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( actionName )
	self.actionName = actionName
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( 0, 1, 0, 0 )
	FocusBarB:setTopBottom( 1, 1, -4, 4 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( 0, 1, 4, 0 )
	FocusBarT:setTopBottom( 0, 0, -3, 3 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	self.actionName:linkToElementModel( self, "actionName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			actionName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.resetProperties = function ()
		FocusBarB:completeAnimation()
		FocusBarT:completeAnimation()
		flash:completeAnimation()
		FocusBarB:setAlpha( 0 )
		FocusBarT:setAlpha( 0 )
		flash:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Over = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0.5 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0.5 )
				self.clipFinished( FocusBarT, {} )
			end,
			Flash = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local flashFrame2 = function ( flash, event )
					local flashFrame3 = function ( flash, event )
						if not event.interrupted then
							flash:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						end
						flash:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( flash, event )
						else
							flash:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						flashFrame3( flash, event )
						return 
					else
						flash:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						flash:setAlpha( 1 )
						flash:registerEventHandler( "transition_complete_keyframe", flashFrame3 )
					end
				end
				
				flash:completeAnimation()
				self.flash:setAlpha( 0 )
				flashFrame2( flash, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FocusBarB:close()
		self.FocusBarT:close()
		self.actionName:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

