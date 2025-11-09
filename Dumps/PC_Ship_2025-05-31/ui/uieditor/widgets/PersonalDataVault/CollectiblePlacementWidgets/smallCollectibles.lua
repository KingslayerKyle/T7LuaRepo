require( "ui.uieditor.widgets.PersonalDataVault.CollectiblePlacementWidgets.collectibleItem" )
require( "ui.uieditor.menus.Safehouses.InspectingSingleCollectible" )

CoD.smallCollectibles = InheritFrom( LUI.UIElement )
CoD.smallCollectibles.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.smallCollectibles )
	self.id = "smallCollectibles"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 1150 )
	self:setTopBottom( true, false, 0, 450 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local collectibleItem0 = CoD.collectibleItem.new( menu, controller )
	collectibleItem0:setLeftRight( false, true, -1041.5, -848.5 )
	collectibleItem0:setTopBottom( true, false, 0, 193 )
	collectibleItem0:subscribeToGlobalModel( controller, "CollectiblesLayout", "BUNK_COLLECTIBLE_SMALL_1", function ( model )
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
	menu:AddButtonCallbackFunction( collectibleItem0, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsSelfModelValueTrue( element, controller, "isSet" ) then
			SendClientScriptModelNotifyForAdjustedClientTwoParam( controller, element, "collectible_update", "inspecting", "model" )
			CopyElementModelToPerControllerTable( controller, "inspectingCollectibleModel", element )
			SetPerControllerTableProperty( controller, "isOpeningInspecting", true )
			NavigateToMenu( self, "InspectingSingleCollectible", true, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if IsSelfModelValueTrue( element, controller, "isSet" ) then
			return true
		else
			return false
		end
	end, false )
	self:addElement( collectibleItem0 )
	self.collectibleItem0 = collectibleItem0
	
	local collectibleItem1 = CoD.collectibleItem.new( menu, controller )
	collectibleItem1:setLeftRight( false, false, -96.5, 96.5 )
	collectibleItem1:setTopBottom( true, false, 0, 193 )
	collectibleItem1:subscribeToGlobalModel( controller, "CollectiblesLayout", "BUNK_COLLECTIBLE_SMALL_2", function ( model )
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
	menu:AddButtonCallbackFunction( collectibleItem1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsSelfModelValueTrue( element, controller, "isSet" ) then
			SendClientScriptModelNotifyForAdjustedClientTwoParam( controller, element, "collectible_update", "inspecting", "model" )
			CopyElementModelToPerControllerTable( controller, "inspectingCollectibleModel", element )
			SetPerControllerTableProperty( controller, "isOpeningInspecting", true )
			NavigateToMenu( self, "InspectingSingleCollectible", true, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if IsSelfModelValueTrue( element, controller, "isSet" ) then
			return true
		else
			return false
		end
	end, false )
	self:addElement( collectibleItem1 )
	self.collectibleItem1 = collectibleItem1
	
	local collectibleItem2 = CoD.collectibleItem.new( menu, controller )
	collectibleItem2:setLeftRight( false, true, -291.5, -98.5 )
	collectibleItem2:setTopBottom( true, false, 0, 193 )
	collectibleItem2:subscribeToGlobalModel( controller, "CollectiblesLayout", "BUNK_COLLECTIBLE_SMALL_3", function ( model )
		collectibleItem2:setModel( model, controller )
	end )
	collectibleItem2:linkToElementModel( collectibleItem2, "isSet", true, function ( model )
		local f15_local0 = collectibleItem2
		local f15_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isSet"
		}
		CoD.Menu.UpdateButtonShownState( f15_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	collectibleItem2:registerEventHandler( "gain_focus", function ( element, event )
		local f16_local0 = nil
		if element.gainFocus then
			f16_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f16_local0 = element.super:gainFocus( event )
		end
		SendClientScriptModelNotifyForAdjustedClientTwoParam( controller, element, "collectible_update", "inspect_focus_change", "collectibleSlot" )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f16_local0
	end )
	collectibleItem2:registerEventHandler( "lose_focus", function ( element, event )
		local f17_local0 = nil
		if element.loseFocus then
			f17_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f17_local0 = element.super:loseFocus( event )
		end
		return f17_local0
	end )
	menu:AddButtonCallbackFunction( collectibleItem2, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsSelfModelValueTrue( element, controller, "isSet" ) then
			SendClientScriptModelNotifyForAdjustedClientTwoParam( controller, element, "collectible_update", "inspecting", "model" )
			CopyElementModelToPerControllerTable( controller, "inspectingCollectibleModel", element )
			SetPerControllerTableProperty( controller, "isOpeningInspecting", true )
			NavigateToMenu( self, "InspectingSingleCollectible", true, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if IsSelfModelValueTrue( element, controller, "isSet" ) then
			return true
		else
			return false
		end
	end, false )
	self:addElement( collectibleItem2 )
	self.collectibleItem2 = collectibleItem2
	
	local collectibleItem3 = CoD.collectibleItem.new( menu, controller )
	collectibleItem3:setLeftRight( false, false, -466.5, -273.5 )
	collectibleItem3:setTopBottom( true, false, 219, 412 )
	collectibleItem3:subscribeToGlobalModel( controller, "CollectiblesLayout", "BUNK_COLLECTIBLE_SMALL_4", function ( model )
		collectibleItem3:setModel( model, controller )
	end )
	collectibleItem3:linkToElementModel( collectibleItem3, "isSet", true, function ( model )
		local f21_local0 = collectibleItem3
		local f21_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isSet"
		}
		CoD.Menu.UpdateButtonShownState( f21_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	collectibleItem3:registerEventHandler( "gain_focus", function ( element, event )
		local f22_local0 = nil
		if element.gainFocus then
			f22_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f22_local0 = element.super:gainFocus( event )
		end
		SendClientScriptModelNotifyForAdjustedClientTwoParam( controller, element, "collectible_update", "inspect_focus_change", "collectibleSlot" )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f22_local0
	end )
	collectibleItem3:registerEventHandler( "lose_focus", function ( element, event )
		local f23_local0 = nil
		if element.loseFocus then
			f23_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f23_local0 = element.super:loseFocus( event )
		end
		return f23_local0
	end )
	menu:AddButtonCallbackFunction( collectibleItem3, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsSelfModelValueTrue( element, controller, "isSet" ) then
			SendClientScriptModelNotifyForAdjustedClientTwoParam( controller, element, "collectible_update", "inspecting", "model" )
			CopyElementModelToPerControllerTable( controller, "inspectingCollectibleModel", element )
			SetPerControllerTableProperty( controller, "isOpeningInspecting", true )
			NavigateToMenu( self, "InspectingSingleCollectible", true, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if IsSelfModelValueTrue( element, controller, "isSet" ) then
			return true
		else
			return false
		end
	end, false )
	self:addElement( collectibleItem3 )
	self.collectibleItem3 = collectibleItem3
	
	local collectibleItem4 = CoD.collectibleItem.new( menu, controller )
	collectibleItem4:setLeftRight( false, false, -96.5, 96.5 )
	collectibleItem4:setTopBottom( true, false, 219, 412 )
	collectibleItem4:subscribeToGlobalModel( controller, "CollectiblesLayout", "BUNK_COLLECTIBLE_SMALL_5", function ( model )
		collectibleItem4:setModel( model, controller )
	end )
	collectibleItem4:linkToElementModel( collectibleItem4, "isSet", true, function ( model )
		local f27_local0 = collectibleItem4
		local f27_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isSet"
		}
		CoD.Menu.UpdateButtonShownState( f27_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	collectibleItem4:registerEventHandler( "gain_focus", function ( element, event )
		local f28_local0 = nil
		if element.gainFocus then
			f28_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f28_local0 = element.super:gainFocus( event )
		end
		SendClientScriptModelNotifyForAdjustedClientTwoParam( controller, element, "collectible_update", "inspect_focus_change", "collectibleSlot" )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f28_local0
	end )
	collectibleItem4:registerEventHandler( "lose_focus", function ( element, event )
		local f29_local0 = nil
		if element.loseFocus then
			f29_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f29_local0 = element.super:loseFocus( event )
		end
		return f29_local0
	end )
	menu:AddButtonCallbackFunction( collectibleItem4, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsSelfModelValueTrue( element, controller, "isSet" ) then
			SendClientScriptModelNotifyForAdjustedClientTwoParam( controller, element, "collectible_update", "inspecting", "model" )
			CopyElementModelToPerControllerTable( controller, "inspectingCollectibleModel", element )
			SetPerControllerTableProperty( controller, "isOpeningInspecting", true )
			NavigateToMenu( self, "InspectingSingleCollectible", true, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if IsSelfModelValueTrue( element, controller, "isSet" ) then
			return true
		else
			return false
		end
	end, false )
	self:addElement( collectibleItem4 )
	self.collectibleItem4 = collectibleItem4
	
	local collectibleItem5 = CoD.collectibleItem.new( menu, controller )
	collectibleItem5:setLeftRight( false, false, 283.5, 476.5 )
	collectibleItem5:setTopBottom( true, false, 219, 412 )
	collectibleItem5:subscribeToGlobalModel( controller, "CollectiblesLayout", "BUNK_COLLECTIBLE_SMALL_6", function ( model )
		collectibleItem5:setModel( model, controller )
	end )
	collectibleItem5:linkToElementModel( collectibleItem5, "isSet", true, function ( model )
		local f33_local0 = collectibleItem5
		local f33_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isSet"
		}
		CoD.Menu.UpdateButtonShownState( f33_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	collectibleItem5:registerEventHandler( "gain_focus", function ( element, event )
		local f34_local0 = nil
		if element.gainFocus then
			f34_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f34_local0 = element.super:gainFocus( event )
		end
		SendClientScriptModelNotifyForAdjustedClientTwoParam( controller, element, "collectible_update", "inspect_focus_change", "collectibleSlot" )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f34_local0
	end )
	collectibleItem5:registerEventHandler( "lose_focus", function ( element, event )
		local f35_local0 = nil
		if element.loseFocus then
			f35_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f35_local0 = element.super:loseFocus( event )
		end
		return f35_local0
	end )
	menu:AddButtonCallbackFunction( collectibleItem5, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsSelfModelValueTrue( element, controller, "isSet" ) then
			SendClientScriptModelNotifyForAdjustedClientTwoParam( controller, element, "collectible_update", "inspecting", "model" )
			CopyElementModelToPerControllerTable( controller, "inspectingCollectibleModel", element )
			SetPerControllerTableProperty( controller, "isOpeningInspecting", true )
			NavigateToMenu( self, "InspectingSingleCollectible", true, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if IsSelfModelValueTrue( element, controller, "isSet" ) then
			return true
		else
			return false
		end
	end, false )
	self:addElement( collectibleItem5 )
	self.collectibleItem5 = collectibleItem5
	
	collectibleItem0.navigation = {
		right = collectibleItem1,
		down = collectibleItem3
	}
	collectibleItem1.navigation = {
		left = collectibleItem0,
		right = collectibleItem2,
		down = collectibleItem4
	}
	collectibleItem2.navigation = {
		left = collectibleItem1,
		down = collectibleItem5
	}
	collectibleItem3.navigation = {
		up = collectibleItem0,
		right = collectibleItem4
	}
	collectibleItem4.navigation = {
		left = collectibleItem3,
		up = collectibleItem1,
		right = collectibleItem5
	}
	collectibleItem5.navigation = {
		left = collectibleItem4,
		up = collectibleItem2
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	collectibleItem0.id = "collectibleItem0"
	collectibleItem1.id = "collectibleItem1"
	collectibleItem2.id = "collectibleItem2"
	collectibleItem3.id = "collectibleItem3"
	collectibleItem4.id = "collectibleItem4"
	collectibleItem5.id = "collectibleItem5"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.collectibleItem0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.collectibleItem0:close()
		element.collectibleItem1:close()
		element.collectibleItem2:close()
		element.collectibleItem3:close()
		element.collectibleItem4:close()
		element.collectibleItem5:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

