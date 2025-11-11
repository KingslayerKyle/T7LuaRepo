CoD.LobbyMemberPartyMemberIconNew = InheritFrom( LUI.UIElement )
CoD.LobbyMemberPartyMemberIconNew.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LobbyMemberPartyMemberIconNew )
	self.id = "LobbyMemberPartyMemberIconNew"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 15 )
	self:setTopBottom( 0, 0, 0, 37 )
	
	local Icon = LUI.UIImage.new()
	Icon:setLeftRight( 0, 0, -4, 20 )
	Icon:setTopBottom( 0, 1, -4, 6 )
	Icon:setRGB( ColorSet.PartyFriendlyBlue.r, ColorSet.PartyFriendlyBlue.g, ColorSet.PartyFriendlyBlue.b )
	Icon:setImage( RegisterImage( "uie_t7_menu_frontend_iconpartymember" ) )
	Icon:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	Icon:setShaderVector( 0, 0, 0, 0, 0 )
	Icon:setupNineSliceShader( 12, 24 )
	self:addElement( Icon )
	self.Icon = Icon
	
	self.resetProperties = function ()
		Icon:completeAnimation()
		Icon:setLeftRight( 0, 0, -4, 20 )
		Icon:setTopBottom( 0, 1, -4, 6 )
		Icon:setRGB( ColorSet.PartyFriendlyBlue.r, ColorSet.PartyFriendlyBlue.g, ColorSet.PartyFriendlyBlue.b )
		Icon:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Icon:completeAnimation()
				self.Icon:setAlpha( 0 )
				self.clipFinished( Icon, {} )
			end
		},
		PartyMemberTopOrMiddle = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Icon:completeAnimation()
				self.Icon:setLeftRight( 0, 0, -4, 20 )
				self.Icon:setTopBottom( 0, 1, -5, 15 )
				self.Icon:setRGB( 0.29, 0.38, 0.68 )
				self.clipFinished( Icon, {} )
			end
		},
		PartyMember = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Icon:completeAnimation()
				self.Icon:setRGB( 0.29, 0.38, 0.68 )
				self.clipFinished( Icon, {} )
			end
		},
		OtherPartyMemberTopOrMiddle = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Icon:completeAnimation()
				self.Icon:setLeftRight( 0, 0, -4, 20 )
				self.Icon:setTopBottom( 0, 1, -5, 15 )
				self.Icon:setRGB( 0.65, 0.65, 0.65 )
				self.clipFinished( Icon, {} )
			end
		},
		OtherPartyMember = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Icon:completeAnimation()
				self.Icon:setRGB( 0.65, 0.65, 0.65 )
				self.clipFinished( Icon, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

