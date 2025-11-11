require( "ui.uieditor.widgets.MenuSpecificWidgets.AARPlayerSummaryEmptyWidget" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.AARPlayerSummaryListWidget" )

local PostLoadFun = function ( self )
	
end

LUI.createMenu.AfterActionReportMenu = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "AfterActionReportMenu" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "AfterActionReportMenu.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( 0, 0, 144, 1776 )
	background:setTopBottom( 0, 0, 81, 999 )
	background:setRGB( 0.21, 0.21, 0.21 )
	self:addElement( background )
	self.background = background
	
	local titleLabel = LUI.UITightText.new()
	titleLabel:setLeftRight( 0, 0, 192, 602 )
	titleLabel:setTopBottom( 0, 0, 120, 192 )
	titleLabel:setText( Engine.Localize( "MPUI_AFTER_ACTION_REPORT" ) )
	titleLabel:setTTF( "fonts/default.ttf" )
	self:addElement( titleLabel )
	self.titleLabel = titleLabel
	
	local playerSummaryList = LUI.UIList.new( self, controller, 38, 0, nil, false, false, 0, 0, false, false )
	playerSummaryList:makeFocusable()
	playerSummaryList:setLeftRight( 0, 0, 191, 1745 )
	playerSummaryList:setTopBottom( 0, 0, 231, 831 )
	playerSummaryList:setWidgetType( CoD.AARPlayerSummaryListWidget )
	playerSummaryList:setHorizontalCount( 4 )
	playerSummaryList:setSpacing( 38 )
	playerSummaryList:setDataSource( "AARStats" )
	self:addElement( playerSummaryList )
	self.playerSummaryList = playerSummaryList
	
	local emptySummary1 = CoD.AARPlayerSummaryEmptyWidget.new( self, controller )
	emptySummary1:setLeftRight( 0, 0, 588, 948 )
	emptySummary1:setTopBottom( 0, 0, 231, 831 )
	self:addElement( emptySummary1 )
	self.emptySummary1 = emptySummary1
	
	local emptySummary2 = CoD.AARPlayerSummaryEmptyWidget.new( self, controller )
	emptySummary2:setLeftRight( 0, 0, 987, 1347 )
	emptySummary2:setTopBottom( 0, 0, 231, 831 )
	self:addElement( emptySummary2 )
	self.emptySummary2 = emptySummary2
	
	local emptySummary3 = CoD.AARPlayerSummaryEmptyWidget.new( self, controller )
	emptySummary3:setLeftRight( 0, 0, 1384, 1744 )
	emptySummary3:setTopBottom( 0, 0, 231, 831 )
	self:addElement( emptySummary3 )
	self.emptySummary3 = emptySummary3
	
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		SendMenuResponse( self, "AfterActionReportMenu", "done", controller )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "", nil )
		return false
	end, false )
	playerSummaryList.id = "playerSummaryList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.playerSummaryList:close()
		self.emptySummary1:close()
		self.emptySummary2:close()
		self.emptySummary3:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "AfterActionReportMenu.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

