require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreakVignetteContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShader" )
require( "ui.uieditor.widgets.FooterButtonPrompt" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_TitlePopup" )
require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_alertStatusBar" )

CoD.CACFullPopupBackground = InheritFrom( LUI.UIElement )
CoD.CACFullPopupBackground.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CACFullPopupBackground )
	self.id = "CACFullPopupBackground"
	self.soundSet = "CAC_Wildcard"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local darkbg = LUI.UIImage.new()
	darkbg:setLeftRight( true, true, 2, 0 )
	darkbg:setTopBottom( true, true, -20, 0 )
	darkbg:setRGB( 0.17, 0.16, 0.16 )
	darkbg:setAlpha( 0.95 )
	self:addElement( darkbg )
	self.darkbg = darkbg
	
	local scorestreakVignetteContainer = CoD.scorestreakVignetteContainer.new( menu, controller )
	scorestreakVignetteContainer:setLeftRight( true, false, 2, 1280 )
	scorestreakVignetteContainer:setTopBottom( true, false, 0, 720 )
	self:addElement( scorestreakVignetteContainer )
	self.scorestreakVignetteContainer = scorestreakVignetteContainer
	
	local FEButtonPanel = CoD.FE_ButtonPanelShader.new( menu, controller )
	FEButtonPanel:setLeftRight( true, true, 0, 0 )
	FEButtonPanel:setTopBottom( true, true, 134, -151 )
	FEButtonPanel:setRGB( 0.5, 0.5, 0.5 )
	FEButtonPanel:setAlpha( 0 )
	FEButtonPanel:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2" ) )
	FEButtonPanel:setShaderVector( 0, 30, 10, 0, 0 )
	self:addElement( FEButtonPanel )
	self.FEButtonPanel = FEButtonPanel
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( false, false, -163, 150 )
	background:setRGB( 0, 0, 0 )
	background:setAlpha( 0 )
	self:addElement( background )
	self.background = background
	
	local topBar = LUI.UIImage.new()
	topBar:setLeftRight( true, true, 0, 0 )
	topBar:setTopBottom( true, false, 134, 197 )
	topBar:setRGB( 0, 0, 0 )
	self:addElement( topBar )
	self.topBar = topBar
	
	local bottomBar = LUI.UIImage.new()
	bottomBar:setLeftRight( true, true, 0, 0 )
	bottomBar:setTopBottom( false, true, -182, -137 )
	bottomBar:setRGB( 0, 0, 0 )
	self:addElement( bottomBar )
	self.bottomBar = bottomBar
	
	local CategoryListLineBottomBottom = LUI.UIImage.new()
	CategoryListLineBottomBottom:setLeftRight( true, false, 0, 1280 )
	CategoryListLineBottomBottom:setTopBottom( true, false, 580.83, 588.5 )
	CategoryListLineBottomBottom:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLineBottomBottom:setAlpha( 0 )
	CategoryListLineBottomBottom:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLineBottomBottom )
	self.CategoryListLineBottomBottom = CategoryListLineBottomBottom
	
	local selectButtonPrompt = CoD.FooterButtonPrompt.new( menu, controller )
	selectButtonPrompt:setLeftRight( true, false, 64, 164 )
	selectButtonPrompt:setTopBottom( true, false, 544.5, 576.5 )
	selectButtonPrompt.label:setText( Engine.Localize( "Select" ) )
	selectButtonPrompt:subscribeToGlobalModel( controller, "Controller", "primary_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			selectButtonPrompt.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	selectButtonPrompt:linkToElementModel( self, "" .. Enum.LUIButton.LUI_KEY_XBA_PSCROSS, false, function ( model )
		selectButtonPrompt:setModel( model, controller )
	end )
	selectButtonPrompt:mergeStateConditions( {
		{
			stateName = "DisabledPC",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "EnabledPC",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	selectButtonPrompt:linkToElementModel( selectButtonPrompt, nil, true, function ( model )
		menu:updateElementState( selectButtonPrompt, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		} )
	end )
	if selectButtonPrompt.m_eventHandlers.input_source_changed then
		local currentEv = selectButtonPrompt.m_eventHandlers.input_source_changed
		selectButtonPrompt:registerEventHandler( "input_source_changed", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		selectButtonPrompt:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	self:addElement( selectButtonPrompt )
	self.selectButtonPrompt = selectButtonPrompt
	
	local currentEv = CoD.FooterButtonPrompt.new( menu, controller )
	currentEv:setLeftRight( true, false, 171, 271 )
	currentEv:setTopBottom( true, false, 544.5, 576.5 )
	currentEv.label:setText( Engine.Localize( "Select" ) )
	currentEv:subscribeToGlobalModel( controller, "Controller", "secondary_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			currentEv.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	currentEv:linkToElementModel( self, "" .. Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, false, function ( model )
		currentEv:setModel( model, controller )
	end )
	self:addElement( currentEv )
	self.backButtonPrompt = currentEv
	
	local CategoryListLineBottomTop = LUI.UIImage.new()
	CategoryListLineBottomTop:setLeftRight( true, false, 0, 1280 )
	CategoryListLineBottomTop:setTopBottom( true, false, 533.83, 541.5 )
	CategoryListLineBottomTop:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLineBottomTop:setAlpha( 0.25 )
	CategoryListLineBottomTop:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLineBottomTop )
	self.CategoryListLineBottomTop = CategoryListLineBottomTop
	
	local CategoryListLineTopBottom = LUI.UIImage.new()
	CategoryListLineTopBottom:setLeftRight( true, false, 0, 1280 )
	CategoryListLineTopBottom:setTopBottom( true, false, 192.83, 200.5 )
	CategoryListLineTopBottom:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLineTopBottom:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLineTopBottom )
	self.CategoryListLineTopBottom = CategoryListLineTopBottom
	
	local CategoryListLineTopTop = LUI.UIImage.new()
	CategoryListLineTopTop:setLeftRight( true, false, 0, 1280 )
	CategoryListLineTopTop:setTopBottom( true, false, 130.83, 138.5 )
	CategoryListLineTopTop:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLineTopTop:setAlpha( 0.25 )
	CategoryListLineTopTop:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLineTopTop )
	self.CategoryListLineTopTop = CategoryListLineTopTop
	
	local StartMenuTitlePopup = CoD.StartMenu_TitlePopup.new( menu, controller )
	StartMenuTitlePopup:setLeftRight( true, false, -51, 527 )
	StartMenuTitlePopup:setTopBottom( true, false, 112, 258 )
	StartMenuTitlePopup.StartMenuTitleContainerLOC.StartMenu3dTitle.StartMenu3dTitleLabel.Label0:setText( Engine.Localize( "" ) )
	self:addElement( StartMenuTitlePopup )
	self.StartMenuTitlePopup = StartMenuTitlePopup
	
	local Smokebkg = LUI.UIImage.new()
	Smokebkg:setLeftRight( true, false, 0, 1280 )
	Smokebkg:setTopBottom( true, false, 197, 537.67 )
	Smokebkg:setRGB( 0.63, 0.61, 0.61 )
	Smokebkg:setAlpha( 0.75 )
	Smokebkg:setImage( RegisterImage( "uie_t7_icon_master_overlays_bkg" ) )
	self:addElement( Smokebkg )
	self.Smokebkg = Smokebkg
	
	local alertStatusBar = CoD.systemOverlay_alertStatusBar.new( menu, controller )
	alertStatusBar:setLeftRight( true, true, 0, 0 )
	alertStatusBar:setTopBottom( true, false, 196, 200 )
	alertStatusBar:linkToElementModel( self, nil, false, function ( model )
		alertStatusBar:setModel( model, controller )
	end )
	self:addElement( alertStatusBar )
	self.alertStatusBar = alertStatusBar
	
	local CategoryListLineTopBottom0 = LUI.UIImage.new()
	CategoryListLineTopBottom0:setLeftRight( true, false, 0, 1280 )
	CategoryListLineTopBottom0:setTopBottom( true, false, 532.83, 540.5 )
	CategoryListLineTopBottom0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLineTopBottom0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLineTopBottom0 )
	self.CategoryListLineTopBottom0 = CategoryListLineTopBottom0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.scorestreakVignetteContainer:close()
		self.FEButtonPanel:close()
		self.selectButtonPrompt:close()
		self.backButtonPrompt:close()
		self.StartMenuTitlePopup:close()
		self.alertStatusBar:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

