-- d7f5a17a134764cec60094f3edc2b6bc
-- This hash is used for caching, delete to decompile the file again

CoD.cac_ButtonBoxLrgInactiveDiags = InheritFrom( LUI.UIElement )
CoD.cac_ButtonBoxLrgInactiveDiags.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.cac_ButtonBoxLrgInactiveDiags )
	self.id = "cac_ButtonBoxLrgInactiveDiags"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 112 )
	self:setTopBottom( true, false, 0, 112 )
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( true, true, -2, 2 )
	Image:setTopBottom( true, true, -1, 1 )
	Image:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrginactivediagfull" ) )
	Image:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	Image:setShaderVector( 0, 0.21, 0.21, 0, 0 )
	Image:setupNineSliceShader( 24, 24 )
	self:addElement( Image )
	self.Image = Image
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

