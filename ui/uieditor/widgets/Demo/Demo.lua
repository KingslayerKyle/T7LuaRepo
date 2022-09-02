-- 5040386c1b12b8fdd95add156df0ca33
-- This hash is used for caching, delete to decompile the file again

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
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "X", function ( f41_arg0, f41_arg1, f41_arg2, f41_arg3 )
		if IsDemoContextBasicOrHighlightReelMode() and not IsDemoClipPreviewRunning() and not IsDemoCreatingHighlightReel() and not IsDemoCapturingScreenshot() then
			UpdateDemoCameraMode( f41_arg2, "cycle" )
			return true
		else
			
		end
	end, function ( f42_arg0, f42_arg1, f42_arg2 )
		if IsDemoContextBasicOrHighlightReelMode() and not IsDemoClipPreviewRunning() and not IsDemoCreatingHighlightReel() and not IsDemoCapturingScreenshot() then
			CoD.Menu.SetButtonLabel( f42_arg1, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "" )
			return false
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "M", function ( f43_arg0, f43_arg1, f43_arg2, f43_arg3 )
		if not IsDemoContextPlaybackMode() and not IsEditingDollyCameraMarker( f43_arg2 ) and not IsDemoClipPreviewRunning() and not IsDemoRestrictedBasicMode() and not IsDemoCreatingHighlightReel() and not IsDemoCapturingScreenshot() and not IsGlobalModelValueTrue( f43_arg0, f43_arg2, "demo.uploadPopupOpen" ) and not IsVisibilityBitSet( f43_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			SetGlobalModelValueTrue( "demo.showChooseModeSidebar" )
			OpenPopupWithPriority( self, "ChooseModeSidebar", f43_arg2, 100 )
			return true
		else
			
		end
	end, function ( f44_arg0, f44_arg1, f44_arg2 )
		if not IsDemoContextPlaybackMode() and not IsEditingDollyCameraMarker( f44_arg2 ) and not IsDemoClipPreviewRunning() and not IsDemoRestrictedBasicMode() and not IsDemoCreatingHighlightReel() and not IsDemoCapturingScreenshot() and not IsGlobalModelValueTrue( f44_arg0, f44_arg2, "demo.uploadPopupOpen" ) and not IsVisibilityBitSet( f44_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( f44_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "" )
			return false
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LTRIG, "Q", function ( f45_arg0, f45_arg1, f45_arg2, f45_arg3 )
		if not IsDemoClipPreviewRunning() and not IsDemoCreatingHighlightReel() and not IsDemoCapturingScreenshot() then
			DemoJumpBack( f45_arg2 )
			return true
		else
			
		end
	end, function ( f46_arg0, f46_arg1, f46_arg2 )
		if not IsDemoClipPreviewRunning() and not IsDemoCreatingHighlightReel() and not IsDemoCapturingScreenshot() then
			CoD.Menu.SetButtonLabel( f46_arg1, Enum.LUIButton.LUI_KEY_LTRIG, "" )
			return false
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RTRIG, "E", function ( f47_arg0, f47_arg1, f47_arg2, f47_arg3 )
		if not IsDemoClipPreviewRunning() and not IsDemoCreatingHighlightReel() and not IsDemoCapturingScreenshot() and not IsRepeatButtonPress( f47_arg3 ) then
			UpdateDemoFastForward( f47_arg2 )
			return true
		else
			
		end
	end, function ( f48_arg0, f48_arg1, f48_arg2 )
		if not IsDemoClipPreviewRunning() and not IsDemoCreatingHighlightReel() and not IsDemoCapturingScreenshot() and not IsRepeatButtonPress( nil ) then
			CoD.Menu.SetButtonLabel( f48_arg1, Enum.LUIButton.LUI_KEY_RTRIG, "" )
			return false
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED, "T", function ( f49_arg0, f49_arg1, f49_arg2, f49_arg3 )
		if not IsDemoClipPreviewRunning() and not IsDemoCreatingHighlightReel() and not IsDemoCapturingScreenshot() then
			DemoToggleDemoHud( f49_arg2 )
			return true
		else
			
		end
	end, function ( f50_arg0, f50_arg1, f50_arg2 )
		if not IsDemoClipPreviewRunning() and not IsDemoCreatingHighlightReel() and not IsDemoCapturingScreenshot() then
			CoD.Menu.SetButtonLabel( f50_arg1, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED, "" )
			return false
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "H", function ( f51_arg0, f51_arg1, f51_arg2, f51_arg3 )
		if not IsDemoContextPlaybackMode() and not IsEditingDollyCameraMarker( f51_arg2 ) and not IsEditingLightmanMarker( f51_arg2 ) and not IsDemoClipPreviewRunning() and not IsDemoCreatingHighlightReel() and not IsDemoCapturingScreenshot() then
			DemoUpdatePlayPause( f51_arg2 )
			return true
		elseif IsDemoContextDirectorMode() and IsEditingDollyCameraMarker( f51_arg2 ) and IsRepositioningDollyCameraMarker( f51_arg2 ) and not IsDemoClipPreviewRunning() and not IsDemoCapturingScreenshot() then
			DemoCancelPlaceDollyCameraMarker( f51_arg2 )
			return true
		elseif IsDemoContextLighterMode() and IsEditingLightmanMarker( f51_arg2 ) and IsRepositioningLightmanMarker( f51_arg2 ) and not IsDemoClipPreviewRunning() and not IsDemoCapturingScreenshot() then
			DemoCancelPlaceLightmanMarker( f51_arg2 )
			return true
		elseif IsDemoClipPreviewRunning() then
			DemoCancelPreview( f51_arg2 )
			return true
		elseif IsDemoCreatingHighlightReel() then
			DemoCancelHighlightReelCreation( f51_arg2 )
			return true
		else
			
		end
	end, function ( f52_arg0, f52_arg1, f52_arg2 )
		if not IsDemoContextPlaybackMode() and not IsEditingDollyCameraMarker( f52_arg2 ) and not IsEditingLightmanMarker( f52_arg2 ) and not IsDemoClipPreviewRunning() and not IsDemoCreatingHighlightReel() and not IsDemoCapturingScreenshot() then
			CoD.Menu.SetButtonLabel( f52_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
			return false
		elseif IsDemoContextDirectorMode() and IsEditingDollyCameraMarker( f52_arg2 ) and IsRepositioningDollyCameraMarker( f52_arg2 ) and not IsDemoClipPreviewRunning() and not IsDemoCapturingScreenshot() then
			CoD.Menu.SetButtonLabel( f52_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
			return false
		elseif IsDemoContextLighterMode() and IsEditingLightmanMarker( f52_arg2 ) and IsRepositioningLightmanMarker( f52_arg2 ) and not IsDemoClipPreviewRunning() and not IsDemoCapturingScreenshot() then
			CoD.Menu.SetButtonLabel( f52_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
			return false
		elseif IsDemoClipPreviewRunning() then
			CoD.Menu.SetButtonLabel( f52_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
			return false
		elseif IsDemoCreatingHighlightReel() then
			CoD.Menu.SetButtonLabel( f52_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
			return false
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "F", function ( f53_arg0, f53_arg1, f53_arg2, f53_arg3 )
		if IsDemoContextDirectorMode() and ShouldStartAutoDollyCamera( f53_arg2 ) and not IsDemoClipPreviewRunning() and not IsDemoCapturingScreenshot() then
			DemoStartAutoDollyCamera( f53_arg2 )
			return true
		elseif IsDemoContextDirectorMode() and ShouldStopAutoDollyCamera( f53_arg2 ) and not IsDemoClipPreviewRunning() and not IsDemoCapturingScreenshot() then
			DemoStopAutoDollyCamera( f53_arg2 )
			return true
		elseif IsDemoContextDirectorMode() and ShouldAddDollyCameraMarker( f53_arg2 ) and not IsDemoClipPreviewRunning() and not IsDemoCapturingScreenshot() then
			DemoAddDollyCameraMarker( f53_arg2 )
			return true
		elseif IsDemoContextDirectorMode() and ShouldEditDollyCameraMarker( f53_arg2 ) and not IsDemoClipPreviewRunning() and not IsDemoCapturingScreenshot() then
			DemoEditDollyCameraMarker( f53_arg2 )
			return true
		elseif IsDemoContextDirectorMode() and IsEditingDollyCameraMarker( f53_arg2 ) and not IsRepositioningDollyCameraMarker( f53_arg2 ) and not IsDemoClipPreviewRunning() and not IsDemoCapturingScreenshot() then
			DemoExitEditDollyCameraMarker( f53_arg2 )
			return true
		elseif IsDemoContextDirectorMode() and IsEditingDollyCameraMarker( f53_arg2 ) and IsRepositioningDollyCameraMarker( f53_arg2 ) and not IsDemoClipPreviewRunning() and not IsDemoCapturingScreenshot() then
			DemoPlaceDollyCameraMarker( f53_arg2 )
			return true
		elseif IsDemoContextObjectLinkMode() and CanFreeCameraLockOnEntity( f53_arg2 ) and not IsFreeCameraLockedOnEntity( f53_arg2 ) and not IsDemoClipPreviewRunning() and not IsDemoCapturingScreenshot() then
			DemoFreeCameraLockOnObject( f53_arg2 )
			return true
		elseif IsDemoContextObjectLinkMode() and IsFreeCameraLockedOnEntity( f53_arg2 ) and not IsDemoClipPreviewRunning() and not IsDemoCapturingScreenshot() then
			DemoFreeCameraUnlockObject( f53_arg2 )
			return true
		elseif IsDemoContextLighterMode() and ShouldAddLightmanMarker( f53_arg2 ) and not IsDemoClipPreviewRunning() and not IsDemoCapturingScreenshot() then
			DemoAddLightmanMarker( f53_arg2 )
			return true
		elseif IsDemoContextLighterMode() and ShouldEditLightmanMarker( f53_arg2 ) and not IsDemoClipPreviewRunning() and not IsDemoCapturingScreenshot() then
			DemoEditLightmanMarker( f53_arg2 )
			return true
		elseif IsDemoContextLighterMode() and IsEditingLightmanMarker( f53_arg2 ) and not IsRepositioningLightmanMarker( f53_arg2 ) and not IsDemoClipPreviewRunning() and not IsInLightmanColorPicker( f53_arg2 ) and not IsDemoCapturingScreenshot() then
			DemoExitEditLightmanMarker( f53_arg2 )
			return true
		elseif IsDemoContextLighterMode() and IsEditingLightmanMarker( f53_arg2 ) and IsRepositioningLightmanMarker( f53_arg2 ) and not IsDemoClipPreviewRunning() and not IsDemoCapturingScreenshot() then
			DemoPlaceLightmanMarker( f53_arg2 )
			return true
		else
			
		end
	end, function ( f54_arg0, f54_arg1, f54_arg2 )
		if IsDemoContextDirectorMode() and ShouldStartAutoDollyCamera( f54_arg2 ) and not IsDemoClipPreviewRunning() and not IsDemoCapturingScreenshot() then
			CoD.Menu.SetButtonLabel( f54_arg1, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "" )
			return false
		elseif IsDemoContextDirectorMode() and ShouldStopAutoDollyCamera( f54_arg2 ) and not IsDemoClipPreviewRunning() and not IsDemoCapturingScreenshot() then
			CoD.Menu.SetButtonLabel( f54_arg1, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "" )
			return false
		elseif IsDemoContextDirectorMode() and ShouldAddDollyCameraMarker( f54_arg2 ) and not IsDemoClipPreviewRunning() and not IsDemoCapturingScreenshot() then
			CoD.Menu.SetButtonLabel( f54_arg1, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "" )
			return false
		elseif IsDemoContextDirectorMode() and ShouldEditDollyCameraMarker( f54_arg2 ) and not IsDemoClipPreviewRunning() and not IsDemoCapturingScreenshot() then
			CoD.Menu.SetButtonLabel( f54_arg1, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "" )
			return false
		elseif IsDemoContextDirectorMode() and IsEditingDollyCameraMarker( f54_arg2 ) and not IsRepositioningDollyCameraMarker( f54_arg2 ) and not IsDemoClipPreviewRunning() and not IsDemoCapturingScreenshot() then
			CoD.Menu.SetButtonLabel( f54_arg1, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "" )
			return false
		elseif IsDemoContextDirectorMode() and IsEditingDollyCameraMarker( f54_arg2 ) and IsRepositioningDollyCameraMarker( f54_arg2 ) and not IsDemoClipPreviewRunning() and not IsDemoCapturingScreenshot() then
			CoD.Menu.SetButtonLabel( f54_arg1, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "" )
			return false
		elseif IsDemoContextObjectLinkMode() and CanFreeCameraLockOnEntity( f54_arg2 ) and not IsFreeCameraLockedOnEntity( f54_arg2 ) and not IsDemoClipPreviewRunning() and not IsDemoCapturingScreenshot() then
			CoD.Menu.SetButtonLabel( f54_arg1, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "" )
			return false
		elseif IsDemoContextObjectLinkMode() and IsFreeCameraLockedOnEntity( f54_arg2 ) and not IsDemoClipPreviewRunning() and not IsDemoCapturingScreenshot() then
			CoD.Menu.SetButtonLabel( f54_arg1, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "" )
			return false
		elseif IsDemoContextLighterMode() and ShouldAddLightmanMarker( f54_arg2 ) and not IsDemoClipPreviewRunning() and not IsDemoCapturingScreenshot() then
			CoD.Menu.SetButtonLabel( f54_arg1, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "" )
			return false
		elseif IsDemoContextLighterMode() and ShouldEditLightmanMarker( f54_arg2 ) and not IsDemoClipPreviewRunning() and not IsDemoCapturingScreenshot() then
			CoD.Menu.SetButtonLabel( f54_arg1, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "" )
			return false
		elseif IsDemoContextLighterMode() and IsEditingLightmanMarker( f54_arg2 ) and not IsRepositioningLightmanMarker( f54_arg2 ) and not IsDemoClipPreviewRunning() and not IsInLightmanColorPicker( f54_arg2 ) and not IsDemoCapturingScreenshot() then
			CoD.Menu.SetButtonLabel( f54_arg1, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "" )
			return false
		elseif IsDemoContextLighterMode() and IsEditingLightmanMarker( f54_arg2 ) and IsRepositioningLightmanMarker( f54_arg2 ) and not IsDemoClipPreviewRunning() and not IsDemoCapturingScreenshot() then
			CoD.Menu.SetButtonLabel( f54_arg1, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "" )
			return false
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LB, "MOUSE1", function ( f55_arg0, f55_arg1, f55_arg2, f55_arg3 )
		if not IsDemoClipPlaying() and not IsGlobalModelValueEqualToEnum( f55_arg0, f55_arg2, "demo.cameraMode", Enum.demoCameraMode.DEMO_CAMERA_MODE_FREECAM ) and IsDemoContextBasicOrHighlightReelMode() and not IsDemoCreatingHighlightReel() and not IsDemoCapturingScreenshot() then
			DemoSwitchPlayer( f55_arg2, "prev" )
			return true
		else
			
		end
	end, function ( f56_arg0, f56_arg1, f56_arg2 )
		if not IsDemoClipPlaying() and not IsGlobalModelValueEqualToEnum( f56_arg0, f56_arg2, "demo.cameraMode", Enum.demoCameraMode.DEMO_CAMERA_MODE_FREECAM ) and IsDemoContextBasicOrHighlightReelMode() and not IsDemoCreatingHighlightReel() and not IsDemoCapturingScreenshot() then
			CoD.Menu.SetButtonLabel( f56_arg1, Enum.LUIButton.LUI_KEY_LB, "" )
			return false
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RB, "MOUSE2", function ( f57_arg0, f57_arg1, f57_arg2, f57_arg3 )
		if not IsDemoClipPlaying() and not IsGlobalModelValueEqualToEnum( f57_arg0, f57_arg2, "demo.cameraMode", Enum.demoCameraMode.DEMO_CAMERA_MODE_FREECAM ) and IsDemoContextBasicOrHighlightReelMode() and not IsDemoCreatingHighlightReel() and not IsDemoCapturingScreenshot() then
			DemoSwitchPlayer( f57_arg2, "next" )
			return true
		else
			
		end
	end, function ( f58_arg0, f58_arg1, f58_arg2 )
		if not IsDemoClipPlaying() and not IsGlobalModelValueEqualToEnum( f58_arg0, f58_arg2, "demo.cameraMode", Enum.demoCameraMode.DEMO_CAMERA_MODE_FREECAM ) and IsDemoContextBasicOrHighlightReelMode() and not IsDemoCreatingHighlightReel() and not IsDemoCapturingScreenshot() then
			CoD.Menu.SetButtonLabel( f58_arg1, Enum.LUIButton.LUI_KEY_RB, "" )
			return false
		else
			return false
		end
	end, false )
	DemoPlaybackControls.id = "DemoPlaybackControls"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.DemoPlaybackControls:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
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

