-- dbfcf6b5b0f35550f93db2e6a10fca2d
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.GameSettings.GameSettings_Background" )
require( "ui.uieditor.widgets.Competitive.Competitive_Settings_SelectedItemInfo" )
require( "ui.uieditor.widgets.GameSettings.GameSettings_Button" )
require( "ui.uieditor.widgets.GameSettings.GameSettings_TabBar" )

DataSources.CompetitiveSettingsAttachmentRestrictionsTabs = DataSourceHelpers.ListSetup( "CompetitiveSettingsAttachmentRestrictionsTabs", function ( f1_arg0 )
	local f1_local0 = {}
	table.insert( f1_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderl
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	table.insert( f1_local0, {
		models = {
			tabName = Engine.Localize( "MPUI_ATTACHMENTS_CAPS" )
		}
	} )
	table.insert( f1_local0, {
		models = {
			tabName = Engine.Localize( "MPUI_OPTICS_CAPS" )
		}
	} )
	table.insert( f1_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderr
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f1_arg0 ), "GametypeSettings" ), "selectedAttachmentTab" ), 1 )
	return f1_local0
end, nil, nil, nil )
local f0_local0 = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3, f2_arg4 )
	Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f2_arg2 ), "GametypeSettings" ), "selectedAttachment" ), f2_arg3 )
	f2_arg4:saveState()
	OpenOverlay( f2_arg0, "Competitive_Settings_Attachment_Weapons", f2_arg2 )
end

DataSources.CompetitiveSettingsAttachments = DataSourceHelpers.ListSetup( "CompetitiveSettingsAttachments", function ( f3_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f3_arg0 ), "GametypeSettings" ), "selectedAttachmentTab" ) )
	local f3_local1, f3_local2 = CoD.CACUtility.GetAllItems()
	local f3_local3 = {}
	for f3_local7, f3_local8 in pairs( f3_local2 ) do
		if #f3_local8.items > 0 and (not (modelValue ~= 1 or f3_local8.isOptic ~= false) or modelValue == 2 and f3_local8.isOptic == true) then
			table.insert( f3_local3, {
				models = {
					title = Engine.Localize( f3_local8.name ),
					description = f3_local8.desc,
					image = f3_local8.image,
					displayText = Engine.Localize( f3_local8.name ),
					customId = f3_local8.name,
					attachmentIndex = f3_local7
				},
				properties = {
					disabled = false,
					action = f0_local0,
					actionParam = f3_local8.index
				}
			} )
		end
	end
	return f3_local3
end, nil, nil, function ( f4_arg0, f4_arg1, f4_arg2 )
	local f4_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f4_arg0 ), "GametypeSettings" ), "selectedAttachmentTab" )
	if f4_arg1.updateSubscription then
		f4_arg1:removeSubscription( f4_arg1.updateSubscription )
	end
	f4_arg1.updateSubscription = f4_arg1:subscribeToModel( f4_local0, function ()
		f4_arg1:clearSavedActiveIndex()
		f4_arg1:clearSavedState()
		f4_arg1:updateDataSource( true, false )
		f4_arg1:processEvent( {
			name = "gain_focus",
			controller = f4_arg0
		} )
	end, false )
end )
local PreLoadFunc = function ( self, controller )
	Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( controller ), "GametypeSettings" ), "selectedAttachmentTab" ), 1 )
	self.disablePopupOpenCloseAnim = true
end

local f0_local2 = function ( f7_arg0, f7_arg1 )
	f7_arg0.Tabs:setForceMouseEventDispatch( true )
	f7_arg0:registerEventHandler( "grid_item_changed", function ( element, event )
		if event.grid == f7_arg0.Tabs.Tabs then
			SetCompetitiveAttachmentSettingsTab( f7_arg0, element, f7_arg1, event.grid.savedActiveIndex )
		end
	end )
end

local PostLoadFunc = function ( self, controller, menu )
	self:subscribeToModel( Engine.CreateModel( Engine.GetModel( Engine.GetModelForController( controller ), "GametypeSettings" ), "selectedAttachmentTab" ), function ( model )
		self.Tabs:setActiveIndex( 1, Engine.GetModelValue( model ) + 1 )
	end )
	self.originalOcclusionChange = self.m_eventHandlers.occlusion_change
	self:registerEventHandler( "occlusion_change", function ( element, event )
		if not event.occluded and event.occludedBy.id ~= "Menu.GameSettings_OptionsMenu" then
			element:processEvent( {
				name = "lose_focus",
				controller = controller
			} )
			element:restoreState()
		end
		element:originalOcclusionChange( event )
	end )
	if CoD.isPC then
		f0_local2( self, controller, menu )
	end
end

LUI.createMenu.Competitive_Settings_Attachments = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Competitive_Settings_Attachments" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Competitive_Settings_Attachments.buttonPrompts" )
	local f12_local1 = self
	self.anyChildUsesUpdateState = true
	
	local GameSettingsBackground = CoD.GameSettings_Background.new( f12_local1, controller )
	GameSettingsBackground:setLeftRight( true, true, 0, 0 )
	GameSettingsBackground:setTopBottom( true, true, 0, 0 )
	GameSettingsBackground.MenuFrame.titleLabel:setText( Engine.Localize( "MPUI_ATTACHMENTS_CAPS" ) )
	GameSettingsBackground.MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MPUI_ATTACHMENTS_CAPS" ) )
	GameSettingsBackground.GameSettingsSelectedItemInfo.ToolTip:setAlpha( 0 )
	GameSettingsBackground.GameSettingsSelectedItemInfo.GameModeInfo:setAlpha( 0 )
	GameSettingsBackground.GameSettingsSelectedItemInfo.GameModeName:setAlpha( 0 )
	self:addElement( GameSettingsBackground )
	self.GameSettingsBackground = GameSettingsBackground
	
	local CompetitiveSettingsSelectedItemInfo = CoD.Competitive_Settings_SelectedItemInfo.new( f12_local1, controller )
	CompetitiveSettingsSelectedItemInfo:setLeftRight( true, true, 0, 0 )
	CompetitiveSettingsSelectedItemInfo:setTopBottom( true, true, 0, 0 )
	CompetitiveSettingsSelectedItemInfo:mergeStateConditions( {
		{
			stateName = "SquareImage",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( CompetitiveSettingsSelectedItemInfo )
	self.CompetitiveSettingsSelectedItemInfo = CompetitiveSettingsSelectedItemInfo
	
	local List = LUI.UIList.new( f12_local1, controller, 2, 0, nil, false, false, 0, 0, false, false )
	List:makeFocusable()
	List:setLeftRight( true, false, 66.87, 346.87 )
	List:setTopBottom( true, false, 141.57, 649.57 )
	List:setDataSource( "CompetitiveSettingsAttachments" )
	List:setWidgetType( CoD.GameSettings_Button )
	List:setVerticalCount( 15 )
	List:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f14_local0 = nil
		UpdateSelectedGametypeSettingModels( self, element, controller )
		return f14_local0
	end )
	List:registerEventHandler( "gain_focus", function ( element, event )
		local f15_local0 = nil
		if element.gainFocus then
			f15_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f15_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f12_local1, controller, Enum.LUIButton.LUI_KEY_LB )
		CoD.Menu.UpdateButtonShownState( element, f12_local1, controller, Enum.LUIButton.LUI_KEY_RB )
		CoD.Menu.UpdateButtonShownState( element, f12_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, f12_local1, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( element, f12_local1, controller, Enum.LUIButton.LUI_KEY_START )
		return f15_local0
	end )
	List:registerEventHandler( "lose_focus", function ( element, event )
		local f16_local0 = nil
		if element.loseFocus then
			f16_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f16_local0 = element.super:loseFocus( event )
		end
		return f16_local0
	end )
	f12_local1:AddButtonCallbackFunction( List, controller, Enum.LUIButton.LUI_KEY_LB, nil, function ( f17_arg0, f17_arg1, f17_arg2, f17_arg3 )
		ToggleCompetitiveAttachmentSettingsTab( self, f17_arg0, f17_arg2 )
		return true
	end, function ( f18_arg0, f18_arg1, f18_arg2 )
		CoD.Menu.SetButtonLabel( f18_arg1, Enum.LUIButton.LUI_KEY_LB, "" )
		return false
	end, false )
	f12_local1:AddButtonCallbackFunction( List, controller, Enum.LUIButton.LUI_KEY_RB, nil, function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3 )
		ToggleCompetitiveAttachmentSettingsTab( self, f19_arg0, f19_arg2 )
		return true
	end, function ( f20_arg0, f20_arg1, f20_arg2 )
		CoD.Menu.SetButtonLabel( f20_arg1, Enum.LUIButton.LUI_KEY_RB, "" )
		return false
	end, false )
	f12_local1:AddButtonCallbackFunction( List, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f21_arg0, f21_arg1, f21_arg2, f21_arg3 )
		ProcessListAction( self, f21_arg0, f21_arg2 )
		return true
	end, function ( f22_arg0, f22_arg1, f22_arg2 )
		CoD.Menu.SetButtonLabel( f22_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
		return false
	end, false )
	f12_local1:AddButtonCallbackFunction( List, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "R", function ( f23_arg0, f23_arg1, f23_arg2, f23_arg3 )
		OpenAttachmentRestrictionPopup( self, f23_arg0, f23_arg2, f23_arg1 )
		return true
	end, function ( f24_arg0, f24_arg1, f24_arg2 )
		CoD.Menu.SetButtonLabel( f24_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_RESTRICT" )
		return true
	end, false )
	f12_local1:AddButtonCallbackFunction( List, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( f25_arg0, f25_arg1, f25_arg2, f25_arg3 )
		OpenGameSettingsOptionsMenu( self, f25_arg0, f25_arg2, f25_arg1 )
		return true
	end, function ( f26_arg0, f26_arg1, f26_arg2 )
		CoD.Menu.SetButtonLabel( f26_arg1, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS" )
		return true
	end, false )
	self:addElement( List )
	self.List = List
	
	local Tabs = CoD.GameSettings_TabBar.new( f12_local1, controller )
	Tabs:setLeftRight( true, false, 0, 1614 )
	Tabs:setTopBottom( true, false, 87, 125 )
	Tabs.Tabs:setDataSource( "CompetitiveSettingsAttachmentRestrictionsTabs" )
	self:addElement( Tabs )
	self.Tabs = Tabs
	
	f12_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f27_arg0, f27_arg1, f27_arg2, f27_arg3 )
		GoBack( self, f27_arg2 )
		return true
	end, function ( f28_arg0, f28_arg1, f28_arg2 )
		CoD.Menu.SetButtonLabel( f28_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	f12_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f29_arg0, f29_arg1, f29_arg2, f29_arg3 )
		return true
	end, function ( f30_arg0, f30_arg1, f30_arg2 )
		CoD.Menu.SetButtonLabel( f30_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	GameSettingsBackground.MenuFrame:setModel( self.buttonModel, controller )
	List.id = "List"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f12_local1
	} )
	if not self:restoreState() then
		self.List:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GameSettingsBackground:close()
		element.CompetitiveSettingsSelectedItemInfo:close()
		element.List:close()
		element.Tabs:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Competitive_Settings_Attachments.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

