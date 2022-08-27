-- d3959a45695202e966117631ba977668
-- This hash is used for caching, delete to decompile the file again

CoD.ZM_DiviniumFull = InheritFrom( LUI.UIElement )
CoD.ZM_DiviniumFull.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ZM_DiviniumFull )
	self.id = "ZM_DiviniumFull"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 108 )
	self:setTopBottom( true, false, 0, 225 )
	
	local Glow0 = LUI.UIImage.new()
	Glow0:setLeftRight( true, true, 0, 0 )
	Glow0:setTopBottom( true, true, 24.23, 0.23 )
	Glow0:setImage( RegisterImage( "uie_t7_zm_anim_divinium_glow" ) )
	self:addElement( Glow0 )
	self.Glow0 = Glow0
	
	local Fill0 = LUI.UIImage.new()
	Fill0:setLeftRight( true, true, 35.66, -36.34 )
	Fill0:setTopBottom( true, true, 49.23, -7.77 )
	Fill0:setXRot( 180 )
	Fill0:setImage( RegisterImage( "uie_t7_zm_anim_divinium_fill" ) )
	Fill0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	Fill0:setShaderVector( 0, 1, 0, 0, 0 )
	Fill0:setShaderVector( 1, 0, 0, 0, 0 )
	Fill0:setShaderVector( 2, 1, 0, 0, 0 )
	Fill0:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( Fill0 )
	self.Fill0 = Fill0
	
	local Vial0 = LUI.UIImage.new()
	Vial0:setLeftRight( true, true, 30, -30 )
	Vial0:setTopBottom( true, true, 0, -9 )
	Vial0:setImage( RegisterImage( "uie_t7_zm_anim_divinium_vial" ) )
	self:addElement( Vial0 )
	self.Vial0 = Vial0
	
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

