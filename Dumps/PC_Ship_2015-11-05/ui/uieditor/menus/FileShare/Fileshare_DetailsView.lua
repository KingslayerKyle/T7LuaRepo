require( "ui.uieditor.menus.FileShare.Popups.FileshareOptions" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )
require( "ui.uieditor.widgets.FileShare.FileshareSelectedItemInfo" )
require( "ui.uieditor.widgets.horizontalScrollingTextBox_30pt" )

local PreLoadFunc = function ( self, controller )
	local f1_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "FileshareSelectedItem", false )
	Engine.CreateModel( f1_local0, "weaponName", false )
	Engine.CreateModel( f1_local0, "fileName", false )
end

LUI.createMenu.Fileshare_DetailsView = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Fileshare_DetailsView" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Fileshare_DetailsView.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local feFooterContainerNOTLobby = CoD.fe_FooterContainer_NOTLobby.new( self, controller )
	feFooterContainerNOTLobby:setLeftRight( true, false, 0, 1280 )
	feFooterContainerNOTLobby:setTopBottom( true, false, 619, 667 )
	self:addElement( feFooterContainerNOTLobby )
	self.feFooterContainerNOTLobby = feFooterContainerNOTLobby
	
	local FileshareSelectedItemInfo = CoD.FileshareSelectedItemInfo.new( self, controller )
	FileshareSelectedItemInfo:setLeftRight( true, false, 79.53, 497.53 )
	FileshareSelectedItemInfo:setTopBottom( true, false, 526, 610 )
	FileshareSelectedItemInfo:subscribeToGlobalModel( controller, "FileshareSelectedItem", nil, function ( model )
		FileshareSelectedItemInfo:setModel( model, controller )
	end )
	self:addElement( FileshareSelectedItemInfo )
	self.FileshareSelectedItemInfo = FileshareSelectedItemInfo
	
	local WeaponNameBg = LUI.UIImage.new()
	WeaponNameBg:setLeftRight( true, false, 79.53, 342.03 )
	WeaponNameBg:setTopBottom( true, false, 485, 517 )
	WeaponNameBg:setRGB( 0, 0, 0 )
	WeaponNameBg:subscribeToGlobalModel( controller, "FileshareSelectedItem", "shouldShowEmblem", function ( model )
		local shouldShowEmblem = Engine.GetModelValue( model )
		if shouldShowEmblem then
			WeaponNameBg:setAlpha( Negate( shouldShowEmblem ) )
		end
	end )
	self:addElement( WeaponNameBg )
	self.WeaponNameBg = WeaponNameBg
	
	local WeaponName = LUI.UITightText.new()
	WeaponName:setLeftRight( true, false, 82.03, 342.03 )
	WeaponName:setTopBottom( true, false, 488, 513 )
	WeaponName:setTTF( "fonts/default.ttf" )
	WeaponName:subscribeToGlobalModel( controller, "FileshareSelectedItem", "shouldShowEmblem", function ( model )
		local shouldShowEmblem = Engine.GetModelValue( model )
		if shouldShowEmblem then
			WeaponName:setAlpha( Negate( shouldShowEmblem ) )
		end
	end )
	WeaponName:subscribeToGlobalModel( controller, "FileshareSelectedItem", "weaponName", function ( model )
		local weaponName = Engine.GetModelValue( model )
		if weaponName then
			WeaponName:setText( Engine.Localize( weaponName ) )
		end
	end )
	self:addElement( WeaponName )
	self.WeaponName = WeaponName
	
	local ItemNameBg = LUI.UIImage.new()
	ItemNameBg:setLeftRight( true, false, 79.53, 342.03 )
	ItemNameBg:setTopBottom( true, false, 456, 488 )
	ItemNameBg:setAlpha( 0.8 )
	self:addElement( ItemNameBg )
	self.ItemNameBg = ItemNameBg
	
	local WCFileshareIconExtraCamRender = LUI.UIImage.new()
	WCFileshareIconExtraCamRender:setLeftRight( true, false, 352, 986 )
	WCFileshareIconExtraCamRender:setTopBottom( true, false, 100, 488 )
	WCFileshareIconExtraCamRender:subscribeToGlobalModel( controller, "FileshareSelectedItem", "shouldShowEmblem", function ( model )
		local shouldShowEmblem = Engine.GetModelValue( model )
		if shouldShowEmblem then
			WCFileshareIconExtraCamRender:setAlpha( shouldShowEmblem )
		end
	end )
	WCFileshareIconExtraCamRender:subscribeToGlobalModel( controller, "FileshareSelectedItem", "fileId", function ( model )
		local fileId = Engine.GetModelValue( model )
		if fileId then
			WCFileshareIconExtraCamRender:setupWCFileshareIconExtraCamRender( GetFileshareExtraCamParameters( controller, fileId ) )
		end
	end )
	self:addElement( WCFileshareIconExtraCamRender )
	self.WCFileshareIconExtraCamRender = WCFileshareIconExtraCamRender
	
	local horizontalScrollingTextBox30pt = CoD.horizontalScrollingTextBox_30pt.new( self, controller )
	horizontalScrollingTextBox30pt:setLeftRight( true, false, 79.53, 342.03 )
	horizontalScrollingTextBox30pt:setTopBottom( true, false, 454, 488 )
	horizontalScrollingTextBox30pt.textBox:setRGB( 0, 0, 0 )
	horizontalScrollingTextBox30pt.textBox:setTTF( "fonts/default.ttf" )
	horizontalScrollingTextBox30pt.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	horizontalScrollingTextBox30pt:subscribeToGlobalModel( controller, "FileshareSelectedItem", "fileName", function ( model )
		local fileName = Engine.GetModelValue( model )
		if fileName then
			horizontalScrollingTextBox30pt.textBox:setText( Engine.Localize( fileName ) )
		end
	end )
	self:addElement( horizontalScrollingTextBox30pt )
	self.horizontalScrollingTextBox30pt = horizontalScrollingTextBox30pt
	
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f10_local0 = nil
		SendClientScriptMenuChangeNotify( controller, self, true )
		SetIsInFileshare( controller, "true" )
		if not f10_local0 then
			f10_local0 = self:dispatchEventToChildren( event )
		end
		return f10_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		SetIsInFileshare( controller, "false" )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "S", function ( element, menu, controller, model )
		OpenPopup( self, "FileshareOptions", controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_SOCIAL" )
		return true
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		SendClientScriptMenuChangeNotify( controller, self, false )
	end )
	feFooterContainerNOTLobby:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.feFooterContainerNOTLobby:close()
		element.FileshareSelectedItemInfo:close()
		element.horizontalScrollingTextBox30pt:close()
		element.WeaponNameBg:close()
		element.WeaponName:close()
		element.WCFileshareIconExtraCamRender:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Fileshare_DetailsView.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

