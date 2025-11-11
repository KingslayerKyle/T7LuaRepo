require( "ui.uieditor.widgets.CAC.GridItemButtonBackdrop" )

CoD.GridItemButtonBackdropContainer3x4 = InheritFrom( LUI.UIElement )
CoD.GridItemButtonBackdropContainer3x4.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GridItemButtonBackdropContainer3x4 )
	self.id = "GridItemButtonBackdropContainer3x4"
	self.soundSet = "CAC_PrimaryWeapon"
	self:setLeftRight( 0, 0, 0, 516 )
	self:setTopBottom( 0, 0, 0, 684 )
	
	local GridItemButtonBackdrop1 = CoD.GridItemButtonBackdrop.new( menu, controller )
	GridItemButtonBackdrop1:setLeftRight( 0, 0, 0, 180 )
	GridItemButtonBackdrop1:setTopBottom( 0, 0, 0, 180 )
	self:addElement( GridItemButtonBackdrop1 )
	self.GridItemButtonBackdrop1 = GridItemButtonBackdrop1
	
	local GridItemButtonBackdrop2 = CoD.GridItemButtonBackdrop.new( menu, controller )
	GridItemButtonBackdrop2:setLeftRight( 0, 0, 168, 348 )
	GridItemButtonBackdrop2:setTopBottom( 0, 0, 0, 180 )
	self:addElement( GridItemButtonBackdrop2 )
	self.GridItemButtonBackdrop2 = GridItemButtonBackdrop2
	
	local GridItemButtonBackdrop3 = CoD.GridItemButtonBackdrop.new( menu, controller )
	GridItemButtonBackdrop3:setLeftRight( 0, 0, 336, 516 )
	GridItemButtonBackdrop3:setTopBottom( 0, 0, 0, 180 )
	self:addElement( GridItemButtonBackdrop3 )
	self.GridItemButtonBackdrop3 = GridItemButtonBackdrop3
	
	local GridItemButtonBackdrop4 = CoD.GridItemButtonBackdrop.new( menu, controller )
	GridItemButtonBackdrop4:setLeftRight( 0, 0, 0, 180 )
	GridItemButtonBackdrop4:setTopBottom( 0, 0, 168, 348 )
	self:addElement( GridItemButtonBackdrop4 )
	self.GridItemButtonBackdrop4 = GridItemButtonBackdrop4
	
	local GridItemButtonBackdrop5 = CoD.GridItemButtonBackdrop.new( menu, controller )
	GridItemButtonBackdrop5:setLeftRight( 0, 0, 168, 348 )
	GridItemButtonBackdrop5:setTopBottom( 0, 0, 168, 348 )
	self:addElement( GridItemButtonBackdrop5 )
	self.GridItemButtonBackdrop5 = GridItemButtonBackdrop5
	
	local GridItemButtonBackdrop6 = CoD.GridItemButtonBackdrop.new( menu, controller )
	GridItemButtonBackdrop6:setLeftRight( 0, 0, 336, 516 )
	GridItemButtonBackdrop6:setTopBottom( 0, 0, 168, 348 )
	self:addElement( GridItemButtonBackdrop6 )
	self.GridItemButtonBackdrop6 = GridItemButtonBackdrop6
	
	local GridItemButtonBackdrop7 = CoD.GridItemButtonBackdrop.new( menu, controller )
	GridItemButtonBackdrop7:setLeftRight( 0, 0, 0, 180 )
	GridItemButtonBackdrop7:setTopBottom( 0, 0, 336, 516 )
	self:addElement( GridItemButtonBackdrop7 )
	self.GridItemButtonBackdrop7 = GridItemButtonBackdrop7
	
	local GridItemButtonBackdrop8 = CoD.GridItemButtonBackdrop.new( menu, controller )
	GridItemButtonBackdrop8:setLeftRight( 0, 0, 168, 348 )
	GridItemButtonBackdrop8:setTopBottom( 0, 0, 336, 516 )
	self:addElement( GridItemButtonBackdrop8 )
	self.GridItemButtonBackdrop8 = GridItemButtonBackdrop8
	
	local GridItemButtonBackdrop9 = CoD.GridItemButtonBackdrop.new( menu, controller )
	GridItemButtonBackdrop9:setLeftRight( 0, 0, 336, 516 )
	GridItemButtonBackdrop9:setTopBottom( 0, 0, 336, 516 )
	self:addElement( GridItemButtonBackdrop9 )
	self.GridItemButtonBackdrop9 = GridItemButtonBackdrop9
	
	local GridItemButtonBackdrop10 = CoD.GridItemButtonBackdrop.new( menu, controller )
	GridItemButtonBackdrop10:setLeftRight( 0, 0, 0, 180 )
	GridItemButtonBackdrop10:setTopBottom( 0, 0, 504, 684 )
	self:addElement( GridItemButtonBackdrop10 )
	self.GridItemButtonBackdrop10 = GridItemButtonBackdrop10
	
	local GridItemButtonBackdrop11 = CoD.GridItemButtonBackdrop.new( menu, controller )
	GridItemButtonBackdrop11:setLeftRight( 0, 0, 168, 348 )
	GridItemButtonBackdrop11:setTopBottom( 0, 0, 504, 684 )
	self:addElement( GridItemButtonBackdrop11 )
	self.GridItemButtonBackdrop11 = GridItemButtonBackdrop11
	
	local GridItemButtonBackdrop12 = CoD.GridItemButtonBackdrop.new( menu, controller )
	GridItemButtonBackdrop12:setLeftRight( 0, 0, 336, 516 )
	GridItemButtonBackdrop12:setTopBottom( 0, 0, 504, 684 )
	self:addElement( GridItemButtonBackdrop12 )
	self.GridItemButtonBackdrop12 = GridItemButtonBackdrop12
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GridItemButtonBackdrop1:close()
		self.GridItemButtonBackdrop2:close()
		self.GridItemButtonBackdrop3:close()
		self.GridItemButtonBackdrop4:close()
		self.GridItemButtonBackdrop5:close()
		self.GridItemButtonBackdrop6:close()
		self.GridItemButtonBackdrop7:close()
		self.GridItemButtonBackdrop8:close()
		self.GridItemButtonBackdrop9:close()
		self.GridItemButtonBackdrop10:close()
		self.GridItemButtonBackdrop11:close()
		self.GridItemButtonBackdrop12:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

