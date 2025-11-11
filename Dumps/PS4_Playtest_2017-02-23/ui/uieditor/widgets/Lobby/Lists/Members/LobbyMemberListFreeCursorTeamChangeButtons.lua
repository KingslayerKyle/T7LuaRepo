require( "ui.uieditor.widgets.Scrollbars.listCounterButton" )

CoD.LobbyMemberListFreeCursorTeamChangeButtons = InheritFrom( LUI.UIElement )
CoD.LobbyMemberListFreeCursorTeamChangeButtons.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LobbyMemberListFreeCursorTeamChangeButtons )
	self.id = "LobbyMemberListFreeCursorTeamChangeButtons"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 735 )
	self:setTopBottom( 0, 0, 0, 40 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local backing = LUI.UIImage.new()
	backing:setLeftRight( 0, 1, 90, -122 )
	backing:setTopBottom( 0, 0, 0, 40 )
	backing:setRGB( 0, 0, 0 )
	backing:setAlpha( 0.7 )
	self:addElement( backing )
	self.backing = backing
	
	local TextBox = LUI.UIText.new()
	TextBox:setLeftRight( 0, 1, 90, -122 )
	TextBox:setTopBottom( 0, 0, 2, 39 )
	TextBox:setText( Engine.Localize( "MPUI_CHANGE_ROLE" ) )
	TextBox:setTTF( "fonts/default.ttf" )
	TextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox )
	self.TextBox = TextBox
	
	local teamLeftButton = CoD.listCounterButton.new( menu, controller )
	teamLeftButton:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return not IsSelfInState( self, "Visible" )
			end
		}
	} )
	teamLeftButton:setLeftRight( 0.2, 0.2, 0, 36 )
	teamLeftButton:setTopBottom( 0.5, 0.5, -10, 10 )
	teamLeftButton:setZRot( 90 )
	teamLeftButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	teamLeftButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( teamLeftButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if IsInDefaultState( element ) then
			PlaySoundSetSound( self, "team_switch" )
			LobbyTeamSelectionLB( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsInDefaultState( element ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "", nil )
			return false
		else
			return false
		end
	end, false )
	self:addElement( teamLeftButton )
	self.teamLeftButton = teamLeftButton
	
	local teamRightButton = CoD.listCounterButton.new( menu, controller )
	teamRightButton:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return not IsSelfInState( self, "Visible" )
			end
		}
	} )
	teamRightButton:setLeftRight( 0.7, 0.7, -10, 26 )
	teamRightButton:setTopBottom( 0.5, 0.5, -10, 10 )
	teamRightButton:setZRot( 270 )
	teamRightButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	teamRightButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( teamRightButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if IsInDefaultState( element ) then
			LobbyTeamSelectionRB( self, element, controller )
			PlaySoundSetSound( self, "team_switch" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsInDefaultState( element ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "", nil )
			return false
		else
			return false
		end
	end, false )
	self:addElement( teamRightButton )
	self.teamRightButton = teamRightButton
	
	teamLeftButton.navigation = {
		right = teamRightButton
	}
	teamRightButton.navigation = {
		left = teamLeftButton
	}
	self.resetProperties = function ()
		TextBox:completeAnimation()
		backing:completeAnimation()
		teamLeftButton:completeAnimation()
		teamRightButton:completeAnimation()
		TextBox:setAlpha( 1 )
		backing:setAlpha( 0.7 )
		teamLeftButton:setAlpha( 1 )
		teamRightButton:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				backing:completeAnimation()
				self.backing:setAlpha( 0 )
				self.clipFinished( backing, {} )
				TextBox:completeAnimation()
				self.TextBox:setAlpha( 0 )
				self.clipFinished( TextBox, {} )
				teamLeftButton:completeAnimation()
				self.teamLeftButton:setAlpha( 0 )
				self.clipFinished( teamLeftButton, {} )
				teamRightButton:completeAnimation()
				self.teamRightButton:setAlpha( 0 )
				self.clipFinished( teamRightButton, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f17_local0 = IsLobbyWithTeamAssignment()
				if f17_local0 then
					if not IsTeamAssignment( LuaEnum.TEAM_ASSIGNMENT.HOST ) then
						f17_local0 = CanSwitchTeams()
						if f17_local0 then
							f17_local0 = IsFreeCursorPrototypeBuild( controller )
							if f17_local0 then
								f17_local0 = IsMultiplayer()
							end
						end
					else
						f17_local0 = false
					end
				end
				return f17_local0
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	if self.m_eventHandlers.update_team_selection_buttons then
		local currentEv = self.m_eventHandlers.update_team_selection_buttons
		self:registerEventHandler( "update_team_selection_buttons", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		self:registerEventHandler( "update_team_selection_buttons", LUI.UIElement.updateState )
	end
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "GametypeSettings.Update" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "GametypeSettings.Update"
		} )
	end )
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, state )
		if IsInDefaultState( self ) then
			CollapseFreeCursorElement( self )
			UpdateSelfElementState( menu, self.teamLeftButton, controller )
			UpdateSelfElementState( menu, self.teamRightButton, controller )
		else
			ExpandFreeCursorElement( self )
			UpdateSelfElementState( menu, self.teamLeftButton, controller )
			UpdateSelfElementState( menu, self.teamRightButton, controller )
		end
	end )
	teamLeftButton.id = "teamLeftButton"
	teamRightButton.id = "teamRightButton"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.teamLeftButton:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.teamLeftButton:close()
		self.teamRightButton:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

