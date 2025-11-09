CoD.AnimationLoading2 = InheritFrom( LUI.UIElement )
CoD.AnimationLoading2.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AnimationLoading2 )
	self.id = "AnimationLoading2"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 144 )
	self:setTopBottom( true, false, 0, 144 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 144 )
	Image0:setTopBottom( true, false, 0, 144 )
	Image0:setImage( RegisterImage( "uie_t7_menu_loadingspinner_flipbook" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
	Image0:setShaderVector( 0, 28, 0, 0, 0 )
	Image0:setShaderVector( 1, 22, 0, 0, 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
				self.nextClip = "DefaultClip"
			end,
			Logo = function ()
				self:setupElementClipCounter( 1 )
				Image0:completeAnimation()
				self.Image0:setAlpha( 1 )
				self.clipFinished( Image0, {} )
			end,
			Reverse = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

