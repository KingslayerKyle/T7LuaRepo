require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.Arena.ArenaRankSmall" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ListHeader" )
require( "ui.uieditor.widgets.Arena.ArenaStar" )
require( "ui.uieditor.widgets.Lobby.Common.FE_SlideSubHeader" )
require( "ui.uieditor.widgets.Lobby.LobbySlide.LobbySlideArenaMasterPowerRating" )

local PreLoadFunc = function ( self, controller )
	local f1_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "Arena" )
	local f1_local1 = Engine.CreateModel( f1_local0, "selectedPlayerPoints" )
	local f1_local2 = Engine.CreateModel( f1_local0, "selectedPlayerSkill" )
	Engine.SetModelValue( f1_local1, 0 )
	Engine.SetModelValue( f1_local2, 0 )
end

local PostLoadFunc = function ( self, controller, menu )
	local f2_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "Arena" )
	local f2_local1 = Engine.CreateModel( f2_local0, "selectedPlayerPoints" )
	local f2_local2 = Engine.CreateModel( f2_local0, "selectedPlayerSkill" )
	self.Stars:linkToElementModel( self, "arenaPoints", true, function ( model )
		if model then
			Engine.SetModelValue( f2_local1, Engine.GetModelValue( model ) )
		end
	end )
	self.Stars:linkToElementModel( self, "arenaSkill", true, function ( model )
		if model then
			Engine.SetModelValue( f2_local2, Engine.GetModelValue( model ) )
		end
	end )
end

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
	ImagePanel:setTopBottom( true, false, 11, 102 )
	ImagePanel:setRGB( 0.5, 0.5, 0.5 )
	ImagePanel:setZoom( -10 )
	self:addElement( ImagePanel )
	self.ImagePanel = ImagePanel
	
	local TickTR = LUI.UIImage.new()
	TickTR:setLeftRight( true, false, 313, 349 )
	TickTR:setTopBottom( true, false, 10, 13.5 )
	TickTR:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	TickTR:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( TickTR )
	self.TickTR = TickTR
	
	local TickBR = LUI.UIImage.new()
	TickBR:setLeftRight( true, false, 313, 349 )
	TickBR:setTopBottom( true, false, 100, 103.5 )
	TickBR:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	TickBR:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( TickBR )
	self.TickBR = TickBR
	
	local LineT = LUI.UIImage.new()
	LineT:setLeftRight( true, false, 92, 328 )
	LineT:setTopBottom( true, false, 10, 14 )
	LineT:setImage( RegisterImage( "uie_t7_menu_frontend_slidelineblur" ) )
	LineT:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineT )
	self.LineT = LineT
	
	local LineB = LUI.UIImage.new()
	LineB:setLeftRight( true, false, 92, 328 )
	LineB:setTopBottom( true, false, 100, 104 )
	LineB:setImage( RegisterImage( "uie_t7_menu_frontend_slidelineblur" ) )
	LineB:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineB )
	self.LineB = LineB
	
	local ImageX = LUI.UIImage.new()
	ImageX:setLeftRight( true, false, -2, 94 )
	ImageX:setTopBottom( true, false, 9, 105 )
	ImageX:setAlpha( 0 )
	ImageX:setImage( RegisterImage( "uie_t7_menu_frontend_slidex" ) )
	ImageX:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ImageX )
	self.ImageX = ImageX
	
	local ImageBorder = CoD.FE_TitleNumBrdr.new( menu, controller )
	ImageBorder:setLeftRight( true, false, 0, 92 )
	ImageBorder:setTopBottom( true, false, 11, 102 )
	self:addElement( ImageBorder )
	self.ImageBorder = ImageBorder
	
	local ArenaRankSolid = CoD.ArenaRankSmall.new( menu, controller )
	ArenaRankSolid:setLeftRight( true, false, 6, 86 )
	ArenaRankSolid:setTopBottom( true, false, 16, 96 )
	ArenaRankSolid:setRGB( 0, 0, 0 )
	ArenaRankSolid:setAlpha( 0.3 )
	ArenaRankSolid:setZoom( -5 )
	self:addElement( ArenaRankSolid )
	self.ArenaRankSolid = ArenaRankSolid
	
	local ArenaRankAdd = CoD.ArenaRankSmall.new( menu, controller )
	ArenaRankAdd:setLeftRight( true, false, 6, 86 )
	ArenaRankAdd:setTopBottom( true, false, 16, 96 )
	ArenaRankAdd:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	ArenaRankAdd:setShaderVector( 0, 0.05, 0.5, 0, 0 )
	ArenaRankAdd:setShaderVector( 1, 0, 0, 0, 0 )
	ArenaRankAdd:setShaderVector( 2, 0, 0, 0, 0 )
	ArenaRankAdd:setShaderVector( 3, 0, 0, 0, 0 )
	ArenaRankAdd:setShaderVector( 4, 0, 0, 0, 0 )
	ArenaRankAdd:linkToElementModel( self, "arenaPoints", true, function ( model )
		local arenaPoints = Engine.GetModelValue( model )
		if arenaPoints then
			ArenaRankAdd.rankIcon:setImage( RegisterImage( GetArenaRankIconLG( arenaPoints ) ) )
		end
	end )
	self:addElement( ArenaRankAdd )
	self.ArenaRankAdd = ArenaRankAdd
	
	local TickTL = LUI.UIImage.new()
	TickTL:setLeftRight( true, false, -6, 10 )
	TickTL:setTopBottom( true, false, -5, 7 )
	TickTL:setImage( RegisterImage( "uie_t7_menu_frontend_buttonsseparate" ) )
	TickTL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TickTL )
	self.TickTL = TickTL
	
	local pixelU0 = LUI.UIImage.new()
	pixelU0:setLeftRight( false, true, -349, -313 )
	pixelU0:setTopBottom( false, false, -35.75, -32.25 )
	pixelU0:setZRot( 180 )
	pixelU0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelU0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( pixelU0 )
	self.pixelU0 = pixelU0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( false, true, -349, -313 )
	Image1:setTopBottom( false, false, 55, 58.5 )
	Image1:setZRot( 180 )
	Image1:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local ListHeader = CoD.FE_ListHeader.new( menu, controller )
	ListHeader:setLeftRight( true, false, 101.9, 269.9 )
	ListHeader:setTopBottom( true, false, 16, 44 )
	ListHeader.btnDisplayTextStroke:setShaderVector( 0, 0.06, 0, 0, 0 )
	ListHeader.btnDisplayTextStroke:setShaderVector( 1, 0.02, 0, 0, 0 )
	ListHeader.btnDisplayTextStroke:setShaderVector( 2, 1, 0, 0, 0 )
	ListHeader:subscribeToGlobalModel( controller, "LobbyPlaylistName", "name", function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			ListHeader.btnDisplayTextStroke:setText( Engine.Localize( name ) )
		end
	end )
	self:addElement( ListHeader )
	self.ListHeader = ListHeader
	
	local Stars = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	Stars:makeFocusable()
	Stars:setLeftRight( true, false, 98.9, 252.9 )
	Stars:setTopBottom( true, false, 77.12, 101.12 )
	Stars:setWidgetType( CoD.ArenaStar )
	Stars:setHorizontalCount( 6 )
	Stars:setDataSource( "ArenaInspectionStars" )
	self:addElement( Stars )
	self.Stars = Stars
	
	local rankText = CoD.FE_SlideSubHeader.new( menu, controller )
	rankText:setLeftRight( true, false, 101.9, 249 )
	rankText:setTopBottom( true, false, 47, 79.12 )
	rankText:linkToElementModel( self, "rank", true, function ( model )
		local rank = Engine.GetModelValue( model )
		if rank then
			rankText:setAlpha( HideIfEmptyString( rank ) )
		end
	end )
	rankText:linkToElementModel( self, "arenaPoints", true, function ( model )
		local arenaPoints = Engine.GetModelValue( model )
		if arenaPoints then
			rankText.FELabelSubHeadingD0.Label0:setText( LocalizeToUpperString( GetArenaRankName( arenaPoints ) ) )
		end
	end )
	self:addElement( rankText )
	self.rankText = rankText
	
	local LobbySlideArenaMasterPowerRating = CoD.LobbySlideArenaMasterPowerRating.new( menu, controller )
	LobbySlideArenaMasterPowerRating:setLeftRight( true, false, 101.9, 320 )
	LobbySlideArenaMasterPowerRating:setTopBottom( true, false, 79, 103 )
	LobbySlideArenaMasterPowerRating:linkToElementModel( self, nil, false, function ( model )
		LobbySlideArenaMasterPowerRating:setModel( model, controller )
	end )
	self:addElement( LobbySlideArenaMasterPowerRating )
	self.LobbySlideArenaMasterPowerRating = LobbySlideArenaMasterPowerRating
	
	self.ArenaRankSolid:linkToElementModel( self, "arenaPoints", true, function ( model )
		local arenaPoints = Engine.GetModelValue( model )
		if arenaPoints then
			ArenaRankSolid.rankIcon:setImage( RegisterImage( GetArenaRankIconLG( arenaPoints ) ) )
		end
	end )
	Stars.id = "Stars"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.Stars:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ImagePanel:close()
		element.ImageBorder:close()
		element.ArenaRankSolid:close()
		element.ArenaRankAdd:close()
		element.ListHeader:close()
		element.Stars:close()
		element.rankText:close()
		element.LobbySlideArenaMasterPowerRating:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

