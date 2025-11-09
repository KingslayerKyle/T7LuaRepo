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
	Icon:setTopBottom( true, false, -3, 29 )
	Icon:setRGB( 0.29, 0.38, 0.68 )
	Icon:setImage( RegisterImage( "uie_t7_menu_frontend_iconpartymember" ) )
	Icon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
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
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Icon:completeAnimation()
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

