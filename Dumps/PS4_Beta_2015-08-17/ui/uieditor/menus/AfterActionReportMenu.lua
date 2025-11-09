require( "ui.uieditor.widgets.MenuSpecificWidgets.AARPlayerSummaryListWidget" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.AARPlayerSummaryEmptyWidget" )

local PostLoadFun = function ( self )
	
end

LUI.createMenu.AfterActionReportMenu = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "AfterActionReportMenu" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "AfterActionReportMenu.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, false, 96, 1184 )
	background:setTopBottom( true, false, 54, 666 )
	background:setRGB( 0.21, 0.21, 0.21 )
	self:addElement( background )
	self.background = background
	
	local titleLabel = LUI.UITightText.new()
	titleLabel:setLeftRight( true, false, 128, 401 )
	titleLabel:setTopBottom( true, false, 80, 128 )
	titleLabel:setText( Engine.Localize( "MPUI_AFTER_ACTION_REPORT" ) )
	titleLabel:setTTF( "fonts/default.ttf" )
	self:addElement( titleLabel )
	self.titleLabel = titleLabel
	
	local playerSummaryList = LUI.UIList.new( self, controller, 25, 0, nil, false, false, 0, 0, false, true )
	playerSummaryList:makeFocusable()
	playerSummaryList:setLeftRight( true, false, 128, 1163 )
	playerSummaryList:setTopBottom( true, false, 154, 554 )
	playerSummaryList:setDataSource( "AARStats" )
	playerSummaryList:setWidgetType( CoD.AARPlayerSummaryListWidget )
	playerSummaryList:setHorizontalCount( 4 )
	playerSummaryList:setSpacing( 25 )
	self:addElement( playerSummaryList )
	self.playerSummaryList = playerSummaryList
	
	local emptySummary1 = CoD.AARPlayerSummaryEmptyWidget.new( self, controller )
	emptySummary1:setLeftRight( true, false, 392, 632 )
	emptySummary1:setTopBottom( true, false, 154, 554 )
	self:addElement( emptySummary1 )
	self.emptySummary1 = emptySummary1
	
	local emptySummary2 = CoD.AARPlayerSummaryEmptyWidget.new( self, controller )
	emptySummary2:setLeftRight( true, false, 658, 898 )
	emptySummary2:setTopBottom( true, false, 154, 554 )
	self:addElement( emptySummary2 )
	self.emptySummary2 = emptySummary2
	
	local emptySummary3 = CoD.AARPlayerSummaryEmptyWidget.new( self, controller )
	emptySummary3:setLeftRight( true, false, 923, 1163 )
	emptySummary3:setTopBottom( true, false, 154, 554 )
	self:addElement( emptySummary3 )
	self.emptySummary3 = emptySummary3
	
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		SendMenuResponse( self, "AfterActionReportMenu", "done", controller )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
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

