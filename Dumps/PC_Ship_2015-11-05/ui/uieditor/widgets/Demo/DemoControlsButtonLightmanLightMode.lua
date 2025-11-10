CoD.DemoControlsButtonLightmanLightMode = InheritFrom( LUI.UIElement )
CoD.DemoControlsButtonLightmanLightMode.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.DemoControlsButtonLightmanLightMode )
	self.id = "DemoControlsButtonLightmanLightMode"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 40 )
	self:setTopBottom( true, false, 0, 45 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local border = LUI.UIImage.new()
	border:setLeftRight( false, false, -20, 20 )
	border:setTopBottom( false, false, -12.5, 12.5 )
	border:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
	self:addElement( border )
	self.border = border
	
	local imagebg = LUI.UIImage.new()
	imagebg:setLeftRight( false, false, -18, 18 )
	imagebg:setTopBottom( false, false, -10.5, 10.5 )
	imagebg:setRGB( 0.18, 0.18, 0.18 )
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
	downarrow:setTopBottom( false, false, 12.5, 22.5 )
	downarrow:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_arrow" ) )
	downarrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( downarrow )
	self.downarrow = downarrow
	
	self.icon:linkToElementModel( self, "icon", true, function ( model )
		local _icon = Engine.GetModelValue( model )
		if _icon then
			icon:setImage( RegisterImage( _icon ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
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
			end,
			Focus = function ()
				self:setupElementClipCounter( 3 )
				border:completeAnimation()
				self.border:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
				self.clipFinished( border, {} )
				uparrow:completeAnimation()
				self.uparrow:setAlpha( 1 )
				self.clipFinished( uparrow, {} )
				downarrow:completeAnimation()
				self.downarrow:setAlpha( 1 )
				self.clipFinished( downarrow, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				border:completeAnimation()
				self.border:setAlpha( 0 )
				self.clipFinished( border, {} )
				icon:completeAnimation()
				self.icon:setRGB( ColorSet.Disabled.r, ColorSet.Disabled.g, ColorSet.Disabled.b )
				self.clipFinished( icon, {} )
			end
		},
		ShowOnlyUpArrow = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
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
			end,
			Focus = function ()
				self:setupElementClipCounter( 3 )
				border:completeAnimation()
				self.border:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
				self.clipFinished( border, {} )
				uparrow:completeAnimation()
				self.uparrow:setAlpha( 1 )
				self.clipFinished( uparrow, {} )
				downarrow:completeAnimation()
				self.downarrow:setAlpha( 0 )
				self.clipFinished( downarrow, {} )
			end
		},
		ShowOnlyDownArrow = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
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
			end,
			Focus = function ()
				self:setupElementClipCounter( 3 )
				border:completeAnimation()
				self.border:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
				self.clipFinished( border, {} )
				uparrow:completeAnimation()
				self.uparrow:setAlpha( 0 )
				self.clipFinished( uparrow, {} )
				downarrow:completeAnimation()
				self.downarrow:setAlpha( 1 )
				self.clipFinished( downarrow, {} )
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
				return IsGlobalModelValueEqualToEnum( element, controller, "demo.currentLightmanMarkerLightMode", Enum.demoLightmanLightMode.DEMO_LIGHTMAN_LIGHT_MODE_SPOT )
			end
		},
		{
			stateName = "ShowOnlyDownArrow",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualToEnum( element, controller, "demo.currentLightmanMarkerLightMode", Enum.demoLightmanLightMode.DEMO_LIGHTMAN_LIGHT_MODE_OMNI )
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
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "demo.currentLightmanMarkerLightMode" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "demo.currentLightmanMarkerLightMode"
		} )
	end )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_UP, nil, function ( element, menu, controller, model )
		UpdateLightmanLightMode( controller, "prev" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_UP, "" )
		return false
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_DOWN, nil, function ( element, menu, controller, model )
		UpdateLightmanLightMode( controller, "next" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_DOWN, "" )
		return false
	end, false )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.icon:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

