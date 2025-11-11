require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopLine" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabBar" )
require( "ui.uieditor.widgets.playercard.SelfIdentityBadge" )
require( "ui.uieditor.widgets.Groups.Headquarters.OverviewTab" )
require( "ui.uieditor.widgets.Groups.Headquarters.RosterTab" )
require( "ui.uieditor.widgets.Groups.Headquarters.BadgesTab" )
require( "ui.uieditor.widgets.Groups.Headquarters.LeaderboardTab" )
require( "ui.uieditor.widgets.Groups.Headquarters.ShareTab" )
require( "ui.uieditor.widgets.Groups.Headquarters.AdminTab" )
require( "ui.uieditor.menus.Groups.LeaderboardMaker" )

local PreLoadFunc = function ( self, controller )
	Engine.CreateModel( Engine.GetModelForController( controller ), "Social.selectedFriendXUID" )
	CoD.FileshareUtility.InitModels()
end

local PostLoadFunc = function ( self, controller )
	self:setModel( CoD.perController[controller].selectedGroup )
	SetSelectingGroupEmblem( controller, true, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( self )
		SetSelectingGroupEmblem( controller, false, false )
	end )
end

LUI.createMenu.GroupHeadquarters = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "GroupHeadquarters" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "HUD"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GroupHeadquarters.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( 0, 1, 0, 0 )
	BlackBG:setTopBottom( 0, 1, 0, 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local Title = LUI.UITightText.new()
	Title:setLeftRight( 0, 0, 152, 698 )
	Title:setTopBottom( 0, 0, 77, 149 )
	Title:setAlpha( 0 )
	Title:setText( Engine.Localize( "GROUPS_HEADQUARTERS" ) )
	Title:setTTF( "fonts/default.ttf" )
	self:addElement( Title )
	self.Title = Title
	
	local PaintshopLine0 = CoD.PaintshopLine.new( self, controller )
	PaintshopLine0:setLeftRight( 0, 0, 98, 1820 )
	PaintshopLine0:setTopBottom( 0, 0, 260, 266 )
	PaintshopLine0:setAlpha( 0 )
	self:addElement( PaintshopLine0 )
	self.PaintshopLine0 = PaintshopLine0
	
	local panel = LUI.UIImage.new()
	panel:setLeftRight( 0, 0, 96, 1824 )
	panel:setTopBottom( 0, 0, 271, 963 )
	panel:setRGB( 0.15, 0.15, 0.15 )
	panel:setAlpha( 0 )
	self:addElement( panel )
	self.panel = panel
	
	local Frame = LUI.UIFrame.new( self, controller, 0, 0, false )
	Frame:setLeftRight( 0, 1, 96, -96 )
	Frame:setTopBottom( 0, 0, 271, 963 )
	self:addElement( Frame )
	self.Frame = Frame
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( 0, 1, 0, 0 )
	MenuFrame:setTopBottom( 0, 1, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "GROUPS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "GROUPS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_emblem" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local FETabBar0 = CoD.FE_TabBar.new( self, controller )
	FETabBar0:setLeftRight( 0, 0, -2, 7498 )
	FETabBar0:setTopBottom( 0, 0, 126, 188 )
	FETabBar0.Tabs.grid:setDataSource( "GroupsHeadquartersTabList" )
	self:addElement( FETabBar0 )
	self.FETabBar0 = FETabBar0
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( 0, 0, 29, 107 )
	FEMenuLeftGraphics:setTopBottom( 0, 0, 129, 1055 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local SelfIdentityBadge = CoD.SelfIdentityBadge.new( self, controller )
	SelfIdentityBadge:setLeftRight( 1, 1, -652, -138 )
	SelfIdentityBadge:setTopBottom( 0, 0, 36, 126 )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", "identityBadge", function ( model )
		SelfIdentityBadge:setModel( model, controller )
	end )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", nil, function ( model )
		SelfIdentityBadge.CallingCard.CallingCardsFrameWidget:setModel( model, controller )
	end )
	self:addElement( SelfIdentityBadge )
	self.SelfIdentityBadge = SelfIdentityBadge
	
	Frame:linkToElementModel( FETabBar0.Tabs.grid, "tabWidget", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Frame:changeFrameWidget( modelValue )
		end
	end )
	Frame.navigation = {
		up = SelfIdentityBadge
	}
	SelfIdentityBadge.navigation = {
		down = Frame
	}
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.grouphqtabname" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.grouphqtabname"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_START )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Social.selectedFriendXUID" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "Social.selectedFriendXUID"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_START )
	end )
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "ui_keyboard_input", function ( element, event )
		local retVal = nil
		HandleGroupHeadquartersKeyboardComplete( self, element, controller, event )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "list_active_changed", function ( element, event )
		local retVal = nil
		SetGroupHeadquarterTabName( self, element, controller )
		return retVal
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		UpdateSelectedGroupInfo( self, element, controller )
		ClearSelectedGroup( self, element, controller )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, nil, function ( element, menu, controller, model )
		if ShouldOpenGroupOptionsPopup( element, controller ) then
			OpenGroupOptionsPopup( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if ShouldOpenGroupOptionsPopup( element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS", nil )
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if AlwaysFalse() then
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		if AlwaysFalse() then
			return true
		else
			return false
		end
	end, true )
	Frame.id = "Frame"
	MenuFrame:setModel( self.buttonModel, controller )
	SelfIdentityBadge.id = "SelfIdentityBadge"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.Frame:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.PaintshopLine0:close()
		self.MenuFrame:close()
		self.FETabBar0:close()
		self.FEMenuLeftGraphics:close()
		self.SelfIdentityBadge:close()
		self.Frame:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "GroupHeadquarters.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

