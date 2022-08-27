-- 50a1261a5f1b43e4c292d9326a7de732
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.CharacterCustomization.PersonalizeCharacter_PersonalizeList" )
require( "ui.uieditor.widgets.Heroes.heroSelectOptionList" )
require( "ui.uieditor.widgets.CharacterCustomization.PersonalizeHero_InfoBlock" )
require( "ui.uieditor.widgets.CharacterCustomization.PersonalizeCharacter_CPProgressionMessage" )
require( "ui.uieditor.widgets.CAC.Customization.ChallengeProgressionInfo" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabBar" )
require( "ui.uieditor.widgets.TabbedWidgets.WeaponGroupsTabWidget" )
require( "ui.uieditor.widgets.PC.Utility.XCamMouseControl" )
require( "ui.uieditor.widgets.CAC.cac_LockBig" )

local f0_local0 = {}
local PreLoadFunc = function ( self, controller )
	self.disableBlur = true
	self.disableDarkenElement = true
	if CoD.isSafehouse then
		CoD.CCUtility.customizationMode = Enum.eModes.MODE_CAMPAIGN
		Engine.SetActiveMenu( controller, CoD.UIMENU_NONE )
	end
	if CoD.CCUtility.customizationMode == Enum.eModes.MODE_CAMPAIGN then
		CoD.CCUtility.SetEdittingHero( controller, Engine.GetEquippedHero( controller, CoD.CCUtility.customizationMode ) )
	end
	CoD.CCUtility.Heroes.heroCustomizationTable = Engine.GetHeroCustomizationTable( CoD.CCUtility.customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits )
	self.reloadSelectionList = function ()
		CoD.CCUtility.Heroes.selectionTable = Engine.GetEquippedInfoForHero( controller, CoD.CCUtility.customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits )
	end
	
	self.reloadSelectionList()
	self.currentMode = CoD.CCUtility.PersonalizeHeroData.Modes.ExploringOptions
end

local f0_local2 = function ( f3_arg0, f3_arg1, f3_arg2 )
	local f3_local0 = f3_arg0.optionsList.optionsList
	if f3_arg1.isBlackMarket then
		f3_local0.filter = CoD.CCUtility.PersonalizeHeroData.BlackMarketFilter
	else
		f3_local0.filter = CoD.CCUtility.PersonalizeHeroData.StandardFilter
	end
	f3_local0:updateDataSource()
end

local PostLoadFunc = function ( f4_arg0, f4_arg1 )
	f4_arg0.tabChanged = f0_local2
	f4_arg0.personalizeList:clearNavigationTable()
	f4_arg0.optionsList:clearNavigationTable()
	local f4_local0 = nil
	f4_arg0.updateMode = function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
		CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex = nil
		local f5_local0 = nil
		if f5_arg0 == CoD.CCUtility.PersonalizeHeroData.Modes.ExploringOptions then
			if CoD.CCUtility.PersonalizeHeroData.EdittingArea ~= CoD.CCUtility.TauntCategoryIndex then
				SendClientScriptNotify( f4_arg1, "camera_change" .. CoD.GetLocalClientAdjustedNum( f4_arg1 ), "exploring" )
			end
			CoD.CCUtility.PersonalizeHeroData.EdittingArea = nil
			f5_local0 = "MENU_SPECIALIST_PERSONALIZATION_CAPS"
			f4_arg0.reloadSelectionList()
			if f5_arg1 then
				f4_arg0.personalizeList.customizationList:updateDataSource()
				f4_arg0.personalizeList.customizationList:findItem( nil, {
					categorySize = CoD.CCUtility.Heroes.LargeCategory,
					customizationArea = f5_arg1
				}, true )
			end
			f4_arg0.categoryTabs.Tabs.m_disableNavigation = true
			f4_arg0.categoryTabs:setAlpha( 0 )
			CoD.SwapFocusableElements( f4_arg1, f4_local0, f4_arg0.personalizeList )
			f4_local0 = f4_arg0.personalizeList
			f4_arg0:setState( "DefaultState" )
		elseif f5_arg0 == CoD.CCUtility.PersonalizeHeroData.Modes.EdittingOption then
			local f5_local1 = "EdittingItem"
			if f5_arg2.customizationArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
				SendClientScriptNotify( f4_arg1, "camera_change" .. CoD.GetLocalClientAdjustedNum( f4_arg1 ), "inspecting_helmet" )
				f5_local0 = "MENU_SPECIALIST_HEADS_CAPS"
			elseif f5_arg2.customizationArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
				SendClientScriptNotify( f4_arg1, "camera_change" .. CoD.GetLocalClientAdjustedNum( f4_arg1 ), "inspecting_body" )
				f5_local0 = "MENU_SPECIALIST_BODIES_CAPS"
			elseif f5_arg2.customizationArea ~= CoD.CCUtility.TauntCategoryIndex then
				SendClientScriptNotify( f4_arg1, "camera_change" .. CoD.GetLocalClientAdjustedNum( f4_arg1 ), "exploring" )
			end
			CoD.CCUtility.PersonalizeHeroData.EdittingArea = f5_arg2.customizationArea
			CoD.CCUtility.PersonalizeHeroData.EdittingElement = f5_arg2
			if f5_arg2.customizationArea == CoD.CCUtility.ShowcaseWeaponCategoryIndex then
				OpenChooseShowcaseWeapon( f4_arg0, f5_arg2, f4_arg1 )
			elseif f5_arg2.customizationArea == CoD.CCUtility.TauntCategoryIndex then
				NavigateToMenu( f4_arg0, "ChooseTaunts", true, f4_arg1 )
			else
				if f5_arg3 then
					CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex = 1
				else
					CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex = nil
					if Enum.eModes.MODE_MULTIPLAYER == Engine.CurrentSessionMode() then
						f5_local1 = "EdittingItemTabs"
						f4_arg0.categoryTabs.Tabs.grid:setActiveItem( f4_arg0.categoryTabs.Tabs.grid:getItemAtPosition( 1, 2, false ) )
						f4_arg0.categoryTabs.Tabs.m_disableNavigation = false
						f4_arg0.categoryTabs:setAlpha( 1 )
						local f5_local2 = Engine.CharacterCustomizationNewItemCount( f4_arg1, CoD.CCUtility.Heroes.HeroIndexForEdits, CoD.CCUtility.PersonalizeHeroData.EdittingArea )
						for f5_local8, f5_local9 in ipairs( CoD.CCUtility.PersonalizeHeroData.HeroCustomizationTabCategories ) do
							local f5_local10 = f4_arg0.categoryTabs.Tabs.grid:findItem( nil, {
								filterName = f5_local9
							}, false, false )
							if f5_local10 then
								local f5_local6 = f5_local10:getModel( f4_arg1, "breadcrumbCount" )
								if f5_local6 then
									local f5_local7 = 0
									if f5_local9 == "loot" then
										f5_local7 = f5_local2.loot
									else
										f5_local7 = f5_local2.standard
									end
									Engine.SetModelValue( f5_local6, f5_local7 )
								end
							end
						end
					end
				end
				f4_arg0.optionsList.optionsList.filter = CoD.CCUtility.PersonalizeHeroData.StandardFilter
				f4_arg0.optionsList.optionsList:updateDataSource()
				CoD.SwapFocusableElements( f4_arg1, f4_local0, f4_arg0.optionsList )
				f4_local0 = f4_arg0.optionsList
				f4_arg0:setState( f5_local1 )
			end
		end
		f4_arg0.currentMode = f5_arg0
		if f5_local0 then
			f4_arg0.Frame.titleLabel:setText( Engine.Localize( ConvertToUpperString( LocalizeWithEdittingHeroName( f4_arg1, f5_local0 ) ) ) )
			f4_arg0.Frame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( ConvertToUpperString( LocalizeWithEdittingHeroName( f4_arg1, f5_local0 ) ) ) )
		end
	end
	
	f4_arg0.updateMode( CoD.CCUtility.PersonalizeHeroData.Modes.ExploringOptions )
end

LUI.createMenu.PersonalizeCharacter = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "PersonalizeCharacter" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "PersonalizeCharacter.buttonPrompts" )
	local f6_local1 = self
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( f6_local1, controller )
	LeftPanel:setLeftRight( false, false, -576, -215 )
	LeftPanel:setTopBottom( true, true, 84, -53 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local TabBacking = LUI.UIImage.new()
	TabBacking:setLeftRight( true, true, 0, 0 )
	TabBacking:setTopBottom( true, false, 124, 83 )
	TabBacking:setRGB( 0, 0, 0 )
	TabBacking:setAlpha( 0 )
	self:addElement( TabBacking )
	self.TabBacking = TabBacking
	
	local Frame = CoD.GenericMenuFrame.new( f6_local1, controller )
	Frame:setLeftRight( true, true, 0, 0 )
	Frame:setTopBottom( true, true, 0, 0 )
	Frame.titleLabel:setText( ConvertToUpperString( LocalizeWithEdittingHeroName( controller, "HEROES_OUTFITS_CAPS" ) ) )
	Frame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( ConvertToUpperString( LocalizeWithEdittingHeroName( controller, "HEROES_OUTFITS_CAPS" ) ) )
	Frame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_character" ) )
	self:addElement( Frame )
	self.Frame = Frame
	
	local personalizeList = CoD.PersonalizeCharacter_PersonalizeList.new( f6_local1, controller )
	personalizeList:setLeftRight( false, false, -563, -233 )
	personalizeList:setTopBottom( true, true, 136, -13 )
	self:addElement( personalizeList )
	self.personalizeList = personalizeList
	
	local optionsList = CoD.heroSelectOptionList.new( f6_local1, controller )
	optionsList:setLeftRight( false, false, -573, -225 )
	optionsList:setTopBottom( true, true, 136, -20 )
	self:addElement( optionsList )
	self.optionsList = optionsList
	
	local categoryInfoBlock = CoD.PersonalizeHero_InfoBlock.new( f6_local1, controller )
	categoryInfoBlock:setLeftRight( false, false, -205, 72 )
	categoryInfoBlock:setTopBottom( true, false, 136, 605 )
	categoryInfoBlock:mergeStateConditions( {
		{
			stateName = "ShowCurrentlyEquippedInfo",
			condition = function ( menu, element, event )
				return IsMenuInState( menu, "DefaultState" )
			end
		}
	} )
	self:addElement( categoryInfoBlock )
	self.categoryInfoBlock = categoryInfoBlock
	
	local optionInfoBlock = CoD.PersonalizeHero_InfoBlock.new( f6_local1, controller )
	optionInfoBlock:setLeftRight( false, false, -205, 95 )
	optionInfoBlock:setTopBottom( true, false, 136, 605 )
	optionInfoBlock.CategoryDesc.weaponDescTextBox:setText( Engine.Localize( "HEROES_SHOWCASE_WEAPON_DESC" ) )
	optionInfoBlock.CurrentlyEquippedInfo.weaponNameWithVariant.variantName.itemName:setText( Engine.Localize( "" ) )
	self:addElement( optionInfoBlock )
	self.optionInfoBlock = optionInfoBlock
	
	local PersonalizeCharacterCPProgressionMessage0 = CoD.PersonalizeCharacter_CPProgressionMessage.new( f6_local1, controller )
	PersonalizeCharacterCPProgressionMessage0:setLeftRight( false, false, 328, 576 )
	PersonalizeCharacterCPProgressionMessage0:setTopBottom( true, false, 556.75, 581.75 )
	self:addElement( PersonalizeCharacterCPProgressionMessage0 )
	self.PersonalizeCharacterCPProgressionMessage0 = PersonalizeCharacterCPProgressionMessage0
	
	local progressionInfo = CoD.ChallengeProgressionInfo.new( f6_local1, controller )
	progressionInfo:setLeftRight( false, false, 156, 576 )
	progressionInfo:setTopBottom( true, false, 573, 657 )
	progressionInfo:setAlpha( 0 )
	progressionInfo.requirementTitle:setText( Engine.Localize( "MPUI_UNLOCK_REQUIREMENTS" ) )
	progressionInfo.completedTitle:setText( Engine.Localize( "MPUI_REQUIREMENTS_MET" ) )
	progressionInfo:mergeStateConditions( {
		{
			stateName = "NotVisible",
			condition = function ( menu, element, event )
				return ShouldHideItemHeroOption( element, controller )
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
		f6_local1:updateElementState( progressionInfo, {
			name = "model_validation",
			menu = f6_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "optionIndex"
		} )
	end )
	progressionInfo:linkToElementModel( progressionInfo, "unlockProgressAndTarget", true, function ( model )
		f6_local1:updateElementState( progressionInfo, {
			name = "model_validation",
			menu = f6_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "unlockProgressAndTarget"
		} )
	end )
	self:addElement( progressionInfo )
	self.progressionInfo = progressionInfo
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f6_local1, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, true, 84, -19 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local categoryTabs = CoD.FE_TabBar.new( f6_local1, controller )
	categoryTabs:setLeftRight( true, true, 0, 1280 )
	categoryTabs:setTopBottom( true, false, 85, 120 )
	categoryTabs.Tabs.grid:setWidgetType( CoD.WeaponGroupsTabWidget )
	categoryTabs.Tabs.grid:setHorizontalCount( 8 )
	categoryTabs.Tabs.grid:setDataSource( "HeroCustomizationTabs" )
	categoryTabs:registerEventHandler( "list_active_changed", function ( element, event )
		local f14_local0 = nil
		CallCustomElementFunction_Self( self, "tabChanged", element, controller )
		return f14_local0
	end )
	self:addElement( categoryTabs )
	self.categoryTabs = categoryTabs
	
	local XCamMouseControl = CoD.XCamMouseControl.new( f6_local1, controller )
	XCamMouseControl:setLeftRight( false, false, -66.5, 475 )
	XCamMouseControl:setTopBottom( true, true, 168, -63 )
	self:addElement( XCamMouseControl )
	self.XCamMouseControl = XCamMouseControl
	
	local LockIcon = CoD.cac_LockBig.new( f6_local1, controller )
	LockIcon:setLeftRight( false, false, 159, 255 )
	LockIcon:setTopBottom( true, false, 14, 684 )
	LockIcon:setAlpha( 0 )
	LockIcon:mergeStateConditions( {
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsCurrentLockedHeroOption( element, controller ) and not IsSelfModelValueTrue( element, controller, "isBMClassified" )
			end
		},
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	LockIcon:linkToElementModel( LockIcon, "optionIndex", true, function ( model )
		f6_local1:updateElementState( LockIcon, {
			name = "model_validation",
			menu = f6_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "optionIndex"
		} )
	end )
	LockIcon:linkToElementModel( LockIcon, "isBMClassified", true, function ( model )
		f6_local1:updateElementState( LockIcon, {
			name = "model_validation",
			menu = f6_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		} )
	end )
	self:addElement( LockIcon )
	self.LockIcon = LockIcon
	
	categoryInfoBlock:linkToElementModel( personalizeList.customizationList, "categoryDesc", true, function ( model )
		local categoryDesc = Engine.GetModelValue( model )
		if categoryDesc then
			categoryInfoBlock.CategoryDesc.weaponDescTextBox:setText( Engine.Localize( categoryDesc ) )
		end
	end )
	categoryInfoBlock:linkToElementModel( personalizeList.customizationList, "fullCategoryName", true, function ( model )
		local fullCategoryName = Engine.GetModelValue( model )
		if fullCategoryName then
			categoryInfoBlock.PersonalizeSpecTitle.weaponNameLabel:setText( Engine.Localize( fullCategoryName ) )
		end
	end )
	categoryInfoBlock:linkToElementModel( personalizeList.customizationList, "currentSelectionNameAlpha", true, function ( model )
		local currentSelectionNameAlpha = Engine.GetModelValue( model )
		if currentSelectionNameAlpha then
			categoryInfoBlock.CurrentlyEquippedInfo:setAlpha( currentSelectionNameAlpha )
		end
	end )
	categoryInfoBlock:linkToElementModel( personalizeList.customizationList, "currentSelectionName", true, function ( model )
		local currentSelectionName = Engine.GetModelValue( model )
		if currentSelectionName then
			categoryInfoBlock.CurrentlyEquippedInfo.weaponNameWithVariant.itemName.itemName:setText( Engine.Localize( currentSelectionName ) )
		end
	end )
	categoryInfoBlock:linkToElementModel( personalizeList.customizationList, "currentSelectionVariantNameAlpha", true, function ( model )
		local currentSelectionVariantNameAlpha = Engine.GetModelValue( model )
		if currentSelectionVariantNameAlpha then
			categoryInfoBlock.CurrentlyEquippedInfo.weaponNameWithVariant.variantName:setAlpha( currentSelectionVariantNameAlpha )
		end
	end )
	categoryInfoBlock:linkToElementModel( personalizeList.customizationList, "currentSelectionVariantName", true, function ( model )
		local currentSelectionVariantName = Engine.GetModelValue( model )
		if currentSelectionVariantName then
			categoryInfoBlock.CurrentlyEquippedInfo.weaponNameWithVariant.variantName.itemName:setText( currentSelectionVariantName )
		end
	end )
	optionInfoBlock:linkToElementModel( personalizeList.customizationList, "fullCategoryName", true, function ( model )
		local fullCategoryName = Engine.GetModelValue( model )
		if fullCategoryName then
			optionInfoBlock.PersonalizeSpecTitle.weaponNameLabel:setText( Engine.Localize( fullCategoryName ) )
		end
	end )
	optionInfoBlock:linkToElementModel( optionsList.optionsList, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			optionInfoBlock.CurrentlyEquippedInfo.weaponNameWithVariant.itemName.itemName:setText( Engine.Localize( name ) )
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
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				personalizeList:completeAnimation()
				self.personalizeList:setAlpha( 1 )
				self.clipFinished( personalizeList, {} )
				optionsList:completeAnimation()
				self.optionsList:setAlpha( 0 )
				self.clipFinished( optionsList, {} )
				categoryInfoBlock:completeAnimation()
				self.categoryInfoBlock:setAlpha( 1 )
				self.clipFinished( categoryInfoBlock, {} )
				optionInfoBlock:completeAnimation()
				self.optionInfoBlock:setAlpha( 0 )
				self.clipFinished( optionInfoBlock, {} )
				progressionInfo:completeAnimation()
				self.progressionInfo:setLeftRight( true, false, 439, 859 )
				self.progressionInfo:setTopBottom( false, true, -162, -78 )
				self.progressionInfo:setAlpha( 0 )
				self.clipFinished( progressionInfo, {} )
				LockIcon:completeAnimation()
				self.LockIcon:setAlpha( 0 )
				self.clipFinished( LockIcon, {} )
			end,
			EdittingItem = function ()
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
					optionsList:setLeftRight( false, false, -574, -226 )
					optionsList:setTopBottom( true, true, 136, 700 )
					optionsList:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( optionsList, event )
					else
						optionsList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				optionsList:completeAnimation()
				self.optionsList:setLeftRight( false, false, -988, -640 )
				self.optionsList:setTopBottom( true, true, 136, 700 )
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
						LockIcon:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
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
					optionsList:setLeftRight( false, false, -573, -225 )
					optionsList:setTopBottom( true, true, 136, -20 )
					optionsList:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( optionsList, event )
					else
						optionsList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				optionsList:completeAnimation()
				self.optionsList:setLeftRight( false, false, -988, -640 )
				self.optionsList:setTopBottom( true, true, 136, -20 )
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
						LockIcon:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
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
				self:setupElementClipCounter( 7 )
				personalizeList:completeAnimation()
				self.personalizeList:setAlpha( 0 )
				self.clipFinished( personalizeList, {} )
				optionsList:completeAnimation()
				self.optionsList:setLeftRight( false, false, -573, -225 )
				self.optionsList:setTopBottom( true, false, 136, 700 )
				self.optionsList:setAlpha( 1 )
				self.clipFinished( optionsList, {} )
				categoryInfoBlock:completeAnimation()
				self.categoryInfoBlock:setAlpha( 0 )
				self.clipFinished( categoryInfoBlock, {} )
				optionInfoBlock:completeAnimation()
				optionInfoBlock.CurrentlyEquippedInfo:completeAnimation()
				self.optionInfoBlock:setLeftRight( false, false, -205, 95 )
				self.optionInfoBlock:setTopBottom( true, false, 136, 605 )
				self.optionInfoBlock:setAlpha( 1 )
				self.optionInfoBlock.CurrentlyEquippedInfo:setAlpha( 1 )
				self.clipFinished( optionInfoBlock, {} )
				PersonalizeCharacterCPProgressionMessage0:completeAnimation()
				self.PersonalizeCharacterCPProgressionMessage0:setLeftRight( false, false, 328, 576 )
				self.PersonalizeCharacterCPProgressionMessage0:setTopBottom( true, false, 556.75, 581.75 )
				self.clipFinished( PersonalizeCharacterCPProgressionMessage0, {} )
				progressionInfo:completeAnimation()
				self.progressionInfo:setLeftRight( true, false, 435, 855 )
				self.progressionInfo:setTopBottom( false, true, -162, -78 )
				self.progressionInfo:setAlpha( 1 )
				self.clipFinished( progressionInfo, {} )
				LockIcon:completeAnimation()
				self.LockIcon:setAlpha( 1 )
				self.clipFinished( LockIcon, {} )
			end,
			DefaultState = function ()
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
					optionsList:setLeftRight( false, false, -987.5, -639.5 )
					optionsList:setTopBottom( true, true, 136, -20 )
					optionsList:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( optionsList, event )
					else
						optionsList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				optionsList:completeAnimation()
				self.optionsList:setLeftRight( false, false, -573, -225 )
				self.optionsList:setTopBottom( true, true, 136, -20 )
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
				self:setupElementClipCounter( 7 )
				TabBacking:completeAnimation()
				self.TabBacking:setAlpha( 1 )
				self.clipFinished( TabBacking, {} )
				personalizeList:completeAnimation()
				self.personalizeList:setAlpha( 0 )
				self.clipFinished( personalizeList, {} )
				optionsList:completeAnimation()
				self.optionsList:setLeftRight( false, false, -573, -225 )
				self.optionsList:setTopBottom( true, false, 136, 700 )
				self.optionsList:setAlpha( 1 )
				self.clipFinished( optionsList, {} )
				categoryInfoBlock:completeAnimation()
				self.categoryInfoBlock:setAlpha( 0 )
				self.clipFinished( categoryInfoBlock, {} )
				optionInfoBlock:completeAnimation()
				self.optionInfoBlock:setLeftRight( false, false, -205, 95 )
				self.optionInfoBlock:setTopBottom( true, false, 136, 605 )
				self.optionInfoBlock:setAlpha( 1 )
				self.clipFinished( optionInfoBlock, {} )
				progressionInfo:completeAnimation()
				self.progressionInfo:setLeftRight( false, false, -205, 215 )
				self.progressionInfo:setTopBottom( true, false, 558, 642 )
				self.progressionInfo:setAlpha( 1 )
				self.clipFinished( progressionInfo, {} )
				LockIcon:completeAnimation()
				self.LockIcon:setAlpha( 1 )
				self.clipFinished( LockIcon, {} )
			end,
			DefaultState = function ()
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
					optionsList:setLeftRight( false, false, -987.5, -225 )
					optionsList:setTopBottom( true, false, 136, 700 )
					optionsList:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( optionsList, event )
					else
						optionsList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				optionsList:completeAnimation()
				self.optionsList:setLeftRight( false, false, -573, -225 )
				self.optionsList:setTopBottom( true, false, 136, 700 )
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
	CoD.Menu.AddNavigationHandler( f6_local1, self, controller )
	self:registerEventHandler( "menu_opened", function ( element, event )
		local f61_local0 = nil
		if TestAndSetFirstTimeMenu( controller, "com_firsttime_wardrobe" ) and IsCampaign() then
			OpenGenericLargePopup( f6_local1, controller, "MENU_FIRSTTIME_WARDROBE", "MENU_FIRSTTIME_WARDROBE2", "com_firsttime_wardrobe_image", "MENU_FIRSTTIME_WARDROBE_BUTTONTEXT", "", "" )
		end
		if not f61_local0 then
			f61_local0 = element:dispatchEventToChildren( event )
		end
		return f61_local0
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f62_local0 = nil
		if IsInGame() then
			RefreshCharacterCustomization( self, element, controller )
			SendClientScriptMenuChangeNotify( controller, f6_local1, true )
			LockInput( self, controller, true )
			PrepareOpenMenuInSafehouse( controller )
			ShowHeaderIconOnly( f6_local1 )
			SetElementStateByElementName( self, "Frame", controller, "Update" )
			PlayClipOnElement( self, {
				elementName = "Frame",
				clipName = "Intro"
			}, controller )
		elseif InCharacterCustomizationMode( Enum.eModes.MODE_CAMPAIGN ) then
			RefreshCharacterCustomization( self, element, controller )
			SendClientScriptMenuChangeNotify( controller, f6_local1, true )
			ShowHeaderIconOnly( f6_local1 )
		else
			SendClientScriptMenuChangeNotify( controller, f6_local1, true )
			ShowHeaderKickerAndIcon( f6_local1 )
		end
		if not f62_local0 then
			f62_local0 = element:dispatchEventToChildren( event )
		end
		return f62_local0
	end )
	self:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f63_local0 = nil
		if IsElementPropertyValue( element, "headItem", true ) then
			SetElementStateByElementName( self, "PersonalizeCharacterCPProgressionMessage0", controller, "NeedMessage" )
		else
			SetElementStateByElementName( self, "PersonalizeCharacterCPProgressionMessage0", controller, "DefaultState" )
		end
		return f63_local0
	end )
	f6_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f64_arg0, f64_arg1, f64_arg2, f64_arg3 )
		if not IsEdittingHeroOption( f64_arg1 ) and IsInGame() then
			SaveLoadout( self, f64_arg2 )
			ClearSavedState( self, f64_arg2 )
			SendClientScriptMenuChangeNotify( f64_arg2, f64_arg1, false )
			PrepareCloseMenuInSafehouse( f64_arg2 )
			LockInput( self, f64_arg2, false )
			SendOwnMenuResponse( f64_arg1, f64_arg2, "closed" )
			Close( self, f64_arg2 )
			return true
		elseif not IsEdittingHeroOption( f64_arg1 ) then
			SaveLoadout( self, f64_arg2 )
			ClearSavedState( self, f64_arg2 )
			SendClientScriptMenuChangeNotify( f64_arg2, f64_arg1, false )
			GoBack( self, f64_arg2 )
			return true
		elseif IsEdittingHeroOption( f64_arg1 ) then
			DisableMouseOnMenuElement( f64_arg1, "optionsList", f64_arg2 )
			CancelHeroOptionSelection( f64_arg1, f64_arg2 )
			PlaySoundSetSound( self, "menu_go_back" )
			return true
		else
			
		end
	end, function ( f65_arg0, f65_arg1, f65_arg2 )
		if not IsEdittingHeroOption( f65_arg1 ) and IsInGame() then
			CoD.Menu.SetButtonLabel( f65_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
			return true
		elseif not IsEdittingHeroOption( f65_arg1 ) then
			CoD.Menu.SetButtonLabel( f65_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
			return true
		elseif IsEdittingHeroOption( f65_arg1 ) then
			CoD.Menu.SetButtonLabel( f65_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
			return true
		else
			return false
		end
	end, false )
	f6_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, function ( f66_arg0, f66_arg1, f66_arg2, f66_arg3 )
		return true
	end, function ( f67_arg0, f67_arg1, f67_arg2 )
		CoD.Menu.SetButtonLabel( f67_arg1, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "PLATFORM_EMBLEM_ROTATE_LAYER" )
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
		menu = f6_local1
	} )
	if not self:restoreState() then
		self.personalizeList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LeftPanel:close()
		element.Frame:close()
		element.personalizeList:close()
		element.optionsList:close()
		element.categoryInfoBlock:close()
		element.optionInfoBlock:close()
		element.PersonalizeCharacterCPProgressionMessage0:close()
		element.progressionInfo:close()
		element.FEMenuLeftGraphics:close()
		element.categoryTabs:close()
		element.XCamMouseControl:close()
		element.LockIcon:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "PersonalizeCharacter.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

