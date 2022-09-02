-- 39b8ab377c594ee580e91933a1c8d0ea
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Theater.Theater_FocusBar" )

CoD.DemoControlsButtonTimeScale = InheritFrom( LUI.UIElement )
CoD.DemoControlsButtonTimeScale.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.DemoControlsButtonTimeScale )
	self.id = "DemoControlsButtonTimeScale"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 59 )
	self:setTopBottom( true, false, 0, 45 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local whitebox = LUI.UIImage.new()
	whitebox:setLeftRight( true, false, 22, 56 )
	whitebox:setTopBottom( true, false, 11.5, 35 )
	whitebox:setAlpha( 0 )
	self:addElement( whitebox )
	self.whitebox = whitebox
	
	local x = LUI.UIText.new()
	x:setLeftRight( false, false, -9.5, 8.5 )
	x:setTopBottom( false, false, -12, 10 )
	x:setText( Engine.Localize( "x" ) )
	x:setTTF( "fonts/default.ttf" )
	x:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	x:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( x )
	self.x = x
	
	local timescale = LUI.UIText.new()
	timescale:setLeftRight( false, false, 0.5, 27.5 )
	timescale:setTopBottom( false, false, -12.5, 12.5 )
	timescale:setScale( 0.9 )
	timescale:setTTF( "fonts/default.ttf" )
	timescale:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	timescale:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	timescale:subscribeToGlobalModel( controller, "Demo", "timeScale", function ( model )
		local timeScale = Engine.GetModelValue( model )
		if timeScale then
			timescale:setText( Engine.Localize( DemoGetTimeScaleString( timeScale ) ) )
		end
	end )
	self:addElement( timescale )
	self.timescale = timescale
	
	local uparrow = LUI.UIImage.new()
	uparrow:setLeftRight( false, false, 1.5, 17.5 )
	uparrow:setTopBottom( false, false, -23, -11 )
	uparrow:setZRot( 180 )
	uparrow:setScale( 0.8 )
	uparrow:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_arrow" ) )
	uparrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( uparrow )
	self.uparrow = uparrow
	
	local downarrow = LUI.UIImage.new()
	downarrow:setLeftRight( false, false, 1.5, 17.5 )
	downarrow:setTopBottom( false, false, 13, 23 )
	downarrow:setScale( 0.8 )
	downarrow:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_arrow" ) )
	downarrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( downarrow )
	self.downarrow = downarrow
	
	local TheaterFocusBarT = CoD.Theater_FocusBar.new( menu, controller )
	TheaterFocusBarT:setLeftRight( false, false, -10.5, 29.5 )
	TheaterFocusBarT:setTopBottom( false, false, -15.5, -7.5 )
	TheaterFocusBarT:setAlpha( 0 )
	TheaterFocusBarT:setScale( 0.9 )
	self:addElement( TheaterFocusBarT )
	self.TheaterFocusBarT = TheaterFocusBarT
	
	local TheaterFocusBarB = CoD.Theater_FocusBar.new( menu, controller )
	TheaterFocusBarB:setLeftRight( false, false, -10.5, 29.5 )
	TheaterFocusBarB:setTopBottom( false, false, 8.5, 16.5 )
	TheaterFocusBarB:setAlpha( 0 )
	TheaterFocusBarB:setXRot( 180 )
	TheaterFocusBarB:setScale( 0.9 )
	self:addElement( TheaterFocusBarB )
	self.TheaterFocusBarB = TheaterFocusBarB
	
	local dotend0 = LUI.UIImage.new()
	dotend0:setLeftRight( false, false, -38, -11 )
	dotend0:setTopBottom( false, false, -2.5, 0 )
	dotend0:setZRot( 90 )
	dotend0:setImage( RegisterImage( "uie_t7_menu_cp_datavault_bookmark_center" ) )
	self:addElement( dotend0 )
	self.dotend0 = dotend0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				whitebox:completeAnimation()
				self.whitebox:setAlpha( 0 )
				self.clipFinished( whitebox, {} )

				x:completeAnimation()
				self.x:setAlpha( 1 )
				self.clipFinished( x, {} )

				timescale:completeAnimation()
				self.timescale:setRGB( 1, 1, 1 )
				self.timescale:setAlpha( 1 )
				self.clipFinished( timescale, {} )

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
			end,
			Focus = function ()
				self:setupElementClipCounter( 7 )

				whitebox:completeAnimation()
				self.whitebox:setLeftRight( true, false, 22, 56 )
				self.whitebox:setTopBottom( true, false, 11.5, 35 )
				self.whitebox:setAlpha( 0.15 )
				self.clipFinished( whitebox, {} )

				x:completeAnimation()
				self.x:setAlpha( 1 )
				self.clipFinished( x, {} )

				timescale:completeAnimation()
				self.timescale:setAlpha( 1 )
				self.clipFinished( timescale, {} )

				uparrow:completeAnimation()
				self.uparrow:setLeftRight( false, false, 1.5, 17.5 )
				self.uparrow:setTopBottom( false, false, -23, -11 )
				self.uparrow:setAlpha( 1 )
				self.clipFinished( uparrow, {} )

				downarrow:completeAnimation()
				self.downarrow:setLeftRight( false, false, 1.5, 17.5 )
				self.downarrow:setTopBottom( false, false, 13, 23 )
				self.downarrow:setAlpha( 1 )
				self.clipFinished( downarrow, {} )

				TheaterFocusBarT:completeAnimation()
				self.TheaterFocusBarT:setAlpha( 1 )
				self.clipFinished( TheaterFocusBarT, {} )

				TheaterFocusBarB:completeAnimation()
				self.TheaterFocusBarB:setAlpha( 1 )
				self.clipFinished( TheaterFocusBarB, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				x:completeAnimation()
				self.x:setRGB( 0.7, 0.7, 0.7 )
				self.clipFinished( x, {} )

				timescale:completeAnimation()
				self.timescale:setRGB( 0.7, 0.7, 0.7 )
				self.clipFinished( timescale, {} )

				uparrow:completeAnimation()
				self.uparrow:setAlpha( 0 )
				self.clipFinished( uparrow, {} )

				downarrow:completeAnimation()
				self.downarrow:setAlpha( 0 )
				self.clipFinished( downarrow, {} )
			end
		},
		ShowOnlyUpArrow = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				whitebox:completeAnimation()
				self.whitebox:setAlpha( 0 )
				self.clipFinished( whitebox, {} )

				x:completeAnimation()
				self.x:setAlpha( 1 )
				self.clipFinished( x, {} )

				timescale:completeAnimation()
				self.timescale:setRGB( 1, 1, 1 )
				self.timescale:setAlpha( 1 )
				self.clipFinished( timescale, {} )

				uparrow:completeAnimation()
				self.uparrow:setAlpha( 0 )
				self.clipFinished( uparrow, {} )

				downarrow:completeAnimation()
				self.downarrow:setAlpha( 0 )
				self.clipFinished( downarrow, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 7 )

				whitebox:completeAnimation()
				self.whitebox:setAlpha( 0.15 )
				self.clipFinished( whitebox, {} )

				x:completeAnimation()
				self.x:setAlpha( 1 )
				self.clipFinished( x, {} )

				timescale:completeAnimation()
				self.timescale:setAlpha( 1 )
				self.clipFinished( timescale, {} )

				uparrow:completeAnimation()
				self.uparrow:setLeftRight( false, false, 1.5, 17.5 )
				self.uparrow:setTopBottom( false, false, -23, -11 )
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
			end
		},
		ShowOnlyDownArrow = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				whitebox:completeAnimation()
				self.whitebox:setAlpha( 0 )
				self.clipFinished( whitebox, {} )

				x:completeAnimation()
				self.x:setAlpha( 1 )
				self.clipFinished( x, {} )

				timescale:completeAnimation()
				self.timescale:setRGB( 1, 1, 1 )
				self.timescale:setAlpha( 1 )
				self.clipFinished( timescale, {} )

				uparrow:completeAnimation()
				self.uparrow:setAlpha( 0 )
				self.clipFinished( uparrow, {} )

				downarrow:completeAnimation()
				self.downarrow:setAlpha( 0 )
				self.clipFinished( downarrow, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 7 )

				whitebox:completeAnimation()
				self.whitebox:setAlpha( 0.15 )
				self.clipFinished( whitebox, {} )

				x:completeAnimation()
				self.x:setAlpha( 1 )
				self.clipFinished( x, {} )

				timescale:completeAnimation()
				self.timescale:setAlpha( 1 )
				self.clipFinished( timescale, {} )

				uparrow:completeAnimation()
				self.uparrow:setLeftRight( false, false, 1.5, 17.5 )
				self.uparrow:setTopBottom( false, false, -23, -11 )
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
				return not IsGlobalModelValueGreaterThan( controller, "demo.timescale", 0.19 )
			end
		},
		{
			stateName = "ShowOnlyDownArrow",
			condition = function ( menu, element, event )
				return IsGlobalModelValueGreaterThan( controller, "demo.timescale", 5.91 )
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
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "demo.timescale" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "demo.timescale"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "demo.contextMode" ), function ( model )
		local f15_local0 = self
		local f15_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "demo.contextMode"
		}
		CoD.Menu.UpdateButtonShownState( f15_local0, menu, controller, Enum.LUIButton.LUI_KEY_UP )
		CoD.Menu.UpdateButtonShownState( f15_local0, menu, controller, Enum.LUIButton.LUI_KEY_DOWN )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "demo.editingDollyCameraMarker" ), function ( model )
		local f16_local0 = self
		local f16_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "demo.editingDollyCameraMarker"
		}
		CoD.Menu.UpdateButtonShownState( f16_local0, menu, controller, Enum.LUIButton.LUI_KEY_UP )
		CoD.Menu.UpdateButtonShownState( f16_local0, menu, controller, Enum.LUIButton.LUI_KEY_DOWN )
	end )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_UP, nil, function ( f17_arg0, f17_arg1, f17_arg2, f17_arg3 )
		if not IsDemoContextPlaybackMode() and not IsGlobalModelValueTrue( f17_arg0, f17_arg2, "demo.editingDollyCameraMarker" ) then
			UpdateDemoTimeScale( f17_arg2, "0.1" )
			return true
		elseif IsDemoContextDirectorMode() and IsGlobalModelValueTrue( f17_arg0, f17_arg2, "demo.editingDollyCameraMarker" ) then
			UpdateDollyCameraTimeScale( f17_arg2, "0.1" )
			return true
		else
			
		end
	end, function ( f18_arg0, f18_arg1, f18_arg2 )
		if not IsDemoContextPlaybackMode() and not IsGlobalModelValueTrue( f18_arg0, f18_arg2, "demo.editingDollyCameraMarker" ) then
			CoD.Menu.SetButtonLabel( f18_arg1, Enum.LUIButton.LUI_KEY_UP, "" )
			return false
		elseif IsDemoContextDirectorMode() and IsGlobalModelValueTrue( f18_arg0, f18_arg2, "demo.editingDollyCameraMarker" ) then
			CoD.Menu.SetButtonLabel( f18_arg1, Enum.LUIButton.LUI_KEY_UP, "" )
			return false
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_DOWN, nil, function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3 )
		if not IsDemoContextPlaybackMode() and not IsGlobalModelValueTrue( f19_arg0, f19_arg2, "demo.editingDollyCameraMarker" ) then
			UpdateDemoTimeScale( f19_arg2, "-0.1" )
			return true
		elseif IsDemoContextDirectorMode() and IsGlobalModelValueTrue( f19_arg0, f19_arg2, "demo.editingDollyCameraMarker" ) then
			UpdateDollyCameraTimeScale( f19_arg2, "-0.1" )
			return true
		else
			
		end
	end, function ( f20_arg0, f20_arg1, f20_arg2 )
		if not IsDemoContextPlaybackMode() and not IsGlobalModelValueTrue( f20_arg0, f20_arg2, "demo.editingDollyCameraMarker" ) then
			CoD.Menu.SetButtonLabel( f20_arg1, Enum.LUIButton.LUI_KEY_DOWN, "" )
			return false
		elseif IsDemoContextDirectorMode() and IsGlobalModelValueTrue( f20_arg0, f20_arg2, "demo.editingDollyCameraMarker" ) then
			CoD.Menu.SetButtonLabel( f20_arg1, Enum.LUIButton.LUI_KEY_DOWN, "" )
			return false
		else
			return false
		end
	end, false )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.TheaterFocusBarT:close()
		element.TheaterFocusBarB:close()
		element.timescale:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

