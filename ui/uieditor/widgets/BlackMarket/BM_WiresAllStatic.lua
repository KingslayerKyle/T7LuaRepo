-- c7b24b8c4ab16cdef64de185b0846d63
-- This hash is used for caching, delete to decompile the file again

CoD.BM_WiresAllStatic = InheritFrom( LUI.UIElement )
CoD.BM_WiresAllStatic.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BM_WiresAllStatic )
	self.id = "BM_WiresAllStatic"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 120 )
	self:setTopBottom( true, false, 0, 360 )
	
	local wires0 = LUI.UIImage.new()
	wires0:setLeftRight( true, false, 0, 120 )
	wires0:setTopBottom( true, false, 0, 360 )
	wires0:setAlpha( 0.1 )
	wires0:setImage( RegisterImage( "uie_t7_blackmarket_circuitanim_line1" ) )
	wires0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( wires0 )
	self.wires0 = wires0
	
	local wires2 = LUI.UIImage.new()
	wires2:setLeftRight( true, false, 0, 120 )
	wires2:setTopBottom( true, false, 0, 360 )
	wires2:setAlpha( 0.1 )
	wires2:setImage( RegisterImage( "uie_t7_blackmarket_circuitanim_line2" ) )
	wires2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( wires2 )
	self.wires2 = wires2
	
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

