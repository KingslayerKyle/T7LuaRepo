-- 37230f5d807f6dd2b5dcd3cfc061edf2
-- This hash is used for caching, delete to decompile the file again

local PostLoadFunc = function ( self, controller, menu )
	local f1_local0 = Engine.GetModel( Engine.GetGlobalModel(), "leaderboard" )
	if not f1_local0 then
		return 
	else
		self:subscribeToModel( Engine.GetModel( f1_local0, "isUpdating" ), function ( model )
			local f2_local0 = CoD.perController[controller].leaderboardDurationFilter
			if not f2_local0 then
				f2_local0 = Enum.LbTrackType.LB_TRK_ALLTIME
			end
			local f2_local1 = LuaEnums.LB_MP_GAMES_NEEDED.WEEKLY
			if f2_local0 == Enum.LbTrackType.LB_TRK_ALLTIME then
				f2_local1 = LuaEnums.LB_MP_GAMES_NEEDED.ALLTIME
			elseif f2_local0 == Enum.LbTrackType.LB_TRK_MONTHLY then
				f2_local1 = LuaEnums.LB_MP_GAMES_NEEDED.MONTHLY
			end
			self.Text:setText( Engine.Localize( "MENU_LEADERBOARD_GAMES_REQUIRED", f2_local1 ) )
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
	self:setLeftRight( true, false, 0, 444 )
	self:setTopBottom( true, false, 0, 36 )
	
	local Text = LUI.UIText.new()
	Text:setLeftRight( false, true, -444, -34 )
	Text:setTopBottom( false, true, -30, -10 )
	Text:setRGB( 1, 0.4, 0 )
	Text:setText( Engine.Localize( "" ) )
	Text:setTTF( "fonts/default.ttf" )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Text )
	self.Text = Text
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				Text:completeAnimation()
				self.Text:setAlpha( 1 )
				self.clipFinished( Text, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
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
