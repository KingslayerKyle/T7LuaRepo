require( "ui.uieditor.menus.CAC.Popups.OutOfUnlockTokens" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.CAC.UnlockTokensWidget" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.Lobby.LobbyStreamerBlackFade" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.equippedScoreStreaksList" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreakButton" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreakPreview" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreakRequirementLabel" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreakVignetteContainer" )
require( "ui.uieditor.widgets.Pregame.Pregame_TimerOverlay" )
require( "ui.uieditor.widgets.Prestige.Prestige_PermanentUnlockTokensWidget" )
require( "ui.uieditor.widgets.Scorestreaks.scorestreaks_Banned_Items" )
require( "ui.uieditor.widgets.Scorestreaks.scorestreaks_TitleBox" )

DataSources.ScorestreaksList = DataSourceHelpers.ListSetup( "ScorestreaksList", function ( controller )
	local rewardsList = {}
	local rewardItems = CoD.GetUnlockablesByGroupName( "killstreak" )
	table.sort( rewardItems, CoD.CACUtility.CACRewardComparisonFunction )
	for _, itemIndex in pairs( rewardItems ) do
		local unlockablesItemModel = Engine.GetModel( Engine.GetGlobalModel(), "Unlockables." .. itemIndex )
		local unlockLevel = Engine.GetModelValue( Engine.GetModel( unlockablesItemModel, "unlockLevel" ) )
		table.insert( rewardsList, {
			models = {
				itemIndex = itemIndex,
				itemType = Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM,
				unlockLevel = unlockLevel
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
				itemIndex = item.itemIndex,
				itemType = Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM
			}
		} )
	end
	while #rewardsList < CoD.CACUtility.maxRewardSlots do
		table.insert( rewardsList, {
			models = {
				itemIndex = CoD.CACUtility.EmptyItemIndex,
				itemType = Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM
			}
		} )
	end
	return rewardsList
end, false )
local PreLoadFunc = function ( self, controller )
	if CoD.PrestigeUtility.isInPermanentUnlockMenu then
		self:setModel( CoD.perController[controller].classModel )
		CoD.perController[controller].weaponCategory = "killstreak1"
	else
		local ourClassModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ScorestreaksClass" )
		CoD.CACUtility.GetCustomClassModel( controller, 0, ourClassModel )
		self:setModel( ourClassModel )
		CoD.perController[controller].classModel = ourClassModel
		CoD.perController[controller].weaponCategory = "killstreak1"
		LUI.OverrideFunction_CallOriginalFirst( self, "close", function ()
			if LUI.DEV then
				local modelsAreDifferent = LUI.DEV.ErrorIfModelsDoNotMatch( ourClassModel, Engine.CreateModel( Engine.GetModelForController( controller ), "ScorestreaksClass" ) )
			end
			Engine.UnsubscribeAndFreeModel( ourClassModel )
		end )
	end
	if not CoD.CACUtility.UnlockablesTable then
		CoD.CACUtility.UnlockablesTable = CoD.CACUtility.GetUnlockablesTable( controller )
	end
	CoD.CACUtility.CreateUnlockTokenModels( controller )
	CoD.PrestigeUtility.CreatePermanentUnlockTokenModel( controller )
end

LUI.createMenu.Scorestreaks = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Scorestreaks" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "MP_SpecialistsAndScorestreaks"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Scorestreaks.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( 0, 1, 0, 0 )
	LeftPanel:setTopBottom( 0, 1, 0, 0 )
	LeftPanel:setRGB( 0.31, 0.31, 0.31 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local FadeForStreamer = CoD.LobbyStreamerBlackFade.new( self, controller )
	FadeForStreamer:mergeStateConditions( {
		{
			stateName = "Transparent",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "hideWorldForStreamer", 0 )
			end
		}
	} )
	FadeForStreamer:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "hideWorldForStreamer" ), function ( model )
		self:updateElementState( FadeForStreamer, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hideWorldForStreamer"
		} )
	end )
	FadeForStreamer:setLeftRight( 0, 1, 0, 0 )
	FadeForStreamer:setTopBottom( 0, 1, 0, 0 )
	self:addElement( FadeForStreamer )
	self.FadeForStreamer = FadeForStreamer
	
	local scorestreakVignetteContainer = CoD.scorestreakVignetteContainer.new( self, controller )
	scorestreakVignetteContainer:setLeftRight( 0, 0, 0, 1920 )
	scorestreakVignetteContainer:setTopBottom( 0, 0, 0, 1080 )
	self:addElement( scorestreakVignetteContainer )
	self.scorestreakVignetteContainer = scorestreakVignetteContainer
	
	local GenericMenuFrame0 = CoD.GenericMenuFrame.new( self, controller )
	GenericMenuFrame0:setLeftRight( 0, 1, 0, 0 )
	GenericMenuFrame0:setTopBottom( 0, 1, 0, 0 )
	GenericMenuFrame0.titleLabel:setText( LocalizeToUpperString( "MENU_SCORE_STREAKS_CAPS" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_SCORE_STREAKS_CAPS" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_scorestreak" ) )
	self:addElement( GenericMenuFrame0 )
	self.GenericMenuFrame0 = GenericMenuFrame0
	
	local scorestreaks = LUI.UIList.new( self, controller, 10, 0, nil, true, false, 0, 0, false, false )
	scorestreaks:makeFocusable()
	scorestreaks:setLeftRight( 0, 0, 115, 1055 )
	scorestreaks:setTopBottom( 0, 0, 212, 962 )
	scorestreaks:setWidgetType( CoD.scorestreakButton )
	scorestreaks:setHorizontalCount( 5 )
	scorestreaks:setVerticalCount( 4 )
	scorestreaks:setSpacing( 10 )
	scorestreaks:setDataSource( "ScorestreaksList" )
	scorestreaks:linkToElementModel( scorestreaks, "itemIndex", true, function ( model )
		local element = scorestreaks
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	scorestreaks:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		SetCACItemAsOld( element, controller )
		UpdateSelfElementState( self, element, controller )
		return retVal
	end )
	scorestreaks:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		return retVal
	end )
	scorestreaks:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( scorestreaks, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsCACItemLocked( menu, element, controller ) and not IsCACItemPurchased( element, controller ) and not IsCACHaveTokens( controller ) and not IsInPermanentUnlockMenu( controller ) then
			SetUnlockConfirmationInfo( element, controller )
			OpenPopup( self, "OutOfUnlockTokens", controller, "", "" )
			UpdateButtonPromptState( menu, element, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
			return true
		elseif not IsCACItemLocked( menu, element, controller ) and not IsCACItemPurchased( element, controller ) and IsCACHaveTokens( controller ) and not IsInPermanentUnlockMenu( controller ) then
			OpenUnlockClassItemDialog( menu, element, controller )
			UpdateButtonPromptState( menu, element, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
			UpdateButtonPromptState( menu, element, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
			return true
		elseif not IsCACItemLocked( menu, element, controller ) and IsCACItemPurchased( element, controller ) and not IsScorestreakEquipped( menu, element, controller ) and not IsInPermanentUnlockMenu( controller ) then
			EquipScorestreak( menu, element, controller )
			UpdateButtonPromptState( menu, element, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
			PlaySoundSetSound( self, "equip_item" )
			UpdateButtonPromptState( menu, element, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
			return true
		elseif not IsCACItemLocked( menu, element, controller ) and IsCACItemPurchased( element, controller ) and not IsInPermanentUnlockMenu( controller ) then
			RemoveScorestreak( menu, element, controller )
			UpdateButtonPromptState( menu, element, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
			PlaySoundSetSound( self, "unequip_item" )
			UpdateButtonPromptState( menu, element, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
			return true
		elseif IsInPermanentUnlockMenu( controller ) and not IsPermanentlyUnlocked( element, controller ) and HavePermanentUnlockTokens( controller ) then
			OpenPermanentUnlockClassItemDialog( menu, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsCACItemLocked( menu, element, controller ) and not IsCACItemPurchased( element, controller ) and not IsCACHaveTokens( controller ) and not IsInPermanentUnlockMenu( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		elseif not IsCACItemLocked( menu, element, controller ) and not IsCACItemPurchased( element, controller ) and IsCACHaveTokens( controller ) and not IsInPermanentUnlockMenu( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		elseif not IsCACItemLocked( menu, element, controller ) and IsCACItemPurchased( element, controller ) and not IsScorestreakEquipped( menu, element, controller ) and not IsInPermanentUnlockMenu( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		elseif not IsCACItemLocked( menu, element, controller ) and IsCACItemPurchased( element, controller ) and not IsInPermanentUnlockMenu( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_CLEAR", nil )
			return true
		elseif IsInPermanentUnlockMenu( controller ) and not IsPermanentlyUnlocked( element, controller ) and HavePermanentUnlockTokens( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( scorestreaks, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, nil, function ( element, menu, controller, model )
		if not IsCACItemLocked( menu, element, controller ) and IsCACItemPurchased( element, controller ) and IsScorestreakEquipped( menu, element, controller ) and not IsInPermanentUnlockMenu( controller ) then
			RemoveScorestreak( menu, element, controller )
			UpdateButtonPromptState( menu, element, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
			PlaySoundSetSound( self, "unequip_item" )
			UpdateButtonPromptState( menu, element, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsCACItemLocked( menu, element, controller ) and IsCACItemPurchased( element, controller ) and IsScorestreakEquipped( menu, element, controller ) and not IsInPermanentUnlockMenu( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "", nil )
			return false
		else
			return false
		end
	end, false )
	self:addElement( scorestreaks )
	self.scorestreaks = scorestreaks
	
	local equippedList = CoD.equippedScoreStreaksList.new( self, controller )
	equippedList:setLeftRight( 1, 1, -814, -106 )
	equippedList:setTopBottom( 1, 1, -311, -104 )
	equippedList:setAlpha( HideIfInPermanentUnlockMenu( 1 ) )
	self:addElement( equippedList )
	self.equippedList = equippedList
	
	local scorestreaksTitleBox = CoD.scorestreaks_TitleBox.new( self, controller )
	scorestreaksTitleBox:setLeftRight( 0, 0, 1109, 1485 )
	scorestreaksTitleBox:setTopBottom( 0, 0, 211, 264 )
	self:addElement( scorestreaksTitleBox )
	self.scorestreaksTitleBox = scorestreaksTitleBox
	
	local scorestreakPreview = CoD.scorestreakPreview.new( self, controller )
	scorestreakPreview:setLeftRight( 0, 0, 1208.5, 1691.5 )
	scorestreakPreview:setTopBottom( 0, 0, 112, 817 )
	self:addElement( scorestreakPreview )
	self.scorestreakPreview = scorestreakPreview
	
	local highlightedDescription = LUI.UIText.new()
	highlightedDescription:setLeftRight( 0.5, 0.5, 149, 710 )
	highlightedDescription:setTopBottom( 0.5, 0.5, -270, -237 )
	highlightedDescription:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	highlightedDescription:setLineSpacing( 0.5 )
	highlightedDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	highlightedDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( highlightedDescription )
	self.highlightedDescription = highlightedDescription
	
	local scorestreakRequirementLabel = CoD.scorestreakRequirementLabel.new( self, controller )
	scorestreakRequirementLabel:setLeftRight( 0, 0, 1667, 1829 )
	scorestreakRequirementLabel:setTopBottom( 0, 0, 211, 294 )
	self:addElement( scorestreakRequirementLabel )
	self.scorestreakRequirementLabel = scorestreakRequirementLabel
	
	local PregameTimerOverlay = CoD.Pregame_TimerOverlay.new( self, controller )
	PregameTimerOverlay:mergeStateConditions( {
		{
			stateName = "ScorestreakSelect",
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
	
	local UnlockTokensWidget = CoD.UnlockTokensWidget.new( self, controller )
	UnlockTokensWidget:setLeftRight( 1, 1, -543, -185 )
	UnlockTokensWidget:setTopBottom( 0, 0, 54, 120 )
	UnlockTokensWidget:setAlpha( HideIfInPermanentUnlockMenu( 1 ) )
	UnlockTokensWidget.tokenLabel:setTTF( "fonts/escom.ttf" )
	self:addElement( UnlockTokensWidget )
	self.UnlockTokensWidget = UnlockTokensWidget
	
	local PermanentUnlockTokensWidget = CoD.Prestige_PermanentUnlockTokensWidget.new( self, controller )
	PermanentUnlockTokensWidget:setLeftRight( 1, 1, -543, -121 )
	PermanentUnlockTokensWidget:setTopBottom( 0, 0, 54, 120 )
	PermanentUnlockTokensWidget:setAlpha( ShowIfInPermanentUnlockMenu( 0 ) )
	PermanentUnlockTokensWidget.tokenLabel:setTTF( "fonts/escom.ttf" )
	self:addElement( PermanentUnlockTokensWidget )
	self.PermanentUnlockTokensWidget = PermanentUnlockTokensWidget
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( 0, 0, 29, 107 )
	FEMenuLeftGraphics:setTopBottom( 0, 0, 129, 1055 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local scorestreaksBannedItems = CoD.scorestreaks_Banned_Items.new( self, controller )
	scorestreaksBannedItems:setLeftRight( 0, 0, 1497, 1811 )
	scorestreaksBannedItems:setTopBottom( 0, 0, 705.5, 750.5 )
	self:addElement( scorestreaksBannedItems )
	self.scorestreaksBannedItems = scorestreaksBannedItems
	
	scorestreaksTitleBox:linkToElementModel( scorestreaks, nil, false, function ( model )
		scorestreaksTitleBox:setModel( model, controller )
	end )
	scorestreaksTitleBox:linkToElementModel( scorestreaks, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			scorestreaksTitleBox.ScorestreaksLabel:setText( Engine.Localize( GetItemNameFromIndex( modelValue ) ) )
		end
	end )
	scorestreakPreview:linkToElementModel( scorestreaks, nil, false, function ( model )
		scorestreakPreview:setModel( model, controller )
	end )
	highlightedDescription:linkToElementModel( scorestreaks, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			highlightedDescription:setText( Engine.Localize( GetUnlockDescription( controller, modelValue ) ) )
		end
	end )
	scorestreakRequirementLabel:linkToElementModel( scorestreaks, nil, false, function ( model )
		scorestreakRequirementLabel:setModel( model, controller )
	end )
	scorestreaksBannedItems:linkToElementModel( scorestreaks, nil, false, function ( model )
		scorestreaksBannedItems:setModel( model, controller )
	end )
	scorestreaks.navigation = {
		right = equippedList
	}
	equippedList.navigation = {
		left = scorestreaks
	}
	self.resetProperties = function ()
		scorestreaks:completeAnimation()
		equippedList:completeAnimation()
		scorestreaksTitleBox:completeAnimation()
		highlightedDescription:completeAnimation()
		scorestreaks:setAlpha( 1 )
		equippedList:setAlpha( HideIfInPermanentUnlockMenu( 1 ) )
		scorestreaksTitleBox:setAlpha( 1 )
		highlightedDescription:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Intro = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				local scorestreaksFrame2 = function ( scorestreaks, event )
					local scorestreaksFrame3 = function ( scorestreaks, event )
						local scorestreaksFrame4 = function ( scorestreaks, event )
							if not event.interrupted then
								scorestreaks:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
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
					equippedList:setAlpha( HideIfInPermanentUnlockMenu( 1 ) )
					if event.interrupted then
						self.clipFinished( equippedList, event )
					else
						equippedList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				equippedList:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
				equippedList:setAlpha( HideIfInPermanentUnlockMenu( 0 ) )
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
			end
		}
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
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
		ShowHeaderKickerAndIcon( self )
		SetHeadingKickerTextToGameMode( "" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		SaveLoadout( self, controller )
		ForceNotifyPregameUpdate( self, element, controller )
		ClearMenuSavedState( menu )
		SetPerControllerTableProperty( controller, "updateNewBreadcrumbs", true )
		ForceLobbyButtonUpdate( controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "Y", function ( element, menu, controller, model )
		RemoveAllScorestreaks( menu, controller )
		PlaySoundSetSound( self, "unequip_item" )
		UpdateAllMenuButtonPrompts( menu, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "MENU_CLEAR_ALL", nil )
		return true
	end, false )
	GenericMenuFrame0:setModel( self.buttonModel, controller )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LeftPanel:close()
		self.FadeForStreamer:close()
		self.scorestreakVignetteContainer:close()
		self.GenericMenuFrame0:close()
		self.scorestreaks:close()
		self.equippedList:close()
		self.scorestreaksTitleBox:close()
		self.scorestreakPreview:close()
		self.scorestreakRequirementLabel:close()
		self.PregameTimerOverlay:close()
		self.UnlockTokensWidget:close()
		self.PermanentUnlockTokensWidget:close()
		self.FEMenuLeftGraphics:close()
		self.scorestreaksBannedItems:close()
		self.highlightedDescription:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Scorestreaks.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

