-- f101d48ec228e655e28b42bef8c0a2f0
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.GameSettings.GameSettings_Background" )
require( "ui.uieditor.widgets.Controls.Slider_Small" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.Competitive.Competitive_Settings_SelectedItemInfo" )

DataSources.CompetitiveSettingsEquipmentOptions = DataSourceHelpers.ListSetup( "CompetitiveSettingsEquipmentOptions", function ( f1_arg0 )
	local f1_local0 = {}
	local f1_local1 = {}
	for f1_local2 = 0, 255, 1 do
		if Engine.ItemIndexValid( f1_local2 ) then
			local f1_local5 = Engine.GetUnlockableInfoByIndex( f1_local2 )
			if 0 <= f1_local5.allocation and (f1_local5.loadoutSlot == "primarygadget" or f1_local5.loadoutSlot == "secondarygadget") then
				table.insert( f1_local0, CoD.OptionsUtility.CreateItemRestrictionSettings( f1_arg0, f1_local5.name, "", "CompetitiveSettings_ItemRestriction_" .. tostring( f1_local2 ), CoD.GameSettingsUtility.GetRestrictionOptions(), f1_local5.image, CoD.OptionsUtility.GametypeSettingsSetItemRestrictionState, {
					itemIndex = f1_local2
				}, function ( f2_arg0 )
					return Engine.GetItemRestrictionState( f2_arg0.itemIndex )
				end, function ( f3_arg0 )
					Engine.SetItemRestrictionState( f3_arg0.itemIndex, Engine.GetItemRestrictionState( f3_arg0.itemIndex, true ) )
				end ) )
			end
		end
	end
	table.sort( f1_local0, function ( f4_arg0, f4_arg1 )
		return f4_arg0.models.name < f4_arg1.models.name
	end )
	return f1_local0
end, nil, nil, function ( f5_arg0, f5_arg1, f5_arg2 )
	local f5_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" ), "Update" )
	if f5_arg1.updateSubscription then
		f5_arg1:removeSubscription( f5_arg1.updateSubscription )
	end
	f5_arg1.updateSubscription = f5_arg1:subscribeToModel( f5_local0, function ()
		f5_arg1:updateDataSource( false )
	end, false )
end )
local PreLoadFunc = function ( self, controller )
	self.disablePopupOpenCloseAnim = true
end

LUI.createMenu.Competitive_Settings_Equipment = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Competitive_Settings_Equipment" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Competitive_Settings_Equipment.buttonPrompts" )
	local f8_local1 = self
	self.anyChildUsesUpdateState = true
	
	local GameSettingsBackground = CoD.GameSettings_Background.new( f8_local1, controller )
	GameSettingsBackground:setLeftRight( true, true, 0, 0 )
	GameSettingsBackground:setTopBottom( true, true, 0, 0 )
	GameSettingsBackground.MenuFrame.titleLabel:setText( Engine.Localize( "MENU_EQUIPMENT_CAPS" ) )
	GameSettingsBackground.MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_EQUIPMENT_CAPS" ) )
	GameSettingsBackground.GameSettingsSelectedItemInfo.ToolTip:setAlpha( 0 )
	GameSettingsBackground.GameSettingsSelectedItemInfo.GameModeInfo:setAlpha( 0 )
	GameSettingsBackground.GameSettingsSelectedItemInfo.GameModeName:setAlpha( 0 )
	self:addElement( GameSettingsBackground )
	self.GameSettingsBackground = GameSettingsBackground
	
	local Options = LUI.UIList.new( f8_local1, controller, 2, 0, nil, false, false, 0, 0, false, true )
	Options:makeFocusable()
	Options:setLeftRight( true, false, 27, 697 )
	Options:setTopBottom( true, false, 144, 618 )
	Options:setDataSource( "CompetitiveSettingsEquipmentOptions" )
	Options:setWidgetType( CoD.Slider_Small )
	Options:setVerticalCount( 14 )
	Options:setVerticalCounter( CoD.verticalCounter )
	Options:registerEventHandler( "gain_focus", function ( element, event )
		local f9_local0 = nil
		if element.gainFocus then
			f9_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f9_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f8_local1, controller, Enum.LUIButton.LUI_KEY_START )
		return f9_local0
	end )
	Options:registerEventHandler( "lose_focus", function ( element, event )
		local f10_local0 = nil
		if element.loseFocus then
			f10_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f10_local0 = element.super:loseFocus( event )
		end
		return f10_local0
	end )
	f8_local1:AddButtonCallbackFunction( Options, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
		OpenGameSettingsOptionsMenu( self, f11_arg0, f11_arg2, f11_arg1 )
		return true
	end, function ( f12_arg0, f12_arg1, f12_arg2 )
		CoD.Menu.SetButtonLabel( f12_arg1, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS" )
		return true
	end, false )
	self:addElement( Options )
	self.Options = Options
	
	local CompetitiveSettingsSelectedItemInfo = CoD.Competitive_Settings_SelectedItemInfo.new( f8_local1, controller )
	CompetitiveSettingsSelectedItemInfo:setLeftRight( true, true, 0, 0 )
	CompetitiveSettingsSelectedItemInfo:setTopBottom( true, true, 0, 0 )
	CompetitiveSettingsSelectedItemInfo:mergeStateConditions( {
		{
			stateName = "SquareImage",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( CompetitiveSettingsSelectedItemInfo )
	self.CompetitiveSettingsSelectedItemInfo = CompetitiveSettingsSelectedItemInfo
	
	f8_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f14_arg0, f14_arg1, f14_arg2, f14_arg3 )
		ForceNotifyGlobalModel( f14_arg2, "GametypeSettings.Update" )
		GoBack( self, f14_arg2 )
		ClearSavedState( self, f14_arg2 )
		return true
	end, function ( f15_arg0, f15_arg1, f15_arg2 )
		CoD.Menu.SetButtonLabel( f15_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	GameSettingsBackground.MenuFrame:setModel( self.buttonModel, controller )
	Options.id = "Options"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f8_local1
	} )
	if not self:restoreState() then
		self.Options:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GameSettingsBackground:close()
		element.Options:close()
		element.CompetitiveSettingsSelectedItemInfo:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Competitive_Settings_Equipment.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

