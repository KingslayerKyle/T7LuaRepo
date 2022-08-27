-- f084588482a9e36ba50dcd37ce114792
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Groups.GroupsSummaryTBD" )

CoD.ShareTab = InheritFrom( LUI.UIElement )
CoD.ShareTab.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.ShareTab )
	self.id = "ShareTab"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1152 )
	self:setTopBottom( true, false, 0, 461 )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, false, 0, 1035 )
	Background:setTopBottom( true, false, 0, 460 )
	Background:setAlpha( 0 )
	self:addElement( Background )
	self.Background = Background
	
	local GroupsSummaryTBD0 = CoD.GroupsSummaryTBD.new( menu, controller )
	GroupsSummaryTBD0:setLeftRight( true, true, 503, -503 )
	GroupsSummaryTBD0:setTopBottom( false, false, -77, 51 )
	self:addElement( GroupsSummaryTBD0 )
	self.GroupsSummaryTBD0 = GroupsSummaryTBD0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GroupsSummaryTBD0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

