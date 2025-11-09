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
require( "ui.uieditor.widgets.Barracks.CombatRecordStatDescription" )

LUI.createMenu.CombatRecordWeaponsZM = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CombatRecordWeaponsZM" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CombatRecordWeaponsZM.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 18, 70 )
	FEMenuLeftGraphics:setTopBottom( true, false, 91, 708.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local MenuFrame = CoD.GenericMenuFrameIdentityNoFooter.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_WEAPONS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_WEAPONS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_cac" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( true, false, 64, 368 )
	LeftPanel:setTopBottom( true, false, 88, 677 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local feFooterContainerNOTLobby = CoD.fe_FooterContainer_NOTLobby.new( self, controller )
	feFooterContainerNOTLobby:setLeftRight( true, true, 1, -1 )
	feFooterContainerNOTLobby:setTopBottom( false, true, -67, 0 )
	feFooterContainerNOTLobby:registerEventHandler( "menu_loaded", function ( element, event )
		local f2_local0 = nil
		SizeToSafeArea( element, controller )
		if not f2_local0 then
			f2_local0 = element:dispatchEventToChildren( event )
		end
		return f2_local0
	end )
	self:addElement( feFooterContainerNOTLobby )
	self.feFooterContainerNOTLobby = feFooterContainerNOTLobby
	
	local ItemList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	ItemList:makeFocusable()
	ItemList:setLeftRight( true, false, 76, 356 )
	ItemList:setTopBottom( true, false, 157.5, 625.5 )
	ItemList:setWidgetType( CoD.CombatRecordStatListItem )
	ItemList:setVerticalCount( 10 )
	ItemList:setVerticalCounter( CoD.verticalCounter )
	ItemList:setDataSource( "CombatRecordWeaponsList" )
	ItemList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f3_local0 = nil
		CombatRecordShowModelForItemIndex( controller, element )
		return f3_local0
	end )
	ItemList:subscribeToGlobalModel( controller, "OtherPlayerStats", "InProgress", function ( model )
		UpdateDataSource( self, ItemList, controller )
	end )
	self:addElement( ItemList )
	self.ItemList = ItemList
	
	local WeaponLabel = LUI.UITightText.new()
	WeaponLabel:setLeftRight( true, false, 76, 136 )
	WeaponLabel:setTopBottom( true, false, 123, 148 )
	WeaponLabel:setText( Engine.Localize( "MENU_WEAPON_CAPS" ) )
	WeaponLabel:setTTF( "fonts/default.ttf" )
	self:addElement( WeaponLabel )
	self.WeaponLabel = WeaponLabel
	
	local StatLabel = LUI.UIText.new()
	StatLabel:setLeftRight( true, false, 242, 424 )
	StatLabel:setTopBottom( true, false, 123, 148 )
	StatLabel:setText( Engine.Localize( "MENU_KILLS_CAPS" ) )
	StatLabel:setTTF( "fonts/default.ttf" )
	StatLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	StatLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( StatLabel )
	self.StatLabel = StatLabel
	
	local KillsStat = CoD.CombatRecordStatHeader.new( self, controller )
	KillsStat:setLeftRight( false, false, -230, -106 )
	KillsStat:setTopBottom( false, false, -181, -125 )
	KillsStat.StatLabel:setText( Engine.Localize( "MENU_KILLS_CAPS" ) )
	self:addElement( KillsStat )
	self.KillsStat = KillsStat
	
	local HeadshotsStat = CoD.CombatRecordStatHeader.new( self, controller )
	HeadshotsStat:setLeftRight( false, false, -106, 18 )
	HeadshotsStat:setTopBottom( false, false, -181, -125 )
	HeadshotsStat.StatLabel:setText( Engine.Localize( "MENU_HEADSHOTS_CAPS" ) )
	self:addElement( HeadshotsStat )
	self.HeadshotsStat = HeadshotsStat
	
	local AccuracyStat = CoD.CombatRecordStatHeader.new( self, controller )
	AccuracyStat:setLeftRight( false, false, 18, 142 )
	AccuracyStat:setTopBottom( false, false, -181, -125 )
	self:addElement( AccuracyStat )
	self.AccuracyStat = AccuracyStat
	
	local WeaponNameTitle = CoD.CombatRecordRightTitleWithBackground.new( self, controller )
	WeaponNameTitle:setLeftRight( false, true, -871, -761 )
	WeaponNameTitle:setTopBottom( true, false, 147.5, 177.5 )
	self:addElement( WeaponNameTitle )
	self.WeaponNameTitle = WeaponNameTitle
	
	local XCamMouseControl = CoD.XCamMouseControl.new( self, controller )
	XCamMouseControl:setLeftRight( true, false, 564, 1064 )
	XCamMouseControl:setTopBottom( true, false, 225.5, 625.5 )
	self:addElement( XCamMouseControl )
	self.XCamMouseControl = XCamMouseControl
	
	local CombatRecordComparingPlayerInfo = CoD.CombatRecordComparingPlayerInfo.new( self, controller )
	CombatRecordComparingPlayerInfo:setLeftRight( false, true, -870, -458 )
	CombatRecordComparingPlayerInfo:setTopBottom( true, false, 22, 82 )
	self:addElement( CombatRecordComparingPlayerInfo )
	self.CombatRecordComparingPlayerInfo = CombatRecordComparingPlayerInfo
	
	local BlackTransition = LUI.UIImage.new()
	BlackTransition:setLeftRight( true, true, 0, 0 )
	BlackTransition:setTopBottom( true, true, 0, 0 )
	BlackTransition:setRGB( 0, 0, 0 )
	BlackTransition:setAlpha( 0 )
	self:addElement( BlackTransition )
	self.BlackTransition = BlackTransition
	
	local PelletAccuracyDescription = CoD.CombatRecordStatDescription.new( self, controller )
	PelletAccuracyDescription:setLeftRight( true, false, 410, 793 )
	PelletAccuracyDescription:setTopBottom( true, false, 235, 260 )
	PelletAccuracyDescription.StatDescription:setText( Engine.Localize( "MENU_PELLET_ACCURACY_DESC" ) )
	self:addElement( PelletAccuracyDescription )
	self.PelletAccuracyDescription = PelletAccuracyDescription
	
	KillsStat:linkToElementModel( ItemList, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			KillsStat.StatValue:setText( Engine.Localize( CombatRecordGetItemStatForItemIndex( controller, "kills", itemIndex ) ) )
		end
	end )
	KillsStat:linkToElementModel( ItemList, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			KillsStat.ComparedStatValue:setText( Engine.Localize( CombatRecordGetComparisonItemStatForItemIndex( controller, "kills", itemIndex ) ) )
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
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local BlackTransitionFrame2 = function ( BlackTransition, event )
					if not event.interrupted then
						BlackTransition:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
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
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CombatRecordComparing" ), function ( model )
		local f18_local0 = self
		local f18_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "CombatRecordComparing"
		}
		CoD.Menu.UpdateButtonShownState( f18_local0, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "OtherPlayerStats.InProgress" ), function ( model )
		local f19_local0 = self
		local f19_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "OtherPlayerStats.InProgress"
		}
		CoD.Menu.UpdateButtonShownState( f19_local0, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "OtherPlayerStats.Success" ), function ( model )
		local f20_local0 = self
		local f20_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "OtherPlayerStats.Success"
		}
		CoD.Menu.UpdateButtonShownState( f20_local0, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f21_local0 = nil
		SendClientScriptMenuChangeNotify( controller, self, true )
		ShowHeaderKickerAndIcon( self )
		CombatRecordSetHeadingKickerTextToCombatRecordGameMode( "" )
		CombatRecordUpdateSelfIdentityWidget( self, controller )
		if not f21_local0 then
			f21_local0 = self:dispatchEventToChildren( event )
		end
		return f21_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		SendClientScriptMenuChangeNotify( controller, menu, false )
		CombatRecordSetComparing( self, controller, false )
		GoBack( self, controller )
		ClearMenuSavedState( menu )
		SendClientScriptNotifyForAdjustedClient( controller, "CustomClass_closed", "" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "PLATFORM_EMBLEM_ROTATE_LAYER" )
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
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_COMPARE" )
			return true
		elseif EnableCombatRecordCompare( controller ) and IsCombatRecordForRemotePlayer() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_COMPARE" )
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
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_CLEAR_COMPARE" )
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
		menu = self
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
		element.HeadshotsStat:close()
		element.AccuracyStat:close()
		element.WeaponNameTitle:close()
		element.XCamMouseControl:close()
		element.CombatRecordComparingPlayerInfo:close()
		element.PelletAccuracyDescription:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CombatRecordWeaponsZM.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

