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
	self:setLeftRight( true, false, 0, 24 )
	self:setTopBottom( true, false, 0, 56 )
	
	local Leader = LUI.UIImage.new()
	Leader:setLeftRight( true, false, -2, 21.25 )
	Leader:setTopBottom( true, true, -3, 3 )
	Leader:setRGB( 0.29, 0.38, 0.68 )
	Leader:setAlpha( 0 )
	Leader:setImage( RegisterImage( "uie_t7_menu_frontend_iconpartyleaderlarge" ) )
	Leader:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Leader )
	self.Leader = Leader
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Leader:completeAnimation()
				self.Leader:setAlpha( 0 )
				self.clipFinished( Leader, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Leader:completeAnimation()
				self.Leader:setLeftRight( true, false, -2, 21.25 )
				self.Leader:setTopBottom( true, false, -3, 59 )
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

