require( "ui.uieditor.widgets.button" )
require( "ui.uieditor.widgets.FileShare.FileshareOptionButton" )
require( "ui.uieditor.widgets.GenericPopups.DialogSpinner" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreakVignetteContainer" )

CoD.FullscreenPopupTemplate = InheritFrom( LUI.UIElement )
CoD.FullscreenPopupTemplate.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FullscreenPopupTemplate )
	self.id = "FullscreenPopupTemplate"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 1080 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local darkbg = LUI.UIImage.new()
	darkbg:setLeftRight( 0, 1, 0, 0 )
	darkbg:setTopBottom( 0, 1, 784, 0 )
	darkbg:setRGB( 0.17, 0.16, 0.16 )
	darkbg:setAlpha( 0.95 )
	self:addElement( darkbg )
	self.darkbg = darkbg
	
	local scorestreakVignetteContainer = CoD.scorestreakVignetteContainer.new( menu, controller )
	scorestreakVignetteContainer:setLeftRight( 0, 0, 3, 1920 )
	scorestreakVignetteContainer:setTopBottom( 0, 0, 0, 1080 )
	self:addElement( scorestreakVignetteContainer )
	self.scorestreakVignetteContainer = scorestreakVignetteContainer
	
	local darkbg0 = LUI.UIImage.new()
	darkbg0:setLeftRight( 0, 1, 0, 0 )
	darkbg0:setTopBottom( 0, 1, -30, -762 )
	darkbg0:setRGB( 0.17, 0.16, 0.16 )
	darkbg0:setAlpha( 0.95 )
	self:addElement( darkbg0 )
	self.darkbg0 = darkbg0
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( 0, 0, 0, 1920 )
	Background:setTopBottom( 0, 0, 0, 1080 )
	Background:setRGB( 0, 0, 0 )
	Background:setAlpha( 0 )
	self:addElement( Background )
	self.Background = Background
	
	local RedLine = LUI.UIImage.new()
	RedLine:setLeftRight( 0, 0, 0, 1920 )
	RedLine:setTopBottom( 0, 0, 310, 318 )
	RedLine:setRGB( 1, 0.6, 0 )
	RedLine:setAlpha( 0.82 )
	self:addElement( RedLine )
	self.RedLine = RedLine
	
	local BodyBackground = LUI.UIImage.new()
	BodyBackground:setLeftRight( 0, 0, 0, 1920 )
	BodyBackground:setTopBottom( 0, 0, 318, 787 )
	BodyBackground:setRGB( 0.1, 0.1, 0.1 )
	BodyBackground:setAlpha( 0.95 )
	self:addElement( BodyBackground )
	self.BodyBackground = BodyBackground
	
	local Ambers = LUI.UIImage.new()
	Ambers:setLeftRight( 0, 0, 0, 1920 )
	Ambers:setTopBottom( 0, 0, 319, 785 )
	Ambers:setAlpha( 0.65 )
	Ambers:setImage( RegisterImage( "uie_t7_icon_master_overlays_bkg" ) )
	self:addElement( Ambers )
	self.Ambers = Ambers
	
	local PromptBackground = LUI.UIImage.new()
	PromptBackground:setLeftRight( 0, 0, 0, 1920 )
	PromptBackground:setTopBottom( 0, 0, 784, 862 )
	PromptBackground:setRGB( 0, 0, 0 )
	self:addElement( PromptBackground )
	self.PromptBackground = PromptBackground
	
	local ButtonList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( 0, 0, 690, 1110 )
	ButtonList:setTopBottom( 0, 0, 527, 725 )
	ButtonList:setWidgetType( CoD.FileshareOptionButton )
	ButtonList:setVerticalCount( 4 )
	ButtonList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	ButtonList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	local DialogSpinner0 = CoD.DialogSpinner.new( menu, controller )
	DialogSpinner0:setLeftRight( 0, 0, 804, 996 )
	DialogSpinner0:setTopBottom( 0, 0, 490, 682 )
	self:addElement( DialogSpinner0 )
	self.DialogSpinner0 = DialogSpinner0
	
	local BtnDone = CoD.button.new( menu, controller )
	BtnDone:setLeftRight( 0, 0, 690, 1149 )
	BtnDone:setTopBottom( 0, 0, 681.5, 726.5 )
	BtnDone.buttoninternal0.Text0:setText( Engine.Localize( "MPUI_DONE" ) )
	BtnDone:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	BtnDone:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( BtnDone, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		GoBack( self, controller )
		ClearSavedState( self, controller )
		ClearMenuSavedState( menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( BtnDone )
	self.BtnDone = BtnDone
	
	local WorkingTitle = LUI.UITightText.new()
	WorkingTitle:setLeftRight( 0, 0, 690, 1110 )
	WorkingTitle:setTopBottom( 0, 0, 342, 393 )
	WorkingTitle:setText( Engine.Localize( "MENU_NEW" ) )
	WorkingTitle:setTTF( "fonts/default.ttf" )
	self:addElement( WorkingTitle )
	self.WorkingTitle = WorkingTitle
	
	local Title = LUI.UITightText.new()
	Title:setLeftRight( 0, 0, 690, 1114 )
	Title:setTopBottom( 0, 0, 342, 393 )
	Title:setText( Engine.Localize( "MENU_NEW" ) )
	Title:setTTF( "fonts/default.ttf" )
	self:addElement( Title )
	self.Title = Title
	
	local Subtitle = LUI.UIText.new()
	Subtitle:setLeftRight( 0, 0, 690, 1114 )
	Subtitle:setTopBottom( 0, 0, 403, 433 )
	Subtitle:setText( Engine.Localize( "MENU_NEW" ) )
	Subtitle:setTTF( "fonts/default.ttf" )
	Subtitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Subtitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Subtitle )
	self.Subtitle = Subtitle
	
	local DoneTitle = LUI.UITightText.new()
	DoneTitle:setLeftRight( 0, 0, 690, 1149 )
	DoneTitle:setTopBottom( 0, 0, 342, 393 )
	DoneTitle:setText( Engine.Localize( "MENU_NEW" ) )
	DoneTitle:setTTF( "fonts/default.ttf" )
	self:addElement( DoneTitle )
	self.DoneTitle = DoneTitle
	
	local ErrorTitle = LUI.UITightText.new()
	ErrorTitle:setLeftRight( 0, 0, 690, 1114 )
	ErrorTitle:setTopBottom( 0, 0, 342, 393 )
	ErrorTitle:setAlpha( 0 )
	ErrorTitle:setText( Engine.Localize( "MENU_ERROR_CAPS" ) )
	ErrorTitle:setTTF( "fonts/default.ttf" )
	self:addElement( ErrorTitle )
	self.ErrorTitle = ErrorTitle
	
	local ErrorSubtitle = LUI.UIText.new()
	ErrorSubtitle:setLeftRight( 0, 0, 690, 1502 )
	ErrorSubtitle:setTopBottom( 0, 0, 402, 440 )
	ErrorSubtitle:setText( Engine.Localize( "MENU_NEW" ) )
	ErrorSubtitle:setTTF( "fonts/default.ttf" )
	ErrorSubtitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ErrorSubtitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ErrorSubtitle )
	self.ErrorSubtitle = ErrorSubtitle
	
	local LineLeft = LUI.UIImage.new()
	LineLeft:setLeftRight( 0, 1, 0, 0 )
	LineLeft:setTopBottom( 1, 1, -295, -289 )
	LineLeft:setAlpha( 0.9 )
	LineLeft:setImage( RegisterImage( "uie_t7_menu_frontend_featuredframeum" ) )
	LineLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineLeft )
	self.LineLeft = LineLeft
	
	ButtonList.navigation = {
		down = BtnDone
	}
	BtnDone.navigation = {
		up = ButtonList
	}
	self.resetProperties = function ()
		WorkingTitle:completeAnimation()
		DialogSpinner0:completeAnimation()
		DoneTitle:completeAnimation()
		BtnDone:completeAnimation()
		ErrorSubtitle:completeAnimation()
		Title:completeAnimation()
		ButtonList:completeAnimation()
		Subtitle:completeAnimation()
		ErrorTitle:completeAnimation()
		WorkingTitle:setAlpha( 1 )
		DialogSpinner0:setAlpha( 1 )
		DoneTitle:setAlpha( 1 )
		BtnDone:setAlpha( 1 )
		ErrorSubtitle:setAlpha( 1 )
		Title:setAlpha( 1 )
		ButtonList:setAlpha( 1 )
		Subtitle:setAlpha( 1 )
		Subtitle:setText( Engine.Localize( "MENU_NEW" ) )
		ErrorTitle:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				DialogSpinner0:completeAnimation()
				self.DialogSpinner0:setAlpha( 0 )
				self.clipFinished( DialogSpinner0, {} )
				BtnDone:completeAnimation()
				self.BtnDone:setAlpha( 0 )
				self.clipFinished( BtnDone, {} )
				WorkingTitle:completeAnimation()
				self.WorkingTitle:setAlpha( 0 )
				self.clipFinished( WorkingTitle, {} )
				DoneTitle:completeAnimation()
				self.DoneTitle:setAlpha( 0 )
				self.clipFinished( DoneTitle, {} )
				ErrorSubtitle:completeAnimation()
				self.ErrorSubtitle:setAlpha( 0 )
				self.clipFinished( ErrorSubtitle, {} )
			end
		},
		WorkingState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				ButtonList:completeAnimation()
				self.ButtonList:setAlpha( 0 )
				self.clipFinished( ButtonList, {} )
				BtnDone:completeAnimation()
				self.BtnDone:setAlpha( 0 )
				self.clipFinished( BtnDone, {} )
				Title:completeAnimation()
				self.Title:setAlpha( 0 )
				self.clipFinished( Title, {} )
				Subtitle:completeAnimation()
				self.Subtitle:setText( Engine.Localize( "PLATFORM_PLEASEWAIT" ) )
				self.clipFinished( Subtitle, {} )
				DoneTitle:completeAnimation()
				self.DoneTitle:setAlpha( 0 )
				self.clipFinished( DoneTitle, {} )
				ErrorSubtitle:completeAnimation()
				self.ErrorSubtitle:setAlpha( 0 )
				self.clipFinished( ErrorSubtitle, {} )
			end
		},
		ErrorState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				ButtonList:completeAnimation()
				self.ButtonList:setAlpha( 0 )
				self.clipFinished( ButtonList, {} )
				DialogSpinner0:completeAnimation()
				self.DialogSpinner0:setAlpha( 0 )
				self.clipFinished( DialogSpinner0, {} )
				WorkingTitle:completeAnimation()
				self.WorkingTitle:setAlpha( 0 )
				self.clipFinished( WorkingTitle, {} )
				Title:completeAnimation()
				self.Title:setAlpha( 0 )
				self.clipFinished( Title, {} )
				Subtitle:completeAnimation()
				self.Subtitle:setAlpha( 0 )
				self.Subtitle:setText( Engine.Localize( "" ) )
				self.clipFinished( Subtitle, {} )
				DoneTitle:completeAnimation()
				self.DoneTitle:setAlpha( 0 )
				self.clipFinished( DoneTitle, {} )
				ErrorTitle:completeAnimation()
				self.ErrorTitle:setAlpha( 1 )
				self.clipFinished( ErrorTitle, {} )
			end
		},
		CustomState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				ButtonList:completeAnimation()
				self.ButtonList:setAlpha( 0 )
				self.clipFinished( ButtonList, {} )
				DialogSpinner0:completeAnimation()
				self.DialogSpinner0:setAlpha( 0 )
				self.clipFinished( DialogSpinner0, {} )
				BtnDone:completeAnimation()
				self.BtnDone:setAlpha( 0 )
				self.clipFinished( BtnDone, {} )
				WorkingTitle:completeAnimation()
				self.WorkingTitle:setAlpha( 0 )
				self.clipFinished( WorkingTitle, {} )
				DoneTitle:completeAnimation()
				self.DoneTitle:setAlpha( 0 )
				self.clipFinished( DoneTitle, {} )
				ErrorSubtitle:completeAnimation()
				self.ErrorSubtitle:setAlpha( 0 )
				self.clipFinished( ErrorSubtitle, {} )
			end
		}
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "ESCAPE", function ( element, menu, controller, model )
		GoBack( self, controller )
		ClearSavedState( self, controller )
		ClearMenuSavedState( menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "", nil )
		return false
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, state )
		if IsSelfInState( self, "ErrorState" ) then
			MakeElementNotFocusable( self, "ButtonList", controller )
			MakeElementFocusable( self, "BtnDone", controller )
			SetLoseFocusToElement( self, "ButtonList", controller )
			SetFocusToElement( self, "BtnDone", controller )
		elseif IsSelfInState( self, "CustomState" ) then
			MakeElementNotFocusable( self, "BtnDone", controller )
			MakeElementNotFocusable( self, "ButtonList", controller )
		end
	end )
	ButtonList.id = "ButtonList"
	BtnDone.id = "BtnDone"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.ButtonList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.scorestreakVignetteContainer:close()
		self.ButtonList:close()
		self.DialogSpinner0:close()
		self.BtnDone:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

