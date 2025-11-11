require( "ui.uieditor.widgets.Competitive.Competitive_Settings_SelectedItemInfo" )
require( "ui.uieditor.widgets.Controls.Slider_Small" )
require( "ui.uieditor.widgets.GameSettings.GameSettings_Background" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )

local PrepareWildcardOptions = function ( controller )
	local optionsTable = {}
	local items = {}
	for itemIndex = 0, 255, 1 do
		if Engine.ItemIndexValid( itemIndex ) then
			local itemInfo = Engine.GetUnlockableInfoByIndex( itemIndex )
			if 0 <= itemInfo.allocation and LUI.startswith( itemInfo.loadoutSlot, "bonuscard" ) then
				local image = itemInfo.image
				table.insert( optionsTable, CoD.OptionsUtility.CreateItemRestrictionSettings( controller, itemInfo.name, "", "CompetitiveSettings_ItemRestriction_" .. tostring( itemIndex ), CoD.GameSettingsUtility.GetRestrictionOptions(), image, CoD.OptionsUtility.GametypeSettingsSetItemRestrictionState, {
					itemIndex = itemIndex
				}, function ( params )
					return Engine.GetItemRestrictionState( params.itemIndex )
				end, function ( element )
					local default = Engine.GetItemRestrictionState( element.itemIndex, true )
					Engine.SetItemRestrictionState( element.itemIndex, default )
				end ) )
			end
		end
	end
	local WildcardSort = function ( a, b )
		return a.models.name < b.models.name
	end
	
	table.sort( optionsTable, WildcardSort )
	return optionsTable
end

local ItemOptionsUpdate = function ( controller, list, listModel )
	local gametypeSettingsModel = Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" )
	local updateModel = Engine.CreateModel( gametypeSettingsModel, "Update" )
	if list.updateSubscription then
		list:removeSubscription( list.updateSubscription )
	end
	list.updateSubscription = list:subscribeToModel( updateModel, function ()
		list:updateDataSource( false )
	end, false )
end

DataSources.CompetitiveSettingsWildcardOptions = DataSourceHelpers.ListSetup( "CompetitiveSettingsWildcardOptions", PrepareWildcardOptions, nil, nil, ItemOptionsUpdate )
local PreLoadFunc = function ( self, controller )
	self.disablePopupOpenCloseAnim = true
end

LUI.createMenu.Competitive_Settings_Wildcards = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Competitive_Settings_Wildcards" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Competitive_Settings_Wildcards.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local GameSettingsBackground = CoD.GameSettings_Background.new( self, controller )
	GameSettingsBackground:setLeftRight( 0, 1, 0, 0 )
	GameSettingsBackground:setTopBottom( 0, 1, 0, 0 )
	GameSettingsBackground.MenuFrame.titleLabel:setText( Engine.Localize( "MENU_WILDCARDS_CAPS" ) )
	GameSettingsBackground.MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_WILDCARDS_CAPS" ) )
	GameSettingsBackground.GameSettingsSelectedItemInfo.ToolTip:setAlpha( 0 )
	GameSettingsBackground.GameSettingsSelectedItemInfo.GameModeInfo:setAlpha( 0 )
	GameSettingsBackground.GameSettingsSelectedItemInfo.GameModeName:setAlpha( 0 )
	self:addElement( GameSettingsBackground )
	self.GameSettingsBackground = GameSettingsBackground
	
	local Options = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	Options:makeFocusable()
	Options:setLeftRight( 0, 0, 41, 857 )
	Options:setTopBottom( 0, 0, 223, 921 )
	Options:setWidgetType( CoD.Slider_Small )
	Options:setVerticalCount( 14 )
	Options:setVerticalCounter( CoD.verticalCounter )
	Options:setDataSource( "CompetitiveSettingsWildcardOptions" )
	Options:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_START )
		return retVal
	end )
	Options:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( Options, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( element, menu, controller, model )
		OpenGameSettingsOptionsMenu( self, element, controller, menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS", nil )
		return true
	end, false )
	self:addElement( Options )
	self.Options = Options
	
	local CompetitiveSettingsSelectedItemInfo = CoD.Competitive_Settings_SelectedItemInfo.new( self, controller )
	CompetitiveSettingsSelectedItemInfo:mergeStateConditions( {
		{
			stateName = "SquareImage",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	CompetitiveSettingsSelectedItemInfo:setLeftRight( 0, 1, 0, 0 )
	CompetitiveSettingsSelectedItemInfo:setTopBottom( 0, 1, 0, 0 )
	self:addElement( CompetitiveSettingsSelectedItemInfo )
	self.CompetitiveSettingsSelectedItemInfo = CompetitiveSettingsSelectedItemInfo
	
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		ForceNotifyGlobalModel( controller, "GametypeSettings.Update" )
		GoBack( self, controller )
		ClearSavedState( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GameSettingsBackground:close()
		self.Options:close()
		self.CompetitiveSettingsSelectedItemInfo:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Competitive_Settings_Wildcards.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

