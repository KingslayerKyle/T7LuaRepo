require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.SelectMenuWidgetNew" )
require( "ui.uieditor.widgets.CAC.GridItemVariantButton" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponVariantIcon" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideListBoxes" )

local CreateItemListDataSource = function ( controller, infoTable, weaponVariantInfo )
	local dataSoucreName = "WeaponVariantAttachmentList" .. infoTable.properties.index
	DataSources[dataSoucreName] = DataSourceHelpers.ListSetup( dataSoucreName, function ( controller )
		local attachmentTable = {}
		local weaponIndex = weaponVariantInfo.weaponIndex
		for index, attachmentIndex in ipairs( weaponVariantInfo.attachmentsByIndex ) do
			table.insert( attachmentTable, {
				models = {
					image = Engine.GetAttachmentImage( weaponIndex, attachmentIndex ) .. "_wv_icon"
				}
			} )
		end
		if weaponVariantInfo.isWildcardNeeded then
			table.insert( attachmentTable, {
				models = {
					image = "cac_mods_primary_gunfighter_wv_icon"
				}
			} )
		end
		return attachmentTable
	end, true )
	return dataSoucreName
end

local GetWeaponVariantListModels = function ( controller, weaponVariantInfo )
	local infoTable = {
		models = {
			variantName = weaponVariantInfo.variantName,
			weaponItemIndex = weaponVariantInfo.weaponIndex
		},
		properties = {
			index = weaponVariantInfo.index,
			weaponVariantInfo = weaponVariantInfo
		}
	}
	infoTable.models.listDataSource = CreateItemListDataSource( controller, infoTable, weaponVariantInfo )
	return infoTable
end

local UpdateAttachmentsTable = function ( attachmentTable )
	for i = #attachmentTable, 1, -1 do
		if attachmentTable[i] <= CoD.CACUtility.EmptyItemIndex then
			table.remove( attachmentTable, i )
		end
	end
	return attachmentTable
end

local WeaponVariantListPrepare = function ( controller )
	local infoTable = {}
	local baseWeaponIndex = CoD.perController[controller].weaponIndexForVariant
	local baseWeaponVariant = {
		variantName = Engine.GetItemName( baseWeaponIndex ),
		variantIndex = CoD.CACUtility.EmptyItemIndex,
		weaponIndex = baseWeaponIndex,
		index = 0,
		attachmentsByIndex = {},
		camoIndex = 0,
		reticleIndex = 0,
		paintjobIndex = 0,
		cacVariantIndex = 0
	}
	table.insert( infoTable, GetWeaponVariantListModels( controller, baseWeaponVariant ) )
	local weaponVaraintTable = CoD.CraftUtility.Gunsmith.GetSortedWeaponVariantList( baseWeaponIndex )
	for index, weaponVariantInfo in ipairs( weaponVaraintTable ) do
		local variant = CoD.CraftUtility.Gunsmith.GetVariantByIndex( controller, weaponVariantInfo.variantIndex )
		if CoD.CACUtility.EmptyItemIndex < variant.weaponIndex then
			local attachmentsByIndex = {}
			local attachments = UpdateAttachmentsTable( variant.attachment )
			local numAttachments = #attachments
			local isWildcardNeeded = false
			local variantHasOpticAttachment = false
			local f5_local3 = CoD.perController[controller].weaponCategory == "primary"
			local maxNonOpticsAttachmentsWithoutWildcard = 2
			if not f5_local3 then
				maxNonOpticsAttachmentsWithoutWildcard = 1
			end
			local maxAttachmentsWithoutWildcard = maxNonOpticsAttachmentsWithoutWildcard + 1
			for i, attachmentTableIndex in ipairs( attachments ) do
				if CoD.CACUtility.EmptyItemIndex < attachmentTableIndex then
					local newAttachmentIndex = Engine.GetAttachmentIndexByAttachmentTableIndex( variant.weaponIndex, attachmentTableIndex )
					if Engine.IsOptic( variant.weaponIndex, newAttachmentIndex ) then
						variantHasOpticAttachment = true
					end
					table.insert( attachmentsByIndex, newAttachmentIndex )
				end
			end
			if not (not variantHasOpticAttachment or maxAttachmentsWithoutWildcard >= numAttachments) or not variantHasOpticAttachment and maxNonOpticsAttachmentsWithoutWildcard < numAttachments then
				isWildcardNeeded = true
			end
			variant.attachmentsByIndex = attachmentsByIndex
			variant.index = index
			variant.isWildcardNeeded = isWildcardNeeded
			table.insert( infoTable, GetWeaponVariantListModels( controller, variant ) )
		end
	end
	return infoTable
end

DataSources.WeaponVariantList = DataSourceHelpers.ListSetup( "WeaponVariantList", WeaponVariantListPrepare, false )
local PreLoadFunc = function ( self, controller )
	local perControllerModel = Engine.GetModelForController( controller )
	Engine.CreateModel( perControllerModel, "WeaponVariantList.numItemsToRemove" )
	Engine.CreateModel( perControllerModel, "WeaponVariantList.curWeaponVariantName" )
end

local PostLoadFunc = function ( self, controller )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ()
		ClearSavedState( self, controller )
	end )
end

LUI.createMenu.PrimaryWeaponVariantSelect = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "PrimaryWeaponVariantSelect" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( true, false, 64, 428 )
	LeftPanel:setTopBottom( true, false, 78, 667 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	LeftPanel.FEButtonPanel:setShaderVector( 0, 24.98, 25, 0, 0 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local selectMenuWidget = CoD.SelectMenuWidgetNew.new( self, controller )
	selectMenuWidget:setLeftRight( true, true, 0, 0 )
	selectMenuWidget:setTopBottom( true, true, 0, 0 )
	selectMenuWidget:setRGB( 1, 1, 1 )
	selectMenuWidget.background.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MPUI_PRIMARY_WEAPON_CAPS" ) )
	selectMenuWidget:mergeStateConditions( {
		{
			stateName = "GridLayout",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( selectMenuWidget )
	self.selectMenuWidget = selectMenuWidget
	
	local selectionList = LUI.UIList.new( self, controller, 7, 0, nil, true, false, 0, 0, false, false )
	selectionList:makeFocusable()
	selectionList:setLeftRight( true, false, 77, 415 )
	selectionList:setTopBottom( true, false, 136, 589 )
	selectionList:setRGB( 1, 1, 1 )
	selectionList:setDataSource( "WeaponVariantList" )
	selectionList:setWidgetType( CoD.GridItemVariantButton )
	selectionList:setHorizontalCount( 3 )
	selectionList:setVerticalCount( 4 )
	selectionList:setSpacing( 7 )
	selectionList:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		SetWeaponVariant( self, element, controller )
		return retVal
	end )
	selectionList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		FocusWeaponVariant( self, element, controller )
		return retVal
	end )
	self:addElement( selectionList )
	self.selectionList = selectionList
	
	local attachmentList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, true )
	attachmentList:makeFocusable()
	attachmentList:setLeftRight( true, false, 450, 754 )
	attachmentList:setTopBottom( true, false, 183, 215 )
	attachmentList:setRGB( 1, 1, 1 )
	attachmentList:setWidgetType( CoD.WeaponVariantIcon )
	attachmentList:setHorizontalCount( 9 )
	self:addElement( attachmentList )
	self.attachmentList = attachmentList
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, -11, 1293 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local cacElemsSideListBoxes0 = CoD.cac_ElemsSideListBoxes.new( self, controller )
	cacElemsSideListBoxes0:setLeftRight( true, false, 18.87, 71.87 )
	cacElemsSideListBoxes0:setTopBottom( true, false, -12, 658 )
	cacElemsSideListBoxes0:setRGB( 1, 1, 1 )
	self:addElement( cacElemsSideListBoxes0 )
	self.cacElemsSideListBoxes0 = cacElemsSideListBoxes0
	
	selectMenuWidget:linkToElementModel( selectionList, nil, false, function ( model )
		selectMenuWidget:setModel( model, controller )
	end )
	selectMenuWidget:linkToElementModel( selectionList, "variantName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			selectMenuWidget.selectionInfoWidget.WeaponNameWidget0.weaponNameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	attachmentList:linkToElementModel( selectionList, "listDataSource", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			attachmentList:setDataSource( modelValue )
		end
	end )
	selectionList.navigation = {
		right = attachmentList
	}
	attachmentList.navigation = {
		left = selectionList
	}
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		menu:addButtonPrompt( "secondary", Engine.Localize( "MENU_BACK" ), "ESCAPE", element )
		return true
	end
	
	self.buttonPromptAddFunctions.primary = function ( menu, element, event )
		menu:addButtonPrompt( "primary", Engine.Localize( "MENU_SELECT_CAPS" ), "ENTER", element )
		return true
	end
	
	self.buttonPromptAddFunctions.secondary( self, self, {
		controller = controller
	} )
	self.buttonPromptAddFunctions.primary( self, self, {
		controller = controller
	} )
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESCAPE") then
			GoBack( self, controller )
			ClearSavedState( self, controller )
		end
		if not self.occludedBy and event.button ~= "primary" and event.button == "key_shortcut" and event.key == "ENTER" then
			
		else
			
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	selectionList.id = "selectionList"
	attachmentList.id = "attachmentList"
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
	self.close = function ( self )
		self.LeftPanel:close()
		self.selectMenuWidget:close()
		self.selectionList:close()
		self.attachmentList:close()
		self.cacElemsSideListBoxes0:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

