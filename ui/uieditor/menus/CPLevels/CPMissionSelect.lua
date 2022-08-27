-- 8d9b1f35a7a1ab534a059ab4910927d7
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.menus.CPLevels.CPResetPopup" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.MissionProgression.CPMissionSelect_ListProgressionButton" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.CPLevels.CPMissionInfo" )
require( "ui.uieditor.widgets.CPLevels.CP_FrameBox" )

LUI.createMenu.CPMissionSelect = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CPMissionSelect" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "MultiplayerMain"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CPMissionSelect.buttonPrompts" )
	local f1_local1 = self
	self.anyChildUsesUpdateState = true
	
	local black = LUI.UIImage.new()
	black:setLeftRight( true, true, 0, 0 )
	black:setTopBottom( true, true, 0, 0 )
	black:setRGB( 0, 0, 0 )
	black:setAlpha( 0.85 )
	self:addElement( black )
	self.black = black
	
	local Smoke = LUI.UIImage.new()
	Smoke:setLeftRight( true, true, 0, 0 )
	Smoke:setTopBottom( true, true, 0, 0 )
	Smoke:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( Smoke )
	self.Smoke = Smoke
	
	local MapList = LUI.UIList.new( f1_local1, controller, 2, 0, nil, false, false, 0, 0, false, false )
	MapList:makeFocusable()
	MapList:setLeftRight( true, false, 79, 313 )
	MapList:setTopBottom( true, false, 144, 618 )
	MapList:setDataSource( "CPMapsList" )
	MapList:setWidgetType( CoD.CPMissionSelect_ListProgressionButton )
	MapList:setVerticalCount( 14 )
	MapList:registerEventHandler( "gain_focus", function ( element, event )
		local f2_local0 = nil
		if element.gainFocus then
			f2_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f2_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f2_local0
	end )
	MapList:registerEventHandler( "lose_focus", function ( element, event )
		local f3_local0 = nil
		if element.loseFocus then
			f3_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f3_local0 = element.super:loseFocus( event )
		end
		return f3_local0
	end )
	f1_local1:AddButtonCallbackFunction( MapList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
		LaunchSelectedCPMission( self, f4_arg0, f4_arg2 )
		return true
	end, function ( f5_arg0, f5_arg1, f5_arg2 )
		CoD.Menu.SetButtonLabel( f5_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	MapList:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "classified" )
			end
		},
		{
			stateName = "MissionOutOfOrder",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "completedOutOfOrder" )
			end
		},
		{
			stateName = "MissionCompleted",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "completed" )
			end
		},
		{
			stateName = "MissionCurrent",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isCurrentMap" )
			end
		},
		{
			stateName = "MissionNotComplete",
			condition = function ( menu, element, event )
				local f10_local0
				if not IsSelfModelValueTrue( element, controller, "complete" ) then
					f10_local0 = not IsSelfModelValueTrue( element, controller, "classified" )
				else
					f10_local0 = false
				end
				return f10_local0
			end
		}
	} )
	MapList:linkToElementModel( MapList, "classified", true, function ( model )
		f1_local1:updateElementState( MapList, {
			name = "model_validation",
			menu = f1_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "classified"
		} )
	end )
	MapList:linkToElementModel( MapList, "completedOutOfOrder", true, function ( model )
		f1_local1:updateElementState( MapList, {
			name = "model_validation",
			menu = f1_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "completedOutOfOrder"
		} )
	end )
	MapList:linkToElementModel( MapList, "completed", true, function ( model )
		f1_local1:updateElementState( MapList, {
			name = "model_validation",
			menu = f1_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "completed"
		} )
	end )
	MapList:linkToElementModel( MapList, "isCurrentMap", true, function ( model )
		f1_local1:updateElementState( MapList, {
			name = "model_validation",
			menu = f1_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isCurrentMap"
		} )
	end )
	MapList:linkToElementModel( MapList, "complete", true, function ( model )
		f1_local1:updateElementState( MapList, {
			name = "model_validation",
			menu = f1_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "complete"
		} )
	end )
	self:addElement( MapList )
	self.MapList = MapList
	
	local MenuFrame = CoD.GenericMenuFrame.new( f1_local1, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_SELECT_MISSION_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_SELECT_MISSION_CAPS" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f1_local1, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 84, 701 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local CPMissionInfo = CoD.CPMissionInfo.new( f1_local1, controller )
	CPMissionInfo:setLeftRight( true, false, 322, 1191 )
	CPMissionInfo:setTopBottom( true, false, 136, 553.28 )
	self:addElement( CPMissionInfo )
	self.CPMissionInfo = CPMissionInfo
	
	local CPFrameBox = CoD.CP_FrameBox.new( f1_local1, controller )
	CPFrameBox:setLeftRight( true, false, 322, 909 )
	CPFrameBox:setTopBottom( true, false, 136, 417 )
	self:addElement( CPFrameBox )
	self.CPFrameBox = CPFrameBox
	
	CPMissionInfo:linkToElementModel( MapList, nil, false, function ( model )
		CPMissionInfo:setModel( model, controller )
	end )
	f1_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f17_arg0, f17_arg1, f17_arg2, f17_arg3 )
		GoBack( self, f17_arg2 )
		return true
	end, function ( f18_arg0, f18_arg1, f18_arg2 )
		CoD.Menu.SetButtonLabel( f18_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	f1_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3 )
		return true
	end, function ( f20_arg0, f20_arg1, f20_arg2 )
		CoD.Menu.SetButtonLabel( f20_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
		return false
	end, false )
	f1_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( f21_arg0, f21_arg1, f21_arg2, f21_arg3 )
		if ShouldShowCampaignResetOption( f21_arg2 ) then
			OpenPopup( self, "CPResetPopup", f21_arg2 )
			return true
		else
			
		end
	end, function ( f22_arg0, f22_arg1, f22_arg2 )
		CoD.Menu.SetButtonLabel( f22_arg1, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS" )
		if ShouldShowCampaignResetOption( f22_arg2 ) then
			return true
		else
			return false
		end
	end, false )
	MapList.id = "MapList"
	MenuFrame:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f1_local1
	} )
	if not self:restoreState() then
		self.MapList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.MapList:close()
		element.MenuFrame:close()
		element.FEMenuLeftGraphics:close()
		element.CPMissionInfo:close()
		element.CPFrameBox:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CPMissionSelect.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

