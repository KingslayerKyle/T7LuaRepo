require( "ui.uieditor.widgets.StartMenu.StartMenu_Button_Hero" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Button_LG" )
require( "ui.uieditor.menus.CharacterCustomization.OutfitsMainMenu" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Button_SM" )

local PreLoadFunc = function ( self, controller )
	Engine.CreateModel( Engine.GetModelForController( controller ), "Paintshop.DataDownloaded" )
	Engine.CreateModel( Engine.GetModelForController( controller ), "Gunsmith.DataDownloaded" )
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
	
	local Gunsmith = CoD.StartMenu_Button_Hero.new( menu, controller )
	Gunsmith:setLeftRight( true, false, 9, 762 )
	Gunsmith:setTopBottom( true, true, 1, -181 )
	Gunsmith:setRGB( 1, 1, 1 )
	Gunsmith.image:setImage( RegisterImage( "uie_img_t7_menu_startmenu_identity_gunsmith" ) )
	Gunsmith.Title:setText( Engine.Localize( "MENU_GUNSMITH" ) )
	Gunsmith.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_GUNSMITH_DESC" ) )
	Gunsmith:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		if Gunsmith_IsEnabled( element, controller ) then
			OpenGunsmith( self, element, controller, "", menu )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
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
	
	local OutfitsCP = CoD.StartMenu_Button_LG.new( menu, controller )
	OutfitsCP:setLeftRight( true, true, 771, -9 )
	OutfitsCP:setTopBottom( true, false, 1, 163 )
	OutfitsCP:setRGB( 1, 1, 1 )
	OutfitsCP:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	OutfitsCP.bg:setRGB( 1, 1, 1 )
	OutfitsCP.bg:setImage( RegisterImage( "uie_img_t7_menu_startmenu_identity_campaignbg" ) )
	OutfitsCP.ImageContainer:setRGB( 1, 1, 1 )
	OutfitsCP.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_identity_campaign" ) )
	OutfitsCP.Title:setText( Engine.Localize( "MENU_CP_OUTFITS_CAPS" ) )
	OutfitsCP.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CP_OUTFITS_DESC" ) )
	OutfitsCP.ImageText:setText( Engine.Localize( "" ) )
	OutfitsCP:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		if IsCampaign() then
			OpenOverlay( self, "OutfitsMainMenu", controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	OutfitsCP:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return not IsCampaign()
			end
		}
	} )
	self:addElement( OutfitsCP )
	self.OutfitsCP = OutfitsCP
	
	local OutfitsZM = CoD.StartMenu_Button_LG.new( menu, controller )
	OutfitsZM:setLeftRight( true, true, 771, -9 )
	OutfitsZM:setTopBottom( false, true, -170, -5 )
	OutfitsZM:setRGB( 1, 1, 1 )
	OutfitsZM.bg:setRGB( 1, 1, 1 )
	OutfitsZM.bg:setImage( RegisterImage( "uie_img_t7_menu_startmenu_identity_zombie_bg" ) )
	OutfitsZM.ImageContainer:setRGB( 1, 1, 1 )
	OutfitsZM.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_identity_zombie" ) )
	OutfitsZM.Title:setText( Engine.Localize( "MENU_ZM_OUTFITS_CAPS" ) )
	OutfitsZM.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_ZM_OUTFITS_DESC" ) )
	OutfitsZM.ImageText:setText( Engine.Localize( "" ) )
	OutfitsZM:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( OutfitsZM )
	self.OutfitsZM = OutfitsZM
	
	local OutfitsMP = CoD.StartMenu_Button_LG.new( menu, controller )
	OutfitsMP:setLeftRight( true, true, 771, -9 )
	OutfitsMP:setTopBottom( true, true, 176, -181 )
	OutfitsMP:setRGB( 1, 1, 1 )
	OutfitsMP.bg:setRGB( 1, 1, 1 )
	OutfitsMP.bg:setImage( RegisterImage( "uie_img_t7_menu_startmenu_identity_multybg" ) )
	OutfitsMP.ImageContainer:setRGB( 1, 1, 1 )
	OutfitsMP.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_identity_multy" ) )
	OutfitsMP.Title:setText( Engine.Localize( "MENU_MP_OUTFITS_CAPS" ) )
	OutfitsMP.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_MP_OUTFITS_DESC" ) )
	OutfitsMP.ImageText:setText( Engine.Localize( "" ) )
	OutfitsMP:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		if IsMultiplayer() then
			OpenPersonalizeCharacter( self, element, controller, "", menu )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	OutfitsMP:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return not IsMultiplayer()
			end
		}
	} )
	self:addElement( OutfitsMP )
	self.OutfitsMP = OutfitsMP
	
	local Emblems = CoD.StartMenu_Button_SM.new( menu, controller )
	Emblems:setLeftRight( true, false, 9, 167 )
	Emblems:setTopBottom( false, true, -170, -5 )
	Emblems:setRGB( 1, 1, 1 )
	Emblems.ImageText:setText( Engine.Localize( "" ) )
	Emblems.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_identity_emblems" ) )
	Emblems.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_EMBLEMS_CAPS" ) )
	Emblems.ClanTag:setAlpha( 0 )
	Emblems.ClanTag:setText( Engine.Localize( "MENU_NEW" ) )
	Emblems:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		if not IsLAN() then
			OpenEmblemEditor( self, element, controller, "", menu )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	Emblems:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsLAN()
			end
		}
	} )
	Emblems:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyGlobalRoot.lobbyNetworkMode" ), function ( model )
		menu:updateElementState( Emblems, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyGlobalRoot.lobbyNetworkMode"
		} )
	end )
	Emblems:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( Emblems, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	self:addElement( Emblems )
	self.Emblems = Emblems
	
	local CallingCards = CoD.StartMenu_Button_SM.new( menu, controller )
	CallingCards:setLeftRight( true, false, 177, 335 )
	CallingCards:setTopBottom( false, true, -170, -5 )
	CallingCards:setRGB( 1, 1, 1 )
	CallingCards.ImageText:setText( Engine.Localize( "" ) )
	CallingCards.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_identity_callingcards" ) )
	CallingCards.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CALLING_CARDS_CAPS" ) )
	CallingCards.ClanTag:setAlpha( 0 )
	CallingCards.ClanTag:setText( Engine.Localize( "MENU_NEW" ) )
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
	
	local ClanTag = CoD.StartMenu_Button_SM.new( menu, controller )
	ClanTag:setLeftRight( true, false, 345, 503 )
	ClanTag:setTopBottom( false, true, -170, -5 )
	ClanTag:setRGB( 1, 1, 1 )
	ClanTag.ImageText:setText( Engine.Localize( "" ) )
	ClanTag.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "FEATURE_CLAN_TAG_CAPS" ) )
	ClanTag.ClanTag:setAlpha( 0 )
	ClanTag:subscribeToGlobalModel( controller, "PerController", "clanTag", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ClanTag.ClanTag:setText( Engine.Localize( StringAsClanTag( modelValue ) ) )
		end
	end )
	ClanTag:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		if AlwaysFalse() then
			EditClanTag( self, element, controller, "", menu )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
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
	
	local Paintshop = CoD.StartMenu_Button_SM.new( menu, controller )
	Paintshop:setLeftRight( true, false, 512, 762 )
	Paintshop:setTopBottom( false, true, -170, -5 )
	Paintshop:setRGB( 1, 1, 1 )
	Paintshop.ImageText:setText( Engine.Localize( "" ) )
	Paintshop.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_identity_paintshop" ) )
	Paintshop.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_PAINTSHOP_CAPS" ) )
	Paintshop.ClanTag:setAlpha( 0 )
	Paintshop.ClanTag:setText( Engine.Localize( "MENU_NEW" ) )
	Paintshop:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		if Paintjobs_IsEnabled( element, controller ) then
			OpenPaintshop( self, element, controller, "", menu )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	Paintshop:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return not Paintjobs_IsEnabled( element, controller )
			end
		}
	} )
	Paintshop:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Paintshop.DataDownloaded" ), function ( model )
		menu:updateElementState( Paintshop, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Paintshop.DataDownloaded"
		} )
	end )
	self:addElement( Paintshop )
	self.Paintshop = Paintshop
	
	Gunsmith.navigation = {
		right = {
			OutfitsCP,
			OutfitsMP
		},
		down = {
			Emblems,
			CallingCards,
			ClanTag,
			Paintshop
		}
	}
	OutfitsCP.navigation = {
		left = Gunsmith,
		down = OutfitsMP
	}
	OutfitsZM.navigation = {
		left = Paintshop,
		up = OutfitsMP
	}
	OutfitsMP.navigation = {
		left = Gunsmith,
		up = OutfitsCP,
		down = OutfitsZM
	}
	Emblems.navigation = {
		up = Gunsmith,
		right = CallingCards
	}
	CallingCards.navigation = {
		left = Emblems,
		up = Gunsmith,
		right = ClanTag
	}
	ClanTag.navigation = {
		left = CallingCards,
		up = Gunsmith,
		right = Paintshop
	}
	Paintshop.navigation = {
		left = ClanTag,
		up = Gunsmith,
		right = OutfitsZM
	}
	Gunsmith.id = "Gunsmith"
	OutfitsCP.id = "OutfitsCP"
	OutfitsZM.id = "OutfitsZM"
	OutfitsMP.id = "OutfitsMP"
	Emblems.id = "Emblems"
	CallingCards.id = "CallingCards"
	ClanTag.id = "ClanTag"
	Paintshop.id = "Paintshop"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.Gunsmith:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.Gunsmith:close()
		self.OutfitsCP:close()
		self.OutfitsZM:close()
		self.OutfitsMP:close()
		self.Emblems:close()
		self.CallingCards:close()
		self.ClanTag:close()
		self.Paintshop:close()
		CoD.StartMenu_Identity.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

