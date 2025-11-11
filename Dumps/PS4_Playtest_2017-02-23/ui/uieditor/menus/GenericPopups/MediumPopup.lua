require( "ui.uieditor.widgets.buttonprompt" )
require( "ui.uieditor.widgets.GenericPopups.DialogBackground" )
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

LUI.createMenu.MediumPopup = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "MediumPopup" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "MediumPopup.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local BackGround = CoD.DialogBackground.new( self, controller )
	BackGround:setLeftRight( 0, 0, 624, 1296 )
	BackGround:setTopBottom( 0, 0, 348, 732 )
	self:addElement( BackGround )
	self.BackGround = BackGround
	
	local BackButtonPrompt = CoD.buttonprompt.new( self, controller )
	BackButtonPrompt:setLeftRight( 0, 0, 623.5, 944.5 )
	BackButtonPrompt:setTopBottom( 0, 0, 740, 786 )
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
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
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
	self:AddButtonCallbackFunction( BackButtonPrompt, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GroupNotifyPopupButtonAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "", nil )
		return false
	end, false )
	self:addElement( BackButtonPrompt )
	self.BackButtonPrompt = BackButtonPrompt
	
	local PopupContent = LUI.UIText.new()
	PopupContent:setLeftRight( 0, 0, 644, 1261 )
	PopupContent:setTopBottom( 0, 0, 371, 425 )
	PopupContent:setRGB( 0.87, 0.88, 0.78 )
	PopupContent:setText( Engine.Localize( "<Popup Content>" ) )
	PopupContent:setTTF( "fonts/escom.ttf" )
	PopupContent:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	PopupContent:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( PopupContent )
	self.PopupContent = PopupContent
	
	local PopupSubContent = LUI.UIText.new()
	PopupSubContent:setLeftRight( 0, 0, 644, 1271 )
	PopupSubContent:setTopBottom( 0, 0, 451, 481 )
	PopupSubContent:setText( Engine.Localize( "<Popup SubContent>" ) )
	PopupSubContent:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	PopupSubContent:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	PopupSubContent:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( PopupSubContent )
	self.PopupSubContent = PopupSubContent
	
	local ProcessingText = LUI.UIText.new()
	ProcessingText:setLeftRight( 0, 0, 797, 1109 )
	ProcessingText:setTopBottom( 0, 0, 402, 432 )
	ProcessingText:setText( Engine.Localize( "GROUPS_PROCESSING_REQUEST" ) )
	ProcessingText:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	ProcessingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ProcessingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ProcessingText )
	self.ProcessingText = ProcessingText
	
	local Spinner = CoD.DialogSpinner.new( self, controller )
	Spinner:setLeftRight( 0, 0, 849, 1041 )
	Spinner:setTopBottom( 0, 0, 488, 680 )
	self:addElement( Spinner )
	self.Spinner = Spinner
	
	local OkButton = CoD.List1ButtonLarge_Dialog.new( self, controller )
	OkButton:setLeftRight( 0, 0, 644, 1276 )
	OkButton:setTopBottom( 0, 0, 666, 714 )
	OkButton.buttoninternal0.Text0:setText( Engine.Localize( "MENU_OK" ) )
	OkButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
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
	self:AddButtonCallbackFunction( OkButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		RunClientDemo( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( OkButton )
	self.OkButton = OkButton
	
	self.resetProperties = function ()
		ProcessingText:completeAnimation()
		Spinner:completeAnimation()
		PopupSubContent:completeAnimation()
		PopupContent:completeAnimation()
		BackButtonPrompt:completeAnimation()
		BackGround:completeAnimation()
		OkButton:completeAnimation()
		ProcessingText:setAlpha( 1 )
		Spinner:setAlpha( 1 )
		PopupSubContent:setAlpha( 1 )
		PopupContent:setAlpha( 1 )
		BackButtonPrompt:setAlpha( 1 )
		BackGround:setAlpha( 1 )
		OkButton:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				ProcessingText:completeAnimation()
				self.ProcessingText:setAlpha( 0 )
				self.clipFinished( ProcessingText, {} )
				Spinner:completeAnimation()
				self.Spinner:setAlpha( 0 )
				self.clipFinished( Spinner, {} )
			end
		},
		Processing = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
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
				OkButton:completeAnimation()
				self.OkButton:setAlpha( 0 )
				self.clipFinished( OkButton, {} )
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
	OkButton.id = "OkButton"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
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
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "MediumPopup.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

