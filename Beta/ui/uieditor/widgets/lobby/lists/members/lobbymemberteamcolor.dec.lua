require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberTeamColorBackground" )

local PostLoadFunc = function ( self, controller, menu )
	self.SetupTeamSwitch = function ( self, team )
		if team == Enum.team_t.TEAM_ALLIES then
			self.TeamSwitchName:setText( Engine.Localize( "MPUI_ALLIES_CAPS" ) )
			self.TeamColorBackground:setState( "Allies" )
		elseif team == Enum.team_t.TEAM_AXIS then
			self.TeamSwitchName:setText( Engine.Localize( "MPUI_AXIS_CAPS" ) )
			self.TeamColorBackground:setState( "Axis" )
		elseif team == Enum.team_t.TEAM_SPECTATOR then
			self.TeamSwitchName:setText( Engine.Localize( "MPUI_SHOUTCASTER" ) )
			self.TeamColorBackground:setState( "Spectator" )
		elseif team == Enum.team_t.TEAM_FREE then
			self.TeamSwitchName:setText( Engine.Localize( "MPUI_AUTOASSIGN" ) )
		end
		self:playClip( "TeamSwitch" )
	end
	
	self.SetupTeamColorBackground = function ( self, team )
		self.TeamColorBackground:SetupTeamColors( team )
	end
	
end

CoD.LobbyMemberTeamColor = InheritFrom( LUI.UIElement )
CoD.LobbyMemberTeamColor.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LobbyMemberTeamColor )
	self.id = "LobbyMemberTeamColor"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 400 )
	self:setTopBottom( true, false, 0, 25 )
	self.anyChildUsesUpdateState = true
	
	local FEButtonPanelShaderContainer0 = CoD.FE_ButtonPanelShaderContainer.new( menu, controller )
	FEButtonPanelShaderContainer0:setLeftRight( true, true, 0, 0 )
	FEButtonPanelShaderContainer0:setTopBottom( true, true, 0, 0 )
	FEButtonPanelShaderContainer0:setAlpha( 0 )
	self:addElement( FEButtonPanelShaderContainer0 )
	self.FEButtonPanelShaderContainer0 = FEButtonPanelShaderContainer0
	
	local TeamColorBackground = CoD.LobbyMemberTeamColorBackground.new( menu, controller )
	TeamColorBackground:setLeftRight( true, true, 0, 0 )
	TeamColorBackground:setTopBottom( true, true, 0, 0 )
	TeamColorBackground:linkToElementModel( self, nil, false, function ( model )
		TeamColorBackground:setModel( model, controller )
	end )
	TeamColorBackground:mergeStateConditions( {
		{
			stateName = "Axis",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "teamSwitch", Enum.team_t.TEAM_AXIS )
			end
		},
		{
			stateName = "Allies",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "teamSwitch", Enum.team_t.TEAM_ALLIES )
			end
		},
		{
			stateName = "Spectator",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "teamSwitch", Enum.team_t.TEAM_SPECTATOR )
			end
		}
	} )
	TeamColorBackground:linkToElementModel( "teamSwitch", true, function ( model )
		menu:updateElementState( TeamColorBackground, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "teamSwitch"
		} )
	end )
	self:addElement( TeamColorBackground )
	self.TeamColorBackground = TeamColorBackground
	
	local TeamSwitchName = LUI.UIText.new()
	TeamSwitchName:setLeftRight( false, true, -128, -31 )
	TeamSwitchName:setTopBottom( false, false, -9, 11 )
	TeamSwitchName:setAlpha( 0 )
	TeamSwitchName:setText( Engine.Localize( "" ) )
	TeamSwitchName:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TeamSwitchName:setLetterSpacing( 0.5 )
	TeamSwitchName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TeamSwitchName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TeamSwitchName )
	self.TeamSwitchName = TeamSwitchName
	
	local leftBumper = LUI.UIImage.new()
	leftBumper:setLeftRight( false, true, -153, -128 )
	leftBumper:setTopBottom( false, false, -9, 9 )
	leftBumper:setAlpha( 0 )
	leftBumper:subscribeToGlobalModel( controller, "Controller", "left_shoulder_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			leftBumper:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( leftBumper )
	self.leftBumper = leftBumper
	
	local rightBumper = LUI.UIImage.new()
	rightBumper:setLeftRight( false, true, -31, -6 )
	rightBumper:setTopBottom( false, false, -9, 9 )
	rightBumper:setAlpha( 0 )
	rightBumper:subscribeToGlobalModel( controller, "Controller", "right_shoulder_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rightBumper:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( rightBumper )
	self.rightBumper = rightBumper
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			TeamSwitch = function ()
				self:setupElementClipCounter( 3 )
				local TeamSwitchNameFrame2 = function ( TeamSwitchName, event )
					local TeamSwitchNameFrame3 = function ( TeamSwitchName, event )
						if not event.interrupted then
							TeamSwitchName:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						end
						TeamSwitchName:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( TeamSwitchName, event )
						else
							TeamSwitchName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						TeamSwitchNameFrame3( TeamSwitchName, event )
						return 
					else
						TeamSwitchName:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						TeamSwitchName:registerEventHandler( "transition_complete_keyframe", TeamSwitchNameFrame3 )
					end
				end
				
				TeamSwitchName:completeAnimation()
				self.TeamSwitchName:setAlpha( 1 )
				TeamSwitchNameFrame2( TeamSwitchName, {} )
				local leftBumperFrame2 = function ( leftBumper, event )
					local leftBumperFrame3 = function ( leftBumper, event )
						if not event.interrupted then
							leftBumper:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						end
						leftBumper:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( leftBumper, event )
						else
							leftBumper:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						leftBumperFrame3( leftBumper, event )
						return 
					else
						leftBumper:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						leftBumper:registerEventHandler( "transition_complete_keyframe", leftBumperFrame3 )
					end
				end
				
				leftBumper:completeAnimation()
				self.leftBumper:setAlpha( 1 )
				leftBumperFrame2( leftBumper, {} )
				local rightBumperFrame2 = function ( rightBumper, event )
					local rightBumperFrame3 = function ( rightBumper, event )
						if not event.interrupted then
							rightBumper:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						end
						rightBumper:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( rightBumper, event )
						else
							rightBumper:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						rightBumperFrame3( rightBumper, event )
						return 
					else
						rightBumper:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						rightBumper:registerEventHandler( "transition_complete_keyframe", rightBumperFrame3 )
					end
				end
				
				rightBumper:completeAnimation()
				self.rightBumper:setAlpha( 1 )
				rightBumperFrame2( rightBumper, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				TeamColorBackground:completeAnimation()
				self.TeamColorBackground:setAlpha( 0 )
				self.clipFinished( TeamColorBackground, {} )
				TeamSwitchName:completeAnimation()
				self.TeamSwitchName:setAlpha( 0 )
				self.clipFinished( TeamSwitchName, {} )
				leftBumper:completeAnimation()
				self.leftBumper:setAlpha( 0 )
				self.clipFinished( leftBumper, {} )
				rightBumper:completeAnimation()
				self.rightBumper:setAlpha( 0 )
				self.clipFinished( rightBumper, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return not IsGameLobby()
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FEButtonPanelShaderContainer0:close()
		self.TeamColorBackground:close()
		self.leftBumper:close()
		self.rightBumper:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

