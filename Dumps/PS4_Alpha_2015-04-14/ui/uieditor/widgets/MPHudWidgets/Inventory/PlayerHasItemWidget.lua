CoD.PlayerHasItemWidget = InheritFrom( LUI.UIElement )
CoD.PlayerHasItemWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.PlayerHasItemWidget )
	self.id = "PlayerHasItemWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 72 )
	self:setTopBottom( true, false, 0, 72 )
	
	local icon = LUI.UIImage.new()
	icon:setLeftRight( true, true, 4, -4 )
	icon:setTopBottom( true, true, 4, -4 )
	icon:setRGB( 1, 1, 1 )
	icon:setImage( RegisterImage( "uie_t7_hud_unobtanium" ) )
	icon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( icon )
	self.icon = icon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				icon:completeAnimation()
				self.icon:setAlpha( 0 )
				self.clipFinished( icon, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				icon:completeAnimation()
				self.icon:setAlpha( 1 )
				self.clipFinished( icon, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

