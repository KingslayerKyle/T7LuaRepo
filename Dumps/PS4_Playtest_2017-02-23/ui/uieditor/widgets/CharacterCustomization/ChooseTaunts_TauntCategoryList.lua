require( "ui.uieditor.widgets.CharacterCustomization.ChooseTaunts_CategoryListButton" )

CoD.ChooseTaunts_TauntCategoryList = InheritFrom( LUI.UIElement )
CoD.ChooseTaunts_TauntCategoryList.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChooseTaunts_TauntCategoryList )
	self.id = "ChooseTaunts_TauntCategoryList"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 613 )
	self:setTopBottom( 0, 0, 0, 948 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local tauntList = LUI.UIList.new( menu, controller, 0, 0, nil, false, false, 0, 0, false, false )
	tauntList:makeFocusable()
	tauntList:setLeftRight( 0, 0, 0, 760 )
	tauntList:setTopBottom( 0, 0, 45, 127 )
	tauntList:setWidgetType( CoD.ChooseTaunts_CategoryListButton )
	tauntList:setSpacing( 0 )
	tauntList:setDataSource( "TauntTypesList" )
	tauntList:linkToElementModel( tauntList, "disabled", true, function ( model )
		local element = tauntList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	tauntList:linkToElementModel( tauntList, "canPreview", true, function ( model )
		local element = tauntList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "canPreview"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	tauntList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		return retVal
	end )
	tauntList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( tauntList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsDisabled( element, controller ) then
			BeginChoosingTauntOption( menu, element )
			PlaySoundAlias( "uin_paint_decal_nav" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsDisabled( element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( tauntList, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "P", function ( element, menu, controller, model )
		if IsSelfModelValueTrue( element, controller, "canPreview" ) then
			PreviewTaunt( controller, element )
			PlaySoundAlias( "uin_paint_decal_nav" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsSelfModelValueTrue( element, controller, "canPreview" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "HEROES_PREVIEW_TAUNT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( tauntList )
	self.tauntList = tauntList
	
	local customizeTaunts = LUI.UITightText.new()
	customizeTaunts:setLeftRight( 0, 0, 0, 300 )
	customizeTaunts:setTopBottom( 0, 0, 0, 38 )
	customizeTaunts:setText( Engine.Localize( "HEROES_TAUNT" ) )
	customizeTaunts:setTTF( "fonts/default.ttf" )
	self:addElement( customizeTaunts )
	self.customizeTaunts = customizeTaunts
	
	local gestureList = LUI.UIList.new( menu, controller, 0, 0, nil, false, false, 0, 0, false, false )
	gestureList:makeFocusable()
	gestureList:setLeftRight( 0, 0, 0, 760 )
	gestureList:setTopBottom( 0, 0, 194, 440 )
	gestureList:setWidgetType( CoD.ChooseTaunts_CategoryListButton )
	gestureList:setVerticalCount( 3 )
	gestureList:setSpacing( 0 )
	gestureList:setDataSource( "GestureTypesList" )
	gestureList:linkToElementModel( gestureList, "disabled", true, function ( model )
		local element = gestureList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	gestureList:linkToElementModel( gestureList, "canPreview", true, function ( model )
		local element = gestureList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "canPreview"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	gestureList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		return retVal
	end )
	gestureList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( gestureList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsDisabled( element, controller ) then
			BeginChoosingGestureOption( menu, element )
			PlaySoundAlias( "uin_paint_decal_nav" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsDisabled( element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( gestureList, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "P", function ( element, menu, controller, model )
		if IsSelfModelValueTrue( element, controller, "canPreview" ) then
			PreviewGesture( controller, element )
			PlaySoundAlias( "uin_paint_decal_nav" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsSelfModelValueTrue( element, controller, "canPreview" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "HEROES_PREVIEW_GESTURE", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( gestureList )
	self.gestureList = gestureList
	
	local customizeGestures = LUI.UITightText.new()
	customizeGestures:setLeftRight( 0, 0, 0, 82 )
	customizeGestures:setTopBottom( 0, 0, 148, 186 )
	customizeGestures:setText( Engine.Localize( "HEROES_GESTURES" ) )
	customizeGestures:setTTF( "fonts/default.ttf" )
	self:addElement( customizeGestures )
	self.customizeGestures = customizeGestures
	
	tauntList.navigation = {
		down = gestureList
	}
	gestureList.navigation = {
		up = tauntList
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	tauntList.id = "tauntList"
	gestureList.id = "gestureList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.tauntList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.tauntList:close()
		self.gestureList:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

