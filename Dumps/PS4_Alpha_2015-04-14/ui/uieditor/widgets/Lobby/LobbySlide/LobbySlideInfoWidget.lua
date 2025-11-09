require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ImageA" )
require( "ui.uieditor.widgets.Lobby.Common.FE_SlideSubHeader" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ListHeader" )

CoD.LobbySlideInfoWidget = InheritFrom( LUI.UIElement )
CoD.LobbySlideInfoWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LobbySlideInfoWidget )
	self.id = "LobbySlideInfoWidget"
	self.soundSet = "ModeSelection"
	self:setLeftRight( true, false, 0, 320 )
	self:setTopBottom( true, false, 0, 90 )
	self.anyChildUsesUpdateState = true
	
	local ImagePanel = CoD.FE_ButtonPanelShaderContainer.new( menu, controller )
	ImagePanel:setLeftRight( true, false, 0, 92 )
	ImagePanel:setTopBottom( true, false, 0, 91 )
	ImagePanel:setRGB( 0.5, 0.5, 0.5 )
	ImagePanel:setZoom( -10 )
	ImagePanel.FEButtonPanel:setShaderVector( 0, 24.98, 25, 0, 0 )
	self:addElement( ImagePanel )
	self.ImagePanel = ImagePanel
	
	local pixelA = LUI.UIImage.new()
	pixelA:setLeftRight( true, false, 313, 349 )
	pixelA:setTopBottom( true, false, -1, 2.5 )
	pixelA:setRGB( 1, 1, 1 )
	pixelA:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelA:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( pixelA )
	self.pixelA = pixelA
	
	local pixelA0 = LUI.UIImage.new()
	pixelA0:setLeftRight( true, false, 313, 349 )
	pixelA0:setTopBottom( true, false, 89, 92.5 )
	pixelA0:setRGB( 1, 1, 1 )
	pixelA0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelA0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( pixelA0 )
	self.pixelA0 = pixelA0
	
	local LineT = LUI.UIImage.new()
	LineT:setLeftRight( true, false, 92, 328 )
	LineT:setTopBottom( true, false, -1, 3 )
	LineT:setRGB( 1, 1, 1 )
	LineT:setImage( RegisterImage( "uie_t7_menu_frontend_slidelineblur" ) )
	LineT:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineT )
	self.LineT = LineT
	
	local LineB = LUI.UIImage.new()
	LineB:setLeftRight( true, false, 92, 328 )
	LineB:setTopBottom( true, false, 89, 93 )
	LineB:setRGB( 1, 1, 1 )
	LineB:setImage( RegisterImage( "uie_t7_menu_frontend_slidelineblur" ) )
	LineB:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineB )
	self.LineB = LineB
	
	local ImageX = LUI.UIImage.new()
	ImageX:setLeftRight( true, false, -2, 94 )
	ImageX:setTopBottom( true, false, -2, 94 )
	ImageX:setRGB( 1, 1, 1 )
	ImageX:setImage( RegisterImage( "uie_t7_menu_frontend_slidex" ) )
	ImageX:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	ImageX:linkToElementModel( self, "rankIcon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ImageX:setAlpha( HideIfNotEmptyString( modelValue ) )
		end
	end )
	self:addElement( ImageX )
	self.ImageX = ImageX
	
	local ImageBorder = CoD.FE_TitleNumBrdr.new( menu, controller )
	ImageBorder:setLeftRight( true, false, 0, 92 )
	ImageBorder:setTopBottom( true, false, 0, 91 )
	ImageBorder:setRGB( 1, 1, 1 )
	self:addElement( ImageBorder )
	self.ImageBorder = ImageBorder
	
	local rankIcon = CoD.FE_ImageA.new( menu, controller )
	rankIcon:setLeftRight( true, false, 4, 88 )
	rankIcon:setTopBottom( true, false, 3, 87 )
	rankIcon:setRGB( 1, 1, 1 )
	rankIcon:linkToElementModel( self, "rankIcon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankIcon:setAlpha( HideIfEmptyString( modelValue ) )
		end
	end )
	rankIcon:linkToElementModel( self, "rankIcon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankIcon.imgSolid:setImage( RegisterImage( AppendString( modelValue, "_lrg" ) ) )
		end
	end )
	rankIcon:linkToElementModel( self, "rankIcon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankIcon.imgAdd:setImage( RegisterImage( AppendString( modelValue, "_lrg" ) ) )
		end
	end )
	self:addElement( rankIcon )
	self.rankIcon = rankIcon
	
	local rankText = CoD.FE_SlideSubHeader.new( menu, controller )
	rankText:setLeftRight( true, false, 107.9, 236.9 )
	rankText:setTopBottom( true, false, 45, 81 )
	rankText:setRGB( 1, 1, 1 )
	rankText.FELabelSubHeadingD0.Label0:setRGB( 0.58, 0.64, 0.65 )
	rankText:linkToElementModel( self, "rank", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankText:setAlpha( HideIfEmptyString( modelValue ) )
		end
	end )
	rankText:linkToElementModel( self, "rank", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankText.FELabelSubHeadingD0.Label0:setText( Engine.Localize( PrependLocalizedStringWithSeparator( modelValue, "MENU_LEVEL_CAPS", " " ) ) )
		end
	end )
	self:addElement( rankText )
	self.rankText = rankText
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, -6, 10 )
	Image0:setTopBottom( true, false, -16, -4 )
	Image0:setRGB( 1, 1, 1 )
	Image0:setImage( RegisterImage( "uie_t7_menu_frontend_buttonsseparate" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local ListHeader0 = CoD.FE_ListHeader.new( menu, controller )
	ListHeader0:setLeftRight( true, false, 107.9, 313 )
	ListHeader0:setTopBottom( true, false, 12.88, 40.88 )
	ListHeader0:setRGB( 1, 1, 1 )
	ListHeader0:linkToElementModel( self, "rankString", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ListHeader0.btnDisplayTextStroke:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( ListHeader0 )
	self.ListHeader0 = ListHeader0
	
	self.ListHeader0:linkToElementModel( self, "rankString", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ListHeader0:setAlpha( HideIfEmptyString( modelValue ) )
		end
	end )
	self.close = function ( self )
		self.ImagePanel:close()
		self.ImageBorder:close()
		self.rankIcon:close()
		self.rankText:close()
		self.ListHeader0:close()
		self.ImageX:close()
		CoD.LobbySlideInfoWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

