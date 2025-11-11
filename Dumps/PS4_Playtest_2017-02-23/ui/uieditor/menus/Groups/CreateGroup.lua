require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.BorderBaked" )
require( "ui.uieditor.widgets.BorderBakedSolid" )
require( "ui.uieditor.widgets.Groups.Common.GroupsBackground" )
require( "ui.uieditor.widgets.Groups.CreateGroupEmblem" )
require( "ui.uieditor.widgets.Groups.GroupsCreateButtonLG" )
require( "ui.uieditor.widgets.Groups.GroupsInputButton" )
require( "ui.uieditor.widgets.Groups.GroupSlider" )
require( "ui.uieditor.widgets.Groups.GroupsTooltip" )
require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_Left_wHeader" )

local PreLoadFunc = function ( self, controller )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "groups.selectedGroup.groupId" ), Engine.StringToXUIDDecimal( "0" ) )
	CoD.perController[controller].selectedGroup = Engine.GetModel( Engine.GetModelForController( controller ), "groups.selectedGroup" )
end

local PostLoadFunc = function ( self, controller )
	SetSelectingGroupEmblem( controller, true, true )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( self )
		SetSelectingGroupEmblem( controller, false, false )
		CoD.perController[controller].selectedGroup = nil
	end )
end

LUI.createMenu.CreateGroup = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CreateGroup" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "HUD"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CreateGroup.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( 0, 1, 0, 0 )
	BlackBG:setTopBottom( 0, 1, 0, 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local GroupsBackground0 = CoD.GroupsBackground.new( self, controller )
	GroupsBackground0:setLeftRight( 0, 0, 0, 1920 )
	GroupsBackground0:setTopBottom( 0, 0, 0, 1101 )
	GroupsBackground0:setAlpha( 0 )
	GroupsBackground0.titleLabel:setText( Engine.Localize( "GROUPS_CREATE_GROUP_CAPS" ) )
	self:addElement( GroupsBackground0 )
	self.GroupsBackground0 = GroupsBackground0
	
	local Panel = LUI.UIImage.new()
	Panel:setLeftRight( 0, 0, 96, 1824 )
	Panel:setTopBottom( 0, 0, 271, 963 )
	Panel:setRGB( 0.15, 0.15, 0.15 )
	Panel:setAlpha( 0 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local BorderBakedSolid3 = CoD.BorderBakedSolid.new( self, controller )
	BorderBakedSolid3:setLeftRight( 0, 0, 115, 400 )
	BorderBakedSolid3:setTopBottom( 0, 0, 389, 440 )
	self:addElement( BorderBakedSolid3 )
	self.BorderBakedSolid3 = BorderBakedSolid3
	
	local BorderBakedSolid2 = CoD.BorderBakedSolid.new( self, controller )
	BorderBakedSolid2:setLeftRight( 0, 0, 115, 400 )
	BorderBakedSolid2:setTopBottom( 0, 0, 311, 362 )
	self:addElement( BorderBakedSolid2 )
	self.BorderBakedSolid2 = BorderBakedSolid2
	
	local BorderBakedSolid1 = CoD.BorderBakedSolid.new( self, controller )
	BorderBakedSolid1:setLeftRight( 0, 0, 115, 400 )
	BorderBakedSolid1:setTopBottom( 0, 0, 233, 284 )
	self:addElement( BorderBakedSolid1 )
	self.BorderBakedSolid1 = BorderBakedSolid1
	
	local BorderBakedSolid0 = CoD.BorderBakedSolid.new( self, controller )
	BorderBakedSolid0:setLeftRight( 0, 0, 115, 400 )
	BorderBakedSolid0:setTopBottom( 0, 0, 155, 206 )
	BorderBakedSolid0:setAlpha( 0.8 )
	self:addElement( BorderBakedSolid0 )
	self.BorderBakedSolid0 = BorderBakedSolid0
	
	local BorderBaked3 = CoD.BorderBaked.new( self, controller )
	BorderBaked3:setLeftRight( 0, 0, 427, 1005 )
	BorderBaked3:setTopBottom( 0, 0, 389, 713 )
	BorderBaked3:setAlpha( 0 )
	self:addElement( BorderBaked3 )
	self.BorderBaked3 = BorderBaked3
	
	local Name = LUI.UITightText.new()
	Name:setLeftRight( 0, 0, 125, 188 )
	Name:setTopBottom( 0, 0, 167, 197 )
	Name:setText( Engine.Localize( "GROUPS_NAME" ) )
	Name:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( Name )
	self.Name = Name
	
	local Privacy = LUI.UITightText.new()
	Privacy:setLeftRight( 0, 0, 125, 245 )
	Privacy:setTopBottom( 0, 0, 245, 275 )
	Privacy:setText( Engine.Localize( "GROUPS_PRIVACY" ) )
	Privacy:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( Privacy )
	self.Privacy = Privacy
	
	local Description = LUI.UITightText.new()
	Description:setLeftRight( 0, 0, 125, 251 )
	Description:setTopBottom( 0, 0, 323, 353 )
	Description:setText( Engine.Localize( "GROUPS_DESCRIPTION" ) )
	Description:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( Description )
	self.Description = Description
	
	local Emblem = LUI.UITightText.new()
	Emblem:setLeftRight( 0, 0, 126, 214 )
	Emblem:setTopBottom( 0, 0, 400, 430 )
	Emblem:setText( Engine.Localize( "GROUPS_EMBLEM" ) )
	Emblem:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( Emblem )
	self.Emblem = Emblem
	
	local NameInput = CoD.GroupsInputButton.new( self, controller )
	NameInput:setLeftRight( 0, 0, 427, 1005 )
	NameInput:setTopBottom( 0, 0, 155.5, 206.5 )
	NameInput:subscribeToGlobalModel( controller, "CreateGroup", "name", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			NameInput.Text:setText( modelValue )
		end
	end )
	NameInput:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		GroupChangeSetTooltip( self, controller, "NAME" )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	NameInput:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( NameInput, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_GROUP_NAME" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( NameInput )
	self.NameInput = NameInput
	
	local DescriptionInput = CoD.GroupsInputButton.new( self, controller )
	DescriptionInput:setLeftRight( 0, 0, 427, 1005 )
	DescriptionInput:setTopBottom( 0, 0, 311.5, 362.5 )
	DescriptionInput:subscribeToGlobalModel( controller, "CreateGroup", "description", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			DescriptionInput.Text:setText( modelValue )
		end
	end )
	DescriptionInput:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		GroupChangeSetTooltip( self, controller, "DESCRIPTION" )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	DescriptionInput:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( DescriptionInput, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_GROUP_DESCRIPTION" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( DescriptionInput )
	self.DescriptionInput = DescriptionInput
	
	local CreateGroupButton = CoD.List1ButtonLarge_Left_wHeader.new( self, controller )
	CreateGroupButton:setLeftRight( 0, 0, 427, 1005 )
	CreateGroupButton:setTopBottom( 0, 0, 736, 788 )
	CreateGroupButton.Text:setText( Engine.Localize( "GROUPS_CREATE_GROUP_CAPS" ) )
	CreateGroupButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	CreateGroupButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( CreateGroupButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessCreateGroup( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( CreateGroupButton )
	self.CreateGroupButton = CreateGroupButton
	
	local GroupPrivacySlider = CoD.GroupSlider.new( self, controller )
	GroupPrivacySlider:setLeftRight( 0, 0, 427, 1005 )
	GroupPrivacySlider:setTopBottom( 0, 0, 233.5, 284.5 )
	GroupPrivacySlider.Slider:setDataSource( "GroupPrivacyModes" )
	GroupPrivacySlider:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		GroupCreationChangePrivacy( self, element, controller )
		return retVal
	end )
	self:addElement( GroupPrivacySlider )
	self.GroupPrivacySlider = GroupPrivacySlider
	
	local EmblemButton = CoD.GroupsCreateButtonLG.new( self, controller )
	EmblemButton:setLeftRight( 0, 0, 427, 1005 )
	EmblemButton:setTopBottom( 0, 0, 389, 713 )
	EmblemButton.ImageText:setText( Engine.Localize( "" ) )
	EmblemButton:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ), function ( model )
		local element = EmblemButton
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	EmblemButton:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		local element = EmblemButton
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	EmblemButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		GroupChangeSetTooltip( self, controller, "EMBLEM" )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	EmblemButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( EmblemButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsLive() and not IsUserContentRestricted( controller ) then
			OpenEmblemSelect( self, element, controller, Enum.StorageFileType.STORAGE_EMBLEMS, menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsLive() and not IsUserContentRestricted( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( EmblemButton )
	self.EmblemButton = EmblemButton
	
	local CreateGroupEmblem = CoD.CreateGroupEmblem.new( self, controller )
	CreateGroupEmblem:setLeftRight( 0, 1, 432, -920 )
	CreateGroupEmblem:setTopBottom( 0, 0, 395, 705 )
	self:addElement( CreateGroupEmblem )
	self.CreateGroupEmblem = CreateGroupEmblem
	
	local GroupsTooltip = CoD.GroupsTooltip.new( self, controller )
	GroupsTooltip:setLeftRight( 0, 0, 1047.5, 1554.5 )
	GroupsTooltip:setTopBottom( 0, 0, 155, 443 )
	GroupsTooltip:subscribeToGlobalModel( controller, "CreateGroup", "tooltip_title", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GroupsTooltip.TooltipTitle:setText( Engine.Localize( modelValue ) )
		end
	end )
	GroupsTooltip:subscribeToGlobalModel( controller, "CreateGroup", "tooltip_description", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GroupsTooltip.TooltipDescription:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( GroupsTooltip )
	self.GroupsTooltip = GroupsTooltip
	
	local MenuFrame0 = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame0:setLeftRight( 0, 1, 0, 0 )
	MenuFrame0:setTopBottom( 0, 1, 0, 0 )
	MenuFrame0.titleLabel:setText( Engine.Localize( "GROUPS_CREATE_GROUP_CAPS" ) )
	MenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "GROUPS_CREATE_GROUP_CAPS" ) )
	MenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_emblem" ) )
	self:addElement( MenuFrame0 )
	self.MenuFrame0 = MenuFrame0
	
	NameInput.navigation = {
		down = GroupPrivacySlider
	}
	DescriptionInput.navigation = {
		up = GroupPrivacySlider,
		down = EmblemButton
	}
	CreateGroupButton.navigation = {
		up = EmblemButton
	}
	GroupPrivacySlider.navigation = {
		up = NameInput,
		down = DescriptionInput
	}
	EmblemButton.navigation = {
		up = DescriptionInput,
		down = CreateGroupButton
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		CancelCreateGroup( self, element, controller, menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK", nil )
		return true
	end, false )
	NameInput.id = "NameInput"
	DescriptionInput.id = "DescriptionInput"
	CreateGroupButton.id = "CreateGroupButton"
	GroupPrivacySlider.id = "GroupPrivacySlider"
	EmblemButton.id = "EmblemButton"
	MenuFrame0:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.NameInput:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GroupsBackground0:close()
		self.BorderBakedSolid3:close()
		self.BorderBakedSolid2:close()
		self.BorderBakedSolid1:close()
		self.BorderBakedSolid0:close()
		self.BorderBaked3:close()
		self.NameInput:close()
		self.DescriptionInput:close()
		self.CreateGroupButton:close()
		self.GroupPrivacySlider:close()
		self.EmblemButton:close()
		self.CreateGroupEmblem:close()
		self.GroupsTooltip:close()
		self.MenuFrame0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CreateGroup.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

