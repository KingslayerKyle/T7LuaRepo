require( "ui.uieditor.widgets.LoadingAnimation.LoadingScreenHeaderFooter" )
require( "ui.uieditor.widgets.StartGameFlow.LoadingScreenHeroListWidget" )
require( "ui.uieditor.widgets.StartGameFlow.LoadingScreenLoadbar" )
require( "ui.uieditor.widgets.StartGameFlow.LoadingScreenTeamGame" )

LUI.createMenu.Loading_MP = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Loading_MP" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Loading_MP.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local backgroundImage = LUI.UIImage.new()
	backgroundImage:setLeftRight( 0.5, 0.5, -960, 960 )
	backgroundImage:setTopBottom( 0.5, 0.5, -540, 540 )
	backgroundImage:setImage( RegisterImage( MapNameToMapLoadingImage( controller, GetCurrentMapID( "uie_img_t7_menu_mp_loadscreen_sector" ) ) ) )
	backgroundImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_expensive_blur" ) )
	backgroundImage:setShaderVector( 0, 0, 0, 0, 0 )
	backgroundImage:setShaderVector( 1, 1, 0, 0, 0 )
	self:addElement( backgroundImage )
	self.backgroundImage = backgroundImage
	
	local BLACKfade = LUI.UIImage.new()
	BLACKfade:setLeftRight( 0, 1, 0, 0 )
	BLACKfade:setTopBottom( 0, 1, 0, 0 )
	BLACKfade:setRGB( 0, 0, 0 )
	BLACKfade:setAlpha( 0.3 )
	self:addElement( BLACKfade )
	self.BLACKfade = BLACKfade
	
	local Team2Vignette = LUI.UIImage.new()
	Team2Vignette:setLeftRight( 0, 1, 0, 0 )
	Team2Vignette:setTopBottom( 1, 1, -428, -152 )
	Team2Vignette:setAlpha( 0.44 )
	Team2Vignette:setXRot( -180 )
	Team2Vignette:setImage( RegisterImage( "uie_t7_mp_menu_startflow_vignette" ) )
	Team2Vignette:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiply" ) )
	self:addElement( Team2Vignette )
	self.Team2Vignette = Team2Vignette
	
	local Team1Vignette = LUI.UIImage.new()
	Team1Vignette:setLeftRight( 0, 1, 0, 0 )
	Team1Vignette:setTopBottom( 0, 0, 172, 448 )
	Team1Vignette:setAlpha( 0.44 )
	Team1Vignette:setImage( RegisterImage( "uie_t7_mp_menu_startflow_vignette" ) )
	Team1Vignette:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiply" ) )
	self:addElement( Team1Vignette )
	self.Team1Vignette = Team1Vignette
	
	local LoadingScreenHeaderFooter = CoD.LoadingScreenHeaderFooter.new( self, controller )
	LoadingScreenHeaderFooter:setLeftRight( 0.5, 0.5, -960, 960 )
	LoadingScreenHeaderFooter:setTopBottom( 0.5, 0.5, -540, 540 )
	self:addElement( LoadingScreenHeaderFooter )
	self.LoadingScreenHeaderFooter = LoadingScreenHeaderFooter
	
	local LoadingScreenTeamGameInfo = CoD.LoadingScreenTeamGame.new( self, controller )
	LoadingScreenTeamGameInfo:setLeftRight( 0, 0, -26, 2010 )
	LoadingScreenTeamGameInfo:setTopBottom( 0, 0, 416, 654 )
	self:addElement( LoadingScreenTeamGameInfo )
	self.LoadingScreenTeamGameInfo = LoadingScreenTeamGameInfo
	
	local Team2PlayerList = LUI.UIList.new( self, controller, 6, 0, nil, false, false, 0, 0, false, false )
	Team2PlayerList:makeFocusable()
	Team2PlayerList:mergeStateConditions( {
		{
			stateName = "FFA",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	Team2PlayerList:setLeftRight( 0.5, 0.5, -735, 735 )
	Team2PlayerList:setTopBottom( 1, 1, -388, -133 )
	Team2PlayerList:setScale( 1.1 )
	Team2PlayerList:setWidgetType( CoD.LoadingScreenHeroListWidget )
	Team2PlayerList:setHorizontalCount( 6 )
	Team2PlayerList:setSpacing( 6 )
	Team2PlayerList:setDataSource( "LoadingScreenPlayerListTeam2" )
	self:addElement( Team2PlayerList )
	self.Team2PlayerList = Team2PlayerList
	
	local Team1PlayerList = LUI.UIList.new( self, controller, 6, 0, nil, false, false, 0, 0, false, false )
	Team1PlayerList:makeFocusable()
	Team1PlayerList:mergeStateConditions( {
		{
			stateName = "FFA",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	Team1PlayerList:setLeftRight( 0.5, 0.5, -735, 735 )
	Team1PlayerList:setTopBottom( 0, 0, 134, 389 )
	Team1PlayerList:setScale( 1.1 )
	Team1PlayerList:setWidgetType( CoD.LoadingScreenHeroListWidget )
	Team1PlayerList:setHorizontalCount( 6 )
	Team1PlayerList:setSpacing( 6 )
	Team1PlayerList:setDataSource( "LoadingScreenPlayerListTeam1" )
	self:addElement( Team1PlayerList )
	self.Team1PlayerList = Team1PlayerList
	
	local LoadingElem2 = CoD.LoadingScreenLoadbar.new( self, controller )
	LoadingElem2:setLeftRight( 0, 0, 59, 1862 )
	LoadingElem2:setTopBottom( 0, 0, 1010, 1054 )
	LoadingElem2:setAlpha( 0 )
	self:addElement( LoadingElem2 )
	self.LoadingElem2 = LoadingElem2
	
	Team2PlayerList.navigation = {
		up = Team1PlayerList
	}
	Team1PlayerList.navigation = {
		down = Team2PlayerList
	}
	self.resetProperties = function ()
		Team2Vignette:completeAnimation()
		Team1Vignette:completeAnimation()
		backgroundImage:completeAnimation()
		BLACKfade:completeAnimation()
		Team1PlayerList:completeAnimation()
		Team2PlayerList:completeAnimation()
		LoadingScreenTeamGameInfo:completeAnimation()
		LoadingScreenHeaderFooter:completeAnimation()
		LoadingElem2:completeAnimation()
		Team2Vignette:setAlpha( 0.44 )
		Team1Vignette:setAlpha( 0.44 )
		backgroundImage:setAlpha( 1 )
		BLACKfade:setAlpha( 0.3 )
		Team1PlayerList:setLeftRight( 0.5, 0.5, -735, 735 )
		Team1PlayerList:setTopBottom( 0, 0, 134, 389 )
		Team1PlayerList:setAlpha( 1 )
		Team2PlayerList:setAlpha( 1 )
		LoadingScreenTeamGameInfo:setAlpha( 1 )
		LoadingScreenHeaderFooter:setAlpha( 1 )
		LoadingElem2:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			StartLoading = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				local backgroundImageFrame2 = function ( backgroundImage, event )
					local backgroundImageFrame3 = function ( backgroundImage, event )
						if not event.interrupted then
							backgroundImage:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
						end
						backgroundImage:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( backgroundImage, event )
						else
							backgroundImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
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
			end
		},
		Prototype = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				Team1Vignette:completeAnimation()
				self.Team1Vignette:setAlpha( 0 )
				self.clipFinished( Team1Vignette, {} )
				LoadingScreenHeaderFooter:completeAnimation()
				self.LoadingScreenHeaderFooter:setAlpha( 0 )
				self.clipFinished( LoadingScreenHeaderFooter, {} )
				LoadingScreenTeamGameInfo:completeAnimation()
				self.LoadingScreenTeamGameInfo:setAlpha( 0 )
				self.clipFinished( LoadingScreenTeamGameInfo, {} )
				Team2PlayerList:completeAnimation()
				self.Team2PlayerList:setAlpha( 0 )
				self.clipFinished( Team2PlayerList, {} )
				Team1PlayerList:completeAnimation()
				self.Team1PlayerList:setAlpha( 0 )
				self.clipFinished( Team1PlayerList, {} )
				LoadingElem2:completeAnimation()
				self.LoadingElem2:setAlpha( 1 )
				self.clipFinished( LoadingElem2, {} )
			end
		},
		FreeRun = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			StartLoading = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				local backgroundImageFrame2 = function ( backgroundImage, event )
					if not event.interrupted then
						backgroundImage:beginAnimation( "keyframe", 2130, false, false, CoD.TweenType.Linear )
					end
					backgroundImage:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( backgroundImage, event )
					else
						backgroundImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				backgroundImage:completeAnimation()
				self.backgroundImage:setAlpha( 0 )
				backgroundImageFrame2( backgroundImage, {} )
				BLACKfade:completeAnimation()
				self.BLACKfade:setAlpha( 0 )
				self.clipFinished( BLACKfade, {} )
				Team2Vignette:completeAnimation()
				self.Team2Vignette:setAlpha( 0 )
				self.clipFinished( Team2Vignette, {} )
				Team1Vignette:completeAnimation()
				self.Team1Vignette:setAlpha( 0 )
				self.clipFinished( Team1Vignette, {} )
				LoadingScreenTeamGameInfo:completeAnimation()
				self.LoadingScreenTeamGameInfo:setAlpha( 0 )
				self.clipFinished( LoadingScreenTeamGameInfo, {} )
				Team2PlayerList:completeAnimation()
				self.Team2PlayerList:setAlpha( 0 )
				self.clipFinished( Team2PlayerList, {} )
				Team1PlayerList:completeAnimation()
				self.Team1PlayerList:setAlpha( 0 )
				self.clipFinished( Team1PlayerList, {} )
			end
		},
		NonTeamGame = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			StartLoading = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				local backgroundImageFrame2 = function ( backgroundImage, event )
					local backgroundImageFrame3 = function ( backgroundImage, event )
						if not event.interrupted then
							backgroundImage:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
						end
						backgroundImage:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( backgroundImage, event )
						else
							backgroundImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
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
				LoadingScreenTeamGameInfo:completeAnimation()
				self.LoadingScreenTeamGameInfo:setAlpha( 0 )
				self.clipFinished( LoadingScreenTeamGameInfo, {} )
				Team2PlayerList:completeAnimation()
				self.Team2PlayerList:setAlpha( 0 )
				self.clipFinished( Team2PlayerList, {} )
				Team1PlayerList:completeAnimation()
				self.Team1PlayerList:setLeftRight( 0.5, 0.5, -735, 735 )
				self.Team1PlayerList:setTopBottom( 0, 0, 488, 743 )
				self.clipFinished( Team1PlayerList, {} )
			end
		},
		Demo = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				Team1Vignette:completeAnimation()
				self.Team1Vignette:setAlpha( 0 )
				self.clipFinished( Team1Vignette, {} )
				Team2PlayerList:completeAnimation()
				self.Team2PlayerList:setAlpha( 0 )
				self.clipFinished( Team2PlayerList, {} )
				Team1PlayerList:completeAnimation()
				self.Team1PlayerList:setAlpha( 0 )
				self.clipFinished( Team1PlayerList, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Prototype",
			condition = function ( menu, element, event )
				return IsIntDvarNonZero( "mp_prototype" )
			end
		},
		{
			stateName = "FreeRun",
			condition = function ( menu, element, event )
				return IsGameTypeEqualToString( "fr" )
			end
		},
		{
			stateName = "NonTeamGame",
			condition = function ( menu, element, event )
				return not IsTeamBasedGame( controller )
			end
		},
		{
			stateName = "Demo",
			condition = function ( menu, element, event )
				return IsDemoPlaying()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "MapVote.mapVoteMapPreviousGametype" ), function ( model )
		self:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "MapVote.mapVoteMapPreviousGametype"
		} )
	end )
	CoD.Menu.AddNavigationHandler( self, self, controller )
	Team2PlayerList.id = "Team2PlayerList"
	Team1PlayerList.id = "Team1PlayerList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LoadingScreenHeaderFooter:close()
		self.LoadingScreenTeamGameInfo:close()
		self.Team2PlayerList:close()
		self.Team1PlayerList:close()
		self.LoadingElem2:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Loading_MP.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	local element = nil
	PlayClip( self, "StartLoading", controller )
	SizeToSafeArea( self.LoadingScreenHeaderFooter, controller )
	PlayClipOnElement( self, {
		elementName = "LoadingScreenTeamGameInfo",
		clipName = "StartLoading"
	}, controller )
	PlayClipOnElement( self, {
		elementName = "LoadingScreenHeaderFooter",
		clipName = "StartLoading"
	}, controller )
	element = Team1PlayerList
	if not IsTeamBasedGame( controller ) then
		CoD.HUDUtility.InitLoadingScreenPlayerListSize( element )
	end
	return self
end

