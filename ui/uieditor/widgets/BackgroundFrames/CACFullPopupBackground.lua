-- 979b40db687783e215d2fe16be5e659e
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreakVignetteContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShader" )
require( "ui.uieditor.widgets.Footer.fe_LeftContainer_NOTLobby" )
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
	darkbg:setLeftRight( true, true, 0, 0 )
	darkbg:setTopBottom( true, true, -20, 0 )
	darkbg:setRGB( 0.17, 0.16, 0.16 )
	darkbg:setAlpha( 0.95 )
	self:addElement( darkbg )
	self.darkbg = darkbg
	
	local scorestreakVignetteContainer = CoD.scorestreakVignetteContainer.new( menu, controller )
	scorestreakVignetteContainer:setLeftRight( true, true, 2, 0 )
	scorestreakVignetteContainer:setTopBottom( true, true, 0, 0 )
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
	bottomBar:setTopBottom( true, false, 538, 583 )
	bottomBar:setRGB( 0, 0, 0 )
	self:addElement( bottomBar )
	self.bottomBar = bottomBar
	
	local CategoryListLineBottomBottom = LUI.UIImage.new()
	CategoryListLineBottomBottom:setLeftRight( true, true, 0, 0 )
	CategoryListLineBottomBottom:setTopBottom( true, false, 580.83, 588.5 )
	CategoryListLineBottomBottom:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLineBottomBottom:setAlpha( 0 )
	CategoryListLineBottomBottom:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLineBottomBottom )
	self.CategoryListLineBottomBottom = CategoryListLineBottomBottom
	
	local CategoryListLineBottomTop = LUI.UIImage.new()
	CategoryListLineBottomTop:setLeftRight( true, true, 0, 0 )
	CategoryListLineBottomTop:setTopBottom( true, false, 533.83, 541.5 )
	CategoryListLineBottomTop:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLineBottomTop:setAlpha( 0.25 )
	CategoryListLineBottomTop:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLineBottomTop )
	self.CategoryListLineBottomTop = CategoryListLineBottomTop
	
	local buttons = CoD.fe_LeftContainer_NOTLobby.new( menu, controller )
	buttons:setLeftRight( false, false, -576, -144 )
	buttons:setTopBottom( true, false, 541.5, 573.5 )
	buttons:linkToElementModel( self, nil, false, function ( model )
		buttons:setModel( model, controller )
	end )
	self:addElement( buttons )
	self.buttons = buttons
	
	local CategoryListLineTopBottom = LUI.UIImage.new()
	CategoryListLineTopBottom:setLeftRight( true, true, 0, 0 )
	CategoryListLineTopBottom:setTopBottom( true, false, 192.83, 200.5 )
	CategoryListLineTopBottom:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLineTopBottom:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLineTopBottom )
	self.CategoryListLineTopBottom = CategoryListLineTopBottom
	
	local CategoryListLineTopTop = LUI.UIImage.new()
	CategoryListLineTopTop:setLeftRight( true, true, 0, 0 )
	CategoryListLineTopTop:setTopBottom( true, false, 130.83, 138.5 )
	CategoryListLineTopTop:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLineTopTop:setAlpha( 0.25 )
	CategoryListLineTopTop:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLineTopTop )
	self.CategoryListLineTopTop = CategoryListLineTopTop
	
	local StartMenuTitlePopup = CoD.StartMenu_TitlePopup.new( menu, controller )
	StartMenuTitlePopup:setLeftRight( false, false, -691, -113 )
	StartMenuTitlePopup:setTopBottom( true, false, 112, 258 )
	StartMenuTitlePopup.StartMenuTitleContainerLOC.StartMenu3dTitle.StartMenu3dTitleLabel.Label0:setText( Engine.Localize( "" ) )
	self:addElement( StartMenuTitlePopup )
	self.StartMenuTitlePopup = StartMenuTitlePopup
	
	local blackbkg = LUI.UIImage.new()
	blackbkg:setLeftRight( true, true, 0, 0 )
	blackbkg:setTopBottom( true, false, 197, 537.67 )
	blackbkg:setRGB( 0, 0, 0 )
	blackbkg:setAlpha( 0.75 )
	blackbkg:setImage( RegisterImage( "uie_t7_icon_master_overlays_bkg" ) )
	self:addElement( blackbkg )
	self.blackbkg = blackbkg
	
	local Smokebkg = LUI.UIImage.new()
	Smokebkg:setLeftRight( false, false, -640, 640 )
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
	CategoryListLineTopBottom0:setLeftRight( true, true, 0, 0 )
	CategoryListLineTopBottom0:setTopBottom( true, false, 532.83, 540.5 )
	CategoryListLineTopBottom0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLineTopBottom0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLineTopBottom0 )
	self.CategoryListLineTopBottom0 = CategoryListLineTopBottom0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.scorestreakVignetteContainer:close()
		element.FEButtonPanel:close()
		element.buttons:close()
		element.StartMenuTitlePopup:close()
		element.alertStatusBar:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
