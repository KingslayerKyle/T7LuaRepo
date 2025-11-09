require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Heroes.personalizeCustomizationList" )
require( "ui.uieditor.widgets.Heroes.heroSelectOptionList" )
require( "ui.uieditor.widgets.Heroes.heroPreviewPane" )
require( "ui.uieditor.widgets.Heroes.heroSelectOptionPane" )
require( "ui.uieditor.widgets.Heroes.heroLevelWidget" )
require( "ui.uieditor.widgets.Heroes.heroSelectOptionPane" )

local spacerRows = {}
local heroTable = "mp_character_customization"
local PreLoadFunc = function ( self, controller )
	self.disableBlur = true
	CoD.CCUtility.Heroes.heroCustomizationTable = Engine.GetHeroCustomizationTable( CoD.CCUtility.Heroes.HeroIndexForEdits )
	self.reloadSelectionList = function ()
		CoD.CCUtility.Heroes.selectionTable = Engine.GetEquippedInfoForHero( controller, CoD.CCUtility.Heroes.HeroIndexForEdits )
	end
	
	self.reloadSelectionList()
	self.currentMode = CoD.CCUtility.PersonalizeHeroData.Modes.ExploringOptions
end

local PostLoadFunc = function ( self, controller )
	local updateOptionListFocus = function ( optionList )
		if CoD.CCUtility.Heroes.selectionTable and CoD.CCUtility.PersonalizeHeroData.EdittingArea then
			local selectedItem = nil
			if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
				if CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex then
					selectedItem = CoD.CCUtility.Heroes.selectionTable.bodyColors[CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex] + 1
				else
					selectedItem = CoD.CCUtility.Heroes.selectionTable.selectedBody + 1
				end
			elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
				if CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex then
					selectedItem = CoD.CCUtility.Heroes.selectionTable.helmetColors[CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex] + 1
				else
					selectedItem = CoD.CCUtility.Heroes.selectionTable.selectedHelmet + 1
				end
			end
			local matchingWidget = optionList:findItem( nil, {
				optionIndex = selectedItem
			} )
			if matchingWidget then
				optionList.savedActiveIndex = matchingWidget.gridInfoTable.zeroBasedIndex
			end
		end
	end
	
	self.updateMode = function ( newMode, updateListAndSelectSlotProperties, element )
		if newMode == CoD.CCUtility.PersonalizeHeroData.Modes.ExploringOptions then
			SendMenuResponse( self, "personalizeHero", "opened", controller )
			self.reloadSelectionList()
			if updateListAndSelectSlotProperties then
				self.personalizeList.customizationList:updateDataSource()
				self.personalizeList.customizationList:findItem( nil, {
					customizationArea = updateListAndSelectSlotProperties
				}, true )
			end
			CoD.SwapFocusableElements( controller, self.optionsList, self.personalizeList )
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
			CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex = element.minorIndex
			CoD.CCUtility.PersonalizeHeroData.EdittingElement = element
			self.optionsList.optionsList:updateDataSource()
			updateOptionListFocus( self.optionsList.optionsList )
			CoD.SwapFocusableElements( controller, self.personalizeList, self.optionsList )
			self:setState( "Editting" )
		end
		self.currentMode = newMode
	end
	
	self.updateMode( CoD.CCUtility.PersonalizeHeroData.Modes.ExploringOptions )
end

LUI.createMenu.personalizeHero_v1 = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "personalizeHero_v1" )
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
	background:setLeftRight( true, false, 0, 1280 )
	background:setTopBottom( true, false, 0, 720 )
	background:setRGB( 1, 1, 1 )
	background.titleLabel:setText( Engine.Localize( LocalizeWithEdittingHeroName( "HEROES_PERSONALIZE_HERO_NAME" ) ) )
	self:addElement( background )
	self.background = background
	
	local personalizeList = CoD.personalizeCustomizationList.new( self, controller )
	personalizeList:setLeftRight( true, false, 64.5, 325.5 )
	personalizeList:setTopBottom( true, false, 141.5, 604.5 )
	personalizeList:setRGB( 1, 1, 1 )
	self:addElement( personalizeList )
	self.personalizeList = personalizeList
	
	local optionsList = CoD.heroSelectOptionList.new( self, controller )
	optionsList:setLeftRight( true, false, -348, 0 )
	optionsList:setTopBottom( true, false, 141.5, 604.5 )
	optionsList:setRGB( 1, 1, 1 )
	optionsList.categoryName:setText( Engine.Localize( "" ) )
	self:addElement( optionsList )
	self.optionsList = optionsList
	
	local heroPreviewPane0 = CoD.heroPreviewPane.new( self, controller )
	heroPreviewPane0:setLeftRight( true, false, 343.5, 624.5 )
	heroPreviewPane0:setTopBottom( true, false, 141.5, 604.5 )
	heroPreviewPane0:setRGB( 1, 1, 1 )
	self:addElement( heroPreviewPane0 )
	self.heroPreviewPane0 = heroPreviewPane0
	
	local heroSelectOptionPane0 = CoD.heroSelectOptionPane.new( self, controller )
	heroSelectOptionPane0:setLeftRight( true, false, 343.5, 624.5 )
	heroSelectOptionPane0:setTopBottom( true, false, 141.5, 604.5 )
	heroSelectOptionPane0:setRGB( 1, 1, 1 )
	heroSelectOptionPane0:setAlpha( 0 )
	self:addElement( heroSelectOptionPane0 )
	self.heroSelectOptionPane0 = heroSelectOptionPane0
	
	local heroLevelWidget0 = CoD.heroLevelWidget.new( self, controller )
	heroLevelWidget0:setLeftRight( true, false, 343.5, 547.5 )
	heroLevelWidget0:setTopBottom( true, false, 570.5, 604.5 )
	heroLevelWidget0:setRGB( 1, 1, 1 )
	self:addElement( heroLevelWidget0 )
	self.heroLevelWidget0 = heroLevelWidget0
	
	heroPreviewPane0:linkToElementModel( personalizeList.customizationList, nil, false, function ( model )
		heroPreviewPane0:setModel( model, controller )
	end )
	heroSelectOptionPane0:linkToElementModel( optionsList.optionsList, nil, false, function ( model )
		heroSelectOptionPane0:setModel( model, controller )
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
				self:setupElementClipCounter( 5 )
				personalizeList:completeAnimation()
				self.personalizeList:setLeftRight( true, false, 64.5, 325.5 )
				self.personalizeList:setTopBottom( true, false, 141.5, 604.5 )
				self.clipFinished( personalizeList, {} )
				optionsList:completeAnimation()
				self.optionsList:setLeftRight( true, false, -347.5, 0.5 )
				self.optionsList:setTopBottom( true, false, 141.5, 604.5 )
				self.optionsList:setAlpha( 0 )
				self.clipFinished( optionsList, {} )
				heroPreviewPane0:completeAnimation()
				self.heroPreviewPane0:setLeftRight( true, false, 343.5, 624.5 )
				self.heroPreviewPane0:setTopBottom( true, false, 141.5, 604.5 )
				self.clipFinished( heroPreviewPane0, {} )
				heroSelectOptionPane0:completeAnimation()
				self.heroSelectOptionPane0:setLeftRight( true, false, 343.5, 746.5 )
				self.heroSelectOptionPane0:setTopBottom( true, false, 141.5, 604.5 )
				self.clipFinished( heroSelectOptionPane0, {} )
				heroLevelWidget0:completeAnimation()
				self.heroLevelWidget0:setLeftRight( true, false, 343.5, 547.5 )
				self.heroLevelWidget0:setTopBottom( true, false, 570.5, 604.5 )
				self.clipFinished( heroLevelWidget0, {} )
			end,
			Editting = function ()
				self:setupElementClipCounter( 5 )
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
					optionsList:setTopBottom( true, false, 141.5, 604.5 )
					optionsList:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( optionsList, event )
					else
						optionsList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				optionsList:completeAnimation()
				self.optionsList:setLeftRight( true, false, -348, 0 )
				self.optionsList:setTopBottom( true, false, 141.5, 604.5 )
				self.optionsList:setAlpha( 1 )
				optionsListFrame2( optionsList, {} )
				local heroPreviewPane0Frame2 = function ( heroPreviewPane0, event )
					if not event.interrupted then
						heroPreviewPane0:beginAnimation( "keyframe", 70, true, false, CoD.TweenType.Linear )
					end
					heroPreviewPane0:setLeftRight( true, false, 434.5, 715.5 )
					heroPreviewPane0:setTopBottom( true, false, 141.5, 604.5 )
					heroPreviewPane0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( heroPreviewPane0, event )
					else
						heroPreviewPane0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				heroPreviewPane0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
				heroPreviewPane0:setLeftRight( true, false, 343.5, 624.5 )
				heroPreviewPane0:setTopBottom( true, false, 141.5, 604.5 )
				heroPreviewPane0:setAlpha( 1 )
				heroPreviewPane0:registerEventHandler( "transition_complete_keyframe", heroPreviewPane0Frame2 )
				local heroSelectOptionPane0Frame2 = function ( heroSelectOptionPane0, event )
					if not event.interrupted then
						heroSelectOptionPane0:beginAnimation( "keyframe", 70, true, false, CoD.TweenType.Linear )
					end
					heroSelectOptionPane0:setLeftRight( true, false, 434.5, 715.5 )
					heroSelectOptionPane0:setTopBottom( true, false, 141.5, 604.5 )
					heroSelectOptionPane0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( heroSelectOptionPane0, event )
					else
						heroSelectOptionPane0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				heroSelectOptionPane0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
				heroSelectOptionPane0:setLeftRight( true, false, 267.48, 548.48 )
				heroSelectOptionPane0:setTopBottom( true, false, 141.5, 604.5 )
				heroSelectOptionPane0:setAlpha( 0 )
				heroSelectOptionPane0:registerEventHandler( "transition_complete_keyframe", heroSelectOptionPane0Frame2 )
				local heroLevelWidget0Frame2 = function ( heroLevelWidget0, event )
					if not event.interrupted then
						heroLevelWidget0:beginAnimation( "keyframe", 49, true, false, CoD.TweenType.Linear )
					end
					heroLevelWidget0:setLeftRight( true, false, 434.5, 638.5 )
					heroLevelWidget0:setTopBottom( true, false, 570.5, 604.5 )
					if event.interrupted then
						self.clipFinished( heroLevelWidget0, event )
					else
						heroLevelWidget0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				heroLevelWidget0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
				heroLevelWidget0:setLeftRight( true, false, 343.5, 547.5 )
				heroLevelWidget0:setTopBottom( true, false, 570.5, 604.5 )
				heroLevelWidget0:registerEventHandler( "transition_complete_keyframe", heroLevelWidget0Frame2 )
			end
		},
		Editting = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				personalizeList:completeAnimation()
				self.personalizeList:setAlpha( 0 )
				self.clipFinished( personalizeList, {} )
				optionsList:completeAnimation()
				self.optionsList:setLeftRight( true, false, 64.5, 411.5 )
				self.optionsList:setTopBottom( true, false, 141.5, 604.5 )
				self.optionsList:setAlpha( 1 )
				self.clipFinished( optionsList, {} )
				heroPreviewPane0:completeAnimation()
				self.heroPreviewPane0:setLeftRight( true, false, 434.5, 715.5 )
				self.heroPreviewPane0:setTopBottom( true, false, 141.5, 604.5 )
				self.heroPreviewPane0:setAlpha( 0 )
				self.clipFinished( heroPreviewPane0, {} )
				heroSelectOptionPane0:completeAnimation()
				self.heroSelectOptionPane0:setLeftRight( true, false, 434.5, 715.5 )
				self.heroSelectOptionPane0:setTopBottom( true, false, 141.5, 604.5 )
				self.heroSelectOptionPane0:setAlpha( 1 )
				self.clipFinished( heroSelectOptionPane0, {} )
				heroLevelWidget0:completeAnimation()
				self.heroLevelWidget0:setLeftRight( true, false, 434.5, 638.5 )
				self.heroLevelWidget0:setTopBottom( true, false, 569.5, 604.5 )
				self.clipFinished( heroLevelWidget0, {} )
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
					optionsList:setLeftRight( true, false, -347.5, 0.5 )
					optionsList:setTopBottom( true, false, 141.5, 604.5 )
					optionsList:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( optionsList, event )
					else
						optionsList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				optionsList:completeAnimation()
				self.optionsList:setLeftRight( true, false, 64.5, 411.5 )
				self.optionsList:setTopBottom( true, false, 141.5, 604.5 )
				self.optionsList:setAlpha( 1 )
				optionsListFrame2( optionsList, {} )
				local heroPreviewPane0Frame2 = function ( heroPreviewPane0, event )
					if not event.interrupted then
						heroPreviewPane0:beginAnimation( "keyframe", 70, false, true, CoD.TweenType.Linear )
					end
					heroPreviewPane0:setLeftRight( true, false, 343.5, 624.5 )
					heroPreviewPane0:setTopBottom( true, false, 141.5, 604.5 )
					heroPreviewPane0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( heroPreviewPane0, event )
					else
						heroPreviewPane0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				heroPreviewPane0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
				heroPreviewPane0:setLeftRight( true, false, 434.5, 715.5 )
				heroPreviewPane0:setTopBottom( true, false, 141.5, 604.5 )
				heroPreviewPane0:setAlpha( 0 )
				heroPreviewPane0:registerEventHandler( "transition_complete_keyframe", heroPreviewPane0Frame2 )
				local heroSelectOptionPane0Frame2 = function ( heroSelectOptionPane0, event )
					if not event.interrupted then
						heroSelectOptionPane0:beginAnimation( "keyframe", 70, false, true, CoD.TweenType.Linear )
					end
					heroSelectOptionPane0:setLeftRight( true, false, 343.5, 624.5 )
					heroSelectOptionPane0:setTopBottom( true, false, 141.5, 604.5 )
					heroSelectOptionPane0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( heroSelectOptionPane0, event )
					else
						heroSelectOptionPane0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				heroSelectOptionPane0:completeAnimation()
				self.heroSelectOptionPane0:setLeftRight( true, false, 434.5, 715.5 )
				self.heroSelectOptionPane0:setTopBottom( true, false, 141.5, 604.5 )
				self.heroSelectOptionPane0:setAlpha( 1 )
				heroSelectOptionPane0Frame2( heroSelectOptionPane0, {} )
				local heroLevelWidget0Frame2 = function ( heroLevelWidget0, event )
					if not event.interrupted then
						heroLevelWidget0:beginAnimation( "keyframe", 50, false, true, CoD.TweenType.Linear )
					end
					heroLevelWidget0:setLeftRight( true, false, 343.5, 624.5 )
					heroLevelWidget0:setTopBottom( true, false, 569.5, 604.5 )
					if event.interrupted then
						self.clipFinished( heroLevelWidget0, event )
					else
						heroLevelWidget0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				heroLevelWidget0:completeAnimation()
				self.heroLevelWidget0:setLeftRight( true, false, 434.5, 638.5 )
				self.heroLevelWidget0:setTopBottom( true, false, 569.5, 604.5 )
				heroLevelWidget0Frame2( heroLevelWidget0, {} )
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
	
	self.buttonPromptAddFunctions.primary = function ( menu, element, event )
		menu:addButtonPrompt( "primary", Engine.Localize( "MENU_SELECT" ), "ENTER", element )
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
			if not IsEdittingHeroOption( self ) then
				GoBack( self, controller )
				UploadStats( self, controller )
				ClearSavedState( self, controller )
				SendMenuResponse( self, "personalizeHero", "closed", controller )
			elseif IsEdittingHeroOption( self ) then
				CancelHeroOptionSelection( self, controller )
			end
		end
		if not self.occludedBy and event.button ~= "primary" and event.button == "key_shortcut" and event.key == "ENTER" then
			
		else
			
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
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
	self.close = function ( self )
		self.background:close()
		self.personalizeList:close()
		self.optionsList:close()
		self.heroPreviewPane0:close()
		self.heroSelectOptionPane0:close()
		self.heroLevelWidget0:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

