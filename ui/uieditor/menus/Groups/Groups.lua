-- 96438e409cf458e65ae95a938d5f7095
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopLine" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabBar" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.playercard.SelfIdentityBadge" )

LUI.createMenu.Groups = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Groups" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "HUD"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Groups.buttonPrompts" )
	local f1_local1 = self
	self.anyChildUsesUpdateState = true
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( true, true, 0, 0 )
	BlackBG:setTopBottom( true, true, 0, 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local PaintshopLine0 = CoD.PaintshopLine.new( f1_local1, controller )
	PaintshopLine0:setLeftRight( true, false, 65.52, 1213.52 )
	PaintshopLine0:setTopBottom( true, false, 173.36, 177.36 )
	PaintshopLine0:setAlpha( 0 )
	self:addElement( PaintshopLine0 )
	self.PaintshopLine0 = PaintshopLine0
	
	local Frame = LUI.UIFrame.new( f1_local1, controller, 0, 0, false )
	Frame:setLeftRight( true, true, 64, -64 )
	Frame:setTopBottom( true, false, 181, 642 )
	self:addElement( Frame )
	self.Frame = Frame
	
	local MenuFrame = CoD.GenericMenuFrame.new( f1_local1, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "GROUPS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "GROUPS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_emblem" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local CategoryListPanel = LUI.UIImage.new()
	CategoryListPanel:setLeftRight( true, true, 0, 0 )
	CategoryListPanel:setTopBottom( false, false, -274, -235 )
	CategoryListPanel:setRGB( 0, 0, 0 )
	self:addElement( CategoryListPanel )
	self.CategoryListPanel = CategoryListPanel
	
	local Tab = CoD.FE_TabBar.new( f1_local1, controller )
	Tab:setLeftRight( true, false, 0, 4999 )
	Tab:setTopBottom( true, false, 85, 126 )
	Tab.Tabs.grid:setDataSource( "GroupsMainTabList" )
	self:addElement( Tab )
	self.Tab = Tab
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f1_local1, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 86, 703.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local SelfIdentityBadge = CoD.SelfIdentityBadge.new( f1_local1, controller )
	SelfIdentityBadge:setLeftRight( false, true, -435, -92 )
	SelfIdentityBadge:setTopBottom( true, false, 24, 84 )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", "identityBadge", function ( model )
		SelfIdentityBadge:setModel( model, controller )
	end )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", nil, function ( model )
		SelfIdentityBadge.CallingCard.CallingCardsFrameWidget:setModel( model, controller )
	end )
	self:addElement( SelfIdentityBadge )
	self.SelfIdentityBadge = SelfIdentityBadge
	
	Frame:linkToElementModel( Tab.Tabs.grid, "tabWidget", true, function ( model )
		local tabWidget = Engine.GetModelValue( model )
		if tabWidget then
			Frame:changeFrameWidget( tabWidget )
		end
	end )
	self:registerEventHandler( "ui_keyboard_input", function ( element, event )
		local f5_local0 = nil
		HandleGroupsKeyboardComplete( self, element, controller, event )
		if not f5_local0 then
			f5_local0 = element:dispatchEventToChildren( event )
		end
		return f5_local0
	end )
	f1_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
		GroupsHandleGoBack( self, f6_arg0, f6_arg2 )
		return true
	end, function ( f7_arg0, f7_arg1, f7_arg2 )
		CoD.Menu.SetButtonLabel( f7_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	f1_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, nil, function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
		if AlwaysFalse() then
			return true
		else
			
		end
	end, function ( f9_arg0, f9_arg1, f9_arg2 )
		if AlwaysFalse() then
			CoD.Menu.SetButtonLabel( f9_arg1, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "" )
			return false
		else
			return false
		end
	end, false )
	Frame.id = "Frame"
	MenuFrame:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f1_local1
	} )
	if not self:restoreState() then
		self.Frame:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.PaintshopLine0:close()
		element.MenuFrame:close()
		element.Tab:close()
		element.FEMenuLeftGraphics:close()
		element.SelfIdentityBadge:close()
		element.Frame:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Groups.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

