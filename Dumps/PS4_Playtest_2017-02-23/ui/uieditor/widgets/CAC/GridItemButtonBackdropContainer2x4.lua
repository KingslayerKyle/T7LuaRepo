require( "ui.uieditor.widgets.CAC.GridItemButtonBackdrop" )

CoD.GridItemButtonBackdropContainer2x4 = InheritFrom( LUI.UIElement )
CoD.GridItemButtonBackdropContainer2x4.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GridItemButtonBackdropContainer2x4 )
	self.id = "GridItemButtonBackdropContainer2x4"
	self.soundSet = "CAC_PrimaryWeapon"
	self:setLeftRight( 0, 0, 0, 349 )
	self:setTopBottom( 0, 0, 0, 684 )
	
	local GridItemButtonBackdrop1 = CoD.GridItemButtonBackdrop.new( menu, controller )
	GridItemButtonBackdrop1:setLeftRight( 0, 0, 0, 180 )
	GridItemButtonBackdrop1:setTopBottom( 0, 0, 0, 180 )
	GridItemButtonBackdrop1:setAlpha( 0 )
	self:addElement( GridItemButtonBackdrop1 )
	self.GridItemButtonBackdrop1 = GridItemButtonBackdrop1
	
	local GridItemButtonBackdrop2 = CoD.GridItemButtonBackdrop.new( menu, controller )
	GridItemButtonBackdrop2:setLeftRight( 0, 0, 168, 348 )
	GridItemButtonBackdrop2:setTopBottom( 0, 0, 0, 180 )
	GridItemButtonBackdrop2:setAlpha( 0 )
	self:addElement( GridItemButtonBackdrop2 )
	self.GridItemButtonBackdrop2 = GridItemButtonBackdrop2
	
	local GridItemButtonBackdrop4 = CoD.GridItemButtonBackdrop.new( menu, controller )
	GridItemButtonBackdrop4:setLeftRight( 0, 0, 0, 180 )
	GridItemButtonBackdrop4:setTopBottom( 0, 0, 168, 348 )
	GridItemButtonBackdrop4:setAlpha( 0 )
	self:addElement( GridItemButtonBackdrop4 )
	self.GridItemButtonBackdrop4 = GridItemButtonBackdrop4
	
	local GridItemButtonBackdrop5 = CoD.GridItemButtonBackdrop.new( menu, controller )
	GridItemButtonBackdrop5:setLeftRight( 0, 0, 168, 348 )
	GridItemButtonBackdrop5:setTopBottom( 0, 0, 168, 348 )
	GridItemButtonBackdrop5:setAlpha( 0 )
	self:addElement( GridItemButtonBackdrop5 )
	self.GridItemButtonBackdrop5 = GridItemButtonBackdrop5
	
	local GridItemButtonBackdrop7 = CoD.GridItemButtonBackdrop.new( menu, controller )
	GridItemButtonBackdrop7:setLeftRight( 0, 0, 0, 180 )
	GridItemButtonBackdrop7:setTopBottom( 0, 0, 336, 516 )
	GridItemButtonBackdrop7:setAlpha( 0 )
	self:addElement( GridItemButtonBackdrop7 )
	self.GridItemButtonBackdrop7 = GridItemButtonBackdrop7
	
	local GridItemButtonBackdrop8 = CoD.GridItemButtonBackdrop.new( menu, controller )
	GridItemButtonBackdrop8:setLeftRight( 0, 0, 168, 348 )
	GridItemButtonBackdrop8:setTopBottom( 0, 0, 336, 516 )
	GridItemButtonBackdrop8:setAlpha( 0 )
	self:addElement( GridItemButtonBackdrop8 )
	self.GridItemButtonBackdrop8 = GridItemButtonBackdrop8
	
	local GridItemButtonBackdrop10 = CoD.GridItemButtonBackdrop.new( menu, controller )
	GridItemButtonBackdrop10:setLeftRight( 0, 0, 0, 180 )
	GridItemButtonBackdrop10:setTopBottom( 0, 0, 504, 684 )
	GridItemButtonBackdrop10:setAlpha( 0 )
	self:addElement( GridItemButtonBackdrop10 )
	self.GridItemButtonBackdrop10 = GridItemButtonBackdrop10
	
	local GridItemButtonBackdrop11 = CoD.GridItemButtonBackdrop.new( menu, controller )
	GridItemButtonBackdrop11:setLeftRight( 0, 0, 168, 348 )
	GridItemButtonBackdrop11:setTopBottom( 0, 0, 504, 684 )
	GridItemButtonBackdrop11:setAlpha( 0 )
	self:addElement( GridItemButtonBackdrop11 )
	self.GridItemButtonBackdrop11 = GridItemButtonBackdrop11
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GridItemButtonBackdrop1:close()
		self.GridItemButtonBackdrop2:close()
		self.GridItemButtonBackdrop4:close()
		self.GridItemButtonBackdrop5:close()
		self.GridItemButtonBackdrop7:close()
		self.GridItemButtonBackdrop8:close()
		self.GridItemButtonBackdrop10:close()
		self.GridItemButtonBackdrop11:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

