-- 86907a9f0b256f98d07635b22451ed94
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

local f0_local0 = function ( f1_arg0, f1_arg1 )
	local f1_local0, f1_local1, f1_local2, f1_local3 = f1_arg0.sliderBack:getLocalRect()
	local f1_local4 = f1_arg1 * (f1_local2 - f1_local0)
	f1_arg0.sliderBar:setLeftRight( true, false, f1_local0 + f1_local4 - f1_arg0.m_markerHalfWidth, f1_local0 + f1_local4 + f1_arg0.m_markerHalfWidth )
	f1_arg0.sliderFill:setLeftRight( true, false, f1_local0, f1_local0 + f1_local4 )
end

local f0_local1 = function ( f2_arg0, f2_arg1 )
	if type( f2_arg0.updateAction ) == "function" then
		f2_arg0.updateAction( f2_arg0.m_menu, f2_arg0, f2_arg1 )
	end
	f0_local0( f2_arg0, f2_arg1 )
end

local f0_local2 = function ( f3_arg0, f3_arg1 )
	local f3_local0, f3_local1, f3_local2, f3_local3 = f3_arg0.sliderBack:getRect()
	local f3_local4 = f3_local2 - f3_local0
	f0_local1( f3_arg0, CoD.ClampColor( f3_arg1.x - f3_local0, 0, f3_local4 ) / f3_local4 )
end

local f0_local3 = function ( f4_arg0, f4_arg1, f4_arg2 )
	f4_arg0:setHandleMouse( true )
	f4_arg0.m_forceMouseEventDispatch = true
	f4_arg0.m_menu = f4_arg2
	local f4_local0, f4_local1, f4_local2, f4_local3 = f4_arg0.sliderBar:getLocalRect()
	f4_arg0.m_markerHalfWidth = (f4_local2 - f4_local0) / 2
	f4_arg0:registerEventHandler( "leftmouseup", function ( element, event )
		f0_local2( element, event )
		return true
	end )
	f4_arg0:registerEventHandler( "mousedrag", function ( element, event )
		f0_local2( element, event )
	end )
	LUI.OverrideFunction_CallOriginalFirst( f4_arg0, "setModel", function ( element, controller )
		local f7_local0 = CoD.PCUtil.GetModelValues( controller, {
			"actionName",
			"perControllerValueModel",
			"perControllerStatusModel",
			"lowValue",
			"highValue",
			"getStatusTable"
		} )
		if f7_local0 then
			if f7_local0.perControllerValueModel and f7_local0.lowValue and f7_local0.highValue then
				element:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f4_arg1 ), f7_local0.perControllerValueModel ), function ( model )
					f0_local0( element, Engine.GetModelValue( model ) / (f7_local0.highValue - f7_local0.lowValue) )
				end )
			end
			if f7_local0.perControllerStatusModel then
				element:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f4_arg1 ), f7_local0.perControllerStatusModel ), function ( model )
					local modelValue = Engine.GetModelValue( model )
					if f7_local0.getStatusTable then
						local f9_local1 = f7_local0.getStatusTable()
						local f9_local2 = f9_local1 and f9_local1[modelValue]
						if f9_local2 then
							element.disabled = f9_local2.disabled
						else
							element.disabled = nil
						end
						element:processEvent( {
							name = "update_state",
							menu = element.m_menu
						} )
					end
				end )
			end
		end
	end )
end

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		f0_local3( self, controller, menu )
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
	self:setLeftRight( true, false, 0, 250 )
	self:setTopBottom( true, false, 0, 40 )
	self.anyChildUsesUpdateState = true
	
	local fullBackground = LUI.UIImage.new()
	fullBackground:setLeftRight( true, true, 0, 0 )
	fullBackground:setTopBottom( true, true, 0, 0 )
	fullBackground:setRGB( 0.1, 0.1, 0.1 )
	fullBackground:setAlpha( 0.5 )
	self:addElement( fullBackground )
	self.fullBackground = fullBackground
	
	local actionName = LUI.UIText.new()
	actionName:setLeftRight( true, false, 25, 250 )
	actionName:setTopBottom( true, false, 0, 20 )
	actionName:setTTF( "fonts/default.ttf" )
	actionName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	actionName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( actionName )
	self.actionName = actionName
	
	local icon = LUI.UIImage.new()
	icon:setLeftRight( true, false, 4, 20 )
	icon:setTopBottom( true, false, 2, 18 )
	icon:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			icon:setImage( RegisterImage( image ) )
		end
	end )
	self:addElement( icon )
	self.icon = icon
	
	local sliderBack = CoD.FE_TitleNumBrdr.new( menu, controller )
	sliderBack:setLeftRight( true, false, 7, 237 )
	sliderBack:setTopBottom( true, false, 24, 32.25 )
	self:addElement( sliderBack )
	self.sliderBack = sliderBack
	
	local sliderFill = LUI.UIImage.new()
	sliderFill:setLeftRight( true, false, 8.9, 130.9 )
	sliderFill:setTopBottom( false, false, 5.85, 10.25 )
	self:addElement( sliderFill )
	self.sliderFill = sliderFill
	
	local sliderBar = LUI.UIImage.new()
	sliderBar:setLeftRight( true, false, 130.9, 134.9 )
	sliderBar:setTopBottom( true, false, 24, 32.25 )
	self:addElement( sliderBar )
	self.sliderBar = sliderBar
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, 2, 0 )
	FocusBarT:setTopBottom( true, false, -2, 2 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, 0, 0 )
	FocusBarB:setTopBottom( false, true, -2.75, 2.75 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	self.actionName:linkToElementModel( self, "actionName", true, function ( model )
		local _actionName = Engine.GetModelValue( model )
		if _actionName then
			actionName:setText( Engine.Localize( _actionName ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				actionName:completeAnimation()
				self.actionName:setAlpha( 1 )
				self.clipFinished( actionName, {} )
				sliderFill:completeAnimation()
				self.sliderFill:setRGB( 1, 1, 1 )
				self.sliderFill:setAlpha( 1 )
				self.clipFinished( sliderFill, {} )
				sliderBar:completeAnimation()
				self.sliderBar:setRGB( 1, 1, 1 )
				self.sliderBar:setAlpha( 1 )
				self.clipFinished( sliderBar, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 4 )
				sliderFill:completeAnimation()
				self.sliderFill:setRGB( 0.87, 0.37, 0 )
				self.clipFinished( sliderFill, {} )
				sliderBar:completeAnimation()
				self.sliderBar:setRGB( 0.87, 0.37, 0 )
				self.clipFinished( sliderBar, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, true, -1, 1 )
				self.FocusBarT:setTopBottom( true, false, -2, 2 )
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, true, -1, 1 )
				self.FocusBarB:setTopBottom( false, true, -2.75, 2.75 )
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.sliderBack:close()
		element.FocusBarT:close()
		element.FocusBarB:close()
		element.actionName:close()
		element.icon:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

