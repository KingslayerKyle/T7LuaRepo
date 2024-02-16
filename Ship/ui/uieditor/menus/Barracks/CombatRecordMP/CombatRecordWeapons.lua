-- 8c96a896beb6c4fadfe5a4ab424ad76d
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.menus.Barracks.CombatRecordMP.CombatRecordFriendSidebar" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrameIdentityNoFooter" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )
require( "ui.uieditor.widgets.Barracks.CombatRecordStatListItem" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.Barracks.CombatRecordStatHeader" )
require( "ui.uieditor.widgets.Barracks.CombatRecordRightTitleWithBackground" )
require( "ui.uieditor.widgets.PC.Utility.XCamMouseControl" )
require( "ui.uieditor.widgets.Barracks.CombatRecordComparingPlayerInfo" )
require( "ui.uieditor.widgets.Barracks.CombatRecordStatListHeader" )
require( "ui.uieditor.widgets.Barracks.CombatRecordStatDescription" )
require( "ui.uieditor.widgets.CAC.cac_LockBig" )

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
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CombatRecordWeapons.buttonPrompts" )
	local f2_local1 = self
	self.anyChildUsesUpdateState = true
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f2_local1, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 18, 70 )
	FEMenuLeftGraphics:setTopBottom( true, false, 91, 708.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local MenuFrame = CoD.GenericMenuFrameIdentityNoFooter.new( f2_local1, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_WEAPONS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_WEAPONS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_cac" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( f2_local1, controller )
	LeftPanel:setLeftRight( false, false, -576, -272 )
	LeftPanel:setTopBottom( true, true, 88, -43 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local feFooterContainerNOTLobby = CoD.fe_FooterContainer_NOTLobby.new( f2_local1, controller )
	feFooterContainerNOTLobby:setLeftRight( true, true, 1, -1 )
	feFooterContainerNOTLobby:setTopBottom( false, true, -67, 0 )
	feFooterContainerNOTLobby:registerEventHandler( "menu_loaded", function ( element, event )
		local f3_local0 = nil
		SizeToSafeArea( element, controller )
		if not f3_local0 then
			f3_local0 = element:dispatchEventToChildren( event )
		end
		return f3_local0
	end )
	self:addElement( feFooterContainerNOTLobby )
	self.feFooterContainerNOTLobby = feFooterContainerNOTLobby
	
	local ItemList = LUI.UIList.new( f2_local1, controller, 2, 0, nil, false, false, 0, 0, false, false )
	ItemList:makeFocusable()
	ItemList:setLeftRight( false, false, -564, -284 )
	ItemList:setTopBottom( true, false, 157.5, 625.5 )
	ItemList:setWidgetType( CoD.CombatRecordStatListItem )
	ItemList:setVerticalCount( 10 )
	ItemList:setVerticalCounter( CoD.verticalCounter )
	ItemList:setDataSource( "CombatRecordWeaponsList" )
	ItemList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f4_local0 = nil
		CombatRecordShowModelForItemIndex( controller, element )
		return f4_local0
	end )
	ItemList:subscribeToGlobalModel( controller, "OtherPlayerStats", "InProgress", function ( model )
		UpdateDataSource( self, ItemList, controller )
	end )
	self:addElement( ItemList )
	self.ItemList = ItemList
	
	local KillsStat = CoD.CombatRecordStatHeader.new( f2_local1, controller )
	KillsStat:setLeftRight( false, false, -230, -106 )
	KillsStat:setTopBottom( true, false, 179, 235 )
	self:addElement( KillsStat )
	self.KillsStat = KillsStat
	
	local KDStat = CoD.CombatRecordStatHeader.new( f2_local1, controller )
	KDStat:setLeftRight( false, false, -106, -40 )
	KDStat:setTopBottom( true, false, 179, 235 )
	KDStat.StatLabel:setText( Engine.Localize( "MENU_KD_SHORT" ) )
	self:addElement( KDStat )
	self.KDStat = KDStat
	
	local HeadshotsStat = CoD.CombatRecordStatHeader.new( f2_local1, controller )
	HeadshotsStat:setLeftRight( false, false, -40, 84 )
	HeadshotsStat:setTopBottom( false, false, -181, -125 )
	HeadshotsStat.StatLabel:setText( Engine.Localize( "MENU_HEADSHOTS_CAPS" ) )
	self:addElement( HeadshotsStat )
	self.HeadshotsStat = HeadshotsStat
	
	local AccuracyStat = CoD.CombatRecordStatHeader.new( f2_local1, controller )
	AccuracyStat:setLeftRight( false, false, 84, 208 )
	AccuracyStat:setTopBottom( false, false, -181, -125 )
	self:addElement( AccuracyStat )
	self.AccuracyStat = AccuracyStat
	
	local WeaponNameTitle = CoD.CombatRecordRightTitleWithBackground.new( f2_local1, controller )
	WeaponNameTitle:setLeftRight( false, false, -231, -126 )
	WeaponNameTitle:setTopBottom( true, false, 148, 178 )
	self:addElement( WeaponNameTitle )
	self.WeaponNameTitle = WeaponNameTitle
	
	local XCamMouseControl = CoD.XCamMouseControl.new( f2_local1, controller )
	XCamMouseControl:setLeftRight( false, false, -76, 424 )
	XCamMouseControl:setTopBottom( true, true, 225.5, -94.5 )
	self:addElement( XCamMouseControl )
	self.XCamMouseControl = XCamMouseControl
	
	local CombatRecordComparingPlayerInfo = CoD.CombatRecordComparingPlayerInfo.new( f2_local1, controller )
	CombatRecordComparingPlayerInfo:setLeftRight( false, true, -870, -458 )
	CombatRecordComparingPlayerInfo:setTopBottom( true, false, 22, 82 )
	self:addElement( CombatRecordComparingPlayerInfo )
	self.CombatRecordComparingPlayerInfo = CombatRecordComparingPlayerInfo
	
	local CombatRecordStatListHeader = CoD.CombatRecordStatListHeader.new( f2_local1, controller )
	CombatRecordStatListHeader:setLeftRight( true, false, 76, 368 )
	CombatRecordStatListHeader:setTopBottom( true, false, 123, 148 )
	CombatRecordStatListHeader.WeaponLabel:setText( Engine.Localize( "MENU_WEAPON_CAPS" ) )
	CombatRecordStatListHeader.StatComparisonLabel:setText( Engine.Localize( "MENU_KILLS_CAPS" ) )
	CombatRecordStatListHeader.StatLabel:setText( Engine.Localize( "MENU_KILLS_CAPS" ) )
	self:addElement( CombatRecordStatListHeader )
	self.CombatRecordStatListHeader = CombatRecordStatListHeader
	
	local BlackTransition = LUI.UIImage.new()
	BlackTransition:setLeftRight( true, true, 0, 0 )
	BlackTransition:setTopBottom( true, true, 0, 0 )
	BlackTransition:setRGB( 0, 0, 0 )
	BlackTransition:setAlpha( 0 )
	self:addElement( BlackTransition )
	self.BlackTransition = BlackTransition
	
	local PelletAccuracyDescription = CoD.CombatRecordStatDescription.new( f2_local1, controller )
	PelletAccuracyDescription:setLeftRight( true, false, 410, 793 )
	PelletAccuracyDescription:setTopBottom( true, false, 235, 260 )
	PelletAccuracyDescription.StatDescription:setText( Engine.Localize( "MENU_PELLET_ACCURACY_DESC" ) )
	self:addElement( PelletAccuracyDescription )
	self.PelletAccuracyDescription = PelletAccuracyDescription
	
	local LockIcon = CoD.cac_LockBig.new( f2_local1, controller )
	LockIcon:setLeftRight( false, false, 159, 255 )
	LockIcon:setTopBottom( true, false, 14, 684 )
	LockIcon:mergeStateConditions( {
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	LockIcon:linkToElementModel( LockIcon, "isBMClassified", true, function ( model )
		f2_local1:updateElementState( LockIcon, {
			name = "model_validation",
			menu = f2_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		} )
	end )
	self:addElement( LockIcon )
	self.LockIcon = LockIcon
	
	KillsStat:linkToElementModel( ItemList, "statName", true, function ( model )
		local statName = Engine.GetModelValue( model )
		if statName then
			KillsStat.StatLabel:setText( Engine.Localize( statName ) )
		end
	end )
	KillsStat:linkToElementModel( ItemList, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			KillsStat.StatValue:setText( Engine.Localize( CombatRecordGetKillAndOrDestroyStatForItemIndex( controller, itemIndex ) ) )
		end
	end )
	KillsStat:linkToElementModel( ItemList, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			KillsStat.ComparedStatValue:setText( Engine.Localize( CombatRecordGetComparisonKillAndOrDestroyStatForItemIndex( controller, itemIndex ) ) )
		end
	end )
	KDStat:linkToElementModel( ItemList, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			KDStat.StatValue:setText( Engine.Localize( CombatRecordGetKillDestoryRatioForItemIndex( controller, "deathsDuringUse", itemIndex ) ) )
		end
	end )
	KDStat:linkToElementModel( ItemList, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			KDStat.ComparedStatValue:setText( Engine.Localize( CombatRecordGetComparisonKillDestroyRatioForItemIndex( controller, "deaths", itemIndex ) ) )
		end
	end )
	HeadshotsStat:linkToElementModel( ItemList, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			HeadshotsStat:setAlpha( CombatRecordStatHeaderAlpha( controller, itemIndex ) )
		end
	end )
	HeadshotsStat:linkToElementModel( ItemList, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			HeadshotsStat.StatValue:setText( Engine.Localize( CombatRecordGetItemStatForItemIndex( controller, "headshots", itemIndex ) ) )
		end
	end )
	HeadshotsStat:linkToElementModel( ItemList, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			HeadshotsStat.ComparedStatValue:setText( Engine.Localize( CombatRecordGetComparisonItemStatForItemIndex( controller, "headshots", itemIndex ) ) )
		end
	end )
	AccuracyStat:linkToElementModel( ItemList, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			AccuracyStat:setAlpha( CombatRecordStatHeaderAlpha( controller, itemIndex ) )
		end
	end )
	AccuracyStat:linkToElementModel( ItemList, "shotCount", true, function ( model )
		local shotCount = Engine.GetModelValue( model )
		if shotCount then
			AccuracyStat.StatLabel:setText( Engine.Localize( SetValueIfNumberIsLessThanOrEqualTo( 1, "MENU_ACCURACY_CAPS", SetValueIfNumberIsGreaterThanOrEqualTo( 2, "MENU_PELLET_ACCURACY_CAPS", shotCount ) ) ) )
		end
	end )
	AccuracyStat:linkToElementModel( ItemList, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			AccuracyStat.StatValue:setText( FractionToPercentage( CombatRecordGetAccuracyRatioForItemIndex( controller, itemIndex ) ) )
		end
	end )
	AccuracyStat:linkToElementModel( ItemList, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			AccuracyStat.ComparedStatValue:setText( FractionToPercentage( CombatRecordGetComparisonAccuracyRatioForItemIndex( controller, itemIndex ) ) )
		end
	end )
	WeaponNameTitle:linkToElementModel( ItemList, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			WeaponNameTitle.Label:setText( Engine.Localize( name ) )
		end
	end )
	PelletAccuracyDescription:linkToElementModel( ItemList, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			PelletAccuracyDescription:setAlpha( CombatRecordPelletAccuracyAlpha( controller, itemIndex ) )
		end
	end )
	LockIcon:linkToElementModel( ItemList, nil, false, function ( model )
		LockIcon:setModel( model, controller )
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
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
				self:setupElementClipCounter( 4 )
				KDStat:completeAnimation()
				self.KDStat:setScale( 0 )
				self.clipFinished( KDStat, {} )
				HeadshotsStat:completeAnimation()
				self.HeadshotsStat:setLeftRight( false, false, -106, 18 )
				self.HeadshotsStat:setTopBottom( false, false, -181, -125 )
				self.clipFinished( HeadshotsStat, {} )
				AccuracyStat:completeAnimation()
				self.AccuracyStat:setLeftRight( false, false, 18, 142 )
				self.AccuracyStat:setTopBottom( false, false, -181, -125 )
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
		local f29_local0 = self
		local f29_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "CombatRecordComparing"
		}
		CoD.Menu.UpdateButtonShownState( f29_local0, f2_local1, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "OtherPlayerStats.InProgress" ), function ( model )
		local f30_local0 = self
		local f30_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "OtherPlayerStats.InProgress"
		}
		CoD.Menu.UpdateButtonShownState( f30_local0, f2_local1, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "OtherPlayerStats.Success" ), function ( model )
		local f31_local0 = self
		local f31_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "OtherPlayerStats.Success"
		}
		CoD.Menu.UpdateButtonShownState( f31_local0, f2_local1, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f32_local0 = nil
		SendClientScriptMenuChangeNotify( controller, f2_local1, true )
		ShowHeaderKickerAndIcon( f2_local1 )
		CombatRecordSetHeadingKickerTextToCombatRecordMode( "" )
		CombatRecordUpdateSelfIdentityWidget( self, controller )
		if not f32_local0 then
			f32_local0 = element:dispatchEventToChildren( event )
		end
		return f32_local0
	end )
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f33_arg0, f33_arg1, f33_arg2, f33_arg3 )
		SendClientScriptMenuChangeNotify( f33_arg2, f33_arg1, false )
		CombatRecordSetComparing( self, f33_arg2, false )
		GoBack( self, f33_arg2 )
		ClearMenuSavedState( f33_arg1 )
		SendClientScriptNotifyForAdjustedClient( f33_arg2, "CustomClass_closed", "" )
		return true
	end, function ( f34_arg0, f34_arg1, f34_arg2 )
		CoD.Menu.SetButtonLabel( f34_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, function ( f35_arg0, f35_arg1, f35_arg2, f35_arg3 )
		return true
	end, function ( f36_arg0, f36_arg1, f36_arg2 )
		CoD.Menu.SetButtonLabel( f36_arg1, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "PLATFORM_EMBLEM_ROTATE_LAYER" )
		return true
	end, false )
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "F", function ( f37_arg0, f37_arg1, f37_arg2, f37_arg3 )
		if EnableCombatRecordCompare( f37_arg2 ) and not IsCombatRecordForRemotePlayer() then
			OpenPopup( self, "CombatRecordFriendSidebar", f37_arg2, "", "" )
			return true
		elseif EnableCombatRecordCompare( f37_arg2 ) and IsCombatRecordForRemotePlayer() then
			CombatRecordSetComparing( self, f37_arg2, true )
			CombatRecordCompareAgainstLocalPlayer( f37_arg2 )
			UpdateElementDataSource( self, "ItemList" )
			return true
		else
			
		end
	end, function ( f38_arg0, f38_arg1, f38_arg2 )
		if EnableCombatRecordCompare( f38_arg2 ) and not IsCombatRecordForRemotePlayer() then
			CoD.Menu.SetButtonLabel( f38_arg1, Enum.LUIButton.LUI_KEY_START, "MENU_COMPARE" )
			return true
		elseif EnableCombatRecordCompare( f38_arg2 ) and IsCombatRecordForRemotePlayer() then
			CoD.Menu.SetButtonLabel( f38_arg1, Enum.LUIButton.LUI_KEY_START, "MENU_COMPARE" )
			return true
		else
			return false
		end
	end, false )
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "C", function ( f39_arg0, f39_arg1, f39_arg2, f39_arg3 )
		if IsComparingStats( f39_arg2 ) then
			CombatRecordSetComparing( self, f39_arg2, false )
			return true
		else
			
		end
	end, function ( f40_arg0, f40_arg1, f40_arg2 )
		if IsComparingStats( f40_arg2 ) then
			CoD.Menu.SetButtonLabel( f40_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_CLEAR_COMPARE" )
			return true
		else
			return false
		end
	end, false )
	MenuFrame:setModel( self.buttonModel, controller )
	feFooterContainerNOTLobby:setModel( self.buttonModel, controller )
	ItemList.id = "ItemList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f2_local1
	} )
	if not self:restoreState() then
		self.ItemList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEMenuLeftGraphics:close()
		element.MenuFrame:close()
		element.LeftPanel:close()
		element.feFooterContainerNOTLobby:close()
		element.ItemList:close()
		element.KillsStat:close()
		element.KDStat:close()
		element.HeadshotsStat:close()
		element.AccuracyStat:close()
		element.WeaponNameTitle:close()
		element.XCamMouseControl:close()
		element.CombatRecordComparingPlayerInfo:close()
		element.CombatRecordStatListHeader:close()
		element.PelletAccuracyDescription:close()
		element.LockIcon:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CombatRecordWeapons.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

