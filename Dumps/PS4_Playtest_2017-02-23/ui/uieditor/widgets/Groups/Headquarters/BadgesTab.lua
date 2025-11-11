require( "ui.uieditor.widgets.Groups.GroupsSummaryTBD" )

CoD.BadgesTab = InheritFrom( LUI.UIElement )
CoD.BadgesTab.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.BadgesTab )
	self.id = "BadgesTab"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1728 )
	self:setTopBottom( 0, 0, 0, 691 )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( 0, 0, 0, 1552 )
	Background:setTopBottom( 0, 0, 0, 690 )
	Background:setAlpha( 0 )
	self:addElement( Background )
	self.Background = Background
	
	local GroupsSummaryTBD0 = CoD.GroupsSummaryTBD.new( menu, controller )
	GroupsSummaryTBD0:setLeftRight( 0, 0, 754.5, 973.5 )
	GroupsSummaryTBD0:setTopBottom( 0, 0, 230, 422 )
	self:addElement( GroupsSummaryTBD0 )
	self.GroupsSummaryTBD0 = GroupsSummaryTBD0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GroupsSummaryTBD0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

