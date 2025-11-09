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
	self:setLeftRight( true, false, 0, 10 )
	self:setTopBottom( true, false, 0, 25 )
	
	local Icon = LUI.UIImage.new()
	Icon:setLeftRight( true, false, -3, 13 )
	Icon:setTopBottom( true, true, -3, 4 )
	Icon:setRGB( ColorSet.PartyFriendlyBlue.r, ColorSet.PartyFriendlyBlue.g, ColorSet.PartyFriendlyBlue.b )
	Icon:setImage( RegisterImage( "uie_t7_menu_frontend_iconpartymember" ) )
	Icon:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	Icon:setShaderVector( 0, 0.5, 0.5, 0, 0 )
	Icon:setupNineSliceShader( 8, 16 )
	self:addElement( Icon )
	self.Icon = Icon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Icon:completeAnimation()
				self.Icon:setAlpha( 0 )
				self.clipFinished( Icon, {} )
			end
		},
		PartyMemberTopOrMiddle = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Icon:completeAnimation()
				self.Icon:setLeftRight( true, false, -3, 13 )
				self.Icon:setTopBottom( true, true, -3.5, 10 )
				self.Icon:setRGB( 0.29, 0.38, 0.68 )
				self.Icon:setAlpha( 1 )
				self.clipFinished( Icon, {} )
			end
		},
		PartyMember = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Icon:completeAnimation()
				self.Icon:setLeftRight( true, false, -3, 13 )
				self.Icon:setTopBottom( true, true, -3, 4 )
				self.Icon:setRGB( 0.29, 0.38, 0.68 )
				self.Icon:setAlpha( 1 )
				self.clipFinished( Icon, {} )
			end
		},
		OtherPartyMemberTopOrMiddle = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Icon:completeAnimation()
				self.Icon:setLeftRight( true, false, -3, 13 )
				self.Icon:setTopBottom( true, true, -3.5, 10 )
				self.Icon:setRGB( 0.65, 0.65, 0.65 )
				self.Icon:setAlpha( 1 )
				self.clipFinished( Icon, {} )
			end
		},
		OtherPartyMember = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Icon:completeAnimation()
				self.Icon:setLeftRight( true, false, -3, 13 )
				self.Icon:setTopBottom( true, true, -3, 4 )
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

