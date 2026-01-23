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
	self.anyChildUsesUpdateState = true
	
	local StartMenuCampaignBG0 = CoD.StartMenu_CampaignBG.new( self, controller )
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
	
	local StartMenuCampaignBG = CoD.StartMenu_CampaignBG.new( self, controller )
	StartMenuCampaignBG:setLeftRight( true, true, 0, 0 )
	StartMenuCampaignBG:setTopBottom( true, true, 0, 0 )
	StartMenuCampaignBG:setAlpha( 0 )
	self:addElement( StartMenuCampaignBG )
	self.StartMenuCampaignBG = StartMenuCampaignBG
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 18, 70 )
	FEMenuLeftGraphics:setTopBottom( true, true, 91, -11.75 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "CPUI_COLLECTIBLES" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "CPUI_COLLECTIBLES" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local nameLabel = CoD.InfoPaneItemNameLabel.new( self, controller )
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
	
	local XCamMouseControl = CoD.XCamMouseControl.new( self, controller )
	XCamMouseControl:setLeftRight( false, false, -113, 488 )
	XCamMouseControl:setTopBottom( true, true, 201, -133.11 )
	self:addElement( XCamMouseControl )
	self.XCamMouseControl = XCamMouseControl
	
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f4_local0 = nil
		SetModelFromPerControllerTable( controller, self, "inspectingCollectibleModel" )
		if not f4_local0 then
			f4_local0 = self:dispatchEventToChildren( event )
		end
		return f4_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		LockInput( self, controller, false )
		SendClientScriptMenuChangeNotify( controller, self, false )
		SendOwnMenuResponse( self, controller, "closed" )
	end )
	MenuFrame:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
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

