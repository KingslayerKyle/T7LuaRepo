require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.CAC.Customization.ChallengeProgressionInfo" )
require( "ui.uieditor.widgets.CharacterCustomization.PersonalizeCharacter_CPProgressionMessage" )
require( "ui.uieditor.widgets.CharacterCustomization.PersonalizeCharacter_PersonalizeList" )
require( "ui.uieditor.widgets.CharacterCustomization.PersonalizeHero_InfoBlock" )
require( "ui.uieditor.widgets.Craft.WeaponBuildKits.WeaponBuildKitsLockIcon" )
require( "ui.uieditor.widgets.Heroes.heroSelectOptionList" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabBar" )
require( "ui.uieditor.widgets.PC.Utility.XCamMouseControl" )
require( "ui.uieditor.widgets.TabbedWidgets.WeaponGroupsTabWidget" )

local spacerRows = {}
local PreLoadFunc = function ( self, controller )
	self.disableBlur = true
	self.disableDarkenElement = true
	if CoD.isSafehouse then
		CoD.PlayerRoleUtility.customizationMode = Enum.eModes.MODE_CAMPAIGN
		Engine.SetActiveMenu( controller, Enum.uiMenuCommand_t.UIMENU_NONE )
	end
	if CoD.PlayerRoleUtility.customizationMode == Enum.eModes.MODE_CAMPAIGN then
		CoD.PlayerRoleUtility.SetEdittingHero( controller, Engine.GetEquippedHero( controller, CoD.PlayerRoleUtility.customizationMode ) )
	end
	CoD.PlayerRoleUtility.Heroes.heroCustomizationTable = Engine.GetHeroCustomizationTable( CoD.PlayerRoleUtility.customizationMode, CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits )
	self.reloadSelectionList = function ()
		CoD.PlayerRoleUtility.Heroes.selectionTable = Engine.GetEquippedInfoForHero( controller, CoD.PlayerRoleUtility.customizationMode, CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits )
	end
	
	self.reloadSelectionList()
	self.currentMode = CoD.PlayerRoleUtility.PersonalizeHeroData.Modes.ExploringOptions
end

local UpdateListFromTabChanged = function ( self, element, controller )
	local list = self.optionsList.optionsList
	if element.isBlackMarket then
		list.filter = CoD.PlayerRoleUtility.PersonalizeHeroData.BlackMarketFilter
	else
		list.filter = CoD.PlayerRoleUtility.PersonalizeHeroData.StandardFilter
	end
	list:updateDataSource()
end

local PostLoadFunc = function ( self, controller )
	self.tabChanged = UpdateListFromTabChanged
	self.personalizeList:clearNavigationTable()
	self.optionsList:clearNavigationTable()
	local lastFocus = nil
	self.updateMode = function ( newMode, updateListAndSelectSlot, element, isColorElement )
		CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingAreaItemIndex = nil
		local headerText = nil
		if newMode == CoD.PlayerRoleUtility.PersonalizeHeroData.Modes.ExploringOptions then
			SendClientScriptNotify( controller, "camera_change" .. CoD.GetLocalClientAdjustedNum( controller ), "exploring" )
			headerText = "MENU_SPECIALIST_PERSONALIZATION_CAPS"
			self.reloadSelectionList()
			if updateListAndSelectSlot then
				self.personalizeList.customizationList:updateDataSource()
				self.personalizeList.customizationList:findItem( nil, {
					categorySize = CoD.PlayerRoleUtility.Heroes.LargeCategory,
					customizationArea = updateListAndSelectSlot
				}, true )
			end
			self.categoryTabs.Tabs.m_disableNavigation = true
			self.categoryTabs:setAlpha( 0 )
			CoD.SwapFocusableElements( controller, lastFocus, self.personalizeList )
			lastFocus = self.personalizeList
			self:setState( "DefaultState" )
		elseif newMode == CoD.PlayerRoleUtility.PersonalizeHeroData.Modes.EdittingOption then
			local edittingStateName = "EdittingItem"
			if element.customizationArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
				SendClientScriptNotify( controller, "camera_change" .. CoD.GetLocalClientAdjustedNum( controller ), "inspecting_helmet" )
				headerText = "MENU_SPECIALIST_HEADS_CAPS"
			elseif element.customizationArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
				SendClientScriptNotify( controller, "camera_change" .. CoD.GetLocalClientAdjustedNum( controller ), "inspecting_body" )
				headerText = "MENU_SPECIALIST_BODIES_CAPS"
			else
				SendClientScriptNotify( controller, "camera_change" .. CoD.GetLocalClientAdjustedNum( controller ), "exploring" )
			end
			CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingArea = element.customizationArea
			CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingElement = element
			if element.customizationArea == CoD.PlayerRoleUtility.ShowcaseWeaponCategoryIndex then
				OpenChooseShowcaseWeapon( self, element, controller )
			elseif element.customizationArea == CoD.PlayerRoleUtility.TauntCategoryIndex then
				NavigateToMenu( self, "ChooseTaunts", true, controller )
			else
				if isColorElement then
					CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingAreaItemIndex = 1
				else
					CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingAreaItemIndex = nil
					if Enum.eModes.MODE_MULTIPLAYER == Engine.CurrentSessionMode() then
						edittingStateName = "EdittingItemTabs"
						local tabWidget = self.categoryTabs.Tabs.grid:getItemAtPosition( 1, 2, false )
						self.categoryTabs.Tabs.grid:setActiveItem( tabWidget )
						self.categoryTabs.Tabs.m_disableNavigation = false
						self.categoryTabs:setAlpha( 1 )
						local newItemCountTable = Engine.CharacterCustomizationNewItemCount( controller, CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits, CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingArea )
						for index, filterName in ipairs( CoD.PlayerRoleUtility.PersonalizeHeroData.HeroCustomizationTabCategories ) do
							local tabWidget = self.categoryTabs.Tabs.grid:findItem( nil, {
								filterName = filterName
							}, false, nil )
							if tabWidget then
								local breadcrumbModel = tabWidget:getModel( controller, "breadcrumbCount" )
								if breadcrumbModel then
									local newItemCount = 0
									if filterName == "loot" then
										newItemCount = newItemCountTable.loot
									else
										newItemCount = newItemCountTable.standard
									end
									Engine.SetModelValue( breadcrumbModel, newItemCount )
								end
							end
						end
					end
				end
				self.optionsList.optionsList.filter = CoD.PlayerRoleUtility.PersonalizeHeroData.StandardFilter
				self.optionsList.optionsList:updateDataSource()
				CoD.SwapFocusableElements( controller, lastFocus, self.optionsList )
				lastFocus = self.optionsList
				self:setState( edittingStateName )
			end
		end
		self.currentMode = newMode
		if headerText then
			self.Frame.titleLabel:setText( Engine.Localize( ConvertToUpperString( LocalizeWithEdittingHeroName( controller, headerText ) ) ) )
			self.Frame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( ConvertToUpperString( LocalizeWithEdittingHeroName( controller, headerText ) ) ) )
		end
	end
	
	self.updateMode( CoD.PlayerRoleUtility.PersonalizeHeroData.Modes.ExploringOptions )
end

LUI.createMenu.PersonalizeCharacter = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "PersonalizeCharacter" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "PersonalizeCharacter.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( 0.5, 0.5, -864, -322 )
	LeftPanel:setTopBottom( 0, 1, 126, -80 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local TabBacking = LUI.UIImage.new()
	TabBacking:setLeftRight( 0, 1, 0, 0 )
	TabBacking:setTopBottom( 0, 0, 186, 124 )
	TabBacking:setRGB( 0, 0, 0 )
	TabBacking:setAlpha( 0 )
	self:addElement( TabBacking )
	self.TabBacking = TabBacking
	
	local Frame = CoD.GenericMenuFrame.new( self, controller )
	Frame:setLeftRight( 0, 1, 0, 0 )
	Frame:setTopBottom( 0, 1, 0, 0 )
	Frame.titleLabel:setText( ConvertToUpperString( LocalizeWithEdittingHeroName( controller, "HEROES_OUTFITS_CAPS" ) ) )
	Frame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( ConvertToUpperString( LocalizeWithEdittingHeroName( controller, "HEROES_OUTFITS_CAPS" ) ) )
	Frame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_character" ) )
	self:addElement( Frame )
	self.Frame = Frame
	
	local personalizeList = CoD.PersonalizeCharacter_PersonalizeList.new( self, controller )
	personalizeList:setLeftRight( 0.5, 0.5, -844, -349 )
	personalizeList:setTopBottom( 0, 1, 204, -20 )
	self:addElement( personalizeList )
	self.personalizeList = personalizeList
	
	local optionsList = CoD.heroSelectOptionList.new( self, controller )
	optionsList:setLeftRight( 0.5, 0.5, -859, -337 )
	optionsList:setTopBottom( 0, 0, 204, 1050 )
	self:addElement( optionsList )
	self.optionsList = optionsList
	
	local categoryInfoBlock = CoD.PersonalizeHero_InfoBlock.new( self, controller )
	categoryInfoBlock:mergeStateConditions( {
		{
			stateName = "ShowCurrentlyEquippedInfo",
			condition = function ( menu, element, event )
				return IsMenuInState( menu, "DefaultState" )
			end
		}
	} )
	categoryInfoBlock:setLeftRight( 0.5, 0.5, -308, 108 )
	categoryInfoBlock:setTopBottom( 0, 0, 204, 908 )
	self:addElement( categoryInfoBlock )
	self.categoryInfoBlock = categoryInfoBlock
	
	local optionInfoBlock = CoD.PersonalizeHero_InfoBlock.new( self, controller )
	optionInfoBlock:setLeftRight( 0.5, 0.5, -307, 143 )
	optionInfoBlock:setTopBottom( 0, 0, 204, 908 )
	optionInfoBlock.CategoryDesc.weaponDescTextBox:setText( Engine.Localize( "HEROES_SHOWCASE_WEAPON_DESC" ) )
	optionInfoBlock.CurrentlyEquippedInfo.weaponNameWithVariant.variantName.itemName:setText( Engine.Localize( "" ) )
	self:addElement( optionInfoBlock )
	self.optionInfoBlock = optionInfoBlock
	
	local PersonalizeCharacterCPProgressionMessage0 = CoD.PersonalizeCharacter_CPProgressionMessage.new( self, controller )
	PersonalizeCharacterCPProgressionMessage0:setLeftRight( 0.5, 0.5, 492, 864 )
	PersonalizeCharacterCPProgressionMessage0:setTopBottom( 0, 0, 835, 873 )
	self:addElement( PersonalizeCharacterCPProgressionMessage0 )
	self.PersonalizeCharacterCPProgressionMessage0 = PersonalizeCharacterCPProgressionMessage0
	
	local progressionInfo = CoD.ChallengeProgressionInfo.new( self, controller )
	progressionInfo:mergeStateConditions( {
		{
			stateName = "NotVisible",
			condition = function ( menu, element, event )
				return ShouldHideItemHeroOption( element, controller )
			end
		},
		{
			stateName = "Completed",
			condition = function ( menu, element, event )
				return not IsCurrentLockedHeroOption( element, controller )
			end
		},
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				return not IsSelfModelValueNonEmptyString( element, controller, "unlockProgressAndTarget" )
			end
		}
	} )
	progressionInfo:linkToElementModel( progressionInfo, "optionIndex", true, function ( model )
		self:updateElementState( progressionInfo, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "optionIndex"
		} )
	end )
	progressionInfo:linkToElementModel( progressionInfo, "unlockProgressAndTarget", true, function ( model )
		self:updateElementState( progressionInfo, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "unlockProgressAndTarget"
		} )
	end )
	progressionInfo:setLeftRight( 1, 1, -726, -96 )
	progressionInfo:setTopBottom( 1, 1, -221, -95 )
	progressionInfo:setAlpha( 0 )
	progressionInfo.requirementTitle:setText( Engine.Localize( "MPUI_UNLOCK_REQUIREMENTS" ) )
	progressionInfo.completedTitle:setText( Engine.Localize( "MPUI_REQUIREMENTS_MET" ) )
	self:addElement( progressionInfo )
	self.progressionInfo = progressionInfo
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( 0, 0, 29, 107 )
	FEMenuLeftGraphics:setTopBottom( 0, 1, 126, -28 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local categoryTabs = CoD.FE_TabBar.new( self, controller )
	categoryTabs:setLeftRight( 0, 1, 0, 1920 )
	categoryTabs:setTopBottom( 0, 0, 128, 180 )
	categoryTabs.Tabs.grid:setWidgetType( CoD.WeaponGroupsTabWidget )
	categoryTabs.Tabs.grid:setHorizontalCount( 8 )
	categoryTabs.Tabs.grid:setDataSource( "HeroCustomizationTabs" )
	categoryTabs:registerEventHandler( "list_active_changed", function ( element, event )
		local retVal = nil
		CallCustomElementFunction_Self( self, "tabChanged", element, controller )
		return retVal
	end )
	self:addElement( categoryTabs )
	self.categoryTabs = categoryTabs
	
	local XCamMouseControl = CoD.XCamMouseControl.new( self, controller )
	XCamMouseControl:setLeftRight( 0.5, 0.5, -100, 712 )
	XCamMouseControl:setTopBottom( 0, 1, 252, -94 )
	self:addElement( XCamMouseControl )
	self.XCamMouseControl = XCamMouseControl
	
	local LockIcon = CoD.WeaponBuildKitsLockIcon.new( self, controller )
	LockIcon:mergeStateConditions( {
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsCurrentLockedHeroOption( element, controller )
			end
		}
	} )
	LockIcon:linkToElementModel( LockIcon, "optionIndex", true, function ( model )
		self:updateElementState( LockIcon, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "optionIndex"
		} )
	end )
	LockIcon:setLeftRight( 0.5, 0.5, 238, 382 )
	LockIcon:setTopBottom( 0, 0, 21.5, 1026.5 )
	self:addElement( LockIcon )
	self.LockIcon = LockIcon
	
	categoryInfoBlock:linkToElementModel( personalizeList.customizationList, "categoryDesc", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			categoryInfoBlock.CategoryDesc.weaponDescTextBox:setText( Engine.Localize( modelValue ) )
		end
	end )
	categoryInfoBlock:linkToElementModel( personalizeList.customizationList, "fullCategoryName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			categoryInfoBlock.PersonalizeSpecTitle.weaponNameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	categoryInfoBlock:linkToElementModel( personalizeList.customizationList, "currentSelectionNameAlpha", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			categoryInfoBlock.CurrentlyEquippedInfo:setAlpha( modelValue )
		end
	end )
	categoryInfoBlock:linkToElementModel( personalizeList.customizationList, "currentSelectionName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			categoryInfoBlock.CurrentlyEquippedInfo.weaponNameWithVariant.itemName.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	categoryInfoBlock:linkToElementModel( personalizeList.customizationList, "currentSelectionVariantNameAlpha", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			categoryInfoBlock.CurrentlyEquippedInfo.weaponNameWithVariant.variantName:setAlpha( modelValue )
		end
	end )
	categoryInfoBlock:linkToElementModel( personalizeList.customizationList, "currentSelectionVariantName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			categoryInfoBlock.CurrentlyEquippedInfo.weaponNameWithVariant.variantName.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	optionInfoBlock:linkToElementModel( personalizeList.customizationList, "fullCategoryName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			optionInfoBlock.PersonalizeSpecTitle.weaponNameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	optionInfoBlock:linkToElementModel( optionsList.optionsList, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			optionInfoBlock.CurrentlyEquippedInfo.weaponNameWithVariant.itemName.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	optionInfoBlock:linkToElementModel( optionsList.optionsList, "rarityType", false, function ( model )
		optionInfoBlock.CryptokeyTypeNameLeft:setModel( model, controller )
	end )
	progressionInfo:linkToElementModel( optionsList.optionsList, nil, false, function ( model )
		progressionInfo:setModel( model, controller )
	end )
	LockIcon:linkToElementModel( optionsList.optionsList, nil, false, function ( model )
		LockIcon:setModel( model, controller )
	end )
	personalizeList.navigation = {
		left = optionsList
	}
	optionsList.navigation = {
		right = personalizeList
	}
	self.resetProperties = function ()
		optionsList:completeAnimation()
		optionInfoBlock:completeAnimation()
		progressionInfo:completeAnimation()
		LockIcon:completeAnimation()
		categoryInfoBlock:completeAnimation()
		personalizeList:completeAnimation()
		TabBacking:completeAnimation()
		optionsList:setLeftRight( 0.5, 0.5, -859, -337 )
		optionsList:setTopBottom( 0, 0, 204, 1050 )
		optionsList:setAlpha( 1 )
		optionInfoBlock:setAlpha( 1 )
		optionInfoBlock.CurrentlyEquippedInfo:setAlpha( 1 )
		progressionInfo:setLeftRight( 1, 1, -726, -96 )
		progressionInfo:setTopBottom( 1, 1, -221, -95 )
		progressionInfo:setAlpha( 0 )
		LockIcon:setAlpha( 1 )
		categoryInfoBlock:setAlpha( 1 )
		personalizeList:setAlpha( 1 )
		TabBacking:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				optionsList:completeAnimation()
				self.optionsList:setAlpha( 0 )
				self.clipFinished( optionsList, {} )
				optionInfoBlock:completeAnimation()
				self.optionInfoBlock:setAlpha( 0 )
				self.clipFinished( optionInfoBlock, {} )
				progressionInfo:completeAnimation()
				self.progressionInfo:setLeftRight( 0, 0, 659, 1289 )
				self.progressionInfo:setTopBottom( 1, 1, -243, -117 )
				self.clipFinished( progressionInfo, {} )
				LockIcon:completeAnimation()
				self.LockIcon:setAlpha( 0 )
				self.clipFinished( LockIcon, {} )
			end,
			EdittingItem = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				local personalizeListFrame2 = function ( personalizeList, event )
					if not event.interrupted then
						personalizeList:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					personalizeList:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( personalizeList, event )
					else
						personalizeList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				personalizeList:completeAnimation()
				self.personalizeList:setAlpha( 1 )
				personalizeListFrame2( personalizeList, {} )
				local optionsListFrame2 = function ( optionsList, event )
					if not event.interrupted then
						optionsList:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					optionsList:setLeftRight( 0.5, 0.5, -861, -339 )
					optionsList:setTopBottom( 0, 1, 204, 1050 )
					optionsList:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( optionsList, event )
					else
						optionsList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				optionsList:completeAnimation()
				self.optionsList:setLeftRight( 0.5, 0.5, -1482, -960 )
				self.optionsList:setTopBottom( 0, 1, 204, 1050 )
				self.optionsList:setAlpha( 0 )
				optionsListFrame2( optionsList, {} )
				local categoryInfoBlockFrame2 = function ( categoryInfoBlock, event )
					if not event.interrupted then
						categoryInfoBlock:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					categoryInfoBlock:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( categoryInfoBlock, event )
					else
						categoryInfoBlock:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				categoryInfoBlock:completeAnimation()
				self.categoryInfoBlock:setAlpha( 1 )
				categoryInfoBlockFrame2( categoryInfoBlock, {} )
				local optionInfoBlockFrame2 = function ( optionInfoBlock, event )
					if not event.interrupted then
						optionInfoBlock:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
						optionInfoBlock.CurrentlyEquippedInfo:beginAnimation( "subkeyframe", 200, false, true, CoD.TweenType.Linear )
					end
					optionInfoBlock:setAlpha( 1 )
					optionInfoBlock.CurrentlyEquippedInfo:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( optionInfoBlock, event )
					else
						optionInfoBlock:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				optionInfoBlock:completeAnimation()
				optionInfoBlock.CurrentlyEquippedInfo:completeAnimation()
				self.optionInfoBlock:setAlpha( 0 )
				self.optionInfoBlock.CurrentlyEquippedInfo:setAlpha( 0 )
				optionInfoBlockFrame2( optionInfoBlock, {} )
				local LockIconFrame2 = function ( LockIcon, event )
					if not event.interrupted then
						LockIcon:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					LockIcon:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LockIcon, event )
					else
						LockIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LockIcon:completeAnimation()
				self.LockIcon:setAlpha( 0 )
				LockIconFrame2( LockIcon, {} )
			end,
			EdittingItemTabs = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				local TabBackingFrame2 = function ( TabBacking, event )
					local TabBackingFrame3 = function ( TabBacking, event )
						if not event.interrupted then
							TabBacking:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Linear )
						end
						TabBacking:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( TabBacking, event )
						else
							TabBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						TabBackingFrame3( TabBacking, event )
						return 
					else
						TabBacking:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Linear )
						TabBacking:setAlpha( 1 )
						TabBacking:registerEventHandler( "transition_complete_keyframe", TabBackingFrame3 )
					end
				end
				
				TabBacking:completeAnimation()
				self.TabBacking:setAlpha( 0 )
				TabBackingFrame2( TabBacking, {} )
				local personalizeListFrame2 = function ( personalizeList, event )
					if not event.interrupted then
						personalizeList:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					personalizeList:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( personalizeList, event )
					else
						personalizeList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				personalizeList:completeAnimation()
				self.personalizeList:setAlpha( 1 )
				personalizeListFrame2( personalizeList, {} )
				local optionsListFrame2 = function ( optionsList, event )
					if not event.interrupted then
						optionsList:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					optionsList:setLeftRight( 0.5, 0.5, -859, -337 )
					optionsList:setTopBottom( 0, 0, 204, 1050 )
					optionsList:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( optionsList, event )
					else
						optionsList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				optionsList:completeAnimation()
				self.optionsList:setLeftRight( 0.5, 0.5, -1482, -960 )
				self.optionsList:setTopBottom( 0, 0, 204, 1050 )
				self.optionsList:setAlpha( 0 )
				optionsListFrame2( optionsList, {} )
				local categoryInfoBlockFrame2 = function ( categoryInfoBlock, event )
					if not event.interrupted then
						categoryInfoBlock:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					categoryInfoBlock:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( categoryInfoBlock, event )
					else
						categoryInfoBlock:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				categoryInfoBlock:completeAnimation()
				self.categoryInfoBlock:setAlpha( 1 )
				categoryInfoBlockFrame2( categoryInfoBlock, {} )
				local optionInfoBlockFrame2 = function ( optionInfoBlock, event )
					if not event.interrupted then
						optionInfoBlock:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					optionInfoBlock:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( optionInfoBlock, event )
					else
						optionInfoBlock:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				optionInfoBlock:completeAnimation()
				self.optionInfoBlock:setAlpha( 0 )
				optionInfoBlockFrame2( optionInfoBlock, {} )
				local LockIconFrame2 = function ( LockIcon, event )
					if not event.interrupted then
						LockIcon:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					LockIcon:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LockIcon, event )
					else
						LockIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LockIcon:completeAnimation()
				self.LockIcon:setAlpha( 0 )
				LockIconFrame2( LockIcon, {} )
			end
		},
		EdittingItem = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				personalizeList:completeAnimation()
				self.personalizeList:setAlpha( 0 )
				self.clipFinished( personalizeList, {} )
				categoryInfoBlock:completeAnimation()
				self.categoryInfoBlock:setAlpha( 0 )
				self.clipFinished( categoryInfoBlock, {} )
				progressionInfo:completeAnimation()
				self.progressionInfo:setLeftRight( 0, 0, 653, 1283 )
				self.progressionInfo:setTopBottom( 1, 1, -243, -117 )
				self.progressionInfo:setAlpha( 1 )
				self.clipFinished( progressionInfo, {} )
			end,
			DefaultState = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				local personalizeListFrame2 = function ( personalizeList, event )
					if not event.interrupted then
						personalizeList:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					personalizeList:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( personalizeList, event )
					else
						personalizeList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				personalizeList:completeAnimation()
				self.personalizeList:setAlpha( 0 )
				personalizeListFrame2( personalizeList, {} )
				local optionsListFrame2 = function ( optionsList, event )
					if not event.interrupted then
						optionsList:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					optionsList:setLeftRight( 0.5, 0.5, -1481, -959 )
					optionsList:setTopBottom( 0, 0, 204, 1050 )
					optionsList:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( optionsList, event )
					else
						optionsList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				optionsList:completeAnimation()
				self.optionsList:setLeftRight( 0.5, 0.5, -859, -337 )
				self.optionsList:setTopBottom( 0, 0, 204, 1050 )
				self.optionsList:setAlpha( 1 )
				optionsListFrame2( optionsList, {} )
				local categoryInfoBlockFrame2 = function ( categoryInfoBlock, event )
					if not event.interrupted then
						categoryInfoBlock:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					categoryInfoBlock:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( categoryInfoBlock, event )
					else
						categoryInfoBlock:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				categoryInfoBlock:completeAnimation()
				self.categoryInfoBlock:setAlpha( 0 )
				categoryInfoBlockFrame2( categoryInfoBlock, {} )
				local optionInfoBlockFrame2 = function ( optionInfoBlock, event )
					if not event.interrupted then
						optionInfoBlock:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					optionInfoBlock:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( optionInfoBlock, event )
					else
						optionInfoBlock:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				optionInfoBlock:completeAnimation()
				self.optionInfoBlock:setAlpha( 1 )
				optionInfoBlockFrame2( optionInfoBlock, {} )
				local LockIconFrame2 = function ( LockIcon, event )
					if not event.interrupted then
						LockIcon:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					LockIcon:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( LockIcon, event )
					else
						LockIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LockIcon:completeAnimation()
				self.LockIcon:setAlpha( 1 )
				LockIconFrame2( LockIcon, {} )
			end
		},
		EdittingItemTabs = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				TabBacking:completeAnimation()
				self.TabBacking:setAlpha( 1 )
				self.clipFinished( TabBacking, {} )
				personalizeList:completeAnimation()
				self.personalizeList:setAlpha( 0 )
				self.clipFinished( personalizeList, {} )
				categoryInfoBlock:completeAnimation()
				self.categoryInfoBlock:setAlpha( 0 )
				self.clipFinished( categoryInfoBlock, {} )
				progressionInfo:completeAnimation()
				self.progressionInfo:setLeftRight( 0.5, 0.5, -307, 323 )
				self.progressionInfo:setTopBottom( 0, 0, 837, 963 )
				self.progressionInfo:setAlpha( 1 )
				self.clipFinished( progressionInfo, {} )
			end,
			DefaultState = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				local TabBackingFrame2 = function ( TabBacking, event )
					local TabBackingFrame3 = function ( TabBacking, event )
						if not event.interrupted then
							TabBacking:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Linear )
						end
						TabBacking:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( TabBacking, event )
						else
							TabBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						TabBackingFrame3( TabBacking, event )
						return 
					else
						TabBacking:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Linear )
						TabBacking:setAlpha( 0 )
						TabBacking:registerEventHandler( "transition_complete_keyframe", TabBackingFrame3 )
					end
				end
				
				TabBacking:completeAnimation()
				self.TabBacking:setAlpha( 1 )
				TabBackingFrame2( TabBacking, {} )
				local personalizeListFrame2 = function ( personalizeList, event )
					if not event.interrupted then
						personalizeList:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					personalizeList:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( personalizeList, event )
					else
						personalizeList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				personalizeList:completeAnimation()
				self.personalizeList:setAlpha( 0 )
				personalizeListFrame2( personalizeList, {} )
				local optionsListFrame2 = function ( optionsList, event )
					if not event.interrupted then
						optionsList:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					optionsList:setLeftRight( 0.5, 0.5, -1481, -337 )
					optionsList:setTopBottom( 0, 0, 204, 1050 )
					optionsList:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( optionsList, event )
					else
						optionsList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				optionsList:completeAnimation()
				self.optionsList:setLeftRight( 0.5, 0.5, -859, -337 )
				self.optionsList:setTopBottom( 0, 0, 204, 1050 )
				self.optionsList:setAlpha( 1 )
				optionsListFrame2( optionsList, {} )
				local categoryInfoBlockFrame2 = function ( categoryInfoBlock, event )
					if not event.interrupted then
						categoryInfoBlock:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					categoryInfoBlock:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( categoryInfoBlock, event )
					else
						categoryInfoBlock:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				categoryInfoBlock:completeAnimation()
				self.categoryInfoBlock:setAlpha( 0 )
				categoryInfoBlockFrame2( categoryInfoBlock, {} )
				local optionInfoBlockFrame2 = function ( optionInfoBlock, event )
					if not event.interrupted then
						optionInfoBlock:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					optionInfoBlock:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( optionInfoBlock, event )
					else
						optionInfoBlock:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				optionInfoBlock:completeAnimation()
				self.optionInfoBlock:setAlpha( 1 )
				optionInfoBlockFrame2( optionInfoBlock, {} )
				local LockIconFrame2 = function ( LockIcon, event )
					if not event.interrupted then
						LockIcon:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					LockIcon:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( LockIcon, event )
					else
						LockIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LockIcon:completeAnimation()
				self.LockIcon:setAlpha( 1 )
				LockIconFrame2( LockIcon, {} )
			end
		}
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_opened", function ( element, event )
		local retVal = nil
		if TestAndSetFirstTimeMenu( controller, "com_firsttime_wardrobe" ) and IsCampaign() then
			OpenGenericLargePopup( self, controller, "MENU_FIRSTTIME_WARDROBE", "MENU_FIRSTTIME_WARDROBE2", "com_firsttime_wardrobe_image", "MENU_FIRSTTIME_WARDROBE_BUTTONTEXT", "", "" )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		if IsInGame() then
			RefreshCharacterCustomization( self, element, controller )
			SendClientScriptMenuChangeNotify( controller, self, true )
			LockInput( self, controller, true )
			PrepareOpenMenuInSafehouse( controller )
			ShowHeaderIconOnly( self )
			SetElementStateByElementName( self, "Frame", controller, "Update" )
			PlayClipOnElement( self, {
				elementName = "Frame",
				clipName = "Intro"
			}, controller )
		elseif InCharacterCustomizationMode( Enum.eModes.MODE_CAMPAIGN ) then
			RefreshCharacterCustomization( self, element, controller )
			SendClientScriptMenuChangeNotify( controller, self, true )
			ShowHeaderIconOnly( self )
		else
			SendClientScriptMenuChangeNotify( controller, self, true )
			ShowHeaderKickerAndIcon( self )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		if IsElementPropertyValue( element, "headItem", true ) then
			SetElementStateByElementName( self, "PersonalizeCharacterCPProgressionMessage0", controller, "NeedMessage" )
		else
			SetElementStateByElementName( self, "PersonalizeCharacterCPProgressionMessage0", controller, "DefaultState" )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		if not IsEdittingHeroOption( menu ) and IsInGame() then
			SaveLoadout( self, controller )
			ClearSavedState( self, controller )
			SendClientScriptMenuChangeNotify( controller, menu, false )
			PrepareCloseMenuInSafehouse( controller )
			LockInput( self, controller, false )
			SendOwnMenuResponse( menu, controller, "closed" )
			Close( self, controller )
			return true
		elseif not IsEdittingHeroOption( menu ) then
			SaveLoadout( self, controller )
			ClearSavedState( self, controller )
			SendClientScriptMenuChangeNotify( controller, menu, false )
			GoBack( self, controller )
			return true
		elseif IsEdittingHeroOption( menu ) then
			CancelHeroOptionSelection( menu, controller )
			PlaySoundSetSound( self, "menu_go_back" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsEdittingHeroOption( menu ) and IsInGame() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
			return true
		elseif not IsEdittingHeroOption( menu ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
			return true
		elseif IsEdittingHeroOption( menu ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "PLATFORM_EMBLEM_ROTATE_LAYER", nil )
		return true
	end, false )
	Frame:setModel( self.buttonModel, controller )
	personalizeList.id = "personalizeList"
	optionsList.id = "optionsList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.personalizeList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LeftPanel:close()
		self.Frame:close()
		self.personalizeList:close()
		self.optionsList:close()
		self.categoryInfoBlock:close()
		self.optionInfoBlock:close()
		self.PersonalizeCharacterCPProgressionMessage0:close()
		self.progressionInfo:close()
		self.FEMenuLeftGraphics:close()
		self.categoryTabs:close()
		self.XCamMouseControl:close()
		self.LockIcon:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "PersonalizeCharacter.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

