require( "ui.uieditor.widgets.buttonprompt_small" )
require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_Left" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberBackingMask" )

LUI.createMenu.GenericPopup = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "GenericPopup" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GenericPopup.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local overlayBg = LUI.UIImage.new()
	overlayBg:setLeftRight( 0, 0, -15, 1965 )
	overlayBg:setTopBottom( 0, 0, -29, 1109 )
	overlayBg:setRGB( 0, 0, 0 )
	overlayBg:setAlpha( 0.5 )
	self:addElement( overlayBg )
	self.overlayBg = overlayBg
	
	local LobbyMemberBackingMask = CoD.LobbyMemberBackingMask.new( self, controller )
	LobbyMemberBackingMask:setLeftRight( 0.5, 0.5, -309, 309 )
	LobbyMemberBackingMask:setTopBottom( 0.5, 0.5, -170, 176 )
	LobbyMemberBackingMask:setRGB( 0.24, 0.29, 0.33 )
	self:addElement( LobbyMemberBackingMask )
	self.LobbyMemberBackingMask = LobbyMemberBackingMask
	
	local LobbyMemberBackingMask0 = CoD.LobbyMemberBackingMask.new( self, controller )
	LobbyMemberBackingMask0:setLeftRight( 0, 1, 651, -651 )
	LobbyMemberBackingMask0:setTopBottom( 0.5, 0.5, -169, 177 )
	LobbyMemberBackingMask0:setRGB( 0.27, 0.33, 0.39 )
	LobbyMemberBackingMask0:setAlpha( 0.59 )
	self:addElement( LobbyMemberBackingMask0 )
	self.LobbyMemberBackingMask0 = LobbyMemberBackingMask0
	
	local txtDescription = LUI.UIText.new()
	txtDescription:setLeftRight( 0, 1, 688, -688 )
	txtDescription:setTopBottom( 0.5, 0.5, -58, -31 )
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
	PromptSelect:setLeftRight( 0, 0, 681.5, 1002.5 )
	PromptSelect:setTopBottom( 0, 0, 717, 763 )
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
	PromptBack:setLeftRight( 0, 0, 827.5, 1148.5 )
	PromptBack:setTopBottom( 0, 0, 717, 763 )
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
	lstOptions:setLeftRight( 0, 1, 750, -750 )
	lstOptions:setTopBottom( 0.5, 0.5, -55, 243 )
	lstOptions:setAlpha( 0 )
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
	TitleLbl:setLeftRight( 0, 0, 688, 784 )
	TitleLbl:setTopBottom( 0, 0, 399, 463 )
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
	
	local ProcessingText = LUI.UIText.new()
	ProcessingText:setLeftRight( 0, 0, 688, 1231 )
	ProcessingText:setTopBottom( 0, 0, 416, 454 )
	ProcessingText:setText( Engine.Localize( "GROUPS_PROCESSING_REQUEST" ) )
	ProcessingText:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	ProcessingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ProcessingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ProcessingText )
	self.ProcessingText = ProcessingText
	
	local Spinner = LUI.UIImage.new()
	Spinner:setLeftRight( 0, 0, 888, 1032 )
	Spinner:setTopBottom( 0, 0, 495, 639 )
	Spinner:setupSpinner()
	self:addElement( Spinner )
	self.Spinner = Spinner
	
	self.resetProperties = function ()
		lstOptions:completeAnimation()
		TitleLbl:completeAnimation()
		txtDescription:completeAnimation()
		PromptBack:completeAnimation()
		PromptSelect:completeAnimation()
		ProcessingText:completeAnimation()
		lstOptions:setAlpha( 0 )
		TitleLbl:setAlpha( 0 )
		txtDescription:setAlpha( 0 )
		PromptBack:setAlpha( 0 )
		PromptSelect:setAlpha( 0 )
		ProcessingText:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
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
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
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

