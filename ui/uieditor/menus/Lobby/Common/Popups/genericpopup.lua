-- bcf827f449001ed93710730379008554
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberBackingMask" )
require( "ui.uieditor.widgets.buttonprompt_small" )
require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_Left" )

LUI.createMenu.GenericPopup = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "GenericPopup" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GenericPopup.buttonPrompts" )
	local f1_local1 = self
	self.anyChildUsesUpdateState = true
	
	local overlayBg = LUI.UIImage.new()
	overlayBg:setLeftRight( true, false, -10, 1310 )
	overlayBg:setTopBottom( true, false, -19.5, 739.5 )
	overlayBg:setRGB( 0, 0, 0 )
	overlayBg:setAlpha( 0.5 )
	self:addElement( overlayBg )
	self.overlayBg = overlayBg
	
	local LobbyMemberBackingMask = CoD.LobbyMemberBackingMask.new( f1_local1, controller )
	LobbyMemberBackingMask:setLeftRight( false, false, -206, 206 )
	LobbyMemberBackingMask:setTopBottom( false, false, -113, 117.5 )
	LobbyMemberBackingMask:setRGB( 0.24, 0.29, 0.33 )
	self:addElement( LobbyMemberBackingMask )
	self.LobbyMemberBackingMask = LobbyMemberBackingMask
	
	local LobbyMemberBackingMask0 = CoD.LobbyMemberBackingMask.new( f1_local1, controller )
	LobbyMemberBackingMask0:setLeftRight( true, true, 434, -434 )
	LobbyMemberBackingMask0:setTopBottom( false, false, -113, 118 )
	LobbyMemberBackingMask0:setRGB( 0.27, 0.33, 0.39 )
	LobbyMemberBackingMask0:setAlpha( 0.59 )
	self:addElement( LobbyMemberBackingMask0 )
	self.LobbyMemberBackingMask0 = LobbyMemberBackingMask0
	
	local txtDescription = LUI.UIText.new()
	txtDescription:setLeftRight( true, true, 459, -459 )
	txtDescription:setTopBottom( false, false, -39, -21 )
	txtDescription:setAlpha( 0 )
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
	
	local PromptSelect = CoD.buttonprompt_small.new( f1_local1, controller )
	PromptSelect:setLeftRight( true, false, 454, 668 )
	PromptSelect:setTopBottom( true, false, 478, 509 )
	PromptSelect:setAlpha( 0 )
	PromptSelect.label:setText( Engine.Localize( "MENU_SELECT" ) )
	PromptSelect:subscribeToGlobalModel( controller, "Controller", "primary_button_image", function ( model )
		local primaryButtonImage = Engine.GetModelValue( model )
		if primaryButtonImage then
			PromptSelect.buttonPromptImage:setImage( RegisterImage( primaryButtonImage ) )
		end
	end )
	self:addElement( PromptSelect )
	self.PromptSelect = PromptSelect
	
	local PromptBack = CoD.buttonprompt_small.new( f1_local1, controller )
	PromptBack:setLeftRight( true, false, 552, 766 )
	PromptBack:setTopBottom( true, false, 478, 509 )
	PromptBack:setAlpha( 0 )
	PromptBack.label:setText( Engine.Localize( "MENU_BACK" ) )
	PromptBack:subscribeToGlobalModel( controller, "Controller", "secondary_button_image", function ( model )
		local secondaryButtonImage = Engine.GetModelValue( model )
		if secondaryButtonImage then
			PromptBack.buttonPromptImage:setImage( RegisterImage( secondaryButtonImage ) )
		end
	end )
	self:addElement( PromptBack )
	self.PromptBack = PromptBack
	
	local lstOptions = LUI.UIList.new( f1_local1, controller, 2, 0, nil, false, false, 0, 0, false, false )
	lstOptions:makeFocusable()
	lstOptions:setLeftRight( true, true, 500, -500 )
	lstOptions:setTopBottom( false, false, -38, 164 )
	lstOptions:setAlpha( 0 )
	lstOptions:setWidgetType( CoD.List1ButtonLarge_Left )
	lstOptions:setVerticalCount( 6 )
	lstOptions:setDataSource( "LobbyPromptSelectionList" )
	lstOptions:registerEventHandler( "gain_focus", function ( element, event )
		local f5_local0 = nil
		if element.gainFocus then
			f5_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f5_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f5_local0
	end )
	lstOptions:registerEventHandler( "lose_focus", function ( element, event )
		local f6_local0 = nil
		if element.loseFocus then
			f6_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f6_local0 = element.super:loseFocus( event )
		end
		return f6_local0
	end )
	f1_local1:AddButtonCallbackFunction( lstOptions, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
		ProcessListAction( self, f7_arg0, f7_arg2 )
		return true
	end, function ( f8_arg0, f8_arg1, f8_arg2 )
		CoD.Menu.SetButtonLabel( f8_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( lstOptions )
	self.lstOptions = lstOptions
	
	local TitleLbl = LUI.UITightText.new()
	TitleLbl:setLeftRight( true, false, 459, 523 )
	TitleLbl:setTopBottom( true, false, 266, 309 )
	TitleLbl:setRGB( 0.87, 0.88, 0.78 )
	TitleLbl:setAlpha( 0 )
	TitleLbl:setTTF( "fonts/escom.ttf" )
	TitleLbl:subscribeToGlobalModel( controller, "LobbyPromptTitle", "lobbyPromptTitle", function ( model )
		local lobbyPromptTitle = Engine.GetModelValue( model )
		if lobbyPromptTitle then
			TitleLbl:setText( Engine.Localize( lobbyPromptTitle ) )
		end
	end )
	self:addElement( TitleLbl )
	self.TitleLbl = TitleLbl
	
	local ProcessingText = LUI.UIText.new()
	ProcessingText:setLeftRight( true, false, 459, 821 )
	ProcessingText:setTopBottom( true, false, 277.5, 302.5 )
	ProcessingText:setText( Engine.Localize( "GROUPS_PROCESSING_REQUEST" ) )
	ProcessingText:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	ProcessingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ProcessingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ProcessingText )
	self.ProcessingText = ProcessingText
	
	local Spinner = LUI.UIImage.new()
	Spinner:setLeftRight( true, false, 592, 688 )
	Spinner:setTopBottom( true, false, 330, 426 )
	Spinner:setupSpinner()
	self:addElement( Spinner )
	self.Spinner = Spinner
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				txtDescription:completeAnimation()
				self.txtDescription:setAlpha( 1 )
				self.clipFinished( txtDescription, {} )
				PromptSelect:completeAnimation()
				self.PromptSelect:setAlpha( 1 )
				self.clipFinished( PromptSelect, {} )
				PromptBack:completeAnimation()
				self.PromptBack:setAlpha( 1 )
				self.clipFinished( PromptBack, {} )
				lstOptions:completeAnimation()
				self.lstOptions:setAlpha( 1 )
				self.clipFinished( lstOptions, {} )
				TitleLbl:completeAnimation()
				self.TitleLbl:setAlpha( 1 )
				self.clipFinished( TitleLbl, {} )
				ProcessingText:completeAnimation()
				self.ProcessingText:setAlpha( 0 )
				self.clipFinished( ProcessingText, {} )
			end
		},
		Processing = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				txtDescription:completeAnimation()
				self.txtDescription:setAlpha( 0 )
				self.clipFinished( txtDescription, {} )
				PromptSelect:completeAnimation()
				self.PromptSelect:setAlpha( 0 )
				self.clipFinished( PromptSelect, {} )
				PromptBack:completeAnimation()
				self.PromptBack:setAlpha( 0 )
				self.clipFinished( PromptBack, {} )
				lstOptions:completeAnimation()
				self.lstOptions:setAlpha( 0 )
				self.clipFinished( lstOptions, {} )
				TitleLbl:completeAnimation()
				self.TitleLbl:setAlpha( 0 )
				self.clipFinished( TitleLbl, {} )
				ProcessingText:completeAnimation()
				self.ProcessingText:setAlpha( 1 )
				self.clipFinished( ProcessingText, {} )
			end
		}
	}
	f1_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
		GoBack( self, f12_arg2 )
		return true
	end, function ( f13_arg0, f13_arg1, f13_arg2 )
		CoD.Menu.SetButtonLabel( f13_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
		return false
	end, false )
	lstOptions.id = "lstOptions"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f1_local1
	} )
	if not self:restoreState() then
		self.lstOptions:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LobbyMemberBackingMask:close()
		element.LobbyMemberBackingMask0:close()
		element.PromptSelect:close()
		element.PromptBack:close()
		element.lstOptions:close()
		element.txtDescription:close()
		element.TitleLbl:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "GenericPopup.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

