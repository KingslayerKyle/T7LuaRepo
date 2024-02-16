require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.CharacterCustomization.PersonalizeCharacter_PersonalizeList" )
require( "ui.uieditor.widgets.Heroes.heroSelectOptionList" )
require( "ui.uieditor.widgets.CharacterCustomization.PersonalizeCharacter_ColorsList" )
require( "ui.uieditor.widgets.CharacterCustomization.PersonalizeHero_InfoBlock" )
require( "ui.uieditor.widgets.CharacterCustomization.PersonalizeCharacter_CPProgressionMessage" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )

local spacerRows = {}
local PreLoadFunc = function ( self, controller )
	self.disableBlur = true
	self.disableDarkenElement = true
	if CoD.isSafehouse then
		CoD.perController[controller].customizationMode = Enum.eModes.MODE_CAMPAIGN
	end
	if CoD.perController[controller].customizationMode == Enum.eModes.MODE_CAMPAIGN then
		CoD.CCUtility.Heroes.HeroIndexForEdits = Engine.GetEquippedHero( controller, CoD.perController[controller].customizationMode )
	end
	CoD.CCUtility.Heroes.heroCustomizationTable = Engine.GetHeroCustomizationTable( CoD.perController[controller].customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits )
	self.reloadSelectionList = function ()
		CoD.CCUtility.Heroes.selectionTable = Engine.GetEquippedInfoForHero( controller, CoD.perController[controller].customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits )
	end
	
	self.reloadSelectionList()
	self.currentMode = CoD.CCUtility.PersonalizeHeroData.Modes.ExploringOptions
end

local PostLoadFunc = function ( self, controller )
	self.personalizeList:clearNavigationTable()
	self.optionsList:clearNavigationTable()
	self.colorsList:clearNavigationTable()
	local updateOptionListFocus = function ( optionList )
		if CoD.CCUtility.Heroes.selectionTable and CoD.CCUtility.PersonalizeHeroData.EdittingArea then
			local selectedItem = nil
			if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
				selectedItem = CoD.CCUtility.Heroes.selectionTable.selectedBody + 1
			elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
				selectedItem = CoD.CCUtility.Heroes.selectionTable.selectedHelmet + 1
			end
			local matchingWidget = optionList:findItem( nil, {
				optionIndex = selectedItem
			} )
			if matchingWidget then
				optionList.savedActiveIndex = matchingWidget.gridInfoTable.zeroBasedIndex
			end
		end
	end
	
	local lastFocus = nil
	self.updateMode = function ( newMode, updateListAndSelectSlot, element )
		CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex = nil
		if newMode == CoD.CCUtility.PersonalizeHeroData.Modes.ExploringOptions then
			SendClientScriptNotify( controller, "camera_change", "exploring" )
			self.reloadSelectionList()
			if updateListAndSelectSlot then
				self.personalizeList.customizationList:updateDataSource()
				self.personalizeList.customizationList:findItem( nil, {
					categorySize = CoD.CCUtility.Heroes.LargeCategory,
					customizationArea = updateListAndSelectSlot
				}, true )
			end
			CoD.SwapFocusableElements( controller, lastFocus, self.personalizeList )
			lastFocus = self.personalizeList
			self:setState( "DefaultState" )
		elseif newMode == CoD.CCUtility.PersonalizeHeroData.Modes.EdittingOption then
			if element.customizationArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
				SendClientScriptNotify( controller, "camera_change", "inspecting_helmet" )
			elseif element.customizationArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
				SendClientScriptNotify( controller, "camera_change", "inspecting_body" )
			else
				SendClientScriptNotify( controller, "camera_change", "exploring" )
			end
			CoD.CCUtility.PersonalizeHeroData.EdittingArea = element.customizationArea
			CoD.CCUtility.PersonalizeHeroData.EdittingElement = element
			self.optionsList.optionsList:updateDataSource()
			updateOptionListFocus( self.optionsList.optionsList )
			CoD.SwapFocusableElements( controller, lastFocus, self.optionsList )
			lastFocus = self.optionsList
			self:setState( "EdittingItem" )
		elseif newMode == CoD.CCUtility.PersonalizeHeroData.Modes.EdittingColor then
			CoD.CCUtility.PersonalizeHeroData.CurrentColors = {}
			if element.customizationArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
				SendClientScriptNotify( controller, "camera_change", "inspecting_helmet" )
			elseif element.customizationArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
				SendClientScriptNotify( controller, "camera_change", "inspecting_body" )
			else
				SendClientScriptNotify( controller, "camera_change", "exploring" )
			end
			CoD.CCUtility.PersonalizeHeroData.EdittingArea = element.customizationArea
			CoD.CCUtility.PersonalizeHeroData.EdittingElement = element
			self.colorsList.colorsList:updateDataSource()
			CoD.SwapFocusableElements( controller, lastFocus, self.colorsList )
			lastFocus = self.colorsList
			self:setState( "EdittingColor" )
		end
		self.currentMode = newMode
	end
	
	self.updateMode( CoD.CCUtility.PersonalizeHeroData.Modes.ExploringOptions )
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
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "PersonalizeCharacter.buttonPrompts" )
	local menu = self
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( menu, controller )
	LeftPanel:setLeftRight( true, false, 64, 425 )
	LeftPanel:setTopBottom( true, false, 78, 667 )
	LeftPanel:setRGB( 0.14, 0.14, 0.14 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local Frame = CoD.GenericMenuFrame.new( menu, controller )
	Frame:setLeftRight( true, true, 0, 0 )
	Frame:setTopBottom( true, true, 0, 0 )
	Frame.titleLabel:setText( Engine.Localize( LocalizeWithEdittingHeroName( controller, "HEROES_OUTFITS_CAPS" ) ) )
	Frame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "HEROES_OUTFITS_CAPS" ) )
	Frame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_character" ) )
	self:addElement( Frame )
	self.Frame = Frame
	
	local personalizeList = CoD.PersonalizeCharacter_PersonalizeList.new( menu, controller )
	personalizeList:setLeftRight( true, false, 77, 407 )
	personalizeList:setTopBottom( true, false, 136, 707 )
	self:addElement( personalizeList )
	self.personalizeList = personalizeList
	
	local optionsList = CoD.heroSelectOptionList.new( menu, controller )
	optionsList:setLeftRight( true, false, 67, 415 )
	optionsList:setTopBottom( true, false, 93, 657 )
	self:addElement( optionsList )
	self.optionsList = optionsList
	
	local colorsList = CoD.PersonalizeCharacter_ColorsList.new( menu, controller )
	colorsList:setLeftRight( true, false, -367, -19 )
	colorsList:setTopBottom( true, false, 90, 655 )
	colorsList:setAlpha( 0 )
	self:addElement( colorsList )
	self.colorsList = colorsList
	
	local categoryInfoBlock = CoD.PersonalizeHero_InfoBlock.new( menu, controller )
	categoryInfoBlock:setLeftRight( true, false, 435, 735 )
	categoryInfoBlock:setTopBottom( true, false, 136, 605 )
	self:addElement( categoryInfoBlock )
	self.categoryInfoBlock = categoryInfoBlock
	
	local colorInfoBlock = CoD.PersonalizeHero_InfoBlock.new( menu, controller )
	colorInfoBlock:setLeftRight( true, false, 435, 735 )
	colorInfoBlock:setTopBottom( true, false, 136, 605 )
	colorInfoBlock:setAlpha( 0 )
	self:addElement( colorInfoBlock )
	self.colorInfoBlock = colorInfoBlock
	
	local optionInfoBlock = CoD.PersonalizeHero_InfoBlock.new( menu, controller )
	optionInfoBlock:setLeftRight( true, false, 435, 735 )
	optionInfoBlock:setTopBottom( true, false, 136, 605 )
	optionInfoBlock:setAlpha( 0 )
	optionInfoBlock.currentlyEquipped:setText( Engine.Localize( "" ) )
	self:addElement( optionInfoBlock )
	self.optionInfoBlock = optionInfoBlock
	
	local PersonalizeCharacterCPProgressionMessage0 = CoD.PersonalizeCharacter_CPProgressionMessage.new( menu, controller )
	PersonalizeCharacterCPProgressionMessage0:setLeftRight( true, false, 435, 683 )
	PersonalizeCharacterCPProgressionMessage0:setTopBottom( true, false, 556.75, 581.75 )
	self:addElement( PersonalizeCharacterCPProgressionMessage0 )
	self.PersonalizeCharacterCPProgressionMessage0 = PersonalizeCharacterCPProgressionMessage0
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( menu, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 84, 701 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	optionsList:linkToElementModel( personalizeList.customizationList, "fullCategoryName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			optionsList.categoryName:setText( Engine.Localize( modelValue ) )
		end
	end )
	colorsList:linkToElementModel( personalizeList.customizationList, "fullCategoryName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			colorsList.categoryName:setText( Engine.Localize( modelValue ) )
		end
	end )
	categoryInfoBlock:linkToElementModel( personalizeList.customizationList, "currentSelectionName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			categoryInfoBlock.currentlyEquipped:setText( Engine.Localize( modelValue ) )
		end
	end )
	categoryInfoBlock:linkToElementModel( personalizeList.customizationList, "fullCategoryName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			categoryInfoBlock.WeaponNameWidget0.weaponNameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	colorInfoBlock:linkToElementModel( personalizeList.customizationList, "currentSelectionName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			colorInfoBlock.currentlyEquipped:setText( Engine.Localize( modelValue ) )
		end
	end )
	colorInfoBlock:linkToElementModel( colorsList.colorsList, "colorIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			colorInfoBlock.WeaponNameWidget0.weaponNameLabel:setText( Engine.Localize( LocalizeIntoString( "HEROES_COLOR", modelValue ) ) )
		end
	end )
	optionInfoBlock:linkToElementModel( optionsList.optionsList, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			optionInfoBlock.WeaponNameWidget0.weaponNameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	personalizeList.navigation = {
		left = optionsList,
		up = optionsList
	}
	optionsList.navigation = {
		left = colorsList,
		right = personalizeList,
		down = personalizeList
	}
	colorsList.navigation = {
		right = optionsList
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
				colorsList:completeAnimation()
				self.colorsList:setAlpha( 0 )
				self.clipFinished( colorsList, {} )
				categoryInfoBlock:completeAnimation()
				self.categoryInfoBlock:setAlpha( 1 )
				self.clipFinished( categoryInfoBlock, {} )
				colorInfoBlock:completeAnimation()
				self.colorInfoBlock:setAlpha( 0 )
				self.clipFinished( colorInfoBlock, {} )
				optionInfoBlock:completeAnimation()
				self.optionInfoBlock:setAlpha( 0 )
				self.clipFinished( optionInfoBlock, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 0 )
			end,
			EdittingItem = function ()
				self:setupElementClipCounter( 4 )
				local personalizeListFrame2 = function ( personalizeList, event )
					if not event.interrupted then
						personalizeList:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
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
						optionsList:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
					end
					optionsList:setLeftRight( true, false, 67, 415 )
					optionsList:setTopBottom( true, false, 93, 657 )
					optionsList:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( optionsList, event )
					else
						optionsList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				optionsList:completeAnimation()
				self.optionsList:setLeftRight( true, false, -348, 0 )
				self.optionsList:setTopBottom( true, false, 93, 657 )
				self.optionsList:setAlpha( 0 )
				optionsListFrame2( optionsList, {} )
				local categoryInfoBlockFrame2 = function ( categoryInfoBlock, event )
					if not event.interrupted then
						categoryInfoBlock:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
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
						optionInfoBlock:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
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
			end,
			EdittingColor = function ()
				self:setupElementClipCounter( 5 )
				local personalizeListFrame2 = function ( personalizeList, event )
					if not event.interrupted then
						personalizeList:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
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
				local colorsListFrame2 = function ( colorsList, event )
					if not event.interrupted then
						colorsList:beginAnimation( "keyframe", 189, false, true, CoD.TweenType.Linear )
					end
					colorsList:setLeftRight( true, false, 74, 422 )
					colorsList:setTopBottom( true, false, 90, 655 )
					colorsList:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( colorsList, event )
					else
						colorsList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				colorsList:completeAnimation()
				self.colorsList:setLeftRight( true, false, -372, -24 )
				self.colorsList:setTopBottom( true, false, 90, 655 )
				self.colorsList:setAlpha( 0 )
				colorsListFrame2( colorsList, {} )
				categoryInfoBlock:completeAnimation()
				self.categoryInfoBlock:setLeftRight( true, false, 435, 735 )
				self.categoryInfoBlock:setTopBottom( true, false, 136, 605 )
				self.clipFinished( categoryInfoBlock, {} )
				local colorInfoBlockFrame2 = function ( colorInfoBlock, event )
					if not event.interrupted then
						colorInfoBlock:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					colorInfoBlock:setLeftRight( true, false, 435, 735 )
					colorInfoBlock:setTopBottom( true, false, 136, 605 )
					colorInfoBlock:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( colorInfoBlock, event )
					else
						colorInfoBlock:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				colorInfoBlock:completeAnimation()
				self.colorInfoBlock:setLeftRight( true, false, 435, 735 )
				self.colorInfoBlock:setTopBottom( true, false, 136, 605 )
				self.colorInfoBlock:setAlpha( 0 )
				colorInfoBlockFrame2( colorInfoBlock, {} )
				local optionInfoBlockFrame2 = function ( optionInfoBlock, event )
					if not event.interrupted then
						optionInfoBlock:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
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
			end
		},
		EdittingItem = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				personalizeList:completeAnimation()
				self.personalizeList:setAlpha( 0 )
				self.clipFinished( personalizeList, {} )
				optionsList:completeAnimation()
				self.optionsList:setAlpha( 1 )
				self.clipFinished( optionsList, {} )
				colorsList:completeAnimation()
				self.colorsList:setAlpha( 0 )
				self.clipFinished( colorsList, {} )
				categoryInfoBlock:completeAnimation()
				self.categoryInfoBlock:setAlpha( 0 )
				self.clipFinished( categoryInfoBlock, {} )
				optionInfoBlock:completeAnimation()
				self.optionInfoBlock:setAlpha( 1 )
				self.clipFinished( optionInfoBlock, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 4 )
				local personalizeListFrame2 = function ( personalizeList, event )
					if not event.interrupted then
						personalizeList:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Linear )
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
						optionsList:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Linear )
					end
					optionsList:setLeftRight( true, false, -347.5, 0.5 )
					optionsList:setTopBottom( true, false, 93, 657 )
					optionsList:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( optionsList, event )
					else
						optionsList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				optionsList:completeAnimation()
				self.optionsList:setLeftRight( true, false, 65, 411 )
				self.optionsList:setTopBottom( true, false, 93, 657 )
				self.optionsList:setAlpha( 1 )
				optionsListFrame2( optionsList, {} )
				local categoryInfoBlockFrame2 = function ( categoryInfoBlock, event )
					if not event.interrupted then
						categoryInfoBlock:beginAnimation( "keyframe", 70, false, true, CoD.TweenType.Linear )
					end
					categoryInfoBlock:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( categoryInfoBlock, event )
					else
						categoryInfoBlock:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				categoryInfoBlock:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
				categoryInfoBlock:setAlpha( 0 )
				categoryInfoBlock:registerEventHandler( "transition_complete_keyframe", categoryInfoBlockFrame2 )
				local optionInfoBlockFrame2 = function ( optionInfoBlock, event )
					if not event.interrupted then
						optionInfoBlock:beginAnimation( "keyframe", 70, false, true, CoD.TweenType.Linear )
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
			end
		},
		EdittingColor = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				personalizeList:completeAnimation()
				self.personalizeList:setAlpha( 0 )
				self.clipFinished( personalizeList, {} )
				optionsList:completeAnimation()
				self.optionsList:setAlpha( 0 )
				self.clipFinished( optionsList, {} )
				colorsList:completeAnimation()
				self.colorsList:setAlpha( 1 )
				self.clipFinished( colorsList, {} )
				categoryInfoBlock:completeAnimation()
				self.categoryInfoBlock:setAlpha( 0 )
				self.clipFinished( categoryInfoBlock, {} )
				colorInfoBlock:completeAnimation()
				self.colorInfoBlock:setAlpha( 1 )
				self.clipFinished( colorInfoBlock, {} )
				optionInfoBlock:completeAnimation()
				self.optionInfoBlock:setAlpha( 0 )
				self.clipFinished( optionInfoBlock, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 4 )
				local personalizeListFrame2 = function ( personalizeList, event )
					if not event.interrupted then
						personalizeList:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Linear )
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
				local colorsListFrame2 = function ( colorsList, event )
					if not event.interrupted then
						colorsList:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					colorsList:setLeftRight( true, false, -368, -20 )
					colorsList:setTopBottom( true, false, 90, 655 )
					colorsList:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( colorsList, event )
					else
						colorsList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				colorsList:completeAnimation()
				self.colorsList:setLeftRight( true, false, 74, 422 )
				self.colorsList:setTopBottom( true, false, 90, 655 )
				self.colorsList:setAlpha( 1 )
				colorsListFrame2( colorsList, {} )
				local categoryInfoBlockFrame2 = function ( categoryInfoBlock, event )
					if not event.interrupted then
						categoryInfoBlock:beginAnimation( "keyframe", 129, false, true, CoD.TweenType.Linear )
					end
					categoryInfoBlock:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( categoryInfoBlock, event )
					else
						categoryInfoBlock:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				categoryInfoBlock:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
				categoryInfoBlock:setAlpha( 0 )
				categoryInfoBlock:registerEventHandler( "transition_complete_keyframe", categoryInfoBlockFrame2 )
				local colorInfoBlockFrame2 = function ( colorInfoBlock, event )
					if not event.interrupted then
						colorInfoBlock:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					colorInfoBlock:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( colorInfoBlock, event )
					else
						colorInfoBlock:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				colorInfoBlock:completeAnimation()
				self.colorInfoBlock:setAlpha( 1 )
				colorInfoBlockFrame2( colorInfoBlock, {} )
			end
		}
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		if IsInGame() then
			RefreshCharacterCustomization( self, element, controller )
			SendClientScriptMenuChangeNotify( controller, menu, true )
			LockInput( self, controller, true )
			ShowHeaderIconOnly( menu )
			SetElementStateByElementName( self, "Frame", controller, "Update" )
			PlayClipOnElement( self, {
				elementName = "Frame",
				clipName = "Intro"
			}, controller )
			PlayClip( self, "Intro", controller )
		elseif IsPerControllerTablePropertyEnumValue( controller, "customizationMode", Enum.eModes.MODE_CAMPAIGN ) then
			RefreshCharacterCustomization( self, element, controller )
			SendClientScriptMenuChangeNotify( controller, menu, true )
			ShowHeaderIconOnly( menu )
		else
			SendClientScriptMenuChangeNotify( controller, menu, true )
			ShowHeaderKickerAndIcon( menu )
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
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		if not IsEdittingHeroOption( menu ) and IsInGame() then
			UploadStats( self, controller )
			ClearSavedState( self, controller )
			SendClientScriptMenuChangeNotify( controller, menu, false )
			LockInput( self, controller, false )
			SendOwnMenuResponse( menu, controller, "closed" )
			Close( self, controller )
			return true
		elseif not IsEdittingHeroOption( menu ) then
			UploadStats( self, controller )
			ClearSavedState( self, controller )
			SendClientScriptMenuChangeNotify( controller, menu, false )
			GoBack( self, controller )
			return true
		elseif IsEdittingHeroOption( menu ) then
			CancelHeroOptionSelection( menu, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		if not IsEdittingHeroOption( menu ) and IsInGame() then
			return true
		elseif not IsEdittingHeroOption( menu ) then
			return true
		elseif IsEdittingHeroOption( menu ) then
			return true
		else
			return false
		end
	end, false )
	Frame:setModel( self.buttonModel, controller )
	personalizeList.id = "personalizeList"
	optionsList.id = "optionsList"
	colorsList.id = "colorsList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = menu
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
		self.colorsList:close()
		self.categoryInfoBlock:close()
		self.colorInfoBlock:close()
		self.optionInfoBlock:close()
		self.PersonalizeCharacterCPProgressionMessage0:close()
		self.FEMenuLeftGraphics:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "PersonalizeCharacter.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

