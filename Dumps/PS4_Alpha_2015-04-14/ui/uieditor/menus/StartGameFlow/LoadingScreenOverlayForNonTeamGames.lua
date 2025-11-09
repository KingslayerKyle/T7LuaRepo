require( "ui.uieditor.widgets.HUD.PrematchCountdown.PrematchCountdown_IconGlowPanel" )
require( "ui.uieditor.widgets.StartGameFlow.TeamIconAndNameWidgetElemSide" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.StartGameFlow.LoadingScreenHeroListWidget" )
require( "ui.uieditor.widgets.StartGameFlow.GameTypeAndMapNameWidgetContainer" )
require( "ui.uieditor.widgets.StartGameFlow.TipWidget" )

local AdjustListDimensions = function ( list, hCount )
	local listElementWidth = 160
	local listElementSpacing = 2
	local listWidth = listElementWidth * hCount + listElementSpacing * (hCount - 1)
	local left = 640 - listWidth / 2
	local right = left + listWidth
	list:setLeftRight( true, false, left, right )
end

local PostLoadFunc = function ( self, controller )
	self.LoadingBar:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "loadedFraction", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			self.LoadingBar:setShaderVector( 0, modelValue, 0, 0, 0 )
		end
	end )
	local team1ListCount = DataSources.LoadingScreenPlayerListTeam1.getCount( self.Team1PlayerList )
	local hCount = 4
	if team1ListCount > 8 and team1ListCount < 11 then
		self.Team1PlayerList:setHorizontalCount( 5 )
		hCount = 5
	elseif team1ListCount > 10 then
		self.Team1PlayerList:setHorizontalCount( 6 )
		hCount = 6
	else
		self.Team1PlayerList:setHorizontalCount( 4 )
	end
	if team1ListCount < 4 then
		hCount = team1ListCount
	end
	AdjustListDimensions( self.Team1PlayerList, hCount )
end

LUI.createMenu.LoadingScreenOverlayForNonTeamGames = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "LoadingScreenOverlayForNonTeamGames" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local Fade = LUI.UIImage.new()
	Fade:setLeftRight( false, false, -651, 651 )
	Fade:setTopBottom( false, false, -376, 372 )
	Fade:setRGB( 0, 0, 0 )
	Fade:setAlpha( 0 )
	Fade:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Fade )
	self.Fade = Fade
	
	local Team1Vignette = LUI.UIImage.new()
	Team1Vignette:setLeftRight( true, false, 80, 1168 )
	Team1Vignette:setTopBottom( true, false, 308, 492 )
	Team1Vignette:setRGB( 1, 1, 1 )
	Team1Vignette:setAlpha( 0.44 )
	Team1Vignette:setXRot( -180 )
	Team1Vignette:setImage( RegisterImage( "uie_t7_mp_menu_startflow_vignette" ) )
	Team1Vignette:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiply" ) )
	self:addElement( Team1Vignette )
	self.Team1Vignette = Team1Vignette
	
	local GameTypeglow = CoD.PrematchCountdown_IconGlowPanel.new( self, controller )
	GameTypeglow:setLeftRight( false, false, -224.49, 205.49 )
	GameTypeglow:setTopBottom( false, false, -341.63, 1.63 )
	GameTypeglow:setRGB( 1, 1, 1 )
	GameTypeglow:setAlpha( 0.53 )
	self:addElement( GameTypeglow )
	self.GameTypeglow = GameTypeglow
	
	local LoadingImage = LUI.UIImage.new()
	LoadingImage:setLeftRight( true, false, 0, 1280 )
	LoadingImage:setTopBottom( true, false, 655, 720 )
	LoadingImage:setRGB( 0, 0, 0 )
	LoadingImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( LoadingImage )
	self.LoadingImage = LoadingImage
	
	local LoadingElem2 = CoD.TeamIconAndNameWidgetElemSide.new( self, controller )
	LoadingElem2:setLeftRight( false, true, -60.1, -31.1 )
	LoadingElem2:setTopBottom( true, false, 666.5, 693.5 )
	LoadingElem2:setRGB( 1, 1, 1 )
	LoadingElem2:setYRot( -180 )
	self:addElement( LoadingElem2 )
	self.LoadingElem2 = LoadingElem2
	
	local LoadingElem1 = CoD.TeamIconAndNameWidgetElemSide.new( self, controller )
	LoadingElem1:setLeftRight( false, true, -1249.1, -1220.1 )
	LoadingElem1:setTopBottom( true, false, 666.5, 693.5 )
	LoadingElem1:setRGB( 1, 1, 1 )
	self:addElement( LoadingElem1 )
	self.LoadingElem1 = LoadingElem1
	
	local LoadingBar = LUI.UIImage.new()
	LoadingBar:setLeftRight( false, true, -1045, -60.1 )
	LoadingBar:setTopBottom( false, false, 308, 332 )
	LoadingBar:setRGB( 1, 0.35, 0 )
	LoadingBar:setImage( RegisterImage( "uie_t7_mp_menu_startflow_meterfill" ) )
	LoadingBar:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	LoadingBar:setShaderVector( 0, 1, 0, 0, 0 )
	LoadingBar:setShaderVector( 1, 0, 0, 0, 0 )
	LoadingBar:setShaderVector( 2, 1, 0, 0, 0 )
	LoadingBar:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( LoadingBar )
	self.LoadingBar = LoadingBar
	
	local LoadingStatusBox = CoD.FE_TitleNumBrdr.new( self, controller )
	LoadingStatusBox:setLeftRight( true, false, 64, 232 )
	LoadingStatusBox:setTopBottom( false, false, 308, 332 )
	LoadingStatusBox:setRGB( 1, 1, 1 )
	self:addElement( LoadingStatusBox )
	self.LoadingStatusBox = LoadingStatusBox
	
	local LoadingStatus = LUI.UIText.new()
	LoadingStatus:setLeftRight( true, false, 64, 231 )
	LoadingStatus:setTopBottom( false, false, 312, 328 )
	LoadingStatus:setRGB( 0.52, 0.58, 0.6 )
	LoadingStatus:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	LoadingStatus:setLetterSpacing( 0.5 )
	LoadingStatus:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	LoadingStatus:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LoadingStatus:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "statusText", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LoadingStatus:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( LoadingStatus )
	self.LoadingStatus = LoadingStatus
	
	local LoadingLine3 = LUI.UIImage.new()
	LoadingLine3:setLeftRight( true, false, 235, 1216 )
	LoadingLine3:setTopBottom( true, false, 688, 696 )
	LoadingLine3:setRGB( 0.9, 0.9, 0.9 )
	LoadingLine3:setAlpha( 0.9 )
	LoadingLine3:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	LoadingLine3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LoadingLine3 )
	self.LoadingLine3 = LoadingLine3
	
	local LoadingLine2 = LUI.UIImage.new()
	LoadingLine2:setLeftRight( true, false, 235, 1216 )
	LoadingLine2:setTopBottom( true, false, 664, 672 )
	LoadingLine2:setRGB( 0.9, 0.9, 0.9 )
	LoadingLine2:setAlpha( 0.9 )
	LoadingLine2:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	LoadingLine2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LoadingLine2 )
	self.LoadingLine2 = LoadingLine2
	
	local LoadingLine1 = LUI.UIImage.new()
	LoadingLine1:setLeftRight( true, false, -11, 1293 )
	LoadingLine1:setTopBottom( true, false, 651, 659 )
	LoadingLine1:setRGB( 0.9, 0.9, 0.9 )
	LoadingLine1:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	LoadingLine1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( LoadingLine1 )
	self.LoadingLine1 = LoadingLine1
	
	local Team1Line = LUI.UIImage.new()
	Team1Line:setLeftRight( true, true, -11, 11 )
	Team1Line:setTopBottom( false, false, -57, -49 )
	Team1Line:setRGB( 1, 1, 1 )
	Team1Line:setAlpha( 0.2 )
	Team1Line:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Team1Line:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Team1Line )
	self.Team1Line = Team1Line
	
	local Team1PlayerList = LUI.UIList.new( self, controller, 5, 0, nil, false, false, 0, 0, false, false )
	Team1PlayerList:makeFocusable()
	Team1PlayerList:setLeftRight( false, false, -510.5, 510.5 )
	Team1PlayerList:setTopBottom( true, false, 319, 644 )
	Team1PlayerList:setRGB( 1, 1, 1 )
	Team1PlayerList:setDataSource( "LoadingScreenPlayerListTeam1" )
	Team1PlayerList:setWidgetType( CoD.LoadingScreenHeroListWidget )
	Team1PlayerList:setHorizontalCount( 6 )
	Team1PlayerList:setVerticalCount( 2 )
	Team1PlayerList:setSpacing( 5 )
	self:addElement( Team1PlayerList )
	self.Team1PlayerList = Team1PlayerList
	
	local HeaderImage = LUI.UIImage.new()
	HeaderImage:setLeftRight( true, false, 0, 1280 )
	HeaderImage:setTopBottom( true, false, 0, 68 )
	HeaderImage:setRGB( 0, 0, 0 )
	HeaderImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( HeaderImage )
	self.HeaderImage = HeaderImage
	
	local HeaderLine2 = LUI.UIImage.new()
	HeaderLine2:setLeftRight( true, false, -11, 1293 )
	HeaderLine2:setTopBottom( true, false, 64, 72 )
	HeaderLine2:setRGB( 0.9, 0.9, 0.9 )
	HeaderLine2:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	HeaderLine2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( HeaderLine2 )
	self.HeaderLine2 = HeaderLine2
	
	local HeaderElem2 = CoD.TeamIconAndNameWidgetElemSide.new( self, controller )
	HeaderElem2:setLeftRight( false, true, -60.1, -31.1 )
	HeaderElem2:setTopBottom( true, false, 34.5, 61.5 )
	HeaderElem2:setRGB( 1, 1, 1 )
	HeaderElem2:setYRot( -180 )
	self:addElement( HeaderElem2 )
	self.HeaderElem2 = HeaderElem2
	
	local HeaderElem1 = CoD.TeamIconAndNameWidgetElemSide.new( self, controller )
	HeaderElem1:setLeftRight( false, true, -1249.1, -1220.1 )
	HeaderElem1:setTopBottom( true, false, 34.5, 61.5 )
	HeaderElem1:setRGB( 1, 1, 1 )
	self:addElement( HeaderElem1 )
	self.HeaderElem1 = HeaderElem1
	
	local HeaderTitle = CoD.GameTypeAndMapNameWidgetContainer.new( self, controller )
	HeaderTitle:setLeftRight( true, false, 61, 1213 )
	HeaderTitle:setTopBottom( true, false, 24, 72 )
	HeaderTitle:setRGB( 1, 1, 1 )
	self:addElement( HeaderTitle )
	self.HeaderTitle = HeaderTitle
	
	local HeaderTip = CoD.TipWidget.new( self, controller )
	HeaderTip:setLeftRight( false, true, -1280, 0 )
	HeaderTip:setTopBottom( true, false, 24, 72 )
	HeaderTip:setRGB( 1, 1, 1 )
	self:addElement( HeaderTip )
	self.HeaderTip = HeaderTip
	
	local HeaderLine1 = LUI.UIImage.new()
	HeaderLine1:setLeftRight( true, false, -11, 1293 )
	HeaderLine1:setTopBottom( true, false, 23, 31 )
	HeaderLine1:setRGB( 0.9, 0.9, 0.9 )
	HeaderLine1:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	HeaderLine1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( HeaderLine1 )
	self.HeaderLine1 = HeaderLine1
	
	local GameTypeIcon = LUI.UIImage.new()
	GameTypeIcon:setLeftRight( true, false, 551.67, 722.34 )
	GameTypeIcon:setTopBottom( true, false, 104.67, 275.34 )
	GameTypeIcon:setRGB( 1, 1, 1 )
	GameTypeIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	GameTypeIcon:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "gameTypeIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GameTypeIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( GameTypeIcon )
	self.GameTypeIcon = GameTypeIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			StartLoading = function ()
				self:setupElementClipCounter( 22 )
				local FadeFrame2 = function ( Fade, event )
					if not event.interrupted then
						Fade:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					Fade:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Fade, event )
					else
						Fade:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Fade:completeAnimation()
				self.Fade:setAlpha( 1 )
				FadeFrame2( Fade, {} )
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
				local GameTypeglowFrame2 = function ( GameTypeglow, event )
					local GameTypeglowFrame3 = function ( GameTypeglow, event )
						if not event.interrupted then
							GameTypeglow:beginAnimation( "keyframe", 410, false, false, CoD.TweenType.Linear )
						end
						GameTypeglow:setAlpha( 0.53 )
						if event.interrupted then
							self.clipFinished( GameTypeglow, event )
						else
							GameTypeglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						GameTypeglowFrame3( GameTypeglow, event )
						return 
					else
						GameTypeglow:beginAnimation( "keyframe", 1799, false, false, CoD.TweenType.Linear )
						GameTypeglow:registerEventHandler( "transition_complete_keyframe", GameTypeglowFrame3 )
					end
				end
				
				GameTypeglow:completeAnimation()
				self.GameTypeglow:setAlpha( 0 )
				GameTypeglowFrame2( GameTypeglow, {} )
				local LoadingImageFrame2 = function ( LoadingImage, event )
					local LoadingImageFrame3 = function ( LoadingImage, event )
						if not event.interrupted then
							LoadingImage:beginAnimation( "keyframe", 250, false, true, CoD.TweenType.Linear )
						end
						LoadingImage:setLeftRight( true, false, 0, 1280 )
						LoadingImage:setTopBottom( true, false, 655, 720 )
						LoadingImage:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( LoadingImage, event )
						else
							LoadingImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LoadingImageFrame3( LoadingImage, event )
						return 
					else
						LoadingImage:beginAnimation( "keyframe", 1750, false, false, CoD.TweenType.Linear )
						LoadingImage:registerEventHandler( "transition_complete_keyframe", LoadingImageFrame3 )
					end
				end
				
				LoadingImage:completeAnimation()
				self.LoadingImage:setLeftRight( true, false, 0, 1280 )
				self.LoadingImage:setTopBottom( true, false, 726, 791 )
				self.LoadingImage:setAlpha( 1 )
				LoadingImageFrame2( LoadingImage, {} )
				local LoadingElem2Frame2 = function ( LoadingElem2, event )
					local LoadingElem2Frame3 = function ( LoadingElem2, event )
						if not event.interrupted then
							LoadingElem2:beginAnimation( "keyframe", 129, false, true, CoD.TweenType.Linear )
						end
						LoadingElem2:setLeftRight( false, true, -60.1, -31.1 )
						LoadingElem2:setTopBottom( true, false, 666.5, 693.5 )
						LoadingElem2:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( LoadingElem2, event )
						else
							LoadingElem2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LoadingElem2Frame3( LoadingElem2, event )
						return 
					else
						LoadingElem2:beginAnimation( "keyframe", 2210, false, false, CoD.TweenType.Linear )
						LoadingElem2:registerEventHandler( "transition_complete_keyframe", LoadingElem2Frame3 )
					end
				end
				
				LoadingElem2:completeAnimation()
				self.LoadingElem2:setLeftRight( false, true, -35.1, -6.1 )
				self.LoadingElem2:setTopBottom( true, false, 666.5, 693.5 )
				self.LoadingElem2:setAlpha( 0 )
				LoadingElem2Frame2( LoadingElem2, {} )
				local LoadingElem1Frame2 = function ( LoadingElem1, event )
					local LoadingElem1Frame3 = function ( LoadingElem1, event )
						if not event.interrupted then
							LoadingElem1:beginAnimation( "keyframe", 130, false, true, CoD.TweenType.Linear )
						end
						LoadingElem1:setLeftRight( false, true, -1249.1, -1220.1 )
						LoadingElem1:setTopBottom( true, false, 666.5, 693.5 )
						LoadingElem1:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( LoadingElem1, event )
						else
							LoadingElem1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LoadingElem1Frame3( LoadingElem1, event )
						return 
					else
						LoadingElem1:beginAnimation( "keyframe", 2250, false, false, CoD.TweenType.Linear )
						LoadingElem1:registerEventHandler( "transition_complete_keyframe", LoadingElem1Frame3 )
					end
				end
				
				LoadingElem1:completeAnimation()
				self.LoadingElem1:setLeftRight( false, true, -1274.1, -1245.1 )
				self.LoadingElem1:setTopBottom( true, false, 666.5, 693.5 )
				self.LoadingElem1:setAlpha( 0 )
				LoadingElem1Frame2( LoadingElem1, {} )
				local LoadingBarFrame2 = function ( LoadingBar, event )
					local LoadingBarFrame3 = function ( LoadingBar, event )
						if not event.interrupted then
							LoadingBar:beginAnimation( "keyframe", 190, false, true, CoD.TweenType.Linear )
						end
						LoadingBar:setLeftRight( false, true, -1045, -60.1 )
						LoadingBar:setTopBottom( false, false, 308, 332 )
						LoadingBar:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( LoadingBar, event )
						else
							LoadingBar:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LoadingBarFrame3( LoadingBar, event )
						return 
					else
						LoadingBar:beginAnimation( "keyframe", 2059, false, false, CoD.TweenType.Linear )
						LoadingBar:registerEventHandler( "transition_complete_keyframe", LoadingBarFrame3 )
					end
				end
				
				LoadingBar:completeAnimation()
				self.LoadingBar:setLeftRight( false, true, -1045, -60.1 )
				self.LoadingBar:setTopBottom( false, false, 347, 371 )
				self.LoadingBar:setAlpha( 0 )
				LoadingBarFrame2( LoadingBar, {} )
				local LoadingStatusBoxFrame2 = function ( LoadingStatusBox, event )
					local LoadingStatusBoxFrame3 = function ( LoadingStatusBox, event )
						if not event.interrupted then
							LoadingStatusBox:beginAnimation( "keyframe", 240, false, true, CoD.TweenType.Linear )
						end
						LoadingStatusBox:setLeftRight( true, false, 64, 232 )
						LoadingStatusBox:setTopBottom( false, false, 308, 332 )
						LoadingStatusBox:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( LoadingStatusBox, event )
						else
							LoadingStatusBox:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LoadingStatusBoxFrame3( LoadingStatusBox, event )
						return 
					else
						LoadingStatusBox:beginAnimation( "keyframe", 1919, false, false, CoD.TweenType.Linear )
						LoadingStatusBox:registerEventHandler( "transition_complete_keyframe", LoadingStatusBoxFrame3 )
					end
				end
				
				LoadingStatusBox:completeAnimation()
				self.LoadingStatusBox:setLeftRight( true, false, 64, 232 )
				self.LoadingStatusBox:setTopBottom( false, false, 347, 371 )
				self.LoadingStatusBox:setAlpha( 0 )
				LoadingStatusBoxFrame2( LoadingStatusBox, {} )
				local LoadingStatusFrame2 = function ( LoadingStatus, event )
					local LoadingStatusFrame3 = function ( LoadingStatus, event )
						if not event.interrupted then
							LoadingStatus:beginAnimation( "keyframe", 220, false, true, CoD.TweenType.Linear )
						end
						LoadingStatus:setLeftRight( true, false, 64, 231 )
						LoadingStatus:setTopBottom( false, false, 311, 330 )
						LoadingStatus:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( LoadingStatus, event )
						else
							LoadingStatus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LoadingStatusFrame3( LoadingStatus, event )
						return 
					else
						LoadingStatus:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
						LoadingStatus:registerEventHandler( "transition_complete_keyframe", LoadingStatusFrame3 )
					end
				end
				
				LoadingStatus:completeAnimation()
				self.LoadingStatus:setLeftRight( true, false, 64, 231 )
				self.LoadingStatus:setTopBottom( false, false, 351, 369 )
				self.LoadingStatus:setAlpha( 0 )
				LoadingStatusFrame2( LoadingStatus, {} )
				local LoadingLine3Frame2 = function ( LoadingLine3, event )
					local LoadingLine3Frame3 = function ( LoadingLine3, event )
						if not event.interrupted then
							LoadingLine3:beginAnimation( "keyframe", 170, false, true, CoD.TweenType.Linear )
						end
						LoadingLine3:setLeftRight( true, false, 235, 1216 )
						LoadingLine3:setTopBottom( true, false, 688, 696 )
						LoadingLine3:setAlpha( 0.9 )
						if event.interrupted then
							self.clipFinished( LoadingLine3, event )
						else
							LoadingLine3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LoadingLine3Frame3( LoadingLine3, event )
						return 
					else
						LoadingLine3:beginAnimation( "keyframe", 2119, false, false, CoD.TweenType.Linear )
						LoadingLine3:registerEventHandler( "transition_complete_keyframe", LoadingLine3Frame3 )
					end
				end
				
				LoadingLine3:completeAnimation()
				self.LoadingLine3:setLeftRight( true, false, 235, 1216 )
				self.LoadingLine3:setTopBottom( true, false, 727, 735 )
				self.LoadingLine3:setAlpha( 0 )
				LoadingLine3Frame2( LoadingLine3, {} )
				local LoadingLine2Frame2 = function ( LoadingLine2, event )
					local LoadingLine2Frame3 = function ( LoadingLine2, event )
						if not event.interrupted then
							LoadingLine2:beginAnimation( "keyframe", 320, false, true, CoD.TweenType.Linear )
						end
						LoadingLine2:setLeftRight( true, false, 235, 1216 )
						LoadingLine2:setTopBottom( true, false, 664, 672 )
						LoadingLine2:setAlpha( 0.9 )
						if event.interrupted then
							self.clipFinished( LoadingLine2, event )
						else
							LoadingLine2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LoadingLine2Frame3( LoadingLine2, event )
						return 
					else
						LoadingLine2:beginAnimation( "keyframe", 1870, false, false, CoD.TweenType.Linear )
						LoadingLine2:registerEventHandler( "transition_complete_keyframe", LoadingLine2Frame3 )
					end
				end
				
				LoadingLine2:completeAnimation()
				self.LoadingLine2:setLeftRight( true, false, 235, 1216 )
				self.LoadingLine2:setTopBottom( true, false, 703, 711 )
				self.LoadingLine2:setAlpha( 0 )
				LoadingLine2Frame2( LoadingLine2, {} )
				local LoadingLine1Frame2 = function ( LoadingLine1, event )
					local LoadingLine1Frame3 = function ( LoadingLine1, event )
						if not event.interrupted then
							LoadingLine1:beginAnimation( "keyframe", 320, false, true, CoD.TweenType.Linear )
						end
						LoadingLine1:setLeftRight( true, false, -11, 1293 )
						LoadingLine1:setTopBottom( true, false, 651, 659 )
						LoadingLine1:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( LoadingLine1, event )
						else
							LoadingLine1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LoadingLine1Frame3( LoadingLine1, event )
						return 
					else
						LoadingLine1:beginAnimation( "keyframe", 1820, false, false, CoD.TweenType.Linear )
						LoadingLine1:registerEventHandler( "transition_complete_keyframe", LoadingLine1Frame3 )
					end
				end
				
				LoadingLine1:completeAnimation()
				self.LoadingLine1:setLeftRight( true, false, -11, 1293 )
				self.LoadingLine1:setTopBottom( true, false, 690, 698 )
				self.LoadingLine1:setAlpha( 0 )
				LoadingLine1Frame2( LoadingLine1, {} )
				local Team1LineFrame2 = function ( Team1Line, event )
					local Team1LineFrame3 = function ( Team1Line, event )
						if not event.interrupted then
							Team1Line:beginAnimation( "keyframe", 269, false, false, CoD.TweenType.Linear )
						end
						Team1Line:setLeftRight( true, true, -11, 11 )
						Team1Line:setTopBottom( false, false, -56, -48 )
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
				self.Team1Line:setLeftRight( true, true, 601, -610 )
				self.Team1Line:setTopBottom( false, false, -56, -48 )
				self.Team1Line:setAlpha( 0 )
				Team1LineFrame2( Team1Line, {} )
				local Team1PlayerListFrame2 = function ( Team1PlayerList, event )
					local Team1PlayerListFrame3 = function ( Team1PlayerList, event )
						if not event.interrupted then
							Team1PlayerList:beginAnimation( "keyframe", 250, false, true, CoD.TweenType.Linear )
						end
						Team1PlayerList:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Team1PlayerList, event )
						else
							Team1PlayerList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Team1PlayerListFrame3( Team1PlayerList, event )
						return 
					else
						Team1PlayerList:beginAnimation( "keyframe", 1100, false, false, CoD.TweenType.Linear )
						Team1PlayerList:registerEventHandler( "transition_complete_keyframe", Team1PlayerListFrame3 )
					end
				end
				
				Team1PlayerList:completeAnimation()
				self.Team1PlayerList:setAlpha( 0 )
				Team1PlayerListFrame2( Team1PlayerList, {} )
				local HeaderImageFrame2 = function ( HeaderImage, event )
					local HeaderImageFrame3 = function ( HeaderImage, event )
						if not event.interrupted then
							HeaderImage:beginAnimation( "keyframe", 499, false, true, CoD.TweenType.Linear )
						end
						HeaderImage:setLeftRight( true, false, 0, 1280 )
						HeaderImage:setTopBottom( true, false, 0, 68 )
						HeaderImage:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( HeaderImage, event )
						else
							HeaderImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						HeaderImageFrame3( HeaderImage, event )
						return 
					else
						HeaderImage:beginAnimation( "keyframe", 270, false, false, CoD.TweenType.Linear )
						HeaderImage:registerEventHandler( "transition_complete_keyframe", HeaderImageFrame3 )
					end
				end
				
				HeaderImage:completeAnimation()
				self.HeaderImage:setLeftRight( true, false, 0, 1280 )
				self.HeaderImage:setTopBottom( true, false, -71, -3 )
				self.HeaderImage:setAlpha( 1 )
				HeaderImageFrame2( HeaderImage, {} )
				local HeaderLine2Frame2 = function ( HeaderLine2, event )
					local HeaderLine2Frame3 = function ( HeaderLine2, event )
						if not event.interrupted then
							HeaderLine2:beginAnimation( "keyframe", 500, false, true, CoD.TweenType.Linear )
						end
						HeaderLine2:setLeftRight( true, false, -11, 1293 )
						HeaderLine2:setTopBottom( true, false, 64, 72 )
						HeaderLine2:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( HeaderLine2, event )
						else
							HeaderLine2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						HeaderLine2Frame3( HeaderLine2, event )
						return 
					else
						HeaderLine2:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
						HeaderLine2:registerEventHandler( "transition_complete_keyframe", HeaderLine2Frame3 )
					end
				end
				
				HeaderLine2:completeAnimation()
				self.HeaderLine2:setLeftRight( true, false, -11, 1293 )
				self.HeaderLine2:setTopBottom( true, false, -6, 2 )
				self.HeaderLine2:setAlpha( 0 )
				HeaderLine2Frame2( HeaderLine2, {} )
				local HeaderElem2Frame2 = function ( HeaderElem2, event )
					local HeaderElem2Frame3 = function ( HeaderElem2, event )
						if not event.interrupted then
							HeaderElem2:beginAnimation( "keyframe", 160, false, true, CoD.TweenType.Linear )
						end
						HeaderElem2:setLeftRight( false, true, -60.1, -31.1 )
						HeaderElem2:setTopBottom( true, false, 34.5, 61.5 )
						HeaderElem2:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( HeaderElem2, event )
						else
							HeaderElem2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						HeaderElem2Frame3( HeaderElem2, event )
						return 
					else
						HeaderElem2:beginAnimation( "keyframe", 930, false, false, CoD.TweenType.Linear )
						HeaderElem2:registerEventHandler( "transition_complete_keyframe", HeaderElem2Frame3 )
					end
				end
				
				HeaderElem2:completeAnimation()
				self.HeaderElem2:setLeftRight( false, true, -35.1, -6.1 )
				self.HeaderElem2:setTopBottom( true, false, 34.5, 61.5 )
				self.HeaderElem2:setAlpha( 0 )
				HeaderElem2Frame2( HeaderElem2, {} )
				local HeaderElem1Frame2 = function ( HeaderElem1, event )
					local HeaderElem1Frame3 = function ( HeaderElem1, event )
						if not event.interrupted then
							HeaderElem1:beginAnimation( "keyframe", 159, false, true, CoD.TweenType.Linear )
						end
						HeaderElem1:setLeftRight( false, true, -1249.1, -1220.1 )
						HeaderElem1:setTopBottom( true, false, 34.5, 61.5 )
						HeaderElem1:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( HeaderElem1, event )
						else
							HeaderElem1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						HeaderElem1Frame3( HeaderElem1, event )
						return 
					else
						HeaderElem1:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
						HeaderElem1:registerEventHandler( "transition_complete_keyframe", HeaderElem1Frame3 )
					end
				end
				
				HeaderElem1:completeAnimation()
				self.HeaderElem1:setLeftRight( false, true, -1274.1, -1245.1 )
				self.HeaderElem1:setTopBottom( true, false, 34.5, 61.5 )
				self.HeaderElem1:setAlpha( 0 )
				HeaderElem1Frame2( HeaderElem1, {} )
				local HeaderTitleFrame2 = function ( HeaderTitle, event )
					local HeaderTitleFrame3 = function ( HeaderTitle, event )
						if not event.interrupted then
							HeaderTitle:beginAnimation( "keyframe", 499, false, true, CoD.TweenType.Linear )
						end
						HeaderTitle:setLeftRight( true, false, 61, 1213 )
						HeaderTitle:setTopBottom( true, false, 24, 72 )
						HeaderTitle:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( HeaderTitle, event )
						else
							HeaderTitle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						HeaderTitleFrame3( HeaderTitle, event )
						return 
					else
						HeaderTitle:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
						HeaderTitle:registerEventHandler( "transition_complete_keyframe", HeaderTitleFrame3 )
					end
				end
				
				HeaderTitle:completeAnimation()
				self.HeaderTitle:setLeftRight( true, false, 61, 1213 )
				self.HeaderTitle:setTopBottom( true, false, -46, 2 )
				self.HeaderTitle:setAlpha( 0 )
				HeaderTitleFrame2( HeaderTitle, {} )
				local HeaderTipFrame2 = function ( HeaderTip, event )
					local HeaderTipFrame3 = function ( HeaderTip, event )
						if not event.interrupted then
							HeaderTip:beginAnimation( "keyframe", 499, false, true, CoD.TweenType.Linear )
						end
						HeaderTip:setLeftRight( false, true, -1280, 0 )
						HeaderTip:setTopBottom( true, false, 24, 72 )
						HeaderTip:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( HeaderTip, event )
						else
							HeaderTip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						HeaderTipFrame3( HeaderTip, event )
						return 
					else
						HeaderTip:beginAnimation( "keyframe", 540, false, false, CoD.TweenType.Linear )
						HeaderTip:registerEventHandler( "transition_complete_keyframe", HeaderTipFrame3 )
					end
				end
				
				HeaderTip:completeAnimation()
				self.HeaderTip:setLeftRight( false, true, -1280, 0 )
				self.HeaderTip:setTopBottom( true, false, -46, 2 )
				self.HeaderTip:setAlpha( 0 )
				HeaderTipFrame2( HeaderTip, {} )
				local HeaderLine1Frame2 = function ( HeaderLine1, event )
					local HeaderLine1Frame3 = function ( HeaderLine1, event )
						if not event.interrupted then
							HeaderLine1:beginAnimation( "keyframe", 500, false, true, CoD.TweenType.Linear )
						end
						HeaderLine1:setLeftRight( true, false, -11, 1293 )
						HeaderLine1:setTopBottom( true, false, 23, 31 )
						HeaderLine1:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( HeaderLine1, event )
						else
							HeaderLine1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						HeaderLine1Frame3( HeaderLine1, event )
						return 
					else
						HeaderLine1:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Linear )
						HeaderLine1:registerEventHandler( "transition_complete_keyframe", HeaderLine1Frame3 )
					end
				end
				
				HeaderLine1:completeAnimation()
				self.HeaderLine1:setLeftRight( true, false, -11, 1293 )
				self.HeaderLine1:setTopBottom( true, false, -47, -39 )
				self.HeaderLine1:setAlpha( 0 )
				HeaderLine1Frame2( HeaderLine1, {} )
				local GameTypeIconFrame2 = function ( GameTypeIcon, event )
					local GameTypeIconFrame3 = function ( GameTypeIcon, event )
						if not event.interrupted then
							GameTypeIcon:beginAnimation( "keyframe", 269, false, false, CoD.TweenType.Linear )
						end
						GameTypeIcon:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( GameTypeIcon, event )
						else
							GameTypeIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						GameTypeIconFrame3( GameTypeIcon, event )
						return 
					else
						GameTypeIcon:beginAnimation( "keyframe", 1629, false, false, CoD.TweenType.Linear )
						GameTypeIcon:registerEventHandler( "transition_complete_keyframe", GameTypeIconFrame3 )
					end
				end
				
				GameTypeIcon:completeAnimation()
				self.GameTypeIcon:setAlpha( 0 )
				GameTypeIconFrame2( GameTypeIcon, {} )
			end
		}
	}
	Team1PlayerList.id = "Team1PlayerList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.Team1PlayerList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.GameTypeglow:close()
		self.LoadingElem2:close()
		self.LoadingElem1:close()
		self.LoadingStatusBox:close()
		self.Team1PlayerList:close()
		self.HeaderElem2:close()
		self.HeaderElem1:close()
		self.HeaderTitle:close()
		self.HeaderTip:close()
		self.LoadingStatus:close()
		self.GameTypeIcon:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

