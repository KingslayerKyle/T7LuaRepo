require( "ui.uieditor.widgets.CharacterCustomization.PersonalizeCharacterCarouselItem_InfoPanel" )
require( "ui.uieditor.widgets.Heroes.chooseCharacterVignette" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )

CoD.PersonalizeCharacterCarouselItem_Internal = InheritFrom( LUI.UIElement )
CoD.PersonalizeCharacterCarouselItem_Internal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.PersonalizeCharacterCarouselItem_Internal )
	self.id = "PersonalizeCharacterCarouselItem_Internal"
	self.soundSet = "none"
	self:setLeftRight( 0, 0, 0, 1224 )
	self:setTopBottom( 0, 0, 0, 750 )
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( 0, 1, 0, 0 )
	background:setTopBottom( 0, 1, 0, 0 )
	background:setImage( RegisterImage( "uie_t7_menu_mp_hero_background_generic" ) )
	self:addElement( background )
	self.background = background
	
	local chooseCharacterVignette = CoD.chooseCharacterVignette.new( menu, controller )
	chooseCharacterVignette:setLeftRight( 0, 1, 0, 0 )
	chooseCharacterVignette:setTopBottom( 0, 1, 0, 0 )
	chooseCharacterVignette.bottomRight:setRGB( 0, 0, 0 )
	chooseCharacterVignette.topRight:setRGB( 0, 0, 0 )
	self:addElement( chooseCharacterVignette )
	self.chooseCharacterVignette = chooseCharacterVignette
	
	local apeRender = LUI.UIImage.new()
	apeRender:setLeftRight( 0.5, 0.5, -69, 69 )
	apeRender:setTopBottom( 0.5, 0.5, -375, 375 )
	apeRender:setAlpha( 0 )
	self:addElement( apeRender )
	self.apeRender = apeRender
	
	local ExtraCamLiveFeed = LUI.UIImage.new()
	ExtraCamLiveFeed:setLeftRight( 0.5, 0.5, -612, 612 )
	ExtraCamLiveFeed:setTopBottom( 0.5, 0.5, -375, 375 )
	ExtraCamLiveFeed:setAlpha( 0 )
	ExtraCamLiveFeed:setMaterial( LUI.UIImage.GetCachedMaterial( "extracam_4" ) )
	ExtraCamLiveFeed:setShaderVector( 0, 0, 0, 1, 1 )
	ExtraCamLiveFeed:setShaderVector( 1, 0, 0, 0, 0 )
	self:addElement( ExtraCamLiveFeed )
	self.ExtraCamLiveFeed = ExtraCamLiveFeed
	
	local Silhouette = LUI.UIImage.new()
	Silhouette:setLeftRight( 0.5, 0.5, 46, 468 )
	Silhouette:setTopBottom( 0.5, 0.5, -362, 361 )
	Silhouette:setImage( RegisterImage( "uie_t7_menu_mp_hero_tempimage" ) )
	self:addElement( Silhouette )
	self.Silhouette = Silhouette
	
	local CenteredSilhouette = LUI.UIImage.new()
	CenteredSilhouette:setLeftRight( 0.5, 0.5, -200, 222 )
	CenteredSilhouette:setTopBottom( 0.5, 0.5, -362, 361 )
	CenteredSilhouette:setAlpha( 0 )
	CenteredSilhouette:setImage( RegisterImage( "uie_t7_menu_mp_hero_tempimage" ) )
	self:addElement( CenteredSilhouette )
	self.CenteredSilhouette = CenteredSilhouette
	
	local heroNumber = LUI.UIText.new()
	heroNumber:setLeftRight( 0.5, 0.5, -68, 1156 )
	heroNumber:setTopBottom( 1, 1, -45, -15 )
	heroNumber:setTTF( "fonts/default.ttf" )
	heroNumber:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	heroNumber:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	heroNumber:linkToElementModel( self, "count", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			heroNumber:setText( modelValue )
		end
	end )
	self:addElement( heroNumber )
	self.heroNumber = heroNumber
	
	local lockImage = LUI.UIImage.new()
	lockImage:setLeftRight( 0.5, 0.5, -48, 48 )
	lockImage:setTopBottom( 0.5, 0.5, -48, 48 )
	lockImage:setAlpha( 0 )
	lockImage:setImage( RegisterImage( "t7_hud_cac_lock_64" ) )
	self:addElement( lockImage )
	self.lockImage = lockImage
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( 0, 1, -3, 3 )
	FocusBarT:setTopBottom( 0, 0, 0, 6 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( 0, 1, -3, 3 )
	FocusBarB:setTopBottom( 1, 1, -6, 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local FETitleNumBrdr00 = CoD.FE_TitleNumBrdr.new( menu, controller )
	FETitleNumBrdr00:setLeftRight( 0, 1, 1111, -21 )
	FETitleNumBrdr00:setTopBottom( 0.5, 0.5, 328.5, 361.5 )
	self:addElement( FETitleNumBrdr00 )
	self.FETitleNumBrdr00 = FETitleNumBrdr00
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( 0, 0, 1053, 1107 )
	Image2:setTopBottom( 0.5, 0.5, 327, 332 )
	Image2:setZRot( 180 )
	Image2:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( 0, 0, 1053, 1107 )
	Image1:setTopBottom( 0.5, 0.5, 357, 362 )
	Image1:setZRot( 180 )
	Image1:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local infoPanel = CoD.PersonalizeCharacterCarouselItem_InfoPanel.new( menu, controller )
	infoPanel:setLeftRight( 0, 0, 15, 437 )
	infoPanel:setTopBottom( 0, 0, 15, 729 )
	infoPanel:linkToElementModel( self, nil, false, function ( model )
		infoPanel:setModel( model, controller )
	end )
	self:addElement( infoPanel )
	self.infoPanel = infoPanel
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.chooseCharacterVignette:close()
		self.FocusBarT:close()
		self.FocusBarB:close()
		self.FETitleNumBrdr00:close()
		self.infoPanel:close()
		self.heroNumber:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

