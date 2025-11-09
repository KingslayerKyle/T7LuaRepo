require( "ui.uieditor.widgets.Groups.GroupsSummary" )
require( "ui.uieditor.widgets.Groups.GroupOverviewContentPanel" )

local PreLoadFunc = function ( self, controller )
	local f1_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "fileshareRoot", false ), "summaryFileUpdated", false )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "groups.showFullScreenshot" ), true )
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	FileshareCategorySelectorCategoryChanged( f2_arg1, "featured", nil, true )
	if CoD.isPC then
		f2_arg0.GroupOverviewContentPanel:setMouseDisabled( true )
	end
end

CoD.OverviewTab = InheritFrom( LUI.UIElement )
CoD.OverviewTab.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.OverviewTab )
	self.id = "OverviewTab"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1152 )
	self:setTopBottom( true, false, 0, 461 )
	self.anyChildUsesUpdateState = true
	
	local GroupsSummary = CoD.GroupsSummary.new( menu, controller )
	GroupsSummary:setLeftRight( true, false, 769, 1112 )
	GroupsSummary:setTopBottom( true, false, -4, 456 )
	GroupsSummary:subscribeToGlobalModel( controller, "SelectedGroup", nil, function ( model )
		GroupsSummary:setModel( model, controller )
	end )
	self:addElement( GroupsSummary )
	self.GroupsSummary = GroupsSummary
	
	local GroupOverviewContentPanel = CoD.GroupOverviewContentPanel.new( menu, controller )
	GroupOverviewContentPanel:setLeftRight( true, false, 109, 755 )
	GroupOverviewContentPanel:setTopBottom( true, false, -23, 492 )
	self:addElement( GroupOverviewContentPanel )
	self.GroupOverviewContentPanel = GroupOverviewContentPanel
	
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		SetControllerModelValue( controller, "groups.showFullScreenshot", false )
	end )
	self:subscribeToGlobalModel( controller, "FileshareRoot", "summaryFileUpdated", function ( model )
		local f6_local0 = self
		FileshareSummaryFileUpdate( controller )
	end )
	GroupOverviewContentPanel.id = "GroupOverviewContentPanel"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GroupsSummary:close()
		element.GroupOverviewContentPanel:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

