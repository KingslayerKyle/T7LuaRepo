-- de3f5cd56e499e5d5ed617fad78c0953
-- This hash is used for caching, delete to decompile the file again

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3 )
	if not CoD.DemoUtility.GetEditingLightmanMarker() then
		return 
	else
		f1_arg0.value:setText( CoD.DemoUtility.GetRoundedLightFloatParam( Engine.GetModelValue( f1_arg3 ) ) )
	end
end

local PostLoadFunc = function ( self, controller, menu )
	self.value:linkToElementModel( self, "btnId", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			if modelValue == "lightmanlightintensity" then
				f0_local0( self, controller, modelValue, Engine.GetModel( Engine.GetGlobalModel(), "demo.currentLightmanMarkerLightIntensity" ) )
			elseif modelValue == "lightmanlightrange" then
				f0_local0( self, controller, modelValue, Engine.GetModel( Engine.GetGlobalModel(), "demo.currentLightmanMarkerLightRange" ) )
			end
		end
	end )
	self.value:subscribeToGlobalModel( controller, "Demo", "currentLightmanMarkerLightIntensity", function ( model )
		if self.btnId ~= "lightmanlightintensity" then
			return 
		else
			f0_local0( self, controller, self.btnId, model )
		end
	end )
	self.value:subscribeToGlobalModel( controller, "Demo", "currentLightmanMarkerLightRange", function ( model )
		if self.btnId ~= "lightmanlightrange" then
			return 
		else
			self.value:setText( CoD.DemoUtility.GetRoundedLightFloatParam( Engine.GetModelValue( model ) ) )
		end
	end )
end

CoD.DemoControlsButtonLightmanLightFloatParam = InheritFrom( LUI.UIElement )
CoD.DemoControlsButtonLightmanLightFloatParam.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.DemoControlsButtonLightmanLightFloatParam )
	self.id = "DemoControlsButtonLightmanLightFloatParam"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 80 )
	self:setTopBottom( true, false, 0, 45 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local border = LUI.UIImage.new()
	border:setLeftRight( false, false, -40, 40 )
	border:setTopBottom( false, false, -12.5, 12.5 )
	border:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
	self:addElement( border )
	self.border = border
	
	local imagebg = LUI.UIImage.new()
	imagebg:setLeftRight( false, false, -38, 38 )
	imagebg:setTopBottom( false, false, -10.5, 10.5 )
	imagebg:setRGB( 0.18, 0.18, 0.18 )
	self:addElement( imagebg )
	self.imagebg = imagebg
	
	local icon = LUI.UIImage.new()
	icon:setLeftRight( false, false, -30, -10 )
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
	
	local x = LUI.UIText.new()
	x:setLeftRight( false, false, -8, 10 )
	x:setTopBottom( false, false, -12.5, 12.5 )
	x:setText( Engine.Localize( "x" ) )
	x:setTTF( "fonts/default.ttf" )
	x:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	x:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( x )
	self.x = x
	
	local value = LUI.UIText.new()
	value:setLeftRight( false, false, 8, 35 )
	value:setTopBottom( false, false, -12.5, 12.5 )
	value:setText( Engine.Localize( "5.0" ) )
	value:setTTF( "fonts/default.ttf" )
	value:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	value:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( value )
	self.value = value
	
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
				return ReachedLowestLightmanFloatParamValue( element, controller )
			end
		},
		{
			stateName = "ShowOnlyDownArrow",
			condition = function ( menu, element, event )
				return ReachedHighestLightmanFloatParamValue( element, controller )
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
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_UP, nil, function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3 )
		UpdateLightmanFloatParam( f19_arg0, f19_arg2, "1" )
		return true
	end, function ( f20_arg0, f20_arg1, f20_arg2 )
		CoD.Menu.SetButtonLabel( f20_arg1, Enum.LUIButton.LUI_KEY_UP, "" )
		return false
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_DOWN, nil, function ( f21_arg0, f21_arg1, f21_arg2, f21_arg3 )
		UpdateLightmanFloatParam( f21_arg0, f21_arg2, "-1" )
		return true
	end, function ( f22_arg0, f22_arg1, f22_arg2 )
		CoD.Menu.SetButtonLabel( f22_arg1, Enum.LUIButton.LUI_KEY_DOWN, "" )
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
