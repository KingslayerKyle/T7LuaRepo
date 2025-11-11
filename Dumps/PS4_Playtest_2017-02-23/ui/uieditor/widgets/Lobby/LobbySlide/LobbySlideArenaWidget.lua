require( "ui.uieditor.widgets.Arena.ArenaRankSmall" )
require( "ui.uieditor.widgets.Arena.ArenaStar" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ListHeader" )
require( "ui.uieditor.widgets.Lobby.Common.FE_SlideSubHeader" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.Lobby.LobbySlide.LobbySlideArenaMasterPowerRating" )

local PreLoadFunc = function ( self, controller )
	local arenaModel = Engine.CreateModel( Engine.GetGlobalModel(), "Arena" )
	local selectedPlayerPointsModel = Engine.CreateModel( arenaModel, "selectedPlayerPoints" )
	local selectedPlayerSkillModel = Engine.CreateModel( arenaModel, "selectedPlayerSkill" )
	Engine.SetModelValue( selectedPlayerPointsModel, 0 )
	Engine.SetModelValue( selectedPlayerSkillModel, 0 )
end

local PostLoadFunc = function ( self, controller, menu )
	local arenaModel = Engine.CreateModel( Engine.GetGlobalModel(), "Arena" )
	local selectedPlayerPointsModel = Engine.CreateModel( arenaModel, "selectedPlayerPoints" )
	local selectedPlayerSkillModel = Engine.CreateModel( arenaModel, "selectedPlayerSkill" )
	self.Stars:linkToElementModel( self, "arenaPoints", true, function ( model )
		if model then
			local arenaPoints = Engine.GetModelValue( model )
			Engine.SetModelValue( selectedPlayerPointsModel, arenaPoints )
		end
	end )
	self.Stars:linkToElementModel( self, "arenaSkill", true, function ( model )
		if model then
			local arenaSkill = Engine.GetModelValue( model )
			Engine.SetModelValue( selectedPlayerSkillModel, arenaSkill )
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
	self:setLeftRight( 0, 0, 0, 480 )
	self:setTopBottom( 0, 0, 0, 135 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local ImagePanel = CoD.FE_ButtonPanelShaderContainer.new( menu, controller )
	ImagePanel:setLeftRight( 0, 0, 0, 138 )
	ImagePanel:setTopBottom( 0, 0, 17, 153 )
	ImagePanel:setRGB( 0.5, 0.5, 0.5 )
	ImagePanel:setZoom( -10 )
	self:addElement( ImagePanel )
	self.ImagePanel = ImagePanel
	
	local TickTR = LUI.UIImage.new()
	TickTR:setLeftRight( 0, 0, 469, 523 )
	TickTR:setTopBottom( 0, 0, 15, 20 )
	TickTR:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	TickTR:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( TickTR )
	self.TickTR = TickTR
	
	local TickBR = LUI.UIImage.new()
	TickBR:setLeftRight( 0, 0, 469, 523 )
	TickBR:setTopBottom( 0, 0, 150, 155 )
	TickBR:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	TickBR:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( TickBR )
	self.TickBR = TickBR
	
	local LineT = LUI.UIImage.new()
	LineT:setLeftRight( 0, 0, 138, 492 )
	LineT:setTopBottom( 0, 0, 15, 21 )
	LineT:setImage( RegisterImage( "uie_t7_menu_frontend_slidelineblur" ) )
	LineT:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineT )
	self.LineT = LineT
	
	local LineB = LUI.UIImage.new()
	LineB:setLeftRight( 0, 0, 138, 492 )
	LineB:setTopBottom( 0, 0, 150, 156 )
	LineB:setImage( RegisterImage( "uie_t7_menu_frontend_slidelineblur" ) )
	LineB:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineB )
	self.LineB = LineB
	
	local ImageX = LUI.UIImage.new()
	ImageX:setLeftRight( 0, 0, -3, 141 )
	ImageX:setTopBottom( 0, 0, 14, 158 )
	ImageX:setImage( RegisterImage( "uie_t7_menu_frontend_slidex" ) )
	ImageX:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ImageX )
	self.ImageX = ImageX
	
	local ImageBorder = CoD.FE_TitleNumBrdr.new( menu, controller )
	ImageBorder:setLeftRight( 0, 0, 0, 138 )
	ImageBorder:setTopBottom( 0, 0, 17, 153 )
	self:addElement( ImageBorder )
	self.ImageBorder = ImageBorder
	
	local ArenaRankSolid = CoD.ArenaRankSmall.new( menu, controller )
	ArenaRankSolid:setLeftRight( 0, 0, 9, 129 )
	ArenaRankSolid:setTopBottom( 0, 0, 24, 144 )
	ArenaRankSolid:setRGB( 0, 0, 0 )
	ArenaRankSolid:setAlpha( 0.3 )
	ArenaRankSolid:setZoom( -5 )
	self:addElement( ArenaRankSolid )
	self.ArenaRankSolid = ArenaRankSolid
	
	local ArenaRankAdd = CoD.ArenaRankSmall.new( menu, controller )
	ArenaRankAdd:setLeftRight( 0, 0, 9, 129 )
	ArenaRankAdd:setTopBottom( 0, 0, 24, 144 )
	ArenaRankAdd:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	ArenaRankAdd:setShaderVector( 0, 0.05, 0.5, 0, 0 )
	ArenaRankAdd:setShaderVector( 1, 0, 0, 0, 0 )
	ArenaRankAdd:setShaderVector( 2, 0, 0, 0, 0 )
	ArenaRankAdd:setShaderVector( 3, 0, 0, 0, 0 )
	ArenaRankAdd:setShaderVector( 4, 0, 0, 0, 0 )
	ArenaRankAdd:linkToElementModel( self, "arenaPoints", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ArenaRankAdd.rankIcon:setImage( RegisterImage( GetArenaRankIconLG( modelValue ) ) )
		end
	end )
	self:addElement( ArenaRankAdd )
	self.ArenaRankAdd = ArenaRankAdd
	
	local TickTL = LUI.UIImage.new()
	TickTL:setLeftRight( 0, 0, -9, 15 )
	TickTL:setTopBottom( 0, 0, -7, 11 )
	TickTL:setImage( RegisterImage( "uie_t7_menu_frontend_buttonsseparate" ) )
	TickTL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TickTL )
	self.TickTL = TickTL
	
	local pixelU0 = LUI.UIImage.new()
	pixelU0:setLeftRight( 1, 1, -523, -469 )
	pixelU0:setTopBottom( 0.5, 0.5, -53, -48 )
	pixelU0:setZRot( 180 )
	pixelU0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelU0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( pixelU0 )
	self.pixelU0 = pixelU0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( 1, 1, -523, -469 )
	Image1:setTopBottom( 0.5, 0.5, 83, 88 )
	Image1:setZRot( 180 )
	Image1:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local ListHeader = CoD.FE_ListHeader.new( menu, controller )
	ListHeader:setLeftRight( 0, 0, 153, 405 )
	ListHeader:setTopBottom( 0, 0, 24, 66 )
	ListHeader.btnDisplayTextStroke:setShaderVector( 0, 0.06, 0, 0, 0 )
	ListHeader.btnDisplayTextStroke:setShaderVector( 1, 0.02, 0, 0, 0 )
	ListHeader.btnDisplayTextStroke:setShaderVector( 2, 1, 0, 0, 0 )
	ListHeader:subscribeToGlobalModel( controller, "LobbyPlaylistName", "name", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ListHeader.btnDisplayTextStroke:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( ListHeader )
	self.ListHeader = ListHeader
	
	local Stars = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	Stars:makeFocusable()
	Stars:setLeftRight( 0, 0, 151, 377 )
	Stars:setTopBottom( 0, 0, 116, 152 )
	Stars:setWidgetType( CoD.ArenaStar )
	Stars:setHorizontalCount( 6 )
	Stars:setDataSource( "ArenaInspectionStars" )
	self:addElement( Stars )
	self.Stars = Stars
	
	local rankText = CoD.FE_SlideSubHeader.new( menu, controller )
	rankText:setLeftRight( 0, 0, 153, 374 )
	rankText:setTopBottom( 0, 0, 71, 119 )
	rankText:linkToElementModel( self, "rank", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankText:setAlpha( HideIfEmptyString( modelValue ) )
		end
	end )
	rankText:linkToElementModel( self, "arenaPoints", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankText.FELabelSubHeadingD0.Label0:setText( LocalizeToUpperString( GetArenaRankName( modelValue ) ) )
		end
	end )
	self:addElement( rankText )
	self.rankText = rankText
	
	local LobbySlideArenaMasterPowerRating = CoD.LobbySlideArenaMasterPowerRating.new( menu, controller )
	LobbySlideArenaMasterPowerRating:setLeftRight( 0, 0, 153, 480 )
	LobbySlideArenaMasterPowerRating:setTopBottom( 0, 0, 118, 154 )
	LobbySlideArenaMasterPowerRating:linkToElementModel( self, nil, false, function ( model )
		LobbySlideArenaMasterPowerRating:setModel( model, controller )
	end )
	self:addElement( LobbySlideArenaMasterPowerRating )
	self.LobbySlideArenaMasterPowerRating = LobbySlideArenaMasterPowerRating
	
	self.ArenaRankSolid:linkToElementModel( self, "arenaPoints", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ArenaRankSolid.rankIcon:setImage( RegisterImage( GetArenaRankIconLG( modelValue ) ) )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ImagePanel:close()
		self.ImageBorder:close()
		self.ArenaRankSolid:close()
		self.ArenaRankAdd:close()
		self.ListHeader:close()
		self.Stars:close()
		self.rankText:close()
		self.LobbySlideArenaMasterPowerRating:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

