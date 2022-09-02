-- 68eefd02307dcc8def14c9c2d19a169f
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 409 )
	self:setTopBottom( true, false, 0, 632 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local tauntList = LUI.UIList.new( menu, controller, 0, 0, nil, false, false, 0, 0, false, false )
	tauntList:makeFocusable()
	tauntList:setLeftRight( true, false, 0, 507 )
	tauntList:setTopBottom( true, false, 30, 85 )
	tauntList:setDataSource( "TauntTypesList" )
	tauntList:setWidgetType( CoD.ChooseTaunts_CategoryListButton )
	tauntList:setSpacing( 0 )
	tauntList:linkToElementModel( tauntList, "disabled", true, function ( model )
		local f2_local0 = tauntList
		local f2_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( f2_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	tauntList:linkToElementModel( tauntList, "canPreview", true, function ( model )
		local f3_local0 = tauntList
		local f3_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "canPreview"
		}
		CoD.Menu.UpdateButtonShownState( f3_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	tauntList:registerEventHandler( "gain_focus", function ( element, event )
		local f4_local0 = nil
		if element.gainFocus then
			f4_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f4_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		return f4_local0
	end )
	tauntList:registerEventHandler( "lose_focus", function ( element, event )
		local f5_local0 = nil
		if element.loseFocus then
			f5_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f5_local0 = element.super:loseFocus( event )
		end
		return f5_local0
	end )
	menu:AddButtonCallbackFunction( tauntList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
		if not IsDisabled( f6_arg0, f6_arg2 ) then
			BeginChoosingTauntOption( f6_arg1, f6_arg0 )
			PlaySoundAlias( "uin_paint_decal_nav" )
			return true
		else
			
		end
	end, function ( f7_arg0, f7_arg1, f7_arg2 )
		CoD.Menu.SetButtonLabel( f7_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsDisabled( f7_arg0, f7_arg2 ) then
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( tauntList, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "P", function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
		if IsSelfModelValueTrue( f8_arg0, f8_arg2, "canPreview" ) then
			PreviewTaunt( f8_arg2, f8_arg0 )
			PlaySoundAlias( "uin_paint_decal_nav" )
			return true
		else
			
		end
	end, function ( f9_arg0, f9_arg1, f9_arg2 )
		CoD.Menu.SetButtonLabel( f9_arg1, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "HEROES_PREVIEW_TAUNT" )
		if IsSelfModelValueTrue( f9_arg0, f9_arg2, "canPreview" ) then
			return true
		else
			return false
		end
	end, false )
	self:addElement( tauntList )
	self.tauntList = tauntList
	
	local customizeTaunts = LUI.UITightText.new()
	customizeTaunts:setLeftRight( true, false, 0, 200 )
	customizeTaunts:setTopBottom( true, false, 0, 25 )
	customizeTaunts:setText( Engine.Localize( "HEROES_TAUNT" ) )
	customizeTaunts:setTTF( "fonts/default.ttf" )
	self:addElement( customizeTaunts )
	self.customizeTaunts = customizeTaunts
	
	local gestureList = LUI.UIList.new( menu, controller, 0, 0, nil, false, false, 0, 0, false, false )
	gestureList:makeFocusable()
	gestureList:setLeftRight( true, false, 0, 507 )
	gestureList:setTopBottom( true, false, 129, 294 )
	gestureList:setDataSource( "GestureTypesList" )
	gestureList:setWidgetType( CoD.ChooseTaunts_CategoryListButton )
	gestureList:setVerticalCount( 3 )
	gestureList:setSpacing( 0 )
	gestureList:linkToElementModel( gestureList, "disabled", true, function ( model )
		local f10_local0 = gestureList
		local f10_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( f10_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	gestureList:linkToElementModel( gestureList, "canPreview", true, function ( model )
		local f11_local0 = gestureList
		local f11_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "canPreview"
		}
		CoD.Menu.UpdateButtonShownState( f11_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	gestureList:registerEventHandler( "gain_focus", function ( element, event )
		local f12_local0 = nil
		if element.gainFocus then
			f12_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f12_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		return f12_local0
	end )
	gestureList:registerEventHandler( "lose_focus", function ( element, event )
		local f13_local0 = nil
		if element.loseFocus then
			f13_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f13_local0 = element.super:loseFocus( event )
		end
		return f13_local0
	end )
	menu:AddButtonCallbackFunction( gestureList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f14_arg0, f14_arg1, f14_arg2, f14_arg3 )
		if not IsDisabled( f14_arg0, f14_arg2 ) then
			BeginChoosingGestureOption( f14_arg1, f14_arg0 )
			PlaySoundAlias( "uin_paint_decal_nav" )
			return true
		else
			
		end
	end, function ( f15_arg0, f15_arg1, f15_arg2 )
		CoD.Menu.SetButtonLabel( f15_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsDisabled( f15_arg0, f15_arg2 ) then
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( gestureList, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "P", function ( f16_arg0, f16_arg1, f16_arg2, f16_arg3 )
		if IsSelfModelValueTrue( f16_arg0, f16_arg2, "canPreview" ) then
			PreviewGesture( f16_arg2, f16_arg0 )
			PlaySoundAlias( "uin_paint_decal_nav" )
			return true
		else
			
		end
	end, function ( f17_arg0, f17_arg1, f17_arg2 )
		CoD.Menu.SetButtonLabel( f17_arg1, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "HEROES_PREVIEW_GESTURE" )
		if IsSelfModelValueTrue( f17_arg0, f17_arg2, "canPreview" ) then
			return true
		else
			return false
		end
	end, false )
	self:addElement( gestureList )
	self.gestureList = gestureList
	
	local customizeGestures = LUI.UITightText.new()
	customizeGestures:setLeftRight( true, false, 0, 55 )
	customizeGestures:setTopBottom( true, false, 99, 124 )
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
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.tauntList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.tauntList:close()
		element.gestureList:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

