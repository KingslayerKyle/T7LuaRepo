require( "ui.uieditor.widgets.button" )
require( "ui.uieditor.menus.CAC.chooseClass" )
require( "ui.uieditor.widgets.PartyLobbyMembers" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.FriendsList.friendInfo" )

LUI.createMenu.uie_MainLobby = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "uie_MainLobby" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local title = LUI.UITightText.new()
	title:setLeftRight( true, false, 112, 346 )
	title:setTopBottom( true, false, 82, 144 )
	title:setRGB( 1, 1, 1 )
	title:setText( Engine.Localize( "MENU_MULTIPLAYER_CAPS" ) )
	title:setTTF( "fonts/default.ttf" )
	self:addElement( title )
	self.title = title
	
	local publicMatch = CoD.button.new( self, controller )
	publicMatch:setLeftRight( true, false, 112, 256 )
	publicMatch:setTopBottom( true, false, 160, 190 )
	publicMatch:setRGB( 1, 1, 1 )
	publicMatch.buttoninternal0.Text0:setText( Engine.Localize( "MENU_MATCHMAKING_CAPS" ) )
	self:addElement( publicMatch )
	self.publicMatch = publicMatch
	
	local leaguePlay = CoD.button.new( self, controller )
	leaguePlay:setLeftRight( true, false, 112, 256 )
	leaguePlay:setTopBottom( true, false, 192, 222 )
	leaguePlay:setRGB( 1, 1, 1 )
	leaguePlay.buttoninternal0.Text0:setText( Engine.Localize( "MENU_LEAGUE_PLAY_CAPS" ) )
	self:addElement( leaguePlay )
	self.leaguePlay = leaguePlay
	
	local customMatch = CoD.button.new( self, controller )
	customMatch:setLeftRight( true, false, 112, 256 )
	customMatch:setTopBottom( true, false, 224, 254 )
	customMatch:setRGB( 1, 1, 1 )
	customMatch.buttoninternal0.Text0:setText( Engine.Localize( "MPUI_CUSTOM_MATCH_CAPS" ) )
	self:addElement( customMatch )
	self.customMatch = customMatch
	
	local barracks = CoD.button.new( self, controller )
	barracks:setLeftRight( true, false, 112, 256 )
	barracks:setTopBottom( true, false, 256, 286 )
	barracks:setRGB( 1, 1, 1 )
	barracks.buttoninternal0.Text0:setText( Engine.Localize( "MENU_BARRACKS_CAPS" ) )
	self:addElement( barracks )
	self.barracks = barracks
	
	local cacButton = CoD.button.new( self, controller )
	cacButton:setLeftRight( true, false, 112, 256 )
	cacButton:setTopBottom( true, false, 286, 316 )
	cacButton:setRGB( 1, 1, 1 )
	cacButton.buttoninternal0.Text0:setText( Engine.Localize( "MENU_CREATE_A_CLASS_CAPS" ) )
	cacButton:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		NavigateToMenu( self, "chooseClass", true, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( cacButton )
	self.cacButton = cacButton
	
	local PartyLobbyMembers0 = CoD.PartyLobbyMembers.new( self, controller )
	PartyLobbyMembers0:setLeftRight( true, false, 810, 1171 )
	PartyLobbyMembers0:setTopBottom( true, false, 144, 620 )
	PartyLobbyMembers0:setRGB( 1, 1, 1 )
	self:addElement( PartyLobbyMembers0 )
	self.PartyLobbyMembers0 = PartyLobbyMembers0
	
	local friendInfo0 = CoD.friendInfo.new( self, controller )
	friendInfo0:setLeftRight( true, false, 1280, 1726 )
	friendInfo0:setTopBottom( true, false, 54, 454 )
	friendInfo0:setRGB( 1, 1, 1 )
	self:addElement( friendInfo0 )
	self.friendInfo0 = friendInfo0
	
	friendInfo0:linkToElementModel( PartyLobbyMembers0.List0, "rankIcon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			friendInfo0.emblem:setImage( RegisterImage( modelValue ) )
		end
	end )
	friendInfo0:linkToElementModel( PartyLobbyMembers0.List0, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			friendInfo0.Label0:setText( Engine.Localize( modelValue ) )
		end
	end )
	publicMatch.navigation = {
		right = PartyLobbyMembers0,
		down = leaguePlay
	}
	leaguePlay.navigation = {
		up = publicMatch,
		right = PartyLobbyMembers0,
		down = customMatch
	}
	customMatch.navigation = {
		up = leaguePlay,
		right = PartyLobbyMembers0,
		down = barracks
	}
	barracks.navigation = {
		up = customMatch,
		right = PartyLobbyMembers0,
		down = cacButton
	}
	cacButton.navigation = {
		up = barracks,
		right = PartyLobbyMembers0
	}
	PartyLobbyMembers0.navigation = {
		left = {
			publicMatch,
			leaguePlay,
			customMatch,
			barracks,
			cacButton
		}
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				title:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
				self.title:setLeftRight( true, false, 112, 373 )
				self.title:setTopBottom( true, false, 82, 144 )
				title:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				publicMatch:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
				self.publicMatch:setLeftRight( true, false, 112, 256 )
				self.publicMatch:setTopBottom( true, false, 160, 190 )
				publicMatch:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				leaguePlay:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
				self.leaguePlay:setLeftRight( true, false, 112, 256 )
				self.leaguePlay:setTopBottom( true, false, 192, 222 )
				leaguePlay:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				customMatch:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
				self.customMatch:setLeftRight( true, false, 112, 256 )
				self.customMatch:setTopBottom( true, false, 224, 254 )
				customMatch:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				barracks:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
				self.barracks:setLeftRight( true, false, 112, 256 )
				self.barracks:setTopBottom( true, false, 256, 286 )
				barracks:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				PartyLobbyMembers0:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
				self.PartyLobbyMembers0:setLeftRight( true, false, 810, 1171 )
				self.PartyLobbyMembers0:setTopBottom( true, false, 144, 620 )
				PartyLobbyMembers0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				friendInfo0:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
				self.friendInfo0:setLeftRight( false, true, 0, 446 )
				self.friendInfo0:setTopBottom( true, false, 54, 454 )
				friendInfo0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
			end,
			MovePanesToLeft = function ()
				self:setupElementClipCounter( 7 )
				title:beginAnimation( "keyframe", 270, true, true, CoD.TweenType.Linear )
				self.title:setLeftRight( true, false, -278, -17 )
				self.title:setTopBottom( true, false, 86, 148 )
				title:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				publicMatch:beginAnimation( "keyframe", 270, true, true, CoD.TweenType.Linear )
				self.publicMatch:setLeftRight( true, false, -278, -134 )
				self.publicMatch:setTopBottom( true, false, 168, 198 )
				publicMatch:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				leaguePlay:beginAnimation( "keyframe", 270, true, true, CoD.TweenType.Linear )
				self.leaguePlay:setLeftRight( true, false, -278, -134 )
				self.leaguePlay:setTopBottom( true, false, 198, 228 )
				leaguePlay:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				customMatch:beginAnimation( "keyframe", 270, true, true, CoD.TweenType.Linear )
				self.customMatch:setLeftRight( true, false, -278, -134 )
				self.customMatch:setTopBottom( true, false, 228, 258 )
				customMatch:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				barracks:beginAnimation( "keyframe", 270, true, true, CoD.TweenType.Linear )
				self.barracks:setLeftRight( true, false, -278, -134 )
				self.barracks:setTopBottom( true, false, 258, 288 )
				barracks:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				PartyLobbyMembers0:beginAnimation( "keyframe", 270, false, false, CoD.TweenType.Linear )
				self.PartyLobbyMembers0:setLeftRight( true, false, 108, 468 )
				self.PartyLobbyMembers0:setTopBottom( true, false, 148, 659 )
				PartyLobbyMembers0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				friendInfo0:beginAnimation( "keyframe", 270, false, false, CoD.TweenType.Linear )
				self.friendInfo0:setLeftRight( false, true, -596, -150 )
				self.friendInfo0:setTopBottom( true, false, 54, 454 )
				friendInfo0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
			end
		}
	}
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.right = function ( menu, element, event )
		return true
	end
	
	self.buttonPromptAddFunctions.left = function ( menu, element, event )
		return true
	end
	
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		return true
	end
	
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "right" or event.button == "key_shortcut" and event.key == "RIGHTARROW") then
			PlayClip( self, "MovePanesToLeft", controller )
		end
		if not self.occludedBy and (event.button == "left" or event.button == "key_shortcut" and event.key == "LEFTARROW") then
			PlayClip( self, "DefaultClip", controller )
		end
		if not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESCAPE") then
			SwitchToMainMenu( self, controller )
			GoBack( self, controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	publicMatch.id = "publicMatch"
	leaguePlay.id = "leaguePlay"
	customMatch.id = "customMatch"
	barracks.id = "barracks"
	cacButton.id = "cacButton"
	PartyLobbyMembers0.id = "PartyLobbyMembers0"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.publicMatch:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.publicMatch:close()
		self.leaguePlay:close()
		self.customMatch:close()
		self.barracks:close()
		self.cacButton:close()
		self.PartyLobbyMembers0:close()
		self.friendInfo0:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

