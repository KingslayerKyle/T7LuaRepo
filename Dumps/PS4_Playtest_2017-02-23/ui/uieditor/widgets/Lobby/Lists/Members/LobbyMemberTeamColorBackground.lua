local PostLoadFunc = function ( self, controller )
	self.SetupTeamColors = function ( self, team )
		if team == Enum.team_t.TEAM_SPECTATOR then
			self.alliesColor:setRGB( CoD.TeamUtility.GetDefaultTeamFactionColor( Enum.team_t.TEAM_ALLIES ) )
			self.axisColor:setRGB( CoD.TeamUtility.GetDefaultTeamFactionColor( Enum.team_t.TEAM_AXIS ) )
		else
			self.alliesColor:setRGB( CoD.TeamUtility.GetTeamFactionColor( Enum.team_t.TEAM_ALLIES ) )
			self.axisColor:setRGB( CoD.TeamUtility.GetTeamFactionColor( Enum.team_t.TEAM_AXIS ) )
		end
	end
	
end

CoD.LobbyMemberTeamColorBackground = InheritFrom( LUI.UIElement )
CoD.LobbyMemberTeamColorBackground.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LobbyMemberTeamColorBackground )
	self.id = "LobbyMemberTeamColorBackground"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 600 )
	self:setTopBottom( 0, 0, 0, 37 )
	
	local spectatorColor = LUI.UIImage.new()
	spectatorColor:setLeftRight( 0, 1, 0, 0 )
	spectatorColor:setTopBottom( 0, 1, 0, 0 )
	spectatorColor:setRGB( ColorSet.CodCaster.r, ColorSet.CodCaster.g, ColorSet.CodCaster.b )
	spectatorColor:setAlpha( 0.25 )
	spectatorColor:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( spectatorColor )
	self.spectatorColor = spectatorColor
	
	local alliesColor = LUI.UIImage.new()
	alliesColor:setLeftRight( 0, 1, 0, 0 )
	alliesColor:setTopBottom( 0, 1, 0, 0 )
	alliesColor:setRGB( ColorSet.FactionAllies.r, ColorSet.FactionAllies.g, ColorSet.FactionAllies.b )
	alliesColor:setAlpha( 0 )
	alliesColor:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( alliesColor )
	self.alliesColor = alliesColor
	
	local axisColor = LUI.UIImage.new()
	axisColor:setLeftRight( 0, 1, 0, 0 )
	axisColor:setTopBottom( 0, 1, 0, 0 )
	axisColor:setRGB( ColorSet.FactionAxis.r, ColorSet.FactionAxis.g, ColorSet.FactionAxis.b )
	axisColor:setAlpha( 0 )
	axisColor:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( axisColor )
	self.axisColor = axisColor
	
	self.resetProperties = function ()
		spectatorColor:completeAnimation()
		axisColor:completeAnimation()
		alliesColor:completeAnimation()
		spectatorColor:setAlpha( 0.25 )
		axisColor:setAlpha( 0 )
		axisColor:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
		alliesColor:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				spectatorColor:completeAnimation()
				self.spectatorColor:setAlpha( 0 )
				self.clipFinished( spectatorColor, {} )
			end
		},
		Axis = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				spectatorColor:completeAnimation()
				self.spectatorColor:setAlpha( 0 )
				self.clipFinished( spectatorColor, {} )
				axisColor:completeAnimation()
				self.axisColor:setAlpha( 0.25 )
				self.axisColor:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				self.clipFinished( axisColor, {} )
			end
		},
		Allies = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				spectatorColor:completeAnimation()
				self.spectatorColor:setAlpha( 0 )
				self.clipFinished( spectatorColor, {} )
				alliesColor:completeAnimation()
				self.alliesColor:setAlpha( 0.25 )
				self.clipFinished( alliesColor, {} )
			end
		},
		Spectator = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

