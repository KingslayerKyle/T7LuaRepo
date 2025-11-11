CoD.LobbyMemberBacking = InheritFrom( LUI.UIElement )
CoD.LobbyMemberBacking.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LobbyMemberBacking )
	self.id = "LobbyMemberBacking"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 735 )
	self:setTopBottom( 0, 0, 0, 37 )
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( 0, 1, -4, 6 )
	Image:setTopBottom( 0, 1, -3, 3 )
	Image:setImage( RegisterImage( "uie_img_t7_menu_partyease_boxsolidfull" ) )
	Image:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	Image:setShaderVector( 0, 0, 0, 0.37, 0.37 )
	Image:setupNineSliceShader( 24, 16 )
	self:addElement( Image )
	self.Image = Image
	
	self.resetProperties = function ()
		Image:completeAnimation()
		Image:setAlpha( 1 )
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
				Image:completeAnimation()
				self.Image:setAlpha( 0 )
				self.clipFinished( Image, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

