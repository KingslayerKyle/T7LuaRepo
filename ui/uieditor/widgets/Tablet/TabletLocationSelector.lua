-- dba495bb9d39ccca45d6076b91c35090
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Tablet.TabletLocationSelector_Internal" )
require( "ui.uieditor.widgets.Tablet.TabletLocationSelector_InternalItems" )

CoD.TabletLocationSelector = InheritFrom( LUI.UIElement )
CoD.TabletLocationSelector.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.TabletLocationSelector )
	self.id = "TabletLocationSelector"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 720 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local internal = CoD.TabletLocationSelector_Internal.new( menu, controller )
	internal:setLeftRight( true, true, -10, -10 )
	internal:setTopBottom( true, true, 0, 0 )
	Engine.SetupUI3DWindow( controller, 1, 720, 720 )
	internal:setUI3DWindow( 1 )
	self:addElement( internal )
	self.internal = internal
	
	local internalItems = CoD.TabletLocationSelector_InternalItems.new( menu, controller )
	internalItems:setLeftRight( true, true, -10, -9 )
	internalItems:setTopBottom( true, true, -1, 0 )
	Engine.SetupUI3DWindow( controller, 2, 721, 721 )
	internalItems:setUI3DWindow( 2 )
	self:addElement( internalItems )
	self.internalItems = internalItems
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.internal:close()
		element.internalItems:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
