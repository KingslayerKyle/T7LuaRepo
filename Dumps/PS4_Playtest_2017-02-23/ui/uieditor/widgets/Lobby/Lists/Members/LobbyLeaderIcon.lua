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
	self:setLeftRight( 0, 0, 0, 36 )
	self:setTopBottom( 0, 0, 0, 36 )
	
	local Member = LUI.UIImage.new()
	Member:setLeftRight( 0, 0, -2, 34 )
	Member:setTopBottom( 0, 0, 2, 50 )
	Member:setRGB( ColorSet.PartyFriendlyBlue.r, ColorSet.PartyFriendlyBlue.g, ColorSet.PartyFriendlyBlue.b )
	Member:setAlpha( 0 )
	Member:setImage( RegisterImage( "uie_t7_menu_frontend_iconpartyleaderextra" ) )
	self:addElement( Member )
	self.Member = Member
	
	local Leader = LUI.UIImage.new()
	Leader:setLeftRight( 0, 0, -2, 34 )
	Leader:setTopBottom( 0, 0, -6, 42 )
	Leader:setRGB( 0.29, 0.38, 0.68 )
	Leader:setImage( RegisterImage( "uie_t7_menu_frontend_iconpartyleader" ) )
	Leader:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Leader )
	self.Leader = Leader
	
	self.resetProperties = function ()
		Member:completeAnimation()
		Leader:completeAnimation()
		Member:setLeftRight( 0, 0, -2, 34 )
		Member:setTopBottom( 0, 0, 2, 50 )
		Member:setAlpha( 0 )
		Leader:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		TopOrMiddleZM = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Member:completeAnimation()
				self.Member:setLeftRight( 0, 0, -2, 34 )
				self.Member:setTopBottom( 0, 0, 1, 147 )
				self.Member:setAlpha( 1 )
				self.clipFinished( Member, {} )
			end
		},
		TopOrMiddle = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Member:completeAnimation()
				self.Member:setAlpha( 1 )
				self.clipFinished( Member, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
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

