-- ea9b73a63eaad14699903672bc2e6940
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartMenu.CP.StartMenu_CampaignBG" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfoPaneItemNameLabel" )
require( "ui.uieditor.widgets.PC.Utility.XCamMouseControl" )

LUI.createMenu.InspectingSingleCollectible = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "InspectingSingleCollectible" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "none"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "InspectingSingleCollectible.buttonPrompts" )
	local f1_local1 = self
	self.anyChildUsesUpdateState = true
	
	local StartMenuCampaignBG0 = CoD.StartMenu_CampaignBG.new( f1_local1, controller )
	StartMenuCampaignBG0:setLeftRight( true, true, 0, 0 )
	StartMenuCampaignBG0:setTopBottom( true, true, 0, 0 )
	self:addElement( StartMenuCampaignBG0 )
	self.StartMenuCampaignBG0 = StartMenuCampaignBG0
	
	local image = LUI.UIImage.new()
	image:setLeftRight( false, false, -195, 673.62 )
	image:setTopBottom( true, false, 148, 640 )
	image:setMaterial( LUI.UIImage.GetCachedMaterial( "extracam_2" ) )
	image:setShaderVector( 0, 0, 0, 1, 1 )
	image:setShaderVector( 1, 0, 0, 0, 0 )
	self:addElement( image )
	self.image = image
	
	local StartMenuCampaignBG = CoD.StartMenu_CampaignBG.new( f1_local1, controller )
	StartMenuCampaignBG:setLeftRight( true, true, 0, 0 )
	StartMenuCampaignBG:setTopBottom( true, true, 0, 0 )
	StartMenuCampaignBG:setAlpha( 0 )
	self:addElement( StartMenuCampaignBG )
	self.StartMenuCampaignBG = StartMenuCampaignBG
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f1_local1, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 18, 70 )
	FEMenuLeftGraphics:setTopBottom( true, true, 91, -11.75 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local MenuFrame = CoD.GenericMenuFrame.new( f1_local1, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "CPUI_COLLECTIBLES" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "CPUI_COLLECTIBLES" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local nameLabel = CoD.InfoPaneItemNameLabel.new( f1_local1, controller )
	nameLabel:setLeftRight( false, false, -564, -246.5 )
	nameLabel:setTopBottom( true, false, 150.5, 184.5 )
	nameLabel:linkToElementModel( self, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			nameLabel.itemName:setText( Engine.Localize( name ) )
		end
	end )
	self:addElement( nameLabel )
	self.nameLabel = nameLabel
	
	local location = LUI.UIText.new()
	location:setLeftRight( false, false, -564, -292.5 )
	location:setTopBottom( true, false, 192, 210 )
	location:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	location:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	location:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	location:linkToElementModel( self, "mapInfo", true, function ( model )
		local mapInfo = Engine.GetModelValue( model )
		if mapInfo then
			location:setText( Engine.Localize( LocalizeIntoString( "COLLECTIBLE_FOUND_IN_MAP", mapInfo ) ) )
		end
	end )
	self:addElement( location )
	self.location = location
	
	local XCamMouseControl = CoD.XCamMouseControl.new( f1_local1, controller )
	XCamMouseControl:setLeftRight( false, false, -113, 488 )
	XCamMouseControl:setTopBottom( true, true, 201, -133.11 )
	self:addElement( XCamMouseControl )
	self.XCamMouseControl = XCamMouseControl
	
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f4_local0 = nil
		SetModelFromPerControllerTable( controller, self, "inspectingCollectibleModel" )
		if not f4_local0 then
			f4_local0 = element:dispatchEventToChildren( event )
		end
		return f4_local0
	end )
	f1_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
		GoBack( self, f5_arg2 )
		return true
	end, function ( f6_arg0, f6_arg1, f6_arg2 )
		CoD.Menu.SetButtonLabel( f6_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		LockInput( self, controller, false )
		SendClientScriptMenuChangeNotify( controller, f1_local1, false )
		SendOwnMenuResponse( f1_local1, controller, "closed" )
	end )
	MenuFrame:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f1_local1
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuCampaignBG0:close()
		element.StartMenuCampaignBG:close()
		element.FEMenuLeftGraphics:close()
		element.MenuFrame:close()
		element.nameLabel:close()
		element.XCamMouseControl:close()
		element.location:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "InspectingSingleCollectible.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

