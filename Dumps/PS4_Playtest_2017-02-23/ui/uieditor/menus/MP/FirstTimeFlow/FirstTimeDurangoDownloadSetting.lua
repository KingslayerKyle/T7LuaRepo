require( "ui.uieditor.widgets.CAC.Customization.CACGenericButton" )
require( "ui.uieditor.widgets.Footer.fe_LeftContainer_NOTLobby" )

LUI.createMenu.FirstTimeDurangoDownloadSetting = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "FirstTimeDurangoDownloadSetting" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "FirstTimeDurangoDownloadSetting.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( 0, 1, 0, 0 )
	background:setTopBottom( 0, 1, 0, 0 )
	background:setRGB( 0, 0, 0 )
	background:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
		return retVal
	end )
	background:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( background, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	self:addElement( background )
	self.background = background
	
	local NEWBGIMAGE = LUI.UIImage.new()
	NEWBGIMAGE:setLeftRight( 0, 1, -6, 6 )
	NEWBGIMAGE:setTopBottom( 0, 1, 161, -161 )
	NEWBGIMAGE:setImage( RegisterImage( "uie_t7_menu_welcome_bg3" ) )
	NEWBGIMAGE:setupUIStreamedImage( 0 )
	self:addElement( NEWBGIMAGE )
	self.NEWBGIMAGE = NEWBGIMAGE
	
	local WelcomeTitle = LUI.UIText.new()
	WelcomeTitle:setLeftRight( 0, 0, 701, 1824 )
	WelcomeTitle:setTopBottom( 0, 0, 215, 302 )
	WelcomeTitle:setRGB( 1, 0.41, 0 )
	WelcomeTitle:setText( Engine.Localize( "MENU_DOWNLOAD_SETTING_TITLE" ) )
	WelcomeTitle:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	WelcomeTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	WelcomeTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( WelcomeTitle )
	self.WelcomeTitle = WelcomeTitle
	
	local DescText = LUI.UIText.new()
	DescText:setLeftRight( 0, 0, 701, 1767 )
	DescText:setTopBottom( 0, 0, 302, 330 )
	DescText:setText( Engine.Localize( "MENU_DOWNLOAD_SETTING_TEXT" ) )
	DescText:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	DescText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	DescText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( DescText )
	self.DescText = DescText
	
	local NEWWHITEIMAGE = LUI.UIImage.new()
	NEWWHITEIMAGE:setLeftRight( 0, 0, 188, 609 )
	NEWWHITEIMAGE:setTopBottom( 0, 0, 230, 682 )
	NEWWHITEIMAGE:setImage( RegisterImage( "uie_t7_menu_welcome_whitelogo" ) )
	NEWWHITEIMAGE:setupUIStreamedImage( 0 )
	self:addElement( NEWWHITEIMAGE )
	self.NEWWHITEIMAGE = NEWWHITEIMAGE
	
	local FEFocusBarSolid = LUI.UIImage.new()
	FEFocusBarSolid:setLeftRight( 0, 1, -31, 37 )
	FEFocusBarSolid:setTopBottom( 0.5, 0.5, -385, -373 )
	FEFocusBarSolid:setRGB( 0, 0, 0 )
	FEFocusBarSolid:setAlpha( 0.7 )
	FEFocusBarSolid:setImage( RegisterImage( "uie_t7_menu_frontend_barfocussolidfull" ) )
	FEFocusBarSolid:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	FEFocusBarSolid:setShaderVector( 0, 0, 0, 0, 0 )
	FEFocusBarSolid:setupNineSliceShader( 6, 6 )
	self:addElement( FEFocusBarSolid )
	self.FEFocusBarSolid = FEFocusBarSolid
	
	local FEFocusBarAdd = LUI.UIImage.new()
	FEFocusBarAdd:setLeftRight( 0, 1, -36, 38 )
	FEFocusBarAdd:setTopBottom( 0.5, 0.5, -385, -373 )
	FEFocusBarAdd:setRGB( 1, 0.9, 0.8 )
	FEFocusBarAdd:setImage( RegisterImage( "uie_t7_menu_frontend_barfocusfull" ) )
	FEFocusBarAdd:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	FEFocusBarAdd:setShaderVector( 0, 0, 0, 0, 0 )
	FEFocusBarAdd:setupNineSliceShader( 6, 6 )
	self:addElement( FEFocusBarAdd )
	self.FEFocusBarAdd = FEFocusBarAdd
	
	local Glow2 = LUI.UIImage.new()
	Glow2:setLeftRight( 0, 1, -178, 144 )
	Glow2:setTopBottom( 0, 0, 153, 175 )
	Glow2:setRGB( 1, 0.99, 0 )
	Glow2:setAlpha( 0.7 )
	Glow2:setImage( RegisterImage( "uie_t7_cp_hud_enemytarget_glow" ) )
	Glow2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow2 )
	self.Glow2 = Glow2
	
	local FEFocusBarSolid0 = LUI.UIImage.new()
	FEFocusBarSolid0:setLeftRight( 0, 1, -31, 37 )
	FEFocusBarSolid0:setTopBottom( 0.5, 0.5, 373, 385 )
	FEFocusBarSolid0:setRGB( 0, 0, 0 )
	FEFocusBarSolid0:setAlpha( 0.7 )
	FEFocusBarSolid0:setImage( RegisterImage( "uie_t7_menu_frontend_barfocussolidfull" ) )
	FEFocusBarSolid0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	FEFocusBarSolid0:setShaderVector( 0, 0, 0, 0, 0 )
	FEFocusBarSolid0:setupNineSliceShader( 6, 6 )
	self:addElement( FEFocusBarSolid0 )
	self.FEFocusBarSolid0 = FEFocusBarSolid0
	
	local FEFocusBarAdd0 = LUI.UIImage.new()
	FEFocusBarAdd0:setLeftRight( 0, 1, -36, 38 )
	FEFocusBarAdd0:setTopBottom( 0.5, 0.5, 373, 385 )
	FEFocusBarAdd0:setRGB( 1, 0.9, 0.8 )
	FEFocusBarAdd0:setAlpha( 0.99 )
	FEFocusBarAdd0:setImage( RegisterImage( "uie_t7_menu_frontend_barfocusfull" ) )
	FEFocusBarAdd0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	FEFocusBarAdd0:setShaderVector( 0, 0, 0, 0, 0 )
	FEFocusBarAdd0:setupNineSliceShader( 6, 6 )
	self:addElement( FEFocusBarAdd0 )
	self.FEFocusBarAdd0 = FEFocusBarAdd0
	
	local Glow20 = LUI.UIImage.new()
	Glow20:setLeftRight( 0, 1, -178, 144 )
	Glow20:setTopBottom( 0, 0, 905, 927 )
	Glow20:setRGB( 1, 0.99, 0 )
	Glow20:setAlpha( 0.7 )
	Glow20:setXRot( 180 )
	Glow20:setImage( RegisterImage( "uie_t7_cp_hud_enemytarget_glow" ) )
	Glow20:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow20 )
	self.Glow20 = Glow20
	
	local buttons = CoD.fe_LeftContainer_NOTLobby.new( self, controller )
	buttons:setLeftRight( 0, 0, 701, 1349 )
	buttons:setTopBottom( 0, 0, 857, 905 )
	self:addElement( buttons )
	self.buttons = buttons
	
	local Zombie = CoD.CACGenericButton.new( self, controller )
	Zombie:setLeftRight( 0, 0, 701, 1121 )
	Zombie:setTopBottom( 0, 0, 456, 504 )
	Zombie.btnDisplayText:setText( Engine.Localize( "MENU_ZOMBIE_CAPS" ) )
	Zombie.btnDisplayTextStroke:setText( Engine.Localize( "MENU_ZOMBIE_CAPS" ) )
	Zombie:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	Zombie:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( Zombie, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsGameModeInstalled( "", Enum.eModes.MODE_ZOMBIES ) then
			SetProfileVar( controller, "com_first_time", 0 )
			UpdateGamerprofile( self, element, controller )
			ForceNotifyGlobalModel( controller, "mainFirstTimeFlowComplete" )
			SetDownloadPreference( controller, Enum.eModes.MODE_ZOMBIES )
			return true
		else
			OpenGenericSmallPopup( menu, controller, "MENU_DOWNLOAD_SETTING_TITLE", "MENU_DOWNLOAD_COMPLETE", "", "", "", "" )
			return true
		end
	end, function ( element, menu, controller )
		if not IsGameModeInstalled( "", Enum.eModes.MODE_ZOMBIES ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "", nil )
			return false
		end
	end, false )
	self:addElement( Zombie )
	self.Zombie = Zombie
	
	local Multiplayer = CoD.CACGenericButton.new( self, controller )
	Multiplayer:setLeftRight( 0, 0, 701, 1121 )
	Multiplayer:setTopBottom( 0, 0, 408, 456 )
	Multiplayer.btnDisplayText:setText( Engine.Localize( "MENU_MULTIPLAYER_CAPS" ) )
	Multiplayer.btnDisplayTextStroke:setText( Engine.Localize( "MENU_MULTIPLAYER_CAPS" ) )
	Multiplayer:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	Multiplayer:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( Multiplayer, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsGameModeInstalled( "", Enum.eModes.MODE_MULTIPLAYER ) then
			SetProfileVar( controller, "com_first_time", 0 )
			UpdateGamerprofile( self, element, controller )
			ForceNotifyGlobalModel( controller, "mainFirstTimeFlowComplete" )
			SetDownloadPreference( controller, Enum.eModes.MODE_MULTIPLAYER )
			return true
		else
			OpenGenericSmallPopup( menu, controller, "MENU_DOWNLOAD_SETTING_TITLE", "MENU_DOWNLOAD_COMPLETE", "", "", "", "" )
			return true
		end
	end, function ( element, menu, controller )
		if not IsGameModeInstalled( "", Enum.eModes.MODE_MULTIPLAYER ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "", nil )
			return false
		end
	end, false )
	self:addElement( Multiplayer )
	self.Multiplayer = Multiplayer
	
	local Campaign = CoD.CACGenericButton.new( self, controller )
	Campaign:setLeftRight( 0, 0, 701, 1121 )
	Campaign:setTopBottom( 0, 0, 360, 408 )
	Campaign.btnDisplayText:setText( Engine.Localize( "MENU_CAMPAIGN_CAPS" ) )
	Campaign.btnDisplayTextStroke:setText( Engine.Localize( "MENU_CAMPAIGN_CAPS" ) )
	Campaign:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	Campaign:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( Campaign, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsGameModeInstalled( "", Enum.eModes.MODE_CAMPAIGN ) then
			SetProfileVar( controller, "com_first_time", 0 )
			UpdateGamerprofile( self, element, controller )
			ForceNotifyGlobalModel( controller, "mainFirstTimeFlowComplete" )
			SetDownloadPreference( controller, Enum.eModes.MODE_CAMPAIGN )
			return true
		else
			OpenGenericSmallPopup( menu, controller, "MENU_DOWNLOAD_SETTING_TITLE", "MENU_DOWNLOAD_COMPLETE", "", "", "", "" )
			return true
		end
	end, function ( element, menu, controller )
		if not IsGameModeInstalled( "", Enum.eModes.MODE_CAMPAIGN ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "", nil )
			return false
		end
	end, false )
	self:addElement( Campaign )
	self.Campaign = Campaign
	
	Zombie.navigation = {
		up = Multiplayer
	}
	Multiplayer.navigation = {
		up = Campaign,
		down = Zombie
	}
	Campaign.navigation = {
		down = Multiplayer
	}
	self.resetProperties = function ()
		buttons:completeAnimation()
		buttons:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		KBMouse = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				buttons:completeAnimation()
				self.buttons:setAlpha( 0 )
				self.clipFinished( buttons, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "KBMouse",
			condition = function ( menu, element, event )
				return IsPC() and IsMouse( controller )
			end
		}
	} )
	if self.m_eventHandlers.input_source_changed then
		local currentEv = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( self, event )
			event.menu = event.menu or self
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		self:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		self:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	buttons:setModel( self.buttonModel, controller )
	Zombie.id = "Zombie"
	Multiplayer.id = "Multiplayer"
	Campaign.id = "Campaign"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.Campaign:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.buttons:close()
		self.Zombie:close()
		self.Multiplayer:close()
		self.Campaign:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "FirstTimeDurangoDownloadSetting.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

