-- b643188365a2621acc8da4bec3f56b47
-- This hash is used for caching, delete to decompile the file again

CoD.ZM_DiviniumEmpty = InheritFrom( LUI.UIElement )
CoD.ZM_DiviniumEmpty.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ZM_DiviniumEmpty )
	self.id = "ZM_DiviniumEmpty"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 108 )
	self:setTopBottom( true, false, 0, 225 )
	
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

