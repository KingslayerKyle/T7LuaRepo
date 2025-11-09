require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.CharacterCustomization.PersonalizeCharacter_PersonalizeList" )
require( "ui.uieditor.widgets.Heroes.heroSelectOptionList" )
require( "ui.uieditor.widgets.CharacterCustomization.PersonalizeCharacter_ColorsList" )
require( "ui.uieditor.widgets.CharacterCustomization.PersonalizeHero_InfoBlock" )
require( "ui.uieditor.widgets.Heroes.PersonalizeElemsSideList" )

local spacerRows = {}
local PreLoadFunc = function ( self, controller )
	self.disableBlur = true
	self.disableDarkenElement = true
	CoD.CCUtility.Heroes.heroCustomizationTable = Engine.GetHeroCustomizationTable( CoD.CCUtility.Heroes.HeroIndexForEdits )
	self.reloadSelectionList = function ()
		CoD.CCUtility.Heroes.selectionTable = Engine.GetEquippedInfoForHero( controller, CoD.CCUtility.Heroes.HeroIndexForEdits )
	end
	
	self.reloadSelectionList()
	self.currentMode = CoD.CCUtility.PersonalizeHeroData.Modes.ExploringOptions
end

local PostLoadFunc = function ( self, controller )
	self.personalizeList:makeNotFocusable()
	self.optionsList:makeNotFocusable()
	self.colorsList:makeNotFocusable()
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
			SendMenuResponse( self, "personalizeHero", "opened", controller )
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
				SendMenuResponse( self, "personalizeHero", "inspecting_helmet", controller )
			elseif element.customizationArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
				SendMenuResponse( self, "personalizeHero", "inspecting_body", controller )
			else
				SendMenuResponse( self, "personalizeHero", "inspecting", controller )
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
				SendMenuResponse( self, "personalizeHero", "inspecting_helmet", controller )
			elseif element.customizationArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
				SendMenuResponse( self, "personalizeHero", "inspecting_body", controller )
			else
				SendMenuResponse( self, "personalizeHero", "inspecting", controller )
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
	self.anyChildUsesUpdateState = true
	
	local background = CoD.GenericMenuFrame.new( self, controller )
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background:setRGB( 1, 1, 1 )
	background.titleLabel:setText( Engine.Localize( LocalizeWithEdittingHeroName( "HEROES_PERSONALIZE_SPECIALISTS_CAPS" ) ) )
	background.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "HEROES_PERSONALIZE_SPECIALISTS_CAPS" ) )
	self:addElement( background )
	self.background = background
	
	local personalizeList = CoD.PersonalizeCharacter_PersonalizeList.new( self, controller )
	personalizeList:setLeftRight( true, false, 64, 386 )
	personalizeList:setTopBottom( true, false, 93, 657 )
	personalizeList:setRGB( 1, 1, 1 )
	self:addElement( personalizeList )
	self.personalizeList = personalizeList
	
	local optionsList = CoD.heroSelectOptionList.new( self, controller )
	optionsList:setLeftRight( true, false, -347.5, 0.5 )
	optionsList:setTopBottom( true, false, 93, 657 )
	optionsList:setRGB( 1, 1, 1 )
	optionsList:setAlpha( 0 )
	self:addElement( optionsList )
	self.optionsList = optionsList
	
	local colorsList = CoD.PersonalizeCharacter_ColorsList.new( self, controller )
	colorsList:setLeftRight( true, false, -348, 0 )
	colorsList:setTopBottom( true, false, 93, 657 )
	colorsList:setRGB( 1, 1, 1 )
	colorsList:setAlpha( 0 )
	self:addElement( colorsList )
	self.colorsList = colorsList
	
	local categoryInfoBlock = CoD.PersonalizeHero_InfoBlock.new( self, controller )
	categoryInfoBlock:setLeftRight( true, false, 405, 687 )
	categoryInfoBlock:setTopBottom( true, false, 141.5, 604.5 )
	categoryInfoBlock:setRGB( 1, 1, 1 )
	self:addElement( categoryInfoBlock )
	self.categoryInfoBlock = categoryInfoBlock
	
	local colorInfoBlock = CoD.PersonalizeHero_InfoBlock.new( self, controller )
	colorInfoBlock:setLeftRight( true, false, 405, 705 )
	colorInfoBlock:setTopBottom( true, false, 141.5, 612.5 )
	colorInfoBlock:setRGB( 1, 1, 1 )
	colorInfoBlock:setAlpha( 0 )
	self:addElement( colorInfoBlock )
	self.colorInfoBlock = colorInfoBlock
	
	local optionInfoBlock = CoD.PersonalizeHero_InfoBlock.new( self, controller )
	optionInfoBlock:setLeftRight( true, false, 405, 687 )
	optionInfoBlock:setTopBottom( true, false, 141.5, 604.5 )
	optionInfoBlock:setRGB( 1, 1, 1 )
	optionInfoBlock:setAlpha( 0 )
	optionInfoBlock.currentlyEquipped:setText( Engine.Localize( "" ) )
	self:addElement( optionInfoBlock )
	self.optionInfoBlock = optionInfoBlock
	
	local PersonalizeElemsSideList = CoD.PersonalizeElemsSideList.new( self, controller )
	PersonalizeElemsSideList:setLeftRight( true, false, 0, 68 )
	PersonalizeElemsSideList:setTopBottom( true, false, 78, 748 )
	PersonalizeElemsSideList:setRGB( 1, 1, 1 )
	self:addElement( PersonalizeElemsSideList )
	self.PersonalizeElemsSideList = PersonalizeElemsSideList
	
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
			colorInfoBlock.WeaponNameWidget0.weaponNameLabel:setText( Engine.Localize( LocalizeIntoString( modelValue, "HEROES_COLOR" ) ) )
		end
	end )
	optionInfoBlock:linkToElementModel( optionsList.optionsList, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			optionInfoBlock.WeaponNameWidget0.weaponNameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	personalizeList.navigation = {
		left = optionsList
	}
	optionsList.navigation = {
		left = colorsList,
		up = colorsList,
		right = personalizeList
	}
	colorsList.navigation = {
		up = optionsList,
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
				self.optionsList:setLeftRight( true, false, -347.5, 0.5 )
				self.optionsList:setTopBottom( true, false, 93, 657 )
				self.optionsList:setAlpha( 0 )
				self.clipFinished( optionsList, {} )
				colorsList:completeAnimation()
				self.colorsList:setLeftRight( true, false, -348, 0 )
				self.colorsList:setTopBottom( true, false, 93, 657 )
				self.colorsList:setAlpha( 0 )
				self.clipFinished( colorsList, {} )
				categoryInfoBlock:completeAnimation()
				self.categoryInfoBlock:setLeftRight( true, false, 405, 687 )
				self.categoryInfoBlock:setTopBottom( true, false, 141.5, 604.5 )
				self.categoryInfoBlock:setAlpha( 1 )
				self.clipFinished( categoryInfoBlock, {} )
				colorInfoBlock:completeAnimation()
				self.colorInfoBlock:setAlpha( 0 )
				self.clipFinished( colorInfoBlock, {} )
				optionInfoBlock:completeAnimation()
				self.optionInfoBlock:setLeftRight( true, false, 405, 687 )
				self.optionInfoBlock:setTopBottom( true, false, 141.5, 604.5 )
				self.optionInfoBlock:setAlpha( 0 )
				self.clipFinished( optionInfoBlock, {} )
			end,
			EdittingItem = function ()
				self:setupElementClipCounter( 4 )
				local personalizeListFrame2 = function ( personalizeList, event )
					if not event.interrupted then
						personalizeList:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Linear )
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
						optionsList:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Linear )
					end
					optionsList:setLeftRight( true, false, 64.5, 411.5 )
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
				self.optionsList:setAlpha( 1 )
				optionsListFrame2( optionsList, {} )
				local categoryInfoBlockFrame2 = function ( categoryInfoBlock, event )
					local categoryInfoBlockFrame3 = function ( categoryInfoBlock, event )
						if not event.interrupted then
							categoryInfoBlock:beginAnimation( "keyframe", 70, true, false, CoD.TweenType.Linear )
						end
						categoryInfoBlock:setLeftRight( true, false, 434.5, 715.5 )
						categoryInfoBlock:setTopBottom( true, false, 141.5, 604.5 )
						categoryInfoBlock:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( categoryInfoBlock, event )
						else
							categoryInfoBlock:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						categoryInfoBlockFrame3( categoryInfoBlock, event )
						return 
					else
						categoryInfoBlock:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						categoryInfoBlock:setLeftRight( true, false, 422.35, 703.35 )
						categoryInfoBlock:registerEventHandler( "transition_complete_keyframe", categoryInfoBlockFrame3 )
					end
				end
				
				categoryInfoBlock:completeAnimation()
				self.categoryInfoBlock:setLeftRight( true, false, 405, 686 )
				self.categoryInfoBlock:setTopBottom( true, false, 141.5, 604.5 )
				self.categoryInfoBlock:setAlpha( 1 )
				categoryInfoBlockFrame2( categoryInfoBlock, {} )
				local optionInfoBlockFrame2 = function ( optionInfoBlock, event )
					local optionInfoBlockFrame3 = function ( optionInfoBlock, event )
						if not event.interrupted then
							optionInfoBlock:beginAnimation( "keyframe", 70, true, false, CoD.TweenType.Linear )
						end
						optionInfoBlock:setLeftRight( true, false, 434.5, 715.5 )
						optionInfoBlock:setTopBottom( true, false, 141.5, 604.5 )
						optionInfoBlock:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( optionInfoBlock, event )
						else
							optionInfoBlock:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						optionInfoBlockFrame3( optionInfoBlock, event )
						return 
					else
						optionInfoBlock:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						optionInfoBlock:setLeftRight( true, false, 411.08, 692.08 )
						optionInfoBlock:registerEventHandler( "transition_complete_keyframe", optionInfoBlockFrame3 )
					end
				end
				
				optionInfoBlock:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
				optionInfoBlock:setLeftRight( true, false, 405, 686 )
				optionInfoBlock:setTopBottom( true, false, 141.5, 604.5 )
				optionInfoBlock:setAlpha( 0 )
				optionInfoBlock:registerEventHandler( "transition_complete_keyframe", optionInfoBlockFrame2 )
			end,
			EdittingColor = function ()
				self:setupElementClipCounter( 4 )
				local personalizeListFrame2 = function ( personalizeList, event )
					if not event.interrupted then
						personalizeList:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Linear )
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
						colorsList:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Linear )
					end
					colorsList:setLeftRight( true, false, 64.5, 411.5 )
					colorsList:setTopBottom( true, false, 93, 657 )
					colorsList:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( colorsList, event )
					else
						colorsList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				colorsList:completeAnimation()
				self.colorsList:setLeftRight( true, false, -348, 0 )
				self.colorsList:setTopBottom( true, false, 93, 657 )
				self.colorsList:setAlpha( 1 )
				colorsListFrame2( colorsList, {} )
				local categoryInfoBlockFrame2 = function ( categoryInfoBlock, event )
					local categoryInfoBlockFrame3 = function ( categoryInfoBlock, event )
						if not event.interrupted then
							categoryInfoBlock:beginAnimation( "keyframe", 70, true, false, CoD.TweenType.Linear )
						end
						categoryInfoBlock:setLeftRight( true, false, 434.5, 715.5 )
						categoryInfoBlock:setTopBottom( true, false, 141.5, 604.5 )
						categoryInfoBlock:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( categoryInfoBlock, event )
						else
							categoryInfoBlock:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						categoryInfoBlockFrame3( categoryInfoBlock, event )
						return 
					else
						categoryInfoBlock:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						categoryInfoBlock:setLeftRight( true, false, 422.35, 703.35 )
						categoryInfoBlock:registerEventHandler( "transition_complete_keyframe", categoryInfoBlockFrame3 )
					end
				end
				
				categoryInfoBlock:completeAnimation()
				self.categoryInfoBlock:setLeftRight( true, false, 405, 686 )
				self.categoryInfoBlock:setTopBottom( true, false, 141.5, 604.5 )
				self.categoryInfoBlock:setAlpha( 1 )
				categoryInfoBlockFrame2( categoryInfoBlock, {} )
				local colorInfoBlockFrame2 = function ( colorInfoBlock, event )
					local colorInfoBlockFrame3 = function ( colorInfoBlock, event )
						if not event.interrupted then
							colorInfoBlock:beginAnimation( "keyframe", 70, true, false, CoD.TweenType.Linear )
						end
						colorInfoBlock:setLeftRight( true, false, 434.5, 715.5 )
						colorInfoBlock:setTopBottom( true, false, 141.5, 604.5 )
						colorInfoBlock:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( colorInfoBlock, event )
						else
							colorInfoBlock:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						colorInfoBlockFrame3( colorInfoBlock, event )
						return 
					else
						colorInfoBlock:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						colorInfoBlock:setLeftRight( true, false, 411.08, 692.08 )
						colorInfoBlock:registerEventHandler( "transition_complete_keyframe", colorInfoBlockFrame3 )
					end
				end
				
				colorInfoBlock:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
				colorInfoBlock:setLeftRight( true, false, 405, 686 )
				colorInfoBlock:setTopBottom( true, false, 141.5, 604.5 )
				colorInfoBlock:setAlpha( 0 )
				colorInfoBlock:registerEventHandler( "transition_complete_keyframe", colorInfoBlockFrame2 )
			end
		},
		EdittingItem = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				personalizeList:completeAnimation()
				self.personalizeList:setAlpha( 0 )
				self.clipFinished( personalizeList, {} )
				optionsList:completeAnimation()
				self.optionsList:setLeftRight( true, false, 64.5, 411.5 )
				self.optionsList:setTopBottom( true, false, 93, 657 )
				self.optionsList:setAlpha( 1 )
				self.clipFinished( optionsList, {} )
				colorsList:completeAnimation()
				self.colorsList:setAlpha( 0 )
				self.clipFinished( colorsList, {} )
				categoryInfoBlock:completeAnimation()
				self.categoryInfoBlock:setLeftRight( true, false, 434.5, 715.5 )
				self.categoryInfoBlock:setTopBottom( true, false, 141.5, 604.5 )
				self.categoryInfoBlock:setAlpha( 0 )
				self.clipFinished( categoryInfoBlock, {} )
				colorInfoBlock:completeAnimation()
				self.colorInfoBlock:setAlpha( 0 )
				self.clipFinished( colorInfoBlock, {} )
				optionInfoBlock:completeAnimation()
				self.optionInfoBlock:setLeftRight( true, false, 434.5, 715.5 )
				self.optionInfoBlock:setTopBottom( true, false, 141.5, 604.5 )
				self.optionInfoBlock:setAlpha( 1 )
				self.clipFinished( optionInfoBlock, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 4 )
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
				self.optionsList:setLeftRight( true, false, 64.5, 411.5 )
				self.optionsList:setTopBottom( true, false, 93, 657 )
				self.optionsList:setAlpha( 1 )
				optionsListFrame2( optionsList, {} )
				local categoryInfoBlockFrame2 = function ( categoryInfoBlock, event )
					if not event.interrupted then
						categoryInfoBlock:beginAnimation( "keyframe", 70, false, true, CoD.TweenType.Linear )
					end
					categoryInfoBlock:setLeftRight( true, false, 405, 686 )
					categoryInfoBlock:setTopBottom( true, false, 141.5, 604.5 )
					categoryInfoBlock:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( categoryInfoBlock, event )
					else
						categoryInfoBlock:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				categoryInfoBlock:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
				categoryInfoBlock:setLeftRight( true, false, 434.5, 715.5 )
				categoryInfoBlock:setTopBottom( true, false, 141.5, 604.5 )
				categoryInfoBlock:setAlpha( 0 )
				categoryInfoBlock:registerEventHandler( "transition_complete_keyframe", categoryInfoBlockFrame2 )
				local optionInfoBlockFrame2 = function ( optionInfoBlock, event )
					if not event.interrupted then
						optionInfoBlock:beginAnimation( "keyframe", 70, false, true, CoD.TweenType.Linear )
					end
					optionInfoBlock:setLeftRight( true, false, 405, 686 )
					optionInfoBlock:setTopBottom( true, false, 141.5, 604.5 )
					optionInfoBlock:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( optionInfoBlock, event )
					else
						optionInfoBlock:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				optionInfoBlock:completeAnimation()
				self.optionInfoBlock:setLeftRight( true, false, 434.5, 715.5 )
				self.optionInfoBlock:setTopBottom( true, false, 141.5, 604.5 )
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
				self.colorsList:setLeftRight( true, false, 64.5, 411.5 )
				self.colorsList:setTopBottom( true, false, 93, 657 )
				self.colorsList:setAlpha( 1 )
				self.clipFinished( colorsList, {} )
				categoryInfoBlock:completeAnimation()
				self.categoryInfoBlock:setLeftRight( true, false, 434.5, 715.5 )
				self.categoryInfoBlock:setTopBottom( true, false, 141.5, 604.5 )
				self.categoryInfoBlock:setAlpha( 0 )
				self.clipFinished( categoryInfoBlock, {} )
				colorInfoBlock:completeAnimation()
				self.colorInfoBlock:setAlpha( 1 )
				self.clipFinished( colorInfoBlock, {} )
				optionInfoBlock:completeAnimation()
				self.optionInfoBlock:setLeftRight( true, false, 434.5, 715.5 )
				self.optionInfoBlock:setTopBottom( true, false, 141.5, 604.5 )
				self.optionInfoBlock:setAlpha( 0 )
				self.clipFinished( optionInfoBlock, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 4 )
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
				local colorsListFrame2 = function ( colorsList, event )
					if not event.interrupted then
						colorsList:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					colorsList:setLeftRight( true, false, -347.5, 0.5 )
					colorsList:setTopBottom( true, false, 93, 657 )
					colorsList:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( colorsList, event )
					else
						colorsList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				colorsList:completeAnimation()
				self.colorsList:setLeftRight( true, false, 64.5, 411.5 )
				self.colorsList:setTopBottom( true, false, 93, 657 )
				self.colorsList:setAlpha( 1 )
				colorsListFrame2( colorsList, {} )
				local categoryInfoBlockFrame2 = function ( categoryInfoBlock, event )
					if not event.interrupted then
						categoryInfoBlock:beginAnimation( "keyframe", 70, false, true, CoD.TweenType.Linear )
					end
					categoryInfoBlock:setLeftRight( true, false, 405, 686 )
					categoryInfoBlock:setTopBottom( true, false, 141.5, 604.5 )
					categoryInfoBlock:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( categoryInfoBlock, event )
					else
						categoryInfoBlock:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				categoryInfoBlock:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
				categoryInfoBlock:setLeftRight( true, false, 434.5, 715.5 )
				categoryInfoBlock:setTopBottom( true, false, 141.5, 604.5 )
				categoryInfoBlock:setAlpha( 0 )
				categoryInfoBlock:registerEventHandler( "transition_complete_keyframe", categoryInfoBlockFrame2 )
				local colorInfoBlockFrame2 = function ( colorInfoBlock, event )
					if not event.interrupted then
						colorInfoBlock:beginAnimation( "keyframe", 70, false, true, CoD.TweenType.Linear )
					end
					colorInfoBlock:setLeftRight( true, false, 405, 686 )
					colorInfoBlock:setTopBottom( true, false, 141.5, 604.5 )
					colorInfoBlock:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( colorInfoBlock, event )
					else
						colorInfoBlock:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				colorInfoBlock:completeAnimation()
				self.colorInfoBlock:setLeftRight( true, false, 434.5, 715.5 )
				self.colorInfoBlock:setTopBottom( true, false, 141.5, 604.5 )
				self.colorInfoBlock:setAlpha( 1 )
				colorInfoBlockFrame2( colorInfoBlock, {} )
			end
		}
	}
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		if not IsEdittingHeroOption( menu ) then
			menu:addButtonPrompt( "secondary", Engine.Localize( "MENU_BACK" ), "ESCAPE", element )
			return true
		elseif IsEdittingHeroOption( menu ) then
			menu:addButtonPrompt( "secondary", Engine.Localize( "MENU_BACK" ), "ESCAPE", element )
			return true
		else
			
		end
	end
	
	self.buttonPromptAddFunctions.secondary( self, self, {
		controller = controller
	} )
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESCAPE") then
			if not IsEdittingHeroOption( self ) then
				GoBack( self, controller )
				UploadStats( self, controller )
				ClearSavedState( self, controller )
				SendMenuResponse( self, "personalizeHero", "closed", controller )
			elseif IsEdittingHeroOption( self ) then
				CancelHeroOptionSelection( self, controller )
			end
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	personalizeList.id = "personalizeList"
	optionsList.id = "optionsList"
	colorsList.id = "colorsList"
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
	self.close = function ( self )
		self.background:close()
		self.personalizeList:close()
		self.optionsList:close()
		self.colorsList:close()
		self.categoryInfoBlock:close()
		self.colorInfoBlock:close()
		self.optionInfoBlock:close()
		self.PersonalizeElemsSideList:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

