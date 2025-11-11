require( "ui.uieditor.menus.Barracks.CombatRecordMP.CombatRecordFriendSidebar" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrameIdentity" )
require( "ui.uieditor.widgets.Barracks.CombatRecordComparingPlayerInfo" )
require( "ui.uieditor.widgets.Barracks.CombatRecordRightTitleWithBackground" )
require( "ui.uieditor.widgets.Barracks.CombatRecordStatHeader" )
require( "ui.uieditor.widgets.Barracks.CombatRecordStatListHeader" )
require( "ui.uieditor.widgets.Barracks.CombatRecordStatListItem" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.PC.Utility.XCamMouseControl" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )

local PreLoadFunc = function ( self, controller )
	self.disablePopupOpenCloseAnim = true
end

LUI.createMenu.CombatRecordWeapons = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CombatRecordWeapons" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CombatRecordWeapons.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( 0.5, 0.5, -864, -408 )
	LeftPanel:setTopBottom( 0, 1, 132, -64 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( 0, 0, 27, 105 )
	FEMenuLeftGraphics:setTopBottom( 0, 0, 136, 1062 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local MenuFrame = CoD.GenericMenuFrameIdentity.new( self, controller )
	MenuFrame:setLeftRight( 0, 1, 0, 0 )
	MenuFrame:setTopBottom( 0, 1, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_WEAPONS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_WEAPONS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_cac" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local ItemList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	ItemList:makeFocusable()
	ItemList:setLeftRight( 0.5, 0.5, -846, -426 )
	ItemList:setTopBottom( 0, 0, 243, 931 )
	ItemList:setWidgetType( CoD.CombatRecordStatListItem )
	ItemList:setVerticalCount( 10 )
	ItemList:setVerticalCounter( CoD.verticalCounter )
	ItemList:setDataSource( "CombatRecordWeaponsList" )
	ItemList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		CombatRecordShowModelForItemIndex( controller, element )
		return retVal
	end )
	ItemList:subscribeToGlobalModel( controller, "OtherPlayerStats", "InProgress", function ( model )
		local element = ItemList
		UpdateDataSource( self, element, controller )
	end )
	self:addElement( ItemList )
	self.ItemList = ItemList
	
	local KillsStat = CoD.CombatRecordStatHeader.new( self, controller )
	KillsStat:setLeftRight( 0.5, 0.5, -345, -159 )
	KillsStat:setTopBottom( 0, 0, 268, 352 )
	KillsStat.StatLabel:setText( Engine.Localize( "MENU_KILLS_CAPS" ) )
	self:addElement( KillsStat )
	self.KillsStat = KillsStat
	
	local KDStat = CoD.CombatRecordStatHeader.new( self, controller )
	KDStat:setLeftRight( 0.5, 0.5, -159, -60 )
	KDStat:setTopBottom( 0, 0, 268, 352 )
	KDStat.StatLabel:setText( Engine.Localize( "MENU_KD_SHORT" ) )
	self:addElement( KDStat )
	self.KDStat = KDStat
	
	local HeadshotsStat = CoD.CombatRecordStatHeader.new( self, controller )
	HeadshotsStat:setLeftRight( 0.5, 0.5, -60, 126 )
	HeadshotsStat:setTopBottom( 0.5, 0.5, -272, -188 )
	HeadshotsStat.StatLabel:setText( Engine.Localize( "MENU_HEADSHOTS_CAPS" ) )
	self:addElement( HeadshotsStat )
	self.HeadshotsStat = HeadshotsStat
	
	local AccuracyStat = CoD.CombatRecordStatHeader.new( self, controller )
	AccuracyStat:setLeftRight( 0.5, 0.5, 126, 312 )
	AccuracyStat:setTopBottom( 0.5, 0.5, -272, -188 )
	AccuracyStat.StatLabel:setText( Engine.Localize( "MENU_ACCURACY_CAPS" ) )
	self:addElement( AccuracyStat )
	self.AccuracyStat = AccuracyStat
	
	local WeaponNameTitle = CoD.CombatRecordRightTitleWithBackground.new( self, controller )
	WeaponNameTitle:setLeftRight( 0.5, 0.5, -347, -189 )
	WeaponNameTitle:setTopBottom( 0, 0, 222, 267 )
	self:addElement( WeaponNameTitle )
	self.WeaponNameTitle = WeaponNameTitle
	
	local XCamMouseControl = CoD.XCamMouseControl.new( self, controller )
	XCamMouseControl:setLeftRight( 0.5, 0.5, -114, 636 )
	XCamMouseControl:setTopBottom( 0, 1, 338, -142 )
	self:addElement( XCamMouseControl )
	self.XCamMouseControl = XCamMouseControl
	
	local CombatRecordComparingPlayerInfo = CoD.CombatRecordComparingPlayerInfo.new( self, controller )
	CombatRecordComparingPlayerInfo:setLeftRight( 1, 1, -1305, -687 )
	CombatRecordComparingPlayerInfo:setTopBottom( 0, 0, 33, 123 )
	self:addElement( CombatRecordComparingPlayerInfo )
	self.CombatRecordComparingPlayerInfo = CombatRecordComparingPlayerInfo
	
	local CombatRecordStatListHeader = CoD.CombatRecordStatListHeader.new( self, controller )
	CombatRecordStatListHeader:setLeftRight( 0, 0, 114, 552 )
	CombatRecordStatListHeader:setTopBottom( 0, 0, 184, 222 )
	CombatRecordStatListHeader.WeaponLabel:setText( Engine.Localize( "MENU_WEAPON_CAPS" ) )
	CombatRecordStatListHeader.StatComparisonLabel:setText( Engine.Localize( "MENU_KILLS_CAPS" ) )
	CombatRecordStatListHeader.StatLabel:setText( Engine.Localize( "MENU_KILLS_CAPS" ) )
	self:addElement( CombatRecordStatListHeader )
	self.CombatRecordStatListHeader = CombatRecordStatListHeader
	
	local BlackTransition = LUI.UIImage.new()
	BlackTransition:setLeftRight( 0, 1, 0, 0 )
	BlackTransition:setTopBottom( 0, 1, 0, 0 )
	BlackTransition:setRGB( 0, 0, 0 )
	BlackTransition:setAlpha( 0 )
	self:addElement( BlackTransition )
	self.BlackTransition = BlackTransition
	
	KillsStat:linkToElementModel( ItemList, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			KillsStat.StatValue:setText( Engine.Localize( CombatRecordGetKillAndOrDestroyStatForItemIndex( controller, modelValue ) ) )
		end
	end )
	KillsStat:linkToElementModel( ItemList, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			KillsStat.ComparedStatValue:setText( Engine.Localize( CombatRecordGetComparisonKillAndOrDestroyStatForItemIndex( controller, modelValue ) ) )
		end
	end )
	KDStat:linkToElementModel( ItemList, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			KDStat.StatValue:setText( Engine.Localize( CombatRecordGetKillDestoryRatioForItemIndex( controller, "deathsDuringUse", modelValue ) ) )
		end
	end )
	KDStat:linkToElementModel( ItemList, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			KDStat.ComparedStatValue:setText( Engine.Localize( CombatRecordGetComparisonKillDestroyRatioForItemIndex( controller, "deaths", modelValue ) ) )
		end
	end )
	HeadshotsStat:linkToElementModel( ItemList, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			HeadshotsStat:setAlpha( CombatRecordStatHeaderAlpha( controller, modelValue ) )
		end
	end )
	HeadshotsStat:linkToElementModel( ItemList, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			HeadshotsStat.StatValue:setText( Engine.Localize( CombatRecordGetItemStatForItemIndex( controller, "headshots", modelValue ) ) )
		end
	end )
	HeadshotsStat:linkToElementModel( ItemList, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			HeadshotsStat.ComparedStatValue:setText( Engine.Localize( CombatRecordGetComparisonItemStatForItemIndex( controller, "headshots", modelValue ) ) )
		end
	end )
	AccuracyStat:linkToElementModel( ItemList, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			AccuracyStat:setAlpha( CombatRecordStatHeaderAlpha( controller, modelValue ) )
		end
	end )
	AccuracyStat:linkToElementModel( ItemList, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			AccuracyStat.StatValue:setText( FractionToPercentage( CombatRecordGetTwoStatRatioForItemIndex( controller, "hits", "shots", modelValue ) ) )
		end
	end )
	AccuracyStat:linkToElementModel( ItemList, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			AccuracyStat.ComparedStatValue:setText( FractionToPercentage( CombatRecordGetComparisonTwoStatRatioForItemIndex( controller, "hits", "shots", modelValue ) ) )
		end
	end )
	WeaponNameTitle:linkToElementModel( ItemList, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			WeaponNameTitle.Label:setText( Engine.Localize( modelValue ) )
		end
	end )
	MenuFrame.navigation = {
		left = ItemList,
		down = ItemList
	}
	ItemList.navigation = {
		up = MenuFrame,
		right = MenuFrame
	}
	self.resetProperties = function ()
		BlackTransition:completeAnimation()
		HeadshotsStat:completeAnimation()
		AccuracyStat:completeAnimation()
		KDStat:completeAnimation()
		BlackTransition:setAlpha( 0 )
		HeadshotsStat:setLeftRight( 0.5, 0.5, -60, 126 )
		HeadshotsStat:setTopBottom( 0.5, 0.5, -272, -188 )
		AccuracyStat:setLeftRight( 0.5, 0.5, 126, 312 )
		AccuracyStat:setTopBottom( 0.5, 0.5, -272, -188 )
		KDStat:setScale( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local BlackTransitionFrame2 = function ( BlackTransition, event )
					if not event.interrupted then
						BlackTransition:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Linear )
					end
					BlackTransition:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( BlackTransition, event )
					else
						BlackTransition:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BlackTransition:completeAnimation()
				self.BlackTransition:setAlpha( 1 )
				BlackTransitionFrame2( BlackTransition, {} )
			end
		},
		Campaign = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				KDStat:completeAnimation()
				self.KDStat:setScale( 0 )
				self.clipFinished( KDStat, {} )
				HeadshotsStat:completeAnimation()
				self.HeadshotsStat:setLeftRight( 0.5, 0.5, -159, 27 )
				self.HeadshotsStat:setTopBottom( 0.5, 0.5, -272, -188 )
				self.clipFinished( HeadshotsStat, {} )
				AccuracyStat:completeAnimation()
				self.AccuracyStat:setLeftRight( 0.5, 0.5, 27, 213 )
				self.AccuracyStat:setTopBottom( 0.5, 0.5, -272, -188 )
				self.clipFinished( AccuracyStat, {} )
				local BlackTransitionFrame2 = function ( BlackTransition, event )
					if not event.interrupted then
						BlackTransition:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					BlackTransition:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( BlackTransition, event )
					else
						BlackTransition:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BlackTransition:completeAnimation()
				self.BlackTransition:setAlpha( 1 )
				BlackTransitionFrame2( BlackTransition, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Campaign",
			condition = function ( menu, element, event )
				return IsCampaignCombatRecordMode()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CombatRecordComparing" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "CombatRecordComparing"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "OtherPlayerStats.InProgress" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "OtherPlayerStats.InProgress"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "OtherPlayerStats.Success" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "OtherPlayerStats.Success"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SendClientScriptMenuChangeNotify( controller, self, true )
		ShowHeaderKickerAndIcon( self )
		CombatRecordSetHeadingKickerTextToCombatRecordMode( "" )
		CombatRecordUpdateSelfIdentityWidget( self, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		SendClientScriptMenuChangeNotify( controller, menu, false )
		CombatRecordSetComparing( self, controller, false )
		GoBack( self, controller )
		ClearMenuSavedState( menu )
		SendClientScriptNotifyForAdjustedClient( controller, "CustomClass_closed", "" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "PLATFORM_EMBLEM_ROTATE_LAYER", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "F", function ( element, menu, controller, model )
		if EnableCombatRecordCompare( controller ) and not IsCombatRecordForRemotePlayer() then
			OpenPopup( self, "CombatRecordFriendSidebar", controller, "", "" )
			return true
		elseif EnableCombatRecordCompare( controller ) and IsCombatRecordForRemotePlayer() then
			CombatRecordSetComparing( self, controller, true )
			CombatRecordCompareAgainstLocalPlayer( controller )
			UpdateElementDataSource( self, "ItemList" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if EnableCombatRecordCompare( controller ) and not IsCombatRecordForRemotePlayer() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_COMPARE", nil )
			return true
		elseif EnableCombatRecordCompare( controller ) and IsCombatRecordForRemotePlayer() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_COMPARE", nil )
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "C", function ( element, menu, controller, model )
		if IsComparingStats( controller ) then
			CombatRecordSetComparing( self, controller, false )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsComparingStats( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_CLEAR_COMPARE", nil )
			return true
		else
			return false
		end
	end, false )
	MenuFrame:setModel( self.buttonModel, controller )
	MenuFrame.id = "MenuFrame"
	ItemList.id = "ItemList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.ItemList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LeftPanel:close()
		self.FEMenuLeftGraphics:close()
		self.MenuFrame:close()
		self.ItemList:close()
		self.KillsStat:close()
		self.KDStat:close()
		self.HeadshotsStat:close()
		self.AccuracyStat:close()
		self.WeaponNameTitle:close()
		self.XCamMouseControl:close()
		self.CombatRecordComparingPlayerInfo:close()
		self.CombatRecordStatListHeader:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CombatRecordWeapons.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

