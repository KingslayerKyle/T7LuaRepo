-- 5dfde033dce9dabb80243d0d5840abd4
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ListHeader" )
require( "ui.uieditor.widgets.Arena.ArenaRankSmall" )
require( "ui.uieditor.widgets.Arena.ArenaStar" )
require( "ui.uieditor.widgets.Lobby.Common.FE_SlideSubHeader" )

CoD.ArenaPlaylistRank = InheritFrom( LUI.UIElement )
CoD.ArenaPlaylistRank.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ArenaPlaylistRank )
	self.id = "ArenaPlaylistRank"
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
	
	local TickTR = LUI.UIImage.new()
	TickTR:setLeftRight( true, false, 315, 351 )
	TickTR:setTopBottom( true, false, -1, 2.5 )
	TickTR:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	TickTR:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( TickTR )
	self.TickTR = TickTR
	
	local TickBR = LUI.UIImage.new()
	TickBR:setLeftRight( true, false, 315, 351 )
	TickBR:setTopBottom( true, false, 89, 92.5 )
	TickBR:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	TickBR:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( TickBR )
	self.TickBR = TickBR
	
	local LineT = LUI.UIImage.new()
	LineT:setLeftRight( true, false, 92, 328 )
	LineT:setTopBottom( true, false, -1, 3 )
	LineT:setImage( RegisterImage( "uie_t7_menu_frontend_slidelineblur" ) )
	LineT:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineT )
	self.LineT = LineT
	
	local LineB = LUI.UIImage.new()
	LineB:setLeftRight( true, false, 92, 328 )
	LineB:setTopBottom( true, false, 89, 93 )
	LineB:setImage( RegisterImage( "uie_t7_menu_frontend_slidelineblur" ) )
	LineB:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineB )
	self.LineB = LineB
	
	local ImageX = LUI.UIImage.new()
	ImageX:setLeftRight( true, false, -2, 94 )
	ImageX:setTopBottom( true, false, -2, 94 )
	ImageX:setImage( RegisterImage( "uie_t7_menu_frontend_slidex" ) )
	ImageX:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ImageX )
	self.ImageX = ImageX
	
	local ImageBorder = CoD.FE_TitleNumBrdr.new( menu, controller )
	ImageBorder:setLeftRight( true, false, 0, 92 )
	ImageBorder:setTopBottom( true, false, 0, 91 )
	self:addElement( ImageBorder )
	self.ImageBorder = ImageBorder
	
	local ListHeader = CoD.FE_ListHeader.new( menu, controller )
	ListHeader:setLeftRight( true, false, 107.9, 275.9 )
	ListHeader:setTopBottom( true, false, 6, 34 )
	ListHeader.btnDisplayTextStroke:setShaderVector( 0, 0.06, 0, 0, 0 )
	ListHeader.btnDisplayTextStroke:setShaderVector( 1, 0.02, 0, 0, 0 )
	ListHeader.btnDisplayTextStroke:setShaderVector( 2, 1, 0, 0, 0 )
	ListHeader:linkToElementModel( self, "text", true, function ( model )
		local text = Engine.GetModelValue( model )
		if text then
			ListHeader.btnDisplayTextStroke:setText( Engine.Localize( text ) )
		end
	end )
	self:addElement( ListHeader )
	self.ListHeader = ListHeader
	
	local ArenaRankSolid = CoD.ArenaRankSmall.new( menu, controller )
	ArenaRankSolid:setLeftRight( true, false, 6, 86 )
	ArenaRankSolid:setTopBottom( true, false, 8, 88 )
	ArenaRankSolid:setRGB( 0, 0, 0 )
	ArenaRankSolid:setAlpha( 0.3 )
	ArenaRankSolid:setZoom( -5 )
	ArenaRankSolid:linkToElementModel( self, "arenaPoints", true, function ( model )
		local arenaPoints = Engine.GetModelValue( model )
		if arenaPoints then
			ArenaRankSolid.rankIcon:setImage( RegisterImage( GetArenaRankIconLG( arenaPoints ) ) )
		end
	end )
	self:addElement( ArenaRankSolid )
	self.ArenaRankSolid = ArenaRankSolid
	
	local ArenaRankAdd = CoD.ArenaRankSmall.new( menu, controller )
	ArenaRankAdd:setLeftRight( true, false, 6, 86 )
	ArenaRankAdd:setTopBottom( true, false, 8, 88 )
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
	TickTL:setTopBottom( true, false, -16, -4 )
	TickTL:setImage( RegisterImage( "uie_t7_menu_frontend_buttonsseparate" ) )
	TickTL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TickTL )
	self.TickTL = TickTL
	
	local Stars = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, true )
	Stars:makeFocusable()
	Stars:setLeftRight( true, false, 104.9, 258.9 )
	Stars:setTopBottom( true, false, 67, 91 )
	Stars:setWidgetType( CoD.ArenaStar )
	Stars:setHorizontalCount( 6 )
	Stars:linkToElementModel( self, "starsDatasource", true, function ( model )
		local starsDatasource = Engine.GetModelValue( model )
		if starsDatasource then
			Stars:setDataSource( starsDatasource )
		end
	end )
	self:addElement( Stars )
	self.Stars = Stars
	
	local rankText = CoD.FE_SlideSubHeader.new( menu, controller )
	rankText:setLeftRight( true, false, 107.9, 261.9 )
	rankText:setTopBottom( true, false, 36.88, 69 )
	rankText:linkToElementModel( self, "rank", true, function ( model )
		local rank = Engine.GetModelValue( model )
		if rank then
			rankText:setAlpha( HideIfEmptyString( rank ) )
		end
	end )
	rankText:linkToElementModel( self, "arenaPoints", true, function ( model )
		local arenaPoints = Engine.GetModelValue( model )
		if arenaPoints then
			rankText.FELabelSubHeadingD0.Label0:setText( Engine.Localize( LocalizeToUpperString( GetArenaRankName( arenaPoints ) ) ) )
		end
	end )
	self:addElement( rankText )
	self.rankText = rankText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				ImageX:completeAnimation()
				self.ImageX:setAlpha( 0 )
				self.clipFinished( ImageX, {} )

				ListHeader:completeAnimation()
				self.ListHeader:setAlpha( 1 )
				self.clipFinished( ListHeader, {} )

				ArenaRankSolid:completeAnimation()
				self.ArenaRankSolid:setAlpha( 0.3 )
				self.clipFinished( ArenaRankSolid, {} )

				ArenaRankAdd:completeAnimation()
				self.ArenaRankAdd:setAlpha( 1 )
				self.clipFinished( ArenaRankAdd, {} )

				Stars:completeAnimation()
				self.Stars:setAlpha( 1 )
				self.clipFinished( Stars, {} )
			end
		}
	}
	Stars.id = "Stars"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.Stars:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ImagePanel:close()
		element.ImageBorder:close()
		element.ListHeader:close()
		element.ArenaRankSolid:close()
		element.ArenaRankAdd:close()
		element.Stars:close()
		element.rankText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
