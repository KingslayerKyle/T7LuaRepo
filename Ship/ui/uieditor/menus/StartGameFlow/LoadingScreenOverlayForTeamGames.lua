-- 24c13d9da47cd45f3c9584639f88cbd4
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.PrematchCountdown.PrematchCountdown_IconGlowPanel" )
require( "ui.uieditor.widgets.StartGameFlow.LoadingScreenVSCirclePnl" )
require( "ui.uieditor.widgets.StartGameFlow.TeamIconAndNameWidget" )
require( "ui.uieditor.widgets.StartGameFlow.TeamIconAndNameWidgetForCodCaster" )
require( "ui.uieditor.widgets.StartGameFlow.LoadingScreenFactionIcon" )
require( "ui.uieditor.widgets.LoadingAnimation.LoadingScreenHeaderFooter" )
require( "ui.uieditor.widgets.LoadingAnimation.LoadingScreenTeamPlayerList" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0.LoadingScreenHeaderFooter.LoadingBar:subscribeToGlobalModel( f1_arg1, "LoadingScreenTeamInfo", "loadedFraction", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			f1_arg0.LoadingScreenHeaderFooter.LoadingBar:setShaderVector( 0, modelValue, 0, 0, 0 )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( f1_arg0, "close", function ( element )
		element.LoadingScreenHeaderFooter.LoadingBar:close()
	end )
end

LUI.createMenu.LoadingScreenOverlayForTeamGames = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "LoadingScreenOverlayForTeamGames" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "none"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "LoadingScreenOverlayForTeamGames.buttonPrompts" )
	local f4_local1 = self
	self.anyChildUsesUpdateState = true
	
	local backgroundImage = LUI.UIImage.new()
	backgroundImage:setLeftRight( false, false, -640, 640 )
	backgroundImage:setTopBottom( false, false, -360, 360 )
	backgroundImage:setImage( RegisterImage( MapNameToMapLoadingImage( GetCurrentMapID( "uie_img_t7_menu_mp_loadscreen_sector" ) ) ) )
	backgroundImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_expensive_blur" ) )
	backgroundImage:setShaderVector( 0, 0, 0, 0, 0 )
	backgroundImage:setShaderVector( 1, 1, 0, 0, 0 )
	self:addElement( backgroundImage )
	self.backgroundImage = backgroundImage
	
	local BLACKfade = LUI.UIImage.new()
	BLACKfade:setLeftRight( true, true, 0, 0 )
	BLACKfade:setTopBottom( true, true, 0, 0 )
	BLACKfade:setRGB( 0, 0, 0 )
	BLACKfade:setAlpha( 0.3 )
	self:addElement( BLACKfade )
	self.BLACKfade = BLACKfade
	
	local Team2Vignette = LUI.UIImage.new()
	Team2Vignette:setLeftRight( true, true, 0, 0 )
	Team2Vignette:setTopBottom( false, true, -285.6, -101.6 )
	Team2Vignette:setAlpha( 0.44 )
	Team2Vignette:setXRot( -180 )
	Team2Vignette:setImage( RegisterImage( "uie_t7_mp_menu_startflow_vignette" ) )
	Team2Vignette:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiply" ) )
	self:addElement( Team2Vignette )
	self.Team2Vignette = Team2Vignette
	
	local Team1Vignette = LUI.UIImage.new()
	Team1Vignette:setLeftRight( true, true, 0, 0 )
	Team1Vignette:setTopBottom( true, false, 114.63, 298.63 )
	Team1Vignette:setAlpha( 0.44 )
	Team1Vignette:setImage( RegisterImage( "uie_t7_mp_menu_startflow_vignette" ) )
	Team1Vignette:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiply" ) )
	self:addElement( Team1Vignette )
	self.Team1Vignette = Team1Vignette
	
	local GameTypeglow = CoD.PrematchCountdown_IconGlowPanel.new( f4_local1, controller )
	GameTypeglow:setLeftRight( false, false, -738.49, -308.51 )
	GameTypeglow:setTopBottom( false, false, -158.63, 184.63 )
	GameTypeglow:setAlpha( 0 )
	self:addElement( GameTypeglow )
	self.GameTypeglow = GameTypeglow
	
	local VSglow = CoD.PrematchCountdown_IconGlowPanel.new( f4_local1, controller )
	VSglow:setLeftRight( false, false, -247.25, 240.25 )
	VSglow:setTopBottom( false, false, -66.38, 92.38 )
	VSglow:setAlpha( 0.53 )
	self:addElement( VSglow )
	self.VSglow = VSglow
	
	local LoadingScreenVSCirclePnl = CoD.LoadingScreenVSCirclePnl.new( f4_local1, controller )
	LoadingScreenVSCirclePnl:setLeftRight( false, false, -47.5, 42.5 )
	LoadingScreenVSCirclePnl:setTopBottom( false, false, -38.47, 51.4 )
	LoadingScreenVSCirclePnl:setAlpha( 0.5 )
	self:addElement( LoadingScreenVSCirclePnl )
	self.LoadingScreenVSCirclePnl = LoadingScreenVSCirclePnl
	
	local Team2Line = LUI.UIImage.new()
	Team2Line:setLeftRight( true, true, -11, 11 )
	Team2Line:setTopBottom( false, false, 70.4, 78.4 )
	Team2Line:setAlpha( 0.2 )
	Team2Line:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Team2Line:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Team2Line )
	self.Team2Line = Team2Line
	
	local Team2IconAndNameWidget = CoD.TeamIconAndNameWidget.new( f4_local1, controller )
	Team2IconAndNameWidget:setLeftRight( false, false, -19.13, 345.63 )
	Team2IconAndNameWidget:setTopBottom( false, false, -33.5, 51.5 )
	Team2IconAndNameWidget.LoadingScreenFactionBoxPnl:setYRot( 180 )
	self:addElement( Team2IconAndNameWidget )
	self.Team2IconAndNameWidget = Team2IconAndNameWidget
	
	local VSlineR = LUI.UIImage.new()
	VSlineR:setLeftRight( false, true, -609.5, 59 )
	VSlineR:setTopBottom( false, false, 2.53, 10.53 )
	VSlineR:setAlpha( 0.3 )
	VSlineR:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	VSlineR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( VSlineR )
	self.VSlineR = VSlineR
	
	local VSlineL = LUI.UIImage.new()
	VSlineL:setLeftRight( true, false, -18, 605 )
	VSlineL:setTopBottom( false, false, 2.53, 10.53 )
	VSlineL:setAlpha( 0.3 )
	VSlineL:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	VSlineL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( VSlineL )
	self.VSlineL = VSlineL
	
	local VScircle = LUI.UIImage.new()
	VScircle:setLeftRight( false, false, -36.5, 33.5 )
	VScircle:setTopBottom( false, false, -27.5, 40.56 )
	VScircle:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackcircle" ) )
	VScircle:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( VScircle )
	self.VScircle = VScircle
	
	local VSlabel = LUI.UIText.new()
	VSlabel:setLeftRight( false, false, -82.5, 77.5 )
	VSlabel:setTopBottom( false, false, -10.5, 28.5 )
	VSlabel:setText( Engine.Localize( "VS" ) )
	VSlabel:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	VSlabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	VSlabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( VSlabel )
	self.VSlabel = VSlabel
	
	local Team1Line = LUI.UIImage.new()
	Team1Line:setLeftRight( true, true, -11, 11 )
	Team1Line:setTopBottom( false, false, -64.38, -56.38 )
	Team1Line:setAlpha( 0.2 )
	Team1Line:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Team1Line:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Team1Line )
	self.Team1Line = Team1Line
	
	local Team1IconAndNameWidget = CoD.TeamIconAndNameWidget.new( f4_local1, controller )
	Team1IconAndNameWidget:setLeftRight( false, false, -346.5, 53.5 )
	Team1IconAndNameWidget:setTopBottom( false, false, -33.5, 51.5 )
	self:addElement( Team1IconAndNameWidget )
	self.Team1IconAndNameWidget = Team1IconAndNameWidget
	
	local FrameForCodCasterRight = CoD.TeamIconAndNameWidgetForCodCaster.new( f4_local1, controller )
	FrameForCodCasterRight:setLeftRight( true, false, 622.5, 1087.5 )
	FrameForCodCasterRight:setTopBottom( true, false, 326.4, 411.4 )
	FrameForCodCasterRight:setAlpha( 0 )
	FrameForCodCasterRight.PanelLine:setYRot( 180 )
	FrameForCodCasterRight:subscribeToGlobalModel( controller, "Factions", "axisFactionColor", function ( model )
		local axisFactionColor = Engine.GetModelValue( model )
		if axisFactionColor then
			FrameForCodCasterRight.ColorPanelLine1:setRGB( axisFactionColor )
		end
	end )
	self:addElement( FrameForCodCasterRight )
	self.FrameForCodCasterRight = FrameForCodCasterRight
	
	local FrameForCodCasterLeft = CoD.TeamIconAndNameWidgetForCodCaster.new( f4_local1, controller )
	FrameForCodCasterLeft:setLeftRight( true, false, 194.5, 659.5 )
	FrameForCodCasterLeft:setTopBottom( true, false, 325.5, 410.5 )
	FrameForCodCasterLeft:setAlpha( 0 )
	FrameForCodCasterLeft:subscribeToGlobalModel( controller, "Factions", "alliesFactionColor", function ( model )
		local alliesFactionColor = Engine.GetModelValue( model )
		if alliesFactionColor then
			FrameForCodCasterLeft.ColorPanelLine1:setRGB( alliesFactionColor )
		end
	end )
	self:addElement( FrameForCodCasterLeft )
	self.FrameForCodCasterLeft = FrameForCodCasterLeft
	
	local CodcasterColorLine2 = LUI.UIImage.new()
	CodcasterColorLine2:setLeftRight( true, false, 675.38, 1067.38 )
	CodcasterColorLine2:setTopBottom( true, false, 348.5, 350.75 )
	CodcasterColorLine2:setAlpha( 0 )
	CodcasterColorLine2:subscribeToGlobalModel( controller, "Factions", "axisFactionColor", function ( model )
		local axisFactionColor = Engine.GetModelValue( model )
		if axisFactionColor then
			CodcasterColorLine2:setRGB( axisFactionColor )
		end
	end )
	self:addElement( CodcasterColorLine2 )
	self.CodcasterColorLine2 = CodcasterColorLine2
	
	local CodcasterColorLine1 = LUI.UIImage.new()
	CodcasterColorLine1:setLeftRight( true, false, 208.5, 600.5 )
	CodcasterColorLine1:setTopBottom( true, false, 348.5, 350.75 )
	CodcasterColorLine1:setAlpha( 0 )
	CodcasterColorLine1:subscribeToGlobalModel( controller, "Factions", "alliesFactionColor", function ( model )
		local alliesFactionColor = Engine.GetModelValue( model )
		if alliesFactionColor then
			CodcasterColorLine1:setRGB( alliesFactionColor )
		end
	end )
	self:addElement( CodcasterColorLine1 )
	self.CodcasterColorLine1 = CodcasterColorLine1
	
	local LoadingScreenFactionIcon = CoD.LoadingScreenFactionIcon.new( f4_local1, controller )
	LoadingScreenFactionIcon:setLeftRight( false, false, -170.63, -32.88 )
	LoadingScreenFactionIcon:setTopBottom( false, false, -62.35, 75.4 )
	LoadingScreenFactionIcon:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "team1FactionIcon", function ( model )
		local team1FactionIcon = Engine.GetModelValue( model )
		if team1FactionIcon then
			LoadingScreenFactionIcon.FactionIconSolid:setImage( RegisterImage( team1FactionIcon ) )
		end
	end )
	LoadingScreenFactionIcon:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "team1FactionIcon", function ( model )
		local team1FactionIcon = Engine.GetModelValue( model )
		if team1FactionIcon then
			LoadingScreenFactionIcon.FactionIcon:setImage( RegisterImage( team1FactionIcon ) )
		end
	end )
	self:addElement( LoadingScreenFactionIcon )
	self.LoadingScreenFactionIcon = LoadingScreenFactionIcon
	
	local LoadingScreenFactionIcon0 = CoD.LoadingScreenFactionIcon.new( f4_local1, controller )
	LoadingScreenFactionIcon0:setLeftRight( false, false, 30.5, 168.25 )
	LoadingScreenFactionIcon0:setTopBottom( false, false, -62.35, 75.4 )
	LoadingScreenFactionIcon0:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "team2FactionIcon", function ( model )
		local team2FactionIcon = Engine.GetModelValue( model )
		if team2FactionIcon then
			LoadingScreenFactionIcon0.FactionIconSolid:setImage( RegisterImage( team2FactionIcon ) )
		end
	end )
	LoadingScreenFactionIcon0:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "team2FactionIcon", function ( model )
		local team2FactionIcon = Engine.GetModelValue( model )
		if team2FactionIcon then
			LoadingScreenFactionIcon0.FactionIcon:setImage( RegisterImage( team2FactionIcon ) )
		end
	end )
	self:addElement( LoadingScreenFactionIcon0 )
	self.LoadingScreenFactionIcon0 = LoadingScreenFactionIcon0
	
	local FactionNameCDP = LUI.UIText.new()
	FactionNameCDP:setLeftRight( false, false, 77.5, 369.88 )
	FactionNameCDP:setTopBottom( false, false, -3.47, 16.53 )
	FactionNameCDP:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	FactionNameCDP:setLetterSpacing( 2.5 )
	FactionNameCDP:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	FactionNameCDP:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	FactionNameCDP:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "team2FactionName", function ( model )
		local team2FactionName = Engine.GetModelValue( model )
		if team2FactionName then
			FactionNameCDP:setText( Engine.Localize( team2FactionName ) )
		end
	end )
	self:addElement( FactionNameCDP )
	self.FactionNameCDP = FactionNameCDP
	
	local FactionNameBlackOps = LUI.UIText.new()
	FactionNameBlackOps:setLeftRight( false, false, -373.88, -81.5 )
	FactionNameBlackOps:setTopBottom( false, false, -3.47, 16.53 )
	FactionNameBlackOps:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	FactionNameBlackOps:setLetterSpacing( 2.5 )
	FactionNameBlackOps:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	FactionNameBlackOps:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	FactionNameBlackOps:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "team1FactionName", function ( model )
		local team1FactionName = Engine.GetModelValue( model )
		if team1FactionName then
			FactionNameBlackOps:setText( Engine.Localize( team1FactionName ) )
		end
	end )
	self:addElement( FactionNameBlackOps )
	self.FactionNameBlackOps = FactionNameBlackOps
	
	local FactionNameRightCodCaster = LUI.UIText.new()
	FactionNameRightCodCaster:setLeftRight( false, false, 123.5, 443.5 )
	FactionNameRightCodCaster:setTopBottom( true, false, 355.97, 374.97 )
	FactionNameRightCodCaster:setAlpha( 0 )
	FactionNameRightCodCaster:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	FactionNameRightCodCaster:setLetterSpacing( 2.5 )
	FactionNameRightCodCaster:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	FactionNameRightCodCaster:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	FactionNameRightCodCaster:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "team2FactionName", function ( model )
		local team2FactionName = Engine.GetModelValue( model )
		if team2FactionName then
			FactionNameRightCodCaster:setText( Engine.Localize( team2FactionName ) )
		end
	end )
	self:addElement( FactionNameRightCodCaster )
	self.FactionNameRightCodCaster = FactionNameRightCodCaster
	
	local FactionNameLeftCodCaster = LUI.UIText.new()
	FactionNameLeftCodCaster:setLeftRight( false, false, -438.5, -118.5 )
	FactionNameLeftCodCaster:setTopBottom( true, false, 356.97, 375.97 )
	FactionNameLeftCodCaster:setAlpha( 0 )
	FactionNameLeftCodCaster:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	FactionNameLeftCodCaster:setLetterSpacing( 2.5 )
	FactionNameLeftCodCaster:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	FactionNameLeftCodCaster:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	FactionNameLeftCodCaster:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "team1FactionName", function ( model )
		local team1FactionName = Engine.GetModelValue( model )
		if team1FactionName then
			FactionNameLeftCodCaster:setText( Engine.Localize( team1FactionName ) )
		end
	end )
	self:addElement( FactionNameLeftCodCaster )
	self.FactionNameLeftCodCaster = FactionNameLeftCodCaster
	
	local LoadingScreenHeaderFooter = CoD.LoadingScreenHeaderFooter.new( f4_local1, controller )
	LoadingScreenHeaderFooter:setLeftRight( false, false, -640, 640 )
	LoadingScreenHeaderFooter:setTopBottom( false, false, -360, 360 )
	LoadingScreenHeaderFooter:registerEventHandler( "menu_loaded", function ( element, event )
		local f17_local0 = nil
		SizeToSafeArea( element, controller )
		PlayClipOnElement( self, {
			elementName = "LoadingScreenHeaderFooter",
			clipName = "StartLoading"
		}, controller )
		if not f17_local0 then
			f17_local0 = element:dispatchEventToChildren( event )
		end
		return f17_local0
	end )
	self:addElement( LoadingScreenHeaderFooter )
	self.LoadingScreenHeaderFooter = LoadingScreenHeaderFooter
	
	local LoadingScreenTeamPlayerList = CoD.LoadingScreenTeamPlayerList.new( f4_local1, controller )
	LoadingScreenTeamPlayerList:setLeftRight( false, false, -640, 640 )
	LoadingScreenTeamPlayerList:setTopBottom( false, false, -360, 360 )
	LoadingScreenTeamPlayerList:registerEventHandler( "menu_loaded", function ( element, event )
		local f18_local0 = nil
		SizeToSafeArea( element, controller )
		PlayClipOnElement( self, {
			elementName = "LoadingScreenTeamPlayerList",
			clipName = "StartLoading"
		}, controller )
		if not f18_local0 then
			f18_local0 = element:dispatchEventToChildren( event )
		end
		return f18_local0
	end )
	self:addElement( LoadingScreenTeamPlayerList )
	self.LoadingScreenTeamPlayerList = LoadingScreenTeamPlayerList
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 17 )
				BLACKfade:completeAnimation()
				self.BLACKfade:setAlpha( 0.3 )
				self.clipFinished( BLACKfade, {} )
				LoadingScreenVSCirclePnl:completeAnimation()
				self.LoadingScreenVSCirclePnl:setAlpha( 0.5 )
				self.clipFinished( LoadingScreenVSCirclePnl, {} )
				Team2IconAndNameWidget:completeAnimation()
				self.Team2IconAndNameWidget:setAlpha( 1 )
				self.clipFinished( Team2IconAndNameWidget, {} )
				VScircle:completeAnimation()
				self.VScircle:setAlpha( 1 )
				self.clipFinished( VScircle, {} )
				VSlabel:completeAnimation()
				self.VSlabel:setAlpha( 1 )
				self.clipFinished( VSlabel, {} )
				Team1IconAndNameWidget:completeAnimation()
				self.Team1IconAndNameWidget:setAlpha( 1 )
				self.clipFinished( Team1IconAndNameWidget, {} )
				FrameForCodCasterRight:completeAnimation()
				self.FrameForCodCasterRight:setAlpha( 0 )
				self.clipFinished( FrameForCodCasterRight, {} )
				FrameForCodCasterLeft:completeAnimation()
				self.FrameForCodCasterLeft:setAlpha( 0 )
				self.clipFinished( FrameForCodCasterLeft, {} )
				CodcasterColorLine2:completeAnimation()
				self.CodcasterColorLine2:setAlpha( 0 )
				self.clipFinished( CodcasterColorLine2, {} )
				CodcasterColorLine1:completeAnimation()
				self.CodcasterColorLine1:setAlpha( 0 )
				self.clipFinished( CodcasterColorLine1, {} )
				LoadingScreenFactionIcon:completeAnimation()
				self.LoadingScreenFactionIcon:setLeftRight( false, false, -170.63, -32.88 )
				self.LoadingScreenFactionIcon:setTopBottom( false, false, -62.35, 75.4 )
				self.LoadingScreenFactionIcon:setAlpha( 1 )
				self.clipFinished( LoadingScreenFactionIcon, {} )
				LoadingScreenFactionIcon0:completeAnimation()
				self.LoadingScreenFactionIcon0:setLeftRight( false, false, 30.5, 168.25 )
				self.LoadingScreenFactionIcon0:setTopBottom( false, false, -62.35, 75.4 )
				self.LoadingScreenFactionIcon0:setAlpha( 1 )
				self.clipFinished( LoadingScreenFactionIcon0, {} )
				FactionNameCDP:completeAnimation()
				self.FactionNameCDP:setAlpha( 1 )
				self.clipFinished( FactionNameCDP, {} )
				FactionNameBlackOps:completeAnimation()
				self.FactionNameBlackOps:setAlpha( 1 )
				self.clipFinished( FactionNameBlackOps, {} )
				FactionNameRightCodCaster:completeAnimation()
				self.FactionNameRightCodCaster:setAlpha( 0 )
				self.clipFinished( FactionNameRightCodCaster, {} )
				FactionNameLeftCodCaster:completeAnimation()
				self.FactionNameLeftCodCaster:setAlpha( 0 )
				self.clipFinished( FactionNameLeftCodCaster, {} )
				LoadingScreenTeamPlayerList:completeAnimation()
				self.LoadingScreenTeamPlayerList:setAlpha( 1 )
				self.clipFinished( LoadingScreenTeamPlayerList, {} )
			end,
			StartLoading = function ()
				self:setupElementClipCounter( 24 )
				local backgroundImageFrame2 = function ( backgroundImage, event )
					local backgroundImageFrame3 = function ( backgroundImage, event )
						local backgroundImageFrame4 = function ( backgroundImage, event )
							if not event.interrupted then
								backgroundImage:beginAnimation( "keyframe", 1130, false, false, CoD.TweenType.Linear )
							end
							backgroundImage:setAlpha( 1 )
							backgroundImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_expensive_blur" ) )
							backgroundImage:setShaderVector( 0, 1, 0, 0, 0 )
							backgroundImage:setShaderVector( 1, 2, 0, 0, 0 )
							if event.interrupted then
								self.clipFinished( backgroundImage, event )
							else
								backgroundImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							backgroundImageFrame4( backgroundImage, event )
							return 
						else
							backgroundImage:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
							backgroundImage:registerEventHandler( "transition_complete_keyframe", backgroundImageFrame4 )
						end
					end
					
					if event.interrupted then
						backgroundImageFrame3( backgroundImage, event )
						return 
					else
						backgroundImage:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						backgroundImage:setAlpha( 1 )
						backgroundImage:registerEventHandler( "transition_complete_keyframe", backgroundImageFrame3 )
					end
				end
				
				backgroundImage:completeAnimation()
				self.backgroundImage:setAlpha( 0 )
				self.backgroundImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_expensive_blur" ) )
				self.backgroundImage:setShaderVector( 0, 0, 0, 0, 0 )
				self.backgroundImage:setShaderVector( 1, 2, 0, 0, 0 )
				backgroundImageFrame2( backgroundImage, {} )
				local BLACKfadeFrame2 = function ( BLACKfade, event )
					local BLACKfadeFrame3 = function ( BLACKfade, event )
						if not event.interrupted then
							BLACKfade:beginAnimation( "keyframe", 1529, false, false, CoD.TweenType.Linear )
						end
						BLACKfade:setAlpha( 0.3 )
						if event.interrupted then
							self.clipFinished( BLACKfade, event )
						else
							BLACKfade:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BLACKfadeFrame3( BLACKfade, event )
						return 
					else
						BLACKfade:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						BLACKfade:registerEventHandler( "transition_complete_keyframe", BLACKfadeFrame3 )
					end
				end
				
				BLACKfade:completeAnimation()
				self.BLACKfade:setAlpha( 0 )
				BLACKfadeFrame2( BLACKfade, {} )
				local Team2VignetteFrame2 = function ( Team2Vignette, event )
					local Team2VignetteFrame3 = function ( Team2Vignette, event )
						if not event.interrupted then
							Team2Vignette:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
						end
						Team2Vignette:setAlpha( 0.44 )
						if event.interrupted then
							self.clipFinished( Team2Vignette, event )
						else
							Team2Vignette:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Team2VignetteFrame3( Team2Vignette, event )
						return 
					else
						Team2Vignette:beginAnimation( "keyframe", 1799, false, false, CoD.TweenType.Linear )
						Team2Vignette:registerEventHandler( "transition_complete_keyframe", Team2VignetteFrame3 )
					end
				end
				
				Team2Vignette:completeAnimation()
				self.Team2Vignette:setAlpha( 0 )
				Team2VignetteFrame2( Team2Vignette, {} )
				local Team1VignetteFrame2 = function ( Team1Vignette, event )
					local Team1VignetteFrame3 = function ( Team1Vignette, event )
						if not event.interrupted then
							Team1Vignette:beginAnimation( "keyframe", 279, false, false, CoD.TweenType.Linear )
						end
						Team1Vignette:setAlpha( 0.44 )
						if event.interrupted then
							self.clipFinished( Team1Vignette, event )
						else
							Team1Vignette:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Team1VignetteFrame3( Team1Vignette, event )
						return 
					else
						Team1Vignette:beginAnimation( "keyframe", 1360, false, false, CoD.TweenType.Linear )
						Team1Vignette:registerEventHandler( "transition_complete_keyframe", Team1VignetteFrame3 )
					end
				end
				
				Team1Vignette:completeAnimation()
				self.Team1Vignette:setAlpha( 0 )
				Team1VignetteFrame2( Team1Vignette, {} )
				GameTypeglow:completeAnimation()
				self.GameTypeglow:setAlpha( 0 )
				self.clipFinished( GameTypeglow, {} )
				local VSglowFrame2 = function ( VSglow, event )
					local VSglowFrame3 = function ( VSglow, event )
						if not event.interrupted then
							VSglow:beginAnimation( "keyframe", 309, false, false, CoD.TweenType.Linear )
						end
						VSglow:setAlpha( 0.53 )
						if event.interrupted then
							self.clipFinished( VSglow, event )
						else
							VSglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						VSglowFrame3( VSglow, event )
						return 
					else
						VSglow:beginAnimation( "keyframe", 1480, false, false, CoD.TweenType.Linear )
						VSglow:registerEventHandler( "transition_complete_keyframe", VSglowFrame3 )
					end
				end
				
				VSglow:completeAnimation()
				self.VSglow:setAlpha( 0 )
				VSglowFrame2( VSglow, {} )
				local LoadingScreenVSCirclePnlFrame2 = function ( LoadingScreenVSCirclePnl, event )
					local LoadingScreenVSCirclePnlFrame3 = function ( LoadingScreenVSCirclePnl, event )
						if not event.interrupted then
							LoadingScreenVSCirclePnl:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Bounce )
						end
						LoadingScreenVSCirclePnl:setAlpha( 0.5 )
						if event.interrupted then
							self.clipFinished( LoadingScreenVSCirclePnl, event )
						else
							LoadingScreenVSCirclePnl:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LoadingScreenVSCirclePnlFrame3( LoadingScreenVSCirclePnl, event )
						return 
					else
						LoadingScreenVSCirclePnl:beginAnimation( "keyframe", 1700, false, false, CoD.TweenType.Linear )
						LoadingScreenVSCirclePnl:registerEventHandler( "transition_complete_keyframe", LoadingScreenVSCirclePnlFrame3 )
					end
				end
				
				LoadingScreenVSCirclePnl:completeAnimation()
				self.LoadingScreenVSCirclePnl:setAlpha( 0 )
				LoadingScreenVSCirclePnlFrame2( LoadingScreenVSCirclePnl, {} )
				local Team2LineFrame2 = function ( Team2Line, event )
					local Team2LineFrame3 = function ( Team2Line, event )
						if not event.interrupted then
							Team2Line:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
						end
						Team2Line:setAlpha( 0.2 )
						if event.interrupted then
							self.clipFinished( Team2Line, event )
						else
							Team2Line:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Team2LineFrame3( Team2Line, event )
						return 
					else
						Team2Line:beginAnimation( "keyframe", 1700, false, false, CoD.TweenType.Linear )
						Team2Line:registerEventHandler( "transition_complete_keyframe", Team2LineFrame3 )
					end
				end
				
				Team2Line:completeAnimation()
				self.Team2Line:setAlpha( 0 )
				Team2LineFrame2( Team2Line, {} )
				local Team2IconAndNameWidgetFrame2 = function ( Team2IconAndNameWidget, event )
					local Team2IconAndNameWidgetFrame3 = function ( Team2IconAndNameWidget, event )
						if not event.interrupted then
							Team2IconAndNameWidget:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Bounce )
						end
						Team2IconAndNameWidget:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Team2IconAndNameWidget, event )
						else
							Team2IconAndNameWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Team2IconAndNameWidgetFrame3( Team2IconAndNameWidget, event )
						return 
					else
						Team2IconAndNameWidget:beginAnimation( "keyframe", 1700, false, false, CoD.TweenType.Linear )
						Team2IconAndNameWidget:registerEventHandler( "transition_complete_keyframe", Team2IconAndNameWidgetFrame3 )
					end
				end
				
				Team2IconAndNameWidget:completeAnimation()
				self.Team2IconAndNameWidget:setAlpha( 0 )
				Team2IconAndNameWidgetFrame2( Team2IconAndNameWidget, {} )
				local VSlineRFrame2 = function ( VSlineR, event )
					local VSlineRFrame3 = function ( VSlineR, event )
						if not event.interrupted then
							VSlineR:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
						VSlineR:setLeftRight( false, true, -609.5, 59 )
						VSlineR:setTopBottom( false, false, 2.53, 10.53 )
						VSlineR:setAlpha( 0.2 )
						if event.interrupted then
							self.clipFinished( VSlineR, event )
						else
							VSlineR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						VSlineRFrame3( VSlineR, event )
						return 
					else
						VSlineR:beginAnimation( "keyframe", 1639, false, false, CoD.TweenType.Linear )
						VSlineR:registerEventHandler( "transition_complete_keyframe", VSlineRFrame3 )
					end
				end
				
				VSlineR:completeAnimation()
				self.VSlineR:setLeftRight( false, true, -609.5, 59 )
				self.VSlineR:setTopBottom( false, false, 2.53, 10.53 )
				self.VSlineR:setAlpha( 0 )
				VSlineRFrame2( VSlineR, {} )
				local VSlineLFrame2 = function ( VSlineL, event )
					local VSlineLFrame3 = function ( VSlineL, event )
						if not event.interrupted then
							VSlineL:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
						VSlineL:setLeftRight( true, false, -18, 605 )
						VSlineL:setTopBottom( false, false, 2.53, 10.53 )
						VSlineL:setAlpha( 0.2 )
						if event.interrupted then
							self.clipFinished( VSlineL, event )
						else
							VSlineL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						VSlineLFrame3( VSlineL, event )
						return 
					else
						VSlineL:beginAnimation( "keyframe", 1639, false, false, CoD.TweenType.Linear )
						VSlineL:registerEventHandler( "transition_complete_keyframe", VSlineLFrame3 )
					end
				end
				
				VSlineL:completeAnimation()
				self.VSlineL:setLeftRight( true, false, -18, 605 )
				self.VSlineL:setTopBottom( false, false, 2.53, 10.53 )
				self.VSlineL:setAlpha( 0 )
				VSlineLFrame2( VSlineL, {} )
				local VScircleFrame2 = function ( VScircle, event )
					local VScircleFrame3 = function ( VScircle, event )
						if not event.interrupted then
							VScircle:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Bounce )
						end
						VScircle:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( VScircle, event )
						else
							VScircle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						VScircleFrame3( VScircle, event )
						return 
					else
						VScircle:beginAnimation( "keyframe", 1679, false, false, CoD.TweenType.Linear )
						VScircle:registerEventHandler( "transition_complete_keyframe", VScircleFrame3 )
					end
				end
				
				VScircle:completeAnimation()
				self.VScircle:setAlpha( 0 )
				VScircleFrame2( VScircle, {} )
				local VSlabelFrame2 = function ( VSlabel, event )
					local VSlabelFrame3 = function ( VSlabel, event )
						if not event.interrupted then
							VSlabel:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
						end
						VSlabel:setAlpha( 0.8 )
						if event.interrupted then
							self.clipFinished( VSlabel, event )
						else
							VSlabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						VSlabelFrame3( VSlabel, event )
						return 
					else
						VSlabel:beginAnimation( "keyframe", 1679, false, false, CoD.TweenType.Linear )
						VSlabel:registerEventHandler( "transition_complete_keyframe", VSlabelFrame3 )
					end
				end
				
				VSlabel:completeAnimation()
				self.VSlabel:setAlpha( 0 )
				VSlabelFrame2( VSlabel, {} )
				local Team1LineFrame2 = function ( Team1Line, event )
					local Team1LineFrame3 = function ( Team1Line, event )
						if not event.interrupted then
							Team1Line:beginAnimation( "keyframe", 269, false, false, CoD.TweenType.Linear )
						end
						Team1Line:setAlpha( 0.2 )
						if event.interrupted then
							self.clipFinished( Team1Line, event )
						else
							Team1Line:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Team1LineFrame3( Team1Line, event )
						return 
					else
						Team1Line:beginAnimation( "keyframe", 1389, false, false, CoD.TweenType.Linear )
						Team1Line:registerEventHandler( "transition_complete_keyframe", Team1LineFrame3 )
					end
				end
				
				Team1Line:completeAnimation()
				self.Team1Line:setAlpha( 0 )
				Team1LineFrame2( Team1Line, {} )
				local Team1IconAndNameWidgetFrame2 = function ( Team1IconAndNameWidget, event )
					local Team1IconAndNameWidgetFrame3 = function ( Team1IconAndNameWidget, event )
						if not event.interrupted then
							Team1IconAndNameWidget:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Bounce )
						end
						Team1IconAndNameWidget:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Team1IconAndNameWidget, event )
						else
							Team1IconAndNameWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Team1IconAndNameWidgetFrame3( Team1IconAndNameWidget, event )
						return 
					else
						Team1IconAndNameWidget:beginAnimation( "keyframe", 1700, false, false, CoD.TweenType.Linear )
						Team1IconAndNameWidget:registerEventHandler( "transition_complete_keyframe", Team1IconAndNameWidgetFrame3 )
					end
				end
				
				Team1IconAndNameWidget:completeAnimation()
				self.Team1IconAndNameWidget:setAlpha( 0 )
				Team1IconAndNameWidgetFrame2( Team1IconAndNameWidget, {} )
				FrameForCodCasterRight:completeAnimation()
				self.FrameForCodCasterRight:setAlpha( 0 )
				self.clipFinished( FrameForCodCasterRight, {} )
				FrameForCodCasterLeft:completeAnimation()
				self.FrameForCodCasterLeft:setAlpha( 0 )
				self.clipFinished( FrameForCodCasterLeft, {} )
				CodcasterColorLine2:completeAnimation()
				self.CodcasterColorLine2:setAlpha( 0 )
				self.clipFinished( CodcasterColorLine2, {} )
				CodcasterColorLine1:completeAnimation()
				self.CodcasterColorLine1:setAlpha( 0 )
				self.clipFinished( CodcasterColorLine1, {} )
				local LoadingScreenFactionIconFrame2 = function ( LoadingScreenFactionIcon, event )
					local LoadingScreenFactionIconFrame3 = function ( LoadingScreenFactionIcon, event )
						if not event.interrupted then
							LoadingScreenFactionIcon:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Bounce )
						end
						LoadingScreenFactionIcon:setLeftRight( false, false, -170.63, -32.88 )
						LoadingScreenFactionIcon:setTopBottom( false, false, -62.35, 75.4 )
						LoadingScreenFactionIcon:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( LoadingScreenFactionIcon, event )
						else
							LoadingScreenFactionIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LoadingScreenFactionIconFrame3( LoadingScreenFactionIcon, event )
						return 
					else
						LoadingScreenFactionIcon:beginAnimation( "keyframe", 1700, false, false, CoD.TweenType.Linear )
						LoadingScreenFactionIcon:registerEventHandler( "transition_complete_keyframe", LoadingScreenFactionIconFrame3 )
					end
				end
				
				LoadingScreenFactionIcon:completeAnimation()
				self.LoadingScreenFactionIcon:setLeftRight( false, false, -170.63, -32.88 )
				self.LoadingScreenFactionIcon:setTopBottom( false, false, -62.35, 75.4 )
				self.LoadingScreenFactionIcon:setAlpha( 0 )
				LoadingScreenFactionIconFrame2( LoadingScreenFactionIcon, {} )
				local LoadingScreenFactionIcon0Frame2 = function ( LoadingScreenFactionIcon0, event )
					local LoadingScreenFactionIcon0Frame3 = function ( LoadingScreenFactionIcon0, event )
						if not event.interrupted then
							LoadingScreenFactionIcon0:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Bounce )
						end
						LoadingScreenFactionIcon0:setLeftRight( false, false, 30.5, 168.25 )
						LoadingScreenFactionIcon0:setTopBottom( false, false, -62.35, 75.4 )
						LoadingScreenFactionIcon0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( LoadingScreenFactionIcon0, event )
						else
							LoadingScreenFactionIcon0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LoadingScreenFactionIcon0Frame3( LoadingScreenFactionIcon0, event )
						return 
					else
						LoadingScreenFactionIcon0:beginAnimation( "keyframe", 1700, false, false, CoD.TweenType.Linear )
						LoadingScreenFactionIcon0:registerEventHandler( "transition_complete_keyframe", LoadingScreenFactionIcon0Frame3 )
					end
				end
				
				LoadingScreenFactionIcon0:completeAnimation()
				self.LoadingScreenFactionIcon0:setLeftRight( false, false, 30.5, 168.25 )
				self.LoadingScreenFactionIcon0:setTopBottom( false, false, -62.35, 75.4 )
				self.LoadingScreenFactionIcon0:setAlpha( 0 )
				LoadingScreenFactionIcon0Frame2( LoadingScreenFactionIcon0, {} )
				local FactionNameCDPFrame2 = function ( FactionNameCDP, event )
					local FactionNameCDPFrame3 = function ( FactionNameCDP, event )
						if not event.interrupted then
							FactionNameCDP:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
						end
						FactionNameCDP:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( FactionNameCDP, event )
						else
							FactionNameCDP:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FactionNameCDPFrame3( FactionNameCDP, event )
						return 
					else
						FactionNameCDP:beginAnimation( "keyframe", 1679, false, false, CoD.TweenType.Linear )
						FactionNameCDP:registerEventHandler( "transition_complete_keyframe", FactionNameCDPFrame3 )
					end
				end
				
				FactionNameCDP:completeAnimation()
				self.FactionNameCDP:setAlpha( 0 )
				FactionNameCDPFrame2( FactionNameCDP, {} )
				local FactionNameBlackOpsFrame2 = function ( FactionNameBlackOps, event )
					local FactionNameBlackOpsFrame3 = function ( FactionNameBlackOps, event )
						if not event.interrupted then
							FactionNameBlackOps:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
						end
						FactionNameBlackOps:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( FactionNameBlackOps, event )
						else
							FactionNameBlackOps:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FactionNameBlackOpsFrame3( FactionNameBlackOps, event )
						return 
					else
						FactionNameBlackOps:beginAnimation( "keyframe", 1679, false, false, CoD.TweenType.Linear )
						FactionNameBlackOps:registerEventHandler( "transition_complete_keyframe", FactionNameBlackOpsFrame3 )
					end
				end
				
				FactionNameBlackOps:completeAnimation()
				self.FactionNameBlackOps:setAlpha( 0 )
				FactionNameBlackOpsFrame2( FactionNameBlackOps, {} )
				FactionNameLeftCodCaster:completeAnimation()
				self.FactionNameLeftCodCaster:setAlpha( 0 )
				self.clipFinished( FactionNameLeftCodCaster, {} )
			end
		},
		CodCaster = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				Team2IconAndNameWidget:completeAnimation()
				Team2IconAndNameWidget.LoadingScreenFactionBoxPnl:completeAnimation()
				self.Team2IconAndNameWidget:setAlpha( 0 )
				self.Team2IconAndNameWidget.LoadingScreenFactionBoxPnl:setXRot( 0 )
				self.Team2IconAndNameWidget.LoadingScreenFactionBoxPnl:setYRot( 180 )
				self.clipFinished( Team2IconAndNameWidget, {} )
				Team1IconAndNameWidget:completeAnimation()
				self.Team1IconAndNameWidget:setAlpha( 0 )
				self.clipFinished( Team1IconAndNameWidget, {} )
				FrameForCodCasterRight:completeAnimation()
				FrameForCodCasterRight.ColorPanelLine1:completeAnimation()
				self.FrameForCodCasterRight:setAlpha( 1 )
				self.FrameForCodCasterRight.ColorPanelLine1:setAlpha( 0.4 )
				self.FrameForCodCasterRight.ColorPanelLine1:setYRot( 180 )
				self.clipFinished( FrameForCodCasterRight, {} )
				FrameForCodCasterLeft:completeAnimation()
				FrameForCodCasterLeft.ColorPanelLine1:completeAnimation()
				self.FrameForCodCasterLeft:setAlpha( 1 )
				self.FrameForCodCasterLeft.ColorPanelLine1:setAlpha( 0.4 )
				self.clipFinished( FrameForCodCasterLeft, {} )
				CodcasterColorLine2:completeAnimation()
				self.CodcasterColorLine2:setAlpha( 1 )
				self.clipFinished( CodcasterColorLine2, {} )
				CodcasterColorLine1:completeAnimation()
				self.CodcasterColorLine1:setAlpha( 1 )
				self.clipFinished( CodcasterColorLine1, {} )
				LoadingScreenFactionIcon:completeAnimation()
				self.LoadingScreenFactionIcon:setLeftRight( false, false, -191.05, -10.13 )
				self.LoadingScreenFactionIcon:setTopBottom( false, false, -60.16, 74.4 )
				self.LoadingScreenFactionIcon:setAlpha( 1 )
				self.clipFinished( LoadingScreenFactionIcon, {} )
				LoadingScreenFactionIcon0:completeAnimation()
				self.LoadingScreenFactionIcon0:setLeftRight( false, false, 7.13, 193.05 )
				self.LoadingScreenFactionIcon0:setTopBottom( false, false, -60.16, 74.4 )
				self.LoadingScreenFactionIcon0:setAlpha( 1 )
				self.clipFinished( LoadingScreenFactionIcon0, {} )
				FactionNameCDP:completeAnimation()
				self.FactionNameCDP:setAlpha( 0 )
				self.clipFinished( FactionNameCDP, {} )
				FactionNameBlackOps:completeAnimation()
				self.FactionNameBlackOps:setAlpha( 0 )
				self.clipFinished( FactionNameBlackOps, {} )
				FactionNameRightCodCaster:completeAnimation()
				self.FactionNameRightCodCaster:setLeftRight( false, false, 123.5, 443.5 )
				self.FactionNameRightCodCaster:setTopBottom( true, false, 357.97, 376.97 )
				self.FactionNameRightCodCaster:setAlpha( 1 )
				self.clipFinished( FactionNameRightCodCaster, {} )
				FactionNameLeftCodCaster:completeAnimation()
				self.FactionNameLeftCodCaster:setAlpha( 1 )
				self.clipFinished( FactionNameLeftCodCaster, {} )
				LoadingScreenTeamPlayerList:completeAnimation()
				self.LoadingScreenTeamPlayerList:setAlpha( 1 )
				self.clipFinished( LoadingScreenTeamPlayerList, {} )
			end
		},
		Demo = {
			DefaultClip = function ()
				self:setupElementClipCounter( 15 )
				BLACKfade:completeAnimation()
				self.BLACKfade:setAlpha( 0.3 )
				self.clipFinished( BLACKfade, {} )
				LoadingScreenVSCirclePnl:completeAnimation()
				self.LoadingScreenVSCirclePnl:setAlpha( 0.5 )
				self.clipFinished( LoadingScreenVSCirclePnl, {} )
				Team2IconAndNameWidget:completeAnimation()
				self.Team2IconAndNameWidget:setAlpha( 1 )
				self.clipFinished( Team2IconAndNameWidget, {} )
				VScircle:completeAnimation()
				self.VScircle:setAlpha( 1 )
				self.clipFinished( VScircle, {} )
				VSlabel:completeAnimation()
				self.VSlabel:setAlpha( 1 )
				self.clipFinished( VSlabel, {} )
				Team1IconAndNameWidget:completeAnimation()
				self.Team1IconAndNameWidget:setAlpha( 1 )
				self.clipFinished( Team1IconAndNameWidget, {} )
				FrameForCodCasterRight:completeAnimation()
				self.FrameForCodCasterRight:setAlpha( 0 )
				self.clipFinished( FrameForCodCasterRight, {} )
				FrameForCodCasterLeft:completeAnimation()
				self.FrameForCodCasterLeft:setAlpha( 0 )
				self.clipFinished( FrameForCodCasterLeft, {} )
				LoadingScreenFactionIcon:completeAnimation()
				self.LoadingScreenFactionIcon:setLeftRight( false, false, -170.63, -32.88 )
				self.LoadingScreenFactionIcon:setTopBottom( false, false, -62.35, 75.4 )
				self.LoadingScreenFactionIcon:setAlpha( 1 )
				self.clipFinished( LoadingScreenFactionIcon, {} )
				LoadingScreenFactionIcon0:completeAnimation()
				self.LoadingScreenFactionIcon0:setLeftRight( false, false, 30.5, 168.25 )
				self.LoadingScreenFactionIcon0:setTopBottom( false, false, -62.35, 75.4 )
				self.LoadingScreenFactionIcon0:setAlpha( 1 )
				self.clipFinished( LoadingScreenFactionIcon0, {} )
				FactionNameCDP:completeAnimation()
				self.FactionNameCDP:setAlpha( 1 )
				self.clipFinished( FactionNameCDP, {} )
				FactionNameBlackOps:completeAnimation()
				self.FactionNameBlackOps:setAlpha( 1 )
				self.clipFinished( FactionNameBlackOps, {} )
				FactionNameRightCodCaster:completeAnimation()
				self.FactionNameRightCodCaster:setAlpha( 0 )
				self.clipFinished( FactionNameRightCodCaster, {} )
				FactionNameLeftCodCaster:completeAnimation()
				self.FactionNameLeftCodCaster:setAlpha( 0 )
				self.clipFinished( FactionNameLeftCodCaster, {} )
				LoadingScreenTeamPlayerList:completeAnimation()
				self.LoadingScreenTeamPlayerList:setAlpha( 0 )
				self.clipFinished( LoadingScreenTeamPlayerList, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "CodCaster",
			condition = function ( menu, element, event )
				return IsCodCaster( controller )
			end
		},
		{
			stateName = "Demo",
			condition = function ( menu, element, event )
				return IsDemoPlaying()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "factions.isCoDCaster" ), function ( model )
		f4_local1:updateElementState( self, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "factions.isCoDCaster"
		} )
	end )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f4_local1
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GameTypeglow:close()
		element.VSglow:close()
		element.LoadingScreenVSCirclePnl:close()
		element.Team2IconAndNameWidget:close()
		element.Team1IconAndNameWidget:close()
		element.FrameForCodCasterRight:close()
		element.FrameForCodCasterLeft:close()
		element.LoadingScreenFactionIcon:close()
		element.LoadingScreenFactionIcon0:close()
		element.LoadingScreenHeaderFooter:close()
		element.LoadingScreenTeamPlayerList:close()
		element.CodcasterColorLine2:close()
		element.CodcasterColorLine1:close()
		element.FactionNameCDP:close()
		element.FactionNameBlackOps:close()
		element.FactionNameRightCodCaster:close()
		element.FactionNameLeftCodCaster:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "LoadingScreenOverlayForTeamGames.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

