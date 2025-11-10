CoD.DemoControlsButtonDollyCameraTimeScale = InheritFrom( LUI.UIElement )
CoD.DemoControlsButtonDollyCameraTimeScale.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.DemoControlsButtonDollyCameraTimeScale )
	self.id = "DemoControlsButtonDollyCameraTimeScale"
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
	
	local x = LUI.UIText.new()
	x:setLeftRight( false, false, -20, -2 )
	x:setTopBottom( false, false, -12.5, 12.5 )
	x:setText( Engine.Localize( "x" ) )
	x:setTTF( "fonts/default.ttf" )
	x:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	x:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( x )
	self.x = x
	
	local timescale = LUI.UIText.new()
	timescale:setLeftRight( false, false, -9, 18 )
	timescale:setTopBottom( false, false, -12.5, 12.5 )
	timescale:setTTF( "fonts/default.ttf" )
	timescale:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	timescale:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	timescale:subscribeToGlobalModel( controller, "Demo", "currentDollyCamMarkerTimeScaleValue", function ( model )
		local currentDollyCamMarkerTimeScaleValue = Engine.GetModelValue( model )
		if currentDollyCamMarkerTimeScaleValue then
			timescale:setText( Engine.Localize( DemoGetCurrentDollyCameraTimeScaleString( currentDollyCamMarkerTimeScaleValue ) ) )
		end
	end )
	self:addElement( timescale )
	self.timescale = timescale
	
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
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				border:completeAnimation()
				self.border:setRGB( ColorSet.BadgeText.r, ColorSet.BadgeText.g, ColorSet.BadgeText.b )
				self.clipFinished( border, {} )
				timescale:completeAnimation()
				self.timescale:setRGB( 1, 1, 1 )
				self.clipFinished( timescale, {} )
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
				self:setupElementClipCounter( 4 )
				border:completeAnimation()
				self.border:setAlpha( 0 )
				self.clipFinished( border, {} )
				timescale:completeAnimation()
				self.timescale:setRGB( ColorSet.Disabled.r, ColorSet.Disabled.g, ColorSet.Disabled.b )
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
				self:setupElementClipCounter( 4 )
				border:completeAnimation()
				self.border:setRGB( ColorSet.BadgeText.r, ColorSet.BadgeText.g, ColorSet.BadgeText.b )
				self.clipFinished( border, {} )
				timescale:completeAnimation()
				self.timescale:setRGB( 1, 1, 1 )
				self.clipFinished( timescale, {} )
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
				timescale:completeAnimation()
				self.timescale:setRGB( 1, 1, 1 )
				self.clipFinished( timescale, {} )
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
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_UP, nil, function ( element, menu, controller, model )
		if not IsDemoContextPlaybackMode() and not IsGlobalModelValueTrue( element, controller, "demo.editingDollyCameraMarker" ) then
			UpdateDemoTimeScale( controller, "0.1" )
			return true
		elseif IsDemoContextDirectorMode() and IsGlobalModelValueTrue( element, controller, "demo.editingDollyCameraMarker" ) then
			UpdateDollyCameraTimeScale( controller, "0.1" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_UP, "" )
		if not IsDemoContextPlaybackMode() and not IsGlobalModelValueTrue( element, controller, "demo.editingDollyCameraMarker" ) then
			return false
		elseif IsDemoContextDirectorMode() and IsGlobalModelValueTrue( element, controller, "demo.editingDollyCameraMarker" ) then
			return false
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_DOWN, nil, function ( element, menu, controller, model )
		if not IsDemoContextPlaybackMode() and not IsGlobalModelValueTrue( element, controller, "demo.editingDollyCameraMarker" ) then
			UpdateDemoTimeScale( controller, "-0.1" )
			return true
		elseif IsDemoContextDirectorMode() and IsGlobalModelValueTrue( element, controller, "demo.editingDollyCameraMarker" ) then
			UpdateDollyCameraTimeScale( controller, "-0.1" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_DOWN, "" )
		if not IsDemoContextPlaybackMode() and not IsGlobalModelValueTrue( element, controller, "demo.editingDollyCameraMarker" ) then
			return false
		elseif IsDemoContextDirectorMode() and IsGlobalModelValueTrue( element, controller, "demo.editingDollyCameraMarker" ) then
			return false
		else
			return false
		end
	end, false )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.timescale:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

