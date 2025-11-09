require( "ui.uieditor.widgets.GenericPopups.DialogBackground" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberBackingMask" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreakVignetteContainer" )
require( "ui.uieditor.widgets.buttonprompt_small" )
require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_Left" )
require( "ui.uieditor.widgets.GenericPopups.Generic_Lines_Pop_up" )

local PostLoadFunc = function ( f1_arg0 )
	f1_arg0.disableBlur = true
end

LUI.createMenu.LobbyPromptPopup = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "LobbyPromptPopup" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "LobbyPromptPopup.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local BackgroundDarken = CoD.DialogBackground.new( self, controller )
	BackgroundDarken:setLeftRight( false, false, -640, 640 )
	BackgroundDarken:setTopBottom( false, false, -363, 360 )
	BackgroundDarken:setRGB( 0.4, 0.4, 0.4 )
	BackgroundDarken:setAlpha( 0.45 )
	self:addElement( BackgroundDarken )
	self.BackgroundDarken = BackgroundDarken
	
	local overlayBg = LUI.UIImage.new()
	overlayBg:setLeftRight( true, false, -9.75, 1310.25 )
	overlayBg:setTopBottom( true, false, -19.5, 739.5 )
	overlayBg:setRGB( 0, 0, 0 )
	overlayBg:setAlpha( 0 )
	self:addElement( overlayBg )
	self.overlayBg = overlayBg
	
	local Background = CoD.DialogBackground.new( self, controller )
	Background:setLeftRight( false, false, -212.5, 233 )
	Background:setTopBottom( false, false, -113, 133 )
	Background:setRGB( 0.05, 0.02, 0.02 )
	Background:setAlpha( 0.85 )
	self:addElement( Background )
	self.Background = Background
	
	local LobbyMemberBackingMask = CoD.LobbyMemberBackingMask.new( self, controller )
	LobbyMemberBackingMask:setLeftRight( false, false, -206, 206 )
	LobbyMemberBackingMask:setTopBottom( false, false, -113, 117.5 )
	LobbyMemberBackingMask:setRGB( 0.24, 0.29, 0.33 )
	self:addElement( LobbyMemberBackingMask )
	self.LobbyMemberBackingMask = LobbyMemberBackingMask
	
	local scorestreakVignetteContainer = CoD.scorestreakVignetteContainer.new( self, controller )
	scorestreakVignetteContainer:setLeftRight( true, false, 0, 1280 )
	scorestreakVignetteContainer:setTopBottom( true, false, 0, 720 )
	self:addElement( scorestreakVignetteContainer )
	self.scorestreakVignetteContainer = scorestreakVignetteContainer
	
	local LobbyMemberBackingMask0 = CoD.LobbyMemberBackingMask.new( self, controller )
	LobbyMemberBackingMask0:setLeftRight( true, true, 434, -434 )
	LobbyMemberBackingMask0:setTopBottom( false, false, -113, 118 )
	LobbyMemberBackingMask0:setRGB( 0, 0, 0 )
	LobbyMemberBackingMask0:setAlpha( 0.59 )
	self:addElement( LobbyMemberBackingMask0 )
	self.LobbyMemberBackingMask0 = LobbyMemberBackingMask0
	
	local txtDescription = LUI.UIText.new()
	txtDescription:setLeftRight( true, true, 457, -461 )
	txtDescription:setTopBottom( false, false, -49, -31 )
	txtDescription:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	txtDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	txtDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	txtDescription:subscribeToGlobalModel( controller, "LobbyPromptTitle", "lobbyPromptDescription", function ( model )
		local lobbyPromptDescription = Engine.GetModelValue( model )
		if lobbyPromptDescription then
			txtDescription:setText( Engine.Localize( lobbyPromptDescription ) )
		end
	end )
	self:addElement( txtDescription )
	self.txtDescription = txtDescription
	
	local PromptSelect = CoD.buttonprompt_small.new( self, controller )
	PromptSelect:setLeftRight( true, false, 454, 668 )
	PromptSelect:setTopBottom( true, false, 460, 491 )
	PromptSelect.label:setText( Engine.Localize( "MENU_SELECT" ) )
	PromptSelect:subscribeToGlobalModel( controller, "Controller", "primary_button_image", function ( model )
		local primaryButtonImage = Engine.GetModelValue( model )
		if primaryButtonImage then
			PromptSelect.buttonPromptImage:setImage( RegisterImage( primaryButtonImage ) )
		end
	end )
	self:addElement( PromptSelect )
	self.PromptSelect = PromptSelect
	
	local PromptBack = CoD.buttonprompt_small.new( self, controller )
	PromptBack:setLeftRight( true, false, 552, 766 )
	PromptBack:setTopBottom( true, false, 460, 491 )
	PromptBack.label:setText( Engine.Localize( "MENU_BACK" ) )
	PromptBack:subscribeToGlobalModel( controller, "Controller", "secondary_button_image", function ( model )
		local secondaryButtonImage = Engine.GetModelValue( model )
		if secondaryButtonImage then
			PromptBack.buttonPromptImage:setImage( RegisterImage( secondaryButtonImage ) )
		end
	end )
	self:addElement( PromptBack )
	self.PromptBack = PromptBack
	
	local lstOptions = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	lstOptions:makeFocusable()
	lstOptions:setLeftRight( true, false, 458, 738 )
	lstOptions:setTopBottom( true, false, 366, 568 )
	lstOptions:setDataSource( "LobbyPromptSelectionList" )
	lstOptions:setWidgetType( CoD.List1ButtonLarge_Left )
	lstOptions:setVerticalCount( 6 )
	lstOptions:registerEventHandler( "gain_focus", function ( element, event )
		local f6_local0 = nil
		if element.gainFocus then
			f6_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f6_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f6_local0
	end )
	lstOptions:registerEventHandler( "lose_focus", function ( element, event )
		local f7_local0 = nil
		if element.loseFocus then
			f7_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f7_local0 = element.super:loseFocus( event )
		end
		return f7_local0
	end )
	self:AddButtonCallbackFunction( lstOptions, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( lstOptions )
	self.lstOptions = lstOptions
	
	local TitleLbl = LUI.UITightText.new()
	TitleLbl:setLeftRight( true, false, 454, 518 )
	TitleLbl:setTopBottom( true, false, 266, 309 )
	TitleLbl:setRGB( 0.87, 0.88, 0.78 )
	TitleLbl:setTTF( "fonts/escom.ttf" )
	TitleLbl:subscribeToGlobalModel( controller, "LobbyPromptTitle", "lobbyPromptTitle", function ( model )
		local lobbyPromptTitle = Engine.GetModelValue( model )
		if lobbyPromptTitle then
			TitleLbl:setText( Engine.Localize( lobbyPromptTitle ) )
		end
	end )
	self:addElement( TitleLbl )
	self.TitleLbl = TitleLbl
	
	local emblemline200 = LUI.UIImage.new()
	emblemline200:setLeftRight( true, false, 424.5, 428.5 )
	emblemline200:setTopBottom( true, false, 244.5, 498.5 )
	emblemline200:setAlpha( 0.39 )
	emblemline200:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	emblemline200:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( emblemline200 )
	self.emblemline200 = emblemline200
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, 443, 863 )
	CategoryListLine:setTopBottom( true, false, 455, 461 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setAlpha( 0.85 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local GenericLinesPopup020 = CoD.Generic_Lines_Pop_up.new( self, controller )
	GenericLinesPopup020:setLeftRight( true, false, 884.5, 900.5 )
	GenericLinesPopup020:setTopBottom( true, false, 342, 394 )
	self:addElement( GenericLinesPopup020 )
	self.GenericLinesPopup020 = GenericLinesPopup020
	
	local GenericLinesPopup000 = CoD.Generic_Lines_Pop_up.new( self, controller )
	GenericLinesPopup000:setLeftRight( true, false, 397, 416 )
	GenericLinesPopup000:setTopBottom( true, false, 334, 386 )
	GenericLinesPopup000:setYRot( 198 )
	self:addElement( GenericLinesPopup000 )
	self.GenericLinesPopup000 = GenericLinesPopup000
	
	local emblemline2000 = LUI.UIImage.new()
	emblemline2000:setLeftRight( true, false, 871.5, 875.5 )
	emblemline2000:setTopBottom( true, false, 244.5, 498.5 )
	emblemline2000:setAlpha( 0.39 )
	emblemline2000:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	emblemline2000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( emblemline2000 )
	self.emblemline2000 = emblemline2000
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( true, false, 425.5, 873.5 )
	CategoryListLine0:setTopBottom( true, false, 491, 497 )
	CategoryListLine0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine0:setAlpha( 0.5 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local CategoryListLine00 = LUI.UIImage.new()
	CategoryListLine00:setLeftRight( true, false, 425.5, 873.5 )
	CategoryListLine00:setTopBottom( true, false, 243.5, 249.5 )
	CategoryListLine00:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine00:setAlpha( 0.5 )
	CategoryListLine00:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine00 )
	self.CategoryListLine00 = CategoryListLine00
	
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BackgroundDarken:close()
		element.Background:close()
		element.LobbyMemberBackingMask:close()
		element.scorestreakVignetteContainer:close()
		element.LobbyMemberBackingMask0:close()
		element.PromptSelect:close()
		element.PromptBack:close()
		element.lstOptions:close()
		element.GenericLinesPopup020:close()
		element.GenericLinesPopup000:close()
		element.txtDescription:close()
		element.TitleLbl:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "LobbyPromptPopup.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

