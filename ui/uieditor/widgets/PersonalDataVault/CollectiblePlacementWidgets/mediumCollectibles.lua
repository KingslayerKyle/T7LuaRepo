-- 6386d08b6592e69a4d8b12ceda9ee4ff
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.PersonalDataVault.CollectiblePlacementWidgets.collectibleItem" )
require( "ui.uieditor.menus.Safehouses.InspectingSingleCollectible" )

CoD.mediumCollectibles = InheritFrom( LUI.UIElement )
CoD.mediumCollectibles.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.mediumCollectibles )
	self.id = "mediumCollectibles"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 1150 )
	self:setTopBottom( true, false, 0, 450 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local collectibleItem0 = CoD.collectibleItem.new( menu, controller )
	collectibleItem0:setLeftRight( true, false, 225, 425 )
	collectibleItem0:setTopBottom( true, false, -5, 195 )
	collectibleItem0:subscribeToGlobalModel( controller, "CollectiblesLayout", "BUNK_COLLECTIBLE_MEDIUM_1", function ( model )
		collectibleItem0:setModel( model, controller )
	end )
	collectibleItem0:linkToElementModel( collectibleItem0, "isSet", true, function ( model )
		local f3_local0 = collectibleItem0
		local f3_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isSet"
		}
		CoD.Menu.UpdateButtonShownState( f3_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	collectibleItem0:registerEventHandler( "gain_focus", function ( element, event )
		local f4_local0 = nil
		if element.gainFocus then
			f4_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f4_local0 = element.super:gainFocus( event )
		end
		SendClientScriptModelNotifyForAdjustedClientTwoParam( controller, element, "collectible_update", "inspect_focus_change", "collectibleSlot" )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f4_local0
	end )
	collectibleItem0:registerEventHandler( "lose_focus", function ( element, event )
		local f5_local0 = nil
		if element.loseFocus then
			f5_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f5_local0 = element.super:loseFocus( event )
		end
		return f5_local0
	end )
	menu:AddButtonCallbackFunction( collectibleItem0, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
		if IsSelfModelValueTrue( f6_arg0, f6_arg2, "isSet" ) then
			SendClientScriptModelNotifyForAdjustedClientTwoParam( f6_arg2, f6_arg0, "collectible_update", "inspecting", "model" )
			CopyElementModelToPerControllerTable( f6_arg2, "inspectingCollectibleModel", f6_arg0 )
			SetPerControllerTableProperty( f6_arg2, "isOpeningInspecting", true )
			NavigateToMenu( self, "InspectingSingleCollectible", true, f6_arg2 )
			return true
		else
			
		end
	end, function ( f7_arg0, f7_arg1, f7_arg2 )
		CoD.Menu.SetButtonLabel( f7_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if IsSelfModelValueTrue( f7_arg0, f7_arg2, "isSet" ) then
			return true
		else
			return false
		end
	end, false )
	self:addElement( collectibleItem0 )
	self.collectibleItem0 = collectibleItem0
	
	local collectibleItem1 = CoD.collectibleItem.new( menu, controller )
	collectibleItem1:setLeftRight( true, false, 725, 925 )
	collectibleItem1:setTopBottom( true, false, -5, 195 )
	collectibleItem1:subscribeToGlobalModel( controller, "CollectiblesLayout", "BUNK_COLLECTIBLE_MEDIUM_2", function ( model )
		collectibleItem1:setModel( model, controller )
	end )
	collectibleItem1:linkToElementModel( collectibleItem1, "isSet", true, function ( model )
		local f9_local0 = collectibleItem1
		local f9_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isSet"
		}
		CoD.Menu.UpdateButtonShownState( f9_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	collectibleItem1:registerEventHandler( "gain_focus", function ( element, event )
		local f10_local0 = nil
		if element.gainFocus then
			f10_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f10_local0 = element.super:gainFocus( event )
		end
		SendClientScriptModelNotifyForAdjustedClientTwoParam( controller, element, "collectible_update", "inspect_focus_change", "collectibleSlot" )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f10_local0
	end )
	collectibleItem1:registerEventHandler( "lose_focus", function ( element, event )
		local f11_local0 = nil
		if element.loseFocus then
			f11_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f11_local0 = element.super:loseFocus( event )
		end
		return f11_local0
	end )
	menu:AddButtonCallbackFunction( collectibleItem1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
		if IsSelfModelValueTrue( f12_arg0, f12_arg2, "isSet" ) then
			SendClientScriptModelNotifyForAdjustedClientTwoParam( f12_arg2, f12_arg0, "collectible_update", "inspecting", "model" )
			CopyElementModelToPerControllerTable( f12_arg2, "inspectingCollectibleModel", f12_arg0 )
			SetPerControllerTableProperty( f12_arg2, "isOpeningInspecting", true )
			NavigateToMenu( self, "InspectingSingleCollectible", true, f12_arg2 )
			return true
		else
			
		end
	end, function ( f13_arg0, f13_arg1, f13_arg2 )
		CoD.Menu.SetButtonLabel( f13_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if IsSelfModelValueTrue( f13_arg0, f13_arg2, "isSet" ) then
			return true
		else
			return false
		end
	end, false )
	self:addElement( collectibleItem1 )
	self.collectibleItem1 = collectibleItem1
	
	collectibleItem0.navigation = {
		right = collectibleItem1
	}
	collectibleItem1.navigation = {
		left = collectibleItem0
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	collectibleItem0.id = "collectibleItem0"
	collectibleItem1.id = "collectibleItem1"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.collectibleItem0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.collectibleItem0:close()
		element.collectibleItem1:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

