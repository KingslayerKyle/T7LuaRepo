-- 2e7928799b490e6ca2b14a4229521e15
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Demo.DemoSideBarButton" )
require( "ui.uieditor.widgets.FooterButtonPrompt" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0.disableBlur = true
	f1_arg0.disableDarkenElement = true
	f1_arg0.animateInFromOffset = -355
end

LUI.hudMenuType.ChooseModeSidebar = "hud"
LUI.createMenu.ChooseModeSidebar = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ChooseModeSidebar" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ChooseModeSidebar.buttonPrompts" )
	local f2_local1 = self
	self.anyChildUsesUpdateState = true
	
	local black = LUI.UIImage.new()
	black:setLeftRight( true, false, -58, 275 )
	black:setTopBottom( true, false, -42, 775 )
	black:setRGB( 0, 0, 0 )
	black:setAlpha( 0.92 )
	self:addElement( black )
	self.black = black
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( true, false, 35, 262 )
	Title:setTopBottom( true, false, 130, 156 )
	Title:setRGB( 1, 0.39, 0 )
	Title:setText( LocalizeToUpperString( "DEMO_THEATER_MODE" ) )
	Title:setTTF( "fonts/escom.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Title )
	self.Title = Title
	
	local HintText = LUI.UIText.new()
	HintText:setLeftRight( true, false, 49, 260 )
	HintText:setTopBottom( true, false, 462, 480 )
	HintText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	HintText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	HintText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( HintText )
	self.HintText = HintText
	
	local ButtonList = LUI.UIList.new( f2_local1, controller, 4, 0, nil, false, false, 0, 0, false, false )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( true, false, 35, 260 )
	ButtonList:setTopBottom( true, false, 170, 436 )
	ButtonList:setWidgetType( CoD.DemoSideBarButton )
	ButtonList:setVerticalCount( 5 )
	ButtonList:setSpacing( 4 )
	ButtonList:setDataSource( "DemoChooseModeButtonList" )
	ButtonList:registerEventHandler( "gain_focus", function ( element, event )
		local f3_local0 = nil
		if element.gainFocus then
			f3_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f3_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f2_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f3_local0
	end )
	ButtonList:registerEventHandler( "lose_focus", function ( element, event )
		local f4_local0 = nil
		if element.loseFocus then
			f4_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f4_local0 = element.super:loseFocus( event )
		end
		return f4_local0
	end )
	f2_local1:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
		ProcessListAction( self, f5_arg0, f5_arg2 )
		GoBack( self, f5_arg2 )
		SetGlobalModelValueFalse( "demo.showChooseModeSidebar" )
		return true
	end, function ( f6_arg0, f6_arg1, f6_arg2 )
		CoD.Menu.SetButtonLabel( f6_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
		return false
	end, false )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	local Arrow = LUI.UIImage.new()
	Arrow:setLeftRight( true, false, 35, 44.82 )
	Arrow:setTopBottom( true, false, 466.09, 475.91 )
	Arrow:setAlpha( 0.6 )
	Arrow:setImage( RegisterImage( "uie_t7_menu_gunsmith_arrow_white" ) )
	self:addElement( Arrow )
	self.Arrow = Arrow
	
	local BackBtnPrompt = CoD.FooterButtonPrompt.new( f2_local1, controller )
	BackBtnPrompt:setLeftRight( true, false, 33.5, 154.5 )
	BackBtnPrompt:setTopBottom( true, false, 666, 698 )
	BackBtnPrompt.label:setText( Engine.Localize( "MP_BACK" ) )
	BackBtnPrompt.keyPrompt.keybind:setText( Engine.Localize( "" ) )
	BackBtnPrompt:subscribeToGlobalModel( controller, "Controller", "secondary_button_image", function ( model )
		local secondaryButtonImage = Engine.GetModelValue( model )
		if secondaryButtonImage then
			BackBtnPrompt.buttonPromptImage:setImage( RegisterImage( secondaryButtonImage ) )
		end
	end )
	self:addElement( BackBtnPrompt )
	self.BackBtnPrompt = BackBtnPrompt
	
	HintText:linkToElementModel( ButtonList, "hintText", true, function ( model )
		local hintText = Engine.GetModelValue( model )
		if hintText then
			HintText:setText( Engine.Localize( hintText ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				HintText:completeAnimation()
				self.HintText:setLeftRight( true, false, 49, 260 )
				self.HintText:setTopBottom( true, false, 462, 480 )
				self.clipFinished( HintText, {} )
				Arrow:completeAnimation()
				self.Arrow:setAlpha( 0.6 )
				self.clipFinished( Arrow, {} )
			end
		},
		HighlightReelMode = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				HintText:completeAnimation()
				self.HintText:setLeftRight( true, false, 35, 260 )
				self.HintText:setTopBottom( true, false, 232, 250 )
				self.clipFinished( HintText, {} )
				Arrow:completeAnimation()
				self.Arrow:setAlpha( 0 )
				self.clipFinished( Arrow, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "HighlightReelMode",
			condition = function ( menu, element, event )
				return IsDemoContextHighlightReelMode()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "demo.contextMode" ), function ( model )
		f2_local1:updateElementState( self, {
			name = "model_validation",
			menu = f2_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "demo.contextMode"
		} )
	end )
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3 )
		GoBack( self, f13_arg2 )
		SetGlobalModelValueFalse( "demo.showChooseModeSidebar" )
		return true
	end, function ( f14_arg0, f14_arg1, f14_arg2 )
		CoD.Menu.SetButtonLabel( f14_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, nil, function ( f15_arg0, f15_arg1, f15_arg2, f15_arg3 )
		GoBack( self, f15_arg2 )
		SetGlobalModelValueFalse( "demo.showChooseModeSidebar" )
		return true
	end, function ( f16_arg0, f16_arg1, f16_arg2 )
		CoD.Menu.SetButtonLabel( f16_arg1, Enum.LUIButton.LUI_KEY_START, "" )
		return false
	end, false )
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "M", function ( f17_arg0, f17_arg1, f17_arg2, f17_arg3 )
		GoBack( self, f17_arg2 )
		SetGlobalModelValueFalse( "demo.showChooseModeSidebar" )
		return true
	end, function ( f18_arg0, f18_arg1, f18_arg2 )
		CoD.Menu.SetButtonLabel( f18_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_DISMISS_MENU" )
		return true
	end, false )
	ButtonList.id = "ButtonList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f2_local1
	} )
	if not self:restoreState() then
		self.ButtonList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ButtonList:close()
		element.BackBtnPrompt:close()
		element.HintText:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "ChooseModeSidebar.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

