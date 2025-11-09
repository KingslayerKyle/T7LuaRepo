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
	
	self.setButton1Action = function ( self, action )
		self.OkButton:registerEventHandler( "button_action", function ( element, event )
			action( self, element, event.controller )
		end )
	end
	
end

LUI.createMenu.SmallPopup = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "SmallPopup" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local BackGround = CoD.DialogBackground.new( self, controller )
	BackGround:setLeftRight( true, false, 416, 864 )
	BackGround:setTopBottom( true, false, 232, 488 )
	BackGround:setRGB( 1, 1, 1 )
	self:addElement( BackGround )
	self.BackGround = BackGround
	
	local BackButtonPrompt = CoD.buttonprompt.new( self, controller )
	BackButtonPrompt:setLeftRight( true, false, 416, 630 )
	BackButtonPrompt:setTopBottom( true, false, 493, 524 )
	BackButtonPrompt:setRGB( 1, 1, 1 )
	BackButtonPrompt.label:setText( Engine.Localize( "MENU_BACK" ) )
	BackButtonPrompt:subscribeToGlobalModel( controller, "Controller", "secondary_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BackButtonPrompt.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
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
	PopupSubContent:setRGB( 1, 1, 1 )
	PopupSubContent:setText( Engine.Localize( "<Popup SubContent>" ) )
	PopupSubContent:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	PopupSubContent:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	PopupSubContent:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( PopupSubContent )
	self.PopupSubContent = PopupSubContent
	
	local ProcessingText = LUI.UIText.new()
	ProcessingText:setLeftRight( true, false, 531.06, 739.06 )
	ProcessingText:setTopBottom( true, false, 268.05, 288.05 )
	ProcessingText:setRGB( 1, 1, 1 )
	ProcessingText:setText( Engine.Localize( "GROUPS_PROCESSING_REQUEST" ) )
	ProcessingText:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	ProcessingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ProcessingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ProcessingText )
	self.ProcessingText = ProcessingText
	
	local Spinner = CoD.DialogSpinner.new( self, controller )
	Spinner:setLeftRight( true, false, 566, 694 )
	Spinner:setTopBottom( true, false, 325.5, 453.5 )
	Spinner:setRGB( 1, 1, 1 )
	self:addElement( Spinner )
	self.Spinner = Spinner
	
	local OkButton = CoD.List1ButtonLarge_Dialog.new( self, controller )
	OkButton:setLeftRight( true, false, 429.56, 851 )
	OkButton:setTopBottom( true, false, 443.67, 475.67 )
	OkButton:setRGB( 1, 1, 1 )
	OkButton.buttoninternal0.Text0:setText( Engine.Localize( "MENU_OK" ) )
	OkButton:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		GoBack( self, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
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
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		return true
	end
	
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESCAPE") then
			GenericSmallPopupGoBack( self, controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
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
	self.close = function ( self )
		self.BackGround:close()
		self.BackButtonPrompt:close()
		self.Spinner:close()
		self.OkButton:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

