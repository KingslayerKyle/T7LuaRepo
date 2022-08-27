-- b65ab066480983e808f192d349fd6609
-- This hash is used for caching, delete to decompile the file again

CoD.cac_ButtonBoxLrgIdle = InheritFrom( LUI.UIElement )
CoD.cac_ButtonBoxLrgIdle.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.cac_ButtonBoxLrgIdle )
	self.id = "cac_ButtonBoxLrgIdle"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 112 )
	self:setTopBottom( true, false, 0, 112 )
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( true, true, 0, 0 )
	Image:setTopBottom( true, true, 0, 0 )
	Image:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrgidlefull" ) )
	Image:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	Image:setShaderVector( 0, 0.14, 0.14, 0.36, 0.36 )
	Image:setupNineSliceShader( 16, 16 )
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

