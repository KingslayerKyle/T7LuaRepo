-- f3942a03b59f60a55e2f6c67c576db66
-- This hash is used for caching, delete to decompile the file again

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0.SetupTeamColors = function ( f2_arg0, f2_arg1 )
		if f2_arg1 == Enum.team_t.TEAM_SPECTATOR then
			f2_arg0.alliesColor:setRGB( CoD.GetDefaultTeamFactionColor( Enum.team_t.TEAM_ALLIES ) )
			f2_arg0.axisColor:setRGB( CoD.GetDefaultTeamFactionColor( Enum.team_t.TEAM_AXIS ) )
		else
			f2_arg0.alliesColor:setRGB( CoD.GetTeamFactionColor( Enum.team_t.TEAM_ALLIES ) )
			f2_arg0.axisColor:setRGB( CoD.GetTeamFactionColor( Enum.team_t.TEAM_AXIS ) )
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
	self:setLeftRight( true, false, 0, 400 )
	self:setTopBottom( true, false, 0, 25 )
	
	local spectatorColor = LUI.UIImage.new()
	spectatorColor:setLeftRight( true, true, 0, 0 )
	spectatorColor:setTopBottom( true, true, 0, 0 )
	spectatorColor:setRGB( ColorSet.CodCaster.r, ColorSet.CodCaster.g, ColorSet.CodCaster.b )
	spectatorColor:setAlpha( 0.25 )
	spectatorColor:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( spectatorColor )
	self.spectatorColor = spectatorColor
	
	local alliesColor = LUI.UIImage.new()
	alliesColor:setLeftRight( true, true, 0, 0 )
	alliesColor:setTopBottom( true, true, 0, 0 )
	alliesColor:setRGB( ColorSet.FactionAllies.r, ColorSet.FactionAllies.g, ColorSet.FactionAllies.b )
	alliesColor:setAlpha( 0 )
	alliesColor:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( alliesColor )
	self.alliesColor = alliesColor
	
	local axisColor = LUI.UIImage.new()
	axisColor:setLeftRight( true, true, 0, 0 )
	axisColor:setTopBottom( true, true, 0, 0 )
	axisColor:setRGB( ColorSet.FactionAxis.r, ColorSet.FactionAxis.g, ColorSet.FactionAxis.b )
	axisColor:setAlpha( 0 )
	axisColor:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( axisColor )
	self.axisColor = axisColor
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				spectatorColor:completeAnimation()
				self.spectatorColor:setAlpha( 0 )
				self.clipFinished( spectatorColor, {} )
				alliesColor:completeAnimation()
				self.alliesColor:setAlpha( 0 )
				self.clipFinished( alliesColor, {} )
				axisColor:completeAnimation()
				self.axisColor:setAlpha( 0 )
				self.clipFinished( axisColor, {} )
			end
		},
		Axis = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				spectatorColor:completeAnimation()
				self.spectatorColor:setAlpha( 0 )
				self.clipFinished( spectatorColor, {} )
				alliesColor:completeAnimation()
				self.alliesColor:setAlpha( 0 )
				self.clipFinished( alliesColor, {} )
				axisColor:completeAnimation()
				self.axisColor:setAlpha( 0.25 )
				self.axisColor:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				self.clipFinished( axisColor, {} )
			end
		},
		Allies = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				spectatorColor:completeAnimation()
				self.spectatorColor:setAlpha( 0 )
				self.clipFinished( spectatorColor, {} )
				alliesColor:completeAnimation()
				self.alliesColor:setAlpha( 0.25 )
				self.alliesColor:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
				self.clipFinished( alliesColor, {} )
				axisColor:completeAnimation()
				self.axisColor:setAlpha( 0 )
				self.clipFinished( axisColor, {} )
			end
		},
		Spectator = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				spectatorColor:completeAnimation()
				self.spectatorColor:setAlpha( 0.25 )
				self.clipFinished( spectatorColor, {} )
				alliesColor:completeAnimation()
				self.alliesColor:setAlpha( 0 )
				self.clipFinished( alliesColor, {} )
				axisColor:completeAnimation()
				self.axisColor:setAlpha( 0 )
				self.clipFinished( axisColor, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

