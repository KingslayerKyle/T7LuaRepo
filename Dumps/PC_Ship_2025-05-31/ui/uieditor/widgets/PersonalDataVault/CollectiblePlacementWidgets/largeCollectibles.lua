require( "ui.uieditor.widgets.PersonalDataVault.CollectiblePlacementWidgets.collectibleItem" )
require( "ui.uieditor.menus.Safehouses.InspectingSingleCollectible" )

CoD.largeCollectibles = InheritFrom( LUI.UIElement )
CoD.largeCollectibles.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.largeCollectibles )
	self.id = "largeCollectibles"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 1150 )
	self:setTopBottom( true, false, 0, 450 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local collectibleItem0 = CoD.collectibleItem.new( menu, controller )
	collectibleItem0:setLeftRight( true, false, 425, 725 )
	collectibleItem0:setTopBottom( true, false, 10, 310 )
	collectibleItem0:subscribeToGlobalModel( controller, "CollectiblesLayout", "BUNK_COLLECTIBLE_LARGE_1", function ( model )
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
	
	collectibleItem0.id = "collectibleItem0"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.collectibleItem0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.collectibleItem0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

