require( "ui.uieditor.widgets.Groups.Common.GroupsBackground" )
require( "ui.uieditor.widgets.BorderBakedSolid" )
require( "ui.uieditor.widgets.BorderBaked" )
require( "ui.uieditor.widgets.Groups.GroupsInputButton" )
require( "ui.uieditor.widgets.Groups.GroupSlider" )
require( "ui.uieditor.widgets.Groups.CreateGroupEmblem" )
require( "ui.uieditor.widgets.Groups.GroupsTooltip" )
require( "ui.uieditor.widgets.Groups.GroupsCreateButtonLG" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_PH" )
require( "ui.uieditor.widgets.Groups.GroupsInputButtonScroll" )

local PreLoadFunc = function ( self, controller )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "groups.selectedGroup.groupId" ), Engine.StringToXUIDDecimal( "0" ) )
	CoD.perController[controller].selectedGroup = Engine.GetModel( Engine.GetModelForController( controller ), "groups.selectedGroup" )
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	SetSelectingGroupEmblem( f2_arg1, true, true )
	LUI.OverrideFunction_CallOriginalFirst( f2_arg0, "close", function ( element )
		SetSelectingGroupEmblem( f2_arg1, false, false )
		CoD.perController[f2_arg1].selectedGroup = nil
	end )
end

LUI.createMenu.CreateGroup = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CreateGroup" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "HUD"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CreateGroup.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( true, true, 0, 0 )
	BlackBG:setTopBottom( true, true, 0, 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local GroupsBackground0 = CoD.GroupsBackground.new( self, controller )
	GroupsBackground0:setLeftRight( true, false, 0, 1280 )
	GroupsBackground0:setTopBottom( true, false, 0, 734 )
	GroupsBackground0:setAlpha( 0 )
	GroupsBackground0.titleLabel:setText( Engine.Localize( "GROUPS_CREATE_GROUP_CAPS" ) )
	self:addElement( GroupsBackground0 )
	self.GroupsBackground0 = GroupsBackground0
	
	local Panel = LUI.UIImage.new()
	Panel:setLeftRight( true, false, 64, 1216 )
	Panel:setTopBottom( true, false, 181, 642 )
	Panel:setRGB( 0.15, 0.15, 0.15 )
	Panel:setAlpha( 0 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local BorderBakedSolid3 = CoD.BorderBakedSolid.new( self, controller )
	BorderBakedSolid3:setLeftRight( true, false, 76.5, 266.5 )
	BorderBakedSolid3:setTopBottom( true, false, 315.5, 349.5 )
	BorderBakedSolid3:setAlpha( 0.5 )
	self:addElement( BorderBakedSolid3 )
	self.BorderBakedSolid3 = BorderBakedSolid3
	
	local BorderBakedSolid2 = CoD.BorderBakedSolid.new( self, controller )
	BorderBakedSolid2:setLeftRight( true, false, 76.5, 266.5 )
	BorderBakedSolid2:setTopBottom( true, false, 207.5, 241.5 )
	BorderBakedSolid2:setAlpha( 0.5 )
	self:addElement( BorderBakedSolid2 )
	self.BorderBakedSolid2 = BorderBakedSolid2
	
	local BorderBakedSolid1 = CoD.BorderBakedSolid.new( self, controller )
	BorderBakedSolid1:setLeftRight( true, false, 76.5, 266.5 )
	BorderBakedSolid1:setTopBottom( true, false, 155.5, 189.5 )
	BorderBakedSolid1:setAlpha( 0.5 )
	self:addElement( BorderBakedSolid1 )
	self.BorderBakedSolid1 = BorderBakedSolid1
	
	local BorderBakedSolid0 = CoD.BorderBakedSolid.new( self, controller )
	BorderBakedSolid0:setLeftRight( true, false, 76.5, 266.5 )
	BorderBakedSolid0:setTopBottom( true, false, 103.5, 137.5 )
	BorderBakedSolid0:setAlpha( 0.5 )
	self:addElement( BorderBakedSolid0 )
	self.BorderBakedSolid0 = BorderBakedSolid0
	
	local BorderBaked3 = CoD.BorderBaked.new( self, controller )
	BorderBaked3:setLeftRight( true, false, 284.5, 669.5 )
	BorderBaked3:setTopBottom( true, false, 259.5, 475.5 )
	BorderBaked3:setAlpha( 0 )
	self:addElement( BorderBaked3 )
	self.BorderBaked3 = BorderBaked3
	
	local Name = LUI.UITightText.new()
	Name:setLeftRight( true, false, 83.5, 125.5 )
	Name:setTopBottom( true, false, 109.5, 131.5 )
	Name:setText( Engine.Localize( "GROUPS_NAME" ) )
	Name:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( Name )
	self.Name = Name
	
	local Privacy = LUI.UITightText.new()
	Privacy:setLeftRight( true, false, 83.5, 163.5 )
	Privacy:setTopBottom( true, false, 161.5, 183.5 )
	Privacy:setText( Engine.Localize( "GROUPS_PRIVACY" ) )
	Privacy:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( Privacy )
	self.Privacy = Privacy
	
	local Description = LUI.UITightText.new()
	Description:setLeftRight( true, false, 83.5, 167.5 )
	Description:setTopBottom( true, false, 213.5, 235.5 )
	Description:setText( Engine.Localize( "GROUPS_DESCRIPTION" ) )
	Description:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( Description )
	self.Description = Description
	
	local Emblem = LUI.UITightText.new()
	Emblem:setLeftRight( true, false, 83.5, 142.5 )
	Emblem:setTopBottom( true, false, 321.5, 343.5 )
	Emblem:setText( Engine.Localize( "GROUPS_EMBLEM" ) )
	Emblem:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( Emblem )
	self.Emblem = Emblem
	
	local NameInput = CoD.GroupsInputButton.new( self, controller )
	NameInput:setLeftRight( true, false, 284.5, 669.5 )
	NameInput:setTopBottom( true, false, 103.5, 137.5 )
	NameInput:subscribeToGlobalModel( controller, "CreateGroup", "name", function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			NameInput.Text:setText( name )
		end
	end )
	NameInput:registerEventHandler( "gain_focus", function ( element, event )
		local f6_local0 = nil
		if element.gainFocus then
			f6_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f6_local0 = element.super:gainFocus( event )
		end
		GroupChangeSetTooltip( self, controller, "NAME" )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f6_local0
	end )
	NameInput:registerEventHandler( "lose_focus", function ( element, event )
		local f7_local0 = nil
		if element.loseFocus then
			f7_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f7_local0 = element.super:loseFocus( event )
		end
		return f7_local0
	end )
	self:AddButtonCallbackFunction( NameInput, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_GROUP_NAME" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( NameInput )
	self.NameInput = NameInput
	
	local GroupPrivacySlider = CoD.GroupSlider.new( self, controller )
	GroupPrivacySlider:setLeftRight( true, false, 284.5, 669.5 )
	GroupPrivacySlider:setTopBottom( true, false, 155.5, 189.5 )
	GroupPrivacySlider.Slider:setDataSource( "GroupPrivacyModes" )
	GroupPrivacySlider:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f10_local0 = nil
		GroupCreationChangePrivacy( self, element, controller )
		return f10_local0
	end )
	self:addElement( GroupPrivacySlider )
	self.GroupPrivacySlider = GroupPrivacySlider
	
	local CreateGroupEmblem = CoD.CreateGroupEmblem.new( self, controller )
	CreateGroupEmblem:setLeftRight( true, true, 287, -737.4 )
	CreateGroupEmblem:setTopBottom( true, false, 316.5, 478.5 )
	CreateGroupEmblem:setScale( 1 )
	self:addElement( CreateGroupEmblem )
	self.CreateGroupEmblem = CreateGroupEmblem
	
	local GroupsTooltip = CoD.GroupsTooltip.new( self, controller )
	GroupsTooltip:setLeftRight( true, false, 690.5, 1028.5 )
	GroupsTooltip:setTopBottom( true, false, 103.5, 293.5 )
	GroupsTooltip:subscribeToGlobalModel( controller, "CreateGroup", "tooltip_title", function ( model )
		local tooltipTitle = Engine.GetModelValue( model )
		if tooltipTitle then
			GroupsTooltip.TooltipTitle:setText( Engine.Localize( tooltipTitle ) )
		end
	end )
	GroupsTooltip:subscribeToGlobalModel( controller, "CreateGroup", "tooltip_description", function ( model )
		local tooltipDescription = Engine.GetModelValue( model )
		if tooltipDescription then
			GroupsTooltip.TooltipDescription:setText( Engine.Localize( tooltipDescription ) )
		end
	end )
	self:addElement( GroupsTooltip )
	self.GroupsTooltip = GroupsTooltip
	
	local EmblemButton = CoD.GroupsCreateButtonLG.new( self, controller )
	EmblemButton:setLeftRight( true, false, 284.5, 545.6 )
	EmblemButton:setTopBottom( true, false, 314.5, 482.5 )
	EmblemButton.ImageText:setText( Engine.Localize( "" ) )
	EmblemButton:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ), function ( model )
		local f13_local0 = EmblemButton
		local f13_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		}
		CoD.Menu.UpdateButtonShownState( f13_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	EmblemButton:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		local f14_local0 = EmblemButton
		local f14_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		}
		CoD.Menu.UpdateButtonShownState( f14_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	EmblemButton:registerEventHandler( "gain_focus", function ( element, event )
		local f15_local0 = nil
		if element.gainFocus then
			f15_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f15_local0 = element.super:gainFocus( event )
		end
		GroupChangeSetTooltip( self, controller, "EMBLEM" )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f15_local0
	end )
	EmblemButton:registerEventHandler( "lose_focus", function ( element, event )
		local f16_local0 = nil
		if element.loseFocus then
			f16_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f16_local0 = element.super:loseFocus( event )
		end
		return f16_local0
	end )
	self:AddButtonCallbackFunction( EmblemButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsLive() and not IsUserContentRestricted( controller ) then
			OpenEmblemSelect( self, element, controller, Enum.StorageFileType.STORAGE_EMBLEMS, menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsLive() and not IsUserContentRestricted( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( EmblemButton )
	self.EmblemButton = EmblemButton
	
	local MenuFrame0 = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame0:setLeftRight( true, true, 0, 0 )
	MenuFrame0:setTopBottom( true, true, 0, 0 )
	MenuFrame0.titleLabel:setText( Engine.Localize( "GROUPS_CREATE_GROUP_CAPS" ) )
	MenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "GROUPS_CREATE_GROUP_CAPS" ) )
	MenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_emblem" ) )
	self:addElement( MenuFrame0 )
	self.MenuFrame0 = MenuFrame0
	
	local CreateGroupButton = CoD.List1ButtonLarge_PH.new( self, controller )
	CreateGroupButton:setLeftRight( true, false, 284.5, 564.5 )
	CreateGroupButton:setTopBottom( true, false, 493.82, 525.82 )
	CreateGroupButton.btnDisplayText:setText( Engine.Localize( "GROUPS_CREATE_GROUP_CAPS" ) )
	CreateGroupButton.btnDisplayTextStroke:setText( Engine.Localize( "GROUPS_CREATE_GROUP_CAPS" ) )
	CreateGroupButton:registerEventHandler( "gain_focus", function ( element, event )
		local f19_local0 = nil
		if element.gainFocus then
			f19_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f19_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f19_local0
	end )
	CreateGroupButton:registerEventHandler( "lose_focus", function ( element, event )
		local f20_local0 = nil
		if element.loseFocus then
			f20_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f20_local0 = element.super:loseFocus( event )
		end
		return f20_local0
	end )
	self:AddButtonCallbackFunction( CreateGroupButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessCreateGroup( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( CreateGroupButton )
	self.CreateGroupButton = CreateGroupButton
	
	local DescriptionInput = CoD.GroupsInputButtonScroll.new( self, controller )
	DescriptionInput:setLeftRight( true, false, 284.75, 669.5 )
	DescriptionInput:setTopBottom( true, false, 208.5, 294.5 )
	DescriptionInput.verticalScrollingTextBox.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	DescriptionInput:subscribeToGlobalModel( controller, "CreateGroup", "description", function ( model )
		local description = Engine.GetModelValue( model )
		if description then
			DescriptionInput.verticalScrollingTextBox.textBox:setText( description )
		end
	end )
	DescriptionInput:registerEventHandler( "gain_focus", function ( element, event )
		local f24_local0 = nil
		if element.gainFocus then
			f24_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f24_local0 = element.super:gainFocus( event )
		end
		GroupChangeSetTooltip( self, controller, "DESCRIPTION" )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f24_local0
	end )
	DescriptionInput:registerEventHandler( "lose_focus", function ( element, event )
		local f25_local0 = nil
		if element.loseFocus then
			f25_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f25_local0 = element.super:loseFocus( event )
		end
		return f25_local0
	end )
	self:AddButtonCallbackFunction( DescriptionInput, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_GROUP_DESCRIPTION" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( DescriptionInput )
	self.DescriptionInput = DescriptionInput
	
	NameInput.navigation = {
		down = GroupPrivacySlider
	}
	GroupPrivacySlider.navigation = {
		up = NameInput,
		down = DescriptionInput
	}
	EmblemButton.navigation = {
		up = DescriptionInput,
		down = CreateGroupButton
	}
	CreateGroupButton.navigation = {
		up = EmblemButton
	}
	DescriptionInput.navigation = {
		up = GroupPrivacySlider,
		down = EmblemButton
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		CancelCreateGroup( self, element, controller, menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK" )
		return true
	end, false )
	NameInput.id = "NameInput"
	GroupPrivacySlider.id = "GroupPrivacySlider"
	EmblemButton.id = "EmblemButton"
	MenuFrame0:setModel( self.buttonModel, controller )
	CreateGroupButton.id = "CreateGroupButton"
	DescriptionInput.id = "DescriptionInput"
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GroupsBackground0:close()
		element.BorderBakedSolid3:close()
		element.BorderBakedSolid2:close()
		element.BorderBakedSolid1:close()
		element.BorderBakedSolid0:close()
		element.BorderBaked3:close()
		element.NameInput:close()
		element.GroupPrivacySlider:close()
		element.CreateGroupEmblem:close()
		element.GroupsTooltip:close()
		element.EmblemButton:close()
		element.MenuFrame0:close()
		element.CreateGroupButton:close()
		element.DescriptionInput:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CreateGroup.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

