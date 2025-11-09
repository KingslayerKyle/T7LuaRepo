require( "ui.uieditor.widgets.Social.Social_NoFriends" )
require( "ui.uieditor.widgets.Social.Social_PlayersList" )
require( "ui.uieditor.widgets.Social.Social_InfoPane" )

CoD.Social_Friends = InheritFrom( LUI.UIElement )
CoD.Social_Friends.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Social_Friends )
	self.id = "Social_Friends"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 1150 )
	self:setTopBottom( true, false, 0, 525 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local SocialNoFriends = CoD.Social_NoFriends.new( menu, controller )
	SocialNoFriends:setLeftRight( true, false, -1, 1111 )
	SocialNoFriends:setTopBottom( true, false, 6, 456 )
	SocialNoFriends:setAlpha( 0 )
	self:addElement( SocialNoFriends )
	self.SocialNoFriends = SocialNoFriends
	
	local players = CoD.Social_PlayersList.new( menu, controller )
	players:setLeftRight( true, false, -3, 377 )
	players:setTopBottom( true, false, 6, 484 )
	players.onlineList:setDataSource( "SocialPlayersList" )
	self:addElement( players )
	self.players = players
	
	local playerInfo = CoD.Social_InfoPane.new( menu, controller )
	playerInfo:setLeftRight( false, true, -683, 106 )
	playerInfo:setTopBottom( true, false, 6, 496 )
	self:addElement( playerInfo )
	self.playerInfo = playerInfo
	
	local noFriends = LUI.UIText.new()
	noFriends:setLeftRight( true, false, 0, 1150 )
	noFriends:setTopBottom( true, false, 205, 229 )
	noFriends:setAlpha( 0 )
	noFriends:setText( Engine.Localize( "MENU_THERE_ARE_NO_FRIENDS" ) )
	noFriends:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	noFriends:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	noFriends:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( noFriends )
	self.noFriends = noFriends
	
	players.navigation = {
		right = playerInfo
	}
	playerInfo.navigation = {
		left = players
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				SocialNoFriends:completeAnimation()
				self.SocialNoFriends:setAlpha( 0 )
				self.clipFinished( SocialNoFriends, {} )
				players:completeAnimation()
				self.players:setAlpha( 1 )
				self.clipFinished( players, {} )
				playerInfo:completeAnimation()
				self.playerInfo:setAlpha( 1 )
				self.clipFinished( playerInfo, {} )
				noFriends:completeAnimation()
				self.noFriends:setAlpha( 0 )
				self.clipFinished( noFriends, {} )
			end
		},
		NoFriends = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				SocialNoFriends:completeAnimation()
				self.SocialNoFriends:setAlpha( 1 )
				self.clipFinished( SocialNoFriends, {} )
				players:completeAnimation()
				self.players:setAlpha( 0 )
				self.clipFinished( players, {} )
				playerInfo:completeAnimation()
				self.playerInfo:setAlpha( 0 )
				self.clipFinished( playerInfo, {} )
				noFriends:completeAnimation()
				self.noFriends:setAlpha( 1 )
				self.clipFinished( noFriends, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "NoFriends",
			condition = function ( menu, element, event )
				return not HasFriends( controller )
			end
		}
	} )
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	players.id = "players"
	playerInfo.id = "playerInfo"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.playerInfo:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.SocialNoFriends:close()
		element.players:close()
		element.playerInfo:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

