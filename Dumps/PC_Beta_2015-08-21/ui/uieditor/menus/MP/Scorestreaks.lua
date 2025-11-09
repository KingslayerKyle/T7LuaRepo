require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreakVignetteContainer" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.menus.CAC.Popups.OutOfUnlockTokens" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreakButton" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.equippedScoreStreaksList" )
require( "ui.uieditor.widgets.Scorestreaks.scorestreaks_TitleBox" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreakPreview" )
require( "ui.uieditor.widgets.Scorestreaks.scorestreaks_ElementSide" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreakRequirementLabel" )
require( "ui.uieditor.widgets.Pregame.Pregame_TimerOverlay" )
require( "ui.uieditor.widgets.CAC.UnlockTokensWidget" )

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
	local f3_local0 = Engine.CreateModel( Engine.GetModelForController( controller ), "ScorestreaksClass" )
	CoD.CACUtility.GetCustomClassModel( controller, 0, f3_local0 )
	self:setModel( f3_local0 )
	CoD.perController[controller].classModel = f3_local0
	CoD.perController[controller].weaponCategory = "killstreak1"
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ()
		Engine.UnsubscribeAndFreeModel( f3_local0 )
	end )
	if not CoD.UnlockablesTable then
		CoD.UnlockablesTable = CoD.GetUnlockablesTable( controller )
	end
	CoD.CACUtility.CreateUnlockTokenModels( controller )
end

LUI.createMenu.Scorestreaks = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Scorestreaks" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC_EditLoadout"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Scorestreaks.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local tempBackgroud = LUI.UIImage.new()
	tempBackgroud:setLeftRight( true, true, 0, 0 )
	tempBackgroud:setTopBottom( true, true, 0, 0 )
	tempBackgroud:setRGB( 0.18, 0.18, 0.18 )
	tempBackgroud:setAlpha( 0.45 )
	tempBackgroud:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	tempBackgroud:setShaderVector( 0, 4, 1, 0, 0 )
	self:addElement( tempBackgroud )
	self.tempBackgroud = tempBackgroud
	
	local scorestreakVignetteContainer = CoD.scorestreakVignetteContainer.new( self, controller )
	scorestreakVignetteContainer:setLeftRight( true, false, 0, 1280 )
	scorestreakVignetteContainer:setTopBottom( true, false, 0, 720 )
	self:addElement( scorestreakVignetteContainer )
	self.scorestreakVignetteContainer = scorestreakVignetteContainer
	
	local GenericMenuFrame0 = CoD.GenericMenuFrame.new( self, controller )
	GenericMenuFrame0:setLeftRight( true, true, 0, 0 )
	GenericMenuFrame0:setTopBottom( true, true, 0, 0 )
	GenericMenuFrame0.titleLabel:setText( Engine.Localize( LocalizeToUpperString( "MENU_SCORE_STREAKS_CAPS" ) ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_SCORE_STREAKS_CAPS" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_scorestreak" ) )
	self:addElement( GenericMenuFrame0 )
	self.GenericMenuFrame0 = GenericMenuFrame0
	
	local scorestreaks = LUI.UIList.new( self, controller, 7, 0, nil, true, false, 0, 0, false, false )
	scorestreaks:makeFocusable()
	scorestreaks:setLeftRight( true, false, 76, 704 )
	scorestreaks:setTopBottom( true, false, 124.72, 625.72 )
	scorestreaks:setDataSource( "ScorestreaksList" )
	scorestreaks:setWidgetType( CoD.scorestreakButton )
	scorestreaks:setHorizontalCount( 5 )
	scorestreaks:setVerticalCount( 4 )
	scorestreaks:setSpacing( 7 )
	scorestreaks:linkToElementModel( scorestreaks, "itemIndex", true, function ( model )
		local f6_local0 = scorestreaks
		local f6_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		}
		CoD.Menu.UpdateButtonShownState( f6_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( f6_local0, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	scorestreaks:registerEventHandler( "gain_focus", function ( element, event )
		local f7_local0 = nil
		if element.gainFocus then
			f7_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f7_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		return f7_local0
	end )
	scorestreaks:registerEventHandler( "lose_focus", function ( element, event )
		local f8_local0 = nil
		if element.loseFocus then
			f8_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f8_local0 = element.super:loseFocus( event )
		end
		return f8_local0
	end )
	self:AddButtonCallbackFunction( scorestreaks, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsCACItemLocked( menu, element, controller ) and not IsCACItemPurchased( element, controller ) and not IsCACHaveTokens( controller ) then
			SetUnlockConfirmationInfo( element, controller )
			OpenPopup( self, "OutOfUnlockTokens", controller )
			UpdateButtonPromptState( menu, element, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
			return true
		elseif not IsCACItemLocked( menu, element, controller ) and not IsCACItemPurchased( element, controller ) and IsCACHaveTokens( controller ) then
			OpenUnlockClassItemDialog( menu, element, controller )
			UpdateButtonPromptState( menu, element, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
			UpdateButtonPromptState( menu, element, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
			return true
		elseif not IsCACItemLocked( menu, element, controller ) and IsCACItemPurchased( element, controller ) and not IsScorestreakEquipped( menu, element, controller ) then
			EquipScorestreak( menu, element, controller )
			UpdateButtonPromptState( menu, element, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
			PlaySoundSetSound( self, "equip_item" )
			UpdateButtonPromptState( menu, element, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
			return true
		elseif not IsCACItemLocked( menu, element, controller ) and IsCACItemPurchased( element, controller ) then
			RemoveScorestreak( menu, element, controller )
			UpdateButtonPromptState( menu, element, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
			PlaySoundSetSound( self, "unequip_item" )
			UpdateButtonPromptState( menu, element, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsCACItemLocked( menu, element, controller ) and not IsCACItemPurchased( element, controller ) and not IsCACHaveTokens( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		elseif not IsCACItemLocked( menu, element, controller ) and not IsCACItemPurchased( element, controller ) and IsCACHaveTokens( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		elseif not IsCACItemLocked( menu, element, controller ) and IsCACItemPurchased( element, controller ) and not IsScorestreakEquipped( menu, element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		elseif not IsCACItemLocked( menu, element, controller ) and IsCACItemPurchased( element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_CLEAR" )
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( scorestreaks, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, nil, function ( element, menu, controller, model )
		if not IsCACItemLocked( menu, element, controller ) and IsCACItemPurchased( element, controller ) and IsScorestreakEquipped( menu, element, controller ) then
			RemoveScorestreak( menu, element, controller )
			UpdateButtonPromptState( menu, element, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
			PlaySoundSetSound( self, "unequip_item" )
			UpdateButtonPromptState( menu, element, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "" )
		if not IsCACItemLocked( menu, element, controller ) and IsCACItemPurchased( element, controller ) and IsScorestreakEquipped( menu, element, controller ) then
			return false
		else
			return false
		end
	end, false )
	self:addElement( scorestreaks )
	self.scorestreaks = scorestreaks
	
	local equippedList = CoD.equippedScoreStreaksList.new( self, controller )
	equippedList:setLeftRight( false, true, -543, -71 )
	equippedList:setTopBottom( false, true, -214.62, -76.62 )
	self:addElement( equippedList )
	self.equippedList = equippedList
	
	local scorestreaksTitleBox = CoD.scorestreaks_TitleBox.new( self, controller )
	scorestreaksTitleBox:setLeftRight( true, false, 739, 990 )
	scorestreaksTitleBox:setTopBottom( true, false, 124.72, 159.72 )
	self:addElement( scorestreaksTitleBox )
	self.scorestreaksTitleBox = scorestreaksTitleBox
	
	local scorestreakPreview = CoD.scorestreakPreview.new( self, controller )
	scorestreakPreview:setLeftRight( true, false, 812, 1134 )
	scorestreakPreview:setTopBottom( true, false, 82.61, 552.39 )
	self:addElement( scorestreakPreview )
	self.scorestreakPreview = scorestreakPreview
	
	local highlightedDescription = LUI.UIText.new()
	highlightedDescription:setLeftRight( false, false, 99, 473 )
	highlightedDescription:setTopBottom( false, false, -196, -174 )
	highlightedDescription:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	highlightedDescription:setLineSpacing( 0.5 )
	highlightedDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	highlightedDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( highlightedDescription )
	self.highlightedDescription = highlightedDescription
	
	local scorestreaksElementSide = CoD.scorestreaks_ElementSide.new( self, controller )
	scorestreaksElementSide:setLeftRight( true, false, 37, 73 )
	scorestreaksElementSide:setTopBottom( true, false, 123.11, 637.61 )
	self:addElement( scorestreaksElementSide )
	self.scorestreaksElementSide = scorestreaksElementSide
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, -12, 1292 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local scorestreakRequirementLabel = CoD.scorestreakRequirementLabel.new( self, controller )
	scorestreakRequirementLabel:setLeftRight( true, false, 1111, 1219 )
	scorestreakRequirementLabel:setTopBottom( true, false, 124.72, 179.72 )
	self:addElement( scorestreakRequirementLabel )
	self.scorestreakRequirementLabel = scorestreakRequirementLabel
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( false, true, -71, -35 )
	Image4:setTopBottom( true, false, 174.11, 177.61 )
	Image4:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local Image5 = LUI.UIImage.new()
	Image5:setLeftRight( false, true, -71, -35 )
	Image5:setTopBottom( true, false, 123.39, 126.89 )
	Image5:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image5:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image5 )
	self.Image5 = Image5
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( false, true, -71, -35 )
	Image1:setTopBottom( false, true, -93.39, -89.89 )
	Image1:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image40 = LUI.UIImage.new()
	Image40:setLeftRight( false, true, -71, -35 )
	Image40:setTopBottom( false, true, -188.39, -184.89 )
	Image40:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image40:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image40 )
	self.Image40 = Image40
	
	local PregameTimerOverlay = CoD.Pregame_TimerOverlay.new( self, controller )
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
		self:updateElementState( PregameTimerOverlay, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.state"
		} )
	end )
	self:addElement( PregameTimerOverlay )
	self.PregameTimerOverlay = PregameTimerOverlay
	
	local UnlockTokensWidget = CoD.UnlockTokensWidget.new( self, controller )
	UnlockTokensWidget:setLeftRight( false, true, -362, -123 )
	UnlockTokensWidget:setTopBottom( true, false, 36, 80 )
	UnlockTokensWidget.tokenLabel:setTTF( "fonts/escom.ttf" )
	self:addElement( UnlockTokensWidget )
	self.UnlockTokensWidget = UnlockTokensWidget
	
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
				self:setupElementClipCounter( 5 )
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
				local f21_local1 = function ( f25_arg0, f25_arg1 )
					if not f25_arg1.interrupted then
						f25_arg0:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Bounce )
					end
					f25_arg0:setAlpha( 1 )
					if f25_arg1.interrupted then
						self.clipFinished( f25_arg0, f25_arg1 )
					else
						f25_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				equippedList:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
				equippedList:setAlpha( 0 )
				equippedList:registerEventHandler( "transition_complete_keyframe", f21_local1 )
				local f21_local2 = function ( f26_arg0, f26_arg1 )
					if not f26_arg1.interrupted then
						f26_arg0:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Bounce )
					end
					f26_arg0:setAlpha( 1 )
					if f26_arg1.interrupted then
						self.clipFinished( f26_arg0, f26_arg1 )
					else
						f26_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				scorestreaksTitleBox:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
				scorestreaksTitleBox:setAlpha( 0 )
				scorestreaksTitleBox:registerEventHandler( "transition_complete_keyframe", f21_local2 )
				local f21_local3 = function ( f27_arg0, f27_arg1 )
					if not f27_arg1.interrupted then
						f27_arg0:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Bounce )
					end
					f27_arg0:setAlpha( 1 )
					if f27_arg1.interrupted then
						self.clipFinished( f27_arg0, f27_arg1 )
					else
						f27_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				highlightedDescription:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
				highlightedDescription:setAlpha( 0 )
				highlightedDescription:registerEventHandler( "transition_complete_keyframe", f21_local3 )
				local CategoryListLineFrame2 = function ( CategoryListLine, event )
					if not event.interrupted then
						CategoryListLine:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
					end
					CategoryListLine:setLeftRight( true, false, -12, 1292 )
					CategoryListLine:setTopBottom( true, false, 80, 88 )
					if event.interrupted then
						self.clipFinished( CategoryListLine, event )
					else
						CategoryListLine:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CategoryListLine:completeAnimation()
				self.CategoryListLine:setLeftRight( true, false, -10, 10 )
				self.CategoryListLine:setTopBottom( true, false, 80, 88 )
				CategoryListLineFrame2( CategoryListLine, {} )
			end
		}
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f29_local0 = nil
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
		if not f29_local0 then
			f29_local0 = self:dispatchEventToChildren( event )
		end
		return f29_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		SaveLoadout( self, controller )
		ForceNotifyPregameUpdate( self, element, controller )
		ClearMenuSavedState( menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "Y", function ( element, menu, controller, model )
		RemoveAllScorestreaks( menu, controller )
		PlaySoundSetSound( self, "unequip_item" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "MENU_CLEAR_ALL" )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.scorestreakVignetteContainer:close()
		element.GenericMenuFrame0:close()
		element.scorestreaks:close()
		element.equippedList:close()
		element.scorestreaksTitleBox:close()
		element.scorestreakPreview:close()
		element.scorestreaksElementSide:close()
		element.scorestreakRequirementLabel:close()
		element.PregameTimerOverlay:close()
		element.UnlockTokensWidget:close()
		element.highlightedDescription:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Scorestreaks.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

