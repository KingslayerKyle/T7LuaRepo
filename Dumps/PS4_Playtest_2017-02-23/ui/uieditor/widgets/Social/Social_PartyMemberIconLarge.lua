CoD.Social_PartyMemberIconLarge = InheritFrom( LUI.UIElement )
CoD.Social_PartyMemberIconLarge.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Social_PartyMemberIconLarge )
	self.id = "Social_PartyMemberIconLarge"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 9 )
	self:setTopBottom( 0, 0, 0, 90 )
	
	local Icon = LUI.UIImage.new()
	Icon:setLeftRight( 0, 1, -3, 3 )
	Icon:setTopBottom( 0, 1, -3, 3 )
	Icon:setRGB( ColorSet.PartyOther.r, ColorSet.PartyOther.g, ColorSet.PartyOther.b )
	Icon:setAlpha( 0 )
	Icon:setImage( RegisterImage( "uie_t7_menu_frontend_iconpartymemberlarge" ) )
	self:addElement( Icon )
	self.Icon = Icon
	
	self.resetProperties = function ()
		Icon:completeAnimation()
		Icon:setLeftRight( 0, 1, -3, 3 )
		Icon:setTopBottom( 0, 1, -3, 3 )
		Icon:setRGB( ColorSet.PartyOther.r, ColorSet.PartyOther.g, ColorSet.PartyOther.b )
		Icon:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		PartyMemberTopOrMiddle = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Icon:completeAnimation()
				self.Icon:setLeftRight( 0, 1, -3, 3 )
				self.Icon:setTopBottom( 0, 1, -5, 11 )
				self.Icon:setRGB( 0.29, 0.38, 0.68 )
				self.Icon:setAlpha( 1 )
				self.clipFinished( Icon, {} )
			end
		},
		PartyMember = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Icon:completeAnimation()
				self.Icon:setRGB( 0.29, 0.38, 0.68 )
				self.Icon:setAlpha( 1 )
				self.clipFinished( Icon, {} )
			end
		},
		OtherPartyMemberTopOrMiddle = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Icon:completeAnimation()
				self.Icon:setLeftRight( 0, 1, -3, 3 )
				self.Icon:setTopBottom( 0, 1, -4, 12 )
				self.Icon:setRGB( 0.65, 0.65, 0.65 )
				self.Icon:setAlpha( 1 )
				self.clipFinished( Icon, {} )
			end
		},
		OtherPartyMember = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Icon:completeAnimation()
				self.Icon:setRGB( 0.65, 0.65, 0.65 )
				self.Icon:setAlpha( 1 )
				self.clipFinished( Icon, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

