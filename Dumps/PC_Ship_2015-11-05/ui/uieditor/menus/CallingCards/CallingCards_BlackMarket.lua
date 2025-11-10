require( "ui.uieditor.widgets.StartMenu.StartMenu_Background" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.playercard.SelfIdentityBadge" )
require( "ui.uieditor.widgets.CallingCards.CallingCards_Stickerbook_BlackMarket" )
require( "ui.uieditor.widgets.CallingCards.CallingCards_Stickerbook_Set_BlackMarket" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )

LUI.createMenu.CallingCards_BlackMarket = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CallingCards_BlackMarket" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CallingCards_BlackMarket.buttonPrompts" )
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
	
	local TitleText = LUI.UIText.new()
	TitleText:setLeftRight( true, false, 64, 1280 )
	TitleText:setTopBottom( true, false, 31, 75 )
	TitleText:setAlpha( 0 )
	TitleText:setText( Engine.Localize( "Menu" ) )
	TitleText:setTTF( "fonts/escom.ttf" )
	TitleText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TitleText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TitleText )
	self.TitleText = TitleText
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_CALLING_CARDS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_CALLING_CARDS_CAPS" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local SelfIdentityBadge = CoD.SelfIdentityBadge.new( self, controller )
	SelfIdentityBadge:setLeftRight( true, false, 871, 1216 )
	SelfIdentityBadge:setTopBottom( true, false, 23, 83 )
	self:addElement( SelfIdentityBadge )
	self.SelfIdentityBadge = SelfIdentityBadge
	
	local CommonStickerbookSet = CoD.CallingCards_Stickerbook_BlackMarket.new( self, controller )
	CommonStickerbookSet:setLeftRight( false, false, -574, 576 )
	CommonStickerbookSet:setTopBottom( false, false, -225, 295 )
	CommonStickerbookSet:setAlpha( 0 )
	self:addElement( CommonStickerbookSet )
	self.CommonStickerbookSet = CommonStickerbookSet
	
	local StickerbookSet = CoD.CallingCards_Stickerbook_Set_BlackMarket.new( self, controller )
	StickerbookSet:setLeftRight( false, false, -574, 576 )
	StickerbookSet:setTopBottom( false, false, -225, 295 )
	self:addElement( StickerbookSet )
	self.StickerbookSet = StickerbookSet
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 86, 703.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				CommonStickerbookSet:completeAnimation()
				self.CommonStickerbookSet:setAlpha( 1 )
				self.clipFinished( CommonStickerbookSet, {} )
				StickerbookSet:completeAnimation()
				self.StickerbookSet:setAlpha( 0 )
				self.clipFinished( StickerbookSet, {} )
			end
		},
		CallingCardSet = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				CommonStickerbookSet:completeAnimation()
				self.CommonStickerbookSet:setAlpha( 0 )
				self.clipFinished( CommonStickerbookSet, {} )
				StickerbookSet:completeAnimation()
				self.StickerbookSet:setAlpha( 1 )
				self.clipFinished( StickerbookSet, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "CallingCardSet",
			condition = function ( menu, element, event )
				return not IsPerControllerTablePropertyValue( controller, "BlackMarketUtility_CurrentCallingCardSetName", nil )
			end
		}
	} )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		SetPerControllerTableProperty( controller, "currentCallingCardBlackMarketElement", nil )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller )
		if IsSelfInState( self, "DefaultState" ) then
			SetLoseFocusToElement( self, "StickerbookSet", controller )
			MakeElementNotFocusable( self, "StickerbookSet", controller )
			MakeElementFocusable( self, "CommonStickerbookSet", controller )
			SetFocusToElement( self, "CommonStickerbookSet", controller )
		elseif IsSelfInState( self, "CallingCardSet" ) then
			SetLoseFocusToElement( self, "CommonStickerbookSet", controller )
			MakeElementNotFocusable( self, "CommonStickerbookSet", controller )
			MakeElementFocusable( self, "StickerbookSet", controller )
			SetFocusToElement( self, "StickerbookSet", controller )
		end
	end )
	MenuFrame:setModel( self.buttonModel, controller )
	CommonStickerbookSet.id = "CommonStickerbookSet"
	StickerbookSet.id = "StickerbookSet"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuBackground0:close()
		element.FEButtonPanelShaderContainer0:close()
		element.MenuFrame:close()
		element.SelfIdentityBadge:close()
		element.CommonStickerbookSet:close()
		element.StickerbookSet:close()
		element.FEMenuLeftGraphics:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CallingCards_BlackMarket.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

