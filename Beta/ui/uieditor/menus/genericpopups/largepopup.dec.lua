require( "ui.uieditor.widgets.GenericPopups.DialogBackground" )
require( "ui.uieditor.widgets.buttonprompt" )
require( "ui.uieditor.widgets.GenericPopups.DialogSpinner" )
require( "ui.uieditor.widgets.GenericPopups.List1ButtonLarge_Dialog" )

local PostLoadFunc = function ( self, controller )
	self.setContent = function ( self, text )
		self.PopupContent:setText( text )
	end
	
	self.setSubContent = function ( self, text )
		self.PopupSubContent:setText( text )
	end
	
	self.setButton1Text = function ( self, text )
		self.OkButton.buttoninternal0.Text0:setText( text )
	end
	
	self.setButton1Action = function ( self, actionName )
		self.OkButton:registerEventHandler( "button_action", function ( element, event )
			_G[actionName]( self, element, event.controller )
		end )
	end
	
end

LUI.createMenu.LargePopup = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "LargePopup" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "LargePopup.buttonPrompts" )
	local menu = self
	self.anyChildUsesUpdateState = true
	
	local BackGround = CoD.DialogBackground.new( menu, controller )
	BackGround:setLeftRight( true, false, 416, 864 )
	BackGround:setTopBottom( true, false, 232, 488 )
	self:addElement( BackGround )
	self.BackGround = BackGround
	
	local BackButtonPrompt = CoD.buttonprompt.new( menu, controller )
	BackButtonPrompt:setLeftRight( true, false, 416, 630 )
	BackButtonPrompt:setTopBottom( true, false, 493, 524 )
	BackButtonPrompt.label:setText( Engine.Localize( "MENU_BACK" ) )
	BackButtonPrompt:subscribeToGlobalModel( controller, "Controller", "secondary_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BackButtonPrompt.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	BackButtonPrompt:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
		return retVal
	end )
	BackButtonPrompt:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( BackButtonPrompt, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GroupNotifyPopupButtonAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
		return false
	end, false )
	self:addElement( BackButtonPrompt )
	self.BackButtonPrompt = BackButtonPrompt
	
	local PopupContent = LUI.UIText.new()
	PopupContent:setLeftRight( true, false, 429.56, 840.56 )
	PopupContent:setTopBottom( true, false, 247.05, 283.05 )
	PopupContent:setRGB( 0.87, 0.88, 0.78 )
	PopupContent:setText( Engine.Localize( "<Popup Content>" ) )
	PopupContent:setTTF( "fonts/escom.ttf" )
	PopupContent:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	PopupContent:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( PopupContent )
	self.PopupContent = PopupContent
	
	local PopupSubContent = LUI.UIText.new()
	PopupSubContent:setLeftRight( true, false, 429.56, 847.56 )
	PopupSubContent:setTopBottom( true, false, 300.5, 320.5 )
	PopupSubContent:setText( Engine.Localize( "<Popup SubContent>" ) )
	PopupSubContent:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	PopupSubContent:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	PopupSubContent:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( PopupSubContent )
	self.PopupSubContent = PopupSubContent
	
	local ProcessingText = LUI.UIText.new()
	ProcessingText:setLeftRight( true, false, 531.06, 739.06 )
	ProcessingText:setTopBottom( true, false, 268.05, 288.05 )
	ProcessingText:setText( Engine.Localize( "GROUPS_PROCESSING_REQUEST" ) )
	ProcessingText:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	ProcessingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ProcessingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ProcessingText )
	self.ProcessingText = ProcessingText
	
	local Spinner = CoD.DialogSpinner.new( menu, controller )
	Spinner:setLeftRight( true, false, 566, 694 )
	Spinner:setTopBottom( true, false, 325.5, 453.5 )
	self:addElement( Spinner )
	self.Spinner = Spinner
	
	local OkButton = CoD.List1ButtonLarge_Dialog.new( menu, controller )
	OkButton:setLeftRight( true, false, 429.56, 851 )
	OkButton:setTopBottom( true, false, 443.67, 475.67 )
	OkButton.buttoninternal0.Text0:setText( Engine.Localize( "MENU_OK" ) )
	OkButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	OkButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( OkButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		RunClientDemo( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( OkButton )
	self.OkButton = OkButton
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				BackButtonPrompt:completeAnimation()
				self.BackButtonPrompt:setAlpha( 1 )
				self.clipFinished( BackButtonPrompt, {} )
				PopupContent:completeAnimation()
				self.PopupContent:setAlpha( 1 )
				self.clipFinished( PopupContent, {} )
				PopupSubContent:completeAnimation()
				self.PopupSubContent:setAlpha( 1 )
				self.clipFinished( PopupSubContent, {} )
				ProcessingText:completeAnimation()
				self.ProcessingText:setAlpha( 0 )
				self.clipFinished( ProcessingText, {} )
				Spinner:completeAnimation()
				self.Spinner:setAlpha( 0 )
				self.clipFinished( Spinner, {} )
				OkButton:completeAnimation()
				self.OkButton:setAlpha( 1 )
				self.clipFinished( OkButton, {} )
			end
		},
		Processing = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				BackGround:completeAnimation()
				self.BackGround:setAlpha( 0.42 )
				self.clipFinished( BackGround, {} )
				BackButtonPrompt:completeAnimation()
				self.BackButtonPrompt:setAlpha( 0 )
				self.clipFinished( BackButtonPrompt, {} )
				PopupContent:completeAnimation()
				self.PopupContent:setAlpha( 0 )
				self.clipFinished( PopupContent, {} )
				PopupSubContent:completeAnimation()
				self.PopupSubContent:setAlpha( 0 )
				self.clipFinished( PopupSubContent, {} )
				ProcessingText:completeAnimation()
				self.ProcessingText:setAlpha( 1 )
				self.clipFinished( ProcessingText, {} )
				Spinner:completeAnimation()
				self.Spinner:setAlpha( 1 )
				self.clipFinished( Spinner, {} )
				OkButton:completeAnimation()
				self.OkButton:setAlpha( 0 )
				self.clipFinished( OkButton, {} )
			end
		}
	}
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
		return false
	end, false )
	OkButton.id = "OkButton"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = menu
	} )
	if not self:restoreState() then
		self.OkButton:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BackGround:close()
		self.BackButtonPrompt:close()
		self.Spinner:close()
		self.OkButton:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "LargePopup.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

