-- 67808aca496beaef56a4370fb4280da9
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.DOA.doa_bubble_internal" )

CoD.doa_bubble = InheritFrom( LUI.UIElement )
CoD.doa_bubble.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.doa_bubble )
	self.id = "doa_bubble"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 0 )
	self:setTopBottom( true, false, 0, 0 )
	
	local internal = CoD.doa_bubble_internal.new( menu, controller )
	internal:setLeftRight( true, false, 0, 200 )
	internal:setTopBottom( true, false, 0, 25 )
	self:addElement( internal )
	self.internal = internal
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.internal:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
