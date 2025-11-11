require( "ui.uieditor.widgets.Footer.fe_LeftContainer_NOTLobby" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShader" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreakVignetteContainer" )
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
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 1080 )
	self.anyChildUsesUpdateState = true
	
	local darkbg = LUI.UIImage.new()
	darkbg:setLeftRight( 0, 1, 0, 0 )
	darkbg:setTopBottom( 0, 1, -30, 0 )
	darkbg:setRGB( 0.17, 0.16, 0.16 )
	darkbg:setAlpha( 0.95 )
	self:addElement( darkbg )
	self.darkbg = darkbg
	
	local scorestreakVignetteContainer = CoD.scorestreakVignetteContainer.new( menu, controller )
	scorestreakVignetteContainer:setLeftRight( 0, 1, 4, 0 )
	scorestreakVignetteContainer:setTopBottom( 0, 1, 0, 0 )
	self:addElement( scorestreakVignetteContainer )
	self.scorestreakVignetteContainer = scorestreakVignetteContainer
	
	local FEButtonPanel = CoD.FE_ButtonPanelShader.new( menu, controller )
	FEButtonPanel:setLeftRight( 0, 1, 0, 0 )
	FEButtonPanel:setTopBottom( 0, 1, 201, -227 )
	FEButtonPanel:setRGB( 0.5, 0.5, 0.5 )
	FEButtonPanel:setAlpha( 0 )
	FEButtonPanel:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2_highquality" ) )
	FEButtonPanel:setShaderVector( 0, 30, 10, 0, 0 )
	self:addElement( FEButtonPanel )
	self.FEButtonPanel = FEButtonPanel
	
	local background = LUI.UIImage.new()
	background:setLeftRight( 0, 1, 0, 0 )
	background:setTopBottom( 0.5, 0.5, -245, 225 )
	background:setRGB( 0, 0, 0 )
	background:setAlpha( 0 )
	self:addElement( background )
	self.background = background
	
	local topBar = LUI.UIImage.new()
	topBar:setLeftRight( 0, 1, 0, 0 )
	topBar:setTopBottom( 0, 0, 201, 295 )
	topBar:setRGB( 0, 0, 0 )
	self:addElement( topBar )
	self.topBar = topBar
	
	local bottomBar = LUI.UIImage.new()
	bottomBar:setLeftRight( 0, 1, 0, 0 )
	bottomBar:setTopBottom( 0, 0, 807, 875 )
	bottomBar:setRGB( 0, 0, 0 )
	self:addElement( bottomBar )
	self.bottomBar = bottomBar
	
	local CategoryListLineBottomBottom = LUI.UIImage.new()
	CategoryListLineBottomBottom:setLeftRight( 0, 1, 0, 0 )
	CategoryListLineBottomBottom:setTopBottom( 0, 0, 871, 883 )
	CategoryListLineBottomBottom:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLineBottomBottom:setAlpha( 0 )
	CategoryListLineBottomBottom:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLineBottomBottom )
	self.CategoryListLineBottomBottom = CategoryListLineBottomBottom
	
	local CategoryListLineBottomTop = LUI.UIImage.new()
	CategoryListLineBottomTop:setLeftRight( 0, 1, 0, 0 )
	CategoryListLineBottomTop:setTopBottom( 0, 0, 801, 813 )
	CategoryListLineBottomTop:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLineBottomTop:setAlpha( 0.25 )
	CategoryListLineBottomTop:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLineBottomTop )
	self.CategoryListLineBottomTop = CategoryListLineBottomTop
	
	local buttons = CoD.fe_LeftContainer_NOTLobby.new( menu, controller )
	buttons:setLeftRight( 0.5, 0.5, -864, -216 )
	buttons:setTopBottom( 0, 0, 812, 860 )
	buttons:linkToElementModel( self, nil, false, function ( model )
		buttons:setModel( model, controller )
	end )
	self:addElement( buttons )
	self.buttons = buttons
	
	local CategoryListLineTopBottom = LUI.UIImage.new()
	CategoryListLineTopBottom:setLeftRight( 0, 1, 0, 0 )
	CategoryListLineTopBottom:setTopBottom( 0, 0, 289, 301 )
	CategoryListLineTopBottom:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLineTopBottom:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLineTopBottom )
	self.CategoryListLineTopBottom = CategoryListLineTopBottom
	
	local CategoryListLineTopTop = LUI.UIImage.new()
	CategoryListLineTopTop:setLeftRight( 0, 1, 0, 0 )
	CategoryListLineTopTop:setTopBottom( 0, 0, 196, 208 )
	CategoryListLineTopTop:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLineTopTop:setAlpha( 0.25 )
	CategoryListLineTopTop:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLineTopTop )
	self.CategoryListLineTopTop = CategoryListLineTopTop
	
	local StartMenuTitlePopup = CoD.StartMenu_TitlePopup.new( menu, controller )
	StartMenuTitlePopup:setLeftRight( 0.5, 0.5, -1036.5, -169.5 )
	StartMenuTitlePopup:setTopBottom( 0, 0, 168.5, 387.5 )
	StartMenuTitlePopup.StartMenuTitleContainerLOC.StartMenu3dTitle.StartMenu3dTitleLabel.Label0:setText( Engine.Localize( "" ) )
	self:addElement( StartMenuTitlePopup )
	self.StartMenuTitlePopup = StartMenuTitlePopup
	
	local blackbkg = LUI.UIImage.new()
	blackbkg:setLeftRight( 0, 1, 0, 0 )
	blackbkg:setTopBottom( 0, 0, 296, 807 )
	blackbkg:setRGB( 0, 0, 0 )
	blackbkg:setAlpha( 0.75 )
	blackbkg:setImage( RegisterImage( "uie_t7_icon_master_overlays_bkg" ) )
	self:addElement( blackbkg )
	self.blackbkg = blackbkg
	
	local Smokebkg = LUI.UIImage.new()
	Smokebkg:setLeftRight( 0.5, 0.5, -960, 960 )
	Smokebkg:setTopBottom( 0, 0, 296, 807 )
	Smokebkg:setRGB( 0.63, 0.61, 0.61 )
	Smokebkg:setAlpha( 0.75 )
	Smokebkg:setImage( RegisterImage( "uie_t7_icon_master_overlays_bkg" ) )
	self:addElement( Smokebkg )
	self.Smokebkg = Smokebkg
	
	local alertStatusBar = CoD.systemOverlay_alertStatusBar.new( menu, controller )
	alertStatusBar:setLeftRight( 0, 1, 0, 0 )
	alertStatusBar:setTopBottom( 0, 0, 294, 300 )
	alertStatusBar:linkToElementModel( self, nil, false, function ( model )
		alertStatusBar:setModel( model, controller )
	end )
	self:addElement( alertStatusBar )
	self.alertStatusBar = alertStatusBar
	
	local CategoryListLineTopBottom0 = LUI.UIImage.new()
	CategoryListLineTopBottom0:setLeftRight( 0, 1, 0, 0 )
	CategoryListLineTopBottom0:setTopBottom( 0, 0, 799, 811 )
	CategoryListLineTopBottom0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLineTopBottom0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLineTopBottom0 )
	self.CategoryListLineTopBottom0 = CategoryListLineTopBottom0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.scorestreakVignetteContainer:close()
		self.FEButtonPanel:close()
		self.buttons:close()
		self.StartMenuTitlePopup:close()
		self.alertStatusBar:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

