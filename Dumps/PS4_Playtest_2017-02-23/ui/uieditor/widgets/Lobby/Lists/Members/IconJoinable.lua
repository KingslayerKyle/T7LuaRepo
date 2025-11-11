CoD.IconJoinable = InheritFrom( LUI.UIElement )
CoD.IconJoinable.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.IconJoinable )
	self.id = "IconJoinable"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 36 )
	self:setTopBottom( 0, 0, 0, 36 )
	
	local Icon = LUI.UIImage.new()
	Icon:setLeftRight( 0, 0, 0, 24 )
	Icon:setTopBottom( 0, 0, -2, 34 )
	Icon:setRGB( 0.87, 0.9, 0.9 )
	Icon:setImage( RegisterImage( "uie_t7_menu_frontend_iconjoinable" ) )
	Icon:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Icon )
	self.Icon = Icon
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( 1, 1, 9, 63 )
	Image4:setTopBottom( 0.5, 0.5, -1, 4 )
	Image4:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 1, 1, 24, 78 )
	Image0:setTopBottom( 0.5, 0.5, -1, 4 )
	Image0:setAlpha( 0 )
	Image0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	self.resetProperties = function ()
		Image4:completeAnimation()
		Icon:completeAnimation()
		Image4:setAlpha( 1 )
		Icon:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				Icon:completeAnimation()
				self.Icon:setAlpha( 0 )
				self.clipFinished( Icon, {} )
				Image4:completeAnimation()
				self.Image4:setAlpha( 0 )
				self.clipFinished( Image4, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Image4:completeAnimation()
				self.Image4:setAlpha( 0 )
				self.clipFinished( Image4, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

