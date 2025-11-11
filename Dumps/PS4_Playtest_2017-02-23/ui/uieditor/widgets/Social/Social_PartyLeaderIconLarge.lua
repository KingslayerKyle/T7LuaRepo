CoD.Social_PartyLeaderIconLarge = InheritFrom( LUI.UIElement )
CoD.Social_PartyLeaderIconLarge.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Social_PartyLeaderIconLarge )
	self.id = "Social_PartyLeaderIconLarge"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 36 )
	self:setTopBottom( 0, 0, 0, 84 )
	
	local Leader = LUI.UIImage.new()
	Leader:setLeftRight( 0, 0, -3, 32 )
	Leader:setTopBottom( 0, 1, -4, 4 )
	Leader:setRGB( 0.29, 0.38, 0.68 )
	Leader:setAlpha( 0 )
	Leader:setImage( RegisterImage( "uie_t7_menu_frontend_iconpartyleaderlarge" ) )
	Leader:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Leader )
	self.Leader = Leader
	
	self.resetProperties = function ()
		Leader:completeAnimation()
		Leader:setLeftRight( 0, 0, -3, 32 )
		Leader:setTopBottom( 0, 1, -4, 4 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Leader:completeAnimation()
				self.Leader:setLeftRight( 0, 0, -3, 32 )
				self.Leader:setTopBottom( 0, 0, 42, 42 )
				self.clipFinished( Leader, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

