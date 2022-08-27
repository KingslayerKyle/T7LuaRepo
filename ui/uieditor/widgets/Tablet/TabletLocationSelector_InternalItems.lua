-- f3da231c7362e28debb9f2a1ca0a3bf3
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Minimap.MinimapHelperItems" )

CoD.TabletLocationSelector_InternalItems = InheritFrom( LUI.UIElement )
CoD.TabletLocationSelector_InternalItems.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.TabletLocationSelector_InternalItems )
	self.id = "TabletLocationSelector_InternalItems"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 721 )
	self:setTopBottom( true, false, 0, 721 )
	self.anyChildUsesUpdateState = true
	
	local MinimapHelperItems = CoD.MinimapHelperItems.new( menu, controller )
	MinimapHelperItems:setLeftRight( true, true, 0, 0 )
	MinimapHelperItems:setTopBottom( true, true, 0, 0 )
	self:addElement( MinimapHelperItems )
	self.MinimapHelperItems = MinimapHelperItems
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.MinimapHelperItems:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

