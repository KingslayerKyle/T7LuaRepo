require( "ui.uieditor.widgets.Groups.Common.GroupsBackground" )
require( "ui.uieditor.widgets.BorderBakedSolid" )
require( "ui.uieditor.widgets.BorderBaked" )
require( "ui.uieditor.widgets.Groups.GroupsInputButton" )
require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_Left_wHeader" )
require( "ui.uieditor.widgets.Groups.GroupSlider" )
require( "ui.uieditor.widgets.Groups.GroupsCreateButtonLG" )
require( "ui.uieditor.widgets.Groups.CreateGroupEmblem" )
require( "ui.uieditor.widgets.Groups.GroupsTooltip" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )

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
	
	local GroupsBackground0 = CoD.GroupsBackground.new( self, controller )
	GroupsBackground0:setLeftRight( true, false, 0, 1280 )
	GroupsBackground0:setTopBottom( true, false, 0, 734 )
	GroupsBackground0.titleLabel:setText( Engine.Localize( "GROUPS_CREATE_GROUP_CAPS" ) )
	self:addElement( GroupsBackground0 )
	self.GroupsBackground0 = GroupsBackground0
	
	local Panel = LUI.UIImage.new()
	Panel:setLeftRight( true, false, 64, 1216 )
	Panel:setTopBottom( true, false, 181, 642 )
	Panel:setRGB( 0.15, 0.15, 0.15 )
	Panel:setAlpha( 0.5 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local BorderBakedSolid3 = CoD.BorderBakedSolid.new( self, controller )
	BorderBakedSolid3:setLeftRight( true, false, 76.5, 266.5 )
	BorderBakedSolid3:setTopBottom( true, false, 350.5, 384.5 )
	self:addElement( BorderBakedSolid3 )
	self.BorderBakedSolid3 = BorderBakedSolid3
	
	local BorderBakedSolid2 = CoD.BorderBakedSolid.new( self, controller )
	BorderBakedSolid2:setLeftRight( true, false, 76.5, 266.5 )
	BorderBakedSolid2:setTopBottom( true, false, 298.5, 332.5 )
	self:addElement( BorderBakedSolid2 )
	self.BorderBakedSolid2 = BorderBakedSolid2
	
	local BorderBakedSolid1 = CoD.BorderBakedSolid.new( self, controller )
	BorderBakedSolid1:setLeftRight( true, false, 76.5, 266.5 )
	BorderBakedSolid1:setTopBottom( true, false, 246.5, 280.5 )
	self:addElement( BorderBakedSolid1 )
	self.BorderBakedSolid1 = BorderBakedSolid1
	
	local BorderBakedSolid0 = CoD.BorderBakedSolid.new( self, controller )
	BorderBakedSolid0:setLeftRight( true, false, 76.5, 266.5 )
	BorderBakedSolid0:setTopBottom( true, false, 194.5, 228.5 )
	BorderBakedSolid0:setAlpha( 0.8 )
	self:addElement( BorderBakedSolid0 )
	self.BorderBakedSolid0 = BorderBakedSolid0
	
	local BorderBaked3 = CoD.BorderBaked.new( self, controller )
	BorderBaked3:setLeftRight( true, false, 284.5, 669.5 )
	BorderBaked3:setTopBottom( true, false, 350.5, 566.5 )
	self:addElement( BorderBaked3 )
	self.BorderBaked3 = BorderBaked3
	
	local Name = LUI.UITightText.new()
	Name:setLeftRight( false, true, -1196.5, -1154.5 )
	Name:setTopBottom( true, false, 202.5, 222.5 )
	Name:setText( Engine.Localize( "GROUPS_NAME" ) )
	Name:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	self:addElement( Name )
	self.Name = Name
	
	local Privacy = LUI.UITightText.new()
	Privacy:setLeftRight( true, false, 83.5, 163.5 )
	Privacy:setTopBottom( true, false, 254.5, 274.5 )
	Privacy:setText( Engine.Localize( "GROUPS_PRIVACY" ) )
	Privacy:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	self:addElement( Privacy )
	self.Privacy = Privacy
	
	local Description = LUI.UITightText.new()
	Description:setLeftRight( true, false, 83.5, 167.5 )
	Description:setTopBottom( true, false, 306.5, 326.5 )
	Description:setText( Engine.Localize( "GROUPS_DESCRIPTION" ) )
	Description:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	self:addElement( Description )
	self.Description = Description
	
	local Emblem = LUI.UITightText.new()
	Emblem:setLeftRight( true, false, 83.5, 142.5 )
	Emblem:setTopBottom( true, false, 359.5, 379.5 )
	Emblem:setText( Engine.Localize( "GROUPS_EMBLEM" ) )
	Emblem:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	self:addElement( Emblem )
	self.Emblem = Emblem
	
	local NameInput = CoD.GroupsInputButton.new( self, controller )
	NameInput:setLeftRight( true, false, 284.5, 669.5 )
	NameInput:setTopBottom( true, false, 194.5, 228.5 )
	NameInput:subscribeToGlobalModel( controller, "CreateGroup", "name", function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			NameInput.Text:setText( name )
		end
	end )
	NameInput:registerEventHandler( "gain_focus", function ( element, event )
		local f3_local0 = nil
		if element.gainFocus then
			f3_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f3_local0 = element.super:gainFocus( event )
		end
		GroupChangeSetTooltip( self, controller, "NAME" )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f3_local0
	end )
	NameInput:registerEventHandler( "lose_focus", function ( element, event )
		local f4_local0 = nil
		if element.loseFocus then
			f4_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f4_local0 = element.super:loseFocus( event )
		end
		return f4_local0
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
	
	local DescriptionInput = CoD.GroupsInputButton.new( self, controller )
	DescriptionInput:setLeftRight( true, false, 284.5, 669.5 )
	DescriptionInput:setTopBottom( true, false, 298.5, 332.5 )
	DescriptionInput:subscribeToGlobalModel( controller, "CreateGroup", "description", function ( model )
		local description = Engine.GetModelValue( model )
		if description then
			DescriptionInput.Text:setText( description )
		end
	end )
	DescriptionInput:registerEventHandler( "gain_focus", function ( element, event )
		local f8_local0 = nil
		if element.gainFocus then
			f8_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f8_local0 = element.super:gainFocus( event )
		end
		GroupChangeSetTooltip( self, controller, "DESCRIPTION" )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f8_local0
	end )
	DescriptionInput:registerEventHandler( "lose_focus", function ( element, event )
		local f9_local0 = nil
		if element.loseFocus then
			f9_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f9_local0 = element.super:loseFocus( event )
		end
		return f9_local0
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
	
	local List1ButtonLargeLeftwHeader0 = CoD.List1ButtonLarge_Left_wHeader.new( self, controller )
	List1ButtonLargeLeftwHeader0:setLeftRight( true, false, 284.5, 669.5 )
	List1ButtonLargeLeftwHeader0:setTopBottom( true, false, 582.5, 617.11 )
	List1ButtonLargeLeftwHeader0.Text:setText( Engine.Localize( "GROUPS_CREATE_GROUP_CAPS" ) )
	List1ButtonLargeLeftwHeader0:registerEventHandler( "gain_focus", function ( element, event )
		local f12_local0 = nil
		if element.gainFocus then
			f12_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f12_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f12_local0
	end )
	List1ButtonLargeLeftwHeader0:registerEventHandler( "lose_focus", function ( element, event )
		local f13_local0 = nil
		if element.loseFocus then
			f13_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f13_local0 = element.super:loseFocus( event )
		end
		return f13_local0
	end )
	self:AddButtonCallbackFunction( List1ButtonLargeLeftwHeader0, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessCreateGroup( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( List1ButtonLargeLeftwHeader0 )
	self.List1ButtonLargeLeftwHeader0 = List1ButtonLargeLeftwHeader0
	
	local GroupPrivacySlider = CoD.GroupSlider.new( self, controller )
	GroupPrivacySlider:setLeftRight( true, false, 284.5, 669.5 )
	GroupPrivacySlider:setTopBottom( true, false, 246.5, 280.5 )
	GroupPrivacySlider.Slider:setDataSource( "GroupPrivacyModes" )
	GroupPrivacySlider:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f16_local0 = nil
		GroupChangePrivacy( self, element, controller )
		return f16_local0
	end )
	self:addElement( GroupPrivacySlider )
	self.GroupPrivacySlider = GroupPrivacySlider
	
	local EmblemButton = CoD.GroupsCreateButtonLG.new( self, controller )
	EmblemButton:setLeftRight( true, false, 284.5, 669.5 )
	EmblemButton:setTopBottom( true, false, 350.5, 566.5 )
	EmblemButton.ImageText:setText( Engine.Localize( "" ) )
	EmblemButton:registerEventHandler( "gain_focus", function ( element, event )
		local f17_local0 = nil
		if element.gainFocus then
			f17_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f17_local0 = element.super:gainFocus( event )
		end
		GroupChangeSetTooltip( self, controller, "EMBLEM" )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f17_local0
	end )
	EmblemButton:registerEventHandler( "lose_focus", function ( element, event )
		local f18_local0 = nil
		if element.loseFocus then
			f18_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f18_local0 = element.super:loseFocus( event )
		end
		return f18_local0
	end )
	self:AddButtonCallbackFunction( EmblemButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		GroupEmblemSelect_Open( self, element, controller, menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( EmblemButton )
	self.EmblemButton = EmblemButton
	
	local CreateGroupEmblem = CoD.CreateGroupEmblem.new( self, controller )
	CreateGroupEmblem:setLeftRight( true, false, 413.5, 539.5 )
	CreateGroupEmblem:setTopBottom( true, false, 395.5, 521.5 )
	self:addElement( CreateGroupEmblem )
	self.CreateGroupEmblem = CreateGroupEmblem
	
	local GroupsTooltip = CoD.GroupsTooltip.new( self, controller )
	GroupsTooltip:setLeftRight( true, false, 814.5, 1152.5 )
	GroupsTooltip:setTopBottom( true, false, 195.5, 387.5 )
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
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "GROUPS_CREATE_GROUP_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_EMBLEMS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_emblem" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local MenuFrame0 = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame0:setLeftRight( true, true, 0, 0 )
	MenuFrame0:setTopBottom( true, true, 0, 0 )
	MenuFrame0.titleLabel:setText( Engine.Localize( "GROUPS_CREATE_GROUP_CAPS" ) )
	MenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "GROUPS_CREATE_GROUP_CAPS" ) )
	MenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_emblem" ) )
	self:addElement( MenuFrame0 )
	self.MenuFrame0 = MenuFrame0
	
	NameInput.navigation = {
		down = GroupPrivacySlider
	}
	DescriptionInput.navigation = {
		up = GroupPrivacySlider,
		down = EmblemButton
	}
	List1ButtonLargeLeftwHeader0.navigation = {
		up = EmblemButton
	}
	GroupPrivacySlider.navigation = {
		up = NameInput,
		down = DescriptionInput
	}
	EmblemButton.navigation = {
		up = DescriptionInput,
		down = List1ButtonLargeLeftwHeader0
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK" )
		return true
	end, false )
	NameInput.id = "NameInput"
	DescriptionInput.id = "DescriptionInput"
	List1ButtonLargeLeftwHeader0.id = "List1ButtonLargeLeftwHeader0"
	GroupPrivacySlider.id = "GroupPrivacySlider"
	EmblemButton.id = "EmblemButton"
	MenuFrame:setModel( self.buttonModel, controller )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GroupsBackground0:close()
		element.BorderBakedSolid3:close()
		element.BorderBakedSolid2:close()
		element.BorderBakedSolid1:close()
		element.BorderBakedSolid0:close()
		element.BorderBaked3:close()
		element.NameInput:close()
		element.DescriptionInput:close()
		element.List1ButtonLargeLeftwHeader0:close()
		element.GroupPrivacySlider:close()
		element.EmblemButton:close()
		element.CreateGroupEmblem:close()
		element.GroupsTooltip:close()
		element.MenuFrame:close()
		element.MenuFrame0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CreateGroup.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

