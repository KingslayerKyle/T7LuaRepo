require( "ui.uieditor.widgets.Challenges.Challenges_Title" )
require( "ui.uieditor.widgets.Groups.GroupsCreateButtonLG" )
require( "ui.uieditor.widgets.Groups.GroupsInputButton" )

CoD.AdminTabGroupOverviewFrame = InheritFrom( LUI.UIElement )
CoD.AdminTabGroupOverviewFrame.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AdminTabGroupOverviewFrame )
	self.id = "AdminTabGroupOverviewFrame"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1086 )
	self:setTopBottom( 0, 0, 0, 625 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local MsgInputButton = CoD.GroupsInputButton.new( menu, controller )
	MsgInputButton:setLeftRight( 0, 0, 0, 578 )
	MsgInputButton:setTopBottom( 0, 0, 59, 167 )
	MsgInputButton:subscribeToGlobalModel( controller, "SelectedGroup", "message", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MsgInputButton.Text:setText( modelValue )
		end
	end )
	MsgInputButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	MsgInputButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( MsgInputButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		EditSelectedGroupMessage( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( MsgInputButton )
	self.MsgInputButton = MsgInputButton
	
	local DescInputButton = CoD.GroupsInputButton.new( menu, controller )
	DescInputButton:setLeftRight( 0, 0, 0, 578 )
	DescInputButton:setTopBottom( 0, 0, 242, 353 )
	DescInputButton:subscribeToGlobalModel( controller, "SelectedGroup", "description", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			DescInputButton.Text:setText( modelValue )
		end
	end )
	DescInputButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	DescInputButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( DescInputButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		EditSelectedGroupDescription( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( DescInputButton )
	self.DescInputButton = DescInputButton
	
	local EmblemButton = CoD.GroupsCreateButtonLG.new( menu, controller )
	EmblemButton:setLeftRight( 0, 0, 1, 578 )
	EmblemButton:setTopBottom( 0, 0, 433, 697 )
	EmblemButton.ImageText:setText( Engine.Localize( "" ) )
	EmblemButton:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ), function ( model )
		local element = EmblemButton
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	EmblemButton:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		local element = EmblemButton
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	EmblemButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
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
	menu:AddButtonCallbackFunction( EmblemButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
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
	
	local GroupEmblem = LUI.UIImage.new()
	GroupEmblem:setLeftRight( 0, 0, 202, 394 )
	GroupEmblem:setTopBottom( 0, 0, 467, 661 )
	GroupEmblem:subscribeToGlobalModel( controller, "SelectedGroup", "groupId", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GroupEmblem:setupGroupEmblem( modelValue )
		end
	end )
	self:addElement( GroupEmblem )
	self.GroupEmblem = GroupEmblem
	
	local ChallengesTitle0 = CoD.Challenges_Title.new( menu, controller )
	ChallengesTitle0:setLeftRight( 0, 0, 4, 300 )
	ChallengesTitle0:setTopBottom( 0, 0, 0, 49 )
	ChallengesTitle0.weaponNameLabel:setText( Engine.Localize( "GROUPS_EDIT_GROUP_MESSAGE" ) )
	self:addElement( ChallengesTitle0 )
	self.ChallengesTitle0 = ChallengesTitle0
	
	local ChallengesTitle00 = CoD.Challenges_Title.new( menu, controller )
	ChallengesTitle00:setLeftRight( 0, 0, 4, 300 )
	ChallengesTitle00:setTopBottom( 0, 0, 184, 232 )
	ChallengesTitle00.weaponNameLabel:setText( Engine.Localize( "GROUPS_EDIT_GROUP_DESCRIPTION" ) )
	self:addElement( ChallengesTitle00 )
	self.ChallengesTitle00 = ChallengesTitle00
	
	local ChallengesTitle000 = CoD.Challenges_Title.new( menu, controller )
	ChallengesTitle000:setLeftRight( 0, 0, 4, 300 )
	ChallengesTitle000:setTopBottom( 0, 0, 375, 423 )
	ChallengesTitle000.weaponNameLabel:setText( Engine.Localize( "GROUPS_EDIT_GROUP_EMBLEM" ) )
	self:addElement( ChallengesTitle000 )
	self.ChallengesTitle000 = ChallengesTitle000
	
	MsgInputButton.navigation = {
		down = DescInputButton
	}
	DescInputButton.navigation = {
		up = MsgInputButton,
		down = EmblemButton
	}
	EmblemButton.navigation = {
		up = DescInputButton
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	MsgInputButton.id = "MsgInputButton"
	DescInputButton.id = "DescInputButton"
	EmblemButton.id = "EmblemButton"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.MsgInputButton:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.MsgInputButton:close()
		self.DescInputButton:close()
		self.EmblemButton:close()
		self.ChallengesTitle0:close()
		self.ChallengesTitle00:close()
		self.ChallengesTitle000:close()
		self.GroupEmblem:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

