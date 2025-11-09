require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FeaturedFrame" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ListHeader" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FeaturedSubHeader" )
require( "ui.uieditor.widgets.Lobby.Common.FE_LabelSubHeadingCcontainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_LabelBodyA" )

CoD.FE_Featured = InheritFrom( LUI.UIElement )
CoD.FE_Featured.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_Featured )
	self.id = "FE_Featured"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 442 )
	self:setTopBottom( true, false, 0, 138 )
	self.anyChildUsesUpdateState = true
	
	local panel = CoD.FE_ButtonPanelShaderContainer.new( menu, controller )
	panel:setLeftRight( true, true, 28, -47 )
	panel:setTopBottom( false, false, -42, 44 )
	panel:setRGB( 0.5, 0.5, 0.5 )
	panel.FEButtonPanel:setShaderVector( 0, 24.98, 25, 0, 0 )
	self:addElement( panel )
	self.panel = panel
	
	local FEFeaturedFrame0 = CoD.FE_FeaturedFrame.new( menu, controller )
	FEFeaturedFrame0:setLeftRight( true, false, 28, 395 )
	FEFeaturedFrame0:setTopBottom( true, false, 27, 112 )
	FEFeaturedFrame0:setRGB( 1, 1, 1 )
	FEFeaturedFrame0:setAlpha( 0.58 )
	self:addElement( FEFeaturedFrame0 )
	self.FEFeaturedFrame0 = FEFeaturedFrame0
	
	local emblemline = LUI.UIImage.new()
	emblemline:setLeftRight( true, false, 111, 115 )
	emblemline:setTopBottom( true, false, 26, 114 )
	emblemline:setRGB( 1, 1, 1 )
	emblemline:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	emblemline:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( emblemline )
	self.emblemline = emblemline
	
	local emblempanel = LUI.UIImage.new()
	emblempanel:setLeftRight( true, false, 27, 115 )
	emblempanel:setTopBottom( true, false, 25.52, 113.52 )
	emblempanel:setRGB( 0, 0, 0 )
	emblempanel:setAlpha( 0.59 )
	emblempanel:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblempanel" ) )
	emblempanel:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( emblempanel )
	self.emblempanel = emblempanel
	
	local featuredgradient = LUI.UIImage.new()
	featuredgradient:setLeftRight( true, false, 27, 396 )
	featuredgradient:setTopBottom( true, false, 25.52, 113.52 )
	featuredgradient:setRGB( 1, 1, 1 )
	featuredgradient:setImage( RegisterImage( "uie_t7_menu_frontend_featuredgradient" ) )
	featuredgradient:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( featuredgradient )
	self.featuredgradient = featuredgradient
	
	local featlineleft = LUI.UIImage.new()
	featlineleft:setLeftRight( true, false, 174, 178 )
	featlineleft:setTopBottom( true, false, 24, 120 )
	featlineleft:setRGB( 1, 1, 1 )
	featlineleft:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	featlineleft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( featlineleft )
	self.featlineleft = featlineleft
	
	local emblem = LUI.UIImage.new()
	emblem:setLeftRight( true, false, 27, 115 )
	emblem:setTopBottom( true, false, 25.52, 113.52 )
	emblem:setRGB( 1, 1, 1 )
	emblem:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblem" ) )
	emblem:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( emblem )
	self.emblem = emblem
	
	local featlineright = LUI.UIImage.new()
	featlineright:setLeftRight( true, false, 327, 331 )
	featlineright:setTopBottom( true, false, 24, 120 )
	featlineright:setRGB( 1, 1, 1 )
	featlineright:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	featlineright:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( featlineright )
	self.featlineright = featlineright
	
	local diagsleft = LUI.UIImage.new()
	diagsleft:setLeftRight( true, false, 110, 256 )
	diagsleft:setTopBottom( true, false, 25, 113 )
	diagsleft:setRGB( 1, 1, 1 )
	diagsleft:setImage( RegisterImage( "uie_t7_menu_frontend_featuredcross" ) )
	diagsleft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( diagsleft )
	self.diagsleft = diagsleft
	
	local diagsright = LUI.UIImage.new()
	diagsright:setLeftRight( true, false, 256, 395 )
	diagsright:setTopBottom( true, false, 25, 113 )
	diagsright:setRGB( 1, 1, 1 )
	diagsright:setYRot( -180 )
	diagsright:setImage( RegisterImage( "uie_t7_menu_frontend_featuredcross" ) )
	diagsright:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( diagsright )
	self.diagsright = diagsright
	
	local pixelUR = LUI.UIImage.new()
	pixelUR:setLeftRight( false, true, -54, -18 )
	pixelUR:setTopBottom( false, false, -43.5, -40 )
	pixelUR:setRGB( 1, 1, 1 )
	pixelUR:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelUR:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( pixelUR )
	self.pixelUR = pixelUR
	
	local pixelLR = LUI.UIImage.new()
	pixelLR:setLeftRight( false, true, -54, -18 )
	pixelLR:setTopBottom( false, false, 41.5, 45 )
	pixelLR:setRGB( 1, 1, 1 )
	pixelLR:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelLR:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( pixelLR )
	self.pixelLR = pixelLR
	
	local FEListHeader0 = CoD.FE_ListHeader.new( menu, controller )
	FEListHeader0:setLeftRight( true, false, 28, 145 )
	FEListHeader0:setTopBottom( true, false, 0, 27 )
	FEListHeader0:setRGB( 1, 1, 1 )
	FEListHeader0.btnDisplayTextStroke:setText( Engine.Localize( "FEATURED" ) )
	self:addElement( FEListHeader0 )
	self.FEListHeader0 = FEListHeader0
	
	local FEFeaturedSubHeader0 = CoD.FE_FeaturedSubHeader.new( menu, controller )
	FEFeaturedSubHeader0:setLeftRight( true, false, 26, 152 )
	FEFeaturedSubHeader0:setTopBottom( true, false, 110, 138 )
	FEFeaturedSubHeader0:setRGB( 1, 1, 1 )
	self:addElement( FEFeaturedSubHeader0 )
	self.FEFeaturedSubHeader0 = FEFeaturedSubHeader0
	
	local pixelUL = LUI.UIImage.new()
	pixelUL:setLeftRight( true, false, 3, 31 )
	pixelUL:setTopBottom( false, false, -43, -39 )
	pixelUL:setRGB( 1, 1, 1 )
	pixelUL:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	pixelUL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelUL )
	self.pixelUL = pixelUL
	
	local pixelLL = LUI.UIImage.new()
	pixelLL:setLeftRight( true, false, 3, 31 )
	pixelLL:setTopBottom( false, false, 40, 44 )
	pixelLL:setRGB( 1, 1, 1 )
	pixelLL:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	pixelLL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelLL )
	self.pixelLL = pixelLL
	
	local pixelMiddle = LUI.UIImage.new()
	pixelMiddle:setLeftRight( true, false, 0, 32 )
	pixelMiddle:setTopBottom( true, false, 43, 95 )
	pixelMiddle:setRGB( 1, 1, 1 )
	pixelMiddle:setZoom( 10 )
	pixelMiddle:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelb" ) )
	pixelMiddle:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelMiddle )
	self.pixelMiddle = pixelMiddle
	
	local emblemline0 = LUI.UIImage.new()
	emblemline0:setLeftRight( true, false, 399, 403 )
	emblemline0:setTopBottom( true, false, 26, 114 )
	emblemline0:setRGB( 1, 1, 1 )
	emblemline0:setAlpha( 0.25 )
	emblemline0:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	emblemline0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( emblemline0 )
	self.emblemline0 = emblemline0
	
	local FELabelSubHeadingCcontainer0 = CoD.FE_LabelSubHeadingCcontainer.new( menu, controller )
	FELabelSubHeadingCcontainer0:setLeftRight( true, false, 128.11, 338.11 )
	FELabelSubHeadingCcontainer0:setTopBottom( true, false, 41, 78 )
	FELabelSubHeadingCcontainer0:setRGB( 1, 1, 1 )
	FELabelSubHeadingCcontainer0.FELabelSubHeadingC0.TextBox2:setRGB( 0.84, 0.86, 0.87 )
	FELabelSubHeadingCcontainer0.FELabelSubHeadingC0.TextBox2:setText( Engine.Localize( "ZombieSlashers" ) )
	FELabelSubHeadingCcontainer0.FELabelSubHeadingC0.TextBox2:setTTF( "fonts/Entovo.ttf" )
	self:addElement( FELabelSubHeadingCcontainer0 )
	self.FELabelSubHeadingCcontainer0 = FELabelSubHeadingCcontainer0
	
	local FELabelBodyA0 = CoD.FE_LabelBodyA.new( menu, controller )
	FELabelBodyA0:setLeftRight( true, false, 139, 244 )
	FELabelBodyA0:setTopBottom( true, false, 78, 98 )
	FELabelBodyA0:setRGB( 1, 1, 1 )
	FELabelBodyA0:setAlpha( 0.96 )
	FELabelBodyA0.TextBox0:setRGB( 0.65, 0.97, 1 )
	FELabelBodyA0.TextBox0:setText( Engine.Localize( "3 Playing" ) )
	FELabelBodyA0.TextBox0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	FELabelBodyA0.TextBox0:setLetterSpacing( 1 )
	self:addElement( FELabelBodyA0 )
	self.FELabelBodyA0 = FELabelBodyA0
	
	self.close = function ( self )
		self.panel:close()
		self.FEFeaturedFrame0:close()
		self.FEListHeader0:close()
		self.FEFeaturedSubHeader0:close()
		self.FELabelSubHeadingCcontainer0:close()
		self.FELabelBodyA0:close()
		CoD.FE_Featured.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

