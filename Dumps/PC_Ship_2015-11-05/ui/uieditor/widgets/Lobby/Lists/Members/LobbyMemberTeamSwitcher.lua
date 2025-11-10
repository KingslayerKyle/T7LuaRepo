require( "ui.uieditor.widgets.BumperButtonWithKeyMouse" )

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
	self.anyChildUsesUpdateState = true
	
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
	
	local BumperButtonWithKeyMouseLeft = CoD.BumperButtonWithKeyMouse.new( menu, controller )
	BumperButtonWithKeyMouseLeft:setLeftRight( true, false, 1.75, 43.25 )
	BumperButtonWithKeyMouseLeft:setTopBottom( true, false, -1, 27 )
	BumperButtonWithKeyMouseLeft:setAlpha( 0 )
	BumperButtonWithKeyMouseLeft:subscribeToGlobalModel( controller, "Controller", "left_shoulder_button_image", function ( model )
		local leftShoulderButtonImage = Engine.GetModelValue( model )
		if leftShoulderButtonImage then
			BumperButtonWithKeyMouseLeft.ControllerImage:setImage( RegisterImage( leftShoulderButtonImage ) )
		end
	end )
	BumperButtonWithKeyMouseLeft:registerEventHandler( "button_action", function ( element, event )
		local f5_local0 = nil
		SendButtonPressToMenuEx( menu, controller, Enum.LUIButton.LUI_KEY_LB )
		if not f5_local0 then
			f5_local0 = element:dispatchEventToChildren( event )
		end
		return f5_local0
	end )
	self:addElement( BumperButtonWithKeyMouseLeft )
	self.BumperButtonWithKeyMouseLeft = BumperButtonWithKeyMouseLeft
	
	local BumperButtonWithKeyMouseRight = CoD.BumperButtonWithKeyMouse.new( menu, controller )
	BumperButtonWithKeyMouseRight:setLeftRight( true, false, 123.75, 165.25 )
	BumperButtonWithKeyMouseRight:setTopBottom( true, false, -1, 27 )
	BumperButtonWithKeyMouseRight:setAlpha( 0 )
	BumperButtonWithKeyMouseRight.KeyMouseImage:setImage( RegisterImage( "uie_bumperright" ) )
	BumperButtonWithKeyMouseRight:subscribeToGlobalModel( controller, "Controller", "right_shoulder_button_image", function ( model )
		local rightShoulderButtonImage = Engine.GetModelValue( model )
		if rightShoulderButtonImage then
			BumperButtonWithKeyMouseRight.ControllerImage:setImage( RegisterImage( rightShoulderButtonImage ) )
		end
	end )
	BumperButtonWithKeyMouseRight:registerEventHandler( "button_action", function ( element, event )
		local f7_local0 = nil
		SendButtonPressToMenuEx( menu, controller, Enum.LUIButton.LUI_KEY_RB )
		if not f7_local0 then
			f7_local0 = element:dispatchEventToChildren( event )
		end
		return f7_local0
	end )
	self:addElement( BumperButtonWithKeyMouseRight )
	self.BumperButtonWithKeyMouseRight = BumperButtonWithKeyMouseRight
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				BumperButtonWithKeyMouseLeft:completeAnimation()
				self.BumperButtonWithKeyMouseLeft:setAlpha( 0 )
				self.clipFinished( BumperButtonWithKeyMouseLeft, {} )
				BumperButtonWithKeyMouseRight:completeAnimation()
				self.BumperButtonWithKeyMouseRight:setAlpha( 0 )
				self.clipFinished( BumperButtonWithKeyMouseRight, {} )
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
				local BumperButtonWithKeyMouseLeftFrame2 = function ( BumperButtonWithKeyMouseLeft, event )
					local BumperButtonWithKeyMouseLeftFrame3 = function ( BumperButtonWithKeyMouseLeft, event )
						if not event.interrupted then
							BumperButtonWithKeyMouseLeft:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						end
						BumperButtonWithKeyMouseLeft:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( BumperButtonWithKeyMouseLeft, event )
						else
							BumperButtonWithKeyMouseLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BumperButtonWithKeyMouseLeftFrame3( BumperButtonWithKeyMouseLeft, event )
						return 
					else
						BumperButtonWithKeyMouseLeft:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						BumperButtonWithKeyMouseLeft:registerEventHandler( "transition_complete_keyframe", BumperButtonWithKeyMouseLeftFrame3 )
					end
				end
				
				BumperButtonWithKeyMouseLeft:completeAnimation()
				self.BumperButtonWithKeyMouseLeft:setAlpha( 1 )
				BumperButtonWithKeyMouseLeftFrame2( BumperButtonWithKeyMouseLeft, {} )
				local BumperButtonWithKeyMouseRightFrame2 = function ( BumperButtonWithKeyMouseRight, event )
					local BumperButtonWithKeyMouseRightFrame3 = function ( BumperButtonWithKeyMouseRight, event )
						if not event.interrupted then
							BumperButtonWithKeyMouseRight:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						end
						BumperButtonWithKeyMouseRight:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( BumperButtonWithKeyMouseRight, event )
						else
							BumperButtonWithKeyMouseRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BumperButtonWithKeyMouseRightFrame3( BumperButtonWithKeyMouseRight, event )
						return 
					else
						BumperButtonWithKeyMouseRight:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						BumperButtonWithKeyMouseRight:registerEventHandler( "transition_complete_keyframe", BumperButtonWithKeyMouseRightFrame3 )
					end
				end
				
				BumperButtonWithKeyMouseRight:completeAnimation()
				self.BumperButtonWithKeyMouseRight:setAlpha( 1 )
				BumperButtonWithKeyMouseRightFrame2( BumperButtonWithKeyMouseRight, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				spectatorColor:completeAnimation()
				self.spectatorColor:setAlpha( 0 )
				self.clipFinished( spectatorColor, {} )
				TeamSwitchName:completeAnimation()
				self.TeamSwitchName:setAlpha( 0 )
				self.clipFinished( TeamSwitchName, {} )
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
		element.BumperButtonWithKeyMouseLeft:close()
		element.BumperButtonWithKeyMouseRight:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

