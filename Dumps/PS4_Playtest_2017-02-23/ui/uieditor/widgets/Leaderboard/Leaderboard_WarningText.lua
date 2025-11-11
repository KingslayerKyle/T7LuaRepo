local PostLoadFunc = function ( self, controller, menu )
	local leaderboardModel = DataSources.LeaderboardRows.getModel( controller )
	if not leaderboardModel then
		return 
	else
		self:subscribeToModel( leaderboardModel.status, function ( model )
			local f2_local0 = CoD.perController[controller].leaderboardDurationFilter
			if not f2_local0 then
				local durationFilter = Enum.LbTrackType.LB_TRK_ALLTIME
			end
			local gamesNeeded = LuaEnum.LB_MP_GAMES_NEEDED.WEEKLY
			if f2_local0 == Enum.LbTrackType.LB_TRK_ALLTIME then
				gamesNeeded = LuaEnum.LB_MP_GAMES_NEEDED.ALLTIME
			elseif f2_local0 == Enum.LbTrackType.LB_TRK_MONTHLY then
				gamesNeeded = LuaEnum.LB_MP_GAMES_NEEDED.MONTHLY
			end
			self.Text:setText( Engine.Localize( "MENU_LEADERBOARD_GAMES_REQUIRED", gamesNeeded ) )
		end )
	end
end

CoD.Leaderboard_WarningText = InheritFrom( LUI.UIElement )
CoD.Leaderboard_WarningText.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Leaderboard_WarningText )
	self.id = "Leaderboard_WarningText"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 666 )
	self:setTopBottom( 0, 0, 0, 54 )
	
	local Text = LUI.UIText.new()
	Text:setLeftRight( 1, 1, -666, -51 )
	Text:setTopBottom( 1, 1, -45, -15 )
	Text:setRGB( 1, 0.4, 0 )
	Text:setText( Engine.Localize( "" ) )
	Text:setTTF( "fonts/default.ttf" )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Text )
	self.Text = Text
	
	self.resetProperties = function ()
		Text:completeAnimation()
		Text:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Visible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Text:completeAnimation()
				self.Text:setAlpha( 0 )
				self.clipFinished( Text, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

