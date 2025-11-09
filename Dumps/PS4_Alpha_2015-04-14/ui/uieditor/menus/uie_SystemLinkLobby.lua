require( "ui.uieditor.widgets.button" )
require( "ui.uieditor.widgets.PartyLobbyMembers" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.FriendsList.friendInfo" )

LUI.createMenu.uie_SystemLinkLobby = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "uie_SystemLinkLobby" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local Title = LUI.UITightText.new()
	Title:setLeftRight( true, false, 112, 337 )
	Title:setTopBottom( true, false, 82, 144 )
	Title:setRGB( 1, 1, 1 )
	Title:setText( Engine.Localize( "PLATFORM_SYSTEM_LINK_CAPS" ) )
	Title:setTTF( "fonts/default.ttf" )
	self:addElement( Title )
	self.Title = Title
	
	local StartMatchButton = CoD.button.new( self, controller )
	StartMatchButton:setLeftRight( true, false, 112, 256 )
	StartMatchButton:setTopBottom( true, false, 160, 190 )
	StartMatchButton:setRGB( 1, 1, 1 )
	StartMatchButton.buttoninternal0.Text0:setText( Engine.Localize( "MPUI_START_MATCH_CAPS" ) )
	StartMatchButton:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		StartGame( self, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( StartMatchButton )
	self.StartMatchButton = StartMatchButton
	
	local LobbyMembers = CoD.PartyLobbyMembers.new( self, controller )
	LobbyMembers:setLeftRight( true, false, 810, 1171 )
	LobbyMembers:setTopBottom( true, false, 144, 620 )
	LobbyMembers:setRGB( 1, 1, 1 )
	self:addElement( LobbyMembers )
	self.LobbyMembers = LobbyMembers
	
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
	StartMatchButton.navigation = {
		right = LobbyMembers
	}
	LobbyMembers.navigation = {
		left = StartMatchButton
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				Title:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
				self.Title:setLeftRight( true, false, 112, 373 )
				self.Title:setTopBottom( true, false, 82, 144 )
				Title:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				StartMatchButton:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
				self.StartMatchButton:setLeftRight( true, false, 112, 256 )
				self.StartMatchButton:setTopBottom( true, false, 160, 190 )
				StartMatchButton:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				LobbyMembers:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
				self.LobbyMembers:setLeftRight( true, false, 810, 1171 )
				self.LobbyMembers:setTopBottom( true, false, 144, 620 )
				LobbyMembers:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				friendInfo0:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
				self.friendInfo0:setLeftRight( false, true, 0, 446 )
				self.friendInfo0:setTopBottom( true, false, 54, 454 )
				friendInfo0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
			end,
			MovePanesToLeft = function ()
				self:setupElementClipCounter( 4 )
				Title:beginAnimation( "keyframe", 270, true, true, CoD.TweenType.Linear )
				self.Title:setLeftRight( true, false, -278, -17 )
				self.Title:setTopBottom( true, false, 86, 148 )
				Title:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				StartMatchButton:beginAnimation( "keyframe", 270, true, true, CoD.TweenType.Linear )
				self.StartMatchButton:setLeftRight( true, false, -278, -134 )
				self.StartMatchButton:setTopBottom( true, false, 168, 198 )
				StartMatchButton:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				LobbyMembers:beginAnimation( "keyframe", 270, false, false, CoD.TweenType.Linear )
				self.LobbyMembers:setLeftRight( true, false, 108, 468 )
				self.LobbyMembers:setTopBottom( true, false, 148, 659 )
				LobbyMembers:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				friendInfo0:beginAnimation( "keyframe", 270, false, false, CoD.TweenType.Linear )
				self.friendInfo0:setLeftRight( false, true, -596, -150 )
				self.friendInfo0:setTopBottom( true, false, 54, 454 )
				friendInfo0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
			end
		}
	}
	StartMatchButton.id = "StartMatchButton"
	LobbyMembers.id = "LobbyMembers"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.StartMatchButton:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.StartMatchButton:close()
		self.LobbyMembers:close()
		self.friendInfo0:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

