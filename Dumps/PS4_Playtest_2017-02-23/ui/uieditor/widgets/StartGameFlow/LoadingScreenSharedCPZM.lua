require( "ui.uieditor.widgets.HUD.MoviePlayback.MovieSubtitles" )
require( "ui.uieditor.widgets.LoadingAnimation.LoadingScreenSkipPrompt" )
require( "ui.uieditor.widgets.StartGameFlow.LoadingScreenTalkerWidgetCPZM" )

CoD.LoadingScreenSharedCPZM = InheritFrom( LUI.UIElement )
CoD.LoadingScreenSharedCPZM.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LoadingScreenSharedCPZM )
	self.id = "LoadingScreenSharedCPZM"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 1080 )
	self.anyChildUsesUpdateState = true
	
	local loadingImageOrMovie = LUI.UIImage.new()
	loadingImageOrMovie:setLeftRight( 0, 1, 0, 0 )
	loadingImageOrMovie:setTopBottom( 0, 1, 0, 0 )
	loadingImageOrMovie:setRGB( 0, 0, 0 )
	self:addElement( loadingImageOrMovie )
	self.loadingImageOrMovie = loadingImageOrMovie
	
	local label = CoD.LoadingScreenSkipPrompt.new( menu, controller )
	label:setLeftRight( 0, 0, 0, 1920 )
	label:setTopBottom( 0, 0, 0, 1080 )
	label:registerEventHandler( "loading_displaycontinue", function ( element, event )
		local retVal = nil
		PlayClipOnElement( self, {
			elementName = "label",
			clipName = "ShowAndHideContinue"
		}, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( label )
	self.label = label
	
	local Team1PlayerList = LUI.UIList.new( menu, controller, 8, 0, nil, false, false, 0, 0, false, false )
	Team1PlayerList:makeFocusable()
	Team1PlayerList:setLeftRight( 0.5, 0.5, -864, -579 )
	Team1PlayerList:setTopBottom( 0, 0, 158, 290 )
	Team1PlayerList:setWidgetType( CoD.LoadingScreenTalkerWidgetCPZM )
	Team1PlayerList:setVerticalCount( 4 )
	Team1PlayerList:setSpacing( 8 )
	Team1PlayerList:setDataSource( "LoadingScreenPlayerListTeam1" )
	self:addElement( Team1PlayerList )
	self.Team1PlayerList = Team1PlayerList
	
	local loadingBarBG = LUI.UIImage.new()
	loadingBarBG:setLeftRight( 0, 1, 198, -198 )
	loadingBarBG:setTopBottom( 0, 0, 1014, 1022 )
	loadingBarBG:setRGB( 0.2, 0.2, 0.2 )
	self:addElement( loadingBarBG )
	self.loadingBarBG = loadingBarBG
	
	local loadingBar = LUI.UIImage.new()
	loadingBar:setLeftRight( 0, 1, 200, -200 )
	loadingBar:setTopBottom( 0, 0, 1016, 1020 )
	loadingBar:setRGB( 0.6, 0.6, 0.6 )
	loadingBar:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	loadingBar:setShaderVector( 1, 0, 0, 0, 0 )
	loadingBar:setShaderVector( 2, 1, 0, 0, 0 )
	loadingBar:setShaderVector( 3, 0, 0, 0, 0 )
	loadingBar:setShaderVector( 4, 0, 0, 0, 0 )
	loadingBar:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "loadedFraction", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			loadingBar:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	self:addElement( loadingBar )
	self.loadingBar = loadingBar
	
	local Status = LUI.UITightText.new()
	Status:setLeftRight( 1, 1, -553, -198 )
	Status:setTopBottom( 1, 1, -56, -23 )
	Status:setRGB( 0.87, 0.9, 0.9 )
	Status:setTTF( "fonts/default.ttf" )
	Status:setLetterSpacing( -1 )
	Status:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "statusText", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Status:setText( Engine.Localize( AppendStringIfRefExists( "_SHORT", modelValue ) ) )
		end
	end )
	self:addElement( Status )
	self.Status = Status
	
	local MapName = LUI.UITightText.new()
	MapName:setLeftRight( 0, 0, 96, 1234 )
	MapName:setTopBottom( 0, 0, 54, 86 )
	MapName:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	MapName:setLetterSpacing( -1 )
	MapName:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "mapName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MapName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( MapName )
	self.MapName = MapName
	
	local Location = LUI.UITightText.new()
	Location:setLeftRight( 0, 0, 96, 690 )
	Location:setTopBottom( 0, 0, 124, 156 )
	Location:setRGB( 0.87, 0.9, 0.9 )
	Location:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	Location:setLetterSpacing( -1 )
	Location:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "location", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Location:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Location )
	self.Location = Location
	
	local GameType = LUI.UITightText.new()
	GameType:setLeftRight( 0, 0, 96, 690 )
	GameType:setTopBottom( 0, 0, 89, 121 )
	GameType:setRGB( 0.87, 0.9, 0.9 )
	GameType:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	GameType:setLetterSpacing( -1 )
	GameType:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "gameType", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GameType:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( GameType )
	self.GameType = GameType
	
	local cinematicSubtitles = CoD.MovieSubtitles.new( menu, controller )
	cinematicSubtitles:setLeftRight( 0, 1, 0, 0 )
	cinematicSubtitles:setTopBottom( 0, 1, 0, 0 )
	self:addElement( cinematicSubtitles )
	self.cinematicSubtitles = cinematicSubtitles
	
	self.resetProperties = function ()
		loadingBar:completeAnimation()
		Team1PlayerList:completeAnimation()
		Location:completeAnimation()
		MapName:completeAnimation()
		GameType:completeAnimation()
		loadingBarBG:completeAnimation()
		Status:completeAnimation()
		loadingBar:setAlpha( 1 )
		Team1PlayerList:setLeftRight( 0.5, 0.5, -864, -579 )
		Team1PlayerList:setTopBottom( 0, 0, 158, 290 )
		Location:setAlpha( 1 )
		MapName:setAlpha( 1 )
		GameType:setAlpha( 1 )
		loadingBarBG:setAlpha( 1 )
		Status:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				Team1PlayerList:completeAnimation()
				self.Team1PlayerList:setLeftRight( 0.5, 0.5, -864, -579 )
				self.Team1PlayerList:setTopBottom( 0, 0, 159, 289 )
				self.clipFinished( Team1PlayerList, {} )
				loadingBar:completeAnimation()
				self.loadingBar:setAlpha( 0.8 )
				self.clipFinished( loadingBar, {} )
				local MapNameFrame2 = function ( MapName, event )
					local MapNameFrame3 = function ( MapName, event )
						if not event.interrupted then
							MapName:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						end
						MapName:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( MapName, event )
						else
							MapName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						MapNameFrame3( MapName, event )
						return 
					else
						MapName:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						MapName:registerEventHandler( "transition_complete_keyframe", MapNameFrame3 )
					end
				end
				
				MapName:completeAnimation()
				self.MapName:setAlpha( 0 )
				MapNameFrame2( MapName, {} )
				local LocationFrame2 = function ( Location, event )
					local LocationFrame3 = function ( Location, event )
						if not event.interrupted then
							Location:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						end
						Location:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Location, event )
						else
							Location:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LocationFrame3( Location, event )
						return 
					else
						Location:beginAnimation( "keyframe", 1500, false, false, CoD.TweenType.Linear )
						Location:registerEventHandler( "transition_complete_keyframe", LocationFrame3 )
					end
				end
				
				Location:completeAnimation()
				self.Location:setAlpha( 0 )
				LocationFrame2( Location, {} )
				local GameTypeFrame2 = function ( GameType, event )
					local GameTypeFrame3 = function ( GameType, event )
						if not event.interrupted then
							GameType:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						end
						GameType:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( GameType, event )
						else
							GameType:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						GameTypeFrame3( GameType, event )
						return 
					else
						GameType:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						GameType:registerEventHandler( "transition_complete_keyframe", GameTypeFrame3 )
					end
				end
				
				GameType:completeAnimation()
				self.GameType:setAlpha( 0 )
				GameTypeFrame2( GameType, {} )
			end
		},
		Movie = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				Team1PlayerList:completeAnimation()
				self.Team1PlayerList:setLeftRight( 0.5, 0.5, -864, -579 )
				self.Team1PlayerList:setTopBottom( 0, 0, 54, 184 )
				self.clipFinished( Team1PlayerList, {} )
				loadingBarBG:completeAnimation()
				self.loadingBarBG:setAlpha( 0 )
				self.clipFinished( loadingBarBG, {} )
				loadingBar:completeAnimation()
				self.loadingBar:setAlpha( 0 )
				self.clipFinished( loadingBar, {} )
				Status:completeAnimation()
				self.Status:setAlpha( 0 )
				self.clipFinished( Status, {} )
				MapName:completeAnimation()
				self.MapName:setAlpha( 0 )
				self.clipFinished( MapName, {} )
				Location:completeAnimation()
				self.Location:setAlpha( 0 )
				self.clipFinished( Location, {} )
				GameType:completeAnimation()
				self.GameType:setAlpha( 0 )
				self.clipFinished( GameType, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Movie",
			condition = function ( menu, element, event )
				return ShouldShowMovie( controller )
			end
		}
	} )
	Team1PlayerList.id = "Team1PlayerList"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.label:close()
		self.Team1PlayerList:close()
		self.cinematicSubtitles:close()
		self.loadingBar:close()
		self.Status:close()
		self.MapName:close()
		self.Location:close()
		self.GameType:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	local element = nil
	CoD.HUDUtility.InitLoadingImageOrMovie( loadingImageOrMovie, controller )
	return self
end

