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
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GenericPopup.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local overlayBg = LUI.UIImage.new()
	overlayBg:setLeftRight( true, false, -10, 1310 )
	overlayBg:setTopBottom( true, false, -19.5, 739.5 )
	overlayBg:setRGB( 0, 0, 0 )
	overlayBg:setAlpha( 0.5 )
	self:addElement( overlayBg )
	self.overlayBg = overlayBg
	
	local LobbyMemberBackingMask = CoD.LobbyMemberBackingMask.new( self, controller )
	LobbyMemberBackingMask:setLeftRight( false, false, -206, 206 )
	LobbyMemberBackingMask:setTopBottom( false, false, -113, 117.5 )
	LobbyMemberBackingMask:setRGB( 0.24, 0.29, 0.33 )
	self:addElement( LobbyMemberBackingMask )
	self.LobbyMemberBackingMask = LobbyMemberBackingMask
	
	local LobbyMemberBackingMask0 = CoD.LobbyMemberBackingMask.new( self, controller )
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
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			txtDescription:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( txtDescription )
	self.txtDescription = txtDescription
	
	local PromptSelect = CoD.buttonprompt_small.new( self, controller )
	PromptSelect:setLeftRight( true, false, 454, 668 )
	PromptSelect:setTopBottom( true, false, 478, 509 )
	PromptSelect:setAlpha( 0 )
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
	PromptBack:setLeftRight( true, false, 552, 766 )
	PromptBack:setTopBottom( true, false, 478, 509 )
	PromptBack:setAlpha( 0 )
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
	lstOptions:setLeftRight( true, true, 500, -500 )
	lstOptions:setTopBottom( false, false, -38, 164 )
	lstOptions:setAlpha( 0 )
	lstOptions:setDataSource( "LobbyPromptSelectionList" )
	lstOptions:setWidgetType( CoD.List1ButtonLarge_Left )
	lstOptions:setVerticalCount( 6 )
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
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
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TitleLbl:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( TitleLbl )
	self.TitleLbl = TitleLbl
	
	local Spinner = LUI.UIImage.new()
	Spinner:setLeftRight( false, false, -64, 64 )
	Spinner:setTopBottom( false, false, -40, 88 )
	self:addElement( Spinner )
	self.Spinner = Spinner
	
	local ProcessingText = LUI.UIText.new()
	ProcessingText:setLeftRight( true, false, 459, 821 )
	ProcessingText:setTopBottom( true, false, 277.5, 302.5 )
	ProcessingText:setText( Engine.Localize( "GROUPS_PROCESSING_REQUEST" ) )
	ProcessingText:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	ProcessingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ProcessingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ProcessingText )
	self.ProcessingText = ProcessingText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
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
				Spinner:completeAnimation()
				self.Spinner:setAlpha( 0 )
				self.clipFinished( Spinner, {} )
				ProcessingText:completeAnimation()
				self.ProcessingText:setAlpha( 0 )
				self.clipFinished( ProcessingText, {} )
			end
		},
		Processing = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
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
				Spinner:completeAnimation()
				self.Spinner:setAlpha( 1 )
				self.clipFinished( Spinner, {} )
				ProcessingText:completeAnimation()
				self.ProcessingText:setAlpha( 1 )
				self.clipFinished( ProcessingText, {} )
			end
		}
	}
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LobbyMemberBackingMask:close()
		self.LobbyMemberBackingMask0:close()
		self.PromptSelect:close()
		self.PromptBack:close()
		self.lstOptions:close()
		self.txtDescription:close()
		self.TitleLbl:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "GenericPopup.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

