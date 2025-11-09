require( "ui.uieditor.widgets.StartMenu.StartMenu_Button_Hero" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Button_Emblem" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Button_LG" )

local PreLoadFunc = function ( self, controller )
	Engine.CreateModel( Engine.GetModelForController( controller ), "Paintshop.DataDownloaded" )
	Engine.CreateModel( Engine.GetModelForController( controller ), "Gunsmith.DataDownloaded" )
	Engine.CreateModel( Engine.GetModelForController( controller ), "Emblem.DataDownloaded" )
end

CoD.StartMenu_Identity = InheritFrom( LUI.UIElement )
CoD.StartMenu_Identity.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Identity )
	self.id = "StartMenu_Identity"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 1160 )
	self:setTopBottom( true, false, 0, 520 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Paint = CoD.StartMenu_Button_Hero.new( menu, controller )
	Paint:setLeftRight( true, false, 9, 762 )
	Paint:setTopBottom( true, true, 1, -181 )
	Paint.imageContainer.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_identity_gunsmith" ) )
	Paint.Title:setText( Engine.Localize( "MENU_PAINTSHOP_CAPS" ) )
	Paint.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_PAINTSHOP_DESC" ) )
	Paint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Paintshop.DataDownloaded" ), function ( model )
		local f3_local0 = Paint
		local f3_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "Paintshop.DataDownloaded"
		}
		CoD.Menu.UpdateButtonShownState( f3_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	Paint:registerEventHandler( "gain_focus", function ( element, event )
		local f4_local0 = nil
		if element.gainFocus then
			f4_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f4_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f4_local0
	end )
	Paint:registerEventHandler( "lose_focus", function ( element, event )
		local f5_local0 = nil
		if element.loseFocus then
			f5_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f5_local0 = element.super:loseFocus( event )
		end
		return f5_local0
	end )
	menu:AddButtonCallbackFunction( Paint, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not Paintjobs_IsFeatureDisabled( element, controller ) then
			OpenPaintshop( self, element, controller, "", menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not Paintjobs_IsFeatureDisabled( element, controller ) then
			return true
		else
			return false
		end
	end, false )
	Paint:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return Paintjobs_IsFeatureDisabled( element, controller )
			end
		}
	} )
	Paint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Paintshop.DataDownloaded" ), function ( model )
		menu:updateElementState( Paint, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Paintshop.DataDownloaded"
		} )
	end )
	self:addElement( Paint )
	self.Paint = Paint
	
	local Emblems = CoD.StartMenu_Button_Emblem.new( menu, controller )
	Emblems:setLeftRight( true, true, 771, -9 )
	Emblems:setTopBottom( true, false, 0, 232.75 )
	Emblems.Title:setText( Engine.Localize( "" ) )
	Emblems.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_EMBLEMS_CAPS" ) )
	Emblems.ImageText:setText( Engine.Localize( "" ) )
	Emblems:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.DataDownloaded" ), function ( model )
		local f10_local0 = Emblems
		local f10_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "Emblem.DataDownloaded"
		}
		CoD.Menu.UpdateButtonShownState( f10_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	Emblems:registerEventHandler( "gain_focus", function ( element, event )
		local f11_local0 = nil
		if element.gainFocus then
			f11_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f11_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f11_local0
	end )
	Emblems:registerEventHandler( "lose_focus", function ( element, event )
		local f12_local0 = nil
		if element.loseFocus then
			f12_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f12_local0 = element.super:loseFocus( event )
		end
		return f12_local0
	end )
	menu:AddButtonCallbackFunction( Emblems, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if Emblems_IsEnabled( element, controller ) then
			OpenEmblemSelect( self, element, controller, menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if Emblems_IsEnabled( element, controller ) then
			return true
		else
			return false
		end
	end, false )
	Emblems:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return not Emblems_IsEnabled( element, controller )
			end
		}
	} )
	Emblems:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.DataDownloaded" ), function ( model )
		menu:updateElementState( Emblems, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Emblem.DataDownloaded"
		} )
	end )
	self:addElement( Emblems )
	self.Emblems = Emblems
	
	local CallingCards = CoD.StartMenu_Button_LG.new( menu, controller )
	CallingCards:setLeftRight( true, true, 771, -9 )
	CallingCards:setTopBottom( true, true, 242.75, -181 )
	CallingCards.bg:setAlpha( 0 )
	CallingCards.Title:setText( Engine.Localize( "" ) )
	CallingCards.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CALLING_CARDS_CAPS" ) )
	CallingCards.ImageText:setText( Engine.Localize( "" ) )
	CallingCards:subscribeToGlobalModel( controller, "PerController", "xuid", function ( model )
		local xuid = Engine.GetModelValue( model )
		if xuid then
			CallingCards.ImageContainer.ImageContainer:setImage( RegisterImage( GetRandomPlayercardForPlayer( xuid ) ) )
		end
	end )
	CallingCards:subscribeToGlobalModel( controller, "PerController", "xuid", function ( model )
		local xuid = Engine.GetModelValue( model )
		if xuid then
			CallingCards.DisabledImage.ImageContainer:setImage( RegisterImage( GetRandomPlayercardForPlayer( xuid ) ) )
		end
	end )
	CallingCards:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( CallingCards )
	self.CallingCards = CallingCards
	
	local ClanTag = CoD.StartMenu_Button_LG.new( menu, controller )
	ClanTag:setLeftRight( true, true, 771, -9 )
	ClanTag:setTopBottom( false, true, -170, -5 )
	ClanTag.bg:setAlpha( 0 )
	ClanTag.ImageContainer.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_clan" ) )
	ClanTag.DisabledImage.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_clan" ) )
	ClanTag.Title:setText( Engine.Localize( "" ) )
	ClanTag.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "FEATURE_CLAN_TAG_CAPS" ) )
	ClanTag.ImageText:setText( Engine.Localize( "" ) )
	ClanTag:registerEventHandler( "gain_focus", function ( element, event )
		local f20_local0 = nil
		if element.gainFocus then
			f20_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f20_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f20_local0
	end )
	ClanTag:registerEventHandler( "lose_focus", function ( element, event )
		local f21_local0 = nil
		if element.loseFocus then
			f21_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f21_local0 = element.super:loseFocus( event )
		end
		return f21_local0
	end )
	menu:AddButtonCallbackFunction( ClanTag, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if AlwaysFalse() then
			EditClanTag( self, element, controller, "", menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if AlwaysFalse() then
			return true
		else
			return false
		end
	end, false )
	ClanTag:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( ClanTag )
	self.ClanTag = ClanTag
	
	local Gunsmith = CoD.StartMenu_Button_LG.new( menu, controller )
	Gunsmith:setLeftRight( true, false, 9, 380.5 )
	Gunsmith:setTopBottom( false, true, -170, -5 )
	Gunsmith.bg:setAlpha( 0 )
	Gunsmith.ImageContainer.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_identity_gunsmithsmall" ) )
	Gunsmith.DisabledImage.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_identity_gunsmithsmall" ) )
	Gunsmith.Title:setText( Engine.Localize( "" ) )
	Gunsmith.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_GUNSMITH_CAPS" ) )
	Gunsmith.ImageText:setText( Engine.Localize( "" ) )
	Gunsmith:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Gunsmith.DataDownloaded" ), function ( model )
		local f25_local0 = Gunsmith
		local f25_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "Gunsmith.DataDownloaded"
		}
		CoD.Menu.UpdateButtonShownState( f25_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	Gunsmith:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Paintshop.DataDownloaded" ), function ( model )
		local f26_local0 = Gunsmith
		local f26_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "Paintshop.DataDownloaded"
		}
		CoD.Menu.UpdateButtonShownState( f26_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	Gunsmith:registerEventHandler( "gain_focus", function ( element, event )
		local f27_local0 = nil
		if element.gainFocus then
			f27_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f27_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f27_local0
	end )
	Gunsmith:registerEventHandler( "lose_focus", function ( element, event )
		local f28_local0 = nil
		if element.loseFocus then
			f28_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f28_local0 = element.super:loseFocus( event )
		end
		return f28_local0
	end )
	menu:AddButtonCallbackFunction( Gunsmith, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
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
	Gunsmith:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return not Gunsmith_IsEnabled( element, controller )
			end
		}
	} )
	Gunsmith:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Gunsmith.DataDownloaded" ), function ( model )
		menu:updateElementState( Gunsmith, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Gunsmith.DataDownloaded"
		} )
	end )
	Gunsmith:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Paintshop.DataDownloaded" ), function ( model )
		menu:updateElementState( Gunsmith, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Paintshop.DataDownloaded"
		} )
	end )
	self:addElement( Gunsmith )
	self.Gunsmith = Gunsmith
	
	local Classified = CoD.StartMenu_Button_LG.new( menu, controller )
	Classified:setLeftRight( true, false, 390.5, 762 )
	Classified:setTopBottom( false, true, -170, -5 )
	Classified.bg:setRGB( 0, 0, 0 )
	Classified.bg:setAlpha( 0 )
	Classified.ImageContainer.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_classified" ) )
	Classified.DisabledImage.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_classified" ) )
	Classified.Title:setText( Engine.Localize( "" ) )
	Classified.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CLASSIFIED_CAPS" ) )
	Classified.ImageText:setText( Engine.Localize( "" ) )
	Classified:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( Classified )
	self.Classified = Classified
	
	Paint.navigation = {
		right = {
			Emblems,
			CallingCards
		},
		down = {
			Gunsmith,
			Classified
		}
	}
	Emblems.navigation = {
		left = Paint,
		down = CallingCards
	}
	CallingCards.navigation = {
		left = Paint,
		up = Emblems,
		down = ClanTag
	}
	ClanTag.navigation = {
		left = Classified,
		up = CallingCards
	}
	Gunsmith.navigation = {
		up = Paint,
		right = Classified
	}
	Classified.navigation = {
		left = Gunsmith,
		up = Paint,
		right = ClanTag
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	Paint.id = "Paint"
	Emblems.id = "Emblems"
	CallingCards.id = "CallingCards"
	ClanTag.id = "ClanTag"
	Gunsmith.id = "Gunsmith"
	Classified.id = "Classified"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.Paint:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Paint:close()
		element.Emblems:close()
		element.CallingCards:close()
		element.ClanTag:close()
		element.Gunsmith:close()
		element.Classified:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

