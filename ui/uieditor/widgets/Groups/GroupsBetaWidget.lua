-- c51f47975677b69ebb81a3c95056a26d
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Groups.Common.GroupsBetaInternal" )

CoD.GroupsBetaWidget = InheritFrom( LUI.UIElement )
CoD.GroupsBetaWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GroupsBetaWidget )
	self.id = "GroupsBetaWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 200 )
	self:setTopBottom( true, false, 0, 22 )
	self.anyChildUsesUpdateState = true
	
	local GroupsBetaInternal = CoD.GroupsBetaInternal.new( menu, controller )
	GroupsBetaInternal:setLeftRight( false, true, -200, 0 )
	GroupsBetaInternal:setTopBottom( false, false, -11, 11 )
	GroupsBetaInternal.Label:setText( LocalizeToUpperString( "GROUPS_BETA" ) )
	self:addElement( GroupsBetaInternal )
	self.GroupsBetaInternal = GroupsBetaInternal
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GroupsBetaInternal:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

