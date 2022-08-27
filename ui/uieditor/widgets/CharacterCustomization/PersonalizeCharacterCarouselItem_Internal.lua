-- 6d35554ceaa1bf601ed58e15c12e987d
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Heroes.chooseCharacterVignette" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.CharacterCustomization.PersonalizeCharacterCarouselItem_InfoPanel" )

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
	self:setLeftRight( true, false, 0, 816 )
	self:setTopBottom( true, false, 0, 500 )
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background:linkToElementModel( self, "background", true, function ( model )
		local _background = Engine.GetModelValue( model )
		if _background then
			background:setImage( RegisterImage( _background ) )
		end
	end )
	self:addElement( background )
	self.background = background
	
	local chooseCharacterVignette = CoD.chooseCharacterVignette.new( menu, controller )
	chooseCharacterVignette:setLeftRight( true, true, 0, 0 )
	chooseCharacterVignette:setTopBottom( true, true, 0, 0 )
	chooseCharacterVignette.bottomRight:setRGB( 0, 0, 0 )
	chooseCharacterVignette.topRight:setRGB( 0, 0, 0 )
	self:addElement( chooseCharacterVignette )
	self.chooseCharacterVignette = chooseCharacterVignette
	
	local apeRender = LUI.UIImage.new()
	apeRender:setLeftRight( false, false, -46, 46 )
	apeRender:setTopBottom( false, false, -250, 250 )
	apeRender:setAlpha( 0 )
	apeRender:linkToElementModel( self, "personalizeRender", true, function ( model )
		local personalizeRender = Engine.GetModelValue( model )
		if personalizeRender then
			apeRender:setImage( RegisterImage( personalizeRender ) )
		end
	end )
	self:addElement( apeRender )
	self.apeRender = apeRender
	
	local ExtraCamLiveFeed = LUI.UIImage.new()
	ExtraCamLiveFeed:setLeftRight( false, false, -408, 408 )
	ExtraCamLiveFeed:setTopBottom( false, false, -250, 250 )
	ExtraCamLiveFeed:setAlpha( 0 )
	ExtraCamLiveFeed:setMaterial( LUI.UIImage.GetCachedMaterial( "extracam_2" ) )
	ExtraCamLiveFeed:setShaderVector( 0, 0, 0, 1, 1 )
	ExtraCamLiveFeed:setShaderVector( 1, 0, 0, 0, 0 )
	self:addElement( ExtraCamLiveFeed )
	self.ExtraCamLiveFeed = ExtraCamLiveFeed
	
	local Silhouette = LUI.UIImage.new()
	Silhouette:setLeftRight( false, false, 30.75, 312 )
	Silhouette:setTopBottom( false, false, -241.14, 241 )
	Silhouette:setImage( RegisterImage( "uie_t7_menu_mp_hero_tempimage" ) )
	self:addElement( Silhouette )
	self.Silhouette = Silhouette
	
	local CenteredSilhouette = LUI.UIImage.new()
	CenteredSilhouette:setLeftRight( false, false, -133.25, 148 )
	CenteredSilhouette:setTopBottom( false, false, -241.14, 241 )
	CenteredSilhouette:setAlpha( 0 )
	CenteredSilhouette:setImage( RegisterImage( "uie_t7_menu_mp_hero_tempimage" ) )
	self:addElement( CenteredSilhouette )
	self.CenteredSilhouette = CenteredSilhouette
	
	local heroNumber = LUI.UIText.new()
	heroNumber:setLeftRight( false, false, -45, 771 )
	heroNumber:setTopBottom( false, true, -30, -10 )
	heroNumber:setTTF( "fonts/default.ttf" )
	heroNumber:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	heroNumber:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	heroNumber:linkToElementModel( self, "count", true, function ( model )
		local count = Engine.GetModelValue( model )
		if count then
			heroNumber:setText( count )
		end
	end )
	self:addElement( heroNumber )
	self.heroNumber = heroNumber
	
	local lockImage = LUI.UIImage.new()
	lockImage:setLeftRight( false, false, -32, 32 )
	lockImage:setTopBottom( false, false, -32, 32 )
	lockImage:setAlpha( 0 )
	lockImage:setImage( RegisterImage( "uie_t7_hud_cac_lock_64" ) )
	self:addElement( lockImage )
	self.lockImage = lockImage
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, -2, 2 )
	FocusBarT:setTopBottom( true, false, 0, 4 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, -2, 2 )
	FocusBarB:setTopBottom( false, true, -4, 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local FETitleNumBrdr00 = CoD.FE_TitleNumBrdr.new( menu, controller )
	FETitleNumBrdr00:setLeftRight( true, true, 741, -14 )
	FETitleNumBrdr00:setTopBottom( false, false, 219, 241 )
	self:addElement( FETitleNumBrdr00 )
	self.FETitleNumBrdr00 = FETitleNumBrdr00
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, false, 702, 738 )
	Image2:setTopBottom( false, false, 218, 221.5 )
	Image2:setZRot( 180 )
	Image2:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 702, 738 )
	Image1:setTopBottom( false, false, 238.25, 241.75 )
	Image1:setZRot( 180 )
	Image1:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local infoPanel = CoD.PersonalizeCharacterCarouselItem_InfoPanel.new( menu, controller )
	infoPanel:setLeftRight( true, false, 10, 291 )
	infoPanel:setTopBottom( true, false, 10, 485.75 )
	infoPanel:linkToElementModel( self, nil, false, function ( model )
		infoPanel:setModel( model, controller )
	end )
	self:addElement( infoPanel )
	self.infoPanel = infoPanel
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.chooseCharacterVignette:close()
		element.FocusBarT:close()
		element.FocusBarB:close()
		element.FETitleNumBrdr00:close()
		element.infoPanel:close()
		element.background:close()
		element.apeRender:close()
		element.heroNumber:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

