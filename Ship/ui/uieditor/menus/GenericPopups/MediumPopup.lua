-- 8c7c641f8474cfe1c11eb265f1498acc
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.GenericPopups.DialogBackground" )
require( "ui.uieditor.widgets.buttonprompt" )
require( "ui.uieditor.widgets.GenericPopups.DialogSpinner" )
require( "ui.uieditor.widgets.GenericPopups.List1ButtonLarge_Dialog" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0.setContent = function ( f2_arg0, f2_arg1 )
		f2_arg0.PopupContent:setText( f2_arg1 )
	end
	
	f1_arg0.setSubContent = function ( f3_arg0, f3_arg1 )
		f3_arg0.PopupSubContent:setText( f3_arg1 )
	end
	
	f1_arg0.setButton1Text = function ( f4_arg0, f4_arg1 )
		f4_arg0.OkButton.buttoninternal0.Text0:setText( f4_arg1 )
	end
	
	f1_arg0.setButton1Action = function ( f5_arg0, f5_arg1 )
		f5_arg0.OkButton:registerEventHandler( "button_action", function ( element, event )
			_G[f5_arg1]( f5_arg0, element, event.controller )
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
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "MediumPopup.buttonPrompts" )
	local f7_local1 = self
	self.anyChildUsesUpdateState = true
	
	local BackGround = CoD.DialogBackground.new( f7_local1, controller )
	BackGround:setLeftRight( true, false, 416, 864 )
	BackGround:setTopBottom( true, false, 232, 488 )
	self:addElement( BackGround )
	self.BackGround = BackGround
	
	local BackButtonPrompt = CoD.buttonprompt.new( f7_local1, controller )
	BackButtonPrompt:setLeftRight( true, false, 416, 630 )
	BackButtonPrompt:setTopBottom( true, false, 493, 524 )
	BackButtonPrompt.label:setText( Engine.Localize( "MENU_BACK" ) )
	BackButtonPrompt:subscribeToGlobalModel( controller, "Controller", "secondary_button_image", function ( model )
		local secondaryButtonImage = Engine.GetModelValue( model )
		if secondaryButtonImage then
			BackButtonPrompt.buttonPromptImage:setImage( RegisterImage( secondaryButtonImage ) )
		end
	end )
	BackButtonPrompt:registerEventHandler( "gain_focus", function ( element, event )
		local f9_local0 = nil
		if element.gainFocus then
			f9_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f9_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f7_local1, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
		return f9_local0
	end )
	BackButtonPrompt:registerEventHandler( "lose_focus", function ( element, event )
		local f10_local0 = nil
		if element.loseFocus then
			f10_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f10_local0 = element.super:loseFocus( event )
		end
		return f10_local0
	end )
	f7_local1:AddButtonCallbackFunction( BackButtonPrompt, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
		GroupNotifyPopupButtonAction( self, f11_arg0, f11_arg2 )
		return true
	end, function ( f12_arg0, f12_arg1, f12_arg2 )
		CoD.Menu.SetButtonLabel( f12_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
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
	
	local Spinner = CoD.DialogSpinner.new( f7_local1, controller )
	Spinner:setLeftRight( true, false, 566, 694 )
	Spinner:setTopBottom( true, false, 325.5, 453.5 )
	self:addElement( Spinner )
	self.Spinner = Spinner
	
	local OkButton = CoD.List1ButtonLarge_Dialog.new( f7_local1, controller )
	OkButton:setLeftRight( true, false, 429.56, 851 )
	OkButton:setTopBottom( true, false, 443.67, 475.67 )
	OkButton.buttoninternal0.Text0:setText( Engine.Localize( "MENU_OK" ) )
	OkButton:registerEventHandler( "gain_focus", function ( element, event )
		local f13_local0 = nil
		if element.gainFocus then
			f13_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f13_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f7_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f13_local0
	end )
	OkButton:registerEventHandler( "lose_focus", function ( element, event )
		local f14_local0 = nil
		if element.loseFocus then
			f14_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f14_local0 = element.super:loseFocus( event )
		end
		return f14_local0
	end )
	f7_local1:AddButtonCallbackFunction( OkButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f15_arg0, f15_arg1, f15_arg2, f15_arg3 )
		RunClientDemo( self, f15_arg0, f15_arg2 )
		return true
	end, function ( f16_arg0, f16_arg1, f16_arg2 )
		CoD.Menu.SetButtonLabel( f16_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
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
	f7_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3 )
		GoBack( self, f19_arg2 )
		return true
	end, function ( f20_arg0, f20_arg1, f20_arg2 )
		CoD.Menu.SetButtonLabel( f20_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
		return false
	end, false )
	OkButton.id = "OkButton"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f7_local1
	} )
	if not self:restoreState() then
		self.OkButton:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BackGround:close()
		element.BackButtonPrompt:close()
		element.Spinner:close()
		element.OkButton:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "MediumPopup.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

