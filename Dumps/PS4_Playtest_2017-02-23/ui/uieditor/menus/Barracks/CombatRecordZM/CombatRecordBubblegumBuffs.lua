require( "ui.uieditor.menus.Barracks.CombatRecordMP.CombatRecordFriendSidebar" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrameIdentity" )
require( "ui.uieditor.widgets.Barracks.CombatRecordComparingPlayerInfo" )
require( "ui.uieditor.widgets.Barracks.CombatRecordRightTitleWithBackground" )
require( "ui.uieditor.widgets.Barracks.CombatRecordStatHeader" )
require( "ui.uieditor.widgets.Barracks.CombatRecordStatListItem" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.PC.Utility.XCamMouseControl" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )

LUI.createMenu.CombatRecordBubblegumBuffs = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CombatRecordBubblegumBuffs" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CombatRecordBubblegumBuffs.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( 0, 0, 96, 552 )
	LeftPanel:setTopBottom( 0, 0, 132, 1016 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local MenuFrame = CoD.GenericMenuFrameIdentity.new( self, controller )
	MenuFrame:setLeftRight( 0, 1, 0, 0 )
	MenuFrame:setTopBottom( 0, 1, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_BUBBLEGUM_BUFFS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_BUBBLEGUM_BUFFS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_bubblebuffs" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local ItemList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	ItemList:makeFocusable()
	ItemList:setLeftRight( 0, 0, 114, 534 )
	ItemList:setTopBottom( 0, 0, 243, 931 )
	ItemList:setWidgetType( CoD.CombatRecordStatListItem )
	ItemList:setVerticalCount( 10 )
	ItemList:setVerticalCounter( CoD.verticalCounter )
	ItemList:setDataSource( "CombatRecordBGBList" )
	ItemList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		CombatRecordShowModelForBubblegumBuff( controller, element )
		return retVal
	end )
	ItemList:subscribeToGlobalModel( controller, "OtherPlayerStats", "InProgress", function ( model )
		local element = ItemList
		UpdateDataSource( self, element, controller )
	end )
	self:addElement( ItemList )
	self.ItemList = ItemList
	
	local WeaponLabel = LUI.UIText.new()
	WeaponLabel:setLeftRight( 0, 0, 114, 286 )
	WeaponLabel:setTopBottom( 0, 0, 184, 222 )
	WeaponLabel:setScale( LanguageOverrideNumber( "japanese", 0.8, 1 ) )
	WeaponLabel:setText( Engine.Localize( "MENU_ABILITY_CAPS" ) )
	WeaponLabel:setTTF( "fonts/default.ttf" )
	WeaponLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	WeaponLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( WeaponLabel )
	self.WeaponLabel = WeaponLabel
	
	local StatLabel = LUI.UIText.new()
	StatLabel:setLeftRight( 0, 0, 408, 534 )
	StatLabel:setTopBottom( 0, 0, 184, 222 )
	StatLabel:setScale( LanguageOverrideNumber( "japanese", 0.8, 1 ) )
	StatLabel:setText( Engine.Localize( "MENU_USES_CAPS" ) )
	StatLabel:setTTF( "fonts/default.ttf" )
	StatLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	StatLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( StatLabel )
	self.StatLabel = StatLabel
	
	local UsesStat = CoD.CombatRecordStatHeader.new( self, controller )
	UsesStat:setLeftRight( 0.5, 0.5, -345, 159 )
	UsesStat:setTopBottom( 0.5, 0.5, -272, -188 )
	UsesStat.StatLabel:setText( Engine.Localize( "MENU_USES_CAPS" ) )
	self:addElement( UsesStat )
	self.UsesStat = UsesStat
	
	local BGBNameTitle = CoD.CombatRecordRightTitleWithBackground.new( self, controller )
	BGBNameTitle:setLeftRight( 0, 0, 615, 744 )
	BGBNameTitle:setTopBottom( 0, 0, 221, 266 )
	self:addElement( BGBNameTitle )
	self.BGBNameTitle = BGBNameTitle
	
	local XCamMouseControl = CoD.XCamMouseControl.new( self, controller )
	XCamMouseControl:setLeftRight( 0, 0, 846, 1596 )
	XCamMouseControl:setTopBottom( 0, 0, 338, 938 )
	self:addElement( XCamMouseControl )
	self.XCamMouseControl = XCamMouseControl
	
	local CombatRecordComparingPlayerInfo = CoD.CombatRecordComparingPlayerInfo.new( self, controller )
	CombatRecordComparingPlayerInfo:setLeftRight( 1, 1, -1305, -687 )
	CombatRecordComparingPlayerInfo:setTopBottom( 0, 0, 33, 123 )
	self:addElement( CombatRecordComparingPlayerInfo )
	self.CombatRecordComparingPlayerInfo = CombatRecordComparingPlayerInfo
	
	local BlackTransition = LUI.UIImage.new()
	BlackTransition:setLeftRight( 0, 1, 0, 0 )
	BlackTransition:setTopBottom( 0, 1, 0, 0 )
	BlackTransition:setRGB( 0, 0, 0 )
	BlackTransition:setAlpha( 0 )
	self:addElement( BlackTransition )
	self.BlackTransition = BlackTransition
	
	UsesStat:linkToElementModel( ItemList, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			UsesStat.StatValue:setText( Engine.Localize( CombatRecordGetItemStatForItemIndex( controller, "used", modelValue ) ) )
		end
	end )
	UsesStat:linkToElementModel( ItemList, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			UsesStat.ComparedStatValue:setText( Engine.Localize( CombatRecordGetComparisonItemStatForItemIndex( controller, "used", modelValue ) ) )
		end
	end )
	BGBNameTitle:linkToElementModel( ItemList, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BGBNameTitle.Label:setText( Engine.Localize( modelValue ) )
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
		BlackTransition:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
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
		CombatRecordSetHeadingKickerTextToCombatRecordGameMode( "" )
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
		self.MenuFrame:close()
		self.ItemList:close()
		self.UsesStat:close()
		self.BGBNameTitle:close()
		self.XCamMouseControl:close()
		self.CombatRecordComparingPlayerInfo:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CombatRecordBubblegumBuffs.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

