local PreLoadFunc = function ( self, controller )
	local selectedMapIdModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.selectedMapId" )
	Engine.SetModelValue( selectedMapIdModel, Dvar.ui_mapname:get() )
end

local PostLoadFunc = function ( self, controller )
	self.MapDescription:subscribeToGlobalModel( controller, "StorageGlobal", "stats_cp_offline", function ( model )
		local f3_local0 = Engine.ForceNotifyModelSubscriptions
		local f3_local1 = Engine.GetGlobalModel()
		f3_local0( f3_local1.LobbyRoot.selectedMapId )
	end )
end

CoD.MapVote_CP = InheritFrom( LUI.UIElement )
CoD.MapVote_CP.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MapVote_CP )
	self.id = "MapVote_CP"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 532 )
	self:setTopBottom( 0, 0, 0, 233 )
	
	local Episode = LUI.UIText.new()
	Episode:setLeftRight( 0, 0, 23, 393 )
	Episode:setTopBottom( 0, 0, 36, 60 )
	Episode:setRGB( 0.91, 0.8, 0.51 )
	Episode:setAlpha( 0.5 )
	Episode:setTTF( "fonts/default.ttf" )
	Episode:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Episode:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Episode:subscribeToGlobalModel( controller, "LobbyRoot", "selectedMapId", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Episode:setText( Engine.Localize( PrependLocalizeString( "MENU_EPISODE_CAPS", PrependString( ": ", MapNameToEpisodeNumber( modelValue ) ) ) ) )
		end
	end )
	self:addElement( Episode )
	self.Episode = Episode
	
	local MissionOverview = LUI.UIText.new()
	MissionOverview:setLeftRight( 0, 0, 23, 393 )
	MissionOverview:setTopBottom( 0, 0, 40, 77 )
	MissionOverview:setRGB( 0.33, 0.95, 0.71 )
	MissionOverview:setAlpha( 0 )
	MissionOverview:setText( Engine.Localize( "MENU_MISSION_OVERVIEW_CAP" ) )
	MissionOverview:setTTF( "fonts/default.ttf" )
	MissionOverview:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	MissionOverview:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( MissionOverview )
	self.MissionOverview = MissionOverview
	
	local MapName = LUI.UIText.new()
	MapName:setLeftRight( 0, 0, 23, 393 )
	MapName:setTopBottom( 0, 0, 64, 118 )
	MapName:setRGB( 0.74, 1, 0.9 )
	MapName:setAlpha( 0.5 )
	MapName:setTTF( "fonts/default.ttf" )
	MapName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	MapName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	MapName:subscribeToGlobalModel( controller, "LobbyRoot", "selectedMapId", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MapName:setText( MapNameToLocalizedMapName( modelValue ) )
		end
	end )
	self:addElement( MapName )
	self.MapName = MapName
	
	local MapDescription = LUI.UIText.new()
	MapDescription:setLeftRight( 0, 0, 23, 378 )
	MapDescription:setTopBottom( 0, 0, 116, 138 )
	MapDescription:setAlpha( 0 )
	MapDescription:setTTF( "fonts/default.ttf" )
	MapDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	MapDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	MapDescription:subscribeToGlobalModel( controller, "LobbyRoot", "selectedMapId", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MapDescription:setText( Engine.Localize( MapNameToFactionMapDescription( controller, modelValue ) ) )
		end
	end )
	self:addElement( MapDescription )
	self.MapDescription = MapDescription
	
	local StoryProgressBarBG = LUI.UIImage.new()
	StoryProgressBarBG:setLeftRight( 0, 0, 23, 379 )
	StoryProgressBarBG:setTopBottom( 0, 0, 120, 128 )
	StoryProgressBarBG:setRGB( 0.26, 0.26, 0.26 )
	StoryProgressBarBG:setAlpha( 0.4 )
	StoryProgressBarBG:subscribeToGlobalModel( controller, "StorageGlobal", "stats_cp_offline", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			
		else
			
		end
	end )
	self:addElement( StoryProgressBarBG )
	self.StoryProgressBarBG = StoryProgressBarBG
	
	local StoryProgressBar = LUI.UIImage.new()
	StoryProgressBar:setLeftRight( 0, 0, 25, 378 )
	StoryProgressBar:setTopBottom( 0, 0, 124, 126 )
	StoryProgressBar:setRGB( 0.74, 1, 0.9 )
	StoryProgressBar:setAlpha( 0.5 )
	StoryProgressBar:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
	StoryProgressBar:setShaderVector( 1, 0, 0, 0, 0 )
	StoryProgressBar:setShaderVector( 2, 1, 0, 0, 0 )
	StoryProgressBar:setShaderVector( 3, 0, 0, 0, 0 )
	StoryProgressBar:setShaderVector( 4, 0, 0, 0, 0 )
	StoryProgressBar:subscribeToGlobalModel( controller, "StorageGlobal", "stats_cp_offline", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			StoryProgressBar:setShaderVector( 0, StorageLookupVec1( controller, "storyProgress", CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) ) )
		end
	end )
	self:addElement( StoryProgressBar )
	self.StoryProgressBar = StoryProgressBar
	
	local StoryProgress = LUI.UIText.new()
	StoryProgress:setLeftRight( 0, 0, 23, 223 )
	StoryProgress:setTopBottom( 0, 0, 128, 152 )
	StoryProgress:setRGB( 0.74, 1, 0.9 )
	StoryProgress:setAlpha( 0.5 )
	StoryProgress:setText( Engine.Localize( "MENU_STORY_PROGRESS" ) )
	StoryProgress:setTTF( "fonts/default.ttf" )
	StoryProgress:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	StoryProgress:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( StoryProgress )
	self.StoryProgress = StoryProgress
	
	self.resetProperties = function ()
		Episode:completeAnimation()
		MapName:completeAnimation()
		StoryProgressBar:completeAnimation()
		StoryProgress:completeAnimation()
		StoryProgressBarBG:completeAnimation()
		Episode:setAlpha( 0.5 )
		MapName:setAlpha( 0.5 )
		StoryProgressBar:setAlpha( 0.5 )
		StoryProgress:setAlpha( 0.5 )
		StoryProgressBarBG:setAlpha( 0.4 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				Episode:completeAnimation()
				self.Episode:setAlpha( 0 )
				self.clipFinished( Episode, {} )
				MapName:completeAnimation()
				self.MapName:setAlpha( 0 )
				self.clipFinished( MapName, {} )
				StoryProgressBarBG:completeAnimation()
				self.StoryProgressBarBG:setAlpha( 0 )
				self.clipFinished( StoryProgressBarBG, {} )
				StoryProgressBar:completeAnimation()
				self.StoryProgressBar:setAlpha( 0 )
				self.clipFinished( StoryProgressBar, {} )
				StoryProgress:completeAnimation()
				self.StoryProgress:setAlpha( 0 )
				self.clipFinished( StoryProgress, {} )
			end
		},
		FirstTimeFlow = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				Episode:completeAnimation()
				self.Episode:setAlpha( 0 )
				self.clipFinished( Episode, {} )
				MapName:completeAnimation()
				self.MapName:setAlpha( 0 )
				self.clipFinished( MapName, {} )
				StoryProgressBarBG:completeAnimation()
				self.StoryProgressBarBG:setAlpha( 0 )
				self.clipFinished( StoryProgressBarBG, {} )
				StoryProgressBar:completeAnimation()
				self.StoryProgressBar:setAlpha( 0 )
				self.clipFinished( StoryProgressBar, {} )
				StoryProgress:completeAnimation()
				self.StoryProgress:setAlpha( 0 )
				self.clipFinished( StoryProgress, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return not IsCampaign()
			end
		},
		{
			stateName = "FirstTimeFlow",
			condition = function ( menu, element, event )
				return IsFirstTimeSetup( controller, Enum.eModes.MODE_CAMPAIGN )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Episode:close()
		self.MapName:close()
		self.MapDescription:close()
		self.StoryProgressBarBG:close()
		self.StoryProgressBar:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

