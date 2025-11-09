CoD.OtherHasItemWidget = InheritFrom( LUI.UIElement )
CoD.OtherHasItemWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.OtherHasItemWidget )
	self.id = "OtherHasItemWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 150 )
	self:setTopBottom( true, false, 0, 36 )
	
	local icon = LUI.UIImage.new()
	icon:setLeftRight( true, false, 0, 32 )
	icon:setTopBottom( true, true, 2, -2 )
	icon:setRGB( 1, 1, 1 )
	icon:setImage( RegisterImage( "uie_t7_hud_unobtanium_small" ) )
	icon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( icon )
	self.icon = icon
	
	local playerControlText = LUI.UIText.new()
	playerControlText:setLeftRight( true, true, 45, 0 )
	playerControlText:setTopBottom( true, false, 0, 18 )
	playerControlText:setRGB( 1, 1, 1 )
	playerControlText:setText( Engine.Localize( "MENU_NEW" ) )
	playerControlText:setTTF( "fonts/default.ttf" )
	playerControlText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	playerControlText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( playerControlText )
	self.playerControlText = playerControlText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				icon:completeAnimation()
				self.icon:setAlpha( 0 )
				self.clipFinished( icon, {} )
				playerControlText:completeAnimation()
				self.playerControlText:setAlpha( 0 )
				self.clipFinished( playerControlText, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				icon:completeAnimation()
				self.icon:setAlpha( 1 )
				self.clipFinished( icon, {} )
				playerControlText:completeAnimation()
				self.playerControlText:setAlpha( 1 )
				self.clipFinished( playerControlText, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

