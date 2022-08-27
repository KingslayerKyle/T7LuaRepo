-- 003b26343c8f52bd3adda1f74ada0d5e
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.CAC.Customization.CustomizationItem_ND" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.Pregame.Pregame_TimerOverlay" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfoPaneItemNameLabel" )
require( "ui.uieditor.widgets.CAC.BlackMarketItemDescription" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabBar" )
require( "ui.uieditor.widgets.TabbedWidgets.WeaponGroupsTabWidget" )
require( "ui.uieditor.widgets.CAC.Customization.ChallengeProgressionInfo" )
require( "ui.uieditor.widgets.CAC.ModeIconName" )
require( "ui.uieditor.widgets.BlackMarket.CryptokeyTypeNameLeft" )
require( "ui.uieditor.widgets.PC.Utility.XCamMouseControl" )

local PreLoadFunc = function ( self, controller )
	CoD.perController[controller].customizationType = Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE
	if IsCampaign() then
		self.disableBlur = true
	end
end

local f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	local f2_local0 = "reticle"
	if f2_arg1.filterString then
		DataSources.WeaponOptions.setCurrentFilterItem( f2_local0 .. "_" .. f2_arg1.filterString )
		f2_arg0.selectionList:updateDataSource()
		f2_arg0.selectionList:findItem( {
			weaponOptionSubIndex = 0
		}, nil, true, nil )
	end
end

local PostLoadFunc = function ( f3_arg0, f3_arg1 )
	f3_arg0.tabChanged = f0_local1
	local f3_local0 = Engine.GetModelValue( Engine.GetModel( CoD.perController[f3_arg1].classModel, CoD.CACUtility.GetBaseWeaponLoadoutSlotName( CoD.perController[f3_arg1].weaponCategory ) .. ".itemIndex" ) )
	local f3_local1 = Engine.GetItemAttachment( f3_local0, CoD.perController[f3_arg1].customReticleAttachmentIndex )
	local f3_local2 = CoD.perController[f3_arg1].customReticleAttachment
	CoD.WeaponOptionsTable = {}
	CoD.GetWeaponOptionsTableForCategory( f3_arg1, CoD.WeaponOptionsTable, Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE, f3_local0, f3_local1, true )
	for f3_local6, f3_local7 in ipairs( CoD.WeaponOptionsTable.reticle ) do
		local f3_local8 = Engine.GetModelValue( Engine.GetModel( f3_local7, "weaponOptionSubIndex" ) )
		local f3_local9 = Engine.GetModel( f3_local7, "name" )
		local f3_local10 = Engine.GetModel( f3_local7, "image" )
		local f3_local11 = Engine.GetModel( f3_local7, "isBMClassified" )
		if f3_local11 and not Engine.GetModelValue( f3_local11 ) then
			Engine.SetModelValue( f3_local9, "MPUI_RETICLE_" .. f3_local2 .. "_" .. f3_local8 )
			Engine.SetModelValue( f3_local10, f3_local2 .. "_" .. f3_local8 )
		end
	end
	f3_local3 = Engine.CurrentSessionMode()
	if f3_local3 == Enum.eModes.MODE_INVALID then
		f3_local3 = Enum.eModes.MODE_CAMPAIGN
	end
	f3_local4 = "reticle"
	f3_local5 = f3_local4 .. "_" .. CoD.WeaponOptionFilterToString( f3_local3 )
	f3_arg0.categoryTabs.Tabs.grid:setActiveItem( f3_arg0.categoryTabs.Tabs.grid:findItem( nil, {
		filterEnum = f3_local3
	}, false, false ) )
	for f3_local7 = Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_FIRST, Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_COUNT - 1, 1 do
		local f3_local11 = f3_arg0.categoryTabs.Tabs.grid:findItem( nil, {
			filterEnum = f3_local7
		}, false, false )
		if f3_local11 and (f3_local2 ~= "ir" or f3_local7 ~= Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_EXTRAS) then
			local f3_local12 = f3_local11:getModel( f3_arg1, "breadcrumbCount" )
			local f3_local13 = CoD.CACUtility.GetWeaponOptionTypeForName( f3_local4 )
			if f3_local12 then
				local f3_local14 = 0
				if f3_local7 < Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_MODE_COUNT then
					f3_local14 = Engine.WeaponOptionNewItemCount( f3_arg1, f3_local1, f3_local13, f3_local11.filterEnum )
				else
					f3_local14 = Engine.WeaponOptionNewModeAgnosticItemCount( f3_arg1, f3_local1, f3_local13, f3_local11.filterEnum )
				end
				Engine.SetModelValue( f3_local12, f3_local14 )
			end
		end
	end
	DataSources.WeaponOptions.setCurrentFilterItem( f3_local5 )
	DataSources.WeaponOptions.setCurrentFilterItemNoMode( f3_local4 )
end

LUI.createMenu.ReticleSelect = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ReticleSelect" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC_PrimaryAttachment"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ReticleSelect.buttonPrompts" )
	local f4_local1 = self
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( f4_local1, controller )
	LeftPanel:setLeftRight( true, false, 64, 427 )
	LeftPanel:setTopBottom( true, false, 126, 720 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f4_local1, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 86, 703.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local GenericMenuFrame0 = CoD.GenericMenuFrame.new( f4_local1, controller )
	GenericMenuFrame0:setLeftRight( true, true, 0, 0 )
	GenericMenuFrame0:setTopBottom( true, true, 0, 0 )
	GenericMenuFrame0.titleLabel:setText( Engine.Localize( "" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( GetReticlesMenuTitle( controller, "MENU_X_OPTICS" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_cac" ) )
	self:addElement( GenericMenuFrame0 )
	self.GenericMenuFrame0 = GenericMenuFrame0
	
	local selectionList = LUI.UIList.new( f4_local1, controller, 8, 0, nil, true, false, 0, 0, false, false )
	selectionList:makeFocusable()
	selectionList:setLeftRight( true, false, 77, 417 )
	selectionList:setTopBottom( true, false, 136, 592 )
	selectionList:setWidgetType( CoD.CustomizationItem_ND )
	selectionList:setHorizontalCount( 3 )
	selectionList:setVerticalCount( 4 )
	selectionList:setSpacing( 8 )
	selectionList:setVerticalCounter( CoD.verticalCounter )
	selectionList:setDataSource( "WeaponOptions" )
	selectionList:linkToElementModel( selectionList, "itemIndex", true, function ( model )
		local f5_local0 = selectionList
		local f5_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		}
		CoD.Menu.UpdateButtonShownState( f5_local0, f4_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	selectionList:linkToElementModel( selectionList, "isBMClassified", true, function ( model )
		local f6_local0 = selectionList
		local f6_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		}
		CoD.Menu.UpdateButtonShownState( f6_local0, f4_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	selectionList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f7_local0 = nil
		if IsItemWeaponOptionNew( element, controller ) then
			SetWeaponOptionAsOld( f4_local1, element, controller )
			UpdateSelfElementState( f4_local1, element, controller )
		end
		return f7_local0
	end )
	selectionList:registerEventHandler( "gain_focus", function ( element, event )
		local f8_local0 = nil
		if element.gainFocus then
			f8_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f8_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f4_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f8_local0
	end )
	selectionList:registerEventHandler( "lose_focus", function ( element, event )
		local f9_local0 = nil
		if element.loseFocus then
			f9_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f9_local0 = element.super:loseFocus( event )
		end
		return f9_local0
	end )
	f4_local1:AddButtonCallbackFunction( selectionList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
		if not IsItemWeaponOptionLocked( f10_arg1, f10_arg0, f10_arg2 ) and not IsSelfModelValueTrue( f10_arg0, f10_arg2, "isBMClassified" ) then
			SetWeaponOptionClassItem( self, f10_arg0, f10_arg2 )
			GoBack( self, f10_arg2 )
			return true
		else
			
		end
	end, function ( f11_arg0, f11_arg1, f11_arg2 )
		if not IsItemWeaponOptionLocked( f11_arg1, f11_arg0, f11_arg2 ) and not IsSelfModelValueTrue( f11_arg0, f11_arg2, "isBMClassified" ) then
			CoD.Menu.SetButtonLabel( f11_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	selectionList:mergeStateConditions( {
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return IsItemWeaponOptionEquipped( element, controller )
			end
		},
		{
			stateName = "New",
			condition = function ( menu, element, event )
				return IsItemWeaponOptionNew( element, controller )
			end
		},
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsItemWeaponOptionLocked( menu, element, controller )
			end
		}
	} )
	selectionList:linkToElementModel( selectionList, "isBMClassified", true, function ( model )
		f4_local1:updateElementState( selectionList, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		} )
	end )
	selectionList:linkToElementModel( selectionList, "isChallengeClassified", true, function ( model )
		f4_local1:updateElementState( selectionList, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isChallengeClassified"
		} )
	end )
	selectionList:linkToElementModel( selectionList, "isPackage", true, function ( model )
		f4_local1:updateElementState( selectionList, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isPackage"
		} )
	end )
	selectionList:linkToElementModel( selectionList, "itemIndex", true, function ( model )
		f4_local1:updateElementState( selectionList, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( selectionList )
	self.selectionList = selectionList
	
	local PregameTimerOverlay = CoD.Pregame_TimerOverlay.new( f4_local1, controller )
	PregameTimerOverlay:setLeftRight( true, true, 0, 0 )
	PregameTimerOverlay:setTopBottom( true, true, 0, 0 )
	PregameTimerOverlay:mergeStateConditions( {
		{
			stateName = "AttachmentSelect",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	PregameTimerOverlay:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.state" ), function ( model )
		f4_local1:updateElementState( PregameTimerOverlay, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.state"
		} )
	end )
	self:addElement( PregameTimerOverlay )
	self.PregameTimerOverlay = PregameTimerOverlay
	
	local categoryName = CoD.InfoPaneItemNameLabel.new( f4_local1, controller )
	categoryName:setLeftRight( true, false, 439, 839 )
	categoryName:setTopBottom( true, false, 136, 170 )
	self:addElement( categoryName )
	self.categoryName = categoryName
	
	local itemDescription = CoD.BlackMarketItemDescription.new( f4_local1, controller )
	itemDescription:setLeftRight( true, false, 439, 823 )
	itemDescription:setTopBottom( true, false, 174, 196 )
	itemDescription.weaponDescTextBox:setText( LocalizeIntoString( "MPUI_BLACKMARKET_ITEM_CLASSIFIED_DESC", "MPUI_RETICLE" ) )
	itemDescription:mergeStateConditions( {
		{
			stateName = "NotVisible",
			condition = function ( menu, element, event )
				return not IsSelfModelValueTrue( element, controller, "isBMClassified" )
			end
		}
	} )
	itemDescription:linkToElementModel( itemDescription, "isBMClassified", true, function ( model )
		f4_local1:updateElementState( itemDescription, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		} )
	end )
	self:addElement( itemDescription )
	self.itemDescription = itemDescription
	
	local categoryTabs = CoD.FE_TabBar.new( f4_local1, controller )
	categoryTabs:setLeftRight( true, false, 0, 2497 )
	categoryTabs:setTopBottom( true, false, 85, 126 )
	categoryTabs.Tabs.grid:setWidgetType( CoD.WeaponGroupsTabWidget )
	categoryTabs.Tabs.grid:setHorizontalCount( 8 )
	categoryTabs.Tabs.grid:setDataSource( "CACCustomizationTabs" )
	categoryTabs:registerEventHandler( "list_active_changed", function ( element, event )
		local f23_local0 = nil
		CallCustomElementFunction_Self( self, "tabChanged", element, controller )
		return f23_local0
	end )
	self:addElement( categoryTabs )
	self.categoryTabs = categoryTabs
	
	local progressionInfo = CoD.ChallengeProgressionInfo.new( f4_local1, controller )
	progressionInfo:setLeftRight( true, false, 439, 859 )
	progressionInfo:setTopBottom( false, true, -162, -78 )
	progressionInfo:mergeStateConditions( {
		{
			stateName = "NotVisible",
			condition = function ( menu, element, event )
				return ShouldHideItemWeaponOption( element, controller )
			end
		},
		{
			stateName = "bmComtracts",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Completed",
			condition = function ( menu, element, event )
				return not IsItemWeaponOptionLocked( menu, element, controller )
			end
		},
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				return not IsSelfModelValueNonEmptyString( element, controller, "unlockProgressAndTarget" )
			end
		}
	} )
	progressionInfo:linkToElementModel( progressionInfo, "itemIndex", true, function ( model )
		f4_local1:updateElementState( progressionInfo, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	progressionInfo:linkToElementModel( progressionInfo, "unlockProgressAndTarget", true, function ( model )
		f4_local1:updateElementState( progressionInfo, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "unlockProgressAndTarget"
		} )
	end )
	self:addElement( progressionInfo )
	self.progressionInfo = progressionInfo
	
	local ModeIconName = CoD.ModeIconName.new( f4_local1, controller )
	ModeIconName:setLeftRight( true, false, 891, 1181 )
	ModeIconName:setTopBottom( false, true, -162, -111 )
	self:addElement( ModeIconName )
	self.ModeIconName = ModeIconName
	
	local CryptokeyTypeNameLeft = CoD.CryptokeyTypeNameLeft.new( f4_local1, controller )
	CryptokeyTypeNameLeft:setLeftRight( true, false, 439, 550 )
	CryptokeyTypeNameLeft:setTopBottom( false, true, -101, -79 )
	CryptokeyTypeNameLeft:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f30_local0 = AlwaysTrue()
				if f30_local0 then
					if not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
						f30_local0 = IsSelfModelValueNonEmptyString( element, controller, "rarity" )
					else
						f30_local0 = false
					end
				end
				return f30_local0
			end
		}
	} )
	CryptokeyTypeNameLeft:linkToElementModel( CryptokeyTypeNameLeft, "isBMClassified", true, function ( model )
		f4_local1:updateElementState( CryptokeyTypeNameLeft, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		} )
	end )
	CryptokeyTypeNameLeft:linkToElementModel( CryptokeyTypeNameLeft, "rarity", true, function ( model )
		f4_local1:updateElementState( CryptokeyTypeNameLeft, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "rarity"
		} )
	end )
	self:addElement( CryptokeyTypeNameLeft )
	self.CryptokeyTypeNameLeft = CryptokeyTypeNameLeft
	
	local XCamMouseControl = CoD.XCamMouseControl.new( f4_local1, controller )
	XCamMouseControl:setLeftRight( true, false, 446, 1216 )
	XCamMouseControl:setTopBottom( true, false, 196, 552.6 )
	self:addElement( XCamMouseControl )
	self.XCamMouseControl = XCamMouseControl
	
	categoryName:linkToElementModel( selectionList, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			categoryName.itemName:setText( Engine.Localize( name ) )
		end
	end )
	itemDescription:linkToElementModel( selectionList, nil, false, function ( model )
		itemDescription:setModel( model, controller )
	end )
	progressionInfo:linkToElementModel( selectionList, nil, false, function ( model )
		progressionInfo:setModel( model, controller )
	end )
	progressionInfo:linkToElementModel( selectionList, "weaponOptionType", true, function ( model )
		local weaponOptionType = Engine.GetModelValue( model )
		if weaponOptionType then
			progressionInfo.requirementTitle:setText( Engine.Localize( GetWeaponOptionProgressTitle( controller, weaponOptionType ) ) )
		end
	end )
	progressionInfo:linkToElementModel( selectionList, "weaponOptionType", true, function ( model )
		local weaponOptionType = Engine.GetModelValue( model )
		if weaponOptionType then
			progressionInfo.completedTitle:setText( Engine.Localize( GetWeaponOptionCompleteTitle( controller, weaponOptionType ) ) )
		end
	end )
	ModeIconName:linkToElementModel( selectionList, nil, false, function ( model )
		ModeIconName:setModel( model, controller )
	end )
	CryptokeyTypeNameLeft:linkToElementModel( selectionList, "rarityType", false, function ( model )
		CryptokeyTypeNameLeft:setModel( model, controller )
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f40_local0 = nil
		ShowHeaderKickerAndIcon( f4_local1 )
		if not f40_local0 then
			f40_local0 = element:dispatchEventToChildren( event )
		end
		return f40_local0
	end )
	f4_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f41_arg0, f41_arg1, f41_arg2, f41_arg3 )
		GoBack( self, f41_arg2 )
		PlaySoundSetSound( self, "menu_no_selection" )
		SetPerControllerTableProperty( f41_arg2, "customizationType", nil )
		return true
	end, function ( f42_arg0, f42_arg1, f42_arg2 )
		CoD.Menu.SetButtonLabel( f42_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	GenericMenuFrame0:setModel( self.buttonModel, controller )
	selectionList.id = "selectionList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f4_local1
	} )
	if not self:restoreState() then
		self.selectionList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LeftPanel:close()
		element.FEMenuLeftGraphics:close()
		element.GenericMenuFrame0:close()
		element.selectionList:close()
		element.PregameTimerOverlay:close()
		element.categoryName:close()
		element.itemDescription:close()
		element.categoryTabs:close()
		element.progressionInfo:close()
		element.ModeIconName:close()
		element.CryptokeyTypeNameLeft:close()
		element.XCamMouseControl:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "ReticleSelect.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

