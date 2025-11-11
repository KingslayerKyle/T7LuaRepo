require( "ui.uieditor.widgets.Pregame.Pregame_ItemVote_TabItem" )
require( "ui.uieditor.widgets.Pregame.Pregame_ItemVote_TabList" )

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
	self:setLeftRight( 0, 0, 0, 1990 )
	self:setTopBottom( 0, 0, 0, 75 )
	self.anyChildUsesUpdateState = true
	
	local CategoryListPanel = LUI.UIImage.new()
	CategoryListPanel:setLeftRight( 0, 1, 0, 0 )
	CategoryListPanel:setTopBottom( 0, 1, 6, -10 )
	CategoryListPanel:setRGB( 0, 0, 0 )
	CategoryListPanel:setAlpha( 0.5 )
	self:addElement( CategoryListPanel )
	self.CategoryListPanel = CategoryListPanel
	
	local Tabs = CoD.Pregame_ItemVote_TabList.new( menu, controller )
	Tabs:setLeftRight( 0.5, 0.5, -995, 995 )
	Tabs:setTopBottom( 0, 0, 8, 68 )
	Tabs.grid:setWidgetType( CoD.Pregame_ItemVote_TabItem )
	Tabs.grid:setHorizontalCount( 11 )
	Tabs.grid:setDataSource( "PregameItemVoteTabs" )
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

