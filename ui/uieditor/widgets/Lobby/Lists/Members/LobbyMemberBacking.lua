-- 5c048ccb789dbea409c453e7a3fbc492
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 490 )
	self:setTopBottom( true, false, 0, 25 )
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( true, true, -3, 4 )
	Image:setTopBottom( true, true, -2, 2 )
	Image:setImage( RegisterImage( "uie_img_t7_menu_partyease_boxsolidfull" ) )
	Image:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	Image:setShaderVector( 0, 0.03, 0.38, 0.37, 0.37 )
	Image:setupNineSliceShader( 16, 11 )
	self:addElement( Image )
	self.Image = Image
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Image:completeAnimation()
				self.Image:setAlpha( 1 )
				self.clipFinished( Image, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
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

