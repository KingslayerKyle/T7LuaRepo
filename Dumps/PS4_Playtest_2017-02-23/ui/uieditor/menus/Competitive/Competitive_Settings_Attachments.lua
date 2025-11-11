require( "ui.uieditor.widgets.Competitive.Competitive_Settings_SelectedItemInfo" )
require( "ui.uieditor.widgets.GameSettings.GameSettings_Background" )
require( "ui.uieditor.widgets.GameSettings.GameSettings_Button" )
require( "ui.uieditor.widgets.GameSettings.GameSettings_TabBar" )

local PrepareCompetitiveSettingsAttachmentRestrictionsTabs = function ( controller )
	local tabs = {}
	table.insert( tabs, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderl
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	table.insert( tabs, {
		models = {
			tabName = Engine.Localize( "MPUI_ATTACHMENTS_CAPS" )
		}
	} )
	table.insert( tabs, {
		models = {
			tabName = Engine.Localize( "MPUI_OPTICS_CAPS" )
		}
	} )
	table.insert( tabs, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderr
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	local gametypeSettingsModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GametypeSettings" )
	local selectedTabModel = Engine.CreateModel( gametypeSettingsModel, "selectedAttachmentTab" )
	Engine.SetModelValue( selectedTabModel, 1 )
	return tabs
end

DataSources.CompetitiveSettingsAttachmentRestrictionsTabs = DataSourceHelpers.ListSetup( "CompetitiveSettingsAttachmentRestrictionsTabs", PrepareCompetitiveSettingsAttachmentRestrictionsTabs, nil, nil, nil )
local OpenAttachmentWeaponMenu = function ( self, element, controller, param, menu )
	local gametypeSettingsModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GametypeSettings" )
	local selectedAttachmentModel = Engine.CreateModel( gametypeSettingsModel, "selectedAttachment" )
	Engine.SetModelValue( selectedAttachmentModel, param )
	menu:saveState()
	OpenOverlay( self, "Competitive_Settings_Attachment_Weapons", controller )
end

local PrepareAttachmentsList = function ( controller )
	local gametypeSettingsModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GametypeSettings" )
	local selectedAttachmentTabModel = Engine.CreateModel( gametypeSettingsModel, "selectedAttachmentTab" )
	local selectedAttachmentTab = Engine.GetModelValue( selectedAttachmentTabModel )
	local items, attachments = CoD.CACUtility.GetAllItems()
	local buttons = {}
	for attachmentIndex, attachment in pairs( attachments ) do
		if #attachment.items > 0 and (not (selectedAttachmentTab ~= 1 or attachment.isOptic ~= false) or selectedAttachmentTab == 2 and attachment.isOptic == true) then
			table.insert( buttons, {
				models = {
					title = Engine.Localize( attachment.name ),
					description = attachment.desc,
					image = attachment.image,
					displayText = Engine.Localize( attachment.name ),
					customId = attachment.name,
					attachmentIndex = attachmentIndex
				},
				properties = {
					disabled = false,
					action = OpenAttachmentWeaponMenu,
					actionParam = attachment.index
				}
			} )
		end
	end
	return buttons
end

local AttachmentListUpdate = function ( controller, list, listModel )
	local gametypeSettingsModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GametypeSettings" )
	local selectedAttachmentTabModel = Engine.CreateModel( gametypeSettingsModel, "selectedAttachmentTab" )
	if list.updateSubscription then
		list:removeSubscription( list.updateSubscription )
	end
	list.updateSubscription = list:subscribeToModel( selectedAttachmentTabModel, function ()
		list:clearSavedActiveIndex()
		list:clearSavedState()
		list:updateDataSource( true, false )
		list:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end, false )
end

DataSources.CompetitiveSettingsAttachments = DataSourceHelpers.ListSetup( "CompetitiveSettingsAttachments", PrepareAttachmentsList, nil, nil, AttachmentListUpdate )
local PreLoadFunc = function ( self, controller )
	local gametypeSettingsModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GametypeSettings" )
	local selectedAttachmentTabModel = Engine.CreateModel( gametypeSettingsModel, "selectedAttachmentTab" )
	Engine.SetModelValue( selectedAttachmentTabModel, 1 )
	self.disablePopupOpenCloseAnim = true
end

local PostLoadFunc = function ( self, controller, menu )
	local gametypeSettingsModel = Engine.GetModel( Engine.GetModelForController( controller ), "GametypeSettings" )
	local selectedAttachmentTabModel = Engine.CreateModel( gametypeSettingsModel, "selectedAttachmentTab" )
	self:subscribeToModel( selectedAttachmentTabModel, function ( model )
		local currentIndex = Engine.GetModelValue( model )
		self.Tabs:setActiveIndex( 1, currentIndex + 1 )
	end )
	self.originalOcclusionChange = self.m_eventHandlers.occlusion_change
	self:registerEventHandler( "occlusion_change", function ( self, event )
		if not event.occluded and event.occludedBy.id ~= "Menu.GameSettings_OptionsMenu" then
			self:processEvent( {
				name = "lose_focus",
				controller = controller
			} )
			self:restoreState()
		end
		self:originalOcclusionChange( event )
	end )
end

LUI.createMenu.Competitive_Settings_Attachments = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Competitive_Settings_Attachments" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Competitive_Settings_Attachments.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local GameSettingsBackground = CoD.GameSettings_Background.new( self, controller )
	GameSettingsBackground:setLeftRight( 0, 1, 0, 0 )
	GameSettingsBackground:setTopBottom( 0, 1, 0, 0 )
	GameSettingsBackground.MenuFrame.titleLabel:setText( Engine.Localize( "MPUI_ATTACHMENTS_CAPS" ) )
	GameSettingsBackground.MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MPUI_ATTACHMENTS_CAPS" ) )
	GameSettingsBackground.GameSettingsSelectedItemInfo.ToolTip:setAlpha( 0 )
	GameSettingsBackground.GameSettingsSelectedItemInfo.GameModeInfo:setAlpha( 0 )
	GameSettingsBackground.GameSettingsSelectedItemInfo.GameModeName:setAlpha( 0 )
	self:addElement( GameSettingsBackground )
	self.GameSettingsBackground = GameSettingsBackground
	
	local CompetitiveSettingsSelectedItemInfo = CoD.Competitive_Settings_SelectedItemInfo.new( self, controller )
	CompetitiveSettingsSelectedItemInfo:mergeStateConditions( {
		{
			stateName = "SquareImage",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	CompetitiveSettingsSelectedItemInfo:setLeftRight( 0, 1, 0, 0 )
	CompetitiveSettingsSelectedItemInfo:setTopBottom( 0, 1, 0, 0 )
	self:addElement( CompetitiveSettingsSelectedItemInfo )
	self.CompetitiveSettingsSelectedItemInfo = CompetitiveSettingsSelectedItemInfo
	
	local List = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	List:makeFocusable()
	List:setLeftRight( 0, 0, 100, 520 )
	List:setTopBottom( 0, 0, 219, 967 )
	List:setWidgetType( CoD.GameSettings_Button )
	List:setVerticalCount( 15 )
	List:setDataSource( "CompetitiveSettingsAttachments" )
	List:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		UpdateSelectedGametypeSettingModels( self, element, controller )
		return retVal
	end )
	List:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_LB )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_RB )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_START )
		return retVal
	end )
	List:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( List, controller, Enum.LUIButton.LUI_KEY_LB, nil, function ( element, menu, controller, model )
		ToggleCompetitiveAttachmentSettingsTab( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LB, "", nil )
		return false
	end, false )
	self:AddButtonCallbackFunction( List, controller, Enum.LUIButton.LUI_KEY_RB, nil, function ( element, menu, controller, model )
		ToggleCompetitiveAttachmentSettingsTab( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RB, "", nil )
		return false
	end, false )
	self:AddButtonCallbackFunction( List, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "", nil )
		return false
	end, false )
	self:AddButtonCallbackFunction( List, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "R", function ( element, menu, controller, model )
		OpenAttachmentRestrictionPopup( self, element, controller, menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_RESTRICT", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( List, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( element, menu, controller, model )
		OpenGameSettingsOptionsMenu( self, element, controller, menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS", nil )
		return true
	end, false )
	self:addElement( List )
	self.List = List
	
	local Tabs = CoD.GameSettings_TabBar.new( self, controller )
	Tabs:setLeftRight( 0, 0, 0, 2421 )
	Tabs:setTopBottom( 0, 0, 130.5, 187.5 )
	Tabs.Tabs:setDataSource( "CompetitiveSettingsAttachmentRestrictionsTabs" )
	self:addElement( Tabs )
	self.Tabs = Tabs
	
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
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
		menu = self
	} )
	if not self:restoreState() then
		self.List:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GameSettingsBackground:close()
		self.CompetitiveSettingsSelectedItemInfo:close()
		self.List:close()
		self.Tabs:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Competitive_Settings_Attachments.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

