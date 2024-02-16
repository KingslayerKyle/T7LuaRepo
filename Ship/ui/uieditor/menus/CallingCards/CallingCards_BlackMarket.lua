-- be277c1535bddaa2aad75871231ea326
-- This hash is used for caching, delete to decompile the file again

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
	local f1_local1 = self
	self.anyChildUsesUpdateState = true
	
	local StartMenuBackground0 = CoD.StartMenu_Background.new( f1_local1, controller )
	StartMenuBackground0:setLeftRight( true, true, 0, 0 )
	StartMenuBackground0:setTopBottom( true, true, 0, 0 )
	StartMenuBackground0:mergeStateConditions( {
		{
			stateName = "InGame",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:addElement( StartMenuBackground0 )
	self.StartMenuBackground0 = StartMenuBackground0
	
	local FEButtonPanelShaderContainer0 = CoD.FE_ButtonPanelShaderContainer.new( f1_local1, controller )
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
	
	local MenuFrame = CoD.GenericMenuFrame.new( f1_local1, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_CALLING_CARDS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_CALLING_CARDS_CAPS" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local SelfIdentityBadge = CoD.SelfIdentityBadge.new( f1_local1, controller )
	SelfIdentityBadge:setLeftRight( true, false, 871, 1216 )
	SelfIdentityBadge:setTopBottom( true, false, 23, 83 )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", "identityBadge", function ( model )
		SelfIdentityBadge:setModel( model, controller )
	end )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", nil, function ( model )
		SelfIdentityBadge.CallingCard.CallingCardsFrameWidget:setModel( model, controller )
	end )
	self:addElement( SelfIdentityBadge )
	self.SelfIdentityBadge = SelfIdentityBadge
	
	local CommonStickerbookSet = CoD.CallingCards_Stickerbook_BlackMarket.new( f1_local1, controller )
	CommonStickerbookSet:setLeftRight( false, false, -574, 576 )
	CommonStickerbookSet:setTopBottom( false, false, -225, 295 )
	CommonStickerbookSet:setAlpha( 0 )
	self:addElement( CommonStickerbookSet )
	self.CommonStickerbookSet = CommonStickerbookSet
	
	local StickerbookSet = CoD.CallingCards_Stickerbook_Set_BlackMarket.new( f1_local1, controller )
	StickerbookSet:setLeftRight( false, false, -574, 576 )
	StickerbookSet:setTopBottom( false, false, -225, 295 )
	self:addElement( StickerbookSet )
	self.StickerbookSet = StickerbookSet
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f1_local1, controller )
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
	f1_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
		GoBack( self, f8_arg2 )
		SetPerControllerTableProperty( f8_arg2, "currentCallingCardBlackMarketElement", nil )
		return true
	end, function ( f9_arg0, f9_arg1, f9_arg2 )
		CoD.Menu.SetButtonLabel( f9_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
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
		menu = f1_local1
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

