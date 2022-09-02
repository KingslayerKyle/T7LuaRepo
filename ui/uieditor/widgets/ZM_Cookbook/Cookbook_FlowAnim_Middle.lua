-- 1a2e44365fef7ec0c53cfeb788e091e0
-- This hash is used for caching, delete to decompile the file again

CoD.Cookbook_FlowAnim_Middle = InheritFrom( LUI.UIElement )
CoD.Cookbook_FlowAnim_Middle.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.Cookbook_FlowAnim_Middle )
	self.id = "Cookbook_FlowAnim_Middle"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 96 )
	self:setTopBottom( true, false, 0, 153 )
	
	local FlowTop = LUI.UIImage.new()
	FlowTop:setLeftRight( true, false, 0, 96 )
	FlowTop:setTopBottom( true, false, 0, 153 )
	FlowTop:setImage( RegisterImage( "uie_t7_zm_cookbook_flow_texture" ) )
	FlowTop:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	FlowTop:setShaderVector( 0, 1, 1, 0, 0 )
	FlowTop:setShaderVector( 1, 0, -0.2, 0, 0 )
	self:addElement( FlowTop )
	self.FlowTop = FlowTop
	
	local mask = LUI.UIImage.new()
	mask:setLeftRight( true, false, 0, 96 )
	mask:setTopBottom( true, false, 0, 153 )
	mask:setRGB( 0, 0, 0 )
	mask:setXRot( 180 )
	mask:setImage( RegisterImage( "uie_t7_zm_cookbook_flow_middlemask" ) )
	self:addElement( mask )
	self.mask = mask
	
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

