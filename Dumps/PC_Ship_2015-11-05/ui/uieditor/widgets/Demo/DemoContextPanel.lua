require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.EndGameFlow.Top3PlayerScoreBlurBox" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.Demo.DemoControlsSpectatingBar" )
require( "ui.uieditor.widgets.FooterButtonPrompt" )

local PostLoadFunc = function ( self, controller, menu )
	self.ModeName:subscribeToGlobalModel( controller, "Demo", "contextMode", function ( model )
		local f2_local0 = "MP_UNKNOWN"
		if IsDemoContextPlaybackMode() then
			f2_local0 = "DEMO_PLAYBACK_MODE"
		elseif IsDemoContextBasicMode() then
			f2_local0 = "DEMO_BASIC_MODE"
		elseif IsDemoContextDirectorMode() then
			f2_local0 = "DEMO_DIRECTOR_MODE"
		elseif IsDemoContextObjectLinkMode() then
			f2_local0 = "DEMO_OBJECT_LINK_MODE"
		elseif IsDemoContextLighterMode() then
			f2_local0 = "DEMO_LIGHTER_MODE"
		end
		self.ModeName:setText( Engine.Localize( f2_local0 ) )
	end )
end

CoD.DemoContextPanel = InheritFrom( LUI.UIElement )
CoD.DemoContextPanel.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.DemoContextPanel )
	self.id = "DemoContextPanel"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 300 )
	self:setTopBottom( true, false, 0, 60 )
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( menu, controller )
	LeftPanel:setLeftRight( true, true, 0, 0 )
	LeftPanel:setTopBottom( true, true, 4, -3.5 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local Top3PlayerScoreBlurBox0 = CoD.Top3PlayerScoreBlurBox.new( menu, controller )
	Top3PlayerScoreBlurBox0:setLeftRight( true, true, 0, 0 )
	Top3PlayerScoreBlurBox0:setTopBottom( true, true, 31, -3.5 )
	Top3PlayerScoreBlurBox0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2" ) )
	Top3PlayerScoreBlurBox0:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( Top3PlayerScoreBlurBox0 )
	self.Top3PlayerScoreBlurBox0 = Top3PlayerScoreBlurBox0
	
	local VSpanel0 = CoD.FE_ButtonPanel.new( menu, controller )
	VSpanel0:setLeftRight( true, true, 0, 0 )
	VSpanel0:setTopBottom( true, true, 31, -3.5 )
	VSpanel0:setAlpha( 0.5 )
	self:addElement( VSpanel0 )
	self.VSpanel0 = VSpanel0
	
	local VSpanel = CoD.FE_ButtonPanel.new( menu, controller )
	VSpanel:setLeftRight( true, true, 0, 0 )
	VSpanel:setTopBottom( true, true, 4, -30 )
	VSpanel:setRGB( 0, 0, 0 )
	VSpanel:setAlpha( 0.5 )
	self:addElement( VSpanel )
	self.VSpanel = VSpanel
	
	local DemoControlsSpectatingBar = CoD.DemoControlsSpectatingBar.new( menu, controller )
	DemoControlsSpectatingBar:setLeftRight( true, false, 0, 300 )
	DemoControlsSpectatingBar:setTopBottom( true, false, 30.5, 55.5 )
	DemoControlsSpectatingBar.PlayerName:setRGB( 0, 0, 0 )
	self:addElement( DemoControlsSpectatingBar )
	self.DemoControlsSpectatingBar = DemoControlsSpectatingBar
	
	local ModeName = LUI.UIText.new()
	ModeName:setLeftRight( true, false, 0, 300 )
	ModeName:setTopBottom( true, false, 6, 28 )
	ModeName:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
	ModeName:setText( Engine.Localize( LocalizeToUpperString( "DEMO_BASIC_MODE" ) ) )
	ModeName:setTTF( "fonts/escom.ttf" )
	ModeName:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	ModeName:setShaderVector( 0, 0.02, 0, 0, 0 )
	ModeName:setShaderVector( 1, 0.03, 0, 0, 0 )
	ModeName:setShaderVector( 2, 1, 0, 0, 0 )
	ModeName:setLetterSpacing( 1 )
	ModeName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ModeName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ModeName )
	self.ModeName = ModeName
	
	local CancelPreviewBtn = CoD.FooterButtonPrompt.new( menu, controller )
	CancelPreviewBtn:setLeftRight( false, false, -67, 67 )
	CancelPreviewBtn:setTopBottom( false, false, -2, 30 )
	CancelPreviewBtn.label:setRGB( 0, 0, 0 )
	CancelPreviewBtn.label:setScale( 1.1 )
	CancelPreviewBtn.label:setText( Engine.Localize( "DEMO_CANCEL_PREVIEW" ) )
	CancelPreviewBtn.keyPrompt.keybind:setText( Engine.Localize( "KEY_BACKSPACE" ) )
	CancelPreviewBtn:subscribeToGlobalModel( controller, "Controller", "secondary_button_image", function ( model )
		local secondaryButtonImage = Engine.GetModelValue( model )
		if secondaryButtonImage then
			CancelPreviewBtn.buttonPromptImage:setImage( RegisterImage( secondaryButtonImage ) )
		end
	end )
	CancelPreviewBtn:mergeStateConditions( {
		{
			stateName = "Enabled",
			condition = function ( menu, element, event )
				return IsGamepad( controller )
			end
		},
		{
			stateName = "EnabledPC",
			condition = function ( menu, element, event )
				local f6_local0
				if not IsGamepad( controller ) then
					f6_local0 = not ShouldHideButtonPromptForPC( element, controller )
				else
					f6_local0 = false
				end
				return f6_local0
			end
		}
	} )
	CancelPreviewBtn:linkToElementModel( CancelPreviewBtn, nil, true, function ( model )
		menu:updateElementState( CancelPreviewBtn, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		} )
	end )
	if CancelPreviewBtn.m_eventHandlers.input_source_changed then
		local f3_local8 = CancelPreviewBtn.m_eventHandlers.input_source_changed
		CancelPreviewBtn:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return f3_local8( element, event )
		end )
	else
		CancelPreviewBtn:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	CancelPreviewBtn:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		menu:updateElementState( CancelPreviewBtn, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )
	self:addElement( CancelPreviewBtn )
	self.CancelPreviewBtn = CancelPreviewBtn
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				DemoControlsSpectatingBar:completeAnimation()
				self.DemoControlsSpectatingBar:setAlpha( 1 )
				self.clipFinished( DemoControlsSpectatingBar, {} )
				ModeName:completeAnimation()
				self.ModeName:setAlpha( 1 )
				self.clipFinished( ModeName, {} )
				CancelPreviewBtn:completeAnimation()
				self.CancelPreviewBtn:setAlpha( 0 )
				self.clipFinished( CancelPreviewBtn, {} )
			end
		},
		ClipPreview = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				DemoControlsSpectatingBar:completeAnimation()
				self.DemoControlsSpectatingBar:setAlpha( 0 )
				self.clipFinished( DemoControlsSpectatingBar, {} )
				ModeName:completeAnimation()
				self.ModeName:setAlpha( 1 )
				self.ModeName:setText( Engine.Localize( LocalizeToUpperString( "MENU_DEMO_MODE_PREVIEWING_SEGMENT" ) ) )
				self.clipFinished( ModeName, {} )
				CancelPreviewBtn:completeAnimation()
				self.CancelPreviewBtn:setAlpha( 1 )
				self.clipFinished( CancelPreviewBtn, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "ClipPreview",
			condition = function ( menu, element, event )
				return IsDemoClipPreviewRunning()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "demo.clipState" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "demo.clipState"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LeftPanel:close()
		element.Top3PlayerScoreBlurBox0:close()
		element.VSpanel0:close()
		element.VSpanel:close()
		element.DemoControlsSpectatingBar:close()
		element.CancelPreviewBtn:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

