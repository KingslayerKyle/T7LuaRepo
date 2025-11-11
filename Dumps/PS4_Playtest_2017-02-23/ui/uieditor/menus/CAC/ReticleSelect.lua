require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.BlackMarket.CryptokeyTypeNameLeft" )
require( "ui.uieditor.widgets.CAC.BlackMarketItemDescription" )
require( "ui.uieditor.widgets.CAC.Customization.ChallengeProgressionInfo" )
require( "ui.uieditor.widgets.CAC.Customization.CustomizationItem_ND" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfoPaneItemNameLabel" )
require( "ui.uieditor.widgets.CAC.ModeIconName" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabBar" )
require( "ui.uieditor.widgets.Pregame.Pregame_TimerOverlay" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.TabbedWidgets.WeaponGroupsTabWidget" )

local PreLoadFunc = function ( self, controller )
	CoD.perController[controller].customizationType = Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE
	if IsCampaign() then
		self.disableBlur = true
	end
end

local UpdateListFromTabChanged = function ( self, element, controller )
	local filterCategory = "reticle"
	if element.filterString then
		DataSources.WeaponOptions.setCurrentFilterItem( filterCategory .. "_" .. element.filterString )
		self.selectionList:updateDataSource()
		self.selectionList:findItem( {
			weaponOptionSubIndex = 0
		}, nil, true, nil )
	end
end

local PostLoadFunc = function ( self, controller )
	self.tabChanged = UpdateListFromTabChanged
	local classModel = CoD.perController[controller].classModel
	local loadoutSlotName = CoD.CACUtility.GetBaseWeaponLoadoutSlotName( CoD.perController[controller].weaponCategory )
	local weaponItemIndex = Engine.GetModelValue( Engine.GetModel( classModel, loadoutSlotName .. ".itemIndex" ) )
	local attachmentIndex = Engine.GetItemAttachment( weaponItemIndex, CoD.perController[controller].customReticleAttachmentIndex )
	local attachmentRef = CoD.perController[controller].customReticleAttachment
	CoD.CACUtility.WeaponOptionsTable = {}
	CoD.CACUtility.GetWeaponOptionsTableForCategory( controller, CoD.CACUtility.WeaponOptionsTable, Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE, weaponItemIndex, attachmentIndex, true )
	for _, weaponOptionInfoModel in ipairs( CoD.CACUtility.WeaponOptionsTable.reticle ) do
		local subIndex = Engine.GetModelValue( Engine.GetModel( weaponOptionInfoModel, "weaponOptionSubIndex" ) )
		local nameModel = Engine.GetModel( weaponOptionInfoModel, "name" )
		local imageModel = Engine.GetModel( weaponOptionInfoModel, "image" )
		local isBMClassifiedModel = Engine.GetModel( weaponOptionInfoModel, "isBMClassified" )
		if isBMClassifiedModel and not Engine.GetModelValue( isBMClassifiedModel ) then
			Engine.SetModelValue( nameModel, "MPUI_RETICLE_" .. attachmentRef .. "_" .. subIndex )
			Engine.SetModelValue( imageModel, attachmentRef .. "_" .. subIndex )
		end
	end
	local currentMode = Engine.CurrentSessionMode()
	if currentMode == Enum.eModes.MODE_INVALID then
		currentMode = Enum.eModes.MODE_CAMPAIGN
	end
	local filterCategory = "reticle"
	local filterItemName = filterCategory .. "_" .. CoD.WeaponOptionFilterToString( currentMode )
	local tabWidget = self.categoryTabs.Tabs.grid:findItem( nil, {
		filterEnum = currentMode
	}, false, nil )
	self.categoryTabs.Tabs.grid:setActiveItem( tabWidget )
	for weaponOptionInfoModel = Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_FIRST, Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_COUNT - 1, 1 do
		local filetTabWidget = self.categoryTabs.Tabs.grid:findItem( nil, {
			filterEnum = weaponOptionInfoModel
		}, false, nil )
		if filetTabWidget then
			local breadcrumbCountModel = filetTabWidget:getModel( controller, "breadcrumbCount" )
			local weaponOptionType = CoD.CACUtility.GetWeaponOptionTypeForName( filterCategory )
			if breadcrumbCountModel then
				local newItemCount = 0
				if weaponOptionInfoModel < Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_MODE_COUNT then
					newItemCount = Engine.WeaponOptionNewItemCount( controller, attachmentIndex, weaponOptionType, filetTabWidget.filterEnum )
				else
					newItemCount = Engine.WeaponOptionNewModeAgnosticItemCount( controller, attachmentIndex, weaponOptionType, filetTabWidget.filterEnum )
				end
				Engine.SetModelValue( breadcrumbCountModel, newItemCount )
			end
		end
	end
	DataSources.WeaponOptions.setCurrentFilterItem( filterItemName )
	DataSources.WeaponOptions.setCurrentFilterItemNoMode( filterCategory )
end

LUI.createMenu.ReticleSelect = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ReticleSelect" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC_PrimaryAttachment"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ReticleSelect.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( 0, 0, 96, 640 )
	LeftPanel:setTopBottom( 0, 0, 189, 1080 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( 0, 0, 29, 107 )
	FEMenuLeftGraphics:setTopBottom( 0, 0, 129, 1055 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local GenericMenuFrame0 = CoD.GenericMenuFrame.new( self, controller )
	GenericMenuFrame0:setLeftRight( 0, 1, 0, 0 )
	GenericMenuFrame0:setTopBottom( 0, 1, 0, 0 )
	GenericMenuFrame0.titleLabel:setText( Engine.Localize( "" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( GetReticlesMenuTitle( controller, "MENU_X_OPTICS" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_cac" ) )
	self:addElement( GenericMenuFrame0 )
	self.GenericMenuFrame0 = GenericMenuFrame0
	
	local selectionList = LUI.UIList.new( self, controller, 12, 0, nil, true, false, 0, 0, false, false )
	selectionList:makeFocusable()
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
		self:updateElementState( selectionList, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		} )
	end )
	selectionList:linkToElementModel( selectionList, "isChallengeClassified", true, function ( model )
		self:updateElementState( selectionList, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isChallengeClassified"
		} )
	end )
	selectionList:linkToElementModel( selectionList, "itemIndex", true, function ( model )
		self:updateElementState( selectionList, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	selectionList:setLeftRight( 0, 0, 115, 625 )
	selectionList:setTopBottom( 0, 0, 204, 888 )
	selectionList:setWidgetType( CoD.CustomizationItem_ND )
	selectionList:setHorizontalCount( 3 )
	selectionList:setVerticalCount( 4 )
	selectionList:setSpacing( 12 )
	selectionList:setVerticalCounter( CoD.verticalCounter )
	selectionList:setDataSource( "WeaponOptions" )
	selectionList:linkToElementModel( selectionList, "itemIndex", true, function ( model )
		local element = selectionList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	selectionList:linkToElementModel( selectionList, "isBMClassified", true, function ( model )
		local element = selectionList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	selectionList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		if IsItemWeaponOptionNew( element, controller ) then
			SetWeaponOptionAsOld( self, element, controller )
			UpdateSelfElementState( self, element, controller )
		end
		return retVal
	end )
	selectionList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	selectionList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( selectionList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsItemWeaponOptionLocked( menu, element, controller ) and not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
			SetWeaponOptionClassItem( self, element, controller )
			GoBack( self, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsItemWeaponOptionLocked( menu, element, controller ) and not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( selectionList )
	self.selectionList = selectionList
	
	local PregameTimerOverlay = CoD.Pregame_TimerOverlay.new( self, controller )
	PregameTimerOverlay:mergeStateConditions( {
		{
			stateName = "AttachmentSelect",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	PregameTimerOverlay:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.state" ), function ( model )
		self:updateElementState( PregameTimerOverlay, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.state"
		} )
	end )
	PregameTimerOverlay:setLeftRight( 0, 1, 0, 0 )
	PregameTimerOverlay:setTopBottom( 0, 1, 0, 0 )
	self:addElement( PregameTimerOverlay )
	self.PregameTimerOverlay = PregameTimerOverlay
	
	local categoryName = CoD.InfoPaneItemNameLabel.new( self, controller )
	categoryName:setLeftRight( 0, 0, 658, 1258 )
	categoryName:setTopBottom( 0, 0, 204, 255 )
	self:addElement( categoryName )
	self.categoryName = categoryName
	
	local itemDescription = CoD.BlackMarketItemDescription.new( self, controller )
	itemDescription:mergeStateConditions( {
		{
			stateName = "NotVisible",
			condition = function ( menu, element, event )
				return not IsSelfModelValueTrue( element, controller, "isBMClassified" )
			end
		}
	} )
	itemDescription:linkToElementModel( itemDescription, "isBMClassified", true, function ( model )
		self:updateElementState( itemDescription, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		} )
	end )
	itemDescription:setLeftRight( 0, 0, 658, 1234 )
	itemDescription:setTopBottom( 0, 0, 261.5, 294.5 )
	itemDescription.weaponDescTextBox:setText( LocalizeIntoString( "MPUI_BLACKMARKET_ITEM_CLASSIFIED_DESC", "MPUI_RETICLE" ) )
	self:addElement( itemDescription )
	self.itemDescription = itemDescription
	
	local categoryTabs = CoD.FE_TabBar.new( self, controller )
	categoryTabs:setLeftRight( 0, 0, 0, 3746 )
	categoryTabs:setTopBottom( 0, 0, 127, 189 )
	categoryTabs.Tabs.grid:setWidgetType( CoD.WeaponGroupsTabWidget )
	categoryTabs.Tabs.grid:setHorizontalCount( 8 )
	categoryTabs.Tabs.grid:setDataSource( "CACCustomizationTabs" )
	categoryTabs:registerEventHandler( "list_active_changed", function ( element, event )
		local retVal = nil
		CallCustomElementFunction_Self( self, "tabChanged", element, controller )
		return retVal
	end )
	self:addElement( categoryTabs )
	self.categoryTabs = categoryTabs
	
	local progressionInfo = CoD.ChallengeProgressionInfo.new( self, controller )
	progressionInfo:mergeStateConditions( {
		{
			stateName = "NotVisible",
			condition = function ( menu, element, event )
				return ShouldHideItemWeaponOption( element, controller )
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
				return AlwaysFalse()
			end
		}
	} )
	progressionInfo:linkToElementModel( progressionInfo, "itemIndex", true, function ( model )
		self:updateElementState( progressionInfo, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	progressionInfo:setLeftRight( 0, 0, 659, 1289 )
	progressionInfo:setTopBottom( 1, 1, -243, -117 )
	self:addElement( progressionInfo )
	self.progressionInfo = progressionInfo
	
	local ModeIconName = CoD.ModeIconName.new( self, controller )
	ModeIconName:setLeftRight( 0, 0, 1336.5, 1771.5 )
	ModeIconName:setTopBottom( 1, 1, -243, -167 )
	self:addElement( ModeIconName )
	self.ModeIconName = ModeIconName
	
	local CryptokeyTypeNameLeft = CoD.CryptokeyTypeNameLeft.new( self, controller )
	CryptokeyTypeNameLeft:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f27_local0 = AlwaysTrue()
				if f27_local0 then
					if not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
						f27_local0 = IsSelfModelValueNonEmptyString( element, controller, "rarity" )
					else
						f27_local0 = false
					end
				end
				return f27_local0
			end
		}
	} )
	CryptokeyTypeNameLeft:linkToElementModel( CryptokeyTypeNameLeft, "isBMClassified", true, function ( model )
		self:updateElementState( CryptokeyTypeNameLeft, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		} )
	end )
	CryptokeyTypeNameLeft:linkToElementModel( CryptokeyTypeNameLeft, "rarity", true, function ( model )
		self:updateElementState( CryptokeyTypeNameLeft, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "rarity"
		} )
	end )
	CryptokeyTypeNameLeft:setLeftRight( 0, 0, 659, 825 )
	CryptokeyTypeNameLeft:setTopBottom( 1, 1, -151.5, -118.5 )
	self:addElement( CryptokeyTypeNameLeft )
	self.CryptokeyTypeNameLeft = CryptokeyTypeNameLeft
	
	categoryName:linkToElementModel( selectionList, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			categoryName.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	itemDescription:linkToElementModel( selectionList, nil, false, function ( model )
		itemDescription:setModel( model, controller )
	end )
	progressionInfo:linkToElementModel( selectionList, nil, false, function ( model )
		progressionInfo:setModel( model, controller )
	end )
	progressionInfo:linkToElementModel( selectionList, "weaponOptionType", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			progressionInfo.requirementTitle:setText( Engine.Localize( GetWeaponOptionProgressTitle( controller, modelValue ) ) )
		end
	end )
	progressionInfo:linkToElementModel( selectionList, "weaponOptionType", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			progressionInfo.completedTitle:setText( Engine.Localize( GetWeaponOptionCompleteTitle( controller, modelValue ) ) )
		end
	end )
	ModeIconName:linkToElementModel( selectionList, nil, false, function ( model )
		ModeIconName:setModel( model, controller )
	end )
	CryptokeyTypeNameLeft:linkToElementModel( selectionList, "rarityType", false, function ( model )
		CryptokeyTypeNameLeft:setModel( model, controller )
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		ShowHeaderKickerAndIcon( self )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		PlaySoundSetSound( self, "menu_no_selection" )
		SetPerControllerTableProperty( controller, "customizationType", nil )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
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
		menu = self
	} )
	if not self:restoreState() then
		self.selectionList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LeftPanel:close()
		self.FEMenuLeftGraphics:close()
		self.GenericMenuFrame0:close()
		self.selectionList:close()
		self.PregameTimerOverlay:close()
		self.categoryName:close()
		self.itemDescription:close()
		self.categoryTabs:close()
		self.progressionInfo:close()
		self.ModeIconName:close()
		self.CryptokeyTypeNameLeft:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "ReticleSelect.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

