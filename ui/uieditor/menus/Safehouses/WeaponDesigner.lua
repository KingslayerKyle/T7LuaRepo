-- f85fe3476fbef7c904aaf05c5c3f8f24
-- This hash is used for caching, delete to decompile the file again

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
	local f1_local1 = self
	self.anyChildUsesUpdateState = true
	
	local blackImage = LUI.UIImage.new()
	blackImage:setLeftRight( true, true, 0, 0 )
	blackImage:setTopBottom( true, true, 0, 0 )
	blackImage:setRGB( 0, 0, 0 )
	self:addElement( blackImage )
	self.blackImage = blackImage
	
	local genericMenuFrame = CoD.GenericMenuFrame.new( f1_local1, controller )
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
		CoD.Menu.UpdateButtonShownState( element, f1_local1, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
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
	f1_local1:AddButtonCallbackFunction( genericMenuFrame, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
		SendOwnMenuResponse( f4_arg1, f4_arg2, "cancel" )
		return true
	end, function ( f5_arg0, f5_arg1, f5_arg2 )
		CoD.Menu.SetButtonLabel( f5_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
		return false
	end, false )
	self:addElement( genericMenuFrame )
	self.genericMenuFrame = genericMenuFrame
	
	local gunsmithItem = CoD.WeaponDesignerItem.new( f1_local1, controller )
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
		CoD.Menu.UpdateButtonShownState( element, f1_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
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
	f1_local1:AddButtonCallbackFunction( gunsmithItem, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
		if Gunsmith_IsEnabled( f8_arg0, f8_arg2 ) then
			OpenGunsmith( self, f8_arg0, f8_arg2, "", f8_arg1 )
			return true
		else
			
		end
	end, function ( f9_arg0, f9_arg1, f9_arg2 )
		CoD.Menu.SetButtonLabel( f9_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if Gunsmith_IsEnabled( f9_arg0, f9_arg2 ) then
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
	
	local paintshopItem = CoD.WeaponDesignerItem.new( f1_local1, controller )
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
		CoD.Menu.UpdateButtonShownState( element, f1_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
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
	f1_local1:AddButtonCallbackFunction( paintshopItem, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3 )
		if Paintjobs_IsEnabled( f13_arg0, f13_arg2 ) then
			OpenPaintshop( self, f13_arg0, f13_arg2, "", f13_arg1 )
			return true
		else
			
		end
	end, function ( f14_arg0, f14_arg1, f14_arg2 )
		CoD.Menu.SetButtonLabel( f14_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if Paintjobs_IsEnabled( f14_arg0, f14_arg2 ) then
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
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f1_local1, controller )
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
	CoD.Menu.AddNavigationHandler( f1_local1, self, controller )
	self:registerEventHandler( "menu_opened", function ( element, event )
		local f17_local0 = nil
		if TestAndSetFirstTimeMenu( controller, "com_firsttime_builder" ) then
			OpenGenericLargePopup( f1_local1, controller, "MENU_FIRSTTIME_BUILDER", "MENU_FIRSTTIME_BUILDER2", "com_firsttime_builder_image", "MENU_FIRSTTIME_BUILDER_BUTTONTEXT", "", "" )
		end
		if not f17_local0 then
			f17_local0 = element:dispatchEventToChildren( event )
		end
		return f17_local0
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f18_local0 = nil
		PrepareOpenMenuInSafehouse( controller )
		ShowHeaderIconOnly( f1_local1 )
		SetElementStateByElementName( self, "genericMenuFrame", controller, "Update" )
		PlayClipOnElement( self, {
			elementName = "genericMenuFrame",
			clipName = "Intro"
		}, controller )
		PlayClip( self, "Intro", controller )
		if not f18_local0 then
			f18_local0 = element:dispatchEventToChildren( event )
		end
		return f18_local0
	end )
	f1_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3 )
		SendOwnMenuResponse( f19_arg1, f19_arg2, "closed" )
		Close( self, f19_arg2 )
		ClearMenuSavedState( f19_arg1 )
		PrepareCloseMenuInSafehouse( f19_arg2 )
		PlaySoundSetSound( self, "menu_go_back" )
		MarkCACPaintshopDataDirty( self, f19_arg2 )
		return true
	end, function ( f20_arg0, f20_arg1, f20_arg2 )
		CoD.Menu.SetButtonLabel( f20_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	f1_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f21_arg0, f21_arg1, f21_arg2, f21_arg3 )
		return true
	end, function ( f22_arg0, f22_arg1, f22_arg2 )
		CoD.Menu.SetButtonLabel( f22_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
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
		menu = f1_local1
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

