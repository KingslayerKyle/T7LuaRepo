require( "ui.uieditor.menus.Demo.ChooseModeSidebar" )
require( "ui.uieditor.widgets.Demo.DemoPlaybackControls" )
require( "ui.uieditor.widgets.Demo.DemoContextPanel" )
require( "ui.uieditor.widgets.Demo.DemoPlaybackControlsButtonBar" )

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		self:processEvent( {
			name = "input_source_changed"
		} )
	end
end

CoD.Demo = InheritFrom( LUI.UIElement )
CoD.Demo.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Demo )
	self.id = "Demo"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local DemoPlaybackControls = CoD.DemoPlaybackControls.new( menu, controller )
	DemoPlaybackControls:setLeftRight( false, false, -247, 247 )
	DemoPlaybackControls:setTopBottom( false, true, -139, -48 )
	self:addElement( DemoPlaybackControls )
	self.DemoPlaybackControls = DemoPlaybackControls
	
	local DemoContextPanel = CoD.DemoContextPanel.new( menu, controller )
	DemoContextPanel:setLeftRight( false, true, -329, -29 )
	DemoContextPanel:setTopBottom( true, false, 18, 78 )
	DemoContextPanel:setYRot( -20 )
	self:addElement( DemoContextPanel )
	self.DemoContextPanel = DemoContextPanel
	
	local DemoPlaybackControlsButtonBar = CoD.DemoPlaybackControlsButtonBar.new( menu, controller )
	DemoPlaybackControlsButtonBar:setLeftRight( false, false, -700, 658 )
	DemoPlaybackControlsButtonBar:setTopBottom( false, true, -32, 0 )
	DemoPlaybackControlsButtonBar:registerEventHandler( "menu_loaded", function ( element, event )
		local f3_local0 = nil
		SizeToSafeArea( element, controller )
		if not f3_local0 then
			f3_local0 = element:dispatchEventToChildren( event )
		end
		return f3_local0
	end )
	self:addElement( DemoPlaybackControlsButtonBar )
	self.DemoPlaybackControlsButtonBar = DemoPlaybackControlsButtonBar
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				DemoPlaybackControls:completeAnimation()
				self.DemoPlaybackControls:setAlpha( 1 )
				self.clipFinished( DemoPlaybackControls, {} )
				DemoContextPanel:completeAnimation()
				self.DemoContextPanel:setAlpha( 1 )
				self.clipFinished( DemoContextPanel, {} )
				DemoPlaybackControlsButtonBar:completeAnimation()
				self.DemoPlaybackControlsButtonBar:setAlpha( 1 )
				self.clipFinished( DemoPlaybackControlsButtonBar, {} )
			end
		},
		HideControls = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				DemoPlaybackControls:completeAnimation()
				self.DemoPlaybackControls:setAlpha( 0 )
				self.clipFinished( DemoPlaybackControls, {} )
				DemoContextPanel:completeAnimation()
				self.DemoContextPanel:setAlpha( 0 )
				self.clipFinished( DemoContextPanel, {} )
				DemoPlaybackControlsButtonBar:completeAnimation()
				self.DemoPlaybackControlsButtonBar:setAlpha( 0 )
				self.clipFinished( DemoPlaybackControlsButtonBar, {} )
			end
		},
		InactiveControls = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				DemoPlaybackControls:completeAnimation()
				self.DemoPlaybackControls:setAlpha( 0.4 )
				self.clipFinished( DemoPlaybackControls, {} )
				DemoContextPanel:completeAnimation()
				self.DemoContextPanel:setAlpha( 0.3 )
				self.clipFinished( DemoContextPanel, {} )
				DemoPlaybackControlsButtonBar:completeAnimation()
				self.DemoPlaybackControlsButtonBar:setAlpha( 0.3 )
				self.clipFinished( DemoPlaybackControlsButtonBar, {} )
			end
		},
		ClipPreview = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				DemoPlaybackControls:completeAnimation()
				self.DemoPlaybackControls:setAlpha( 0 )
				self.clipFinished( DemoPlaybackControls, {} )
				DemoContextPanel:completeAnimation()
				self.DemoContextPanel:setAlpha( 1 )
				self.clipFinished( DemoContextPanel, {} )
				DemoPlaybackControlsButtonBar:completeAnimation()
				self.DemoPlaybackControlsButtonBar:setAlpha( 0 )
				self.clipFinished( DemoPlaybackControlsButtonBar, {} )
			end
		},
		LightmanColorPicker = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				DemoPlaybackControls:completeAnimation()
				self.DemoPlaybackControls:setAlpha( 0.4 )
				self.clipFinished( DemoPlaybackControls, {} )
				DemoContextPanel:completeAnimation()
				self.DemoContextPanel:setAlpha( 1 )
				self.clipFinished( DemoContextPanel, {} )
				DemoPlaybackControlsButtonBar:completeAnimation()
				self.DemoPlaybackControlsButtonBar:setAlpha( 1 )
				self.clipFinished( DemoPlaybackControlsButtonBar, {} )
			end
		},
		CreatingHighlightReel = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				DemoPlaybackControls:completeAnimation()
				self.DemoPlaybackControls:setAlpha( 0 )
				self.clipFinished( DemoPlaybackControls, {} )
				DemoContextPanel:completeAnimation()
				self.DemoContextPanel:setAlpha( 1 )
				self.clipFinished( DemoContextPanel, {} )
				DemoPlaybackControlsButtonBar:completeAnimation()
				self.DemoPlaybackControlsButtonBar:setAlpha( 0 )
				self.clipFinished( DemoPlaybackControlsButtonBar, {} )
			end
		},
		InactiveControlsCopy = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				DemoPlaybackControls:completeAnimation()
				self.DemoPlaybackControls:setAlpha( 0.4 )
				self.clipFinished( DemoPlaybackControls, {} )
				DemoContextPanel:completeAnimation()
				self.DemoContextPanel:setAlpha( 0.3 )
				self.clipFinished( DemoContextPanel, {} )
				DemoPlaybackControlsButtonBar:completeAnimation()
				self.DemoPlaybackControlsButtonBar:setAlpha( 0.3 )
				self.clipFinished( DemoPlaybackControlsButtonBar, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "HideControls",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueTrue( element, controller, "demo.drawDemoControls" )
			end
		},
		{
			stateName = "InactiveControls",
			condition = function ( menu, element, event )
				return IsGlobalModelValueTrue( element, controller, "demo.drawDemoControls" ) and IsGlobalModelValueTrue( element, controller, "demo.showChooseModeSidebar" )
			end
		},
		{
			stateName = "ClipPreview",
			condition = function ( menu, element, event )
				return IsDemoClipPreviewRunning()
			end
		},
		{
			stateName = "LightmanColorPicker",
			condition = function ( menu, element, event )
				return IsGlobalModelValueTrue( element, controller, "demo.drawDemoControls" ) and IsInLightmanColorPicker( controller )
			end
		},
		{
			stateName = "CreatingHighlightReel",
			condition = function ( menu, element, event )
				return IsDemoCreatingHighlightReel()
			end
		},
		{
			stateName = "InactiveControlsCopy",
			condition = function ( menu, element, event )
				return IsGlobalModelValueTrue( element, controller, "demo.drawDemoControls" ) and IsGlobalModelValueTrue( element, controller, "demo.showOptionsSidebar" )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "demo.drawDemoControls" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "demo.drawDemoControls"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "demo.showChooseModeSidebar" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "demo.showChooseModeSidebar"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "demo.clipState" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "demo.clipState"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "demo.showLightmanColorPicker" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "demo.showLightmanColorPicker"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "demo.editingLightmanMarker" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "demo.editingLightmanMarker"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "demo.isCreatingHighlightReel" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "demo.isCreatingHighlightReel"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "demo.showOptionsSidebar" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "demo.showOptionsSidebar"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "demo.contextMode" ), function ( model )
		local f24_local0 = self
		local f24_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "demo.contextMode"
		}
		CoD.Menu.UpdateButtonShownState( f24_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		CoD.Menu.UpdateButtonShownState( f24_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( f24_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
		CoD.Menu.UpdateButtonShownState( f24_local0, menu, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED )
		CoD.Menu.UpdateButtonShownState( f24_local0, menu, controller, Enum.LUIButton.LUI_KEY_LB )
		CoD.Menu.UpdateButtonShownState( f24_local0, menu, controller, Enum.LUIButton.LUI_KEY_RB )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "demo.clipState" ), function ( model )
		local f25_local0 = self
		local f25_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "demo.clipState"
		}
		CoD.Menu.UpdateButtonShownState( f25_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		CoD.Menu.UpdateButtonShownState( f25_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( f25_local0, menu, controller, Enum.LUIButton.LUI_KEY_LTRIG )
		CoD.Menu.UpdateButtonShownState( f25_local0, menu, controller, Enum.LUIButton.LUI_KEY_RTRIG )
		CoD.Menu.UpdateButtonShownState( f25_local0, menu, controller, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED )
		CoD.Menu.UpdateButtonShownState( f25_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
		CoD.Menu.UpdateButtonShownState( f25_local0, menu, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "demo.isCreatingHighlightReel" ), function ( model )
		local f26_local0 = self
		local f26_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "demo.isCreatingHighlightReel"
		}
		CoD.Menu.UpdateButtonShownState( f26_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		CoD.Menu.UpdateButtonShownState( f26_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( f26_local0, menu, controller, Enum.LUIButton.LUI_KEY_LTRIG )
		CoD.Menu.UpdateButtonShownState( f26_local0, menu, controller, Enum.LUIButton.LUI_KEY_RTRIG )
		CoD.Menu.UpdateButtonShownState( f26_local0, menu, controller, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED )
		CoD.Menu.UpdateButtonShownState( f26_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
		CoD.Menu.UpdateButtonShownState( f26_local0, menu, controller, Enum.LUIButton.LUI_KEY_LB )
		CoD.Menu.UpdateButtonShownState( f26_local0, menu, controller, Enum.LUIButton.LUI_KEY_RB )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "demo.isCapturingScreenshot" ), function ( model )
		local f27_local0 = self
		local f27_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "demo.isCapturingScreenshot"
		}
		CoD.Menu.UpdateButtonShownState( f27_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		CoD.Menu.UpdateButtonShownState( f27_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( f27_local0, menu, controller, Enum.LUIButton.LUI_KEY_LTRIG )
		CoD.Menu.UpdateButtonShownState( f27_local0, menu, controller, Enum.LUIButton.LUI_KEY_RTRIG )
		CoD.Menu.UpdateButtonShownState( f27_local0, menu, controller, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED )
		CoD.Menu.UpdateButtonShownState( f27_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
		CoD.Menu.UpdateButtonShownState( f27_local0, menu, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED )
		CoD.Menu.UpdateButtonShownState( f27_local0, menu, controller, Enum.LUIButton.LUI_KEY_LB )
		CoD.Menu.UpdateButtonShownState( f27_local0, menu, controller, Enum.LUIButton.LUI_KEY_RB )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "demo.highlightedDollyCamMarker" ), function ( model )
		local f28_local0 = self
		local f28_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "demo.highlightedDollyCamMarker"
		}
		CoD.Menu.UpdateButtonShownState( f28_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( f28_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
		CoD.Menu.UpdateButtonShownState( f28_local0, menu, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "demo.editingDollyCameraMarker" ), function ( model )
		local f29_local0 = self
		local f29_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "demo.editingDollyCameraMarker"
		}
		CoD.Menu.UpdateButtonShownState( f29_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( f29_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
		CoD.Menu.UpdateButtonShownState( f29_local0, menu, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "demo.uploadPopupOpen" ), function ( model )
		local f30_local0 = self
		local f30_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "demo.uploadPopupOpen"
		}
		CoD.Menu.UpdateButtonShownState( f30_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "demo.highlightedLightmanMarker" ), function ( model )
		local f31_local0 = self
		local f31_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "demo.highlightedLightmanMarker"
		}
		CoD.Menu.UpdateButtonShownState( f31_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
		CoD.Menu.UpdateButtonShownState( f31_local0, menu, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "demo.editingLightmanMarker" ), function ( model )
		local f32_local0 = self
		local f32_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "demo.editingLightmanMarker"
		}
		CoD.Menu.UpdateButtonShownState( f32_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
		CoD.Menu.UpdateButtonShownState( f32_local0, menu, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "demo.isRecordingDollyCameraPath" ), function ( model )
		local f33_local0 = self
		local f33_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "demo.isRecordingDollyCameraPath"
		}
		CoD.Menu.UpdateButtonShownState( f33_local0, menu, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "demo.isRepositioningDollyCamMarker" ), function ( model )
		local f34_local0 = self
		local f34_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "demo.isRepositioningDollyCamMarker"
		}
		CoD.Menu.UpdateButtonShownState( f34_local0, menu, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED )
		CoD.Menu.UpdateButtonShownState( f34_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "demo.isFreeCameraLockedOnEntity" ), function ( model )
		local f35_local0 = self
		local f35_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "demo.isFreeCameraLockedOnEntity"
		}
		CoD.Menu.UpdateButtonShownState( f35_local0, menu, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "demo.highlightedFreeCameraLockOnEntity" ), function ( model )
		local f36_local0 = self
		local f36_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "demo.highlightedFreeCameraLockOnEntity"
		}
		CoD.Menu.UpdateButtonShownState( f36_local0, menu, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "demo.isFreeCameraLockedOnEntityActive" ), function ( model )
		local f37_local0 = self
		local f37_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "demo.isFreeCameraLockedOnEntityActive"
		}
		CoD.Menu.UpdateButtonShownState( f37_local0, menu, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "demo.isRepositioningLightmanMarker" ), function ( model )
		local f38_local0 = self
		local f38_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "demo.isRepositioningLightmanMarker"
		}
		CoD.Menu.UpdateButtonShownState( f38_local0, menu, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED )
		CoD.Menu.UpdateButtonShownState( f38_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "demo.showLightmanColorPicker" ), function ( model )
		local f39_local0 = self
		local f39_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "demo.showLightmanColorPicker"
		}
		CoD.Menu.UpdateButtonShownState( f39_local0, menu, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "demo.cameraMode" ), function ( model )
		local f40_local0 = self
		local f40_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "demo.cameraMode"
		}
		CoD.Menu.UpdateButtonShownState( f40_local0, menu, controller, Enum.LUIButton.LUI_KEY_LB )
		CoD.Menu.UpdateButtonShownState( f40_local0, menu, controller, Enum.LUIButton.LUI_KEY_RB )
	end )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "X", function ( element, menu, controller, model )
		if IsDemoContextBasicOrHighlightReelMode() and not IsDemoClipPreviewRunning() and not IsDemoCreatingHighlightReel() and not IsDemoCapturingScreenshot() then
			UpdateDemoCameraMode( controller, "cycle" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsDemoContextBasicOrHighlightReelMode() and not IsDemoClipPreviewRunning() and not IsDemoCreatingHighlightReel() and not IsDemoCapturingScreenshot() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "" )
			return false
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "M", function ( element, menu, controller, model )
		if not IsDemoContextPlaybackMode() and not IsEditingDollyCameraMarker( controller ) and not IsDemoClipPreviewRunning() and not IsDemoRestrictedBasicMode() and not IsDemoCreatingHighlightReel() and not IsDemoCapturingScreenshot() and not IsGlobalModelValueTrue( element, controller, "demo.uploadPopupOpen" ) and not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			SetGlobalModelValueTrue( "demo.showChooseModeSidebar" )
			OpenPopupWithPriority( self, "ChooseModeSidebar", controller, 100 )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsDemoContextPlaybackMode() and not IsEditingDollyCameraMarker( controller ) and not IsDemoClipPreviewRunning() and not IsDemoRestrictedBasicMode() and not IsDemoCreatingHighlightReel() and not IsDemoCapturingScreenshot() and not IsGlobalModelValueTrue( element, controller, "demo.uploadPopupOpen" ) and not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "" )
			return false
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LTRIG, "Q", function ( element, menu, controller, model )
		if not IsDemoClipPreviewRunning() and not IsDemoCreatingHighlightReel() and not IsDemoCapturingScreenshot() then
			DemoJumpBack( controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsDemoClipPreviewRunning() and not IsDemoCreatingHighlightReel() and not IsDemoCapturingScreenshot() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LTRIG, "" )
			return false
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RTRIG, "E", function ( element, menu, controller, model )
		if not IsDemoClipPreviewRunning() and not IsDemoCreatingHighlightReel() and not IsDemoCapturingScreenshot() and not IsRepeatButtonPress( model ) then
			UpdateDemoFastForward( controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsDemoClipPreviewRunning() and not IsDemoCreatingHighlightReel() and not IsDemoCapturingScreenshot() and not IsRepeatButtonPress( nil ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RTRIG, "" )
			return false
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED, "T", function ( element, menu, controller, model )
		if not IsDemoClipPreviewRunning() and not IsDemoCreatingHighlightReel() and not IsDemoCapturingScreenshot() then
			DemoToggleDemoHud( controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsDemoClipPreviewRunning() and not IsDemoCreatingHighlightReel() and not IsDemoCapturingScreenshot() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED, "" )
			return false
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "H", function ( element, menu, controller, model )
		if not IsDemoContextPlaybackMode() and not IsEditingDollyCameraMarker( controller ) and not IsEditingLightmanMarker( controller ) and not IsDemoClipPreviewRunning() and not IsDemoCreatingHighlightReel() and not IsDemoCapturingScreenshot() then
			DemoUpdatePlayPause( controller )
			return true
		elseif IsDemoContextDirectorMode() and IsEditingDollyCameraMarker( controller ) and IsRepositioningDollyCameraMarker( controller ) and not IsDemoClipPreviewRunning() and not IsDemoCapturingScreenshot() then
			DemoCancelPlaceDollyCameraMarker( controller )
			return true
		elseif IsDemoContextLighterMode() and IsEditingLightmanMarker( controller ) and IsRepositioningLightmanMarker( controller ) and not IsDemoClipPreviewRunning() and not IsDemoCapturingScreenshot() then
			DemoCancelPlaceLightmanMarker( controller )
			return true
		elseif IsDemoClipPreviewRunning() then
			DemoCancelPreview( controller )
			return true
		elseif IsDemoCreatingHighlightReel() then
			DemoCancelHighlightReelCreation( controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsDemoContextPlaybackMode() and not IsEditingDollyCameraMarker( controller ) and not IsEditingLightmanMarker( controller ) and not IsDemoClipPreviewRunning() and not IsDemoCreatingHighlightReel() and not IsDemoCapturingScreenshot() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
			return false
		elseif IsDemoContextDirectorMode() and IsEditingDollyCameraMarker( controller ) and IsRepositioningDollyCameraMarker( controller ) and not IsDemoClipPreviewRunning() and not IsDemoCapturingScreenshot() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
			return false
		elseif IsDemoContextLighterMode() and IsEditingLightmanMarker( controller ) and IsRepositioningLightmanMarker( controller ) and not IsDemoClipPreviewRunning() and not IsDemoCapturingScreenshot() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
			return false
		elseif IsDemoClipPreviewRunning() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
			return false
		elseif IsDemoCreatingHighlightReel() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
			return false
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "F", function ( element, menu, controller, model )
		if IsDemoContextDirectorMode() and ShouldStartAutoDollyCamera( controller ) and not IsDemoClipPreviewRunning() and not IsDemoCapturingScreenshot() then
			DemoStartAutoDollyCamera( controller )
			return true
		elseif IsDemoContextDirectorMode() and ShouldStopAutoDollyCamera( controller ) and not IsDemoClipPreviewRunning() and not IsDemoCapturingScreenshot() then
			DemoStopAutoDollyCamera( controller )
			return true
		elseif IsDemoContextDirectorMode() and ShouldAddDollyCameraMarker( controller ) and not IsDemoClipPreviewRunning() and not IsDemoCapturingScreenshot() then
			DemoAddDollyCameraMarker( controller )
			return true
		elseif IsDemoContextDirectorMode() and ShouldEditDollyCameraMarker( controller ) and not IsDemoClipPreviewRunning() and not IsDemoCapturingScreenshot() then
			DemoEditDollyCameraMarker( controller )
			return true
		elseif IsDemoContextDirectorMode() and IsEditingDollyCameraMarker( controller ) and not IsRepositioningDollyCameraMarker( controller ) and not IsDemoClipPreviewRunning() and not IsDemoCapturingScreenshot() then
			DemoExitEditDollyCameraMarker( controller )
			return true
		elseif IsDemoContextDirectorMode() and IsEditingDollyCameraMarker( controller ) and IsRepositioningDollyCameraMarker( controller ) and not IsDemoClipPreviewRunning() and not IsDemoCapturingScreenshot() then
			DemoPlaceDollyCameraMarker( controller )
			return true
		elseif IsDemoContextObjectLinkMode() and CanFreeCameraLockOnEntity( controller ) and not IsFreeCameraLockedOnEntity( controller ) and not IsDemoClipPreviewRunning() and not IsDemoCapturingScreenshot() then
			DemoFreeCameraLockOnObject( controller )
			return true
		elseif IsDemoContextObjectLinkMode() and IsFreeCameraLockedOnEntity( controller ) and not IsDemoClipPreviewRunning() and not IsDemoCapturingScreenshot() then
			DemoFreeCameraUnlockObject( controller )
			return true
		elseif IsDemoContextLighterMode() and ShouldAddLightmanMarker( controller ) and not IsDemoClipPreviewRunning() and not IsDemoCapturingScreenshot() then
			DemoAddLightmanMarker( controller )
			return true
		elseif IsDemoContextLighterMode() and ShouldEditLightmanMarker( controller ) and not IsDemoClipPreviewRunning() and not IsDemoCapturingScreenshot() then
			DemoEditLightmanMarker( controller )
			return true
		elseif IsDemoContextLighterMode() and IsEditingLightmanMarker( controller ) and not IsRepositioningLightmanMarker( controller ) and not IsDemoClipPreviewRunning() and not IsInLightmanColorPicker( controller ) and not IsDemoCapturingScreenshot() then
			DemoExitEditLightmanMarker( controller )
			return true
		elseif IsDemoContextLighterMode() and IsEditingLightmanMarker( controller ) and IsRepositioningLightmanMarker( controller ) and not IsDemoClipPreviewRunning() and not IsDemoCapturingScreenshot() then
			DemoPlaceLightmanMarker( controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsDemoContextDirectorMode() and ShouldStartAutoDollyCamera( controller ) and not IsDemoClipPreviewRunning() and not IsDemoCapturingScreenshot() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "" )
			return false
		elseif IsDemoContextDirectorMode() and ShouldStopAutoDollyCamera( controller ) and not IsDemoClipPreviewRunning() and not IsDemoCapturingScreenshot() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "" )
			return false
		elseif IsDemoContextDirectorMode() and ShouldAddDollyCameraMarker( controller ) and not IsDemoClipPreviewRunning() and not IsDemoCapturingScreenshot() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "" )
			return false
		elseif IsDemoContextDirectorMode() and ShouldEditDollyCameraMarker( controller ) and not IsDemoClipPreviewRunning() and not IsDemoCapturingScreenshot() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "" )
			return false
		elseif IsDemoContextDirectorMode() and IsEditingDollyCameraMarker( controller ) and not IsRepositioningDollyCameraMarker( controller ) and not IsDemoClipPreviewRunning() and not IsDemoCapturingScreenshot() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "" )
			return false
		elseif IsDemoContextDirectorMode() and IsEditingDollyCameraMarker( controller ) and IsRepositioningDollyCameraMarker( controller ) and not IsDemoClipPreviewRunning() and not IsDemoCapturingScreenshot() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "" )
			return false
		elseif IsDemoContextObjectLinkMode() and CanFreeCameraLockOnEntity( controller ) and not IsFreeCameraLockedOnEntity( controller ) and not IsDemoClipPreviewRunning() and not IsDemoCapturingScreenshot() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "" )
			return false
		elseif IsDemoContextObjectLinkMode() and IsFreeCameraLockedOnEntity( controller ) and not IsDemoClipPreviewRunning() and not IsDemoCapturingScreenshot() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "" )
			return false
		elseif IsDemoContextLighterMode() and ShouldAddLightmanMarker( controller ) and not IsDemoClipPreviewRunning() and not IsDemoCapturingScreenshot() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "" )
			return false
		elseif IsDemoContextLighterMode() and ShouldEditLightmanMarker( controller ) and not IsDemoClipPreviewRunning() and not IsDemoCapturingScreenshot() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "" )
			return false
		elseif IsDemoContextLighterMode() and IsEditingLightmanMarker( controller ) and not IsRepositioningLightmanMarker( controller ) and not IsDemoClipPreviewRunning() and not IsInLightmanColorPicker( controller ) and not IsDemoCapturingScreenshot() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "" )
			return false
		elseif IsDemoContextLighterMode() and IsEditingLightmanMarker( controller ) and IsRepositioningLightmanMarker( controller ) and not IsDemoClipPreviewRunning() and not IsDemoCapturingScreenshot() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "" )
			return false
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LB, "MOUSE1", function ( element, menu, controller, model )
		if not IsDemoClipPlaying() and not IsGlobalModelValueEqualToEnum( element, controller, "demo.cameraMode", Enum.demoCameraMode.DEMO_CAMERA_MODE_FREECAM ) and IsDemoContextBasicOrHighlightReelMode() and not IsDemoCreatingHighlightReel() and not IsDemoCapturingScreenshot() then
			DemoSwitchPlayer( controller, "prev" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsDemoClipPlaying() and not IsGlobalModelValueEqualToEnum( element, controller, "demo.cameraMode", Enum.demoCameraMode.DEMO_CAMERA_MODE_FREECAM ) and IsDemoContextBasicOrHighlightReelMode() and not IsDemoCreatingHighlightReel() and not IsDemoCapturingScreenshot() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LB, "" )
			return false
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RB, "MOUSE2", function ( element, menu, controller, model )
		if not IsDemoClipPlaying() and not IsGlobalModelValueEqualToEnum( element, controller, "demo.cameraMode", Enum.demoCameraMode.DEMO_CAMERA_MODE_FREECAM ) and IsDemoContextBasicOrHighlightReelMode() and not IsDemoCreatingHighlightReel() and not IsDemoCapturingScreenshot() then
			DemoSwitchPlayer( controller, "next" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsDemoClipPlaying() and not IsGlobalModelValueEqualToEnum( element, controller, "demo.cameraMode", Enum.demoCameraMode.DEMO_CAMERA_MODE_FREECAM ) and IsDemoContextBasicOrHighlightReelMode() and not IsDemoCreatingHighlightReel() and not IsDemoCapturingScreenshot() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RB, "" )
			return false
		else
			return false
		end
	end, false )
	DemoPlaybackControls.id = "DemoPlaybackControls"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.DemoPlaybackControls:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.DemoPlaybackControls:close()
		element.DemoContextPanel:close()
		element.DemoPlaybackControlsButtonBar:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

