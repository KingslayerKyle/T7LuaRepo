-- 28fd9a131e333eb4631e8f5293df310a
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.menus.Barracks.CombatRecordMP.CombatRecordFriendSidebar" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrameIdentityNoFooter" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )
require( "ui.uieditor.widgets.Barracks.CombatRecordStatListItem" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.Barracks.CombatRecordStatHeader" )
require( "ui.uieditor.widgets.Barracks.CombatRecordRightTitleWithBackground" )
require( "ui.uieditor.widgets.PC.Utility.XCamMouseControl" )
require( "ui.uieditor.widgets.Barracks.CombatRecordComparingPlayerInfo" )

LUI.createMenu.CombatRecordBubblegumBuffs = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CombatRecordBubblegumBuffs" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CombatRecordBubblegumBuffs.buttonPrompts" )
	local f1_local1 = self
	self.anyChildUsesUpdateState = true
	
	local MenuFrame = CoD.GenericMenuFrameIdentityNoFooter.new( f1_local1, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_BUBBLEGUM_BUFFS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_BUBBLEGUM_BUFFS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_bubblebuffs" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( f1_local1, controller )
	LeftPanel:setLeftRight( true, false, 64, 368 )
	LeftPanel:setTopBottom( true, false, 88, 677 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local feFooterContainerNOTLobby = CoD.fe_FooterContainer_NOTLobby.new( f1_local1, controller )
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
	
	local ItemList = LUI.UIList.new( f1_local1, controller, 2, 0, nil, false, false, 0, 0, false, false )
	ItemList:makeFocusable()
	ItemList:setLeftRight( true, false, 76, 356 )
	ItemList:setTopBottom( true, false, 157.5, 625.5 )
	ItemList:setWidgetType( CoD.CombatRecordStatListItem )
	ItemList:setVerticalCount( 10 )
	ItemList:setVerticalCounter( CoD.verticalCounter )
	ItemList:setDataSource( "CombatRecordBGBList" )
	ItemList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f3_local0 = nil
		CombatRecordShowModelForBubblegumBuff( controller, element )
		return f3_local0
	end )
	ItemList:subscribeToGlobalModel( controller, "OtherPlayerStats", "InProgress", function ( model )
		UpdateDataSource( self, ItemList, controller )
	end )
	self:addElement( ItemList )
	self.ItemList = ItemList
	
	local WeaponLabel = LUI.UIText.new()
	WeaponLabel:setLeftRight( true, false, 76, 191 )
	WeaponLabel:setTopBottom( true, false, 123, 148 )
	WeaponLabel:setScale( LanguageOverrideNumber( "japanese", 0.8, 1 ) )
	WeaponLabel:setText( Engine.Localize( "MENU_ABILITY_CAPS" ) )
	WeaponLabel:setTTF( "fonts/default.ttf" )
	WeaponLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	WeaponLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( WeaponLabel )
	self.WeaponLabel = WeaponLabel
	
	local StatLabel = LUI.UIText.new()
	StatLabel:setLeftRight( true, false, 272, 356 )
	StatLabel:setTopBottom( true, false, 123, 148 )
	StatLabel:setScale( LanguageOverrideNumber( "japanese", 0.8, 1 ) )
	StatLabel:setText( Engine.Localize( "MENU_USES_CAPS" ) )
	StatLabel:setTTF( "fonts/default.ttf" )
	StatLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	StatLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( StatLabel )
	self.StatLabel = StatLabel
	
	local UsesStat = CoD.CombatRecordStatHeader.new( f1_local1, controller )
	UsesStat:setLeftRight( false, false, -230, 106 )
	UsesStat:setTopBottom( false, false, -181.5, -125.5 )
	UsesStat.StatLabel:setText( Engine.Localize( "MENU_USES_CAPS" ) )
	self:addElement( UsesStat )
	self.UsesStat = UsesStat
	
	local BGBNameTitle = CoD.CombatRecordRightTitleWithBackground.new( f1_local1, controller )
	BGBNameTitle:setLeftRight( true, false, 410, 496 )
	BGBNameTitle:setTopBottom( true, false, 147.5, 177.5 )
	self:addElement( BGBNameTitle )
	self.BGBNameTitle = BGBNameTitle
	
	local XCamMouseControl = CoD.XCamMouseControl.new( f1_local1, controller )
	XCamMouseControl:setLeftRight( true, false, 564, 1064 )
	XCamMouseControl:setTopBottom( true, false, 225.5, 625.5 )
	self:addElement( XCamMouseControl )
	self.XCamMouseControl = XCamMouseControl
	
	local CombatRecordComparingPlayerInfo = CoD.CombatRecordComparingPlayerInfo.new( f1_local1, controller )
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
	
	UsesStat:linkToElementModel( ItemList, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			UsesStat.StatValue:setText( Engine.Localize( CombatRecordGetItemStatForItemIndex( controller, "used", itemIndex ) ) )
		end
	end )
	UsesStat:linkToElementModel( ItemList, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			UsesStat.ComparedStatValue:setText( Engine.Localize( CombatRecordGetComparisonItemStatForItemIndex( controller, "used", itemIndex ) ) )
		end
	end )
	BGBNameTitle:linkToElementModel( ItemList, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			BGBNameTitle.Label:setText( Engine.Localize( name ) )
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
		local f10_local0 = self
		local f10_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "CombatRecordComparing"
		}
		CoD.Menu.UpdateButtonShownState( f10_local0, f1_local1, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "OtherPlayerStats.InProgress" ), function ( model )
		local f11_local0 = self
		local f11_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "OtherPlayerStats.InProgress"
		}
		CoD.Menu.UpdateButtonShownState( f11_local0, f1_local1, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "OtherPlayerStats.Success" ), function ( model )
		local f12_local0 = self
		local f12_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "OtherPlayerStats.Success"
		}
		CoD.Menu.UpdateButtonShownState( f12_local0, f1_local1, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f13_local0 = nil
		SendClientScriptMenuChangeNotify( controller, f1_local1, true )
		ShowHeaderKickerAndIcon( f1_local1 )
		CombatRecordSetHeadingKickerTextToCombatRecordGameMode( "" )
		CombatRecordUpdateSelfIdentityWidget( self, controller )
		if not f13_local0 then
			f13_local0 = element:dispatchEventToChildren( event )
		end
		return f13_local0
	end )
	f1_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f14_arg0, f14_arg1, f14_arg2, f14_arg3 )
		SendClientScriptMenuChangeNotify( f14_arg2, f14_arg1, false )
		CombatRecordSetComparing( self, f14_arg2, false )
		GoBack( self, f14_arg2 )
		ClearMenuSavedState( f14_arg1 )
		SendClientScriptNotifyForAdjustedClient( f14_arg2, "CustomClass_closed", "" )
		return true
	end, function ( f15_arg0, f15_arg1, f15_arg2 )
		CoD.Menu.SetButtonLabel( f15_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	f1_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, function ( f16_arg0, f16_arg1, f16_arg2, f16_arg3 )
		return true
	end, function ( f17_arg0, f17_arg1, f17_arg2 )
		CoD.Menu.SetButtonLabel( f17_arg1, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "PLATFORM_EMBLEM_ROTATE_LAYER" )
		return true
	end, false )
	f1_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "F", function ( f18_arg0, f18_arg1, f18_arg2, f18_arg3 )
		if EnableCombatRecordCompare( f18_arg2 ) and not IsCombatRecordForRemotePlayer() then
			OpenPopup( self, "CombatRecordFriendSidebar", f18_arg2, "", "" )
			return true
		elseif EnableCombatRecordCompare( f18_arg2 ) and IsCombatRecordForRemotePlayer() then
			CombatRecordSetComparing( self, f18_arg2, true )
			CombatRecordCompareAgainstLocalPlayer( f18_arg2 )
			UpdateElementDataSource( self, "ItemList" )
			return true
		else
			
		end
	end, function ( f19_arg0, f19_arg1, f19_arg2 )
		if EnableCombatRecordCompare( f19_arg2 ) and not IsCombatRecordForRemotePlayer() then
			CoD.Menu.SetButtonLabel( f19_arg1, Enum.LUIButton.LUI_KEY_START, "MENU_COMPARE" )
			return true
		elseif EnableCombatRecordCompare( f19_arg2 ) and IsCombatRecordForRemotePlayer() then
			CoD.Menu.SetButtonLabel( f19_arg1, Enum.LUIButton.LUI_KEY_START, "MENU_COMPARE" )
			return true
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "C", function ( f20_arg0, f20_arg1, f20_arg2, f20_arg3 )
		if IsComparingStats( f20_arg2 ) then
			CombatRecordSetComparing( self, f20_arg2, false )
			return true
		else
			
		end
	end, function ( f21_arg0, f21_arg1, f21_arg2 )
		if IsComparingStats( f21_arg2 ) then
			CoD.Menu.SetButtonLabel( f21_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_CLEAR_COMPARE" )
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
		menu = f1_local1
	} )
	if not self:restoreState() then
		self.ItemList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.MenuFrame:close()
		element.LeftPanel:close()
		element.feFooterContainerNOTLobby:close()
		element.ItemList:close()
		element.UsesStat:close()
		element.BGBNameTitle:close()
		element.XCamMouseControl:close()
		element.CombatRecordComparingPlayerInfo:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CombatRecordBubblegumBuffs.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

