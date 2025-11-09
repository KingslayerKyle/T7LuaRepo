local PostLoadFunc = function ( self, controller, menu )
	self.SetupTeamSwitch = function ( f2_arg0, f2_arg1 )
		if f2_arg1 == Enum.team_t.TEAM_ALLIES then
			f2_arg0.TeamSwitchName:setText( Engine.Localize( "MPUI_ALLIES_CAPS" ) )
		elseif f2_arg1 == Enum.team_t.TEAM_AXIS then
			f2_arg0.TeamSwitchName:setText( Engine.Localize( "MPUI_AXIS_CAPS" ) )
		elseif f2_arg1 == Enum.team_t.TEAM_SPECTATOR then
			f2_arg0.TeamSwitchName:setText( Engine.Localize( "MPUI_SHOUTCASTER" ) )
		elseif f2_arg1 == Enum.team_t.TEAM_FREE then
			f2_arg0.TeamSwitchName:setText( Engine.Localize( "MPUI_AUTOASSIGN" ) )
		end
		f2_arg0:playClip( "TeamSwitch" )
	end
	
end

CoD.LobbyMemberTeamSwitcher = InheritFrom( LUI.UIElement )
CoD.LobbyMemberTeamSwitcher.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LobbyMemberTeamSwitcher )
	self.id = "LobbyMemberTeamSwitcher"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 163 )
	self:setTopBottom( true, false, 0, 25 )
	
	local spectatorColor = LUI.UIImage.new()
	spectatorColor:setLeftRight( false, true, -163, 0 )
	spectatorColor:setTopBottom( true, true, 0, 0 )
	spectatorColor:setRGB( 0.1, 0.1, 0.1 )
	spectatorColor:setAlpha( 0 )
	spectatorColor:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	spectatorColor:setShaderVector( 0, 0.02, 0.02, 0.02, 0.02 )
	self:addElement( spectatorColor )
	self.spectatorColor = spectatorColor
	
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
		local leftShoulderButtonImage = Engine.GetModelValue( model )
		if leftShoulderButtonImage then
			leftBumper:setImage( RegisterImage( leftShoulderButtonImage ) )
		end
	end )
	self:addElement( leftBumper )
	self.leftBumper = leftBumper
	
	local rightBumper = LUI.UIImage.new()
	rightBumper:setLeftRight( false, true, -31, -6 )
	rightBumper:setTopBottom( false, false, -9, 9 )
	rightBumper:setAlpha( 0 )
	rightBumper:subscribeToGlobalModel( controller, "Controller", "right_shoulder_button_image", function ( model )
		local rightShoulderButtonImage = Engine.GetModelValue( model )
		if rightShoulderButtonImage then
			rightBumper:setImage( RegisterImage( rightShoulderButtonImage ) )
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
				self:setupElementClipCounter( 4 )
				local spectatorColorFrame2 = function ( spectatorColor, event )
					local spectatorColorFrame3 = function ( spectatorColor, event )
						if not event.interrupted then
							spectatorColor:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						end
						spectatorColor:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( spectatorColor, event )
						else
							spectatorColor:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						spectatorColorFrame3( spectatorColor, event )
						return 
					else
						spectatorColor:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						spectatorColor:registerEventHandler( "transition_complete_keyframe", spectatorColorFrame3 )
					end
				end
				
				spectatorColor:completeAnimation()
				self.spectatorColor:setAlpha( 1 )
				spectatorColorFrame2( spectatorColor, {} )
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
				spectatorColor:completeAnimation()
				self.spectatorColor:setAlpha( 0 )
				self.clipFinished( spectatorColor, {} )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.leftBumper:close()
		element.rightBumper:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

