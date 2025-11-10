require( "ui.uieditor.widgets.StartMenu.StartMenu_Background" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.playercard.SelfIdentityBadge" )
require( "ui.uieditor.widgets.Prestige.Prestige_EnterPrestige" )
require( "ui.uieditor.widgets.Prestige.Prestige_Button" )
require( "ui.uieditor.widgets.Prestige.Prestige_ButtonInfopane" )
require( "ui.uieditor.widgets.Prestige.Prestige_TitleBox" )

local PreLoadFunc = function ( self, controller )
	ClearSavedState( self, controller )
	self:setModel( DataSources.PrestigeButtonInfopane.getModel( controller ) )
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	f2_arg0.disablePopupOpenCloseAnim = true
	if IsMaxPrestigeLevel( f2_arg1 ) then
		f2_arg0.EnterPrestige.navigation.down = f2_arg0.FreshStartButton
		f2_arg0.FreshStartButton.navigation.left = nil
	end
end

LUI.createMenu.Prestige_Main = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Prestige_Main" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Prestige_Main.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local StartMenuBackground0 = CoD.StartMenu_Background.new( self, controller )
	StartMenuBackground0:setLeftRight( true, true, 0, 0 )
	StartMenuBackground0:setTopBottom( true, true, 0, 0 )
	StartMenuBackground0:mergeStateConditions( {
		{
			stateName = "InGame",
			condition = function ( menu, element, event )
				return IsInGame()
			end
		}
	} )
	self:addElement( StartMenuBackground0 )
	self.StartMenuBackground0 = StartMenuBackground0
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( true, true, 0, 0 )
	BlackBG:setTopBottom( true, true, 0, 0 )
	BlackBG:setAlpha( 0.65 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local FEButtonPanelShaderContainer0 = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	FEButtonPanelShaderContainer0:setLeftRight( true, false, -11, 1285 )
	FEButtonPanelShaderContainer0:setTopBottom( true, false, 115.91, 733.91 )
	FEButtonPanelShaderContainer0:setAlpha( 0 )
	self:addElement( FEButtonPanelShaderContainer0 )
	self.FEButtonPanelShaderContainer0 = FEButtonPanelShaderContainer0
	
	local MenuTitleBackground = LUI.UIImage.new()
	MenuTitleBackground:setLeftRight( true, true, 0, 0 )
	MenuTitleBackground:setTopBottom( false, false, -336, -276 )
	MenuTitleBackground:setRGB( 0.12, 0.13, 0.19 )
	MenuTitleBackground:setAlpha( 0 )
	self:addElement( MenuTitleBackground )
	self.MenuTitleBackground = MenuTitleBackground
	
	local ButtonBarBackground = LUI.UIImage.new()
	ButtonBarBackground:setLeftRight( true, true, -3.63, 0 )
	ButtonBarBackground:setTopBottom( false, false, 302, 332 )
	ButtonBarBackground:setRGB( 0.12, 0.13, 0.19 )
	ButtonBarBackground:setAlpha( 0 )
	self:addElement( ButtonBarBackground )
	self.ButtonBarBackground = ButtonBarBackground
	
	local FEMenuLeftGraphics0 = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics0:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics0:setTopBottom( true, false, 86, 703.25 )
	self:addElement( FEMenuLeftGraphics0 )
	self.FEMenuLeftGraphics0 = FEMenuLeftGraphics0
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_PRESTIGE_MODE_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_PRESTIGE_MODE_CAPS" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local SelfIdentityBadge = CoD.SelfIdentityBadge.new( self, controller )
	SelfIdentityBadge:setLeftRight( false, true, -435, -92 )
	SelfIdentityBadge:setTopBottom( true, false, 24, 84 )
	self:addElement( SelfIdentityBadge )
	self.SelfIdentityBadge = SelfIdentityBadge
	
	local HiddenButtonBacking0 = LUI.UIImage.new()
	HiddenButtonBacking0:setLeftRight( true, false, 332, 572 )
	HiddenButtonBacking0:setTopBottom( false, true, -258, -58 )
	HiddenButtonBacking0:setRGB( 0, 0, 0 )
	HiddenButtonBacking0:setAlpha( 0 )
	self:addElement( HiddenButtonBacking0 )
	self.HiddenButtonBacking0 = HiddenButtonBacking0
	
	local HiddenButtonBacking1 = LUI.UIImage.new()
	HiddenButtonBacking1:setLeftRight( true, false, 587, 827 )
	HiddenButtonBacking1:setTopBottom( false, true, -258, -58 )
	HiddenButtonBacking1:setRGB( 0, 0, 0 )
	HiddenButtonBacking1:setAlpha( 0 )
	self:addElement( HiddenButtonBacking1 )
	self.HiddenButtonBacking1 = HiddenButtonBacking1
	
	local EnterPrestige = CoD.Prestige_EnterPrestige.new( self, controller )
	EnterPrestige:setLeftRight( true, false, 91.5, 798.5 )
	EnterPrestige:setTopBottom( true, false, 110.5, 408.5 )
	EnterPrestige:subscribeToGlobalModel( controller, "PrestigeStats", "icon", function ( model )
		local icon = Engine.GetModelValue( model )
		if icon then
			EnterPrestige.PrestigeIcon:setImage( RegisterImage( GetRankIconLarge( icon ) ) )
		end
	end )
	EnterPrestige:subscribeToGlobalModel( controller, "PrestigeStats", "backgroundId", function ( model )
		local backgroundId = Engine.GetModelValue( model )
		if backgroundId then
			EnterPrestige.PrestigeCallingCard:setImage( RegisterImage( GetBackgroundByID( backgroundId ) ) )
		end
	end )
	EnterPrestige:subscribeToGlobalModel( controller, "PrestigeStats", "plevel", function ( model )
		local plevel = Engine.GetModelValue( model )
		if plevel then
			EnterPrestige.PrestigeButtonTitle.ButtonTitle:setText( Engine.Localize( GetPrestigeTitleText( controller, plevel ) ) )
		end
	end )
	EnterPrestige:registerEventHandler( "gain_focus", function ( element, event )
		local f8_local0 = nil
		if element.gainFocus then
			f8_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f8_local0 = element.super:gainFocus( event )
		end
		if not IsMaxPrestigeLevel( controller ) then
			SetGlobalModelValue( "PrestigeButtonInfopane.title", "MENU_ABOUT_PRESTIGE_MODE_CAPS" )
			SetGlobalModelValueArg( "PrestigeButtonInfopane.description", CoD.PrestigeUtility.GetStringForMode( "PRESTIGE_INFOPANE_PRESTIGE_MODE" ) )
			SetElementStateByElementName( self, "InfopaneTop", controller, "Visible" )
			SetElementStateByElementName( self, "InfopaneBottom", controller, "DefaultState" )
		elseif IsMaxPrestigeLevel( controller ) then
			SetGlobalModelValue( "PrestigeButtonInfopane.title", "MENU_ABOUT_PRESTIGE_MASTER_CAPS" )
			SetGlobalModelValueArg( "PrestigeButtonInfopane.description", CoD.PrestigeUtility.GetStringForMode( "PRESTIGE_INFOPANE_PRESTIGE_MASTER" ) )
			SetElementStateByElementName( self, "InfopaneTop", controller, "Visible" )
			SetElementStateByElementName( self, "InfopaneBottom", controller, "DefaultState" )
		else
			CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		end
		return f8_local0
	end )
	EnterPrestige:registerEventHandler( "lose_focus", function ( element, event )
		local f9_local0 = nil
		if element.loseFocus then
			f9_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f9_local0 = element.super:loseFocus( event )
		end
		SetElementStateByElementName( self, "InfopaneTop", controller, "DefaultState" )
		return f9_local0
	end )
	self:AddButtonCallbackFunction( EnterPrestige, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsMaxPrestigeLevel( controller ) and IsAtXPCap( controller ) and not IsElementInState( element, "PrestigeMasterLocked" ) then
			OpenEnterPrestigeModeMenu( self, controller, menu )
			return true
		elseif IsMaxPrestigeLevel( controller ) and AlwaysFalse() then
			OpenCustomizePrestigeMenu( self, controller, menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsMaxPrestigeLevel( controller ) and IsAtXPCap( controller ) and not IsElementInState( element, "PrestigeMasterLocked" ) then
			return true
		elseif IsMaxPrestigeLevel( controller ) and AlwaysFalse() then
			return true
		else
			return false
		end
	end, false )
	EnterPrestige:mergeStateConditions( {
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				local f12_local0
				if not IsMaxPrestigeLevel( controller ) then
					f12_local0 = not IsAtXPCap( controller )
				else
					f12_local0 = false
				end
				return f12_local0
			end
		},
		{
			stateName = "DefaultStateZM",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualToEnum( element, controller, "prestigeGameMode", Enum.eModes.MODE_ZOMBIES )
			end
		},
		{
			stateName = "PrestigeMasterLocked",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "PrestigeStats.plevel", 10 ) and IsAtXPCap( controller )
			end
		}
	} )
	EnterPrestige:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "prestigeGameMode" ), function ( model )
		self:updateElementState( EnterPrestige, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "prestigeGameMode"
		} )
	end )
	EnterPrestige:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "PrestigeStats.plevel" ), function ( model )
		self:updateElementState( EnterPrestige, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "PrestigeStats.plevel"
		} )
	end )
	self:addElement( EnterPrestige )
	self.EnterPrestige = EnterPrestige
	
	local PermanentUnlocksButton = CoD.Prestige_Button.new( self, controller )
	PermanentUnlocksButton:setLeftRight( true, false, 79, 332 )
	PermanentUnlocksButton:setTopBottom( false, true, -274, -73 )
	PermanentUnlocksButton:setScale( 0.9 )
	PermanentUnlocksButton.ButtonIcon:setImage( RegisterImage( "uie_t7_icons_prestige_mp_permanentunlock" ) )
	PermanentUnlocksButton.PrestigeButtonTitle.ButtonTitle:setText( Engine.Localize( "MENU_PERMANENT_UNLOCKS" ) )
	PermanentUnlocksButton:registerEventHandler( "gain_focus", function ( element, event )
		local f17_local0 = nil
		if element.gainFocus then
			f17_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f17_local0 = element.super:gainFocus( event )
		end
		if IsPrestigeLevelAtZero( controller ) then
			SetGlobalModelValue( "PrestigeButtonInfopane.title", "MENU_PERMANENT_UNLOCKS_CAPS" )
			SetGlobalModelValue( "PrestigeButtonInfopane.description", "MENU_PRESTIGE_INFOPANE_LOCKED" )
			SetElementStateByElementName( self, "InfopaneBottom", controller, "Visible" )
		elseif not IsPrestigeLevelAtZero( controller ) then
			SetGlobalModelValue( "PrestigeButtonInfopane.title", "MENU_PERMANENT_UNLOCKS_CAPS" )
			SetGlobalModelValueArg( "PrestigeButtonInfopane.description", CoD.PrestigeUtility.GetStringForMode( "PRESTIGE_INFOPANE_PERMANENT_UNLOCKS" ) )
			SetElementStateByElementName( self, "InfopaneBottom", controller, "Visible" )
		else
			CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		end
		return f17_local0
	end )
	PermanentUnlocksButton:registerEventHandler( "lose_focus", function ( element, event )
		local f18_local0 = nil
		if element.loseFocus then
			f18_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f18_local0 = element.super:loseFocus( event )
		end
		return f18_local0
	end )
	self:AddButtonCallbackFunction( PermanentUnlocksButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsElementInState( element, "Locked" ) then
			OpenPermanentUnlockMenu( self, controller, menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsElementInState( element, "Locked" ) then
			return true
		else
			return false
		end
	end, false )
	PermanentUnlocksButton:mergeStateConditions( {
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsPrestigeLevelAtZero( controller )
			end
		}
	} )
	self:addElement( PermanentUnlocksButton )
	self.PermanentUnlocksButton = PermanentUnlocksButton
	
	local RefundButton = CoD.Prestige_Button.new( self, controller )
	RefundButton:setLeftRight( true, false, 319, 572 )
	RefundButton:setTopBottom( false, true, -274, -73 )
	RefundButton:setScale( 0.9 )
	RefundButton.ButtonIcon:setImage( RegisterImage( "uie_t7_icons_prestige_mp_refund" ) )
	RefundButton.PrestigeButtonTitle.ButtonTitle:setText( Engine.Localize( "MENU_REFUND" ) )
	RefundButton:registerEventHandler( "gain_focus", function ( element, event )
		local f22_local0 = nil
		if element.gainFocus then
			f22_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f22_local0 = element.super:gainFocus( event )
		end
		if IsPrestigeLevelAtZero( controller ) then
			SetGlobalModelValue( "PrestigeButtonInfopane.title", "MENU_REFUND_CAPS" )
			SetGlobalModelValue( "PrestigeButtonInfopane.description", "MENU_PRESTIGE_INFOPANE_LOCKED" )
			SetElementStateByElementName( self, "InfopaneBottom", controller, "Visible" )
		elseif IsElementInState( element, "Locked" ) then
			SetGlobalModelValue( "PrestigeButtonInfopane.title", "MENU_REFUND_CAPS" )
			SetGlobalModelValue( "PrestigeButtonInfopane.description", "MENU_PRESTIGE_INFOPANE_REFUND_LOCKED" )
			SetElementStateByElementName( self, "InfopaneBottom", controller, "Visible" )
		elseif not IsElementInState( element, "Locked" ) then
			SetGlobalModelValue( "PrestigeButtonInfopane.title", "MENU_REFUND_CAPS" )
			SetGlobalModelValue( "PrestigeButtonInfopane.description", "MENU_PRESTIGE_INFOPANE_REFUND" )
			SetElementStateByElementName( self, "InfopaneBottom", controller, "Visible" )
		else
			CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		end
		return f22_local0
	end )
	RefundButton:registerEventHandler( "lose_focus", function ( element, event )
		local f23_local0 = nil
		if element.loseFocus then
			f23_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f23_local0 = element.super:loseFocus( event )
		end
		return f23_local0
	end )
	self:AddButtonCallbackFunction( RefundButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsElementInState( element, "Locked" ) and not IsPrestigeRewardSpent( controller, Enum.prestigeTokenType_e.PRESTIGE_TOKEN_RESPEC ) then
			OpenPrestigeRefundTokensMenu( self, controller, menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsElementInState( element, "Locked" ) and not IsPrestigeRewardSpent( controller, Enum.prestigeTokenType_e.PRESTIGE_TOKEN_RESPEC ) then
			return true
		else
			return false
		end
	end, false )
	RefundButton:mergeStateConditions( {
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsPrestigeRewardSpent( controller, Enum.prestigeTokenType_e.PRESTIGE_TOKEN_RESPEC )
			end
		}
	} )
	self:addElement( RefundButton )
	self.RefundButton = RefundButton
	
	local FreshStartButton = CoD.Prestige_Button.new( self, controller )
	FreshStartButton:setLeftRight( true, false, 559, 812 )
	FreshStartButton:setTopBottom( false, true, -274, -73 )
	FreshStartButton:setScale( 0.9 )
	FreshStartButton.ButtonIcon:setImage( RegisterImage( "uie_t7_icons_prestige_mp_freshstart" ) )
	FreshStartButton.PrestigeButtonTitle.ButtonTitle:setText( Engine.Localize( "MENU_FRESH_START" ) )
	FreshStartButton:registerEventHandler( "gain_focus", function ( element, event )
		local f27_local0 = nil
		if element.gainFocus then
			f27_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f27_local0 = element.super:gainFocus( event )
		end
		if IsPrestigeLevelAtZero( controller ) then
			SetGlobalModelValue( "PrestigeButtonInfopane.title", "MENU_FRESH_START_CAPS" )
			SetGlobalModelValue( "PrestigeButtonInfopane.description", "MENU_PRESTIGE_INFOPANE_LOCKED" )
			SetElementStateByElementName( self, "InfopaneBottom", controller, "Visible" )
		elseif not IsPrestigeLevelAtZero( controller ) then
			SetGlobalModelValue( "PrestigeButtonInfopane.title", "MENU_FRESH_START_CAPS" )
			SetGlobalModelValueArg( "PrestigeButtonInfopane.description", CoD.PrestigeUtility.GetStringForMode( "PRESTIGE_INFOPANE_FRESH_START" ) )
			SetElementStateByElementName( self, "InfopaneBottom", controller, "Visible" )
		else
			CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		end
		return f27_local0
	end )
	FreshStartButton:registerEventHandler( "lose_focus", function ( element, event )
		local f28_local0 = nil
		if element.loseFocus then
			f28_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f28_local0 = element.super:loseFocus( event )
		end
		return f28_local0
	end )
	self:AddButtonCallbackFunction( FreshStartButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsElementInState( element, "Locked" ) and not IsPrestigeRewardSpent( controller, Enum.prestigeTokenType_e.PRESTIGE_TOKEN_RESET_STATS ) then
			OpenPrestigeFreshStartMenu( self, controller, menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsElementInState( element, "Locked" ) and not IsPrestigeRewardSpent( controller, Enum.prestigeTokenType_e.PRESTIGE_TOKEN_RESET_STATS ) then
			return true
		else
			return false
		end
	end, false )
	FreshStartButton:mergeStateConditions( {
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsPrestigeRewardSpent( controller, Enum.prestigeTokenType_e.PRESTIGE_TOKEN_RESET_STATS )
			end
		}
	} )
	self:addElement( FreshStartButton )
	self.FreshStartButton = FreshStartButton
	
	local InfopaneTop = CoD.Prestige_ButtonInfopane.new( self, controller )
	InfopaneTop:setLeftRight( true, false, 838, 1181 )
	InfopaneTop:setTopBottom( true, false, 112.5, 284.5 )
	InfopaneTop:subscribeToGlobalModel( controller, "PrestigeButtonInfopane", "description", function ( model )
		local description = Engine.GetModelValue( model )
		if description then
			InfopaneTop.Body:setText( Engine.Localize( description ) )
		end
	end )
	InfopaneTop:subscribeToGlobalModel( controller, "PrestigeButtonInfopane", "title", function ( model )
		local title = Engine.GetModelValue( model )
		if title then
			InfopaneTop.Title:setText( Engine.Localize( title ) )
		end
	end )
	InfopaneTop:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:addElement( InfopaneTop )
	self.InfopaneTop = InfopaneTop
	
	local InfopaneBottom = CoD.Prestige_ButtonInfopane.new( self, controller )
	InfopaneBottom:setLeftRight( true, false, 838, 1181 )
	InfopaneBottom:setTopBottom( true, false, 457, 641 )
	InfopaneBottom:subscribeToGlobalModel( controller, "PrestigeButtonInfopane", "description", function ( model )
		local description = Engine.GetModelValue( model )
		if description then
			InfopaneBottom.Body:setText( Engine.Localize( description ) )
		end
	end )
	InfopaneBottom:subscribeToGlobalModel( controller, "PrestigeButtonInfopane", "title", function ( model )
		local title = Engine.GetModelValue( model )
		if title then
			InfopaneBottom.Title:setText( Engine.Localize( title ) )
		end
	end )
	InfopaneBottom:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:addElement( InfopaneBottom )
	self.InfopaneBottom = InfopaneBottom
	
	local PermanentUnlockTokens = LUI.UIText.new()
	PermanentUnlockTokens:setLeftRight( true, false, 100, 271 )
	PermanentUnlockTokens:setTopBottom( false, true, -132, -112 )
	PermanentUnlockTokens:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
	PermanentUnlockTokens:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	PermanentUnlockTokens:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	PermanentUnlockTokens:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	PermanentUnlockTokens:subscribeToGlobalModel( controller, "PerController", "permanentUnlockTokensCount", function ( model )
		local permanentUnlockTokensCount = Engine.GetModelValue( model )
		if permanentUnlockTokensCount then
			PermanentUnlockTokens:setAlpha( HideIfPrestigeMaster( controller, HideIfNumEqualTo( 0, permanentUnlockTokensCount ) ) )
		end
	end )
	PermanentUnlockTokens:subscribeToGlobalModel( controller, "PerController", "permanentUnlockTokensCount", function ( model )
		local permanentUnlockTokensCount = Engine.GetModelValue( model )
		if permanentUnlockTokensCount then
			PermanentUnlockTokens:setText( Engine.Localize( GetPermanentUnlockTokenText( controller, permanentUnlockTokensCount ) ) )
		end
	end )
	self:addElement( PermanentUnlockTokens )
	self.PermanentUnlockTokens = PermanentUnlockTokens
	
	local PrestigeAwardsTitle = CoD.Prestige_TitleBox.new( self, controller )
	PrestigeAwardsTitle:setLeftRight( true, false, 95, 447 )
	PrestigeAwardsTitle:setTopBottom( true, false, 424.91, 448.91 )
	PrestigeAwardsTitle.Title:setText( Engine.Localize( "MENU_PRESTIGE_AWARDS_CAPS" ) )
	self:addElement( PrestigeAwardsTitle )
	self.PrestigeAwardsTitle = PrestigeAwardsTitle
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( true, false, 103.36, 800.5 )
	Title:setTopBottom( false, true, -362, -342 )
	Title:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
	Title:setText( Engine.Localize( "MENU_PRESTIGE_MASTER_CAPS" ) )
	Title:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Title:setLetterSpacing( 0.5 )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Title )
	self.Title = Title
	
	EnterPrestige.navigation = {
		down = {
			PermanentUnlocksButton,
			RefundButton,
			FreshStartButton
		}
	}
	PermanentUnlocksButton.navigation = {
		up = EnterPrestige,
		right = RefundButton
	}
	RefundButton.navigation = {
		left = PermanentUnlocksButton,
		up = EnterPrestige,
		right = FreshStartButton
	}
	FreshStartButton.navigation = {
		left = RefundButton,
		up = EnterPrestige
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				HiddenButtonBacking0:completeAnimation()
				self.HiddenButtonBacking0:setAlpha( 0 )
				self.clipFinished( HiddenButtonBacking0, {} )
				HiddenButtonBacking1:completeAnimation()
				self.HiddenButtonBacking1:setAlpha( 0 )
				self.clipFinished( HiddenButtonBacking1, {} )
				PermanentUnlocksButton:completeAnimation()
				self.PermanentUnlocksButton:setAlpha( 1 )
				self.clipFinished( PermanentUnlocksButton, {} )
				RefundButton:completeAnimation()
				self.RefundButton:setAlpha( 1 )
				self.clipFinished( RefundButton, {} )
				Title:completeAnimation()
				self.Title:setAlpha( 0 )
				self.clipFinished( Title, {} )
			end
		},
		PrestigeMaster = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				HiddenButtonBacking0:completeAnimation()
				self.HiddenButtonBacking0:setLeftRight( true, false, 334, 558 )
				self.HiddenButtonBacking0:setTopBottom( false, true, -262.5, -84.5 )
				self.HiddenButtonBacking0:setAlpha( 0.2 )
				self.clipFinished( HiddenButtonBacking0, {} )
				HiddenButtonBacking1:completeAnimation()
				self.HiddenButtonBacking1:setLeftRight( true, false, 573, 797 )
				self.HiddenButtonBacking1:setTopBottom( false, true, -262.5, -84.5 )
				self.HiddenButtonBacking1:setAlpha( 0.2 )
				self.clipFinished( HiddenButtonBacking1, {} )
				PermanentUnlocksButton:completeAnimation()
				self.PermanentUnlocksButton:setAlpha( 0 )
				self.clipFinished( PermanentUnlocksButton, {} )
				RefundButton:completeAnimation()
				self.RefundButton:setAlpha( 0 )
				self.clipFinished( RefundButton, {} )
				FreshStartButton:completeAnimation()
				self.FreshStartButton:setLeftRight( true, false, 79, 332 )
				self.FreshStartButton:setTopBottom( false, true, -274, -73 )
				self.clipFinished( FreshStartButton, {} )
				Title:completeAnimation()
				self.Title:setAlpha( 1 )
				self.clipFinished( Title, {} )
			end
		},
		DefaultStateZM = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				HiddenButtonBacking0:completeAnimation()
				self.HiddenButtonBacking0:setAlpha( 0 )
				self.clipFinished( HiddenButtonBacking0, {} )
				HiddenButtonBacking1:completeAnimation()
				self.HiddenButtonBacking1:setAlpha( 0 )
				self.clipFinished( HiddenButtonBacking1, {} )
				PermanentUnlocksButton:completeAnimation()
				self.PermanentUnlocksButton:setLeftRight( true, false, 67, 456 )
				self.PermanentUnlocksButton:setTopBottom( false, true, -260.38, -46 )
				self.PermanentUnlocksButton:setAlpha( 1 )
				self.clipFinished( PermanentUnlocksButton, {} )
				RefundButton:completeAnimation()
				self.RefundButton:setAlpha( 0 )
				self.clipFinished( RefundButton, {} )
				FreshStartButton:completeAnimation()
				self.FreshStartButton:setLeftRight( true, false, 433, 843 )
				self.FreshStartButton:setTopBottom( false, true, -260.38, -46 )
				self.clipFinished( FreshStartButton, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "PrestigeMaster",
			condition = function ( menu, element, event )
				return IsMaxPrestigeLevel( controller )
			end
		},
		{
			stateName = "DefaultStateZM",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualToEnum( element, controller, "prestigeGameMode", Enum.eModes.MODE_ZOMBIES )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "prestigeGameMode" ), function ( model )
		self:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "prestigeGameMode"
		} )
	end )
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_opened", function ( self, event )
		local f46_local0 = nil
		if IsGlobalModelValueEqualToEnum( self, controller, "prestigeGameMode", Enum.eModes.MODE_ZOMBIES ) then
			SetIsInPrestigeMenu( true )
			DisableWidget( self, "RefundButton" )
		else
			SetIsInPrestigeMenu( true )
		end
		if not f46_local0 then
			f46_local0 = self:dispatchEventToChildren( event )
		end
		return f46_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		SetIsInPrestigeMenu( false )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	MenuFrame:setModel( self.buttonModel, controller )
	EnterPrestige.id = "EnterPrestige"
	PermanentUnlocksButton.id = "PermanentUnlocksButton"
	RefundButton.id = "RefundButton"
	FreshStartButton.id = "FreshStartButton"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.EnterPrestige:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuBackground0:close()
		element.FEButtonPanelShaderContainer0:close()
		element.FEMenuLeftGraphics0:close()
		element.MenuFrame:close()
		element.SelfIdentityBadge:close()
		element.EnterPrestige:close()
		element.PermanentUnlocksButton:close()
		element.RefundButton:close()
		element.FreshStartButton:close()
		element.InfopaneTop:close()
		element.InfopaneBottom:close()
		element.PrestigeAwardsTitle:close()
		element.PermanentUnlockTokens:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Prestige_Main.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

