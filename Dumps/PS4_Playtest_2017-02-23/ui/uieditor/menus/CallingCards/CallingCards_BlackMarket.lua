require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.CallingCards.CallingCards_Stickerbook_BlackMarket" )
require( "ui.uieditor.widgets.CallingCards.CallingCards_Stickerbook_Set_BlackMarket" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.playercard.SelfIdentityBadge" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Background" )

LUI.createMenu.CallingCards_BlackMarket = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CallingCards_BlackMarket" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CallingCards_BlackMarket.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local StartMenuBackground0 = CoD.StartMenu_Background.new( self, controller )
	StartMenuBackground0:mergeStateConditions( {
		{
			stateName = "InGame",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	StartMenuBackground0:setLeftRight( 0, 1, 0, 0 )
	StartMenuBackground0:setTopBottom( 0, 1, 0, 0 )
	self:addElement( StartMenuBackground0 )
	self.StartMenuBackground0 = StartMenuBackground0
	
	local FEButtonPanelShaderContainer0 = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	FEButtonPanelShaderContainer0:setLeftRight( 0, 0, -16, 1928 )
	FEButtonPanelShaderContainer0:setTopBottom( 0, 0, 174, 1101 )
	FEButtonPanelShaderContainer0:setAlpha( 0 )
	self:addElement( FEButtonPanelShaderContainer0 )
	self.FEButtonPanelShaderContainer0 = FEButtonPanelShaderContainer0
	
	local MenuTitleBackground = LUI.UIImage.new()
	MenuTitleBackground:setLeftRight( 0, 1, 0, 0 )
	MenuTitleBackground:setTopBottom( 0.5, 0.5, -504, -414 )
	MenuTitleBackground:setRGB( 0.12, 0.13, 0.19 )
	MenuTitleBackground:setAlpha( 0 )
	self:addElement( MenuTitleBackground )
	self.MenuTitleBackground = MenuTitleBackground
	
	local TitleText = LUI.UIText.new()
	TitleText:setLeftRight( 0, 0, 96, 1920 )
	TitleText:setTopBottom( 0, 0, 47, 113 )
	TitleText:setAlpha( 0 )
	TitleText:setText( Engine.Localize( "Menu" ) )
	TitleText:setTTF( "fonts/escom.ttf" )
	TitleText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TitleText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TitleText )
	self.TitleText = TitleText
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( 0, 1, 0, 0 )
	MenuFrame:setTopBottom( 0, 1, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_CALLING_CARDS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_CALLING_CARDS_CAPS" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local SelfIdentityBadge = CoD.SelfIdentityBadge.new( self, controller )
	SelfIdentityBadge:setLeftRight( 0, 0, 1306, 1824 )
	SelfIdentityBadge:setTopBottom( 0, 0, 35, 125 )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", "identityBadge", function ( model )
		SelfIdentityBadge:setModel( model, controller )
	end )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", nil, function ( model )
		SelfIdentityBadge.CallingCard.CallingCardsFrameWidget:setModel( model, controller )
	end )
	self:addElement( SelfIdentityBadge )
	self.SelfIdentityBadge = SelfIdentityBadge
	
	local CommonStickerbookSet = CoD.CallingCards_Stickerbook_BlackMarket.new( self, controller )
	CommonStickerbookSet:setLeftRight( 0.5, 0.5, -860.5, 864.5 )
	CommonStickerbookSet:setTopBottom( 0.5, 0.5, -338, 442 )
	CommonStickerbookSet:setAlpha( 0 )
	self:addElement( CommonStickerbookSet )
	self.CommonStickerbookSet = CommonStickerbookSet
	
	local StickerbookSet = CoD.CallingCards_Stickerbook_Set_BlackMarket.new( self, controller )
	StickerbookSet:setLeftRight( 0.5, 0.5, -860.5, 864.5 )
	StickerbookSet:setTopBottom( 0.5, 0.5, -338, 442 )
	self:addElement( StickerbookSet )
	self.StickerbookSet = StickerbookSet
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( 0, 0, 29, 107 )
	FEMenuLeftGraphics:setTopBottom( 0, 0, 129, 1055 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	SelfIdentityBadge.navigation = {
		down = {
			CommonStickerbookSet,
			StickerbookSet
		}
	}
	CommonStickerbookSet.navigation = {
		up = SelfIdentityBadge
	}
	StickerbookSet.navigation = {
		up = SelfIdentityBadge
	}
	self.resetProperties = function ()
		CommonStickerbookSet:completeAnimation()
		StickerbookSet:completeAnimation()
		CommonStickerbookSet:setAlpha( 0 )
		StickerbookSet:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
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
				self.resetProperties()
				self:setupElementClipCounter( 0 )
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
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		SetPerControllerTableProperty( controller, "currentCallingCardBlackMarketElement", nil )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, state )
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
	SelfIdentityBadge.id = "SelfIdentityBadge"
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.StartMenuBackground0:close()
		self.FEButtonPanelShaderContainer0:close()
		self.MenuFrame:close()
		self.SelfIdentityBadge:close()
		self.CommonStickerbookSet:close()
		self.StickerbookSet:close()
		self.FEMenuLeftGraphics:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CallingCards_BlackMarket.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

