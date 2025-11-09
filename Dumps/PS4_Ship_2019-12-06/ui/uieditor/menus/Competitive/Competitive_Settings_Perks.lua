require( "ui.uieditor.widgets.GameSettings.GameSettings_Background" )
require( "ui.uieditor.widgets.Controls.Slider_Small" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.Competitive.Competitive_Settings_SelectedItemInfo" )

DataSources.CompetitiveSettingsPerkOptions = DataSourceHelpers.ListSetup( "CompetitiveSettingsPerkOptions", function ( f1_arg0 )
	local f1_local0 = {}
	local f1_local1 = {}
	for f1_local2 = 0, 255, 1 do
		if Engine.ItemIndexValid( f1_local2 ) then
			local f1_local5 = Engine.GetUnlockableInfoByIndex( f1_local2 )
			if 0 <= f1_local5.allocation and LUI.startswith( f1_local5.loadoutSlot, "specialty" ) then
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
		local f4_local0 = Engine.GetUnlockableInfoByIndex( f4_arg0.models.itemIndex )
		local f4_local1 = Engine.GetUnlockableInfoByIndex( f4_arg1.models.itemIndex )
		if f4_local0.loadoutSlot == f4_local1.loadoutSlot then
			return f4_arg0.models.name < f4_arg1.models.name
		else
			return f4_local0.loadoutSlot < f4_local1.loadoutSlot
		end
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

LUI.createMenu.Competitive_Settings_Perks = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Competitive_Settings_Perks" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Competitive_Settings_Perks.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local GameSettingsBackground = CoD.GameSettings_Background.new( self, controller )
	GameSettingsBackground:setLeftRight( true, true, 0, 0 )
	GameSettingsBackground:setTopBottom( true, true, 0, 0 )
	GameSettingsBackground.MenuFrame.titleLabel:setText( Engine.Localize( "MPUI_PERKS_CAPS" ) )
	GameSettingsBackground.MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MPUI_PERKS_CAPS" ) )
	GameSettingsBackground.GameSettingsSelectedItemInfo.ToolTip:setAlpha( 0 )
	GameSettingsBackground.GameSettingsSelectedItemInfo.GameModeInfo:setAlpha( 0 )
	GameSettingsBackground.GameSettingsSelectedItemInfo.GameModeName:setAlpha( 0 )
	self:addElement( GameSettingsBackground )
	self.GameSettingsBackground = GameSettingsBackground
	
	local Options = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, true )
	Options:makeFocusable()
	Options:setLeftRight( true, false, 27, 697 )
	Options:setTopBottom( true, false, 144, 618 )
	Options:setDataSource( "CompetitiveSettingsPerkOptions" )
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
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_START )
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
	self:AddButtonCallbackFunction( Options, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( element, menu, controller, model )
		OpenGameSettingsOptionsMenu( self, element, controller, menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS" )
		return true
	end, false )
	self:addElement( Options )
	self.Options = Options
	
	local CompetitiveSettingsSelectedItemInfo = CoD.Competitive_Settings_SelectedItemInfo.new( self, controller )
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
	
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		ForceNotifyGlobalModel( controller, "GametypeSettings.Update" )
		GoBack( self, controller )
		ClearSavedState( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
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
		menu = self
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
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Competitive_Settings_Perks.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

