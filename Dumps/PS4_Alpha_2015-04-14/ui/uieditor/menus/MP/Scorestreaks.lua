require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreakVignetteContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShader" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreakButton" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.equippedScoreStreaksList" )
require( "ui.uieditor.widgets.Scorestreaks.scorestreaks_TitleBox" )
require( "ui.uieditor.widgets.Scorestreaks.scorestreaks_ElementSide" )
require( "ui.uieditor.widgets.Scorestreaks.scorestreaks_ElementBottom" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreakRequirementLabel" )

DataSources.ScorestreaksList = DataSourceHelpers.ListSetup( "ScorestreaksList", function ( controller )
	local rewardsList = {}
	local rewardItems = CoD.GetUnlockablesByGroupName( "killstreak" )
	table.sort( rewardItems, CoD.CACRewardComparisonFunction )
	for _, itemIndex in pairs( rewardItems ) do
		table.insert( rewardsList, {
			models = {
				itemIndex = itemIndex
			}
		} )
	end
	return rewardsList
end, true )
DataSources.EquippedScorestreaksList = DataSourceHelpers.ListSetup( "EquippedScorestreaksList", function ( controller )
	local rewardsList = {}
	local classData = CoD.CACUtility.GetClassData( controller, 0 )
	for _, item in ipairs( classData.rewards ) do
		table.insert( rewardsList, {
			models = {
				itemIndex = item.itemIndex
			}
		} )
	end
	while #rewardsList < CoD.CACUtility.maxRewardSlots do
		table.insert( rewardsList, {
			models = {
				itemIndex = CoD.CACUtility.EmptyItemIndex
			}
		} )
	end
	return rewardsList
end, false )
local PreLoadFunc = function ( self, controller )
	local ourClassModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ScorestreaksClass" )
	CoD.CACUtility.GetCustomClassModel( controller, 0, ourClassModel )
	self:setModel( ourClassModel )
	CoD.perController[controller].weaponCategory = "killstreak1"
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ()
		Engine.UnsubscribeAndFreeModel( ourClassModel )
	end )
end

LUI.createMenu.Scorestreaks = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Scorestreaks" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local tempBackgroud = LUI.UIImage.new()
	tempBackgroud:setLeftRight( true, true, 0, 0 )
	tempBackgroud:setTopBottom( true, true, 0, 0 )
	tempBackgroud:setRGB( 0.18, 0.18, 0.18 )
	tempBackgroud:setAlpha( 0.35 )
	tempBackgroud:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	tempBackgroud:setShaderVector( 0, 4, 1, 0, 0 )
	self:addElement( tempBackgroud )
	self.tempBackgroud = tempBackgroud
	
	local scorestreakVignetteContainer = CoD.scorestreakVignetteContainer.new( self, controller )
	scorestreakVignetteContainer:setLeftRight( true, false, 0, 1280 )
	scorestreakVignetteContainer:setTopBottom( true, false, 0, 720 )
	scorestreakVignetteContainer:setRGB( 1, 1, 1 )
	self:addElement( scorestreakVignetteContainer )
	self.scorestreakVignetteContainer = scorestreakVignetteContainer
	
	local FEButtonPanel = CoD.FE_ButtonPanelShader.new( self, controller )
	FEButtonPanel:setLeftRight( true, true, 64, -690 )
	FEButtonPanel:setTopBottom( true, true, 71, -44.28 )
	FEButtonPanel:setRGB( 0.17, 0.17, 0.17 )
	FEButtonPanel:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2" ) )
	FEButtonPanel:setShaderVector( 0, 30, 10, 0, 0 )
	self:addElement( FEButtonPanel )
	self.FEButtonPanel = FEButtonPanel
	
	local GenericMenuFrame0 = CoD.GenericMenuFrame.new( self, controller )
	GenericMenuFrame0:setLeftRight( true, true, 0, 0 )
	GenericMenuFrame0:setTopBottom( true, true, 0, 0 )
	GenericMenuFrame0:setRGB( 1, 1, 1 )
	GenericMenuFrame0.titleLabel:setText( Engine.Localize( LocalizeToUpperString( "MENU_SCORE_STREAKS_CAPS" ) ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_SCORE_STREAKS_CAPS" ) )
	self:addElement( GenericMenuFrame0 )
	self.GenericMenuFrame0 = GenericMenuFrame0
	
	local scorestreaks = LUI.UIList.new( self, controller, 7, 0, nil, true, false, 0, 0, false, false )
	scorestreaks:makeFocusable()
	scorestreaks:setLeftRight( true, false, 76, 577 )
	scorestreaks:setTopBottom( true, false, 124.72, 625.72 )
	scorestreaks:setRGB( 1, 1, 1 )
	scorestreaks:setDataSource( "ScorestreaksList" )
	scorestreaks:setWidgetType( CoD.scorestreakButton )
	scorestreaks:setHorizontalCount( 4 )
	scorestreaks:setVerticalCount( 4 )
	scorestreaks:setSpacing( 7 )
	scorestreaks.buttonPromptAddFunctions = {}
	scorestreaks.buttonPromptAddFunctions.alt1 = function ( menu, element, event )
		if element:isInFocus() then
			menu:addButtonPrompt( "alt1", Engine.Localize( "MENU_REMOVE" ), "X", element )
			return true
		else
			
		end
	end
	
	scorestreaks:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "alt1" or event.button == "key_shortcut" and event.key == "X") and element:isInFocus() then
			RemoveScorestreak( self, element, controller )
			return true
		elseif not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	scorestreaks:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		if not IsCACItemLocked( self, element, controller ) and IsCACItemPurchased( self, element, controller ) then
			EquipScorestreak( self, element, controller )
		end
		return retVal
	end )
	scorestreaks:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		element.buttonPromptAddFunctions.alt1( self, element, event )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return true
	end )
	scorestreaks:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		self:removeButtonPrompt( "alt1", element )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	scorestreaks:updateButtonPromptEventHandlers()
	self:addElement( scorestreaks )
	self.scorestreaks = scorestreaks
	
	local equippedList = CoD.equippedScoreStreaksList.new( self, controller )
	equippedList:setLeftRight( true, false, 619, 1019 )
	equippedList:setTopBottom( true, false, 524.49, 638.49 )
	equippedList:setRGB( 1, 1, 1 )
	self:addElement( equippedList )
	self.equippedList = equippedList
	
	local scorestreaksTitleBox = CoD.scorestreaks_TitleBox.new( self, controller )
	scorestreaksTitleBox:setLeftRight( true, false, 619, 870 )
	scorestreaksTitleBox:setTopBottom( true, false, 124.72, 172.72 )
	scorestreaksTitleBox:setRGB( 1, 1, 1 )
	self:addElement( scorestreaksTitleBox )
	self.scorestreaksTitleBox = scorestreaksTitleBox
	
	local highlightedDescription = LUI.UIText.new()
	highlightedDescription:setLeftRight( false, false, -21, 299.31 )
	highlightedDescription:setTopBottom( false, false, -181.73, -162.73 )
	highlightedDescription:setRGB( 1, 1, 1 )
	highlightedDescription:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	highlightedDescription:setLineSpacing( 0.5 )
	highlightedDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	highlightedDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( highlightedDescription )
	self.highlightedDescription = highlightedDescription
	
	local scorestreaksElementSide = CoD.scorestreaks_ElementSide.new( self, controller )
	scorestreaksElementSide:setLeftRight( true, false, 37, 73 )
	scorestreaksElementSide:setTopBottom( true, false, 116.11, 630.61 )
	scorestreaksElementSide:setRGB( 1, 1, 1 )
	self:addElement( scorestreaksElementSide )
	self.scorestreaksElementSide = scorestreaksElementSide
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, -11, 1293 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local scorestreaksElementBottom = CoD.scorestreaks_ElementBottom.new( self, controller )
	scorestreaksElementBottom:setLeftRight( true, false, 552, 1052 )
	scorestreaksElementBottom:setTopBottom( true, false, 520.49, 631.72 )
	scorestreaksElementBottom:setRGB( 1, 1, 1 )
	self:addElement( scorestreaksElementBottom )
	self.scorestreaksElementBottom = scorestreaksElementBottom
	
	local scorestreakRequirementLabel = CoD.scorestreakRequirementLabel.new( self, controller )
	scorestreakRequirementLabel:setLeftRight( true, false, 1066, 1216 )
	scorestreakRequirementLabel:setTopBottom( true, false, 124.72, 179.72 )
	scorestreakRequirementLabel:setRGB( 1, 1, 1 )
	self:addElement( scorestreakRequirementLabel )
	self.scorestreakRequirementLabel = scorestreakRequirementLabel
	
	local highlightedImage0 = LUI.UIImage.new()
	highlightedImage0:setLeftRight( true, false, 736, 1048 )
	highlightedImage0:setTopBottom( true, false, 204, 516 )
	highlightedImage0:setRGB( 1, 1, 1 )
	highlightedImage0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( highlightedImage0 )
	self.highlightedImage0 = highlightedImage0
	
	scorestreaksTitleBox:linkToElementModel( scorestreaks, nil, false, function ( model )
		scorestreaksTitleBox:setModel( model, controller )
	end )
	highlightedDescription:linkToElementModel( scorestreaks, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			highlightedDescription:setText( Engine.Localize( GetItemDescriptionFromIndex( modelValue ) ) )
		end
	end )
	scorestreakRequirementLabel:linkToElementModel( scorestreaks, nil, false, function ( model )
		scorestreakRequirementLabel:setModel( model, controller )
	end )
	highlightedImage0:linkToElementModel( scorestreaks, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			highlightedImage0:setImage( RegisterImage( AppendString( GetItemImageFromIndex( modelValue ), "_menu_large" ) ) )
		end
	end )
	scorestreaks.navigation = {
		right = equippedList
	}
	equippedList.navigation = {
		left = scorestreaks
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				scorestreaksElementSide:completeAnimation()
				self.scorestreaksElementSide:setLeftRight( true, false, 37, 73 )
				self.scorestreaksElementSide:setTopBottom( true, false, 116.11, 630.61 )
				self.clipFinished( scorestreaksElementSide, {} )
				CategoryListLine:completeAnimation()
				self.CategoryListLine:setLeftRight( true, false, -11, 1293 )
				self.CategoryListLine:setTopBottom( true, false, 80, 88 )
				self.CategoryListLine:setAlpha( 1 )
				self.clipFinished( CategoryListLine, {} )
				scorestreaksElementBottom:completeAnimation()
				self.scorestreaksElementBottom:setLeftRight( true, false, 552, 1052 )
				self.scorestreaksElementBottom:setTopBottom( true, false, 520.49, 631.72 )
				self.clipFinished( scorestreaksElementBottom, {} )
				scorestreakRequirementLabel:completeAnimation()
				self.scorestreakRequirementLabel:setAlpha( 1 )
				self.clipFinished( scorestreakRequirementLabel, {} )
				highlightedImage0:completeAnimation()
				self.highlightedImage0:setLeftRight( true, false, 736, 1048 )
				self.highlightedImage0:setTopBottom( true, false, 204, 516 )
				self.highlightedImage0:setAlpha( 1 )
				self.clipFinished( highlightedImage0, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 10 )
				local FEButtonPanelFrame2 = function ( FEButtonPanel, event )
					if not event.interrupted then
						FEButtonPanel:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Linear )
					end
					FEButtonPanel:setLeftRight( true, true, 64, -690 )
					FEButtonPanel:setTopBottom( true, true, 71, -58 )
					if event.interrupted then
						self.clipFinished( FEButtonPanel, event )
					else
						FEButtonPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonPanel:completeAnimation()
				self.FEButtonPanel:setLeftRight( true, true, 64, -690 )
				self.FEButtonPanel:setTopBottom( true, true, 71, -632 )
				FEButtonPanelFrame2( FEButtonPanel, {} )
				local scorestreaksFrame2 = function ( scorestreaks, event )
					local scorestreaksFrame3 = function ( scorestreaks, event )
						local scorestreaksFrame4 = function ( scorestreaks, event )
							if not event.interrupted then
								scorestreaks:beginAnimation( "keyframe", 1409, false, false, CoD.TweenType.Linear )
							end
							scorestreaks:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( scorestreaks, event )
							else
								scorestreaks:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							scorestreaksFrame4( scorestreaks, event )
							return 
						else
							scorestreaks:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Bounce )
							scorestreaks:setAlpha( 1 )
							scorestreaks:registerEventHandler( "transition_complete_keyframe", scorestreaksFrame4 )
						end
					end
					
					if event.interrupted then
						scorestreaksFrame3( scorestreaks, event )
						return 
					else
						scorestreaks:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
						scorestreaks:registerEventHandler( "transition_complete_keyframe", scorestreaksFrame3 )
					end
				end
				
				scorestreaks:completeAnimation()
				self.scorestreaks:setAlpha( 0 )
				scorestreaksFrame2( scorestreaks, {} )
				local equippedListFrame2 = function ( equippedList, event )
					if not event.interrupted then
						equippedList:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Bounce )
					end
					equippedList:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( equippedList, event )
					else
						equippedList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				equippedList:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
				equippedList:setAlpha( 0 )
				equippedList:registerEventHandler( "transition_complete_keyframe", equippedListFrame2 )
				local scorestreaksTitleBoxFrame2 = function ( scorestreaksTitleBox, event )
					if not event.interrupted then
						scorestreaksTitleBox:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Bounce )
					end
					scorestreaksTitleBox:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( scorestreaksTitleBox, event )
					else
						scorestreaksTitleBox:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				scorestreaksTitleBox:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
				scorestreaksTitleBox:setAlpha( 0 )
				scorestreaksTitleBox:registerEventHandler( "transition_complete_keyframe", scorestreaksTitleBoxFrame2 )
				local highlightedDescriptionFrame2 = function ( highlightedDescription, event )
					if not event.interrupted then
						highlightedDescription:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Bounce )
					end
					highlightedDescription:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( highlightedDescription, event )
					else
						highlightedDescription:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				highlightedDescription:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
				highlightedDescription:setAlpha( 0 )
				highlightedDescription:registerEventHandler( "transition_complete_keyframe", highlightedDescriptionFrame2 )
				scorestreaksElementSide:completeAnimation()
				self.scorestreaksElementSide:setLeftRight( true, false, 37, 73 )
				self.scorestreaksElementSide:setTopBottom( true, false, 116.11, 630.61 )
				self.clipFinished( scorestreaksElementSide, {} )
				local CategoryListLineFrame2 = function ( CategoryListLine, event )
					if not event.interrupted then
						CategoryListLine:beginAnimation( "keyframe", 1759, false, false, CoD.TweenType.Linear )
					end
					CategoryListLine:setLeftRight( true, false, -11, 1293 )
					CategoryListLine:setTopBottom( true, false, 80, 88 )
					if event.interrupted then
						self.clipFinished( CategoryListLine, event )
					else
						CategoryListLine:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CategoryListLine:completeAnimation()
				self.CategoryListLine:setLeftRight( true, false, -11, 9 )
				self.CategoryListLine:setTopBottom( true, false, 80, 88 )
				CategoryListLineFrame2( CategoryListLine, {} )
				scorestreaksElementBottom:completeAnimation()
				self.scorestreaksElementBottom:setLeftRight( true, false, 566, 1066 )
				self.scorestreaksElementBottom:setTopBottom( true, false, 520.49, 631.72 )
				self.clipFinished( scorestreaksElementBottom, {} )
				local scorestreakRequirementLabelFrame2 = function ( scorestreakRequirementLabel, event )
					if not event.interrupted then
						scorestreakRequirementLabel:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
					end
					scorestreakRequirementLabel:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( scorestreakRequirementLabel, event )
					else
						scorestreakRequirementLabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				scorestreakRequirementLabel:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Bounce )
				scorestreakRequirementLabel:setAlpha( 0 )
				scorestreakRequirementLabel:registerEventHandler( "transition_complete_keyframe", scorestreakRequirementLabelFrame2 )
				local highlightedImage0Frame2 = function ( highlightedImage0, event )
					if not event.interrupted then
						highlightedImage0:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Bounce )
					end
					highlightedImage0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( highlightedImage0, event )
					else
						highlightedImage0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				highlightedImage0:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
				highlightedImage0:setAlpha( 0 )
				highlightedImage0:registerEventHandler( "transition_complete_keyframe", highlightedImage0Frame2 )
			end
		}
	}
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		menu:addButtonPrompt( "secondary", Engine.Localize( "MENU_BACK" ), "ESCAPE", element )
		return true
	end
	
	self.buttonPromptAddFunctions.alt2 = function ( menu, element, event )
		menu:addButtonPrompt( "alt2", Engine.Localize( "MENU_CLEAR_ALL" ), "Y", element )
		return true
	end
	
	self.buttonPromptAddFunctions.primary = function ( menu, element, event )
		menu:addButtonPrompt( "primary", Engine.Localize( "MENU_SELECT" ), "ENTER", element )
		return true
	end
	
	self.buttonPromptAddFunctions.secondary( self, self, {
		controller = controller
	} )
	self.buttonPromptAddFunctions.alt2( self, self, {
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
			SaveLoadout( self, controller )
			ClearMenuSavedState( self )
		end
		if not self.occludedBy and (event.button == "alt2" or event.button == "key_shortcut" and event.key == "Y") then
			RemoveAllScorestreaks( self, controller )
		end
		if not self.occludedBy and event.button ~= "primary" and event.button == "key_shortcut" and event.key == "ENTER" then
			
		else
			
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SetElementStateByElementName( self, "GenericMenuFrame0", controller, "Update" )
		PlayClipOnElement( self, {
			elementName = "scorestreaksElementSide",
			clipName = "Intro"
		}, controller )
		PlayClip( self, "Intro", controller )
		PlayClipOnElement( self, {
			elementName = "scorestreaksElementBottom",
			clipName = "Intro"
		}, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	scorestreaks.id = "scorestreaks"
	equippedList.id = "equippedList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.scorestreaks:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.scorestreakVignetteContainer:close()
		self.FEButtonPanel:close()
		self.GenericMenuFrame0:close()
		self.scorestreaks:close()
		self.equippedList:close()
		self.scorestreaksTitleBox:close()
		self.scorestreaksElementSide:close()
		self.scorestreaksElementBottom:close()
		self.scorestreakRequirementLabel:close()
		self.highlightedDescription:close()
		self.highlightedImage0:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

