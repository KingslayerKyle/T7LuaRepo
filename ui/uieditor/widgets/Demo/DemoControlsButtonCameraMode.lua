-- 119b68e23f40ff96740c03d815c13bb4
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Theater.Theater_FocusBar" )

local PostLoadFunc = function ( self, controller, menu )
	self.mode:subscribeToGlobalModel( controller, "Demo", "cameraMode", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			local f2_local1 = "MP_UNKNOWN"
			if modelValue == Enum.demoCameraMode.DEMO_CAMERA_MODE_NONE then
				f2_local1 = "DEMO_CAMERA_MODE_FIRST"
			elseif modelValue == Enum.demoCameraMode.DEMO_CAMERA_MODE_THIRDPERSON then
				f2_local1 = "DEMO_CAMERA_MODE_THIRD"
			elseif modelValue == Enum.demoCameraMode.DEMO_CAMERA_MODE_FREECAM then
				f2_local1 = "DEMO_CAMERA_MODE_FREE"
			end
			self.mode:setText( Engine.Localize( f2_local1 ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.mode:close()
	end )
end

CoD.DemoControlsButtonCameraMode = InheritFrom( LUI.UIElement )
CoD.DemoControlsButtonCameraMode.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.DemoControlsButtonCameraMode )
	self.id = "DemoControlsButtonCameraMode"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 80 )
	self:setTopBottom( true, false, 0, 45 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local icon = LUI.UIImage.new()
	icon:setLeftRight( false, false, -28, -8 )
	icon:setTopBottom( false, false, -10, 10 )
	self:addElement( icon )
	self.icon = icon
	
	local mode = LUI.UIText.new()
	mode:setLeftRight( false, false, -1, 34 )
	mode:setTopBottom( false, false, -12.5, 12.5 )
	mode:setScale( 0.9 )
	mode:setText( Engine.Localize( "DEMO_CAMERA_MODE_FREE" ) )
	mode:setTTF( "fonts/default.ttf" )
	mode:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	mode:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( mode )
	self.mode = mode
	
	local uparrow = LUI.UIImage.new()
	uparrow:setLeftRight( false, false, -8, 8 )
	uparrow:setTopBottom( false, false, -23, -11 )
	uparrow:setZRot( 180 )
	uparrow:setScale( 0.8 )
	uparrow:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_arrow" ) )
	uparrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( uparrow )
	self.uparrow = uparrow
	
	local downarrow = LUI.UIImage.new()
	downarrow:setLeftRight( false, false, -8, 8 )
	downarrow:setTopBottom( false, false, 13, 23 )
	downarrow:setScale( 0.8 )
	downarrow:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_arrow" ) )
	downarrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( downarrow )
	self.downarrow = downarrow
	
	local TheaterFocusBarT = CoD.Theater_FocusBar.new( menu, controller )
	TheaterFocusBarT:setLeftRight( true, false, 0, 80 )
	TheaterFocusBarT:setTopBottom( true, false, 7, 15 )
	TheaterFocusBarT:setAlpha( 0 )
	TheaterFocusBarT:setScale( 0.9 )
	self:addElement( TheaterFocusBarT )
	self.TheaterFocusBarT = TheaterFocusBarT
	
	local TheaterFocusBarB = CoD.Theater_FocusBar.new( menu, controller )
	TheaterFocusBarB:setLeftRight( true, false, 0, 80 )
	TheaterFocusBarB:setTopBottom( true, false, 31, 39 )
	TheaterFocusBarB:setAlpha( 0 )
	TheaterFocusBarB:setXRot( 180 )
	TheaterFocusBarB:setScale( 0.9 )
	self:addElement( TheaterFocusBarB )
	self.TheaterFocusBarB = TheaterFocusBarB
	
	local whitebox = LUI.UIImage.new()
	whitebox:setLeftRight( true, false, 5, 75 )
	whitebox:setTopBottom( true, false, 11.5, 35 )
	whitebox:setAlpha( 0 )
	self:addElement( whitebox )
	self.whitebox = whitebox
	
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
				icon:completeAnimation()
				self.icon:setAlpha( 1 )
				self.icon:setYRot( 0 )
				self.clipFinished( icon, {} )
				mode:completeAnimation()
				self.mode:setAlpha( 1 )
				self.clipFinished( mode, {} )
				uparrow:completeAnimation()
				self.uparrow:setAlpha( 0 )
				self.clipFinished( uparrow, {} )
				downarrow:completeAnimation()
				self.downarrow:setAlpha( 0 )
				self.clipFinished( downarrow, {} )
				TheaterFocusBarT:completeAnimation()
				self.TheaterFocusBarT:setAlpha( 0 )
				self.clipFinished( TheaterFocusBarT, {} )
				TheaterFocusBarB:completeAnimation()
				self.TheaterFocusBarB:setAlpha( 0 )
				self.clipFinished( TheaterFocusBarB, {} )
				whitebox:completeAnimation()
				self.whitebox:setAlpha( 0 )
				self.clipFinished( whitebox, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 7 )
				icon:completeAnimation()
				self.icon:setAlpha( 1 )
				self.clipFinished( icon, {} )
				mode:completeAnimation()
				self.mode:setAlpha( 1 )
				self.clipFinished( mode, {} )
				uparrow:completeAnimation()
				self.uparrow:setLeftRight( false, false, -8, 8 )
				self.uparrow:setTopBottom( false, false, -23, -11 )
				self.uparrow:setAlpha( 1 )
				self.clipFinished( uparrow, {} )
				downarrow:completeAnimation()
				self.downarrow:setLeftRight( false, false, -8, 8 )
				self.downarrow:setTopBottom( false, false, 13, 23 )
				self.downarrow:setAlpha( 1 )
				self.clipFinished( downarrow, {} )
				TheaterFocusBarT:completeAnimation()
				self.TheaterFocusBarT:setAlpha( 1 )
				self.clipFinished( TheaterFocusBarT, {} )
				TheaterFocusBarB:completeAnimation()
				self.TheaterFocusBarB:setAlpha( 1 )
				self.clipFinished( TheaterFocusBarB, {} )
				whitebox:completeAnimation()
				self.whitebox:setLeftRight( true, false, 5, 75 )
				self.whitebox:setTopBottom( true, false, 11.5, 35 )
				self.whitebox:setAlpha( 0.15 )
				self.clipFinished( whitebox, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				icon:completeAnimation()
				self.icon:setRGB( 0.7, 0.7, 0.7 )
				self.clipFinished( icon, {} )
				mode:completeAnimation()
				self.mode:setRGB( 0.7, 0.7, 0.7 )
				self.clipFinished( mode, {} )
			end
		},
		ShowOnlyUpArrow = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				icon:completeAnimation()
				self.icon:setAlpha( 1 )
				self.icon:setYRot( 0 )
				self.clipFinished( icon, {} )
				mode:completeAnimation()
				self.mode:setAlpha( 1 )
				self.clipFinished( mode, {} )
				uparrow:completeAnimation()
				self.uparrow:setAlpha( 0 )
				self.clipFinished( uparrow, {} )
				downarrow:completeAnimation()
				self.downarrow:setAlpha( 0 )
				self.clipFinished( downarrow, {} )
				TheaterFocusBarT:completeAnimation()
				self.TheaterFocusBarT:setAlpha( 0 )
				self.clipFinished( TheaterFocusBarT, {} )
				TheaterFocusBarB:completeAnimation()
				self.TheaterFocusBarB:setAlpha( 0 )
				self.clipFinished( TheaterFocusBarB, {} )
				whitebox:completeAnimation()
				self.whitebox:setAlpha( 0 )
				self.clipFinished( whitebox, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 7 )
				icon:completeAnimation()
				self.icon:setAlpha( 1 )
				self.clipFinished( icon, {} )
				mode:completeAnimation()
				self.mode:setAlpha( 1 )
				self.clipFinished( mode, {} )
				uparrow:completeAnimation()
				self.uparrow:setAlpha( 1 )
				self.clipFinished( uparrow, {} )
				downarrow:completeAnimation()
				self.downarrow:setAlpha( 0 )
				self.clipFinished( downarrow, {} )
				TheaterFocusBarT:completeAnimation()
				self.TheaterFocusBarT:setAlpha( 1 )
				self.clipFinished( TheaterFocusBarT, {} )
				TheaterFocusBarB:completeAnimation()
				self.TheaterFocusBarB:setAlpha( 1 )
				self.clipFinished( TheaterFocusBarB, {} )
				whitebox:completeAnimation()
				self.whitebox:setAlpha( 0.15 )
				self.clipFinished( whitebox, {} )
			end
		},
		ShowOnlyDownArrow = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				icon:completeAnimation()
				self.icon:setAlpha( 1 )
				self.icon:setYRot( 0 )
				self.clipFinished( icon, {} )
				mode:completeAnimation()
				self.mode:setAlpha( 1 )
				self.clipFinished( mode, {} )
				uparrow:completeAnimation()
				self.uparrow:setAlpha( 0 )
				self.clipFinished( uparrow, {} )
				downarrow:completeAnimation()
				self.downarrow:setAlpha( 0 )
				self.clipFinished( downarrow, {} )
				TheaterFocusBarT:completeAnimation()
				self.TheaterFocusBarT:setAlpha( 0 )
				self.clipFinished( TheaterFocusBarT, {} )
				TheaterFocusBarB:completeAnimation()
				self.TheaterFocusBarB:setAlpha( 0 )
				self.clipFinished( TheaterFocusBarB, {} )
				whitebox:completeAnimation()
				self.whitebox:setAlpha( 0 )
				self.clipFinished( whitebox, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 7 )
				icon:completeAnimation()
				self.icon:setAlpha( 1 )
				self.clipFinished( icon, {} )
				mode:completeAnimation()
				self.mode:setAlpha( 1 )
				self.clipFinished( mode, {} )
				uparrow:completeAnimation()
				self.uparrow:setAlpha( 0 )
				self.clipFinished( uparrow, {} )
				downarrow:completeAnimation()
				self.downarrow:setAlpha( 1 )
				self.clipFinished( downarrow, {} )
				TheaterFocusBarT:completeAnimation()
				self.TheaterFocusBarT:setAlpha( 1 )
				self.clipFinished( TheaterFocusBarT, {} )
				TheaterFocusBarB:completeAnimation()
				self.TheaterFocusBarB:setAlpha( 1 )
				self.clipFinished( TheaterFocusBarB, {} )
				whitebox:completeAnimation()
				self.whitebox:setAlpha( 0.15 )
				self.clipFinished( whitebox, {} )
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
				return IsGlobalModelValueEqualToEnum( element, controller, "demo.cameraMode", Enum.demoCameraMode.DEMO_CAMERA_MODE_FREECAM )
			end
		},
		{
			stateName = "ShowOnlyDownArrow",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualToEnum( element, controller, "demo.cameraMode", Enum.demoCameraMode.DEMO_CAMERA_MODE_NONE )
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
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "demo.cameraMode" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "demo.cameraMode"
		} )
	end )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_UP, nil, function ( f18_arg0, f18_arg1, f18_arg2, f18_arg3 )
		UpdateDemoCameraMode( f18_arg2, "prev" )
		return true
	end, function ( f19_arg0, f19_arg1, f19_arg2 )
		CoD.Menu.SetButtonLabel( f19_arg1, Enum.LUIButton.LUI_KEY_UP, "" )
		return false
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_DOWN, nil, function ( f20_arg0, f20_arg1, f20_arg2, f20_arg3 )
		UpdateDemoCameraMode( f20_arg2, "next" )
		return true
	end, function ( f21_arg0, f21_arg1, f21_arg2 )
		CoD.Menu.SetButtonLabel( f21_arg1, Enum.LUIButton.LUI_KEY_DOWN, "" )
		return false
	end, false )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.TheaterFocusBarT:close()
		element.TheaterFocusBarB:close()
		element.icon:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

