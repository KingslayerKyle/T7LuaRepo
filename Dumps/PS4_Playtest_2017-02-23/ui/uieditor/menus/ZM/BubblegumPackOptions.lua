require( "ui.uieditor.menus.ZM.CopyBubblegumPack" )
require( "ui.uieditor.widgets.CAC.cac_3dTitleIntermediary" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideList" )
require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_PH" )
require( "ui.uieditor.widgets.Pregame.Pregame_TimerOverlay" )

local BubbleGumPackRenamed = function ( self, event )
	local controller = self:getOwner()
	local bubbleGumPackName = event.input
	local bubbleGumPackModel = self:getModel( controller, "bgbPackIndex" )
	local bubbleGumPackIndex = Engine.GetModelValue( bubbleGumPackModel )
	if bubbleGumPackName ~= nil then
		SetBubbleGumPackNameFromPackIndex( controller, bubbleGumPackIndex, bubbleGumPackName )
	end
	GoBack( self, controller )
end

local PostLoadFunc = function ( self, controller )
	self.renameButton.navigation.up = self.copyButton
	self.copyButton.navigation.down = self.renameButton
	self:setModel( CoD.perController[controller].bubbleGumPackModel )
	self:registerEventHandler( "ui_keyboard_input", BubbleGumPackRenamed )
end

LUI.createMenu.BubblegumPackOptions = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "BubblegumPackOptions" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "BubblegumPackOptions.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( 0.5, 0.5, -957, 963 )
	Background:setTopBottom( 0.5, 0.5, -540, 540 )
	Background:setAlpha( 0 )
	Background:setImage( RegisterImage( "img_t7_mp_menu_cac_version5_backdrop720p" ) )
	self:addElement( Background )
	self.Background = Background
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( 0, 0, 96, 987 )
	LeftPanel:setTopBottom( 0, 0, 117, 1107 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local Black = LUI.UIImage.new()
	Black:setLeftRight( 0, 0, 96, 987 )
	Black:setTopBottom( 0, 0, 117, 1107 )
	Black:setRGB( 0, 0, 0 )
	Black:setAlpha( 0.48 )
	self:addElement( Black )
	self.Black = Black
	
	local bottomBorder = LUI.UIImage.new()
	bottomBorder:setLeftRight( 0, 1, 0, 0 )
	bottomBorder:setTopBottom( 1, 1, -102, 0 )
	bottomBorder:setRGB( 0, 0, 0 )
	bottomBorder:setAlpha( 0 )
	self:addElement( bottomBorder )
	self.bottomBorder = bottomBorder
	
	local topBorder = LUI.UIImage.new()
	topBorder:setLeftRight( 0, 1, 0, 0 )
	topBorder:setTopBottom( 0, 0, 0, 140 )
	topBorder:setRGB( 0, 0, 0 )
	topBorder:setAlpha( 0.66 )
	self:addElement( topBorder )
	self.topBorder = topBorder
	
	local TitleGlow1 = CoD.cac_ItemTitleGlow.new( self, controller )
	TitleGlow1:setLeftRight( 0, 0, 95, 386 )
	TitleGlow1:setTopBottom( 0, 0, 166, 229 )
	TitleGlow1:setRGB( 0.9, 0.9, 0.9 )
	self:addElement( TitleGlow1 )
	self.TitleGlow1 = TitleGlow1
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( 0, 1, 79, -1363 )
	Glow:setTopBottom( 0.5, 0.5, -311.5, -374.5 )
	Glow:setAlpha( 0.14 )
	Glow:setImage( RegisterImage( "uie_t7_menu_cac_glow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local BubbleGumPackNameLabel = LUI.UITightText.new()
	BubbleGumPackNameLabel:setLeftRight( 0, 0, 105, 314 )
	BubbleGumPackNameLabel:setTopBottom( 0, 0, 180, 218 )
	BubbleGumPackNameLabel:setRGB( 0.03, 0.01, 0.01 )
	BubbleGumPackNameLabel:setTTF( "fonts/escom.ttf" )
	BubbleGumPackNameLabel:linkToElementModel( self, "bubbleGumPackName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BubbleGumPackNameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( BubbleGumPackNameLabel )
	self.BubbleGumPackNameLabel = BubbleGumPackNameLabel
	
	local cac3dTitleIntermediary0 = CoD.cac_3dTitleIntermediary.new( self, controller )
	cac3dTitleIntermediary0:setLeftRight( 0, 0, -111.5, 755.5 )
	cac3dTitleIntermediary0:setTopBottom( 0, 0, -5.5, 213.5 )
	cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_BGB_PACK_OPTIONS_CAPS" ) )
	self:addElement( cac3dTitleIntermediary0 )
	self.cac3dTitleIntermediary0 = cac3dTitleIntermediary0
	
	local ElemsSideList = CoD.cac_ElemsSideList.new( self, controller )
	ElemsSideList:setLeftRight( 0, 0, 3, 105 )
	ElemsSideList:setTopBottom( 0, 0, 71.5, 1076.5 )
	self:addElement( ElemsSideList )
	self.ElemsSideList = ElemsSideList
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( 0, 0, 0, 1920 )
	CategoryListLine:setTopBottom( 0, 0, 132, 144 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local renameButton = CoD.List1ButtonLarge_PH.new( self, controller )
	renameButton:setLeftRight( 0, 0, 95, 515 )
	renameButton:setTopBottom( 0, 0, 285, 333 )
	renameButton.btnDisplayText:setText( Engine.Localize( "MENU_BGB_PACK_RENAME_CAPS" ) )
	renameButton.btnDisplayTextStroke:setText( Engine.Localize( "MENU_BGB_PACK_RENAME_CAPS" ) )
	renameButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	renameButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( renameButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		BubblegumPackOptionsRename( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( renameButton )
	self.renameButton = renameButton
	
	local copyButton = CoD.List1ButtonLarge_PH.new( self, controller )
	copyButton:setLeftRight( 0, 0, 95, 515 )
	copyButton:setTopBottom( 0, 0, 330, 378 )
	copyButton.btnDisplayText:setText( Engine.Localize( "MENU_COPY_CAPS" ) )
	copyButton.btnDisplayTextStroke:setText( Engine.Localize( "MENU_COPY_CAPS" ) )
	copyButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	copyButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( copyButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		OpenPopup( self, "CopyBubblegumPack", controller, "", "" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( copyButton )
	self.copyButton = copyButton
	
	local feFooterContainer = CoD.fe_FooterContainer_NOTLobby.new( self, controller )
	feFooterContainer:setLeftRight( 0, 1, 0, 0 )
	feFooterContainer:setTopBottom( 1, 1, -98, 0 )
	feFooterContainer:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SizeToSafeArea( element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( feFooterContainer )
	self.feFooterContainer = feFooterContainer
	
	local PregameTimerOverlay = CoD.Pregame_TimerOverlay.new( self, controller )
	PregameTimerOverlay:mergeStateConditions( {
		{
			stateName = "ClassOptions",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	PregameTimerOverlay:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.state" ), function ( model )
		self:updateElementState( PregameTimerOverlay, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.state"
		} )
	end )
	PregameTimerOverlay:setLeftRight( 0, 1, 0, 0 )
	PregameTimerOverlay:setTopBottom( 0, 1, 0, 0 )
	self:addElement( PregameTimerOverlay )
	self.PregameTimerOverlay = PregameTimerOverlay
	
	renameButton.navigation = {
		down = copyButton
	}
	copyButton.navigation = {
		up = renameButton
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		ClearSavedState( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	renameButton.id = "renameButton"
	copyButton.id = "copyButton"
	feFooterContainer:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.renameButton:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LeftPanel:close()
		self.TitleGlow1:close()
		self.cac3dTitleIntermediary0:close()
		self.ElemsSideList:close()
		self.renameButton:close()
		self.copyButton:close()
		self.feFooterContainer:close()
		self.PregameTimerOverlay:close()
		self.BubbleGumPackNameLabel:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "BubblegumPackOptions.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

