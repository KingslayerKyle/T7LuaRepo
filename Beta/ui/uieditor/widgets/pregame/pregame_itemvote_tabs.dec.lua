require( "ui.uieditor.widgets.Pregame.Pregame_ItemVote_TabList" )
require( "ui.uieditor.widgets.Pregame.Pregame_ItemVote_TabItem" )

local PostLoadFunc = function ( self, controller, menu )
	local pregameRoot = Engine.CreateModel( Engine.GetModelForController( controller ), "Pregame" )
	local voteFilterModel = Engine.CreateModel( pregameRoot, "voteFilter" )
	self:subscribeToModel( voteFilterModel, function ( model )
		local currentFilter = Engine.GetModelValue( model )
		self.Tabs:setActiveIndex( 1, currentFilter + 1 )
	end )
end

CoD.Pregame_ItemVote_Tabs = InheritFrom( LUI.UIElement )
CoD.Pregame_ItemVote_Tabs.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Pregame_ItemVote_Tabs )
	self.id = "Pregame_ItemVote_Tabs"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1327 )
	self:setTopBottom( true, false, 0, 50 )
	self.anyChildUsesUpdateState = true
	
	local CategoryListPanel = LUI.UIImage.new()
	CategoryListPanel:setLeftRight( true, true, 0, 0 )
	CategoryListPanel:setTopBottom( true, true, 0, 13 )
	CategoryListPanel:setRGB( 0, 0, 0 )
	self:addElement( CategoryListPanel )
	self.CategoryListPanel = CategoryListPanel
	
	local Tabs = CoD.Pregame_ItemVote_TabList.new( menu, controller )
	Tabs:setLeftRight( false, false, -663.5, 663.5 )
	Tabs:setTopBottom( true, false, 5, 45 )
	Tabs.grid:setDataSource( "PregameItemVoteTabs" )
	Tabs.grid:setWidgetType( CoD.Pregame_ItemVote_TabItem )
	Tabs.grid:setHorizontalCount( 11 )
	self:addElement( Tabs )
	self.Tabs = Tabs
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Tabs:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

