require( "ui.uieditor.widgets.Lobby.Common.FE_ListSubHeader" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMember" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ListAdditonal" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ListHeaderFull" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberQuickJoin" )

local UpdateFocusState = function ( self, controller, menu )
	if self.currentState == "ShowQuickJoin" then
		self.friendsAndGroups:makeFocusableWithoutResettingNavigation()
	else
		self.friendsAndGroups:makeNotFocusable()
	end
end

local PostLoadFunc = function ( self, controller, menu )
	UpdateFocusState( self, controller, menu )
	if self.lobbyNavSubscription then
		self:removeSubscription( self.lobbyNavSubscription )
	end
	self.lobbyNavSubscription = self:subscribeToModel( LobbyData.GetLobbyNavModel(), function ()
		UpdateFocusState( self, controller, menu )
	end, false )
end

CoD.LobbyList = InheritFrom( LUI.UIElement )
CoD.LobbyList.new = function ( menu, controller )
	local self = LUI.UIVerticalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 0
	} )
	self:setAlignment( LUI.Alignment.Top )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LobbyList )
	self.id = "LobbyList"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 490 )
	self:setTopBottom( true, false, 0, 1018 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local FEListSubHeader1 = CoD.FE_ListSubHeader.new( menu, controller )
	FEListSubHeader1:setLeftRight( true, false, 0, 490 )
	FEListSubHeader1:setTopBottom( true, false, 0, 27 )
	FEListSubHeader1:setRGB( 1, 1, 1 )
	FEListSubHeader1:setAlpha( 0.72 )
	FEListSubHeader1.StringA:setText( Engine.Localize( "MENU_LOBBY_LIST_PLAYER_COUNT" ) )
	FEListSubHeader1:mergeStateConditions( {
		{
			stateName = "PlayerCountState",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( FEListSubHeader1 )
	self.FEListSubHeader1 = FEListSubHeader1
	
	local lobbyList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	lobbyList:makeFocusable()
	lobbyList:setLeftRight( true, false, 0, 490 )
	lobbyList:setTopBottom( true, false, 27, 547 )
	lobbyList:setRGB( 1, 1, 1 )
	lobbyList:setDataSource( "LobbyList" )
	lobbyList:setWidgetType( CoD.LobbyMember )
	lobbyList:setVerticalCount( 18 )
	lobbyList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		CopyModelFindElement( menu, element, "SelectedPlayerInfo" )
		return retVal
	end )
	lobbyList:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		PlayClipOnListItemElement( self, element, controller, "Intro" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( lobbyList )
	self.lobbyList = lobbyList
	
	local FEListAdditonal0 = CoD.FE_ListAdditonal.new( menu, controller )
	FEListAdditonal0:setLeftRight( true, false, 0, 490 )
	FEListAdditonal0:setTopBottom( true, false, 547, 584 )
	FEListAdditonal0:setRGB( 1, 1, 1 )
	FEListAdditonal0.StringA:setText( Engine.Localize( "PLATFORM_FEEDER_SECONDARY_CONTROLLER_PLUGIN" ) )
	self:addElement( FEListAdditonal0 )
	self.FEListAdditonal0 = FEListAdditonal0
	
	local spacer = LUI.UIImage.new()
	spacer:setLeftRight( true, false, 0, 77.37 )
	spacer:setTopBottom( true, false, 584, 596.5 )
	spacer:setRGB( 1, 1, 1 )
	spacer:setAlpha( 0 )
	spacer:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	spacer:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		PlayClip( self, "Intro", controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( spacer )
	self.spacer = spacer
	
	local FEListHeaderFull0 = CoD.FE_ListHeaderFull.new( menu, controller )
	FEListHeaderFull0:setLeftRight( true, false, 0, 490 )
	FEListHeaderFull0:setTopBottom( true, false, 596.5, 625.5 )
	FEListHeaderFull0:setRGB( 1, 1, 1 )
	self:addElement( FEListHeaderFull0 )
	self.FEListHeaderFull0 = FEListHeaderFull0
	
	local FEListSubHeader0 = CoD.FE_ListSubHeader.new( menu, controller )
	FEListSubHeader0:setLeftRight( true, false, 0, 490 )
	FEListSubHeader0:setTopBottom( true, false, 625.5, 652.5 )
	FEListSubHeader0:setRGB( 1, 1, 1 )
	FEListSubHeader0.StringA:setText( Engine.Localize( "MENU_LOBBY_PLAYERCOUNT" ) )
	FEListSubHeader0:mergeStateConditions( {
		{
			stateName = "PlayerCountState",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "GroupCountState",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( FEListSubHeader0 )
	self.FEListSubHeader0 = FEListSubHeader0
	
	local friendsAndGroups = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	friendsAndGroups:makeFocusable()
	friendsAndGroups:setLeftRight( true, false, 0, 490 )
	friendsAndGroups:setTopBottom( true, false, 652.5, 1027.5 )
	friendsAndGroups:setRGB( 1, 1, 1 )
	friendsAndGroups:setDataSource( "LobbyFriendsAndGroups" )
	friendsAndGroups:setWidgetType( CoD.LobbyMemberQuickJoin )
	friendsAndGroups:setVerticalCount( 13 )
	friendsAndGroups.buttonPromptAddFunctions = {}
	friendsAndGroups.buttonPromptAddFunctions.alt1 = function ( menu, element, event )
		if element:isInFocus() and IsPlayerJoinable( element ) then
			menu:addButtonPrompt( "alt1", Engine.Localize( "MENU_JOIN" ), "A", element )
			return true
		else
			
		end
	end
	
	friendsAndGroups:linkToElementModel( friendsAndGroups, "isJoinable", true, function ( model )
		local element = friendsAndGroups
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isJoinable"
		}
		if not element.buttonPromptAddFunctions.alt1( menu, element, event ) then
			menu:removeButtonPrompt( "alt1", element )
		end
	end )
	friendsAndGroups:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "alt1" or event.button == "key_shortcut" and event.key == "A") and element:isInFocus() then
			if IsPlayerJoinable( element ) then
				LobbyQuickJoin( self, element, controller, Enum.JoinType.JOIN_TYPE_FRIEND, false )
			end
			return true
		elseif not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	friendsAndGroups:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		CopyModelFindElement( menu, element, "SelectedPlayerInfo" )
		return retVal
	end )
	friendsAndGroups:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		PlayClipOnListItemElement( self, element, controller, "Intro" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	friendsAndGroups:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		element.buttonPromptAddFunctions.alt1( menu, element, event )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return true
	end )
	friendsAndGroups:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		menu:removeButtonPrompt( "alt1", element )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	friendsAndGroups:updateButtonPromptEventHandlers()
	friendsAndGroups:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				local f18_local0
				if not IsCurrentMenu( menu, "ModeSelect" ) then
					f18_local0 = AlwaysFalse()
				else
					f18_local0 = false
				end
				return f18_local0
			end
		}
	} )
	self:addElement( friendsAndGroups )
	self.friendsAndGroups = friendsAndGroups
	
	lobbyList.navigation = {
		down = friendsAndGroups
	}
	friendsAndGroups.navigation = {
		up = lobbyList
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				FEListSubHeader1:completeAnimation()
				self.FEListSubHeader1:setAlpha( 1 )
				self.clipFinished( FEListSubHeader1, {} )
				lobbyList:completeAnimation()
				self.lobbyList:setAlpha( 1 )
				self.clipFinished( lobbyList, {} )
				FEListAdditonal0:completeAnimation()
				self.FEListAdditonal0:setAlpha( 1 )
				self.FEListAdditonal0:setZoom( 0 )
				self.clipFinished( FEListAdditonal0, {} )
				FEListHeaderFull0:completeAnimation()
				self.FEListHeaderFull0:setAlpha( 0 )
				self.clipFinished( FEListHeaderFull0, {} )
				FEListSubHeader0:completeAnimation()
				self.FEListSubHeader0:setAlpha( 0 )
				self.clipFinished( FEListSubHeader0, {} )
				friendsAndGroups:completeAnimation()
				self.friendsAndGroups:setAlpha( 0 )
				self.clipFinished( friendsAndGroups, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )
			end,
			ShowQuickJoin = function ()
				self:setupElementClipCounter( 6 )
				FEListSubHeader1:completeAnimation()
				self.FEListSubHeader1:setAlpha( 1 )
				self.clipFinished( FEListSubHeader1, {} )
				lobbyList:completeAnimation()
				self.lobbyList:setAlpha( 1 )
				self.clipFinished( lobbyList, {} )
				FEListAdditonal0:completeAnimation()
				self.FEListAdditonal0:setAlpha( 1 )
				self.FEListAdditonal0:setZoom( 0 )
				self.clipFinished( FEListAdditonal0, {} )
				local FEListHeaderFull0Frame2 = function ( FEListHeaderFull0, event )
					if not event.interrupted then
						FEListHeaderFull0:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Bounce )
					end
					FEListHeaderFull0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FEListHeaderFull0, event )
					else
						FEListHeaderFull0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEListHeaderFull0:completeAnimation()
				self.FEListHeaderFull0:setAlpha( 0 )
				FEListHeaderFull0Frame2( FEListHeaderFull0, {} )
				local FEListSubHeader0Frame2 = function ( FEListSubHeader0, event )
					local FEListSubHeader0Frame3 = function ( FEListSubHeader0, event )
						if not event.interrupted then
							FEListSubHeader0:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Bounce )
						end
						FEListSubHeader0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( FEListSubHeader0, event )
						else
							FEListSubHeader0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FEListSubHeader0Frame3( FEListSubHeader0, event )
						return 
					else
						FEListSubHeader0:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						FEListSubHeader0:registerEventHandler( "transition_complete_keyframe", FEListSubHeader0Frame3 )
					end
				end
				
				FEListSubHeader0:completeAnimation()
				self.FEListSubHeader0:setAlpha( 0 )
				FEListSubHeader0Frame2( FEListSubHeader0, {} )
				local friendsAndGroupsFrame2 = function ( friendsAndGroups, event )
					local friendsAndGroupsFrame3 = function ( friendsAndGroups, event )
						if not event.interrupted then
							friendsAndGroups:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Bounce )
						end
						friendsAndGroups:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( friendsAndGroups, event )
						else
							friendsAndGroups:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						friendsAndGroupsFrame3( friendsAndGroups, event )
						return 
					else
						friendsAndGroups:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
						friendsAndGroups:registerEventHandler( "transition_complete_keyframe", friendsAndGroupsFrame3 )
					end
				end
				
				friendsAndGroups:completeAnimation()
				self.friendsAndGroups:setAlpha( 0 )
				friendsAndGroupsFrame2( friendsAndGroups, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 6 )
				local FEListSubHeader1Frame2 = function ( FEListSubHeader1, event )
					local FEListSubHeader1Frame3 = function ( FEListSubHeader1, event )
						if not event.interrupted then
							FEListSubHeader1:beginAnimation( "keyframe", 420, false, false, CoD.TweenType.Bounce )
						end
						FEListSubHeader1:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( FEListSubHeader1, event )
						else
							FEListSubHeader1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FEListSubHeader1Frame3( FEListSubHeader1, event )
						return 
					else
						FEListSubHeader1:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
						FEListSubHeader1:registerEventHandler( "transition_complete_keyframe", FEListSubHeader1Frame3 )
					end
				end
				
				FEListSubHeader1:completeAnimation()
				self.FEListSubHeader1:setAlpha( 0 )
				FEListSubHeader1Frame2( FEListSubHeader1, {} )
				local lobbyListFrame2 = function ( lobbyList, event )
					local lobbyListFrame3 = function ( lobbyList, event )
						local lobbyListFrame4 = function ( lobbyList, event )
							if not event.interrupted then
								lobbyList:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Bounce )
							end
							lobbyList:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( lobbyList, event )
							else
								lobbyList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							lobbyListFrame4( lobbyList, event )
							return 
						else
							lobbyList:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
							lobbyList:registerEventHandler( "transition_complete_keyframe", lobbyListFrame4 )
						end
					end
					
					if event.interrupted then
						lobbyListFrame3( lobbyList, event )
						return 
					else
						lobbyList:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
						lobbyList:registerEventHandler( "transition_complete_keyframe", lobbyListFrame3 )
					end
				end
				
				lobbyList:completeAnimation()
				self.lobbyList:setAlpha( 0 )
				lobbyListFrame2( lobbyList, {} )
				local FEListAdditonal0Frame2 = function ( FEListAdditonal0, event )
					local FEListAdditonal0Frame3 = function ( FEListAdditonal0, event )
						local FEListAdditonal0Frame4 = function ( FEListAdditonal0, event )
							if not event.interrupted then
								FEListAdditonal0:beginAnimation( "keyframe", 410, false, false, CoD.TweenType.Bounce )
							end
							FEListAdditonal0:setAlpha( 1 )
							FEListAdditonal0:setZoom( 0 )
							if event.interrupted then
								self.clipFinished( FEListAdditonal0, event )
							else
								FEListAdditonal0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							FEListAdditonal0Frame4( FEListAdditonal0, event )
							return 
						else
							FEListAdditonal0:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
							FEListAdditonal0:registerEventHandler( "transition_complete_keyframe", FEListAdditonal0Frame4 )
						end
					end
					
					if event.interrupted then
						FEListAdditonal0Frame3( FEListAdditonal0, event )
						return 
					else
						FEListAdditonal0:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
						FEListAdditonal0:registerEventHandler( "transition_complete_keyframe", FEListAdditonal0Frame3 )
					end
				end
				
				FEListAdditonal0:completeAnimation()
				self.FEListAdditonal0:setAlpha( 0 )
				self.FEListAdditonal0:setZoom( 0 )
				FEListAdditonal0Frame2( FEListAdditonal0, {} )
				FEListHeaderFull0:completeAnimation()
				self.FEListHeaderFull0:setAlpha( 0 )
				self.clipFinished( FEListHeaderFull0, {} )
				FEListSubHeader0:completeAnimation()
				self.FEListSubHeader0:setAlpha( 0 )
				self.clipFinished( FEListSubHeader0, {} )
				friendsAndGroups:completeAnimation()
				self.friendsAndGroups:setAlpha( 0 )
				self.clipFinished( friendsAndGroups, {} )
			end,
			Update = function ()
				self:setupElementClipCounter( 6 )
				local FEListSubHeader1Frame2 = function ( FEListSubHeader1, event )
					local FEListSubHeader1Frame3 = function ( FEListSubHeader1, event )
						local FEListSubHeader1Frame4 = function ( FEListSubHeader1, event )
							if not event.interrupted then
								FEListSubHeader1:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Bounce )
							end
							FEListSubHeader1:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( FEListSubHeader1, event )
							else
								FEListSubHeader1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							FEListSubHeader1Frame4( FEListSubHeader1, event )
							return 
						else
							FEListSubHeader1:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Bounce )
							FEListSubHeader1:setAlpha( 0.32 )
							FEListSubHeader1:registerEventHandler( "transition_complete_keyframe", FEListSubHeader1Frame4 )
						end
					end
					
					if event.interrupted then
						FEListSubHeader1Frame3( FEListSubHeader1, event )
						return 
					else
						FEListSubHeader1:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						FEListSubHeader1:registerEventHandler( "transition_complete_keyframe", FEListSubHeader1Frame3 )
					end
				end
				
				FEListSubHeader1:completeAnimation()
				self.FEListSubHeader1:setAlpha( 1 )
				FEListSubHeader1Frame2( FEListSubHeader1, {} )
				local lobbyListFrame2 = function ( lobbyList, event )
					local lobbyListFrame3 = function ( lobbyList, event )
						local lobbyListFrame4 = function ( lobbyList, event )
							if not event.interrupted then
								lobbyList:beginAnimation( "keyframe", 179, false, false, CoD.TweenType.Bounce )
							end
							lobbyList:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( lobbyList, event )
							else
								lobbyList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							lobbyListFrame4( lobbyList, event )
							return 
						else
							lobbyList:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Bounce )
							lobbyList:setAlpha( 0.44 )
							lobbyList:registerEventHandler( "transition_complete_keyframe", lobbyListFrame4 )
						end
					end
					
					if event.interrupted then
						lobbyListFrame3( lobbyList, event )
						return 
					else
						lobbyList:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						lobbyList:registerEventHandler( "transition_complete_keyframe", lobbyListFrame3 )
					end
				end
				
				lobbyList:completeAnimation()
				self.lobbyList:setAlpha( 1 )
				lobbyListFrame2( lobbyList, {} )
				local FEListAdditonal0Frame2 = function ( FEListAdditonal0, event )
					local FEListAdditonal0Frame3 = function ( FEListAdditonal0, event )
						if not event.interrupted then
							FEListAdditonal0:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Bounce )
						end
						FEListAdditonal0:setAlpha( 1 )
						FEListAdditonal0:setZoom( 0 )
						if event.interrupted then
							self.clipFinished( FEListAdditonal0, event )
						else
							FEListAdditonal0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FEListAdditonal0Frame3( FEListAdditonal0, event )
						return 
					else
						FEListAdditonal0:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Bounce )
						FEListAdditonal0:registerEventHandler( "transition_complete_keyframe", FEListAdditonal0Frame3 )
					end
				end
				
				FEListAdditonal0:completeAnimation()
				self.FEListAdditonal0:setAlpha( 1 )
				self.FEListAdditonal0:setZoom( 0 )
				FEListAdditonal0Frame2( FEListAdditonal0, {} )
				FEListHeaderFull0:completeAnimation()
				self.FEListHeaderFull0:setAlpha( 0 )
				self.clipFinished( FEListHeaderFull0, {} )
				FEListSubHeader0:completeAnimation()
				self.FEListSubHeader0:setAlpha( 0 )
				self.clipFinished( FEListSubHeader0, {} )
				friendsAndGroups:completeAnimation()
				self.friendsAndGroups:setAlpha( 0 )
				self.clipFinished( friendsAndGroups, {} )
			end
		},
		ShowQuickJoin = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				FEListSubHeader1:completeAnimation()
				self.FEListSubHeader1:setAlpha( 1 )
				self.clipFinished( FEListSubHeader1, {} )
				lobbyList:completeAnimation()
				self.lobbyList:setAlpha( 1 )
				self.clipFinished( lobbyList, {} )
				FEListAdditonal0:completeAnimation()
				self.FEListAdditonal0:setAlpha( 1 )
				self.clipFinished( FEListAdditonal0, {} )
				FEListHeaderFull0:completeAnimation()
				self.FEListHeaderFull0:setAlpha( 1 )
				self.clipFinished( FEListHeaderFull0, {} )
				FEListSubHeader0:completeAnimation()
				self.FEListSubHeader0:setAlpha( 1 )
				self.clipFinished( FEListSubHeader0, {} )
				friendsAndGroups:completeAnimation()
				self.friendsAndGroups:setAlpha( 1 )
				self.clipFinished( friendsAndGroups, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )
			end,
			Intro = function ()
				self:setupElementClipCounter( 6 )
				local FEListSubHeader1Frame2 = function ( FEListSubHeader1, event )
					local FEListSubHeader1Frame3 = function ( FEListSubHeader1, event )
						if not event.interrupted then
							FEListSubHeader1:beginAnimation( "keyframe", 420, false, false, CoD.TweenType.Bounce )
						end
						FEListSubHeader1:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( FEListSubHeader1, event )
						else
							FEListSubHeader1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FEListSubHeader1Frame3( FEListSubHeader1, event )
						return 
					else
						FEListSubHeader1:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						FEListSubHeader1:registerEventHandler( "transition_complete_keyframe", FEListSubHeader1Frame3 )
					end
				end
				
				FEListSubHeader1:completeAnimation()
				self.FEListSubHeader1:setAlpha( 0 )
				FEListSubHeader1Frame2( FEListSubHeader1, {} )
				local lobbyListFrame2 = function ( lobbyList, event )
					local lobbyListFrame3 = function ( lobbyList, event )
						local lobbyListFrame4 = function ( lobbyList, event )
							if not event.interrupted then
								lobbyList:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Bounce )
							end
							lobbyList:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( lobbyList, event )
							else
								lobbyList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							lobbyListFrame4( lobbyList, event )
							return 
						else
							lobbyList:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
							lobbyList:registerEventHandler( "transition_complete_keyframe", lobbyListFrame4 )
						end
					end
					
					if event.interrupted then
						lobbyListFrame3( lobbyList, event )
						return 
					else
						lobbyList:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						lobbyList:registerEventHandler( "transition_complete_keyframe", lobbyListFrame3 )
					end
				end
				
				lobbyList:completeAnimation()
				self.lobbyList:setAlpha( 0 )
				lobbyListFrame2( lobbyList, {} )
				local FEListAdditonal0Frame2 = function ( FEListAdditonal0, event )
					local FEListAdditonal0Frame3 = function ( FEListAdditonal0, event )
						local FEListAdditonal0Frame4 = function ( FEListAdditonal0, event )
							local FEListAdditonal0Frame5 = function ( FEListAdditonal0, event )
								if not event.interrupted then
									FEListAdditonal0:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Bounce )
								end
								FEListAdditonal0:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( FEListAdditonal0, event )
								else
									FEListAdditonal0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								FEListAdditonal0Frame5( FEListAdditonal0, event )
								return 
							else
								FEListAdditonal0:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
								FEListAdditonal0:registerEventHandler( "transition_complete_keyframe", FEListAdditonal0Frame5 )
							end
						end
						
						if event.interrupted then
							FEListAdditonal0Frame4( FEListAdditonal0, event )
							return 
						else
							FEListAdditonal0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							FEListAdditonal0:registerEventHandler( "transition_complete_keyframe", FEListAdditonal0Frame4 )
						end
					end
					
					if event.interrupted then
						FEListAdditonal0Frame3( FEListAdditonal0, event )
						return 
					else
						FEListAdditonal0:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						FEListAdditonal0:registerEventHandler( "transition_complete_keyframe", FEListAdditonal0Frame3 )
					end
				end
				
				FEListAdditonal0:completeAnimation()
				self.FEListAdditonal0:setAlpha( 0 )
				FEListAdditonal0Frame2( FEListAdditonal0, {} )
				local FEListHeaderFull0Frame2 = function ( FEListHeaderFull0, event )
					local FEListHeaderFull0Frame3 = function ( FEListHeaderFull0, event )
						local FEListHeaderFull0Frame4 = function ( FEListHeaderFull0, event )
							if not event.interrupted then
								FEListHeaderFull0:beginAnimation( "keyframe", 420, false, false, CoD.TweenType.Bounce )
							end
							FEListHeaderFull0:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( FEListHeaderFull0, event )
							else
								FEListHeaderFull0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							FEListHeaderFull0Frame4( FEListHeaderFull0, event )
							return 
						else
							FEListHeaderFull0:beginAnimation( "keyframe", 399, false, false, CoD.TweenType.Linear )
							FEListHeaderFull0:registerEventHandler( "transition_complete_keyframe", FEListHeaderFull0Frame4 )
						end
					end
					
					if event.interrupted then
						FEListHeaderFull0Frame3( FEListHeaderFull0, event )
						return 
					else
						FEListHeaderFull0:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						FEListHeaderFull0:registerEventHandler( "transition_complete_keyframe", FEListHeaderFull0Frame3 )
					end
				end
				
				FEListHeaderFull0:completeAnimation()
				self.FEListHeaderFull0:setAlpha( 0 )
				FEListHeaderFull0Frame2( FEListHeaderFull0, {} )
				local FEListSubHeader0Frame2 = function ( FEListSubHeader0, event )
					local FEListSubHeader0Frame3 = function ( FEListSubHeader0, event )
						local FEListSubHeader0Frame4 = function ( FEListSubHeader0, event )
							if not event.interrupted then
								FEListSubHeader0:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Bounce )
							end
							FEListSubHeader0:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( FEListSubHeader0, event )
							else
								FEListSubHeader0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							FEListSubHeader0Frame4( FEListSubHeader0, event )
							return 
						else
							FEListSubHeader0:beginAnimation( "keyframe", 539, false, false, CoD.TweenType.Linear )
							FEListSubHeader0:registerEventHandler( "transition_complete_keyframe", FEListSubHeader0Frame4 )
						end
					end
					
					if event.interrupted then
						FEListSubHeader0Frame3( FEListSubHeader0, event )
						return 
					else
						FEListSubHeader0:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						FEListSubHeader0:registerEventHandler( "transition_complete_keyframe", FEListSubHeader0Frame3 )
					end
				end
				
				FEListSubHeader0:completeAnimation()
				self.FEListSubHeader0:setAlpha( 0 )
				FEListSubHeader0Frame2( FEListSubHeader0, {} )
				local friendsAndGroupsFrame2 = function ( friendsAndGroups, event )
					local friendsAndGroupsFrame3 = function ( friendsAndGroups, event )
						local friendsAndGroupsFrame4 = function ( friendsAndGroups, event )
							if not event.interrupted then
								friendsAndGroups:beginAnimation( "keyframe", 440, false, false, CoD.TweenType.Bounce )
							end
							friendsAndGroups:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( friendsAndGroups, event )
							else
								friendsAndGroups:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							friendsAndGroupsFrame4( friendsAndGroups, event )
							return 
						else
							friendsAndGroups:beginAnimation( "keyframe", 779, false, false, CoD.TweenType.Linear )
							friendsAndGroups:registerEventHandler( "transition_complete_keyframe", friendsAndGroupsFrame4 )
						end
					end
					
					if event.interrupted then
						friendsAndGroupsFrame3( friendsAndGroups, event )
						return 
					else
						friendsAndGroups:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						friendsAndGroups:registerEventHandler( "transition_complete_keyframe", friendsAndGroupsFrame3 )
					end
				end
				
				friendsAndGroups:completeAnimation()
				self.friendsAndGroups:setAlpha( 0 )
				friendsAndGroupsFrame2( friendsAndGroups, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 6 )
				FEListSubHeader1:completeAnimation()
				self.FEListSubHeader1:setAlpha( 1 )
				self.clipFinished( FEListSubHeader1, {} )
				lobbyList:completeAnimation()
				self.lobbyList:setAlpha( 1 )
				self.clipFinished( lobbyList, {} )
				FEListAdditonal0:completeAnimation()
				self.FEListAdditonal0:setAlpha( 1 )
				self.FEListAdditonal0:setZoom( 0 )
				self.clipFinished( FEListAdditonal0, {} )
				local FEListHeaderFull0Frame2 = function ( FEListHeaderFull0, event )
					local FEListHeaderFull0Frame3 = function ( FEListHeaderFull0, event )
						if not event.interrupted then
							FEListHeaderFull0:beginAnimation( "keyframe", 420, false, false, CoD.TweenType.Bounce )
						end
						FEListHeaderFull0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( FEListHeaderFull0, event )
						else
							FEListHeaderFull0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FEListHeaderFull0Frame3( FEListHeaderFull0, event )
						return 
					else
						FEListHeaderFull0:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Bounce )
						FEListHeaderFull0:registerEventHandler( "transition_complete_keyframe", FEListHeaderFull0Frame3 )
					end
				end
				
				FEListHeaderFull0:completeAnimation()
				self.FEListHeaderFull0:setAlpha( 1 )
				FEListHeaderFull0Frame2( FEListHeaderFull0, {} )
				local FEListSubHeader0Frame2 = function ( FEListSubHeader0, event )
					local FEListSubHeader0Frame3 = function ( FEListSubHeader0, event )
						if not event.interrupted then
							FEListSubHeader0:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Bounce )
						end
						FEListSubHeader0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( FEListSubHeader0, event )
						else
							FEListSubHeader0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FEListSubHeader0Frame3( FEListSubHeader0, event )
						return 
					else
						FEListSubHeader0:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Bounce )
						FEListSubHeader0:registerEventHandler( "transition_complete_keyframe", FEListSubHeader0Frame3 )
					end
				end
				
				FEListSubHeader0:completeAnimation()
				self.FEListSubHeader0:setAlpha( 1 )
				FEListSubHeader0Frame2( FEListSubHeader0, {} )
				local friendsAndGroupsFrame2 = function ( friendsAndGroups, event )
					if not event.interrupted then
						friendsAndGroups:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Bounce )
					end
					friendsAndGroups:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( friendsAndGroups, event )
					else
						friendsAndGroups:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				friendsAndGroups:completeAnimation()
				self.friendsAndGroups:setAlpha( 1 )
				friendsAndGroupsFrame2( friendsAndGroups, {} )
			end,
			Update = function ()
				self:setupElementClipCounter( 6 )
				local FEListSubHeader1Frame2 = function ( FEListSubHeader1, event )
					local FEListSubHeader1Frame3 = function ( FEListSubHeader1, event )
						if not event.interrupted then
							FEListSubHeader1:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Bounce )
						end
						FEListSubHeader1:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( FEListSubHeader1, event )
						else
							FEListSubHeader1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FEListSubHeader1Frame3( FEListSubHeader1, event )
						return 
					else
						FEListSubHeader1:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Bounce )
						FEListSubHeader1:setAlpha( 0.18 )
						FEListSubHeader1:registerEventHandler( "transition_complete_keyframe", FEListSubHeader1Frame3 )
					end
				end
				
				FEListSubHeader1:completeAnimation()
				self.FEListSubHeader1:setAlpha( 1 )
				FEListSubHeader1Frame2( FEListSubHeader1, {} )
				local lobbyListFrame2 = function ( lobbyList, event )
					local lobbyListFrame3 = function ( lobbyList, event )
						local lobbyListFrame4 = function ( lobbyList, event )
							if not event.interrupted then
								lobbyList:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Bounce )
							end
							lobbyList:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( lobbyList, event )
							else
								lobbyList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							lobbyListFrame4( lobbyList, event )
							return 
						else
							lobbyList:beginAnimation( "keyframe", 169, false, false, CoD.TweenType.Bounce )
							lobbyList:setAlpha( 0.18 )
							lobbyList:registerEventHandler( "transition_complete_keyframe", lobbyListFrame4 )
						end
					end
					
					if event.interrupted then
						lobbyListFrame3( lobbyList, event )
						return 
					else
						lobbyList:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Bounce )
						lobbyList:registerEventHandler( "transition_complete_keyframe", lobbyListFrame3 )
					end
				end
				
				lobbyList:completeAnimation()
				self.lobbyList:setAlpha( 1 )
				lobbyListFrame2( lobbyList, {} )
				local FEListAdditonal0Frame2 = function ( FEListAdditonal0, event )
					local FEListAdditonal0Frame3 = function ( FEListAdditonal0, event )
						local FEListAdditonal0Frame4 = function ( FEListAdditonal0, event )
							if not event.interrupted then
								FEListAdditonal0:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Bounce )
							end
							FEListAdditonal0:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( FEListAdditonal0, event )
							else
								FEListAdditonal0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							FEListAdditonal0Frame4( FEListAdditonal0, event )
							return 
						else
							FEListAdditonal0:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Bounce )
							FEListAdditonal0:setAlpha( 0.2 )
							FEListAdditonal0:registerEventHandler( "transition_complete_keyframe", FEListAdditonal0Frame4 )
						end
					end
					
					if event.interrupted then
						FEListAdditonal0Frame3( FEListAdditonal0, event )
						return 
					else
						FEListAdditonal0:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Bounce )
						FEListAdditonal0:registerEventHandler( "transition_complete_keyframe", FEListAdditonal0Frame3 )
					end
				end
				
				FEListAdditonal0:completeAnimation()
				self.FEListAdditonal0:setAlpha( 1 )
				FEListAdditonal0Frame2( FEListAdditonal0, {} )
				local FEListHeaderFull0Frame2 = function ( FEListHeaderFull0, event )
					local FEListHeaderFull0Frame3 = function ( FEListHeaderFull0, event )
						local FEListHeaderFull0Frame4 = function ( FEListHeaderFull0, event )
							if not event.interrupted then
								FEListHeaderFull0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Bounce )
							end
							FEListHeaderFull0:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( FEListHeaderFull0, event )
							else
								FEListHeaderFull0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							FEListHeaderFull0Frame4( FEListHeaderFull0, event )
							return 
						else
							FEListHeaderFull0:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Bounce )
							FEListHeaderFull0:setAlpha( 0.24 )
							FEListHeaderFull0:registerEventHandler( "transition_complete_keyframe", FEListHeaderFull0Frame4 )
						end
					end
					
					if event.interrupted then
						FEListHeaderFull0Frame3( FEListHeaderFull0, event )
						return 
					else
						FEListHeaderFull0:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Bounce )
						FEListHeaderFull0:registerEventHandler( "transition_complete_keyframe", FEListHeaderFull0Frame3 )
					end
				end
				
				FEListHeaderFull0:completeAnimation()
				self.FEListHeaderFull0:setAlpha( 1 )
				FEListHeaderFull0Frame2( FEListHeaderFull0, {} )
				local FEListSubHeader0Frame2 = function ( FEListSubHeader0, event )
					local FEListSubHeader0Frame3 = function ( FEListSubHeader0, event )
						local FEListSubHeader0Frame4 = function ( FEListSubHeader0, event )
							if not event.interrupted then
								FEListSubHeader0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Bounce )
							end
							FEListSubHeader0:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( FEListSubHeader0, event )
							else
								FEListSubHeader0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							FEListSubHeader0Frame4( FEListSubHeader0, event )
							return 
						else
							FEListSubHeader0:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Bounce )
							FEListSubHeader0:setAlpha( 0.27 )
							FEListSubHeader0:registerEventHandler( "transition_complete_keyframe", FEListSubHeader0Frame4 )
						end
					end
					
					if event.interrupted then
						FEListSubHeader0Frame3( FEListSubHeader0, event )
						return 
					else
						FEListSubHeader0:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Bounce )
						FEListSubHeader0:registerEventHandler( "transition_complete_keyframe", FEListSubHeader0Frame3 )
					end
				end
				
				FEListSubHeader0:completeAnimation()
				self.FEListSubHeader0:setAlpha( 1 )
				FEListSubHeader0Frame2( FEListSubHeader0, {} )
				local friendsAndGroupsFrame2 = function ( friendsAndGroups, event )
					local friendsAndGroupsFrame3 = function ( friendsAndGroups, event )
						local friendsAndGroupsFrame4 = function ( friendsAndGroups, event )
							if not event.interrupted then
								friendsAndGroups:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Bounce )
							end
							friendsAndGroups:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( friendsAndGroups, event )
							else
								friendsAndGroups:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							friendsAndGroupsFrame4( friendsAndGroups, event )
							return 
						else
							friendsAndGroups:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Bounce )
							friendsAndGroups:setAlpha( 0.39 )
							friendsAndGroups:registerEventHandler( "transition_complete_keyframe", friendsAndGroupsFrame4 )
						end
					end
					
					if event.interrupted then
						friendsAndGroupsFrame3( friendsAndGroups, event )
						return 
					else
						friendsAndGroups:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Bounce )
						friendsAndGroups:registerEventHandler( "transition_complete_keyframe", friendsAndGroupsFrame3 )
					end
				end
				
				friendsAndGroups:completeAnimation()
				self.friendsAndGroups:setAlpha( 1 )
				friendsAndGroupsFrame2( friendsAndGroups, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "ShowQuickJoin",
			condition = function ( menu, element, event )
				return IsMainModeInvalid() and not IsLobbyNetworkModeLAN()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyGlobalRoot.lobbyMainMode" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyGlobalRoot.lobbyMainMode"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	lobbyList.id = "lobbyList"
	friendsAndGroups.id = "friendsAndGroups"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.lobbyList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.FEListSubHeader1:close()
		self.lobbyList:close()
		self.FEListAdditonal0:close()
		self.FEListHeaderFull0:close()
		self.FEListSubHeader0:close()
		self.friendsAndGroups:close()
		CoD.LobbyList.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

