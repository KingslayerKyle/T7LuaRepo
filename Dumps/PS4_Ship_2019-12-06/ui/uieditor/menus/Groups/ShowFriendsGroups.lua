require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.Groups.FindGroupsTabSearchGroupsCommonWidget" )
require( "ui.uieditor.widgets.playercard.IdentityBadge" )

local PreLoadFunc = function ( self, controller )
	Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "groups.skipViewFriendsInGroup" ), true )
end

LUI.createMenu.ShowFriendsGroups = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ShowFriendsGroups" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ShowFriendsGroups.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, true, 0, 0 )
	bg:setTopBottom( true, true, 0, 0 )
	bg:setRGB( 0, 0, 0 )
	self:addElement( bg )
	self.bg = bg
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( true, true, 0, 0 )
	BlackBG:setTopBottom( true, true, 0, 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 92.93, 381 )
	Image0:setTopBottom( true, false, 154, 615 )
	Image0:setRGB( 0, 0, 0 )
	Image0:setAlpha( 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local BlackTint0 = LUI.UIImage.new()
	BlackTint0:setLeftRight( true, false, 65, 468.5 )
	BlackTint0:setTopBottom( true, false, 86, 684 )
	BlackTint0:setRGB( 0, 0, 0 )
	BlackTint0:setAlpha( 0.3 )
	self:addElement( BlackTint0 )
	self.BlackTint0 = BlackTint0
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, false, 64, 1099 )
	Background:setTopBottom( true, false, 154, 614 )
	Background:setAlpha( 0 )
	self:addElement( Background )
	self.Background = Background
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "GROUPS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "GROUPS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_emblem" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 18, 70 )
	FEMenuLeftGraphics:setTopBottom( true, false, 91, 708.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local FindGroupsTabSearchGroupsCommonWidget = CoD.FindGroupsTabSearchGroupsCommonWidget.new( self, controller )
	FindGroupsTabSearchGroupsCommonWidget:setLeftRight( true, false, 92.93, 800.93 )
	FindGroupsTabSearchGroupsCommonWidget:setTopBottom( true, false, 154, 627 )
	self:addElement( FindGroupsTabSearchGroupsCommonWidget )
	self.FindGroupsTabSearchGroupsCommonWidget = FindGroupsTabSearchGroupsCommonWidget
	
	local IdentityBadge = CoD.IdentityBadge.new( self, controller )
	IdentityBadge:setLeftRight( true, false, 845, 1190 )
	IdentityBadge:setTopBottom( true, false, 26, 86 )
	IdentityBadge:subscribeToGlobalModel( controller, "SocialPlayerInfo", "identityBadge", function ( model )
		IdentityBadge:setModel( model, controller )
	end )
	IdentityBadge:subscribeToGlobalModel( controller, "SocialPlayerInfo", nil, function ( model )
		IdentityBadge.CallingCard.CallingCardsFrameWidget:setModel( model, controller )
	end )
	self:addElement( IdentityBadge )
	self.IdentityBadge = IdentityBadge
	
	local TextBox = LUI.UIText.new()
	TextBox:setLeftRight( true, false, 92.93, 446.93 )
	TextBox:setTopBottom( true, false, 106, 130 )
	TextBox:setTTF( "fonts/default.ttf" )
	TextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TextBox:subscribeToGlobalModel( controller, "SocialPlayerInfo", "identityBadge.gamertag", function ( model )
		local identityBadgeGamertag = Engine.GetModelValue( model )
		if identityBadgeGamertag then
			TextBox:setText( LocalizeIntoString( "GROUPS_PLAYER_PART_OF_GROUPS", identityBadgeGamertag ) )
		end
	end )
	self:addElement( TextBox )
	self.TextBox = TextBox
	
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		ClearSavedState( self, controller )
		ClearLastGroupSearchResults( self, element, controller )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		SetControllerModelValue( controller, "groups.skipViewFriendsInGroup", false )
	end )
	MenuFrame:setModel( self.buttonModel, controller )
	FindGroupsTabSearchGroupsCommonWidget.id = "FindGroupsTabSearchGroupsCommonWidget"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.FindGroupsTabSearchGroupsCommonWidget:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.MenuFrame:close()
		element.FEMenuLeftGraphics:close()
		element.FindGroupsTabSearchGroupsCommonWidget:close()
		element.IdentityBadge:close()
		element.TextBox:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "ShowFriendsGroups.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

