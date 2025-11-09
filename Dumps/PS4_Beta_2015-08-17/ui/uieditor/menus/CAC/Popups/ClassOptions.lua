require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )
require( "ui.uieditor.widgets.CAC.cac_3dTitleIntermediary" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideList" )
require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_PH" )
require( "ui.uieditor.menus.CAC.Popups.CopyClass" )
require( "ui.uieditor.menus.CAC.Popups.ResetClass" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )
require( "ui.uieditor.widgets.Pregame.Pregame_TimerOverlay" )

local ClassOptionsRenamed = function ( self, event )
	local controller = self:getOwner()
	local customClassName = event.input
	local classNum = CoD.perController[controller].classNum
	if customClassName ~= nil then
		local f1_local0 = CoD.CACUtility.GetLoadoutNameFromIndex( controller, classNum )
		f1_local0:set( customClassName )
	end
	GoBack( self, controller )
	CoD.CACUtility.UpdateAllClasses( controller )
end

local PostLoadFunc = function ( self )
	local controller = self:getOwner()
	self.renameButton.navigation.up = self.clearButton
	self.clearButton.navigation.down = self.renameButton
	self:setModel( CoD.perController[controller].classModel )
	self:registerEventHandler( "ui_keyboard_input", ClassOptionsRenamed )
end

LUI.createMenu.ClassOptions = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ClassOptions" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ClassOptions.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( false, false, -638, 642 )
	Background:setTopBottom( false, false, -360, 360 )
	Background:setImage( RegisterImage( "uie_t7_mp_menu_cac_version5_backdrop720p" ) )
	self:addElement( Background )
	self.Background = Background
	
	local bottomBorder = LUI.UIImage.new()
	bottomBorder:setLeftRight( true, true, 0, 0 )
	bottomBorder:setTopBottom( false, true, -68, 0 )
	bottomBorder:setRGB( 0, 0, 0 )
	self:addElement( bottomBorder )
	self.bottomBorder = bottomBorder
	
	local topBorder = LUI.UIImage.new()
	topBorder:setLeftRight( true, true, 0, 0 )
	topBorder:setTopBottom( true, false, 0, 93 )
	topBorder:setRGB( 0, 0, 0 )
	self:addElement( topBorder )
	self.topBorder = topBorder
	
	local TitleGlow1 = CoD.cac_ItemTitleGlow.new( self, controller )
	TitleGlow1:setLeftRight( true, false, 63, 257 )
	TitleGlow1:setTopBottom( true, false, 110.5, 152.5 )
	TitleGlow1:setRGB( 0.9, 0.9, 0.9 )
	self:addElement( TitleGlow1 )
	self.TitleGlow1 = TitleGlow1
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, true, 53, -908.34 )
	Glow:setTopBottom( false, false, -207.5, -249.5 )
	Glow:setAlpha( 0.14 )
	Glow:setImage( RegisterImage( "uie_t7_menu_cac_glow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local customClassNameLabel = LUI.UITightText.new()
	customClassNameLabel:setLeftRight( true, false, 70, 209 )
	customClassNameLabel:setTopBottom( true, false, 120, 145 )
	customClassNameLabel:setRGB( 0.03, 0.01, 0.01 )
	customClassNameLabel:setTTF( "fonts/escom.ttf" )
	customClassNameLabel:subscribeToGlobalModel( controller, "CustomClassMenu", "customClassName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			customClassNameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( customClassNameLabel )
	self.customClassNameLabel = customClassNameLabel
	
	local cac3dTitleIntermediary0 = CoD.cac_3dTitleIntermediary.new( self, controller )
	cac3dTitleIntermediary0:setLeftRight( true, false, -74.27, 503.73 )
	cac3dTitleIntermediary0:setTopBottom( true, false, -4, 142 )
	cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_CLASS_OPTIONS_CAPS" ) )
	self:addElement( cac3dTitleIntermediary0 )
	self.cac3dTitleIntermediary0 = cac3dTitleIntermediary0
	
	local ElemsSideList = CoD.cac_ElemsSideList.new( self, controller )
	ElemsSideList:setLeftRight( true, false, 2, 69.87 )
	ElemsSideList:setTopBottom( true, false, 48, 718 )
	self:addElement( ElemsSideList )
	self.ElemsSideList = ElemsSideList
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, 0, 1280 )
	CategoryListLine:setTopBottom( true, false, 88, 96 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local renameButton = CoD.List1ButtonLarge_PH.new( self, controller )
	renameButton:setLeftRight( true, false, 63, 343 )
	renameButton:setTopBottom( true, false, 190, 222 )
	renameButton.btnDisplayText:setText( Engine.Localize( "MENU_RENAME_LOADOUT_CAPS" ) )
	renameButton.btnDisplayTextStroke:setText( Engine.Localize( "MENU_RENAME_LOADOUT_CAPS" ) )
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
		ClassOptionsRename( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( renameButton )
	self.renameButton = renameButton
	
	local copyButton = CoD.List1ButtonLarge_PH.new( self, controller )
	copyButton:setLeftRight( true, false, 63, 343 )
	copyButton:setTopBottom( true, false, 220, 252 )
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
		OpenPopup( self, "CopyClass", controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( copyButton )
	self.copyButton = copyButton
	
	local resetButton = CoD.List1ButtonLarge_PH.new( self, controller )
	resetButton:setLeftRight( true, false, 63, 343 )
	resetButton:setTopBottom( true, false, 250, 282 )
	resetButton.btnDisplayText:setText( Engine.Localize( "MENU_RESET_TO_DEFAULT_CAPS" ) )
	resetButton.btnDisplayTextStroke:setText( Engine.Localize( "MENU_RESET_TO_DEFAULT_CAPS" ) )
	resetButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	resetButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( resetButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		OpenPopup( self, "ResetClass", controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( resetButton )
	self.resetButton = resetButton
	
	local clearButton = CoD.List1ButtonLarge_PH.new( self, controller )
	clearButton:setLeftRight( true, false, 63, 343 )
	clearButton:setTopBottom( true, false, 280, 312 )
	clearButton.btnDisplayText:setText( Engine.Localize( "MENU_CLEAR_LOADOUT_CAPS" ) )
	clearButton.btnDisplayTextStroke:setText( Engine.Localize( "MENU_CLEAR_LOADOUT_CAPS" ) )
	clearButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	clearButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( clearButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ClassOptionsClearLoadout( self, element, controller )
		GoBack( self, controller )
		ClearSavedState( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( clearButton )
	self.clearButton = clearButton
	
	local feFooterContainer = CoD.fe_FooterContainer_NOTLobby.new( self, controller )
	feFooterContainer:setLeftRight( true, true, 0, 0 )
	feFooterContainer:setTopBottom( false, true, -65, 0 )
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
	PregameTimerOverlay:setLeftRight( true, true, 0, 0 )
	PregameTimerOverlay:setTopBottom( true, true, 0, 0 )
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
	self:addElement( PregameTimerOverlay )
	self.PregameTimerOverlay = PregameTimerOverlay
	
	renameButton.navigation = {
		left = copyButton,
		down = copyButton
	}
	copyButton.navigation = {
		left = {
			renameButton,
			resetButton
		},
		up = renameButton,
		down = resetButton
	}
	resetButton.navigation = {
		left = {
			copyButton,
			clearButton
		},
		up = copyButton,
		down = clearButton
	}
	clearButton.navigation = {
		up = resetButton,
		right = resetButton
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		ClearSavedState( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	renameButton.id = "renameButton"
	copyButton.id = "copyButton"
	resetButton.id = "resetButton"
	clearButton.id = "clearButton"
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
		self.TitleGlow1:close()
		self.cac3dTitleIntermediary0:close()
		self.ElemsSideList:close()
		self.renameButton:close()
		self.copyButton:close()
		self.resetButton:close()
		self.clearButton:close()
		self.feFooterContainer:close()
		self.PregameTimerOverlay:close()
		self.customClassNameLabel:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "ClassOptions.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

