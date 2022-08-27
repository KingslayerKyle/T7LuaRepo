-- 5e20a9520eb1772e8aa3695a3ed68cc5
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.LobbyStreamerBlackFade" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreakVignetteContainer" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.menus.CAC.Popups.OutOfUnlockTokens" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreakButton" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.equippedScoreStreaksList" )
require( "ui.uieditor.widgets.Scorestreaks.scorestreaks_TitleBox" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreakPreview" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreakRequirementLabel" )
require( "ui.uieditor.widgets.Pregame.Pregame_TimerOverlay" )
require( "ui.uieditor.widgets.CAC.UnlockTokensWidget" )
require( "ui.uieditor.widgets.Prestige.Prestige_PermanentUnlockTokensWidget" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.Scorestreaks.scorestreaks_Banned_Items" )

DataSources.ScorestreaksList = DataSourceHelpers.ListSetup( "ScorestreaksList", function ( f1_arg0 )
	local f1_local0 = {}
	local f1_local1 = CoD.GetUnlockablesByGroupName( "killstreak" )
	table.sort( f1_local1, CoD.CACRewardComparisonFunction )
	for f1_local5, f1_local6 in pairs( f1_local1 ) do
		table.insert( f1_local0, {
			models = {
				itemIndex = f1_local6,
				itemType = Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM,
				unlockLevel = Engine.GetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "Unlockables." .. f1_local6 ), "unlockLevel" ) )
			}
		} )
	end
	return f1_local0
end, true )
DataSources.EquippedScorestreaksList = DataSourceHelpers.ListSetup( "EquippedScorestreaksList", function ( f2_arg0 )
	local f2_local0 = {}
	local f2_local1 = CoD.CACUtility.GetClassData( f2_arg0, 0 )
	for f2_local5, f2_local6 in ipairs( f2_local1.rewards ) do
		table.insert( f2_local0, {
			models = {
				itemIndex = f2_local6.itemIndex,
				itemType = Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM
			}
		} )
	end
	while #f2_local0 < CoD.CACUtility.maxRewardSlots do
		table.insert( f2_local0, {
			models = {
				itemIndex = CoD.CACUtility.EmptyItemIndex,
				itemType = Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM
			}
		} )
	end
	return f2_local0
end, false )
local PreLoadFunc = function ( self, controller )
	if CoD.PrestigeUtility.isInPermanentUnlockMenu then
		self:setModel( CoD.perController[controller].classModel )
		CoD.perController[controller].weaponCategory = "killstreak1"
	else
		local f3_local0 = Engine.CreateModel( Engine.GetModelForController( controller ), "ScorestreaksClass" )
		CoD.CACUtility.GetCustomClassModel( controller, 0, f3_local0 )
		self:setModel( f3_local0 )
		CoD.perController[controller].classModel = f3_local0
		CoD.perController[controller].weaponCategory = "killstreak1"
		LUI.OverrideFunction_CallOriginalFirst( self, "close", function ()
			Engine.UnsubscribeAndFreeModel( f3_local0 )
		end )
	end
	if not CoD.UnlockablesTable then
		CoD.UnlockablesTable = CoD.GetUnlockablesTable( controller )
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
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Scorestreaks.buttonPrompts" )
	local f5_local1 = self
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( f5_local1, controller )
	LeftPanel:setLeftRight( true, true, 0, 0 )
	LeftPanel:setTopBottom( true, true, 0, 0 )
	LeftPanel:setRGB( 0.31, 0.31, 0.31 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local FadeForStreamer = CoD.LobbyStreamerBlackFade.new( f5_local1, controller )
	FadeForStreamer:setLeftRight( true, true, 0, 0 )
	FadeForStreamer:setTopBottom( true, true, 0, 0 )
	FadeForStreamer:mergeStateConditions( {
		{
			stateName = "Transparent",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "hideWorldForStreamer", 0 )
			end
		}
	} )
	FadeForStreamer:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "hideWorldForStreamer" ), function ( model )
		f5_local1:updateElementState( FadeForStreamer, {
			name = "model_validation",
			menu = f5_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hideWorldForStreamer"
		} )
	end )
	self:addElement( FadeForStreamer )
	self.FadeForStreamer = FadeForStreamer
	
	local scorestreakVignetteContainer = CoD.scorestreakVignetteContainer.new( f5_local1, controller )
	scorestreakVignetteContainer:setLeftRight( true, false, 0, 1280 )
	scorestreakVignetteContainer:setTopBottom( true, false, 0, 720 )
	self:addElement( scorestreakVignetteContainer )
	self.scorestreakVignetteContainer = scorestreakVignetteContainer
	
	local GenericMenuFrame0 = CoD.GenericMenuFrame.new( f5_local1, controller )
	GenericMenuFrame0:setLeftRight( true, true, 0, 0 )
	GenericMenuFrame0:setTopBottom( true, true, 0, 0 )
	GenericMenuFrame0.titleLabel:setText( LocalizeToUpperString( "MENU_SCORE_STREAKS_CAPS" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_SCORE_STREAKS_CAPS" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_scorestreak" ) )
	self:addElement( GenericMenuFrame0 )
	self.GenericMenuFrame0 = GenericMenuFrame0
	
	local scorestreaks = LUI.UIList.new( f5_local1, controller, 7, 0, nil, true, false, 0, 0, false, false )
	scorestreaks:makeFocusable()
	scorestreaks:setLeftRight( true, false, 76, 704 )
	scorestreaks:setTopBottom( true, false, 140.72, 641.72 )
	scorestreaks:setWidgetType( CoD.scorestreakButton )
	scorestreaks:setHorizontalCount( 5 )
	scorestreaks:setVerticalCount( 4 )
	scorestreaks:setSpacing( 7 )
	scorestreaks:setDataSource( "ScorestreaksList" )
	scorestreaks:linkToElementModel( scorestreaks, "itemIndex", true, function ( model )
		local f8_local0 = scorestreaks
		local f8_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		}
		CoD.Menu.UpdateButtonShownState( f8_local0, f5_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( f8_local0, f5_local1, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	scorestreaks:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f9_local0 = nil
		SetCACItemAsOld( element, controller )
		UpdateSelfElementState( f5_local1, element, controller )
		return f9_local0
	end )
	scorestreaks:registerEventHandler( "gain_focus", function ( element, event )
		local f10_local0 = nil
		if element.gainFocus then
			f10_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f10_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f5_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, f5_local1, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		return f10_local0
	end )
	scorestreaks:registerEventHandler( "lose_focus", function ( element, event )
		local f11_local0 = nil
		if element.loseFocus then
			f11_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f11_local0 = element.super:loseFocus( event )
		end
		return f11_local0
	end )
	f5_local1:AddButtonCallbackFunction( scorestreaks, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
		if not IsCACItemLocked( f12_arg1, f12_arg0, f12_arg2 ) and not IsCACItemPurchased( f12_arg0, f12_arg2 ) and not IsCACHaveTokens( f12_arg2 ) and not IsInPermanentUnlockMenu( f12_arg2 ) then
			SetUnlockConfirmationInfo( f12_arg0, f12_arg2 )
			OpenPopup( self, "OutOfUnlockTokens", f12_arg2 )
			UpdateButtonPromptState( f12_arg1, f12_arg0, f12_arg2, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
			return true
		elseif not IsCACItemLocked( f12_arg1, f12_arg0, f12_arg2 ) and not IsCACItemPurchased( f12_arg0, f12_arg2 ) and IsCACHaveTokens( f12_arg2 ) and not IsInPermanentUnlockMenu( f12_arg2 ) then
			OpenUnlockClassItemDialog( f12_arg1, f12_arg0, f12_arg2 )
			UpdateButtonPromptState( f12_arg1, f12_arg0, f12_arg2, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
			UpdateButtonPromptState( f12_arg1, f12_arg0, f12_arg2, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
			return true
		elseif not IsCACItemLocked( f12_arg1, f12_arg0, f12_arg2 ) and IsCACItemPurchased( f12_arg0, f12_arg2 ) and not IsScorestreakEquipped( f12_arg1, f12_arg0, f12_arg2 ) and not IsInPermanentUnlockMenu( f12_arg2 ) then
			EquipScorestreak( f12_arg1, f12_arg0, f12_arg2 )
			UpdateButtonPromptState( f12_arg1, f12_arg0, f12_arg2, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
			PlaySoundSetSound( self, "equip_item" )
			UpdateButtonPromptState( f12_arg1, f12_arg0, f12_arg2, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
			return true
		elseif not IsCACItemLocked( f12_arg1, f12_arg0, f12_arg2 ) and IsCACItemPurchased( f12_arg0, f12_arg2 ) and not IsInPermanentUnlockMenu( f12_arg2 ) then
			RemoveScorestreak( f12_arg1, f12_arg0, f12_arg2 )
			UpdateButtonPromptState( f12_arg1, f12_arg0, f12_arg2, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
			PlaySoundSetSound( self, "unequip_item" )
			UpdateButtonPromptState( f12_arg1, f12_arg0, f12_arg2, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
			return true
		elseif IsInPermanentUnlockMenu( f12_arg2 ) and not IsPermanentlyUnlocked( f12_arg0, f12_arg2 ) and HavePermanentUnlockTokens( f12_arg2 ) then
			OpenPermanentUnlockClassItemDialog( f12_arg1, f12_arg0, f12_arg2 )
			return true
		else
			
		end
	end, function ( f13_arg0, f13_arg1, f13_arg2 )
		if not IsCACItemLocked( f13_arg1, f13_arg0, f13_arg2 ) and not IsCACItemPurchased( f13_arg0, f13_arg2 ) and not IsCACHaveTokens( f13_arg2 ) and not IsInPermanentUnlockMenu( f13_arg2 ) then
			CoD.Menu.SetButtonLabel( f13_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		elseif not IsCACItemLocked( f13_arg1, f13_arg0, f13_arg2 ) and not IsCACItemPurchased( f13_arg0, f13_arg2 ) and IsCACHaveTokens( f13_arg2 ) and not IsInPermanentUnlockMenu( f13_arg2 ) then
			CoD.Menu.SetButtonLabel( f13_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		elseif not IsCACItemLocked( f13_arg1, f13_arg0, f13_arg2 ) and IsCACItemPurchased( f13_arg0, f13_arg2 ) and not IsScorestreakEquipped( f13_arg1, f13_arg0, f13_arg2 ) and not IsInPermanentUnlockMenu( f13_arg2 ) then
			CoD.Menu.SetButtonLabel( f13_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		elseif not IsCACItemLocked( f13_arg1, f13_arg0, f13_arg2 ) and IsCACItemPurchased( f13_arg0, f13_arg2 ) and not IsInPermanentUnlockMenu( f13_arg2 ) then
			CoD.Menu.SetButtonLabel( f13_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_CLEAR" )
			return true
		elseif IsInPermanentUnlockMenu( f13_arg2 ) and not IsPermanentlyUnlocked( f13_arg0, f13_arg2 ) and HavePermanentUnlockTokens( f13_arg2 ) then
			CoD.Menu.SetButtonLabel( f13_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	f5_local1:AddButtonCallbackFunction( scorestreaks, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, nil, function ( f14_arg0, f14_arg1, f14_arg2, f14_arg3 )
		if not IsCACItemLocked( f14_arg1, f14_arg0, f14_arg2 ) and IsCACItemPurchased( f14_arg0, f14_arg2 ) and IsScorestreakEquipped( f14_arg1, f14_arg0, f14_arg2 ) and not IsInPermanentUnlockMenu( f14_arg2 ) then
			RemoveScorestreak( f14_arg1, f14_arg0, f14_arg2 )
			UpdateButtonPromptState( f14_arg1, f14_arg0, f14_arg2, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
			PlaySoundSetSound( self, "unequip_item" )
			UpdateButtonPromptState( f14_arg1, f14_arg0, f14_arg2, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
			return true
		else
			
		end
	end, function ( f15_arg0, f15_arg1, f15_arg2 )
		if not IsCACItemLocked( f15_arg1, f15_arg0, f15_arg2 ) and IsCACItemPurchased( f15_arg0, f15_arg2 ) and IsScorestreakEquipped( f15_arg1, f15_arg0, f15_arg2 ) and not IsInPermanentUnlockMenu( f15_arg2 ) then
			CoD.Menu.SetButtonLabel( f15_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "" )
			return false
		else
			return false
		end
	end, false )
	self:addElement( scorestreaks )
	self.scorestreaks = scorestreaks
	
	local equippedList = CoD.equippedScoreStreaksList.new( f5_local1, controller )
	equippedList:setLeftRight( false, true, -543, -71 )
	equippedList:setTopBottom( false, true, -207.28, -69.28 )
	equippedList:setAlpha( HideIfInPermanentUnlockMenu( 1 ) )
	self:addElement( equippedList )
	self.equippedList = equippedList
	
	local scorestreaksTitleBox = CoD.scorestreaks_TitleBox.new( f5_local1, controller )
	scorestreaksTitleBox:setLeftRight( true, false, 739, 990 )
	scorestreaksTitleBox:setTopBottom( true, false, 140.72, 175.72 )
	self:addElement( scorestreaksTitleBox )
	self.scorestreaksTitleBox = scorestreaksTitleBox
	
	local scorestreakPreview = CoD.scorestreakPreview.new( f5_local1, controller )
	scorestreakPreview:setLeftRight( true, false, 806, 1128 )
	scorestreakPreview:setTopBottom( true, false, 74.61, 544.39 )
	self:addElement( scorestreakPreview )
	self.scorestreakPreview = scorestreakPreview
	
	local highlightedDescription = LUI.UIText.new()
	highlightedDescription:setLeftRight( false, false, 99, 473 )
	highlightedDescription:setTopBottom( false, false, -180, -158 )
	highlightedDescription:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	highlightedDescription:setLineSpacing( 0.5 )
	highlightedDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	highlightedDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( highlightedDescription )
	self.highlightedDescription = highlightedDescription
	
	local scorestreakRequirementLabel = CoD.scorestreakRequirementLabel.new( f5_local1, controller )
	scorestreakRequirementLabel:setLeftRight( true, false, 1111, 1219 )
	scorestreakRequirementLabel:setTopBottom( true, false, 140.72, 195.72 )
	self:addElement( scorestreakRequirementLabel )
	self.scorestreakRequirementLabel = scorestreakRequirementLabel
	
	local PregameTimerOverlay = CoD.Pregame_TimerOverlay.new( f5_local1, controller )
	PregameTimerOverlay:setLeftRight( true, true, 0, 0 )
	PregameTimerOverlay:setTopBottom( true, true, 0, 0 )
	PregameTimerOverlay:mergeStateConditions( {
		{
			stateName = "ScorestreakSelect",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	PregameTimerOverlay:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.state" ), function ( model )
		f5_local1:updateElementState( PregameTimerOverlay, {
			name = "model_validation",
			menu = f5_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.state"
		} )
	end )
	self:addElement( PregameTimerOverlay )
	self.PregameTimerOverlay = PregameTimerOverlay
	
	local UnlockTokensWidget = CoD.UnlockTokensWidget.new( f5_local1, controller )
	UnlockTokensWidget:setLeftRight( false, true, -362, -123 )
	UnlockTokensWidget:setTopBottom( true, false, 36, 80 )
	UnlockTokensWidget:setAlpha( HideIfInPermanentUnlockMenu( 1 ) )
	UnlockTokensWidget.tokenLabel:setTTF( "fonts/escom.ttf" )
	self:addElement( UnlockTokensWidget )
	self.UnlockTokensWidget = UnlockTokensWidget
	
	local PermanentUnlockTokensWidget = CoD.Prestige_PermanentUnlockTokensWidget.new( f5_local1, controller )
	PermanentUnlockTokensWidget:setLeftRight( false, true, -362, -81 )
	PermanentUnlockTokensWidget:setTopBottom( true, false, 36, 80 )
	PermanentUnlockTokensWidget:setAlpha( ShowIfInPermanentUnlockMenu( 0 ) )
	PermanentUnlockTokensWidget.tokenLabel:setTTF( "fonts/escom.ttf" )
	self:addElement( PermanentUnlockTokensWidget )
	self.PermanentUnlockTokensWidget = PermanentUnlockTokensWidget
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f5_local1, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 86, 703.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local scorestreaksBannedItems = CoD.scorestreaks_Banned_Items.new( f5_local1, controller )
	scorestreaksBannedItems:setLeftRight( true, false, 998, 1207 )
	scorestreaksBannedItems:setTopBottom( true, false, 470.38, 500.38 )
	self:addElement( scorestreaksBannedItems )
	self.scorestreaksBannedItems = scorestreaksBannedItems
	
	scorestreaksTitleBox:linkToElementModel( scorestreaks, nil, false, function ( model )
		scorestreaksTitleBox:setModel( model, controller )
	end )
	scorestreaksTitleBox:linkToElementModel( scorestreaks, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			scorestreaksTitleBox.ScorestreaksLabel:setText( Engine.Localize( GetItemNameFromIndex( itemIndex ) ) )
		end
	end )
	scorestreakPreview:linkToElementModel( scorestreaks, nil, false, function ( model )
		scorestreakPreview:setModel( model, controller )
	end )
	highlightedDescription:linkToElementModel( scorestreaks, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			highlightedDescription:setText( Engine.Localize( GetUnlockDescription( controller, itemIndex ) ) )
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
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Intro = function ()
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
				local f25_local1 = function ( f29_arg0, f29_arg1 )
					if not f29_arg1.interrupted then
						f29_arg0:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Bounce )
					end
					f29_arg0:setAlpha( HideIfInPermanentUnlockMenu( 1 ) )
					if f29_arg1.interrupted then
						self.clipFinished( f29_arg0, f29_arg1 )
					else
						f29_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				equippedList:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
				equippedList:setAlpha( HideIfInPermanentUnlockMenu( 0 ) )
				equippedList:registerEventHandler( "transition_complete_keyframe", f25_local1 )
				local f25_local2 = function ( f30_arg0, f30_arg1 )
					if not f30_arg1.interrupted then
						f30_arg0:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Bounce )
					end
					f30_arg0:setAlpha( 1 )
					if f30_arg1.interrupted then
						self.clipFinished( f30_arg0, f30_arg1 )
					else
						f30_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				scorestreaksTitleBox:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
				scorestreaksTitleBox:setAlpha( 0 )
				scorestreaksTitleBox:registerEventHandler( "transition_complete_keyframe", f25_local2 )
				local f25_local3 = function ( f31_arg0, f31_arg1 )
					if not f31_arg1.interrupted then
						f31_arg0:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Bounce )
					end
					f31_arg0:setAlpha( 1 )
					if f31_arg1.interrupted then
						self.clipFinished( f31_arg0, f31_arg1 )
					else
						f31_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				highlightedDescription:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
				highlightedDescription:setAlpha( 0 )
				highlightedDescription:registerEventHandler( "transition_complete_keyframe", f25_local3 )
			end
		}
	}
	CoD.Menu.AddNavigationHandler( f5_local1, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f32_local0 = nil
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
		ShowHeaderKickerAndIcon( f5_local1 )
		SetHeadingKickerTextToGameMode( "" )
		if not f32_local0 then
			f32_local0 = element:dispatchEventToChildren( event )
		end
		return f32_local0
	end )
	f5_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f33_arg0, f33_arg1, f33_arg2, f33_arg3 )
		GoBack( self, f33_arg2 )
		SaveLoadout( self, f33_arg2 )
		ForceNotifyPregameUpdate( self, f33_arg0, f33_arg2 )
		ClearMenuSavedState( f33_arg1 )
		SetPerControllerTableProperty( f33_arg2, "updateNewBreadcrumbs", true )
		ForceLobbyButtonUpdate( f33_arg2 )
		return true
	end, function ( f34_arg0, f34_arg1, f34_arg2 )
		CoD.Menu.SetButtonLabel( f34_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	f5_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "Y", function ( f35_arg0, f35_arg1, f35_arg2, f35_arg3 )
		RemoveAllScorestreaks( f35_arg1, f35_arg2 )
		PlaySoundSetSound( self, "unequip_item" )
		UpdateAllMenuButtonPrompts( f35_arg1, f35_arg2 )
		return true
	end, function ( f36_arg0, f36_arg1, f36_arg2 )
		CoD.Menu.SetButtonLabel( f36_arg1, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "MENU_CLEAR_ALL" )
		return true
	end, false )
	f5_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LTRIG, "U", function ( f37_arg0, f37_arg1, f37_arg2, f37_arg3 )
		if IsStarterPack( f37_arg2 ) then
			StarterParckPurchase( self, f37_arg2, f37_arg1 )
			return true
		else
			
		end
	end, function ( f38_arg0, f38_arg1, f38_arg2 )
		if IsStarterPack( f38_arg2 ) then
			CoD.Menu.SetButtonLabel( f38_arg1, Enum.LUIButton.LUI_KEY_LTRIG, "PLATFORM_STARTER_PACK_UPGRADE_TITLE" )
			return true
		else
			return false
		end
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
		menu = f5_local1
	} )
	if not self:restoreState() then
		self.scorestreaks:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LeftPanel:close()
		element.FadeForStreamer:close()
		element.scorestreakVignetteContainer:close()
		element.GenericMenuFrame0:close()
		element.scorestreaks:close()
		element.equippedList:close()
		element.scorestreaksTitleBox:close()
		element.scorestreakPreview:close()
		element.scorestreakRequirementLabel:close()
		element.PregameTimerOverlay:close()
		element.UnlockTokensWidget:close()
		element.PermanentUnlockTokensWidget:close()
		element.FEMenuLeftGraphics:close()
		element.scorestreaksBannedItems:close()
		element.highlightedDescription:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Scorestreaks.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

