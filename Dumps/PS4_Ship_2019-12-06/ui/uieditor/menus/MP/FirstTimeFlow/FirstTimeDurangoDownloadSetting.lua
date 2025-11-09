require( "ui.uieditor.widgets.Footer.fe_LeftContainer_NOTLobby" )
require( "ui.uieditor.widgets.CAC.Customization.CACGenericButton" )

LUI.createMenu.FirstTimeDurangoDownloadSetting = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "FirstTimeDurangoDownloadSetting" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "FirstTimeDurangoDownloadSetting.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background:setRGB( 0, 0, 0 )
	background:registerEventHandler( "gain_focus", function ( element, event )
		local f2_local0 = nil
		if element.gainFocus then
			f2_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f2_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
		return f2_local0
	end )
	background:registerEventHandler( "lose_focus", function ( element, event )
		local f3_local0 = nil
		if element.loseFocus then
			f3_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f3_local0 = element.super:loseFocus( event )
		end
		return f3_local0
	end )
	self:AddButtonCallbackFunction( background, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:addElement( background )
	self.background = background
	
	local NEWBGIMAGE = LUI.UIImage.new()
	NEWBGIMAGE:setLeftRight( true, true, -3.82, 3.82 )
	NEWBGIMAGE:setTopBottom( true, true, 107.5, -107.5 )
	NEWBGIMAGE:setImage( RegisterImage( "uie_t7_menu_welcome_bg3" ) )
	NEWBGIMAGE:setupUIStreamedImage( 0 )
	self:addElement( NEWBGIMAGE )
	self.NEWBGIMAGE = NEWBGIMAGE
	
	local WelcomeTitle = LUI.UIText.new()
	WelcomeTitle:setLeftRight( true, false, 467.24, 1216 )
	WelcomeTitle:setTopBottom( true, false, 143.45, 201.45 )
	WelcomeTitle:setRGB( 1, 0.41, 0 )
	WelcomeTitle:setText( Engine.Localize( "MENU_DOWNLOAD_SETTING_TITLE" ) )
	WelcomeTitle:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	WelcomeTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	WelcomeTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( WelcomeTitle )
	self.WelcomeTitle = WelcomeTitle
	
	local DescText = LUI.UIText.new()
	DescText:setLeftRight( true, false, 467.24, 1178 )
	DescText:setTopBottom( true, false, 201.45, 220.45 )
	DescText:setText( Engine.Localize( "MENU_DOWNLOAD_SETTING_TEXT" ) )
	DescText:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	DescText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	DescText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( DescText )
	self.DescText = DescText
	
	local NEWWHITEIMAGE = LUI.UIImage.new()
	NEWWHITEIMAGE:setLeftRight( true, false, 125.31, 406.24 )
	NEWWHITEIMAGE:setTopBottom( true, false, 153.45, 454.45 )
	NEWWHITEIMAGE:setImage( RegisterImage( "uie_t7_menu_welcome_whitelogo" ) )
	NEWWHITEIMAGE:setupUIStreamedImage( 0 )
	self:addElement( NEWWHITEIMAGE )
	self.NEWWHITEIMAGE = NEWWHITEIMAGE
	
	local FEFocusBarSolid = LUI.UIImage.new()
	FEFocusBarSolid:setLeftRight( true, true, -20.86, 25.14 )
	FEFocusBarSolid:setTopBottom( false, false, -256.5, -248.5 )
	FEFocusBarSolid:setRGB( 0, 0, 0 )
	FEFocusBarSolid:setAlpha( 0.7 )
	FEFocusBarSolid:setImage( RegisterImage( "uie_t7_menu_frontend_barfocussolidfull" ) )
	FEFocusBarSolid:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	FEFocusBarSolid:setShaderVector( 0, 0, 0.5, 0, 0 )
	FEFocusBarSolid:setupNineSliceShader( 4, 4 )
	self:addElement( FEFocusBarSolid )
	self.FEFocusBarSolid = FEFocusBarSolid
	
	local FEFocusBarAdd = LUI.UIImage.new()
	FEFocusBarAdd:setLeftRight( true, true, -23.86, 25.14 )
	FEFocusBarAdd:setTopBottom( false, false, -256.5, -248.5 )
	FEFocusBarAdd:setRGB( 1, 0.9, 0.8 )
	FEFocusBarAdd:setImage( RegisterImage( "uie_t7_menu_frontend_barfocusfull" ) )
	FEFocusBarAdd:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	FEFocusBarAdd:setShaderVector( 0, 0, 0.5, 0, 0 )
	FEFocusBarAdd:setupNineSliceShader( 4, 4 )
	self:addElement( FEFocusBarAdd )
	self.FEFocusBarAdd = FEFocusBarAdd
	
	local Glow2 = LUI.UIImage.new()
	Glow2:setLeftRight( true, true, -118.86, 96.14 )
	Glow2:setTopBottom( true, false, 102.29, 116.71 )
	Glow2:setRGB( 1, 0.99, 0 )
	Glow2:setAlpha( 0.7 )
	Glow2:setImage( RegisterImage( "uie_t7_cp_hud_enemytarget_glow" ) )
	Glow2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow2 )
	self.Glow2 = Glow2
	
	local FEFocusBarSolid0 = LUI.UIImage.new()
	FEFocusBarSolid0:setLeftRight( true, true, -21, 25 )
	FEFocusBarSolid0:setTopBottom( false, false, 248.5, 256.5 )
	FEFocusBarSolid0:setRGB( 0, 0, 0 )
	FEFocusBarSolid0:setAlpha( 0.7 )
	FEFocusBarSolid0:setImage( RegisterImage( "uie_t7_menu_frontend_barfocussolidfull" ) )
	FEFocusBarSolid0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	FEFocusBarSolid0:setShaderVector( 0, 0, 0.5, 0, 0 )
	FEFocusBarSolid0:setupNineSliceShader( 4, 4 )
	self:addElement( FEFocusBarSolid0 )
	self.FEFocusBarSolid0 = FEFocusBarSolid0
	
	local FEFocusBarAdd0 = LUI.UIImage.new()
	FEFocusBarAdd0:setLeftRight( true, true, -24, 25 )
	FEFocusBarAdd0:setTopBottom( false, false, 248.5, 256.5 )
	FEFocusBarAdd0:setRGB( 1, 0.9, 0.8 )
	FEFocusBarAdd0:setAlpha( 0.99 )
	FEFocusBarAdd0:setImage( RegisterImage( "uie_t7_menu_frontend_barfocusfull" ) )
	FEFocusBarAdd0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	FEFocusBarAdd0:setShaderVector( 0, 0, 0.5, 0, 0 )
	FEFocusBarAdd0:setupNineSliceShader( 4, 4 )
	self:addElement( FEFocusBarAdd0 )
	self.FEFocusBarAdd0 = FEFocusBarAdd0
	
	local Glow20 = LUI.UIImage.new()
	Glow20:setLeftRight( true, true, -119, 96 )
	Glow20:setTopBottom( true, false, 603.29, 617.71 )
	Glow20:setRGB( 1, 0.99, 0 )
	Glow20:setAlpha( 0.7 )
	Glow20:setXRot( 180 )
	Glow20:setImage( RegisterImage( "uie_t7_cp_hud_enemytarget_glow" ) )
	Glow20:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow20 )
	self.Glow20 = Glow20
	
	local buttons = CoD.fe_LeftContainer_NOTLobby.new( self, controller )
	buttons:setLeftRight( true, false, 467.24, 899.24 )
	buttons:setTopBottom( true, false, 571.29, 603.29 )
	self:addElement( buttons )
	self.buttons = buttons
	
	local Zombie = CoD.CACGenericButton.new( self, controller )
	Zombie:setLeftRight( true, false, 467.24, 747.24 )
	Zombie:setTopBottom( true, false, 303.85, 335.85 )
	Zombie.btnDisplayText:setText( Engine.Localize( "MENU_ZOMBIE_CAPS" ) )
	Zombie.btnDisplayTextStroke:setText( Engine.Localize( "MENU_ZOMBIE_CAPS" ) )
	Zombie:registerEventHandler( "gain_focus", function ( element, event )
		local f6_local0 = nil
		if element.gainFocus then
			f6_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f6_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f6_local0
	end )
	Zombie:registerEventHandler( "lose_focus", function ( element, event )
		local f7_local0 = nil
		if element.loseFocus then
			f7_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f7_local0 = element.super:loseFocus( event )
		end
		return f7_local0
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
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
			return true
		end
	end, false )
	self:addElement( Zombie )
	self.Zombie = Zombie
	
	local Multiplayer = CoD.CACGenericButton.new( self, controller )
	Multiplayer:setLeftRight( true, false, 467.24, 747.24 )
	Multiplayer:setTopBottom( true, false, 271.85, 303.85 )
	Multiplayer.btnDisplayText:setText( Engine.Localize( "MENU_MULTIPLAYER_CAPS" ) )
	Multiplayer.btnDisplayTextStroke:setText( Engine.Localize( "MENU_MULTIPLAYER_CAPS" ) )
	Multiplayer:registerEventHandler( "gain_focus", function ( element, event )
		local f10_local0 = nil
		if element.gainFocus then
			f10_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f10_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f10_local0
	end )
	Multiplayer:registerEventHandler( "lose_focus", function ( element, event )
		local f11_local0 = nil
		if element.loseFocus then
			f11_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f11_local0 = element.super:loseFocus( event )
		end
		return f11_local0
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
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
			return true
		end
	end, false )
	self:addElement( Multiplayer )
	self.Multiplayer = Multiplayer
	
	local Campaign = CoD.CACGenericButton.new( self, controller )
	Campaign:setLeftRight( true, false, 467.24, 747.24 )
	Campaign:setTopBottom( true, false, 239.85, 271.85 )
	Campaign.btnDisplayText:setText( Engine.Localize( "MENU_CAMPAIGN_CAPS" ) )
	Campaign.btnDisplayTextStroke:setText( Engine.Localize( "MENU_CAMPAIGN_CAPS" ) )
	Campaign:registerEventHandler( "gain_focus", function ( element, event )
		local f14_local0 = nil
		if element.gainFocus then
			f14_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f14_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f14_local0
	end )
	Campaign:registerEventHandler( "lose_focus", function ( element, event )
		local f15_local0 = nil
		if element.loseFocus then
			f15_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f15_local0 = element.super:loseFocus( event )
		end
		return f15_local0
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
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
			return true
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
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				buttons:completeAnimation()
				self.buttons:setAlpha( 1 )
				self.clipFinished( buttons, {} )
			end
		},
		KBMouse = {
			DefaultClip = function ()
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
		local f1_local17 = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( self, event )
			event.menu = event.menu or self
			self:updateState( event )
			return f1_local17( self, event )
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.buttons:close()
		element.Zombie:close()
		element.Multiplayer:close()
		element.Campaign:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "FirstTimeDurangoDownloadSetting.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

