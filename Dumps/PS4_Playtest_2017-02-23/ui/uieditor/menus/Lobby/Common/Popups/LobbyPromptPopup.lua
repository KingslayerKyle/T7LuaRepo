require( "ui.uieditor.widgets.buttonprompt_small" )
require( "ui.uieditor.widgets.GenericPopups.DialogBackground" )
require( "ui.uieditor.widgets.GenericPopups.Generic_Lines_Pop_up" )
require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_Left" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberBackingMask" )
require( "ui.uieditor.widgets.Lobby.LobbyPromptTxt" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreakVignetteContainer" )

local PostLoadFunc = function ( self )
	self.disableBlur = true
end

LUI.createMenu.LobbyPromptPopup = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "LobbyPromptPopup" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "LobbyPromptPopup.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local BackgroundDarken = CoD.DialogBackground.new( self, controller )
	BackgroundDarken:setLeftRight( 0.5, 0.5, -960, 960 )
	BackgroundDarken:setTopBottom( 0.5, 0.5, -544, 540 )
	BackgroundDarken:setRGB( 0.4, 0.4, 0.4 )
	BackgroundDarken:setAlpha( 0.45 )
	self:addElement( BackgroundDarken )
	self.BackgroundDarken = BackgroundDarken
	
	local overlayBg = LUI.UIImage.new()
	overlayBg:setLeftRight( 0, 0, -15, 1965 )
	overlayBg:setTopBottom( 0, 0, -29, 1109 )
	overlayBg:setRGB( 0, 0, 0 )
	overlayBg:setAlpha( 0 )
	self:addElement( overlayBg )
	self.overlayBg = overlayBg
	
	local Background = CoD.DialogBackground.new( self, controller )
	Background:setLeftRight( 0.5, 0.5, -319, 349 )
	Background:setTopBottom( 0.5, 0.5, -170, 199 )
	Background:setRGB( 0.05, 0.02, 0.02 )
	Background:setAlpha( 0.85 )
	self:addElement( Background )
	self.Background = Background
	
	local LobbyMemberBackingMask = CoD.LobbyMemberBackingMask.new( self, controller )
	LobbyMemberBackingMask:setLeftRight( 0.5, 0.5, -309, 309 )
	LobbyMemberBackingMask:setTopBottom( 0.5, 0.5, -170, 176 )
	LobbyMemberBackingMask:setRGB( 0.24, 0.29, 0.33 )
	self:addElement( LobbyMemberBackingMask )
	self.LobbyMemberBackingMask = LobbyMemberBackingMask
	
	local scorestreakVignetteContainer = CoD.scorestreakVignetteContainer.new( self, controller )
	scorestreakVignetteContainer:setLeftRight( 0, 0, 0, 1920 )
	scorestreakVignetteContainer:setTopBottom( 0, 0, 0, 1080 )
	self:addElement( scorestreakVignetteContainer )
	self.scorestreakVignetteContainer = scorestreakVignetteContainer
	
	local LobbyMemberBackingMask0 = CoD.LobbyMemberBackingMask.new( self, controller )
	LobbyMemberBackingMask0:setLeftRight( 0, 1, 651, -651 )
	LobbyMemberBackingMask0:setTopBottom( 0.5, 0.5, -169, 177 )
	LobbyMemberBackingMask0:setRGB( 0, 0, 0 )
	LobbyMemberBackingMask0:setAlpha( 0.59 )
	self:addElement( LobbyMemberBackingMask0 )
	self.LobbyMemberBackingMask0 = LobbyMemberBackingMask0
	
	local PromptSelect = CoD.buttonprompt_small.new( self, controller )
	PromptSelect:setLeftRight( 0, 0, 681.5, 1002.5 )
	PromptSelect:setTopBottom( 0, 0, 690, 736 )
	PromptSelect.label:setText( Engine.Localize( "MENU_SELECT" ) )
	PromptSelect:subscribeToGlobalModel( controller, "Controller", "primary_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PromptSelect.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( PromptSelect )
	self.PromptSelect = PromptSelect
	
	local PromptBack = CoD.buttonprompt_small.new( self, controller )
	PromptBack:setLeftRight( 0, 0, 827.5, 1148.5 )
	PromptBack:setTopBottom( 0, 0, 690, 736 )
	PromptBack.label:setText( Engine.Localize( "MENU_BACK" ) )
	PromptBack:subscribeToGlobalModel( controller, "Controller", "secondary_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PromptBack.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( PromptBack )
	self.PromptBack = PromptBack
	
	local lstOptions = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	lstOptions:makeFocusable()
	lstOptions:setLeftRight( 0, 0, 687, 1107 )
	lstOptions:setTopBottom( 0, 0, 551, 849 )
	lstOptions:setWidgetType( CoD.List1ButtonLarge_Left )
	lstOptions:setVerticalCount( 6 )
	lstOptions:setDataSource( "LobbyPromptSelectionList" )
	lstOptions:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	lstOptions:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( lstOptions, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( lstOptions )
	self.lstOptions = lstOptions
	
	local TitleLbl = LUI.UITightText.new()
	TitleLbl:setLeftRight( 0, 0, 681, 777 )
	TitleLbl:setTopBottom( 0, 0, 399, 463 )
	TitleLbl:setRGB( 0.87, 0.88, 0.78 )
	TitleLbl:setTTF( "fonts/escom.ttf" )
	TitleLbl:subscribeToGlobalModel( controller, "LobbyPromptTitle", "lobbyPromptTitle", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TitleLbl:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( TitleLbl )
	self.TitleLbl = TitleLbl
	
	local emblemline200 = LUI.UIImage.new()
	emblemline200:setLeftRight( 0, 0, 637, 643 )
	emblemline200:setTopBottom( 0, 0, 367, 748 )
	emblemline200:setAlpha( 0.39 )
	emblemline200:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	emblemline200:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( emblemline200 )
	self.emblemline200 = emblemline200
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( 0, 0, 665, 1295 )
	CategoryListLine:setTopBottom( 0, 0, 683, 692 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setAlpha( 0.85 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local GenericLinesPopup020 = CoD.Generic_Lines_Pop_up.new( self, controller )
	GenericLinesPopup020:setLeftRight( 0, 0, 1327, 1351 )
	GenericLinesPopup020:setTopBottom( 0, 0, 513, 591 )
	self:addElement( GenericLinesPopup020 )
	self.GenericLinesPopup020 = GenericLinesPopup020
	
	local GenericLinesPopup000 = CoD.Generic_Lines_Pop_up.new( self, controller )
	GenericLinesPopup000:setLeftRight( 0, 0, 596, 624 )
	GenericLinesPopup000:setTopBottom( 0, 0, 501, 579 )
	GenericLinesPopup000:setYRot( 198 )
	self:addElement( GenericLinesPopup000 )
	self.GenericLinesPopup000 = GenericLinesPopup000
	
	local emblemline2000 = LUI.UIImage.new()
	emblemline2000:setLeftRight( 0, 0, 1307, 1313 )
	emblemline2000:setTopBottom( 0, 0, 367, 748 )
	emblemline2000:setAlpha( 0.39 )
	emblemline2000:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	emblemline2000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( emblemline2000 )
	self.emblemline2000 = emblemline2000
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( 0, 0, 638, 1310 )
	CategoryListLine0:setTopBottom( 0, 0, 737, 746 )
	CategoryListLine0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine0:setAlpha( 0.5 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local CategoryListLine00 = LUI.UIImage.new()
	CategoryListLine00:setLeftRight( 0, 0, 638, 1310 )
	CategoryListLine00:setTopBottom( 0, 0, 365, 374 )
	CategoryListLine00:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine00:setAlpha( 0.5 )
	CategoryListLine00:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine00 )
	self.CategoryListLine00 = CategoryListLine00
	
	local LobbyPromptTxt = CoD.LobbyPromptTxt.new( self, controller )
	LobbyPromptTxt:setLeftRight( 0, 0, 686, 1229 )
	LobbyPromptTxt:setTopBottom( 0, 0, 466, 492 )
	self:addElement( LobbyPromptTxt )
	self.LobbyPromptTxt = LobbyPromptTxt
	
	self.resetProperties = function ()
		PromptBack:completeAnimation()
		PromptSelect:completeAnimation()
		PromptBack:setAlpha( 1 )
		PromptSelect:setAlpha( 1 )
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
				self:setupElementClipCounter( 2 )
				PromptSelect:completeAnimation()
				self.PromptSelect:setAlpha( 0 )
				self.clipFinished( PromptSelect, {} )
				PromptBack:completeAnimation()
				self.PromptBack:setAlpha( 0 )
				self.clipFinished( PromptBack, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "KBMouse",
			condition = function ( menu, element, event )
				local f13_local0
				if not IsGamepad( controller ) then
					f13_local0 = IsPC()
				else
					f13_local0 = false
				end
				return f13_local0
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
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "", nil )
		return false
	end, false )
	lstOptions.id = "lstOptions"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.lstOptions:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BackgroundDarken:close()
		self.Background:close()
		self.LobbyMemberBackingMask:close()
		self.scorestreakVignetteContainer:close()
		self.LobbyMemberBackingMask0:close()
		self.PromptSelect:close()
		self.PromptBack:close()
		self.lstOptions:close()
		self.GenericLinesPopup020:close()
		self.GenericLinesPopup000:close()
		self.LobbyPromptTxt:close()
		self.TitleLbl:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "LobbyPromptPopup.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

