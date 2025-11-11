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
	self:setLeftRight( 0, 0, 0, 1740 )
	self:setTopBottom( 0, 0, 0, 780 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Gunsmith = CoD.StartMenu_Button_Hero.new( menu, controller )
	Gunsmith:setLeftRight( 0, 0, 13, 855 )
	Gunsmith:setTopBottom( 0, 1, 1, -271 )
	Gunsmith.imageContainer.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_identity_paintshop" ) )
	Gunsmith.Title:setText( Engine.Localize( "GROUPS_PAINTJOBS_CAPS" ) )
	Gunsmith.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_FILESHARE_PAINTJOBS_DESCRIPTION" ) )
	Gunsmith:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	Gunsmith:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( Gunsmith, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if Paintjobs_IsEnabled( element, controller ) then
			OpenShowcasePaintjobs( self, element, controller, "", menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if Paintjobs_IsEnabled( element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( Gunsmith )
	self.Gunsmith = Gunsmith
	
	local OutfitsCP = CoD.StartMenu_Button_LG.new( menu, controller )
	OutfitsCP:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return AlwaysFalse() and AlwaysTrue()
			end
		}
	} )
	OutfitsCP:setLeftRight( 0, 1, 870, -14 )
	OutfitsCP:setTopBottom( 0, 0, 2, 245 )
	OutfitsCP:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	OutfitsCP.ImageContainer.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_identity_campaign" ) )
	OutfitsCP.Title:setText( Engine.Localize( "MENU_SCREENSHOTS" ) )
	OutfitsCP.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CP_OUTFITS_DESC" ) )
	OutfitsCP.ImageText:setText( Engine.Localize( "" ) )
	self:addElement( OutfitsCP )
	self.OutfitsCP = OutfitsCP
	
	local OutfitsZM = CoD.StartMenu_Button_LG.new( menu, controller )
	OutfitsZM:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return AlwaysFalse() and AlwaysTrue()
			end
		}
	} )
	OutfitsZM:setLeftRight( 0, 1, 870, -14 )
	OutfitsZM:setTopBottom( 1, 1, -255, -7 )
	OutfitsZM.ImageContainer.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_identity_zombie" ) )
	OutfitsZM.Title:setText( Engine.Localize( "MENU_CUSTOMGAMES_CAPS" ) )
	OutfitsZM.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_ZM_OUTFITS_DESC" ) )
	OutfitsZM.ImageText:setText( Engine.Localize( "" ) )
	self:addElement( OutfitsZM )
	self.OutfitsZM = OutfitsZM
	
	local OutfitsMP = CoD.StartMenu_Button_LG.new( menu, controller )
	OutfitsMP:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return AlwaysFalse() and AlwaysTrue()
			end
		}
	} )
	OutfitsMP:setLeftRight( 0, 1, 870, -14 )
	OutfitsMP:setTopBottom( 0, 1, 264, -272 )
	OutfitsMP.ImageContainer.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_identity_multy" ) )
	OutfitsMP.Title:setText( Engine.Localize( "CLIPS" ) )
	OutfitsMP.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_MP_OUTFITS_DESC" ) )
	OutfitsMP.ImageText:setText( Engine.Localize( "" ) )
	self:addElement( OutfitsMP )
	self.OutfitsMP = OutfitsMP
	
	local Emblems = CoD.StartMenu_Button_SM.new( menu, controller )
	Emblems:setLeftRight( 0, 0, 507, 855 )
	Emblems:setTopBottom( 1, 1, -255, -7 )
	Emblems.ImageText:setText( Engine.Localize( "" ) )
	Emblems.ImageContainer.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_identity_emblems" ) )
	Emblems.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_EMBLEMS_CAPS" ) )
	Emblems.ClanTag:setAlpha( 0 )
	Emblems.ClanTag:setText( Engine.Localize( "MENU_NEW" ) )
	Emblems:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	Emblems:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( Emblems, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		OpenShowcaseEmblems( self, element, controller, "", menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( Emblems )
	self.Emblems = Emblems
	
	local Paintshop = CoD.StartMenu_Button_SM.new( menu, controller )
	Paintshop:setLeftRight( 0, 0, 14, 494 )
	Paintshop:setTopBottom( 1, 1, -255, -7 )
	Paintshop:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	Paintshop.ImageText:setText( Engine.Localize( "" ) )
	Paintshop.ImageContainer.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_identity_gunsmith" ) )
	Paintshop.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_VARIANTS_CAPS" ) )
	Paintshop.ClanTag:setAlpha( 0 )
	Paintshop.ClanTag:setText( Engine.Localize( "MENU_NEW" ) )
	Paintshop:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	Paintshop:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( Paintshop, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		OpenShowcaseVariants( self, element, controller, "", menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
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
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.Gunsmith:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Gunsmith:close()
		self.OutfitsCP:close()
		self.OutfitsZM:close()
		self.OutfitsMP:close()
		self.Emblems:close()
		self.Paintshop:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

