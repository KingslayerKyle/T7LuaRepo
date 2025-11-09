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
	GroupsSummaryTBD0:setLeftRight( true, false, 503, 649 )
	GroupsSummaryTBD0:setTopBottom( true, false, 153.5, 281.5 )
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

