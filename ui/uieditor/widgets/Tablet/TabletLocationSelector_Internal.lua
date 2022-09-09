-- 416e8f723cbaabcada3430d57018a26f
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Minimap.MinimapHelper" )
require( "ui.uieditor.widgets.Tablet.TabletLocationSelector_HintText" )

CoD.TabletLocationSelector_Internal = InheritFrom( LUI.UIElement )
CoD.TabletLocationSelector_Internal.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.TabletLocationSelector_Internal )
	self.id = "TabletLocationSelector_Internal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 720 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local MinimapHelper = CoD.MinimapHelper.new( menu, controller )
	MinimapHelper:setLeftRight( true, true, 0, 0 )
	MinimapHelper:setTopBottom( true, true, 0, 0 )
	self:addElement( MinimapHelper )
	self.MinimapHelper = MinimapHelper
	
	local TabletLocationSelectorHintText0 = CoD.TabletLocationSelector_HintText.new( menu, controller )
	TabletLocationSelectorHintText0:setLeftRight( false, false, -360, 360 )
	TabletLocationSelectorHintText0:setTopBottom( true, false, 516, 540 )
	self:addElement( TabletLocationSelectorHintText0 )
	self.TabletLocationSelectorHintText0 = TabletLocationSelectorHintText0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.MinimapHelper:close()
		element.TabletLocationSelectorHintText0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
