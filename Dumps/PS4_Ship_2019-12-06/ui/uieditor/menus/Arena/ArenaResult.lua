require( "ui.uieditor.menus.AAR.RewardsOverlay" )
require( "ui.uieditor.menus.AAR.MPAAR" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.LobbyStreamerBlackFade" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_VignetteBack" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.Lobby.Common.FE_SlideSubHeader" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ListHeaderGlow" )
require( "ui.uieditor.widgets.Arena.ArenaStarbig" )
require( "ui.uieditor.widgets.Arena.ArenaRankSmall" )
require( "ui.uieditor.widgets.Arena.ArenaVictory" )

local PreLoadFunc = function ( self, controller )
	self.disablePopupOpenCloseAnim = true
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	f2_arg0:subscribeToModel( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame" ), "closeAAR" ), function ( model )
		f2_arg0:close()
	end, false )
end

local f0_local2 = function ( f4_arg0, f4_arg1 )
	local f4_local0 = "Arena_Result_Stars_Previous"
	DataSources[f4_local0] = DataSourceHelpers.ListSetup( f4_local0, function ( f5_arg0 )
		local f5_local0 = {}
		local f5_local1 = f4_arg0.rank < f4_arg1.rank
		for f5_local2 = 0, f4_arg0.maxStars - 1, 1 do
			table.insert( f5_local0, {
				models = {
					earned = f5_local2 < f4_arg0.starsEarned
				}
			} )
		end
		return f5_local0
	end )
	return f4_local0
end

local f0_local3 = function ( f6_arg0, f6_arg1 )
	local f6_local0 = "Arena_Result_Stars_Current"
	DataSources[f6_local0] = DataSourceHelpers.ListSetup( f6_local0, function ( f7_arg0 )
		local f7_local0 = {}
		local f7_local1 = f6_arg1.starsEarned - f6_arg0.starsEarned
		local f7_local2 = f6_arg0.rank < f6_arg1.rank
		for f7_local3 = 0, f6_arg1.maxStars - 1, 1 do
			local f7_local6 = f7_local3 < f6_arg1.starsEarned
			local f7_local7 = f7_local6 and f6_arg1.starsEarned - f7_local1 <= f7_local3
			local f7_local8 = f7_local3 < f6_arg0.starsEarned
			local f7_local9
			if not f7_local6 then
				local f7_local10 = f7_local8
				f7_local9 = not f7_local2
			else
				f7_local9 = false
			end
			table.insert( f7_local0, {
				models = {
					earned = f7_local6,
					new = f7_local7,
					lost = f7_local9
				}
			} )
		end
		return f7_local0
	end )
	return f6_local0
end

DataSources.ArenaResult = {
	getModel = function ( f8_arg0 )
		local f8_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "arenaResult" )
		local f8_local1 = Engine.GetPlaylistInfoByID( Engine.GetPlaylistID() )
		local f8_local2 = CoD.GetPlayerStats( f8_arg0 )
		local f8_local3 = {
			points = f8_local2.arenaStats[f8_local1.playlist.arenaSlot].matchStartPoints:get(),
			rank = CoD.ArenaUtility.GetRank( f8_local3.points ),
			maxStars = CoD.ArenaUtility.GetRankVisibleStars( f8_local3.points ),
			starsEarned = CoD.ArenaUtility.GetStarCount( f8_local3.points )
		}
		local f8_local4 = {
			points = f8_local2.arenaStats[f8_local1.playlist.arenaSlot].points:get(),
			rank = CoD.ArenaUtility.GetRank( f8_local4.points ),
			maxStars = CoD.ArenaUtility.GetRankVisibleStars( f8_local4.points ),
			starsEarned = CoD.ArenaUtility.GetStarCount( f8_local4.points )
		}
		Engine.SetModelValue( Engine.CreateModel( f8_local0, "previousPoints" ), f8_local3.points )
		Engine.SetModelValue( Engine.CreateModel( f8_local0, "previousStarsDatasource" ), f0_local2( f8_local3, f8_local4 ) )
		Engine.SetModelValue( Engine.CreateModel( f8_local0, "currentPoints" ), f8_local4.points )
		Engine.SetModelValue( Engine.CreateModel( f8_local0, "currentStarsDatasource" ), f0_local3( f8_local3, f8_local4 ) )
		return f8_local0
	end
}
LUI.createMenu.ArenaResult = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ArenaResult" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ArenaResult.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( true, true, 0, 0 )
	LeftPanel:setTopBottom( true, true, 0, 0 )
	LeftPanel:setRGB( 0.31, 0.31, 0.31 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local FadeForStreamer = CoD.LobbyStreamerBlackFade.new( self, controller )
	FadeForStreamer:setLeftRight( true, true, 0, 0 )
	FadeForStreamer:setTopBottom( true, true, 0, 0 )
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
	self:addElement( FadeForStreamer )
	self.FadeForStreamer = FadeForStreamer
	
	local VignetteBack = CoD.VehicleGround_VignetteBack.new( self, controller )
	VignetteBack:setLeftRight( true, true, 0, 0 )
	VignetteBack:setTopBottom( true, true, 0, 0 )
	self:addElement( VignetteBack )
	self.VignetteBack = VignetteBack
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_ARENA_RANK_PROGRESS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_ARENA_RANK_PROGRESS" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local Team1Vignette = LUI.UIImage.new()
	Team1Vignette:setLeftRight( true, true, 0, 0 )
	Team1Vignette:setTopBottom( false, false, -15, 169 )
	Team1Vignette:setAlpha( 0.44 )
	Team1Vignette:setXRot( -180 )
	Team1Vignette:setImage( RegisterImage( "uie_t7_mp_menu_startflow_vignette" ) )
	Team1Vignette:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiply" ) )
	self:addElement( Team1Vignette )
	self.Team1Vignette = Team1Vignette
	
	local Team1Line = LUI.UIImage.new()
	Team1Line:setLeftRight( true, true, -11, 11 )
	Team1Line:setTopBottom( false, false, -19, -11 )
	Team1Line:setAlpha( 0.2 )
	Team1Line:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Team1Line:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Team1Line )
	self.Team1Line = Team1Line
	
	local BoxButtonLrgIdle = LUI.UIImage.new()
	BoxButtonLrgIdle:setLeftRight( false, false, -171, 172 )
	BoxButtonLrgIdle:setTopBottom( true, false, 180.05, 523 )
	BoxButtonLrgIdle:setAlpha( 0 )
	BoxButtonLrgIdle:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrgidlefull" ) )
	BoxButtonLrgIdle:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	BoxButtonLrgIdle:setShaderVector( 0, 0.12, 0.12, 0, 0 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local RankImageBorder = CoD.FE_TitleNumBrdr.new( self, controller )
	RankImageBorder:setLeftRight( false, false, -166, 166 )
	RankImageBorder:setTopBottom( true, false, 185, 517 )
	RankImageBorder:setAlpha( 0 )
	self:addElement( RankImageBorder )
	self.RankImageBorder = RankImageBorder
	
	local RankFrame = CoD.FE_SlideSubHeader.new( self, controller )
	RankFrame:setLeftRight( false, false, -122, 125 )
	RankFrame:setTopBottom( true, false, 570.13, 606.13 )
	RankFrame.FELabelSubHeadingD0.Label0:setText( Engine.Localize( "" ) )
	self:addElement( RankFrame )
	self.RankFrame = RankFrame
	
	local PlayListBG = CoD.FE_ListHeaderGlow.new( self, controller )
	PlayListBG:setLeftRight( false, false, -122, 125 )
	PlayListBG:setTopBottom( true, false, 534, 568 )
	self:addElement( PlayListBG )
	self.PlayListBG = PlayListBG
	
	local PlayListName = LUI.UIText.new()
	PlayListName:setLeftRight( false, false, -120.5, 125 )
	PlayListName:setTopBottom( true, false, 538, 564 )
	PlayListName:setRGB( 0, 0, 0 )
	PlayListName:setTTF( "fonts/escom.ttf" )
	PlayListName:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	PlayListName:setShaderVector( 0, 0.06, 0, 0, 0 )
	PlayListName:setShaderVector( 1, 0.02, 0, 0, 0 )
	PlayListName:setShaderVector( 2, 1, 0, 0, 0 )
	PlayListName:setLetterSpacing( 1 )
	PlayListName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	PlayListName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	PlayListName:subscribeToGlobalModel( controller, "LobbyPlaylistName", "name", function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			PlayListName:setText( Engine.Localize( name ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( PlayListName, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 0 )
	end )
	self:addElement( PlayListName )
	self.PlayListName = PlayListName
	
	local CurrentStars = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	CurrentStars:makeFocusable()
	CurrentStars:setLeftRight( false, false, -124.5, 125.5 )
	CurrentStars:setTopBottom( true, false, 608.13, 648.13 )
	CurrentStars:setWidgetType( CoD.ArenaStarbig )
	CurrentStars:setHorizontalCount( 6 )
	CurrentStars:subscribeToGlobalModel( controller, "ArenaResult", "currentStarsDatasource", function ( model )
		local currentStarsDatasource = Engine.GetModelValue( model )
		if currentStarsDatasource then
			CurrentStars:setDataSource( currentStarsDatasource )
		end
	end )
	CurrentStars:registerEventHandler( "menu_loaded", function ( element, event )
		local f15_local0 = nil
		if ArenaRankIncreased( controller ) then
			PlayClip( self, "RankedUp", controller )
			PlayArenaChallengeToastsOnClipOver( self, controller )
		end
		if not f15_local0 then
			f15_local0 = element:dispatchEventToChildren( event )
		end
		return f15_local0
	end )
	self:addElement( CurrentStars )
	self.CurrentStars = CurrentStars
	
	local CurrentRankText = LUI.UIText.new()
	CurrentRankText:setLeftRight( false, false, -122, 125 )
	CurrentRankText:setTopBottom( true, false, 570, 604 )
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
		local currentPoints = Engine.GetModelValue( model )
		if currentPoints then
			CurrentRankText:setText( LocalizeToUpperString( GetArenaRankName( currentPoints ) ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( CurrentRankText, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 0 )
	end )
	self:addElement( CurrentRankText )
	self.CurrentRankText = CurrentRankText
	
	local highlight1 = LUI.UIImage.new()
	highlight1:setLeftRight( false, false, -117, 116.04 )
	highlight1:setTopBottom( true, false, 221.84, 448.16 )
	highlight1:setAlpha( 0 )
	highlight1:setZRot( 108 )
	highlight1:setScale( 2.59 )
	highlight1:setImage( RegisterImage( "uie_t7_hud_notficationhighlight" ) )
	highlight1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( highlight1 )
	self.highlight1 = highlight1
	
	local highlight00 = LUI.UIImage.new()
	highlight00:setLeftRight( false, false, -117, 116.04 )
	highlight00:setTopBottom( true, false, 221.84, 448.16 )
	highlight00:setRGB( 0.62, 0.49, 0.05 )
	highlight00:setAlpha( 0 )
	highlight00:setZRot( 221 )
	highlight00:setScale( 1.89 )
	highlight00:setImage( RegisterImage( "uie_t7_hud_notficationhighlight" ) )
	highlight00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( highlight00 )
	self.highlight00 = highlight00
	
	local highlight0 = LUI.UIImage.new()
	highlight0:setLeftRight( false, false, -117, 116.04 )
	highlight0:setTopBottom( true, false, 221.84, 448.16 )
	highlight0:setRGB( 0.62, 0.49, 0.05 )
	highlight0:setAlpha( 0 )
	highlight0:setZRot( 325 )
	highlight0:setImage( RegisterImage( "uie_t7_hud_notficationhighlight" ) )
	highlight0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( highlight0 )
	self.highlight0 = highlight0
	
	local highlight = LUI.UIImage.new()
	highlight:setLeftRight( false, false, -117, 116.04 )
	highlight:setTopBottom( true, false, 221.84, 448.16 )
	highlight:setAlpha( 0 )
	highlight:setZRot( 108 )
	highlight:setScale( 3.3 )
	highlight:setImage( RegisterImage( "uie_t7_hud_notficationhighlight" ) )
	highlight:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( highlight )
	self.highlight = highlight
	
	local CurrentRank = CoD.ArenaRankSmall.new( self, controller )
	CurrentRank:setLeftRight( false, false, -148, 148 )
	CurrentRank:setTopBottom( true, false, 208, 504 )
	CurrentRank:subscribeToGlobalModel( controller, "ArenaResult", "currentPoints", function ( model )
		local currentPoints = Engine.GetModelValue( model )
		if currentPoints then
			CurrentRank.rankIcon:setImage( RegisterImage( GetArenaRankIconLG( currentPoints ) ) )
		end
	end )
	self:addElement( CurrentRank )
	self.CurrentRank = CurrentRank
	
	local CurrentRankADD = LUI.UIImage.new()
	CurrentRankADD:setLeftRight( false, false, -148, 148 )
	CurrentRankADD:setTopBottom( true, false, 208, 504 )
	CurrentRankADD:setAlpha( 0 )
	CurrentRankADD:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
	CurrentRankADD:setShaderVector( 0, 2, 0, 0, 0 )
	CurrentRankADD:setShaderVector( 1, 1, 0, 0, 0 )
	CurrentRankADD:setShaderVector( 2, 0.03, 0, 0, 0 )
	CurrentRankADD:subscribeToGlobalModel( controller, "ArenaResult", "currentPoints", function ( model )
		local currentPoints = Engine.GetModelValue( model )
		if currentPoints then
			CurrentRankADD:setImage( RegisterImage( GetArenaRankIconLG( currentPoints ) ) )
		end
	end )
	self:addElement( CurrentRankADD )
	self.CurrentRankADD = CurrentRankADD
	
	local PreviousStars = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	PreviousStars:makeFocusable()
	PreviousStars:setLeftRight( false, false, -124.5, 125.5 )
	PreviousStars:setTopBottom( true, false, 600.13, 640.13 )
	PreviousStars:setAlpha( 0 )
	PreviousStars:setWidgetType( CoD.ArenaStarbig )
	PreviousStars:setHorizontalCount( 6 )
	PreviousStars:subscribeToGlobalModel( controller, "ArenaResult", "previousStarsDatasource", function ( model )
		local previousStarsDatasource = Engine.GetModelValue( model )
		if previousStarsDatasource then
			PreviousStars:setDataSource( previousStarsDatasource )
		end
	end )
	self:addElement( PreviousStars )
	self.PreviousStars = PreviousStars
	
	local PreviousRankText = LUI.UIText.new()
	PreviousRankText:setLeftRight( true, false, 518, 765 )
	PreviousRankText:setTopBottom( false, true, -149.87, -115.87 )
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
		local previousPoints = Engine.GetModelValue( model )
		if previousPoints then
			PreviousRankText:setText( LocalizeToUpperString( GetArenaRankName( previousPoints ) ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( PreviousRankText, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 0 )
	end )
	self:addElement( PreviousRankText )
	self.PreviousRankText = PreviousRankText
	
	local PreviousRankAdd = CoD.ArenaRankSmall.new( self, controller )
	PreviousRankAdd:setLeftRight( false, false, -148, 148 )
	PreviousRankAdd:setTopBottom( true, false, 208, 504 )
	PreviousRankAdd:setAlpha( 0 )
	PreviousRankAdd:subscribeToGlobalModel( controller, "ArenaResult", "previousPoints", function ( model )
		local previousPoints = Engine.GetModelValue( model )
		if previousPoints then
			PreviousRankAdd.rankIcon:setImage( RegisterImage( GetArenaRankIconLG( previousPoints ) ) )
		end
	end )
	self:addElement( PreviousRankAdd )
	self.PreviousRankAdd = PreviousRankAdd
	
	local ArenaVictory = CoD.ArenaVictory.new( self, controller )
	ArenaVictory:setLeftRight( false, false, -350.5, 351.5 )
	ArenaVictory:setTopBottom( true, false, 117, 172 )
	self:addElement( ArenaVictory )
	self.ArenaVictory = ArenaVictory
	
	local CurrentRankR1 = LUI.UIImage.new()
	CurrentRankR1:setLeftRight( false, false, 147.52, 443.52 )
	CurrentRankR1:setTopBottom( true, false, 208, 504 )
	CurrentRankR1:setRGB( 0.49, 0, 0 )
	CurrentRankR1:setAlpha( 0 )
	CurrentRankR1:setScale( 2 )
	CurrentRankR1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
	CurrentRankR1:setShaderVector( 0, 2, 0, 0, 0 )
	CurrentRankR1:setShaderVector( 1, 1, 0, 0, 0 )
	CurrentRankR1:setShaderVector( 2, 0.03, 0, 0, 0 )
	CurrentRankR1:subscribeToGlobalModel( controller, "ArenaResult", "currentPoints", function ( model )
		local currentPoints = Engine.GetModelValue( model )
		if currentPoints then
			CurrentRankR1:setImage( RegisterImage( GetArenaRankIconLG( currentPoints ) ) )
		end
	end )
	self:addElement( CurrentRankR1 )
	self.CurrentRankR1 = CurrentRankR1
	
	local CurrentRankL1 = LUI.UIImage.new()
	CurrentRankL1:setLeftRight( false, false, -443.5, -147.5 )
	CurrentRankL1:setTopBottom( true, false, 208, 504 )
	CurrentRankL1:setRGB( 0.06, 0.58, 0 )
	CurrentRankL1:setAlpha( 0 )
	CurrentRankL1:setScale( 2 )
	CurrentRankL1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
	CurrentRankL1:setShaderVector( 0, 2, 0, 0, 0 )
	CurrentRankL1:setShaderVector( 1, 1, 0, 0, 0 )
	CurrentRankL1:setShaderVector( 2, 0.03, 0, 0, 0 )
	CurrentRankL1:subscribeToGlobalModel( controller, "ArenaResult", "currentPoints", function ( model )
		local currentPoints = Engine.GetModelValue( model )
		if currentPoints then
			CurrentRankL1:setImage( RegisterImage( GetArenaRankIconLG( currentPoints ) ) )
		end
	end )
	self:addElement( CurrentRankL1 )
	self.CurrentRankL1 = CurrentRankL1
	
	local CurrentRankC1 = LUI.UIImage.new()
	CurrentRankC1:setLeftRight( false, false, -148.48, 147.52 )
	CurrentRankC1:setTopBottom( true, false, 208, 504 )
	CurrentRankC1:setRGB( 0, 0.03, 0.49 )
	CurrentRankC1:setAlpha( 0 )
	CurrentRankC1:setScale( 2 )
	CurrentRankC1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
	CurrentRankC1:setShaderVector( 0, 2, 0, 0, 0 )
	CurrentRankC1:setShaderVector( 1, 1, 0, 0, 0 )
	CurrentRankC1:setShaderVector( 2, 0.03, 0, 0, 0 )
	CurrentRankC1:subscribeToGlobalModel( controller, "ArenaResult", "currentPoints", function ( model )
		local currentPoints = Engine.GetModelValue( model )
		if currentPoints then
			CurrentRankC1:setImage( RegisterImage( GetArenaRankIconLG( currentPoints ) ) )
		end
	end )
	self:addElement( CurrentRankC1 )
	self.CurrentRankC1 = CurrentRankC1
	
	local CurrentRankglint = CoD.ArenaRankSmall.new( self, controller )
	CurrentRankglint:setLeftRight( false, false, -148, 148 )
	CurrentRankglint:setTopBottom( true, false, 208, 504 )
	CurrentRankglint:setRGB( 1, 0.8, 0 )
	CurrentRankglint:setAlpha( 0 )
	CurrentRankglint:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint_reveal" ) )
	CurrentRankglint:setShaderVector( 0, 1, 0, 0, 0 )
	CurrentRankglint:subscribeToGlobalModel( controller, "ArenaResult", "currentPoints", function ( model )
		local currentPoints = Engine.GetModelValue( model )
		if currentPoints then
			CurrentRankglint.rankIcon:setImage( RegisterImage( GetArenaRankIconLG( currentPoints ) ) )
		end
	end )
	self:addElement( CurrentRankglint )
	self.CurrentRankglint = CurrentRankglint
	
	local rankup = LUI.UIElement.new()
	rankup:setLeftRight( true, false, -79.29, -31.29 )
	rankup:setTopBottom( true, false, 606.13, 654.13 )
	rankup:setPlaySoundDirect( true )
	self:addElement( rankup )
	self.rankup = rankup
	
	CurrentStars.navigation = {
		up = PreviousStars
	}
	PreviousStars.navigation = {
		down = CurrentStars
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 14 )
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
				CurrentRankADD:completeAnimation()
				self.CurrentRankADD:setAlpha( 0 )
				self.clipFinished( CurrentRankADD, {} )
				PreviousStars:completeAnimation()
				self.PreviousStars:setAlpha( 0 )
				self.clipFinished( PreviousStars, {} )
				PreviousRankText:completeAnimation()
				self.PreviousRankText:setLeftRight( false, false, -122, 125 )
				self.PreviousRankText:setTopBottom( true, false, 570.13, 604.13 )
				self.PreviousRankText:setAlpha( 0 )
				self.clipFinished( PreviousRankText, {} )
				PreviousRankAdd:completeAnimation()
				self.PreviousRankAdd:setAlpha( 0 )
				self.clipFinished( PreviousRankAdd, {} )
				local ArenaVictoryFrame2 = function ( ArenaVictory, event )
					if not event.interrupted then
						ArenaVictory:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					ArenaVictory:setLeftRight( false, false, -350.5, 351.5 )
					ArenaVictory:setTopBottom( true, false, 117, 172 )
					ArenaVictory:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( ArenaVictory, event )
					else
						ArenaVictory:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ArenaVictory:completeAnimation()
				self.ArenaVictory:setLeftRight( false, false, -350.5, 351.5 )
				self.ArenaVictory:setTopBottom( true, false, 117, 172 )
				self.ArenaVictory:setAlpha( 0 )
				ArenaVictoryFrame2( ArenaVictory, {} )
				CurrentRankR1:completeAnimation()
				self.CurrentRankR1:setLeftRight( false, false, 147.52, 443.52 )
				self.CurrentRankR1:setTopBottom( true, false, 208, 504 )
				self.clipFinished( CurrentRankR1, {} )
				CurrentRankL1:completeAnimation()
				self.CurrentRankL1:setLeftRight( false, false, -443.5, -147.5 )
				self.CurrentRankL1:setTopBottom( true, false, 208, 504 )
				self.clipFinished( CurrentRankL1, {} )
				CurrentRankC1:completeAnimation()
				self.CurrentRankC1:setLeftRight( false, false, -148.48, 147.52 )
				self.CurrentRankC1:setTopBottom( true, false, 208, 504 )
				self.clipFinished( CurrentRankC1, {} )
			end,
			RankedUp = function ()
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
								highlight00:setZRot( 212.99 )
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
				local f36_local10 = function ( f77_arg0, f77_arg1 )
					local f77_local0 = function ( f78_arg0, f78_arg1 )
						if not f78_arg1.interrupted then
							f78_arg0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						end
						f78_arg0:setAlpha( 0 )
						f78_arg0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
						f78_arg0:setShaderVector( 0, 2, 0, 0, 0 )
						f78_arg0:setShaderVector( 1, 1, 0, 0, 0 )
						f78_arg0:setShaderVector( 2, 0.03, 0, 0, 0 )
						if f78_arg1.interrupted then
							self.clipFinished( f78_arg0, f78_arg1 )
						else
							f78_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f77_arg1.interrupted then
						f77_local0( f77_arg0, f77_arg1 )
						return 
					else
						f77_arg0:beginAnimation( "keyframe", 130, false, false, CoD.TweenType.Linear )
						f77_arg0:setAlpha( 1 )
						f77_arg0:registerEventHandler( "transition_complete_keyframe", f77_local0 )
					end
				end
				
				CurrentRankADD:beginAnimation( "keyframe", 2339, false, false, CoD.TweenType.Linear )
				CurrentRankADD:setAlpha( 0 )
				CurrentRankADD:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
				CurrentRankADD:setShaderVector( 0, 2, 0, 0, 0 )
				CurrentRankADD:setShaderVector( 1, 1, 0, 0, 0 )
				CurrentRankADD:setShaderVector( 2, 0.03, 0, 0, 0 )
				CurrentRankADD:registerEventHandler( "transition_complete_keyframe", f36_local10 )
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
								PreviousRankText:setLeftRight( false, false, -122, 125 )
								PreviousRankText:setTopBottom( true, false, 570.13, 604.13 )
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
				self.PreviousRankText:setLeftRight( false, false, -122, 125 )
				self.PreviousRankText:setTopBottom( true, false, 570.13, 604.13 )
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
					ArenaVictory:setLeftRight( false, false, -350.5, 351.5 )
					ArenaVictory:setTopBottom( true, false, 117, 172 )
					ArenaVictory:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( ArenaVictory, event )
					else
						ArenaVictory:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ArenaVictory:completeAnimation()
				self.ArenaVictory:setLeftRight( false, false, -350.5, 351.5 )
				self.ArenaVictory:setTopBottom( true, false, 117, 172 )
				self.ArenaVictory:setAlpha( 0 )
				ArenaVictoryFrame2( ArenaVictory, {} )
				local CurrentRankR1Frame2 = function ( CurrentRankR1, event )
					local CurrentRankR1Frame3 = function ( CurrentRankR1, event )
						local CurrentRankR1Frame4 = function ( CurrentRankR1, event )
							local CurrentRankR1Frame5 = function ( CurrentRankR1, event )
								if not event.interrupted then
									CurrentRankR1:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
								end
								CurrentRankR1:setLeftRight( false, false, -148, 148 )
								CurrentRankR1:setTopBottom( true, false, 201, 497 )
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
								CurrentRankR1:setLeftRight( false, false, -148.5, 147.5 )
								CurrentRankR1:setTopBottom( true, false, 205, 501 )
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
							CurrentRankR1:setLeftRight( false, false, -8.47, 287.53 )
							CurrentRankR1:setTopBottom( true, false, 211, 507 )
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
				self.CurrentRankR1:setLeftRight( false, false, 147, 443 )
				self.CurrentRankR1:setTopBottom( true, false, 218, 514 )
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
								CurrentRankL1:setLeftRight( false, false, -148, 148 )
								CurrentRankL1:setTopBottom( true, false, 201, 497 )
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
								CurrentRankL1:setLeftRight( false, false, -149, 147 )
								CurrentRankL1:setTopBottom( true, false, 204, 500 )
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
							CurrentRankL1:setLeftRight( false, false, -287.13, 8.87 )
							CurrentRankL1:setTopBottom( true, false, 211, 507 )
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
				self.CurrentRankL1:setLeftRight( false, false, -445, -149 )
				self.CurrentRankL1:setTopBottom( true, false, 218, 514 )
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
								CurrentRankC1:setLeftRight( false, false, -148, 148 )
								CurrentRankC1:setTopBottom( true, false, 201, 497 )
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
								CurrentRankC1:setLeftRight( false, false, -148, 148 )
								CurrentRankC1:setTopBottom( true, false, 201, 497 )
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
							CurrentRankC1:setTopBottom( true, false, 213.08, 509.08 )
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
				self.CurrentRankC1:setLeftRight( false, false, -149, 147 )
				self.CurrentRankC1:setTopBottom( true, false, 218, 514 )
				self.CurrentRankC1:setAlpha( 0 )
				self.CurrentRankC1:setScale( 2 )
				CurrentRankC1Frame2( CurrentRankC1, {} )
				local f36_local18 = function ( f104_arg0, f104_arg1 )
					local f104_local0 = function ( f105_arg0, f105_arg1 )
						local f105_local0 = function ( f106_arg0, f106_arg1 )
							local f106_local0 = function ( f107_arg0, f107_arg1 )
								local f107_local0 = function ( f108_arg0, f108_arg1 )
									local f108_local0 = function ( f109_arg0, f109_arg1 )
										if not f109_arg1.interrupted then
											f109_arg0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
										end
										f109_arg0:setRGB( 1, 0.8, 0 )
										f109_arg0:setAlpha( 0 )
										f109_arg0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint_reveal" ) )
										f109_arg0:setShaderVector( 0, 1, 0, 0, 0 )
										if f109_arg1.interrupted then
											self.clipFinished( f109_arg0, f109_arg1 )
										else
											f109_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if f108_arg1.interrupted then
										f108_local0( f108_arg0, f108_arg1 )
										return 
									else
										f108_arg0:beginAnimation( "keyframe", 420, false, false, CoD.TweenType.Linear )
										f108_arg0:setAlpha( 0.11 )
										f108_arg0:setShaderVector( 0, 1, 0, 0, 0 )
										f108_arg0:registerEventHandler( "transition_complete_keyframe", f108_local0 )
									end
								end
								
								if f107_arg1.interrupted then
									f107_local0( f107_arg0, f107_arg1 )
									return 
								else
									f107_arg0:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
									f107_arg0:setShaderVector( 0, 0.46, 0, 0, 0 )
									f107_arg0:registerEventHandler( "transition_complete_keyframe", f107_local0 )
								end
							end
							
							if f106_arg1.interrupted then
								f106_local0( f106_arg0, f106_arg1 )
								return 
							else
								f106_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
								f106_arg0:setShaderVector( 0, 0.05, 0, 0, 0 )
								f106_arg0:registerEventHandler( "transition_complete_keyframe", f106_local0 )
							end
						end
						
						if f105_arg1.interrupted then
							f105_local0( f105_arg0, f105_arg1 )
							return 
						else
							f105_arg0:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
							f105_arg0:registerEventHandler( "transition_complete_keyframe", f105_local0 )
						end
					end
					
					if f104_arg1.interrupted then
						f104_local0( f104_arg0, f104_arg1 )
						return 
					else
						f104_arg0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
						f104_arg0:setAlpha( 1 )
						f104_arg0:registerEventHandler( "transition_complete_keyframe", f104_local0 )
					end
				end
				
				CurrentRankglint:beginAnimation( "keyframe", 2470, false, false, CoD.TweenType.Linear )
				CurrentRankglint:setRGB( 1, 0.8, 0 )
				CurrentRankglint:setAlpha( 0 )
				CurrentRankglint:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint_reveal" ) )
				CurrentRankglint:setShaderVector( 0, 0, 0, 0, 0 )
				CurrentRankglint:registerEventHandler( "transition_complete_keyframe", f36_local18 )
				local f36_local19 = function ( f110_arg0, f110_arg1 )
					if not f110_arg1.interrupted then
						f110_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
					end
					f110_arg0:playSound( "uin_arena_rank_up", controller )
					if f110_arg1.interrupted then
						self.clipFinished( f110_arg0, f110_arg1 )
					else
						f110_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				rankup:beginAnimation( "keyframe", 1990, false, false, CoD.TweenType.Linear )
				rankup:playSound( "0", controller )
				rankup:registerEventHandler( "transition_complete_keyframe", f36_local19 )
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_CONTINUE" )
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LeftPanel:close()
		element.FadeForStreamer:close()
		element.VignetteBack:close()
		element.MenuFrame:close()
		element.RankImageBorder:close()
		element.RankFrame:close()
		element.PlayListBG:close()
		element.CurrentStars:close()
		element.CurrentRank:close()
		element.PreviousStars:close()
		element.PreviousRankAdd:close()
		element.ArenaVictory:close()
		element.CurrentRankglint:close()
		element.PlayListName:close()
		element.CurrentRankText:close()
		element.CurrentRankADD:close()
		element.PreviousRankText:close()
		element.CurrentRankR1:close()
		element.CurrentRankL1:close()
		element.CurrentRankC1:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "ArenaResult.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

