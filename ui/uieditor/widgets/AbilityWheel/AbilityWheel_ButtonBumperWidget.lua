-- e4c8ae0ce0126691f64b4a2e86824c01
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.AbilityWheel.CycleOverButton" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0:setForceMouseEventDispatch( true )
end

CoD.AbilityWheel_ButtonBumperWidget = InheritFrom( LUI.UIElement )
CoD.AbilityWheel_ButtonBumperWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AbilityWheel_ButtonBumperWidget )
	self.id = "AbilityWheel_ButtonBumperWidget"
	self.soundSet = "AbilityWheel"
	self:setLeftRight( true, false, 0, 318 )
	self:setTopBottom( true, false, 0, 26 )
	self.anyChildUsesUpdateState = true
	
	local BumperLeft = LUI.UIImage.new()
	BumperLeft:setLeftRight( false, false, 116.48, 152.84 )
	BumperLeft:setTopBottom( false, false, -13, 12 )
	BumperLeft:setAlpha( 0.6 )
	BumperLeft:setScale( 0.8 )
	BumperLeft:setImage( RegisterImage( "uie_t7_icons_controller_orbis_r1white" ) )
	BumperLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( BumperLeft )
	self.BumperLeft = BumperLeft
	
	local BumperRight = LUI.UIImage.new()
	BumperRight:setLeftRight( false, false, -153.84, -117.48 )
	BumperRight:setTopBottom( false, false, -13, 12 )
	BumperRight:setAlpha( 0.6 )
	BumperRight:setScale( 0.8 )
	BumperRight:setImage( RegisterImage( "uie_t7_icons_controller_orbis_l1white" ) )
	BumperRight:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( BumperRight )
	self.BumperRight = BumperRight
	
	local HexLeft = LUI.UIImage.new()
	HexLeft:setLeftRight( true, false, 2.37, 42.31 )
	HexLeft:setTopBottom( true, false, -10.05, 36.05 )
	HexLeft:setAlpha( 0.2 )
	HexLeft:setZRot( 90 )
	HexLeft:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_iconhex" ) )
	HexLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( HexLeft )
	self.HexLeft = HexLeft
	
	local lineL = LUI.UIImage.new()
	lineL:setLeftRight( true, false, -16, 6 )
	lineL:setTopBottom( false, false, -1.07, 1.07 )
	lineL:setZRot( 180 )
	lineL:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	lineL:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( lineL )
	self.lineL = lineL
	
	local HexRight = LUI.UIImage.new()
	HexRight:setLeftRight( true, false, 273.89, 313.84 )
	HexRight:setTopBottom( true, false, -10.05, 36.05 )
	HexRight:setAlpha( 0.2 )
	HexRight:setZRot( -90 )
	HexRight:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_iconhex" ) )
	HexRight:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( HexRight )
	self.HexRight = HexRight
	
	local lineR = LUI.UIImage.new()
	lineR:setLeftRight( true, false, 310.66, 332.66 )
	lineR:setTopBottom( false, false, -1.07, 1.07 )
	lineR:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	lineR:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( lineR )
	self.lineR = lineR
	
	local CycleOverButtonLeft = CoD.CycleOverButton.new( menu, controller )
	CycleOverButtonLeft:setLeftRight( true, false, 33.84, 73.84 )
	CycleOverButtonLeft:setTopBottom( true, false, -7.5, 32.5 )
	CycleOverButtonLeft:registerEventHandler( "mouse_left_click", function ( element, event )
		local f3_local0 = nil
		SendButtonPressToMenuEx( menu, controller, Enum.LUIButton.LUI_KEY_LB )
		if not f3_local0 then
			f3_local0 = element:dispatchEventToChildren( event )
		end
		return f3_local0
	end )
	CycleOverButtonLeft:registerEventHandler( "button_action", function ( element, event )
		local f4_local0 = nil
		SendButtonPressToMenuEx( menu, controller, Enum.LUIButton.LUI_KEY_LB )
		if not f4_local0 then
			f4_local0 = element:dispatchEventToChildren( event )
		end
		return f4_local0
	end )
	self:addElement( CycleOverButtonLeft )
	self.CycleOverButtonLeft = CycleOverButtonLeft
	
	local CycleOverButtonRight = CoD.CycleOverButton.new( menu, controller )
	CycleOverButtonRight:setLeftRight( true, false, 242, 282 )
	CycleOverButtonRight:setTopBottom( true, false, -7, 33 )
	CycleOverButtonRight:setZRot( 180 )
	CycleOverButtonRight:registerEventHandler( "mouse_left_click", function ( element, event )
		local f5_local0 = nil
		SendButtonPressToMenuEx( menu, controller, Enum.LUIButton.LUI_KEY_RB )
		if not f5_local0 then
			f5_local0 = element:dispatchEventToChildren( event )
		end
		return f5_local0
	end )
	CycleOverButtonRight:registerEventHandler( "button_action", function ( element, event )
		local f6_local0 = nil
		SendButtonPressToMenuEx( menu, controller, Enum.LUIButton.LUI_KEY_RB )
		if not f6_local0 then
			f6_local0 = element:dispatchEventToChildren( event )
		end
		return f6_local0
	end )
	self:addElement( CycleOverButtonRight )
	self.CycleOverButtonRight = CycleOverButtonRight
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				BumperLeft:completeAnimation()
				self.BumperLeft:setAlpha( 0.6 )
				self.clipFinished( BumperLeft, {} )
				BumperRight:completeAnimation()
				self.BumperRight:setAlpha( 0.6 )
				self.clipFinished( BumperRight, {} )
				HexLeft:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
				HexLeft:setAlpha( 0.2 )
				HexLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				HexRight:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
				HexRight:setAlpha( 0.2 )
				HexRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
			end,
			Close = function ()
				self:setupElementClipCounter( 2 )
				HexLeft:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
				HexLeft:setAlpha( 0.2 )
				HexLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				HexRight:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
				HexRight:setAlpha( 0.2 )
				HexRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
			end
		},
		KBMouse = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				BumperLeft:completeAnimation()
				self.BumperLeft:setAlpha( 0 )
				self.clipFinished( BumperLeft, {} )
				BumperRight:completeAnimation()
				self.BumperRight:setAlpha( 0 )
				self.clipFinished( BumperRight, {} )
				HexLeft:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
				HexLeft:setAlpha( 0 )
				HexLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				HexRight:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
				HexRight:setAlpha( 0 )
				HexRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "KBMouse",
			condition = function ( menu, element, event )
				return not IsGamepad( controller )
			end
		}
	} )
	if self.m_eventHandlers.input_source_changed then
		local f2_local9 = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return f2_local9( element, event )
		end )
	else
		self:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CycleOverButtonLeft:close()
		element.CycleOverButtonRight:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

