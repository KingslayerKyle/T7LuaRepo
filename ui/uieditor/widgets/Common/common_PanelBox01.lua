-- dc6ae17d18cdc4663a003bb77557ff97
-- This hash is used for caching, delete to decompile the file again

CoD.common_PanelBox01 = InheritFrom( LUI.UIElement )
CoD.common_PanelBox01.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.common_PanelBox01 )
	self.id = "common_PanelBox01"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 112 )
	self:setTopBottom( true, false, 0, 112 )
	
	local Backing = LUI.UIImage.new()
	Backing:setLeftRight( true, true, 2, -2 )
	Backing:setTopBottom( true, true, 2, -2 )
	Backing:setRGB( 0, 0, 0 )
	Backing:setAlpha( 0.5 )
	self:addElement( Backing )
	self.Backing = Backing
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( true, true, 0, 0 )
	Image:setTopBottom( true, true, 0, 0 )
	Image:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrginactivefull" ) )
	Image:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	Image:setShaderVector( 0, 0.01, 0.24, 0.36, 0.36 )
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
