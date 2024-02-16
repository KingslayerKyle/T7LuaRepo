-- 5061a51e77624238b8977f284ee8496f
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BackgroundFrames.CACFullPopupBackground" )
require( "ui.uieditor.widgets.CAC.OverCapacityItem" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	
end

LUI.createMenu.RemoveItemFromClass = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "RemoveItemFromClass" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "RemoveItemFromClass.buttonPrompts" )
	local f2_local1 = self
	self.anyChildUsesUpdateState = true
	
	local background = CoD.CACFullPopupBackground.new( f2_local1, controller )
	background:setLeftRight( true, false, 0, 1280 )
	background:setTopBottom( true, false, 0, 720 )
	background.StartMenuTitlePopup.StartMenuTitleContainerLOC.StartMenu3dTitle.StartMenu3dTitleLabel.Label0:setText( Engine.Localize( "" ) )
	self:addElement( background )
	self.background = background
	
	local titleLabel = LUI.UITightText.new()
	titleLabel:setLeftRight( true, false, 83, 1216 )
	titleLabel:setTopBottom( true, false, 141, 189 )
	titleLabel:setRGB( 0.87, 0.88, 0.78 )
	titleLabel:setTTF( "fonts/escom.ttf" )
	titleLabel:subscribeToGlobalModel( controller, "PerController", "CACMenu.numItemsToRemove", function ( model )
		local CACMenuNumItemsToRemove = Engine.GetModelValue( model )
		if CACMenuNumItemsToRemove then
			titleLabel:setText( GetRemoveItemTitle( controller, CACMenuNumItemsToRemove ) )
		end
	end )
	self:addElement( titleLabel )
	self.titleLabel = titleLabel
	
	local menudescription = LUI.UITightText.new()
	menudescription:setLeftRight( true, false, 84, 693 )
	menudescription:setTopBottom( true, false, 208, 233 )
	menudescription:setRGB( 0.5, 0.51, 0.52 )
	menudescription:setTTF( "fonts/default.ttf" )
	menudescription:subscribeToGlobalModel( controller, "PerController", "CACMenu.numItemsToRemove", function ( model )
		local CACMenuNumItemsToRemove = Engine.GetModelValue( model )
		if CACMenuNumItemsToRemove then
			menudescription:setText( GetRemoveItemDescription( controller, CACMenuNumItemsToRemove ) )
		end
	end )
	self:addElement( menudescription )
	self.menudescription = menudescription
	
	local itemList = LUI.UIList.new( f2_local1, controller, 5, 0, nil, false, false, 0, 0, false, false )
	itemList:makeFocusable()
	itemList:setLeftRight( true, false, 86, 1421 )
	itemList:setTopBottom( true, false, 259, 388 )
	itemList:setDataSource( "RemoveItemFromClassList" )
	itemList:setWidgetType( CoD.OverCapacityItem )
	itemList:setHorizontalCount( 10 )
	itemList:setSpacing( 5 )
	itemList:registerEventHandler( "gain_focus", function ( element, event )
		local f5_local0 = nil
		if element.gainFocus then
			f5_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f5_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f2_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f5_local0
	end )
	itemList:registerEventHandler( "lose_focus", function ( element, event )
		local f6_local0 = nil
		if element.loseFocus then
			f6_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f6_local0 = element.super:loseFocus( event )
		end
		return f6_local0
	end )
	f2_local1:AddButtonCallbackFunction( itemList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
		WeaponVariantRemoveItemFromClass( self, f7_arg0, f7_arg2 )
		ClearSavedState( self, f7_arg2 )
		return true
	end, function ( f8_arg0, f8_arg1, f8_arg2 )
		CoD.Menu.SetButtonLabel( f8_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( itemList )
	self.itemList = itemList
	
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
		return true
	end, function ( f10_arg0, f10_arg1, f10_arg2 )
		CoD.Menu.SetButtonLabel( f10_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
		GoBack( self, f11_arg2 )
		ClearSavedState( self, f11_arg2 )
		return true
	end, function ( f12_arg0, f12_arg1, f12_arg2 )
		CoD.Menu.SetButtonLabel( f12_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	background:setModel( self.buttonModel, controller )
	itemList.id = "itemList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f2_local1
	} )
	if not self:restoreState() then
		self.itemList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.background:close()
		element.itemList:close()
		element.titleLabel:close()
		element.menudescription:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "RemoveItemFromClass.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

