-- 564553d7d12460d453a339ce1a1ef9bd
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.MenuSpecificWidgets.AARPlayerSummaryListWidget" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.AARPlayerSummaryEmptyWidget" )

local f0_local0 = function ( f1_arg0 )
	
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
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "AfterActionReportMenu.buttonPrompts" )
	local f2_local1 = self
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
	
	local playerSummaryList = LUI.UIList.new( f2_local1, controller, 25, 0, nil, false, false, 0, 0, false, true )
	playerSummaryList:makeFocusable()
	playerSummaryList:setLeftRight( true, false, 128, 1163 )
	playerSummaryList:setTopBottom( true, false, 154, 554 )
	playerSummaryList:setDataSource( "AARStats" )
	playerSummaryList:setWidgetType( CoD.AARPlayerSummaryListWidget )
	playerSummaryList:setHorizontalCount( 4 )
	playerSummaryList:setSpacing( 25 )
	self:addElement( playerSummaryList )
	self.playerSummaryList = playerSummaryList
	
	local emptySummary1 = CoD.AARPlayerSummaryEmptyWidget.new( f2_local1, controller )
	emptySummary1:setLeftRight( true, false, 392, 632 )
	emptySummary1:setTopBottom( true, false, 154, 554 )
	self:addElement( emptySummary1 )
	self.emptySummary1 = emptySummary1
	
	local emptySummary2 = CoD.AARPlayerSummaryEmptyWidget.new( f2_local1, controller )
	emptySummary2:setLeftRight( true, false, 658, 898 )
	emptySummary2:setTopBottom( true, false, 154, 554 )
	self:addElement( emptySummary2 )
	self.emptySummary2 = emptySummary2
	
	local emptySummary3 = CoD.AARPlayerSummaryEmptyWidget.new( f2_local1, controller )
	emptySummary3:setLeftRight( true, false, 923, 1163 )
	emptySummary3:setTopBottom( true, false, 154, 554 )
	self:addElement( emptySummary3 )
	self.emptySummary3 = emptySummary3
	
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f3_arg0, f3_arg1, f3_arg2, f3_arg3 )
		SendMenuResponse( self, "AfterActionReportMenu", "done", f3_arg2 )
		GoBack( self, f3_arg2 )
		return true
	end, function ( f4_arg0, f4_arg1, f4_arg2 )
		CoD.Menu.SetButtonLabel( f4_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
		return false
	end, false )
	playerSummaryList.id = "playerSummaryList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f2_local1
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.playerSummaryList:close()
		element.emptySummary1:close()
		element.emptySummary2:close()
		element.emptySummary3:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "AfterActionReportMenu.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

