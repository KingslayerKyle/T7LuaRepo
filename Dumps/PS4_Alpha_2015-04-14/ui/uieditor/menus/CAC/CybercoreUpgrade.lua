require( "ui.uieditor.widgets.CAC.cac_3dTitleIntermediary" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.CybercoreUpgradeTreeWidget" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.CybercoreInfoModelWidget" )

local SetTitle = function ( self, controller )
	local loadoutSlot = CoD.perController[controller].weaponCategory
	local classModel = CoD.perController[controller].classModel
	local cybercoreName = CoD.CACUtility.GetItemName( loadoutSlot, controller, classModel )
	self.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( cybercoreName ) .. " Core Upgrades" )
end

local PostLoadFunc = function ( self, controller )
	SetTitle( self, controller )
	self.upgradeTree:updateTree( controller )
end

LUI.createMenu.CybercoreUpgrade = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CybercoreUpgrade" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC_LethalGrenade"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local cac3dTitleIntermediary0 = CoD.cac_3dTitleIntermediary.new( self, controller )
	cac3dTitleIntermediary0:setLeftRight( true, false, -72, 640 )
	cac3dTitleIntermediary0:setTopBottom( true, false, -4, 142 )
	cac3dTitleIntermediary0:setRGB( 1, 1, 1 )
	cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MULTIPLAYER" ) )
	self:addElement( cac3dTitleIntermediary0 )
	self.cac3dTitleIntermediary0 = cac3dTitleIntermediary0
	
	local upgradeTree = CoD.CybercoreUpgradeTreeWidget.new( self, controller )
	upgradeTree:setLeftRight( true, false, 0, 700 )
	upgradeTree:setTopBottom( true, false, 110, 610 )
	upgradeTree:setRGB( 1, 1, 1 )
	upgradeTree:subscribeToGlobalModel( controller, "CybercoreAbilityUpgradeTree", nil, function ( model )
		upgradeTree:setModel( model, controller )
	end )
	upgradeTree:registerEventHandler( "record_curr_focused_elem_id", function ( element, event )
		local retVal = nil
		if element.RecordCurrFocusedElemID then
			retVal = element:RecordCurrFocusedElemID( event )
		elseif element.super.RecordCurrFocusedElemID then
			retVal = element.super:RecordCurrFocusedElemID( event )
		end
		UpdateElementModelToFocusedElementModel( self, element, "infoWidget", event )
		return retVal
	end )
	self:addElement( upgradeTree )
	self.upgradeTree = upgradeTree
	
	local infoWidget = CoD.CybercoreInfoModelWidget.new( self, controller )
	infoWidget:setLeftRight( false, true, -580, -64 )
	infoWidget:setTopBottom( true, false, 69, 610 )
	infoWidget:setRGB( 1, 1, 1 )
	self:addElement( infoWidget )
	self.infoWidget = infoWidget
	
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.primary = function ( menu, element, event )
		menu:addButtonPrompt( "primary", Engine.Localize( "MENU_SELECT_CAPS" ), "ENTER", element )
		return true
	end
	
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		menu:addButtonPrompt( "secondary", Engine.Localize( "MENU_BACK_CAPS" ), "ESCAPE", element )
		return true
	end
	
	self.buttonPromptAddFunctions.primary( self, self, {
		controller = controller
	} )
	self.buttonPromptAddFunctions.secondary( self, self, {
		controller = controller
	} )
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and event.button ~= "primary" and event.button == "key_shortcut" and event.key == "ENTER" then
			
		else
			
		end
		if not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESCAPE") then
			GoBack( self, controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	upgradeTree.id = "upgradeTree"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.upgradeTree:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.cac3dTitleIntermediary0:close()
		self.upgradeTree:close()
		self.infoWidget:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

