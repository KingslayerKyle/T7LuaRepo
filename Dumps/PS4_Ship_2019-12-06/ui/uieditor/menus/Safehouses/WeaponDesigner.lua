require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Safehouse.WeaponDesignerItem" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )

LUI.createMenu.WeaponDesigner = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "WeaponDesigner" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "WeaponDesigner.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local blackImage = LUI.UIImage.new()
	blackImage:setLeftRight( true, true, 0, 0 )
	blackImage:setTopBottom( true, true, 0, 0 )
	blackImage:setRGB( 0, 0, 0 )
	self:addElement( blackImage )
	self.blackImage = blackImage
	
	local genericMenuFrame = CoD.GenericMenuFrame.new( self, controller )
	genericMenuFrame:setLeftRight( true, true, 0, 0 )
	genericMenuFrame:setTopBottom( true, true, 0, 0 )
	genericMenuFrame.titleLabel:setText( Engine.Localize( LocalizeToUpperString( "MENU_WEAPON_DESIGNER" ) ) )
	genericMenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( LocalizeToUpperString( "MENU_WEAPON_DESIGNER" ) ) )
	genericMenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_gunsmith" ) )
	genericMenuFrame:registerEventHandler( "gain_focus", function ( element, event )
		local f2_local0 = nil
		if element.gainFocus then
			f2_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f2_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
		return f2_local0
	end )
	genericMenuFrame:registerEventHandler( "lose_focus", function ( element, event )
		local f3_local0 = nil
		if element.loseFocus then
			f3_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f3_local0 = element.super:loseFocus( event )
		end
		return f3_local0
	end )
	self:AddButtonCallbackFunction( genericMenuFrame, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		SendOwnMenuResponse( menu, controller, "cancel" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
		return false
	end, false )
	self:addElement( genericMenuFrame )
	self.genericMenuFrame = genericMenuFrame
	
	local gunsmithItem = CoD.WeaponDesignerItem.new( self, controller )
	gunsmithItem:setLeftRight( false, false, -512.42, 512.42 )
	gunsmithItem:setTopBottom( true, false, 139, 392.63 )
	gunsmithItem.BGImage:setImage( RegisterImage( "uie_t7_banner_weapondesigner_gunsmith" ) )
	gunsmithItem.buttonTitle:setText( Engine.Localize( "MENU_GUNSMITH_CAPS" ) )
	gunsmithItem.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_GUNSMITH_DESC" ) )
	gunsmithItem:registerEventHandler( "gain_focus", function ( element, event )
		local f6_local0 = nil
		if element.gainFocus then
			f6_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f6_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f6_local0
	end )
	gunsmithItem:registerEventHandler( "lose_focus", function ( element, event )
		local f7_local0 = nil
		if element.loseFocus then
			f7_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f7_local0 = element.super:loseFocus( event )
		end
		return f7_local0
	end )
	self:AddButtonCallbackFunction( gunsmithItem, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if Gunsmith_IsEnabled( element, controller ) then
			OpenGunsmith( self, element, controller, "", menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if Gunsmith_IsEnabled( element, controller ) then
			return true
		else
			return false
		end
	end, false )
	gunsmithItem:mergeStateConditions( {
		{
			stateName = "OnlineOnly",
			condition = function ( menu, element, event )
				return not Gunsmith_IsEnabled( element, controller )
			end
		}
	} )
	self:addElement( gunsmithItem )
	self.gunsmithItem = gunsmithItem
	
	local paintshopItem = CoD.WeaponDesignerItem.new( self, controller )
	paintshopItem:setLeftRight( false, false, -512.42, 512.42 )
	paintshopItem:setTopBottom( true, false, 399.63, 653.25 )
	paintshopItem.BGImage:setImage( RegisterImage( "uie_t7_banner_weapondesigner_paintshop" ) )
	paintshopItem.buttonTitle:setText( Engine.Localize( "MENU_PAINTSHOP_CAPS" ) )
	paintshopItem.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_PAINTSHOP_DESC" ) )
	paintshopItem:registerEventHandler( "gain_focus", function ( element, event )
		local f11_local0 = nil
		if element.gainFocus then
			f11_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f11_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f11_local0
	end )
	paintshopItem:registerEventHandler( "lose_focus", function ( element, event )
		local f12_local0 = nil
		if element.loseFocus then
			f12_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f12_local0 = element.super:loseFocus( event )
		end
		return f12_local0
	end )
	self:AddButtonCallbackFunction( paintshopItem, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if Paintjobs_IsEnabled( element, controller ) then
			OpenPaintshop( self, element, controller, "", menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if Paintjobs_IsEnabled( element, controller ) then
			return true
		else
			return false
		end
	end, false )
	paintshopItem:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsPaintshopButtonDisabled( controller )
			end
		},
		{
			stateName = "OnlineOnly",
			condition = function ( menu, element, event )
				return not Paintjobs_IsEnabled( element, controller )
			end
		}
	} )
	self:addElement( paintshopItem )
	self.paintshopItem = paintshopItem
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 18, 70 )
	FEMenuLeftGraphics:setTopBottom( true, true, 91, -11.75 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	gunsmithItem.navigation = {
		down = paintshopItem
	}
	paintshopItem.navigation = {
		up = gunsmithItem
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_opened", function ( self, event )
		local f17_local0 = nil
		if TestAndSetFirstTimeMenu( controller, "com_firsttime_builder" ) then
			OpenGenericLargePopup( self, controller, "MENU_FIRSTTIME_BUILDER", "MENU_FIRSTTIME_BUILDER2", "com_firsttime_builder_image", "MENU_FIRSTTIME_BUILDER_BUTTONTEXT", "", "" )
		end
		if not f17_local0 then
			f17_local0 = self:dispatchEventToChildren( event )
		end
		return f17_local0
	end )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f18_local0 = nil
		PrepareOpenMenuInSafehouse( controller )
		ShowHeaderIconOnly( self )
		SetElementStateByElementName( self, "genericMenuFrame", controller, "Update" )
		PlayClipOnElement( self, {
			elementName = "genericMenuFrame",
			clipName = "Intro"
		}, controller )
		PlayClip( self, "Intro", controller )
		if not f18_local0 then
			f18_local0 = self:dispatchEventToChildren( event )
		end
		return f18_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		SendOwnMenuResponse( menu, controller, "closed" )
		Close( self, controller )
		ClearMenuSavedState( menu )
		PrepareCloseMenuInSafehouse( controller )
		PlaySoundSetSound( self, "menu_go_back" )
		MarkCACPaintshopDataDirty( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	genericMenuFrame:setModel( self.buttonModel, controller )
	gunsmithItem.id = "gunsmithItem"
	paintshopItem.id = "paintshopItem"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.gunsmithItem:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.genericMenuFrame:close()
		element.gunsmithItem:close()
		element.paintshopItem:close()
		element.FEMenuLeftGraphics:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "WeaponDesigner.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

