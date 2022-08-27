-- 043322727a9041adc1a4af025195d273
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 233 )
	self:setTopBottom( true, false, 0, 456 )
	
	local GridItemButtonBackdrop1 = CoD.GridItemButtonBackdrop.new( menu, controller )
	GridItemButtonBackdrop1:setLeftRight( true, false, 0, 120 )
	GridItemButtonBackdrop1:setTopBottom( true, false, 0, 120 )
	GridItemButtonBackdrop1:setAlpha( 0 )
	self:addElement( GridItemButtonBackdrop1 )
	self.GridItemButtonBackdrop1 = GridItemButtonBackdrop1
	
	local GridItemButtonBackdrop2 = CoD.GridItemButtonBackdrop.new( menu, controller )
	GridItemButtonBackdrop2:setLeftRight( true, false, 112, 232 )
	GridItemButtonBackdrop2:setTopBottom( true, false, 0, 120 )
	GridItemButtonBackdrop2:setAlpha( 0 )
	self:addElement( GridItemButtonBackdrop2 )
	self.GridItemButtonBackdrop2 = GridItemButtonBackdrop2
	
	local GridItemButtonBackdrop4 = CoD.GridItemButtonBackdrop.new( menu, controller )
	GridItemButtonBackdrop4:setLeftRight( true, false, 0, 120 )
	GridItemButtonBackdrop4:setTopBottom( true, false, 112, 232 )
	GridItemButtonBackdrop4:setAlpha( 0 )
	self:addElement( GridItemButtonBackdrop4 )
	self.GridItemButtonBackdrop4 = GridItemButtonBackdrop4
	
	local GridItemButtonBackdrop5 = CoD.GridItemButtonBackdrop.new( menu, controller )
	GridItemButtonBackdrop5:setLeftRight( true, false, 112, 232 )
	GridItemButtonBackdrop5:setTopBottom( true, false, 112, 232 )
	GridItemButtonBackdrop5:setAlpha( 0 )
	self:addElement( GridItemButtonBackdrop5 )
	self.GridItemButtonBackdrop5 = GridItemButtonBackdrop5
	
	local GridItemButtonBackdrop7 = CoD.GridItemButtonBackdrop.new( menu, controller )
	GridItemButtonBackdrop7:setLeftRight( true, false, 0, 120 )
	GridItemButtonBackdrop7:setTopBottom( true, false, 224, 344 )
	GridItemButtonBackdrop7:setAlpha( 0 )
	self:addElement( GridItemButtonBackdrop7 )
	self.GridItemButtonBackdrop7 = GridItemButtonBackdrop7
	
	local GridItemButtonBackdrop8 = CoD.GridItemButtonBackdrop.new( menu, controller )
	GridItemButtonBackdrop8:setLeftRight( true, false, 112, 232 )
	GridItemButtonBackdrop8:setTopBottom( true, false, 224, 344 )
	GridItemButtonBackdrop8:setAlpha( 0 )
	self:addElement( GridItemButtonBackdrop8 )
	self.GridItemButtonBackdrop8 = GridItemButtonBackdrop8
	
	local GridItemButtonBackdrop10 = CoD.GridItemButtonBackdrop.new( menu, controller )
	GridItemButtonBackdrop10:setLeftRight( true, false, 0, 120 )
	GridItemButtonBackdrop10:setTopBottom( true, false, 336, 456 )
	GridItemButtonBackdrop10:setAlpha( 0 )
	self:addElement( GridItemButtonBackdrop10 )
	self.GridItemButtonBackdrop10 = GridItemButtonBackdrop10
	
	local GridItemButtonBackdrop11 = CoD.GridItemButtonBackdrop.new( menu, controller )
	GridItemButtonBackdrop11:setLeftRight( true, false, 112, 232 )
	GridItemButtonBackdrop11:setTopBottom( true, false, 336, 456 )
	GridItemButtonBackdrop11:setAlpha( 0 )
	self:addElement( GridItemButtonBackdrop11 )
	self.GridItemButtonBackdrop11 = GridItemButtonBackdrop11
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GridItemButtonBackdrop1:close()
		element.GridItemButtonBackdrop2:close()
		element.GridItemButtonBackdrop4:close()
		element.GridItemButtonBackdrop5:close()
		element.GridItemButtonBackdrop7:close()
		element.GridItemButtonBackdrop8:close()
		element.GridItemButtonBackdrop10:close()
		element.GridItemButtonBackdrop11:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

