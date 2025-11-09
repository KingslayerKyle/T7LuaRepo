CoD.LobbyLeaderIcon = InheritFrom( LUI.UIElement )
CoD.LobbyLeaderIcon.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LobbyLeaderIcon )
	self.id = "LobbyLeaderIcon"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 24 )
	self:setTopBottom( true, false, 0, 24 )
	
	local Member = LUI.UIImage.new()
	Member:setLeftRight( true, false, -1, 23 )
	Member:setTopBottom( true, false, 1, 33 )
	Member:setRGB( ColorSet.PartyFriendlyBlue.r, ColorSet.PartyFriendlyBlue.g, ColorSet.PartyFriendlyBlue.b )
	Member:setAlpha( 0 )
	Member:setImage( RegisterImage( "uie_t7_menu_frontend_iconpartyleaderextra" ) )
	self:addElement( Member )
	self.Member = Member
	
	local Leader = LUI.UIImage.new()
	Leader:setLeftRight( true, false, -1, 23 )
	Leader:setTopBottom( true, false, -4, 28 )
	Leader:setRGB( 0.29, 0.38, 0.68 )
	Leader:setImage( RegisterImage( "uie_t7_menu_frontend_iconpartyleader" ) )
	Leader:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Leader )
	self.Leader = Leader
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Member:completeAnimation()
				self.Member:setAlpha( 0 )
				self.clipFinished( Member, {} )
			end
		},
		TopOrMiddle = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Member:completeAnimation()
				self.Member:setAlpha( 1 )
				self.clipFinished( Member, {} )
				Leader:completeAnimation()
				self.Leader:setAlpha( 1 )
				self.clipFinished( Leader, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Member:completeAnimation()
				self.Member:setAlpha( 0 )
				self.clipFinished( Member, {} )
				Leader:completeAnimation()
				self.Leader:setAlpha( 0 )
				self.clipFinished( Leader, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

