-- 8d11fee1c0b3276b826356ae09432667
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartMenu.StartMenu_Button_Hero" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Button_LG" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Button_SM" )

CoD.MyShowcase_Categories = InheritFrom( LUI.UIElement )
CoD.MyShowcase_Categories.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.MyShowcase_Categories )
	self.id = "MyShowcase_Categories"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 1160 )
	self:setTopBottom( true, false, 0, 520 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Gunsmith = CoD.StartMenu_Button_Hero.new( menu, controller )
	Gunsmith:setLeftRight( true, false, 9, 570 )
	Gunsmith:setTopBottom( true, true, 1, -181 )
	Gunsmith.imageContainer.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_identity_paintshop" ) )
	Gunsmith.Title:setText( Engine.Localize( "GROUPS_PAINTJOBS_CAPS" ) )
	Gunsmith.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_FILESHARE_PAINTJOBS_DESCRIPTION" ) )
	Gunsmith:registerEventHandler( "gain_focus", function ( element, event )
		local f2_local0 = nil
		if element.gainFocus then
			f2_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f2_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f2_local0
	end )
	Gunsmith:registerEventHandler( "lose_focus", function ( element, event )
		local f3_local0 = nil
		if element.loseFocus then
			f3_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f3_local0 = element.super:loseFocus( event )
		end
		return f3_local0
	end )
	menu:AddButtonCallbackFunction( Gunsmith, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
		if Paintjobs_IsEnabled( f4_arg0, f4_arg2 ) then
			OpenShowcasePaintjobs( self, f4_arg0, f4_arg2, "", f4_arg1 )
			return true
		else
			
		end
	end, function ( f5_arg0, f5_arg1, f5_arg2 )
		CoD.Menu.SetButtonLabel( f5_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if Paintjobs_IsEnabled( f5_arg0, f5_arg2 ) then
			return true
		else
			return false
		end
	end, false )
	self:addElement( Gunsmith )
	self.Gunsmith = Gunsmith
	
	local OutfitsCP = CoD.StartMenu_Button_LG.new( menu, controller )
	OutfitsCP:setLeftRight( true, true, 580, -9 )
	OutfitsCP:setTopBottom( true, false, 1, 163 )
	OutfitsCP:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	OutfitsCP.bg:setImage( RegisterImage( "uie_img_t7_menu_startmenu_identity_campaignbg" ) )
	OutfitsCP.ImageContainer.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_identity_campaign" ) )
	OutfitsCP.Title:setText( Engine.Localize( "MENU_SCREENSHOTS" ) )
	OutfitsCP.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CP_OUTFITS_DESC" ) )
	OutfitsCP.ImageText:setText( Engine.Localize( "" ) )
	OutfitsCP:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return AlwaysFalse() and AlwaysTrue()
			end
		}
	} )
	self:addElement( OutfitsCP )
	self.OutfitsCP = OutfitsCP
	
	local OutfitsZM = CoD.StartMenu_Button_LG.new( menu, controller )
	OutfitsZM:setLeftRight( true, true, 580, -9 )
	OutfitsZM:setTopBottom( false, true, -170, -5 )
	OutfitsZM.bg:setImage( RegisterImage( "uie_img_t7_menu_startmenu_identity_zombie_bg" ) )
	OutfitsZM.ImageContainer.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_identity_zombie" ) )
	OutfitsZM.Title:setText( Engine.Localize( "MENU_CUSTOMGAMES_CAPS" ) )
	OutfitsZM.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_ZM_OUTFITS_DESC" ) )
	OutfitsZM.ImageText:setText( Engine.Localize( "" ) )
	OutfitsZM:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return AlwaysFalse() and AlwaysTrue()
			end
		}
	} )
	self:addElement( OutfitsZM )
	self.OutfitsZM = OutfitsZM
	
	local OutfitsMP = CoD.StartMenu_Button_LG.new( menu, controller )
	OutfitsMP:setLeftRight( true, true, 580, -9 )
	OutfitsMP:setTopBottom( true, true, 176, -181 )
	OutfitsMP.bg:setImage( RegisterImage( "uie_img_t7_menu_startmenu_identity_multybg" ) )
	OutfitsMP.ImageContainer.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_identity_multy" ) )
	OutfitsMP.Title:setText( Engine.Localize( "CLIPS" ) )
	OutfitsMP.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_MP_OUTFITS_DESC" ) )
	OutfitsMP.ImageText:setText( Engine.Localize( "" ) )
	OutfitsMP:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return AlwaysFalse() and AlwaysTrue()
			end
		}
	} )
	self:addElement( OutfitsMP )
	self.OutfitsMP = OutfitsMP
	
	local Emblems = CoD.StartMenu_Button_SM.new( menu, controller )
	Emblems:setLeftRight( true, false, 338, 570 )
	Emblems:setTopBottom( false, true, -170, -5 )
	Emblems.ImageText:setText( Engine.Localize( "" ) )
	Emblems.ImageContainer.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_identity_emblems" ) )
	Emblems.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_EMBLEMS_CAPS" ) )
	Emblems.ClanTag:setAlpha( 0 )
	Emblems.ClanTag:setText( Engine.Localize( "MENU_NEW" ) )
	Emblems:registerEventHandler( "gain_focus", function ( element, event )
		local f9_local0 = nil
		if element.gainFocus then
			f9_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f9_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f9_local0
	end )
	Emblems:registerEventHandler( "lose_focus", function ( element, event )
		local f10_local0 = nil
		if element.loseFocus then
			f10_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f10_local0 = element.super:loseFocus( event )
		end
		return f10_local0
	end )
	menu:AddButtonCallbackFunction( Emblems, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
		OpenShowcaseEmblems( self, f11_arg0, f11_arg2, "", f11_arg1 )
		return true
	end, function ( f12_arg0, f12_arg1, f12_arg2 )
		CoD.Menu.SetButtonLabel( f12_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( Emblems )
	self.Emblems = Emblems
	
	local Paintshop = CoD.StartMenu_Button_SM.new( menu, controller )
	Paintshop:setLeftRight( true, false, 9, 329 )
	Paintshop:setTopBottom( false, true, -170, -5 )
	Paintshop:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	Paintshop.ImageText:setText( Engine.Localize( "" ) )
	Paintshop.ImageContainer.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_identity_gunsmith" ) )
	Paintshop.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_VARIANTS_CAPS" ) )
	Paintshop.ClanTag:setAlpha( 0 )
	Paintshop.ClanTag:setText( Engine.Localize( "MENU_NEW" ) )
	Paintshop:registerEventHandler( "gain_focus", function ( element, event )
		local f13_local0 = nil
		if element.gainFocus then
			f13_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f13_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f13_local0
	end )
	Paintshop:registerEventHandler( "lose_focus", function ( element, event )
		local f14_local0 = nil
		if element.loseFocus then
			f14_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f14_local0 = element.super:loseFocus( event )
		end
		return f14_local0
	end )
	menu:AddButtonCallbackFunction( Paintshop, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f15_arg0, f15_arg1, f15_arg2, f15_arg3 )
		OpenShowcaseVariants( self, f15_arg0, f15_arg2, "", f15_arg1 )
		return true
	end, function ( f16_arg0, f16_arg1, f16_arg2 )
		CoD.Menu.SetButtonLabel( f16_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( Paintshop )
	self.Paintshop = Paintshop
	
	Gunsmith.navigation = {
		right = {
			OutfitsCP,
			OutfitsMP
		},
		down = {
			Paintshop,
			Emblems
		}
	}
	OutfitsCP.navigation = {
		left = Gunsmith,
		down = OutfitsMP
	}
	OutfitsZM.navigation = {
		left = Emblems,
		up = OutfitsMP
	}
	OutfitsMP.navigation = {
		left = Gunsmith,
		up = OutfitsCP,
		down = OutfitsZM
	}
	Emblems.navigation = {
		left = Paintshop,
		up = Gunsmith,
		right = OutfitsZM
	}
	Paintshop.navigation = {
		up = Gunsmith,
		right = Emblems
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	Gunsmith.id = "Gunsmith"
	OutfitsCP.id = "OutfitsCP"
	OutfitsZM.id = "OutfitsZM"
	OutfitsMP.id = "OutfitsMP"
	Emblems.id = "Emblems"
	Paintshop.id = "Paintshop"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.Gunsmith:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Gunsmith:close()
		element.OutfitsCP:close()
		element.OutfitsZM:close()
		element.OutfitsMP:close()
		element.Emblems:close()
		element.Paintshop:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

