-- 228a2b3ce748f6bb8d1ec80aa6fc50b5
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Theater.Theater_FocusBar" )

CoD.DemoControlsButtonDollyCameraSpeedMode = InheritFrom( LUI.UIElement )
CoD.DemoControlsButtonDollyCameraSpeedMode.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.DemoControlsButtonDollyCameraSpeedMode )
	self.id = "DemoControlsButtonDollyCameraSpeedMode"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 40 )
	self:setTopBottom( true, false, 0, 45 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local whitebox = LUI.UIImage.new()
	whitebox:setLeftRight( true, false, 0, 40 )
	whitebox:setTopBottom( true, false, 11.5, 35 )
	whitebox:setAlpha( 0 )
	self:addElement( whitebox )
	self.whitebox = whitebox
	
	local border = LUI.UIImage.new()
	border:setLeftRight( false, false, -20, 20 )
	border:setTopBottom( false, false, -12.5, 12.5 )
	border:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
	border:setAlpha( 0 )
	self:addElement( border )
	self.border = border
	
	local imagebg = LUI.UIImage.new()
	imagebg:setLeftRight( false, false, -18, 18 )
	imagebg:setTopBottom( false, false, -10.5, 10.5 )
	imagebg:setRGB( 0.18, 0.18, 0.18 )
	imagebg:setAlpha( 0 )
	self:addElement( imagebg )
	self.imagebg = imagebg
	
	local icon = LUI.UIImage.new()
	icon:setLeftRight( false, false, -10, 10 )
	icon:setTopBottom( false, false, -10, 10 )
	self:addElement( icon )
	self.icon = icon
	
	local uparrow = LUI.UIImage.new()
	uparrow:setLeftRight( false, false, -8, 8 )
	uparrow:setTopBottom( false, false, -22.5, -12.5 )
	uparrow:setZRot( 180 )
	uparrow:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_arrow" ) )
	uparrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( uparrow )
	self.uparrow = uparrow
	
	local downarrow = LUI.UIImage.new()
	downarrow:setLeftRight( false, false, -8, 8 )
	downarrow:setTopBottom( false, false, 13.5, 23.5 )
	downarrow:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_arrow" ) )
	downarrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( downarrow )
	self.downarrow = downarrow
	
	local TheaterFocusBarT0 = CoD.Theater_FocusBar.new( menu, controller )
	TheaterFocusBarT0:setLeftRight( true, false, -3, 43 )
	TheaterFocusBarT0:setTopBottom( true, false, 7, 15 )
	TheaterFocusBarT0:setAlpha( 0 )
	TheaterFocusBarT0:setScale( 0.9 )
	self:addElement( TheaterFocusBarT0 )
	self.TheaterFocusBarT0 = TheaterFocusBarT0
	
	local TheaterFocusBarB0 = CoD.Theater_FocusBar.new( menu, controller )
	TheaterFocusBarB0:setLeftRight( true, false, -3, 43 )
	TheaterFocusBarB0:setTopBottom( true, false, 31, 39 )
	TheaterFocusBarB0:setAlpha( 0 )
	TheaterFocusBarB0:setXRot( 180 )
	TheaterFocusBarB0:setScale( 0.9 )
	self:addElement( TheaterFocusBarB0 )
	self.TheaterFocusBarB0 = TheaterFocusBarB0
	
	self.icon:linkToElementModel( self, "icon", true, function ( model )
		local _icon = Engine.GetModelValue( model )
		if _icon then
			icon:setImage( RegisterImage( _icon ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				whitebox:completeAnimation()
				self.whitebox:setAlpha( 0 )
				self.clipFinished( whitebox, {} )
				border:completeAnimation()
				self.border:setRGB( ColorSet.BadgeText.r, ColorSet.BadgeText.g, ColorSet.BadgeText.b )
				self.clipFinished( border, {} )
				icon:completeAnimation()
				self.icon:setYRot( 0 )
				self.clipFinished( icon, {} )
				uparrow:completeAnimation()
				self.uparrow:setAlpha( 0 )
				self.clipFinished( uparrow, {} )
				downarrow:completeAnimation()
				self.downarrow:setAlpha( 0 )
				self.clipFinished( downarrow, {} )
				TheaterFocusBarT0:completeAnimation()
				self.TheaterFocusBarT0:setAlpha( 0 )
				self.clipFinished( TheaterFocusBarT0, {} )
				TheaterFocusBarB0:completeAnimation()
				self.TheaterFocusBarB0:setAlpha( 0 )
				self.clipFinished( TheaterFocusBarB0, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 5 )
				whitebox:completeAnimation()
				self.whitebox:setAlpha( 0.15 )
				self.clipFinished( whitebox, {} )
				uparrow:completeAnimation()
				self.uparrow:setAlpha( 1 )
				self.clipFinished( uparrow, {} )
				downarrow:completeAnimation()
				self.downarrow:setAlpha( 1 )
				self.clipFinished( downarrow, {} )
				TheaterFocusBarT0:completeAnimation()
				self.TheaterFocusBarT0:setAlpha( 1 )
				self.clipFinished( TheaterFocusBarT0, {} )
				TheaterFocusBarB0:completeAnimation()
				self.TheaterFocusBarB0:setAlpha( 1 )
				self.clipFinished( TheaterFocusBarB0, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				whitebox:completeAnimation()
				self.whitebox:setAlpha( 0 )
				self.clipFinished( whitebox, {} )
				icon:completeAnimation()
				self.icon:setRGB( ColorSet.Disabled.r, ColorSet.Disabled.g, ColorSet.Disabled.b )
				self.clipFinished( icon, {} )
				TheaterFocusBarT0:completeAnimation()
				self.TheaterFocusBarT0:setAlpha( 0 )
				self.clipFinished( TheaterFocusBarT0, {} )
				TheaterFocusBarB0:completeAnimation()
				self.TheaterFocusBarB0:setAlpha( 0 )
				self.clipFinished( TheaterFocusBarB0, {} )
			end
		},
		ShowOnlyUpArrow = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				whitebox:completeAnimation()
				self.whitebox:setAlpha( 0 )
				self.clipFinished( whitebox, {} )
				icon:completeAnimation()
				self.icon:setYRot( 0 )
				self.clipFinished( icon, {} )
				uparrow:completeAnimation()
				self.uparrow:setAlpha( 0 )
				self.clipFinished( uparrow, {} )
				downarrow:completeAnimation()
				self.downarrow:setAlpha( 0 )
				self.clipFinished( downarrow, {} )
				TheaterFocusBarT0:completeAnimation()
				self.TheaterFocusBarT0:setAlpha( 0 )
				self.clipFinished( TheaterFocusBarT0, {} )
				TheaterFocusBarB0:completeAnimation()
				self.TheaterFocusBarB0:setAlpha( 0 )
				self.clipFinished( TheaterFocusBarB0, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 5 )
				whitebox:completeAnimation()
				self.whitebox:setAlpha( 0.15 )
				self.clipFinished( whitebox, {} )
				uparrow:completeAnimation()
				self.uparrow:setAlpha( 1 )
				self.clipFinished( uparrow, {} )
				downarrow:completeAnimation()
				self.downarrow:setAlpha( 0 )
				self.clipFinished( downarrow, {} )
				TheaterFocusBarT0:completeAnimation()
				self.TheaterFocusBarT0:setAlpha( 1 )
				self.clipFinished( TheaterFocusBarT0, {} )
				TheaterFocusBarB0:completeAnimation()
				self.TheaterFocusBarB0:setAlpha( 1 )
				self.clipFinished( TheaterFocusBarB0, {} )
			end
		},
		ShowOnlyDownArrow = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				whitebox:completeAnimation()
				self.whitebox:setAlpha( 0 )
				self.clipFinished( whitebox, {} )
				icon:completeAnimation()
				self.icon:setYRot( 0 )
				self.clipFinished( icon, {} )
				uparrow:completeAnimation()
				self.uparrow:setAlpha( 0 )
				self.clipFinished( uparrow, {} )
				downarrow:completeAnimation()
				self.downarrow:setAlpha( 1 )
				self.clipFinished( downarrow, {} )
				TheaterFocusBarT0:completeAnimation()
				self.TheaterFocusBarT0:setAlpha( 0 )
				self.clipFinished( TheaterFocusBarT0, {} )
				TheaterFocusBarB0:completeAnimation()
				self.TheaterFocusBarB0:setAlpha( 0 )
				self.clipFinished( TheaterFocusBarB0, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 5 )
				whitebox:completeAnimation()
				self.whitebox:setAlpha( 0.15 )
				self.clipFinished( whitebox, {} )
				uparrow:completeAnimation()
				self.uparrow:setAlpha( 0 )
				self.clipFinished( uparrow, {} )
				downarrow:completeAnimation()
				self.downarrow:setAlpha( 1 )
				self.clipFinished( downarrow, {} )
				TheaterFocusBarT0:completeAnimation()
				self.TheaterFocusBarT0:setAlpha( 1 )
				self.clipFinished( TheaterFocusBarT0, {} )
				TheaterFocusBarB0:completeAnimation()
				self.TheaterFocusBarB0:setAlpha( 1 )
				self.clipFinished( TheaterFocusBarB0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsDisabled( element, controller )
			end
		},
		{
			stateName = "ShowOnlyUpArrow",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualToEnum( element, controller, "demo.currentDollyCamMarkerTimeScaleMode", Enum.demoDollyCameraTimeScaleMode.DEMO_DOLLYCAM_TIMESCALE_MODE_FIXED )
			end
		},
		{
			stateName = "ShowOnlyDownArrow",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualToEnum( element, controller, "demo.currentDollyCamMarkerTimeScaleMode", Enum.demoDollyCameraTimeScaleMode.DEMO_DOLLYCAM_TIMESCALE_MODE_MANUAL )
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
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "demo.currentDollyCamMarkerTimeScaleMode" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "demo.currentDollyCamMarkerTimeScaleMode"
		} )
	end )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_UP, nil, function ( f15_arg0, f15_arg1, f15_arg2, f15_arg3 )
		UpdateDollyCameraTimeScaleMode( f15_arg2, "prev" )
		return true
	end, function ( f16_arg0, f16_arg1, f16_arg2 )
		CoD.Menu.SetButtonLabel( f16_arg1, Enum.LUIButton.LUI_KEY_UP, "" )
		return false
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_DOWN, nil, function ( f17_arg0, f17_arg1, f17_arg2, f17_arg3 )
		UpdateDollyCameraTimeScaleMode( f17_arg2, "next" )
		return true
	end, function ( f18_arg0, f18_arg1, f18_arg2 )
		CoD.Menu.SetButtonLabel( f18_arg1, Enum.LUIButton.LUI_KEY_DOWN, "" )
		return false
	end, false )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.TheaterFocusBarT0:close()
		element.TheaterFocusBarB0:close()
		element.icon:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

