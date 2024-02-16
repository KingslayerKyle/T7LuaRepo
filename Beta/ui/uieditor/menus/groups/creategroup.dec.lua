require( "ui.uieditor.widgets.Groups.Common.GroupsBackground" )
require( "ui.uieditor.widgets.BorderBaked" )
require( "ui.uieditor.widgets.BorderBakedSolid" )
require( "ui.uieditor.widgets.Groups.GroupsInputButton" )
require( "ui.uieditor.widgets.Groups.CreateGroupEmblem" )
require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_Left_wHeader" )

LUI.createMenu.CreateGroup = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CreateGroup" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "HUD"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CreateGroup.buttonPrompts" )
	local menu = self
	self.anyChildUsesUpdateState = true
	
	local GroupsBackground0 = CoD.GroupsBackground.new( menu, controller )
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
	
	local BorderBaked1 = CoD.BorderBaked.new( menu, controller )
	BorderBaked1:setLeftRight( true, false, 284.5, 669.5 )
	BorderBaked1:setTopBottom( true, false, 246.5, 280.5 )
	self:addElement( BorderBaked1 )
	self.BorderBaked1 = BorderBaked1
	
	local BorderBaked2 = CoD.BorderBaked.new( menu, controller )
	BorderBaked2:setLeftRight( true, false, 284.5, 669.5 )
	BorderBaked2:setTopBottom( true, false, 298.5, 332.5 )
	self:addElement( BorderBaked2 )
	self.BorderBaked2 = BorderBaked2
	
	local BorderBaked0 = CoD.BorderBaked.new( menu, controller )
	BorderBaked0:setLeftRight( true, false, 284.5, 669.5 )
	BorderBaked0:setTopBottom( true, false, 194.5, 228.5 )
	self:addElement( BorderBaked0 )
	self.BorderBaked0 = BorderBaked0
	
	local BorderBakedSolid3 = CoD.BorderBakedSolid.new( menu, controller )
	BorderBakedSolid3:setLeftRight( true, false, 76.5, 266.5 )
	BorderBakedSolid3:setTopBottom( true, false, 350.5, 384.5 )
	self:addElement( BorderBakedSolid3 )
	self.BorderBakedSolid3 = BorderBakedSolid3
	
	local BorderBakedSolid2 = CoD.BorderBakedSolid.new( menu, controller )
	BorderBakedSolid2:setLeftRight( true, false, 76.5, 266.5 )
	BorderBakedSolid2:setTopBottom( true, false, 298.5, 332.5 )
	self:addElement( BorderBakedSolid2 )
	self.BorderBakedSolid2 = BorderBakedSolid2
	
	local BorderBakedSolid1 = CoD.BorderBakedSolid.new( menu, controller )
	BorderBakedSolid1:setLeftRight( true, false, 76.5, 266.5 )
	BorderBakedSolid1:setTopBottom( true, false, 246.5, 280.5 )
	self:addElement( BorderBakedSolid1 )
	self.BorderBakedSolid1 = BorderBakedSolid1
	
	local BorderBakedSolid0 = CoD.BorderBakedSolid.new( menu, controller )
	BorderBakedSolid0:setLeftRight( true, false, 76.5, 266.5 )
	BorderBakedSolid0:setTopBottom( true, false, 194.5, 228.5 )
	BorderBakedSolid0:setAlpha( 0.8 )
	self:addElement( BorderBakedSolid0 )
	self.BorderBakedSolid0 = BorderBakedSolid0
	
	local BorderBaked3 = CoD.BorderBaked.new( menu, controller )
	BorderBaked3:setLeftRight( true, false, 284.5, 669.5 )
	BorderBaked3:setTopBottom( true, false, 350.5, 566.5 )
	self:addElement( BorderBaked3 )
	self.BorderBaked3 = BorderBaked3
	
	local Name = LUI.UITightText.new()
	Name:setLeftRight( true, false, 83.5, 125.5 )
	Name:setTopBottom( true, false, 202.5, 222.5 )
	Name:setText( Engine.Localize( "MENU_NAME1" ) )
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
	
	local PrivacyInput = LUI.UIText.new()
	PrivacyInput:setLeftRight( true, false, 284.5, 670.5 )
	PrivacyInput:setTopBottom( true, false, 250.5, 280.5 )
	PrivacyInput:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	PrivacyInput:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	PrivacyInput:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	PrivacyInput:subscribeToGlobalModel( controller, "CreateGroup", "privacy", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PrivacyInput:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( PrivacyInput )
	self.PrivacyInput = PrivacyInput
	
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
	
	local NameInput = CoD.GroupsInputButton.new( menu, controller )
	NameInput:setLeftRight( true, false, 284.5, 669.5 )
	NameInput:setTopBottom( true, false, 194.5, 228.5 )
	NameInput:subscribeToGlobalModel( controller, "CreateGroup", "default_name", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			NameInput.DefaultText:setText( Engine.Localize( modelValue ) )
		end
	end )
	NameInput:subscribeToGlobalModel( controller, "CreateGroup", "name", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			NameInput.Text:setText( Engine.Localize( modelValue ) )
		end
	end )
	NameInput:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
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
	menu:AddButtonCallbackFunction( NameInput, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_GROUP_NAME" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( NameInput )
	self.NameInput = NameInput
	
	local DescriptionInput = CoD.GroupsInputButton.new( menu, controller )
	DescriptionInput:setLeftRight( true, false, 284.5, 669.5 )
	DescriptionInput:setTopBottom( true, false, 298.5, 332.5 )
	DescriptionInput:subscribeToGlobalModel( controller, "CreateGroup", "default_description", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			DescriptionInput.DefaultText:setText( Engine.Localize( modelValue ) )
		end
	end )
	DescriptionInput:subscribeToGlobalModel( controller, "CreateGroup", "description", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			DescriptionInput.Text:setText( Engine.Localize( modelValue ) )
		end
	end )
	DescriptionInput:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
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
	menu:AddButtonCallbackFunction( DescriptionInput, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_GROUP_DESCRIPTION" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( DescriptionInput )
	self.DescriptionInput = DescriptionInput
	
	local CreateGroupEmblem = CoD.CreateGroupEmblem.new( menu, controller )
	CreateGroupEmblem:setLeftRight( true, false, 413.5, 539.5 )
	CreateGroupEmblem:setTopBottom( true, false, 395.5, 521.5 )
	self:addElement( CreateGroupEmblem )
	self.CreateGroupEmblem = CreateGroupEmblem
	
	local List1ButtonLargeLeftwHeader0 = CoD.List1ButtonLarge_Left_wHeader.new( menu, controller )
	List1ButtonLargeLeftwHeader0:setLeftRight( true, false, 284.5, 669.5 )
	List1ButtonLargeLeftwHeader0:setTopBottom( true, false, 582.5, 617.11 )
	List1ButtonLargeLeftwHeader0.Text:setText( Engine.Localize( "GROUPS_CREATE_GROUP_CAPS" ) )
	List1ButtonLargeLeftwHeader0:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	List1ButtonLargeLeftwHeader0:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( List1ButtonLargeLeftwHeader0, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessCreateGroup( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( List1ButtonLargeLeftwHeader0 )
	self.List1ButtonLargeLeftwHeader0 = List1ButtonLargeLeftwHeader0
	
	NameInput.navigation = {
		down = DescriptionInput
	}
	DescriptionInput.navigation = {
		up = NameInput,
		down = List1ButtonLargeLeftwHeader0
	}
	List1ButtonLargeLeftwHeader0.navigation = {
		up = DescriptionInput
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		menu:OpenModalDialog( self, controller, "GROUPS_CANCEL_GROUP_CREATION_TITLE", "GROUPS_CANCEL_GROUP_CREATION_SUBTITLE", {
			"MPUI_NO",
			"MPUI_YES"
		}, function ( modalResult )
			if modalResult == 1 then
				GoBack( self, controller )
				return true
			else
				
			end
		end )
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		menu:OpenModalDialog( self, controller, "GROUPS_CANCEL_GROUP_CREATION_TITLE", "GROUPS_CANCEL_GROUP_CREATION_SUBTITLE", {
			"MPUI_NO",
			"MPUI_YES"
		}, function ( modalResult )
			if modalResult == 1 then
				return true
			else
				
			end
		end )
		return false
	end, false )
	NameInput.id = "NameInput"
	DescriptionInput.id = "DescriptionInput"
	List1ButtonLargeLeftwHeader0.id = "List1ButtonLargeLeftwHeader0"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = menu
	} )
	if not self:restoreState() then
		self.NameInput:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GroupsBackground0:close()
		self.BorderBaked1:close()
		self.BorderBaked2:close()
		self.BorderBaked0:close()
		self.BorderBakedSolid3:close()
		self.BorderBakedSolid2:close()
		self.BorderBakedSolid1:close()
		self.BorderBakedSolid0:close()
		self.BorderBaked3:close()
		self.NameInput:close()
		self.DescriptionInput:close()
		self.CreateGroupEmblem:close()
		self.List1ButtonLargeLeftwHeader0:close()
		self.PrivacyInput:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CreateGroup.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

