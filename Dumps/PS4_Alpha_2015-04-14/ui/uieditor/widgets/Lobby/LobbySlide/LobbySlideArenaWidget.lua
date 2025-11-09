require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ListHeader" )
require( "ui.uieditor.widgets.Lobby.Common.FE_SlideSubHeader" )
require( "ui.uieditor.widgets.Arena.ArenaRankSmall" )

CoD.LobbySlideArenaWidget = InheritFrom( LUI.UIElement )
CoD.LobbySlideArenaWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LobbySlideArenaWidget )
	self.id = "LobbySlideArenaWidget"
	self.soundSet = "ModeSelection"
	self:setLeftRight( true, false, 0, 320 )
	self:setTopBottom( true, false, 0, 90 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local ImagePanel = CoD.FE_ButtonPanelShaderContainer.new( menu, controller )
	ImagePanel:setLeftRight( true, false, 0, 92 )
	ImagePanel:setTopBottom( true, false, 0, 91 )
	ImagePanel:setRGB( 0.5, 0.5, 0.5 )
	ImagePanel:setZoom( -10 )
	self:addElement( ImagePanel )
	self.ImagePanel = ImagePanel
	
	local pixelA = LUI.UIImage.new()
	pixelA:setLeftRight( true, false, 315, 351 )
	pixelA:setTopBottom( true, false, -1, 2.5 )
	pixelA:setRGB( 1, 1, 1 )
	pixelA:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelA:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( pixelA )
	self.pixelA = pixelA
	
	local pixelA0 = LUI.UIImage.new()
	pixelA0:setLeftRight( true, false, 315, 351 )
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
	self:addElement( ImageX )
	self.ImageX = ImageX
	
	local ImageBorder = CoD.FE_TitleNumBrdr.new( menu, controller )
	ImageBorder:setLeftRight( true, false, 0, 92 )
	ImageBorder:setTopBottom( true, false, 0, 91 )
	ImageBorder:setRGB( 1, 1, 1 )
	self:addElement( ImageBorder )
	self.ImageBorder = ImageBorder
	
	local ListHeader = CoD.FE_ListHeader.new( menu, controller )
	ListHeader:setLeftRight( true, false, 107.9, 275.9 )
	ListHeader:setTopBottom( true, false, 12.88, 40.88 )
	ListHeader:setRGB( 1, 1, 1 )
	ListHeader:setAlpha( 0 )
	ListHeader.btnDisplayTextStroke:setText( Engine.Localize( "ALL TIME HIGH" ) )
	self:addElement( ListHeader )
	self.ListHeader = ListHeader
	
	local SlideSubHeader = CoD.FE_SlideSubHeader.new( menu, controller )
	SlideSubHeader:setLeftRight( true, false, 107.9, 152.9 )
	SlideSubHeader:setTopBottom( true, false, 45, 81 )
	SlideSubHeader:setRGB( 1, 1, 1 )
	SlideSubHeader:setAlpha( 0 )
	SlideSubHeader.FELabelSubHeadingD0.Label0:setRGB( 0.58, 0.64, 0.65 )
	SlideSubHeader:subscribeToGlobalModel( controller, "ArenaRank", "level", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			SlideSubHeader.FELabelSubHeadingD0.Label0:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( SlideSubHeader )
	self.SlideSubHeader = SlideSubHeader
	
	local ArenaRankSolid = CoD.ArenaRankSmall.new( menu, controller )
	ArenaRankSolid:setLeftRight( true, false, -2, 108 )
	ArenaRankSolid:setTopBottom( true, false, 2, 92 )
	ArenaRankSolid:setRGB( 0, 0, 0 )
	ArenaRankSolid:setAlpha( 0 )
	ArenaRankSolid:setZoom( -5 )
	ArenaRankSolid:subscribeToGlobalModel( controller, "ArenaRank", nil, function ( model )
		ArenaRankSolid:setModel( model, controller )
	end )
	self:addElement( ArenaRankSolid )
	self.ArenaRankSolid = ArenaRankSolid
	
	local ArenaRankAdd = CoD.ArenaRankSmall.new( menu, controller )
	ArenaRankAdd:setLeftRight( true, false, -2, 108 )
	ArenaRankAdd:setTopBottom( true, false, 2, 92 )
	ArenaRankAdd:setRGB( 1, 1, 1 )
	ArenaRankAdd:setAlpha( 0 )
	ArenaRankAdd:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	ArenaRankAdd:setShaderVector( 0, 0.05, 0.5, 0, 0 )
	ArenaRankAdd:setShaderVector( 1, 0, 0, 0, 0 )
	ArenaRankAdd:setShaderVector( 2, 0, 0, 0, 0 )
	ArenaRankAdd:setShaderVector( 3, 0, 0, 0, 0 )
	ArenaRankAdd:setShaderVector( 4, 0, 0, 0, 0 )
	ArenaRankAdd:subscribeToGlobalModel( controller, "ArenaRank", nil, function ( model )
		ArenaRankAdd:setModel( model, controller )
	end )
	self:addElement( ArenaRankAdd )
	self.ArenaRankAdd = ArenaRankAdd
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, -6, 10 )
	Image0:setTopBottom( true, false, -16, -4 )
	Image0:setRGB( 1, 1, 1 )
	Image0:setImage( RegisterImage( "uie_t7_menu_frontend_buttonsseparate" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				ImageX:completeAnimation()
				self.ImageX:setAlpha( 1 )
				self.clipFinished( ImageX, {} )
				ListHeader:completeAnimation()
				self.ListHeader:setAlpha( 0 )
				self.clipFinished( ListHeader, {} )
				SlideSubHeader:completeAnimation()
				self.SlideSubHeader:setAlpha( 0 )
				self.clipFinished( SlideSubHeader, {} )
				ArenaRankSolid:completeAnimation()
				self.ArenaRankSolid:setAlpha( 0 )
				self.clipFinished( ArenaRankSolid, {} )
				ArenaRankAdd:completeAnimation()
				self.ArenaRankAdd:setAlpha( 0 )
				self.clipFinished( ArenaRankAdd, {} )
			end
		},
		Active = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				ImageX:completeAnimation()
				self.ImageX:setAlpha( 0 )
				self.clipFinished( ImageX, {} )
				ListHeader:completeAnimation()
				self.ListHeader:setAlpha( 1 )
				self.clipFinished( ListHeader, {} )
				SlideSubHeader:completeAnimation()
				self.SlideSubHeader:setAlpha( 1 )
				self.clipFinished( SlideSubHeader, {} )
				ArenaRankSolid:completeAnimation()
				self.ArenaRankSolid:setAlpha( 0.3 )
				self.clipFinished( ArenaRankSolid, {} )
				ArenaRankAdd:completeAnimation()
				self.ArenaRankAdd:setAlpha( 1 )
				self.clipFinished( ArenaRankAdd, {} )
			end
		}
	}
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.ImagePanel:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.ImagePanel:close()
		self.ImageBorder:close()
		self.ListHeader:close()
		self.SlideSubHeader:close()
		self.ArenaRankSolid:close()
		self.ArenaRankAdd:close()
		CoD.LobbySlideArenaWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

