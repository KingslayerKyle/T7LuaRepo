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
	self:setLeftRight( 0, 0, 0, 180 )
	self:setTopBottom( 0, 0, 0, 540 )
	
	local wires0 = LUI.UIImage.new()
	wires0:setLeftRight( 0, 0, 0, 180 )
	wires0:setTopBottom( 0, 0, 0, 540 )
	wires0:setAlpha( 0.1 )
	wires0:setImage( RegisterImage( "uie_t7_blackmarket_circuitanim_line1" ) )
	wires0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( wires0 )
	self.wires0 = wires0
	
	local wires2 = LUI.UIImage.new()
	wires2:setLeftRight( 0, 0, 0, 180 )
	wires2:setTopBottom( 0, 0, 0, 540 )
	wires2:setAlpha( 0.1 )
	wires2:setImage( RegisterImage( "uie_t7_blackmarket_circuitanim_line2" ) )
	wires2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( wires2 )
	self.wires2 = wires2
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

