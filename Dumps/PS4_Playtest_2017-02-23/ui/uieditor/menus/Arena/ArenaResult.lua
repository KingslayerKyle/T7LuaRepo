require( "ui.uieditor.menus.AAR.MPAAR" )
require( "ui.uieditor.menus.AAR.RewardsOverlay" )
require( "ui.uieditor.widgets.Arena.ArenaRankSmall" )
require( "ui.uieditor.widgets.Arena.ArenaStarbig" )
require( "ui.uieditor.widgets.Arena.ArenaVictory" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ListHeaderGlow" )
require( "ui.uieditor.widgets.Lobby.Common.FE_SlideSubHeader" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.Lobby.LobbyStreamerBlackFade" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_VignetteBack" )

local PreLoadFunc = function ( self, controller )
	self.disablePopupOpenCloseAnim = true
end

local PostLoadFunc = function ( self, controller )
	local pregameRoot = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame" )
	local pregameCloseAARModel = Engine.CreateModel( pregameRoot, "closeAAR" )
	self:subscribeToModel( pregameCloseAARModel, function ( model )
		self:close()
	end, false )
end

local CreatePreviousStarsDatasource = function ( previous, current )
	local dataSourceName = "Arena_Result_Stars_Previous"
	DataSources[dataSourceName] = DataSourceHelpers.ListSetup( dataSourceName, function ( controller )
		local points = {}
		local f5_local0 = previous.rank < current.rank
		for starIndex = 0, previous.maxStars - 1, 1 do
			table.insert( points, {
				models = {
					earned = starIndex < previous.starsEarned
				}
			} )
		end
		return points
	end )
	return dataSourceName
end

local CreateCurrentStarsDatasource = function ( previous, current )
	local dataSourceName = "Arena_Result_Stars_Current"
	DataSources[dataSourceName] = DataSourceHelpers.ListSetup( dataSourceName, function ( controller )
		local points = {}
		local starsEarned = current.starsEarned - previous.starsEarned
		local f7_local0 = previous.rank < current.rank
		for starIndex = 0, current.maxStars - 1, 1 do
			local f7_local3 = starIndex < current.starsEarned
			local f7_local4 = f7_local3 and current.starsEarned - starsEarned <= starIndex
			local f7_local5 = starIndex < previous.starsEarned
			local f7_local6
			if not f7_local3 then
				local f7_local7 = f7_local5
				f7_local6 = not f7_local0
			else
				f7_local6 = false
			end
			table.insert( points, {
				models = {
					earned = f7_local3,
					new = f7_local4,
					lost = f7_local6
				}
			} )
		end
		return points
	end )
	return dataSourceName
end

DataSources.ArenaResult = {
	getModel = function ( controller )
		local arenaResultModel = Engine.CreateModel( Engine.GetGlobalModel(), "arenaResult" )
		local playlistId = Engine.GetPlaylistID()
		local playlistInfo = Engine.GetPlaylistInfoByID( playlistId )
		local playerStats = CoD.GetPlayerStats( controller )
		local previous = {
			points = playerStats.arenaStats[playlistInfo.playlist.arenaSlot].matchStartPoints:get(),
			rank = CoD.ArenaUtility.GetRank( REG5.points ),
			maxStars = CoD.ArenaUtility.GetRankVisibleStars( REG5.points ),
			starsEarned = CoD.ArenaUtility.GetStarCount( REG5.points )
		}
		local current = {
			points = playerStats.arenaStats[playlistInfo.playlist.arenaSlot].points:get(),
			rank = CoD.ArenaUtility.GetRank( REG6.points ),
			maxStars = CoD.ArenaUtility.GetRankVisibleStars( REG6.points ),
			starsEarned = CoD.ArenaUtility.GetStarCount( REG6.points )
		}
		local previousPointsModel = Engine.CreateModel( arenaResultModel, "previousPoints" )
		Engine.SetModelValue( previousPointsModel, previous.points )
		local previousStarsDatasourceModel = Engine.CreateModel( arenaResultModel, "previousStarsDatasource" )
		Engine.SetModelValue( previousStarsDatasourceModel, CreatePreviousStarsDatasource( previous, current ) )
		local currentPointsModel = Engine.CreateModel( arenaResultModel, "currentPoints" )
		Engine.SetModelValue( currentPointsModel, current.points )
		local currentStarsDatasourceModel = Engine.CreateModel( arenaResultModel, "currentStarsDatasource" )
		Engine.SetModelValue( currentStarsDatasourceModel, CreateCurrentStarsDatasource( previous, current ) )
		return arenaResultModel
	end
}
LUI.createMenu.ArenaResult = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ArenaResult" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ArenaResult.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( 0, 1, 0, 0 )
	LeftPanel:setTopBottom( 0, 1, 0, 0 )
	LeftPanel:setRGB( 0.31, 0.31, 0.31 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local FadeForStreamer = CoD.LobbyStreamerBlackFade.new( self, controller )
	FadeForStreamer:mergeStateConditions( {
		{
			stateName = "Transparent",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "hideWorldForStreamer", 0 )
			end
		}
	} )
	FadeForStreamer:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "hideWorldForStreamer" ), function ( model )
		self:updateElementState( FadeForStreamer, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hideWorldForStreamer"
		} )
	end )
	FadeForStreamer:setLeftRight( 0, 1, 0, 0 )
	FadeForStreamer:setTopBottom( 0, 1, 0, 0 )
	self:addElement( FadeForStreamer )
	self.FadeForStreamer = FadeForStreamer
	
	local VignetteBack = CoD.VehicleGround_VignetteBack.new( self, controller )
	VignetteBack:setLeftRight( 0, 1, 0, 0 )
	VignetteBack:setTopBottom( 0, 1, 0, 0 )
	self:addElement( VignetteBack )
	self.VignetteBack = VignetteBack
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( 0, 1, 0, 0 )
	MenuFrame:setTopBottom( 0, 1, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_ARENA_RANK_PROGRESS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_ARENA_RANK_PROGRESS" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local Team1Vignette = LUI.UIImage.new()
	Team1Vignette:setLeftRight( 0, 1, 0, 0 )
	Team1Vignette:setTopBottom( 0.5, 0.5, -22, 254 )
	Team1Vignette:setAlpha( 0.44 )
	Team1Vignette:setXRot( -180 )
	Team1Vignette:setImage( RegisterImage( "uie_t7_mp_menu_startflow_vignette" ) )
	Team1Vignette:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiply" ) )
	self:addElement( Team1Vignette )
	self.Team1Vignette = Team1Vignette
	
	local Team1Line = LUI.UIImage.new()
	Team1Line:setLeftRight( 0, 1, -16, 16 )
	Team1Line:setTopBottom( 0.5, 0.5, -28, -16 )
	Team1Line:setAlpha( 0.2 )
	Team1Line:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Team1Line:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Team1Line )
	self.Team1Line = Team1Line
	
	local BoxButtonLrgIdle = LUI.UIImage.new()
	BoxButtonLrgIdle:setLeftRight( 0.5, 0.5, -256, 258 )
	BoxButtonLrgIdle:setTopBottom( 0, 0, 270, 784 )
	BoxButtonLrgIdle:setAlpha( 0 )
	BoxButtonLrgIdle:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrgidlefull" ) )
	BoxButtonLrgIdle:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	BoxButtonLrgIdle:setShaderVector( 0, 0, 0, 0, 0 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local RankImageBorder = CoD.FE_TitleNumBrdr.new( self, controller )
	RankImageBorder:setLeftRight( 0.5, 0.5, -249, 249 )
	RankImageBorder:setTopBottom( 0, 0, 277, 775 )
	RankImageBorder:setAlpha( 0 )
	self:addElement( RankImageBorder )
	self.RankImageBorder = RankImageBorder
	
	local RankFrame = CoD.FE_SlideSubHeader.new( self, controller )
	RankFrame:setLeftRight( 0.5, 0.5, -183, 187 )
	RankFrame:setTopBottom( 0, 0, 855, 909 )
	RankFrame.FELabelSubHeadingD0.Label0:setText( Engine.Localize( "" ) )
	self:addElement( RankFrame )
	self.RankFrame = RankFrame
	
	local PlayListBG = CoD.FE_ListHeaderGlow.new( self, controller )
	PlayListBG:setLeftRight( 0.5, 0.5, -183, 187 )
	PlayListBG:setTopBottom( 0, 0, 801, 852 )
	self:addElement( PlayListBG )
	self.PlayListBG = PlayListBG
	
	local PlayListName = LUI.UIText.new()
	PlayListName:setLeftRight( 0.5, 0.5, -181, 187 )
	PlayListName:setTopBottom( 0, 0, 807, 846 )
	PlayListName:setRGB( 0, 0, 0 )
	PlayListName:setTTF( "fonts/escom.ttf" )
	PlayListName:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	PlayListName:setShaderVector( 0, 0.06, 0, 0, 0 )
	PlayListName:setShaderVector( 1, 0.02, 0, 0, 0 )
	PlayListName:setShaderVector( 2, 1, 0, 0, 0 )
	PlayListName:setLetterSpacing( 1 )
	PlayListName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	PlayListName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	PlayListName:subscribeToGlobalModel( controller, "LobbyPlaylistName", "name", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PlayListName:setText( Engine.Localize( modelValue ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( PlayListName, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 0 )
	end )
	self:addElement( PlayListName )
	self.PlayListName = PlayListName
	
	local CurrentStars = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	CurrentStars:makeFocusable()
	CurrentStars:setLeftRight( 0.5, 0.5, -184, 186 )
	CurrentStars:setTopBottom( 0, 0, 912, 972 )
	CurrentStars:setWidgetType( CoD.ArenaStarbig )
	CurrentStars:setHorizontalCount( 6 )
	CurrentStars:subscribeToGlobalModel( controller, "ArenaResult", "currentStarsDatasource", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CurrentStars:setDataSource( modelValue )
		end
	end )
	CurrentStars:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		if ArenaRankIncreased( controller ) then
			PlayClip( self, "RankedUp", controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( CurrentStars )
	self.CurrentStars = CurrentStars
	
	local CurrentRankText = LUI.UIText.new()
	CurrentRankText:setLeftRight( 0.5, 0.5, -183, 187 )
	CurrentRankText:setTopBottom( 0, 0, 855, 906 )
	CurrentRankText:setRGB( 0.76, 0.83, 0.85 )
	CurrentRankText:setTTF( "fonts/escom.ttf" )
	CurrentRankText:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	CurrentRankText:setShaderVector( 0, 0.05, 1, 0, 0 )
	CurrentRankText:setShaderVector( 1, 0, 0, 0, 0 )
	CurrentRankText:setShaderVector( 2, 0, 0, 0, 0 )
	CurrentRankText:setShaderVector( 3, 0, 0, 0, 0 )
	CurrentRankText:setShaderVector( 4, 0, 0, 0, 0 )
	CurrentRankText:setLetterSpacing( 1 )
	CurrentRankText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	CurrentRankText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	CurrentRankText:subscribeToGlobalModel( controller, "ArenaResult", "currentPoints", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CurrentRankText:setText( LocalizeToUpperString( GetArenaRankName( modelValue ) ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( CurrentRankText, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 0 )
	end )
	self:addElement( CurrentRankText )
	self.CurrentRankText = CurrentRankText
	
	local highlight1 = LUI.UIImage.new()
	highlight1:setLeftRight( 0.5, 0.5, -176, 174 )
	highlight1:setTopBottom( 0, 0, 333, 672 )
	highlight1:setAlpha( 0 )
	highlight1:setZRot( 108 )
	highlight1:setScale( 2.59 )
	highlight1:setImage( RegisterImage( "uie_t7_hud_notficationhighlight" ) )
	highlight1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( highlight1 )
	self.highlight1 = highlight1
	
	local highlight00 = LUI.UIImage.new()
	highlight00:setLeftRight( 0.5, 0.5, -176, 174 )
	highlight00:setTopBottom( 0, 0, 333, 672 )
	highlight00:setRGB( 0.62, 0.49, 0.05 )
	highlight00:setAlpha( 0 )
	highlight00:setZRot( 221 )
	highlight00:setScale( 1.89 )
	highlight00:setImage( RegisterImage( "uie_t7_hud_notficationhighlight" ) )
	highlight00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( highlight00 )
	self.highlight00 = highlight00
	
	local highlight0 = LUI.UIImage.new()
	highlight0:setLeftRight( 0.5, 0.5, -176, 174 )
	highlight0:setTopBottom( 0, 0, 333, 672 )
	highlight0:setRGB( 0.62, 0.49, 0.05 )
	highlight0:setAlpha( 0 )
	highlight0:setZRot( 325 )
	highlight0:setImage( RegisterImage( "uie_t7_hud_notficationhighlight" ) )
	highlight0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( highlight0 )
	self.highlight0 = highlight0
	
	local highlight = LUI.UIImage.new()
	highlight:setLeftRight( 0.5, 0.5, -176, 174 )
	highlight:setTopBottom( 0, 0, 333, 672 )
	highlight:setAlpha( 0 )
	highlight:setZRot( 108 )
	highlight:setScale( 3.3 )
	highlight:setImage( RegisterImage( "uie_t7_hud_notficationhighlight" ) )
	highlight:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( highlight )
	self.highlight = highlight
	
	local CurrentRank = CoD.ArenaRankSmall.new( self, controller )
	CurrentRank:setLeftRight( 0.5, 0.5, -222, 222 )
	CurrentRank:setTopBottom( 0, 0, 312, 756 )
	CurrentRank:subscribeToGlobalModel( controller, "ArenaResult", "currentPoints", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CurrentRank.rankIcon:setImage( RegisterImage( GetArenaRankIconLG( modelValue ) ) )
		end
	end )
	self:addElement( CurrentRank )
	self.CurrentRank = CurrentRank
	
	local CurrentRankADD = LUI.UIImage.new()
	CurrentRankADD:setLeftRight( 0.5, 0.5, -222, 222 )
	CurrentRankADD:setTopBottom( 0, 0, 312, 756 )
	CurrentRankADD:setAlpha( 0 )
	CurrentRankADD:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
	CurrentRankADD:setShaderVector( 0, 2, 0, 0, 0 )
	CurrentRankADD:setShaderVector( 1, 1, 0, 0, 0 )
	CurrentRankADD:setShaderVector( 2, 0.03, 0, 0, 0 )
	CurrentRankADD:subscribeToGlobalModel( controller, "ArenaResult", "currentPoints", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CurrentRankADD:setImage( RegisterImage( GetArenaRankIconLG( modelValue ) ) )
		end
	end )
	self:addElement( CurrentRankADD )
	self.CurrentRankADD = CurrentRankADD
	
	local PreviousStars = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	PreviousStars:makeFocusable()
	PreviousStars:setLeftRight( 0.5, 0.5, -184, 186 )
	PreviousStars:setTopBottom( 0, 0, 900, 960 )
	PreviousStars:setAlpha( 0 )
	PreviousStars:setWidgetType( CoD.ArenaStarbig )
	PreviousStars:setHorizontalCount( 6 )
	PreviousStars:subscribeToGlobalModel( controller, "ArenaResult", "previousStarsDatasource", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PreviousStars:setDataSource( modelValue )
		end
	end )
	self:addElement( PreviousStars )
	self.PreviousStars = PreviousStars
	
	local PreviousRankText = LUI.UIText.new()
	PreviousRankText:setLeftRight( 0, 0, 777, 1147 )
	PreviousRankText:setTopBottom( 1, 1, -225, -174 )
	PreviousRankText:setRGB( 0.76, 0.83, 0.85 )
	PreviousRankText:setAlpha( 0 )
	PreviousRankText:setTTF( "fonts/escom.ttf" )
	PreviousRankText:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	PreviousRankText:setShaderVector( 0, 0.2, 1, 0, 0 )
	PreviousRankText:setShaderVector( 1, 0, 0, 0, 0 )
	PreviousRankText:setShaderVector( 2, 0, 0, 0, 0 )
	PreviousRankText:setShaderVector( 3, 0, 0, 0, 0 )
	PreviousRankText:setShaderVector( 4, 0, 0, 0, 0 )
	PreviousRankText:setLetterSpacing( 1 )
	PreviousRankText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	PreviousRankText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	PreviousRankText:subscribeToGlobalModel( controller, "ArenaResult", "previousPoints", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PreviousRankText:setText( LocalizeToUpperString( GetArenaRankName( modelValue ) ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( PreviousRankText, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 0 )
	end )
	self:addElement( PreviousRankText )
	self.PreviousRankText = PreviousRankText
	
	local PreviousRankAdd = CoD.ArenaRankSmall.new( self, controller )
	PreviousRankAdd:setLeftRight( 0.5, 0.5, -222, 222 )
	PreviousRankAdd:setTopBottom( 0, 0, 312, 756 )
	PreviousRankAdd:setAlpha( 0 )
	PreviousRankAdd:subscribeToGlobalModel( controller, "ArenaResult", "previousPoints", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PreviousRankAdd.rankIcon:setImage( RegisterImage( GetArenaRankIconLG( modelValue ) ) )
		end
	end )
	self:addElement( PreviousRankAdd )
	self.PreviousRankAdd = PreviousRankAdd
	
	local ArenaVictory = CoD.ArenaVictory.new( self, controller )
	ArenaVictory:setLeftRight( 0.5, 0.5, -525.5, 527.5 )
	ArenaVictory:setTopBottom( 0, 0, 176, 258 )
	self:addElement( ArenaVictory )
	self.ArenaVictory = ArenaVictory
	
	local CurrentRankR1 = LUI.UIImage.new()
	CurrentRankR1:setLeftRight( 0.5, 0.5, 221, 665 )
	CurrentRankR1:setTopBottom( 0, 0, 312, 756 )
	CurrentRankR1:setRGB( 0.49, 0, 0 )
	CurrentRankR1:setAlpha( 0 )
	CurrentRankR1:setScale( 2 )
	CurrentRankR1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
	CurrentRankR1:setShaderVector( 0, 2, 0, 0, 0 )
	CurrentRankR1:setShaderVector( 1, 1, 0, 0, 0 )
	CurrentRankR1:setShaderVector( 2, 0.03, 0, 0, 0 )
	CurrentRankR1:subscribeToGlobalModel( controller, "ArenaResult", "currentPoints", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CurrentRankR1:setImage( RegisterImage( GetArenaRankIconLG( modelValue ) ) )
		end
	end )
	self:addElement( CurrentRankR1 )
	self.CurrentRankR1 = CurrentRankR1
	
	local CurrentRankL1 = LUI.UIImage.new()
	CurrentRankL1:setLeftRight( 0.5, 0.5, -665, -221 )
	CurrentRankL1:setTopBottom( 0, 0, 312, 756 )
	CurrentRankL1:setRGB( 0.06, 0.58, 0 )
	CurrentRankL1:setAlpha( 0 )
	CurrentRankL1:setScale( 2 )
	CurrentRankL1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
	CurrentRankL1:setShaderVector( 0, 2, 0, 0, 0 )
	CurrentRankL1:setShaderVector( 1, 1, 0, 0, 0 )
	CurrentRankL1:setShaderVector( 2, 0.03, 0, 0, 0 )
	CurrentRankL1:subscribeToGlobalModel( controller, "ArenaResult", "currentPoints", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CurrentRankL1:setImage( RegisterImage( GetArenaRankIconLG( modelValue ) ) )
		end
	end )
	self:addElement( CurrentRankL1 )
	self.CurrentRankL1 = CurrentRankL1
	
	local CurrentRankC1 = LUI.UIImage.new()
	CurrentRankC1:setLeftRight( 0.5, 0.5, -223, 221 )
	CurrentRankC1:setTopBottom( 0, 0, 312, 756 )
	CurrentRankC1:setRGB( 0, 0.03, 0.49 )
	CurrentRankC1:setAlpha( 0 )
	CurrentRankC1:setScale( 2 )
	CurrentRankC1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
	CurrentRankC1:setShaderVector( 0, 2, 0, 0, 0 )
	CurrentRankC1:setShaderVector( 1, 1, 0, 0, 0 )
	CurrentRankC1:setShaderVector( 2, 0.03, 0, 0, 0 )
	CurrentRankC1:subscribeToGlobalModel( controller, "ArenaResult", "currentPoints", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CurrentRankC1:setImage( RegisterImage( GetArenaRankIconLG( modelValue ) ) )
		end
	end )
	self:addElement( CurrentRankC1 )
	self.CurrentRankC1 = CurrentRankC1
	
	local CurrentRankglint = CoD.ArenaRankSmall.new( self, controller )
	CurrentRankglint:setLeftRight( 0.5, 0.5, -222, 222 )
	CurrentRankglint:setTopBottom( 0, 0, 312, 756 )
	CurrentRankglint:setRGB( 1, 0.8, 0 )
	CurrentRankglint:setAlpha( 0 )
	CurrentRankglint:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_glint_reveal" ) )
	CurrentRankglint:setShaderVector( 0, 1, 0, 0, 0 )
	CurrentRankglint:subscribeToGlobalModel( controller, "ArenaResult", "currentPoints", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CurrentRankglint.rankIcon:setImage( RegisterImage( GetArenaRankIconLG( modelValue ) ) )
		end
	end )
	self:addElement( CurrentRankglint )
	self.CurrentRankglint = CurrentRankglint
	
	local rankup = LUI.UIElement.new()
	rankup:setLeftRight( 0, 0, -119, -47 )
	rankup:setTopBottom( 0, 0, 909, 981 )
	rankup:setPlaySoundDirect( true )
	self:addElement( rankup )
	self.rankup = rankup
	
	CurrentStars.navigation = {
		up = PreviousStars
	}
	PreviousStars.navigation = {
		down = CurrentStars
	}
	self.resetProperties = function ()
		PreviousRankText:completeAnimation()
		CurrentRankText:completeAnimation()
		PlayListBG:completeAnimation()
		CurrentStars:completeAnimation()
		RankFrame:completeAnimation()
		ArenaVictory:completeAnimation()
		CurrentRank:completeAnimation()
		PlayListName:completeAnimation()
		highlight0:completeAnimation()
		highlight:completeAnimation()
		PreviousStars:completeAnimation()
		PreviousRankAdd:completeAnimation()
		highlight00:completeAnimation()
		highlight1:completeAnimation()
		CurrentRankC1:completeAnimation()
		CurrentRankL1:completeAnimation()
		CurrentRankR1:completeAnimation()
		rankup:completeAnimation()
		CurrentRankADD:completeAnimation()
		CurrentRankglint:completeAnimation()
		PreviousRankText:setLeftRight( 0, 0, 777, 1147 )
		PreviousRankText:setTopBottom( 1, 1, -225, -174 )
		PreviousRankText:setAlpha( 0 )
		CurrentRankText:setAlpha( 1 )
		PlayListBG:setAlpha( 1 )
		CurrentStars:setAlpha( 1 )
		RankFrame:setAlpha( 1 )
		ArenaVictory:setAlpha( 1 )
		CurrentRank:setAlpha( 1 )
		PlayListName:setAlpha( 1 )
		highlight0:setAlpha( 0 )
		highlight0:setZRot( 325 )
		highlight0:setScale( 1 )
		highlight:setAlpha( 0 )
		highlight:setZRot( 108 )
		highlight:setScale( 3.3 )
		PreviousStars:setAlpha( 0 )
		PreviousRankAdd:setAlpha( 0 )
		highlight00:setAlpha( 0 )
		highlight00:setZRot( 221 )
		highlight00:setScale( 1.89 )
		highlight1:setAlpha( 0 )
		highlight1:setZRot( 108 )
		highlight1:setScale( 2.59 )
		CurrentRankC1:setLeftRight( 0.5, 0.5, -223, 221 )
		CurrentRankC1:setTopBottom( 0, 0, 312, 756 )
		CurrentRankC1:setAlpha( 0 )
		CurrentRankC1:setScale( 2 )
		CurrentRankL1:setLeftRight( 0.5, 0.5, -665, -221 )
		CurrentRankL1:setTopBottom( 0, 0, 312, 756 )
		CurrentRankL1:setAlpha( 0 )
		CurrentRankL1:setScale( 2 )
		CurrentRankR1:setLeftRight( 0.5, 0.5, 221, 665 )
		CurrentRankR1:setTopBottom( 0, 0, 312, 756 )
		CurrentRankR1:setAlpha( 0 )
		CurrentRankR1:setScale( 2 )
		rankup:playSound( "uin_arena_rank_up", controller )
		CurrentRankADD:setAlpha( 0 )
		CurrentRankADD:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
		CurrentRankADD:setShaderVector( 0, 2, 0, 0, 0 )
		CurrentRankADD:setShaderVector( 1, 1, 0, 0, 0 )
		CurrentRankADD:setShaderVector( 2, 0.03, 0, 0, 0 )
		CurrentRankglint:setRGB( 1, 0.8, 0 )
		CurrentRankglint:setAlpha( 0 )
		CurrentRankglint:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_glint_reveal" ) )
		CurrentRankglint:setShaderVector( 0, 1, 0, 0, 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 8 )
				local RankFrameFrame2 = function ( RankFrame, event )
					if not event.interrupted then
						RankFrame:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					RankFrame:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( RankFrame, event )
					else
						RankFrame:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RankFrame:completeAnimation()
				self.RankFrame:setAlpha( 0 )
				RankFrameFrame2( RankFrame, {} )
				local PlayListBGFrame2 = function ( PlayListBG, event )
					if not event.interrupted then
						PlayListBG:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					PlayListBG:setAlpha( 0.69 )
					if event.interrupted then
						self.clipFinished( PlayListBG, event )
					else
						PlayListBG:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PlayListBG:completeAnimation()
				self.PlayListBG:setAlpha( 0 )
				PlayListBGFrame2( PlayListBG, {} )
				local PlayListNameFrame2 = function ( PlayListName, event )
					if not event.interrupted then
						PlayListName:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					PlayListName:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( PlayListName, event )
					else
						PlayListName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PlayListName:completeAnimation()
				self.PlayListName:setAlpha( 0 )
				PlayListNameFrame2( PlayListName, {} )
				local CurrentStarsFrame2 = function ( CurrentStars, event )
					if not event.interrupted then
						CurrentStars:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					CurrentStars:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( CurrentStars, event )
					else
						CurrentStars:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CurrentStars:completeAnimation()
				self.CurrentStars:setAlpha( 0 )
				CurrentStarsFrame2( CurrentStars, {} )
				local CurrentRankTextFrame2 = function ( CurrentRankText, event )
					if not event.interrupted then
						CurrentRankText:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					CurrentRankText:setAlpha( 0.75 )
					if event.interrupted then
						self.clipFinished( CurrentRankText, event )
					else
						CurrentRankText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CurrentRankText:completeAnimation()
				self.CurrentRankText:setAlpha( 0 )
				CurrentRankTextFrame2( CurrentRankText, {} )
				local CurrentRankFrame2 = function ( CurrentRank, event )
					if not event.interrupted then
						CurrentRank:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					CurrentRank:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( CurrentRank, event )
					else
						CurrentRank:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CurrentRank:completeAnimation()
				self.CurrentRank:setAlpha( 0 )
				CurrentRankFrame2( CurrentRank, {} )
				PreviousRankText:completeAnimation()
				self.PreviousRankText:setLeftRight( 0.5, 0.5, -183, 187 )
				self.PreviousRankText:setTopBottom( 0, 0, 855, 906 )
				self.clipFinished( PreviousRankText, {} )
				local ArenaVictoryFrame2 = function ( ArenaVictory, event )
					if not event.interrupted then
						ArenaVictory:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					ArenaVictory:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( ArenaVictory, event )
					else
						ArenaVictory:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ArenaVictory:completeAnimation()
				self.ArenaVictory:setAlpha( 0 )
				ArenaVictoryFrame2( ArenaVictory, {} )
			end,
			RankedUp = function ()
				self.resetProperties()
				self:setupElementClipCounter( 20 )
				local RankFrameFrame2 = function ( RankFrame, event )
					local RankFrameFrame3 = function ( RankFrame, event )
						local RankFrameFrame4 = function ( RankFrame, event )
							local RankFrameFrame5 = function ( RankFrame, event )
								local RankFrameFrame6 = function ( RankFrame, event )
									if not event.interrupted then
										RankFrame:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
									end
									RankFrame:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( RankFrame, event )
									else
										RankFrame:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									RankFrameFrame6( RankFrame, event )
									return 
								else
									RankFrame:beginAnimation( "keyframe", 1110, false, false, CoD.TweenType.Linear )
									RankFrame:registerEventHandler( "transition_complete_keyframe", RankFrameFrame6 )
								end
							end
							
							if event.interrupted then
								RankFrameFrame5( RankFrame, event )
								return 
							else
								RankFrame:beginAnimation( "keyframe", 350, false, false, CoD.TweenType.Linear )
								RankFrame:setAlpha( 0 )
								RankFrame:registerEventHandler( "transition_complete_keyframe", RankFrameFrame5 )
							end
						end
						
						if event.interrupted then
							RankFrameFrame4( RankFrame, event )
							return 
						else
							RankFrame:beginAnimation( "keyframe", 680, false, false, CoD.TweenType.Linear )
							RankFrame:registerEventHandler( "transition_complete_keyframe", RankFrameFrame4 )
						end
					end
					
					if event.interrupted then
						RankFrameFrame3( RankFrame, event )
						return 
					else
						RankFrame:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						RankFrame:setAlpha( 1 )
						RankFrame:registerEventHandler( "transition_complete_keyframe", RankFrameFrame3 )
					end
				end
				
				RankFrame:completeAnimation()
				self.RankFrame:setAlpha( 0 )
				RankFrameFrame2( RankFrame, {} )
				local PlayListBGFrame2 = function ( PlayListBG, event )
					local PlayListBGFrame3 = function ( PlayListBG, event )
						local PlayListBGFrame4 = function ( PlayListBG, event )
							local PlayListBGFrame5 = function ( PlayListBG, event )
								local PlayListBGFrame6 = function ( PlayListBG, event )
									if not event.interrupted then
										PlayListBG:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
									end
									PlayListBG:setAlpha( 0.95 )
									if event.interrupted then
										self.clipFinished( PlayListBG, event )
									else
										PlayListBG:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									PlayListBGFrame6( PlayListBG, event )
									return 
								else
									PlayListBG:beginAnimation( "keyframe", 1110, false, false, CoD.TweenType.Linear )
									PlayListBG:registerEventHandler( "transition_complete_keyframe", PlayListBGFrame6 )
								end
							end
							
							if event.interrupted then
								PlayListBGFrame5( PlayListBG, event )
								return 
							else
								PlayListBG:beginAnimation( "keyframe", 350, false, false, CoD.TweenType.Linear )
								PlayListBG:setAlpha( 0 )
								PlayListBG:registerEventHandler( "transition_complete_keyframe", PlayListBGFrame5 )
							end
						end
						
						if event.interrupted then
							PlayListBGFrame4( PlayListBG, event )
							return 
						else
							PlayListBG:beginAnimation( "keyframe", 680, false, false, CoD.TweenType.Linear )
							PlayListBG:setAlpha( 0.69 )
							PlayListBG:registerEventHandler( "transition_complete_keyframe", PlayListBGFrame4 )
						end
					end
					
					if event.interrupted then
						PlayListBGFrame3( PlayListBG, event )
						return 
					else
						PlayListBG:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						PlayListBG:setAlpha( 0.95 )
						PlayListBG:registerEventHandler( "transition_complete_keyframe", PlayListBGFrame3 )
					end
				end
				
				PlayListBG:completeAnimation()
				self.PlayListBG:setAlpha( 0 )
				PlayListBGFrame2( PlayListBG, {} )
				local PlayListNameFrame2 = function ( PlayListName, event )
					local PlayListNameFrame3 = function ( PlayListName, event )
						local PlayListNameFrame4 = function ( PlayListName, event )
							local PlayListNameFrame5 = function ( PlayListName, event )
								local PlayListNameFrame6 = function ( PlayListName, event )
									if not event.interrupted then
										PlayListName:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
									end
									PlayListName:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( PlayListName, event )
									else
										PlayListName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									PlayListNameFrame6( PlayListName, event )
									return 
								else
									PlayListName:beginAnimation( "keyframe", 1110, false, false, CoD.TweenType.Linear )
									PlayListName:registerEventHandler( "transition_complete_keyframe", PlayListNameFrame6 )
								end
							end
							
							if event.interrupted then
								PlayListNameFrame5( PlayListName, event )
								return 
							else
								PlayListName:beginAnimation( "keyframe", 350, false, false, CoD.TweenType.Linear )
								PlayListName:setAlpha( 0 )
								PlayListName:registerEventHandler( "transition_complete_keyframe", PlayListNameFrame5 )
							end
						end
						
						if event.interrupted then
							PlayListNameFrame4( PlayListName, event )
							return 
						else
							PlayListName:beginAnimation( "keyframe", 680, false, false, CoD.TweenType.Linear )
							PlayListName:registerEventHandler( "transition_complete_keyframe", PlayListNameFrame4 )
						end
					end
					
					if event.interrupted then
						PlayListNameFrame3( PlayListName, event )
						return 
					else
						PlayListName:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						PlayListName:setAlpha( 1 )
						PlayListName:registerEventHandler( "transition_complete_keyframe", PlayListNameFrame3 )
					end
				end
				
				PlayListName:completeAnimation()
				self.PlayListName:setAlpha( 0 )
				PlayListNameFrame2( PlayListName, {} )
				local CurrentStarsFrame2 = function ( CurrentStars, event )
					local CurrentStarsFrame3 = function ( CurrentStars, event )
						if not event.interrupted then
							CurrentStars:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
						end
						CurrentStars:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( CurrentStars, event )
						else
							CurrentStars:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CurrentStarsFrame3( CurrentStars, event )
						return 
					else
						CurrentStars:beginAnimation( "keyframe", 2440, false, false, CoD.TweenType.Linear )
						CurrentStars:registerEventHandler( "transition_complete_keyframe", CurrentStarsFrame3 )
					end
				end
				
				CurrentStars:completeAnimation()
				self.CurrentStars:setAlpha( 0 )
				CurrentStarsFrame2( CurrentStars, {} )
				local CurrentRankTextFrame2 = function ( CurrentRankText, event )
					local CurrentRankTextFrame3 = function ( CurrentRankText, event )
						if not event.interrupted then
							CurrentRankText:beginAnimation( "keyframe", 369, false, false, CoD.TweenType.Linear )
						end
						CurrentRankText:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( CurrentRankText, event )
						else
							CurrentRankText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CurrentRankTextFrame3( CurrentRankText, event )
						return 
					else
						CurrentRankText:beginAnimation( "keyframe", 2460, false, false, CoD.TweenType.Linear )
						CurrentRankText:registerEventHandler( "transition_complete_keyframe", CurrentRankTextFrame3 )
					end
				end
				
				CurrentRankText:completeAnimation()
				self.CurrentRankText:setAlpha( 0 )
				CurrentRankTextFrame2( CurrentRankText, {} )
				local highlight1Frame2 = function ( highlight1, event )
					local highlight1Frame3 = function ( highlight1, event )
						local highlight1Frame4 = function ( highlight1, event )
							local highlight1Frame5 = function ( highlight1, event )
								if not event.interrupted then
									highlight1:beginAnimation( "keyframe", 539, false, false, CoD.TweenType.Linear )
								end
								highlight1:setAlpha( 0 )
								highlight1:setZRot( 325 )
								highlight1:setScale( 2 )
								if event.interrupted then
									self.clipFinished( highlight1, event )
								else
									highlight1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								highlight1Frame5( highlight1, event )
								return 
							else
								highlight1:beginAnimation( "keyframe", 130, false, false, CoD.TweenType.Linear )
								highlight1:setAlpha( 0.78 )
								highlight1:setZRot( 208 )
								highlight1:setScale( 2 )
								highlight1:registerEventHandler( "transition_complete_keyframe", highlight1Frame5 )
							end
						end
						
						if event.interrupted then
							highlight1Frame4( highlight1, event )
							return 
						else
							highlight1:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
							highlight1:setAlpha( 0.38 )
							highlight1:setZRot( 180 )
							highlight1:setScale( 1.48 )
							highlight1:registerEventHandler( "transition_complete_keyframe", highlight1Frame4 )
						end
					end
					
					if event.interrupted then
						highlight1Frame3( highlight1, event )
						return 
					else
						highlight1:beginAnimation( "keyframe", 2220, false, false, CoD.TweenType.Linear )
						highlight1:registerEventHandler( "transition_complete_keyframe", highlight1Frame3 )
					end
				end
				
				highlight1:completeAnimation()
				self.highlight1:setAlpha( 0 )
				self.highlight1:setZRot( 0 )
				self.highlight1:setScale( 1 )
				highlight1Frame2( highlight1, {} )
				local highlight00Frame2 = function ( highlight00, event )
					local highlight00Frame3 = function ( highlight00, event )
						local highlight00Frame4 = function ( highlight00, event )
							local highlight00Frame5 = function ( highlight00, event )
								if not event.interrupted then
									highlight00:beginAnimation( "keyframe", 539, false, false, CoD.TweenType.Linear )
								end
								highlight00:setAlpha( 0 )
								highlight00:setZRot( 350 )
								highlight00:setScale( 2.1 )
								if event.interrupted then
									self.clipFinished( highlight00, event )
								else
									highlight00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								highlight00Frame5( highlight00, event )
								return 
							else
								highlight00:beginAnimation( "keyframe", 130, false, false, CoD.TweenType.Linear )
								highlight00:setAlpha( 0.31 )
								highlight00:setZRot( 213 )
								highlight00:setScale( 2.1 )
								highlight00:registerEventHandler( "transition_complete_keyframe", highlight00Frame5 )
							end
						end
						
						if event.interrupted then
							highlight00Frame4( highlight00, event )
							return 
						else
							highlight00:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
							highlight00:setAlpha( 0.38 )
							highlight00:setZRot( 180 )
							highlight00:setScale( 1.72 )
							highlight00:registerEventHandler( "transition_complete_keyframe", highlight00Frame4 )
						end
					end
					
					if event.interrupted then
						highlight00Frame3( highlight00, event )
						return 
					else
						highlight00:beginAnimation( "keyframe", 2220, false, false, CoD.TweenType.Linear )
						highlight00:registerEventHandler( "transition_complete_keyframe", highlight00Frame3 )
					end
				end
				
				highlight00:completeAnimation()
				self.highlight00:setAlpha( 0 )
				self.highlight00:setZRot( 0 )
				self.highlight00:setScale( 1 )
				highlight00Frame2( highlight00, {} )
				local highlight0Frame2 = function ( highlight0, event )
					local highlight0Frame3 = function ( highlight0, event )
						local highlight0Frame4 = function ( highlight0, event )
							local highlight0Frame5 = function ( highlight0, event )
								if not event.interrupted then
									highlight0:beginAnimation( "keyframe", 539, false, false, CoD.TweenType.Linear )
								end
								highlight0:setAlpha( 0 )
								highlight0:setZRot( 325 )
								highlight0:setScale( 1 )
								if event.interrupted then
									self.clipFinished( highlight0, event )
								else
									highlight0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								highlight0Frame5( highlight0, event )
								return 
							else
								highlight0:beginAnimation( "keyframe", 130, false, false, CoD.TweenType.Linear )
								highlight0:setAlpha( 0.78 )
								highlight0:setZRot( 208 )
								highlight0:setScale( 2 )
								highlight0:registerEventHandler( "transition_complete_keyframe", highlight0Frame5 )
							end
						end
						
						if event.interrupted then
							highlight0Frame4( highlight0, event )
							return 
						else
							highlight0:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
							highlight0:setAlpha( 0.38 )
							highlight0:setZRot( 108 )
							highlight0:setScale( 1.48 )
							highlight0:registerEventHandler( "transition_complete_keyframe", highlight0Frame4 )
						end
					end
					
					if event.interrupted then
						highlight0Frame3( highlight0, event )
						return 
					else
						highlight0:beginAnimation( "keyframe", 2220, false, false, CoD.TweenType.Linear )
						highlight0:registerEventHandler( "transition_complete_keyframe", highlight0Frame3 )
					end
				end
				
				highlight0:completeAnimation()
				self.highlight0:setAlpha( 0 )
				self.highlight0:setZRot( 0 )
				self.highlight0:setScale( 1 )
				highlight0Frame2( highlight0, {} )
				local highlightFrame2 = function ( highlight, event )
					local highlightFrame3 = function ( highlight, event )
						local highlightFrame4 = function ( highlight, event )
							local highlightFrame5 = function ( highlight, event )
								if not event.interrupted then
									highlight:beginAnimation( "keyframe", 539, false, false, CoD.TweenType.Linear )
								end
								highlight:setAlpha( 0 )
								highlight:setZRot( 108 )
								highlight:setScale( 3.3 )
								if event.interrupted then
									self.clipFinished( highlight, event )
								else
									highlight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								highlightFrame5( highlight, event )
								return 
							else
								highlight:beginAnimation( "keyframe", 130, false, false, CoD.TweenType.Linear )
								highlight:setAlpha( 0.38 )
								highlight:setZRot( 108 )
								highlight:setScale( 2.5 )
								highlight:registerEventHandler( "transition_complete_keyframe", highlightFrame5 )
							end
						end
						
						if event.interrupted then
							highlightFrame4( highlight, event )
							return 
						else
							highlight:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
							highlight:setScale( 1.72 )
							highlight:registerEventHandler( "transition_complete_keyframe", highlightFrame4 )
						end
					end
					
					if event.interrupted then
						highlightFrame3( highlight, event )
						return 
					else
						highlight:beginAnimation( "keyframe", 2220, false, false, CoD.TweenType.Linear )
						highlight:registerEventHandler( "transition_complete_keyframe", highlightFrame3 )
					end
				end
				
				highlight:completeAnimation()
				self.highlight:setAlpha( 0 )
				self.highlight:setZRot( 0 )
				self.highlight:setScale( 1 )
				highlightFrame2( highlight, {} )
				local CurrentRankFrame2 = function ( CurrentRank, event )
					local CurrentRankFrame3 = function ( CurrentRank, event )
						local CurrentRankFrame4 = function ( CurrentRank, event )
							local CurrentRankFrame5 = function ( CurrentRank, event )
								local CurrentRankFrame6 = function ( CurrentRank, event )
									if not event.interrupted then
										CurrentRank:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
									end
									CurrentRank:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( CurrentRank, event )
									else
										CurrentRank:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									CurrentRankFrame6( CurrentRank, event )
									return 
								else
									CurrentRank:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
									CurrentRank:registerEventHandler( "transition_complete_keyframe", CurrentRankFrame6 )
								end
							end
							
							if event.interrupted then
								CurrentRankFrame5( CurrentRank, event )
								return 
							else
								CurrentRank:beginAnimation( "keyframe", 130, false, false, CoD.TweenType.Linear )
								CurrentRank:setAlpha( 0.5 )
								CurrentRank:registerEventHandler( "transition_complete_keyframe", CurrentRankFrame5 )
							end
						end
						
						if event.interrupted then
							CurrentRankFrame4( CurrentRank, event )
							return 
						else
							CurrentRank:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
							CurrentRank:registerEventHandler( "transition_complete_keyframe", CurrentRankFrame4 )
						end
					end
					
					if event.interrupted then
						CurrentRankFrame3( CurrentRank, event )
						return 
					else
						CurrentRank:beginAnimation( "keyframe", 2079, false, false, CoD.TweenType.Linear )
						CurrentRank:registerEventHandler( "transition_complete_keyframe", CurrentRankFrame3 )
					end
				end
				
				CurrentRank:completeAnimation()
				self.CurrentRank:setAlpha( 0 )
				CurrentRankFrame2( CurrentRank, {} )
				local CurrentRankADDFrame2 = function ( CurrentRankADD, event )
					local CurrentRankADDFrame3 = function ( CurrentRankADD, event )
						if not event.interrupted then
							CurrentRankADD:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						end
						CurrentRankADD:setAlpha( 0 )
						CurrentRankADD:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
						CurrentRankADD:setShaderVector( 0, 2, 0, 0, 0 )
						CurrentRankADD:setShaderVector( 1, 1, 0, 0, 0 )
						CurrentRankADD:setShaderVector( 2, 0.03, 0, 0, 0 )
						if event.interrupted then
							self.clipFinished( CurrentRankADD, event )
						else
							CurrentRankADD:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CurrentRankADDFrame3( CurrentRankADD, event )
						return 
					else
						CurrentRankADD:beginAnimation( "keyframe", 130, false, false, CoD.TweenType.Linear )
						CurrentRankADD:setAlpha( 1 )
						CurrentRankADD:registerEventHandler( "transition_complete_keyframe", CurrentRankADDFrame3 )
					end
				end
				
				CurrentRankADD:beginAnimation( "keyframe", 2339, false, false, CoD.TweenType.Linear )
				CurrentRankADD:setAlpha( 0 )
				CurrentRankADD:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
				CurrentRankADD:setShaderVector( 0, 2, 0, 0, 0 )
				CurrentRankADD:setShaderVector( 1, 1, 0, 0, 0 )
				CurrentRankADD:setShaderVector( 2, 0.03, 0, 0, 0 )
				CurrentRankADD:registerEventHandler( "transition_complete_keyframe", CurrentRankADDFrame2 )
				local PreviousStarsFrame2 = function ( PreviousStars, event )
					local PreviousStarsFrame3 = function ( PreviousStars, event )
						local PreviousStarsFrame4 = function ( PreviousStars, event )
							local PreviousStarsFrame5 = function ( PreviousStars, event )
								if not event.interrupted then
									PreviousStars:beginAnimation( "keyframe", 759, false, false, CoD.TweenType.Linear )
								end
								PreviousStars:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( PreviousStars, event )
								else
									PreviousStars:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								PreviousStarsFrame5( PreviousStars, event )
								return 
							else
								PreviousStars:beginAnimation( "keyframe", 350, false, false, CoD.TweenType.Linear )
								PreviousStars:setAlpha( 0 )
								PreviousStars:registerEventHandler( "transition_complete_keyframe", PreviousStarsFrame5 )
							end
						end
						
						if event.interrupted then
							PreviousStarsFrame4( PreviousStars, event )
							return 
						else
							PreviousStars:beginAnimation( "keyframe", 680, false, false, CoD.TweenType.Linear )
							PreviousStars:registerEventHandler( "transition_complete_keyframe", PreviousStarsFrame4 )
						end
					end
					
					if event.interrupted then
						PreviousStarsFrame3( PreviousStars, event )
						return 
					else
						PreviousStars:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						PreviousStars:setAlpha( 1 )
						PreviousStars:registerEventHandler( "transition_complete_keyframe", PreviousStarsFrame3 )
					end
				end
				
				PreviousStars:completeAnimation()
				self.PreviousStars:setAlpha( 0 )
				PreviousStarsFrame2( PreviousStars, {} )
				local PreviousRankTextFrame2 = function ( PreviousRankText, event )
					local PreviousRankTextFrame3 = function ( PreviousRankText, event )
						local PreviousRankTextFrame4 = function ( PreviousRankText, event )
							local PreviousRankTextFrame5 = function ( PreviousRankText, event )
								if not event.interrupted then
									PreviousRankText:beginAnimation( "keyframe", 759, false, false, CoD.TweenType.Linear )
								end
								PreviousRankText:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( PreviousRankText, event )
								else
									PreviousRankText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								PreviousRankTextFrame5( PreviousRankText, event )
								return 
							else
								PreviousRankText:beginAnimation( "keyframe", 350, false, false, CoD.TweenType.Linear )
								PreviousRankText:setAlpha( 0 )
								PreviousRankText:registerEventHandler( "transition_complete_keyframe", PreviousRankTextFrame5 )
							end
						end
						
						if event.interrupted then
							PreviousRankTextFrame4( PreviousRankText, event )
							return 
						else
							PreviousRankText:beginAnimation( "keyframe", 680, false, false, CoD.TweenType.Linear )
							PreviousRankText:registerEventHandler( "transition_complete_keyframe", PreviousRankTextFrame4 )
						end
					end
					
					if event.interrupted then
						PreviousRankTextFrame3( PreviousRankText, event )
						return 
					else
						PreviousRankText:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						PreviousRankText:setAlpha( 1 )
						PreviousRankText:registerEventHandler( "transition_complete_keyframe", PreviousRankTextFrame3 )
					end
				end
				
				PreviousRankText:completeAnimation()
				self.PreviousRankText:setAlpha( 0 )
				PreviousRankTextFrame2( PreviousRankText, {} )
				local PreviousRankAddFrame2 = function ( PreviousRankAdd, event )
					local PreviousRankAddFrame3 = function ( PreviousRankAdd, event )
						local PreviousRankAddFrame4 = function ( PreviousRankAdd, event )
							local PreviousRankAddFrame5 = function ( PreviousRankAdd, event )
								if not event.interrupted then
									PreviousRankAdd:beginAnimation( "keyframe", 759, false, false, CoD.TweenType.Linear )
								end
								PreviousRankAdd:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( PreviousRankAdd, event )
								else
									PreviousRankAdd:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								PreviousRankAddFrame5( PreviousRankAdd, event )
								return 
							else
								PreviousRankAdd:beginAnimation( "keyframe", 350, false, false, CoD.TweenType.Linear )
								PreviousRankAdd:setAlpha( 0 )
								PreviousRankAdd:registerEventHandler( "transition_complete_keyframe", PreviousRankAddFrame5 )
							end
						end
						
						if event.interrupted then
							PreviousRankAddFrame4( PreviousRankAdd, event )
							return 
						else
							PreviousRankAdd:beginAnimation( "keyframe", 680, false, false, CoD.TweenType.Linear )
							PreviousRankAdd:registerEventHandler( "transition_complete_keyframe", PreviousRankAddFrame4 )
						end
					end
					
					if event.interrupted then
						PreviousRankAddFrame3( PreviousRankAdd, event )
						return 
					else
						PreviousRankAdd:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						PreviousRankAdd:setAlpha( 1 )
						PreviousRankAdd:registerEventHandler( "transition_complete_keyframe", PreviousRankAddFrame3 )
					end
				end
				
				PreviousRankAdd:completeAnimation()
				self.PreviousRankAdd:setAlpha( 0 )
				PreviousRankAddFrame2( PreviousRankAdd, {} )
				local ArenaVictoryFrame2 = function ( ArenaVictory, event )
					if not event.interrupted then
						ArenaVictory:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					ArenaVictory:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( ArenaVictory, event )
					else
						ArenaVictory:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ArenaVictory:completeAnimation()
				self.ArenaVictory:setAlpha( 0 )
				ArenaVictoryFrame2( ArenaVictory, {} )
				local CurrentRankR1Frame2 = function ( CurrentRankR1, event )
					local CurrentRankR1Frame3 = function ( CurrentRankR1, event )
						local CurrentRankR1Frame4 = function ( CurrentRankR1, event )
							local CurrentRankR1Frame5 = function ( CurrentRankR1, event )
								if not event.interrupted then
									CurrentRankR1:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
								end
								CurrentRankR1:setLeftRight( 0.5, 0.5, -222, 222 )
								CurrentRankR1:setTopBottom( 0, 0, 302, 746 )
								CurrentRankR1:setAlpha( 0 )
								CurrentRankR1:setScale( 1 )
								if event.interrupted then
									self.clipFinished( CurrentRankR1, event )
								else
									CurrentRankR1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								CurrentRankR1Frame5( CurrentRankR1, event )
								return 
							else
								CurrentRankR1:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
								CurrentRankR1:setLeftRight( 0.5, 0.5, -223, 221 )
								CurrentRankR1:setTopBottom( 0, 0, 308, 752 )
								CurrentRankR1:setAlpha( 0.54 )
								CurrentRankR1:setScale( 1 )
								CurrentRankR1:registerEventHandler( "transition_complete_keyframe", CurrentRankR1Frame5 )
							end
						end
						
						if event.interrupted then
							CurrentRankR1Frame4( CurrentRankR1, event )
							return 
						else
							CurrentRankR1:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
							CurrentRankR1:setLeftRight( 0.5, 0.5, -13, 431 )
							CurrentRankR1:setTopBottom( 0, 0, 316, 760 )
							CurrentRankR1:setAlpha( 0.75 )
							CurrentRankR1:setScale( 1.47 )
							CurrentRankR1:registerEventHandler( "transition_complete_keyframe", CurrentRankR1Frame4 )
						end
					end
					
					if event.interrupted then
						CurrentRankR1Frame3( CurrentRankR1, event )
						return 
					else
						CurrentRankR1:beginAnimation( "keyframe", 2190, false, false, CoD.TweenType.Linear )
						CurrentRankR1:registerEventHandler( "transition_complete_keyframe", CurrentRankR1Frame3 )
					end
				end
				
				CurrentRankR1:completeAnimation()
				self.CurrentRankR1:setLeftRight( 0.5, 0.5, 220, 664 )
				self.CurrentRankR1:setTopBottom( 0, 0, 327, 771 )
				self.CurrentRankR1:setAlpha( 0 )
				self.CurrentRankR1:setScale( 2 )
				CurrentRankR1Frame2( CurrentRankR1, {} )
				local CurrentRankL1Frame2 = function ( CurrentRankL1, event )
					local CurrentRankL1Frame3 = function ( CurrentRankL1, event )
						local CurrentRankL1Frame4 = function ( CurrentRankL1, event )
							local CurrentRankL1Frame5 = function ( CurrentRankL1, event )
								if not event.interrupted then
									CurrentRankL1:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
								end
								CurrentRankL1:setLeftRight( 0.5, 0.5, -222, 222 )
								CurrentRankL1:setTopBottom( 0, 0, 302, 746 )
								CurrentRankL1:setAlpha( 0 )
								CurrentRankL1:setScale( 1 )
								if event.interrupted then
									self.clipFinished( CurrentRankL1, event )
								else
									CurrentRankL1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								CurrentRankL1Frame5( CurrentRankL1, event )
								return 
							else
								CurrentRankL1:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
								CurrentRankL1:setLeftRight( 0.5, 0.5, -224, 220 )
								CurrentRankL1:setTopBottom( 0, 0, 306, 750 )
								CurrentRankL1:setAlpha( 0.54 )
								CurrentRankL1:setScale( 1 )
								CurrentRankL1:registerEventHandler( "transition_complete_keyframe", CurrentRankL1Frame5 )
							end
						end
						
						if event.interrupted then
							CurrentRankL1Frame4( CurrentRankL1, event )
							return 
						else
							CurrentRankL1:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
							CurrentRankL1:setLeftRight( 0.5, 0.5, -431, 13 )
							CurrentRankL1:setTopBottom( 0, 0, 316, 760 )
							CurrentRankL1:setAlpha( 0.75 )
							CurrentRankL1:setScale( 1.47 )
							CurrentRankL1:registerEventHandler( "transition_complete_keyframe", CurrentRankL1Frame4 )
						end
					end
					
					if event.interrupted then
						CurrentRankL1Frame3( CurrentRankL1, event )
						return 
					else
						CurrentRankL1:beginAnimation( "keyframe", 2190, false, false, CoD.TweenType.Linear )
						CurrentRankL1:registerEventHandler( "transition_complete_keyframe", CurrentRankL1Frame3 )
					end
				end
				
				CurrentRankL1:completeAnimation()
				self.CurrentRankL1:setLeftRight( 0.5, 0.5, -668, -224 )
				self.CurrentRankL1:setTopBottom( 0, 0, 327, 771 )
				self.CurrentRankL1:setAlpha( 0 )
				self.CurrentRankL1:setScale( 2 )
				CurrentRankL1Frame2( CurrentRankL1, {} )
				local CurrentRankC1Frame2 = function ( CurrentRankC1, event )
					local CurrentRankC1Frame3 = function ( CurrentRankC1, event )
						local CurrentRankC1Frame4 = function ( CurrentRankC1, event )
							local CurrentRankC1Frame5 = function ( CurrentRankC1, event )
								if not event.interrupted then
									CurrentRankC1:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
								end
								CurrentRankC1:setLeftRight( 0.5, 0.5, -222, 222 )
								CurrentRankC1:setTopBottom( 0, 0, 302, 746 )
								CurrentRankC1:setAlpha( 0 )
								CurrentRankC1:setScale( 1 )
								if event.interrupted then
									self.clipFinished( CurrentRankC1, event )
								else
									CurrentRankC1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								CurrentRankC1Frame5( CurrentRankC1, event )
								return 
							else
								CurrentRankC1:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
								CurrentRankC1:setLeftRight( 0.5, 0.5, -222, 222 )
								CurrentRankC1:setTopBottom( 0, 0, 302, 746 )
								CurrentRankC1:setAlpha( 0.54 )
								CurrentRankC1:setScale( 1 )
								CurrentRankC1:registerEventHandler( "transition_complete_keyframe", CurrentRankC1Frame5 )
							end
						end
						
						if event.interrupted then
							CurrentRankC1Frame4( CurrentRankC1, event )
							return 
						else
							CurrentRankC1:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
							CurrentRankC1:setTopBottom( 0, 0, 320, 764 )
							CurrentRankC1:setAlpha( 0.75 )
							CurrentRankC1:setScale( 1.47 )
							CurrentRankC1:registerEventHandler( "transition_complete_keyframe", CurrentRankC1Frame4 )
						end
					end
					
					if event.interrupted then
						CurrentRankC1Frame3( CurrentRankC1, event )
						return 
					else
						CurrentRankC1:beginAnimation( "keyframe", 2190, false, false, CoD.TweenType.Linear )
						CurrentRankC1:registerEventHandler( "transition_complete_keyframe", CurrentRankC1Frame3 )
					end
				end
				
				CurrentRankC1:completeAnimation()
				self.CurrentRankC1:setLeftRight( 0.5, 0.5, -224, 220 )
				self.CurrentRankC1:setTopBottom( 0, 0, 327, 771 )
				self.CurrentRankC1:setAlpha( 0 )
				self.CurrentRankC1:setScale( 2 )
				CurrentRankC1Frame2( CurrentRankC1, {} )
				local CurrentRankglintFrame2 = function ( CurrentRankglint, event )
					local CurrentRankglintFrame3 = function ( CurrentRankglint, event )
						local CurrentRankglintFrame4 = function ( CurrentRankglint, event )
							local CurrentRankglintFrame5 = function ( CurrentRankglint, event )
								local CurrentRankglintFrame6 = function ( CurrentRankglint, event )
									local CurrentRankglintFrame7 = function ( CurrentRankglint, event )
										if not event.interrupted then
											CurrentRankglint:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
										end
										CurrentRankglint:setRGB( 1, 0.8, 0 )
										CurrentRankglint:setAlpha( 0 )
										CurrentRankglint:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_glint_reveal" ) )
										CurrentRankglint:setShaderVector( 0, 1, 0, 0, 0 )
										if event.interrupted then
											self.clipFinished( CurrentRankglint, event )
										else
											CurrentRankglint:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										CurrentRankglintFrame7( CurrentRankglint, event )
										return 
									else
										CurrentRankglint:beginAnimation( "keyframe", 420, false, false, CoD.TweenType.Linear )
										CurrentRankglint:setAlpha( 0.11 )
										CurrentRankglint:setShaderVector( 0, 1, 0, 0, 0 )
										CurrentRankglint:registerEventHandler( "transition_complete_keyframe", CurrentRankglintFrame7 )
									end
								end
								
								if event.interrupted then
									CurrentRankglintFrame6( CurrentRankglint, event )
									return 
								else
									CurrentRankglint:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
									CurrentRankglint:setShaderVector( 0, 0.46, 0, 0, 0 )
									CurrentRankglint:registerEventHandler( "transition_complete_keyframe", CurrentRankglintFrame6 )
								end
							end
							
							if event.interrupted then
								CurrentRankglintFrame5( CurrentRankglint, event )
								return 
							else
								CurrentRankglint:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
								CurrentRankglint:setShaderVector( 0, 0.05, 0, 0, 0 )
								CurrentRankglint:registerEventHandler( "transition_complete_keyframe", CurrentRankglintFrame5 )
							end
						end
						
						if event.interrupted then
							CurrentRankglintFrame4( CurrentRankglint, event )
							return 
						else
							CurrentRankglint:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
							CurrentRankglint:registerEventHandler( "transition_complete_keyframe", CurrentRankglintFrame4 )
						end
					end
					
					if event.interrupted then
						CurrentRankglintFrame3( CurrentRankglint, event )
						return 
					else
						CurrentRankglint:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
						CurrentRankglint:setAlpha( 1 )
						CurrentRankglint:registerEventHandler( "transition_complete_keyframe", CurrentRankglintFrame3 )
					end
				end
				
				CurrentRankglint:beginAnimation( "keyframe", 2470, false, false, CoD.TweenType.Linear )
				CurrentRankglint:setRGB( 1, 0.8, 0 )
				CurrentRankglint:setAlpha( 0 )
				CurrentRankglint:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_glint_reveal" ) )
				CurrentRankglint:setShaderVector( 0, 0, 0, 0, 0 )
				CurrentRankglint:registerEventHandler( "transition_complete_keyframe", CurrentRankglintFrame2 )
				local rankupFrame2 = function ( rankup, event )
					if not event.interrupted then
						rankup:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
					end
					rankup:playSound( "uin_arena_rank_up", controller )
					if event.interrupted then
						self.clipFinished( rankup, event )
					else
						rankup:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				rankup:beginAnimation( "keyframe", 1990, false, false, CoD.TweenType.Linear )
				rankup:playSound( "0", controller )
				rankup:registerEventHandler( "transition_complete_keyframe", rankupFrame2 )
			end
		}
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if AnyRewardsEarnedDuringMatch( controller ) then
			GoBackAndOpenOverlayOnParent( self, "RewardsOverlay", controller )
			return true
		else
			GoBackAndOpenOverlayOnParent( self, "MPAAR", controller )
			return true
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_CONTINUE", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "ESCAPE", function ( element, menu, controller, model )
		if AnyRewardsEarnedDuringMatch( controller ) then
			GoBackAndOpenOverlayOnParent( self, "RewardsOverlay", controller )
			return true
		else
			GoBackAndOpenOverlayOnParent( self, "MPAAR", controller )
			return true
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "", nil )
		return false
	end, false )
	MenuFrame:setModel( self.buttonModel, controller )
	CurrentStars.id = "CurrentStars"
	PreviousStars.id = "PreviousStars"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.CurrentStars:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LeftPanel:close()
		self.FadeForStreamer:close()
		self.VignetteBack:close()
		self.MenuFrame:close()
		self.RankImageBorder:close()
		self.RankFrame:close()
		self.PlayListBG:close()
		self.CurrentStars:close()
		self.CurrentRank:close()
		self.PreviousStars:close()
		self.PreviousRankAdd:close()
		self.ArenaVictory:close()
		self.CurrentRankglint:close()
		self.PlayListName:close()
		self.CurrentRankText:close()
		self.CurrentRankADD:close()
		self.PreviousRankText:close()
		self.CurrentRankR1:close()
		self.CurrentRankL1:close()
		self.CurrentRankC1:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "ArenaResult.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

