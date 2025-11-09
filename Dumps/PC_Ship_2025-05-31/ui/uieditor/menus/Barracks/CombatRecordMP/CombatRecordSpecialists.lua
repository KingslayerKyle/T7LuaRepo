require( "ui.uieditor.menus.Barracks.CombatRecordMP.CombatRecordFriendSidebar" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrameIdentityNoFooter" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )
require( "ui.uieditor.widgets.Barracks.CombatRecordStatListItem" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.Barracks.CombatRecordStatHeader" )
require( "ui.uieditor.widgets.Barracks.CombatRecordLeftTitleWithBackground" )
require( "ui.uieditor.widgets.Barracks.CombatRecordStatDescription" )
require( "ui.uieditor.widgets.Barracks.CombatRecordComparingPlayerInfo" )

local PreLoadFunc = function ( self, controller )
	self.disablePopupOpenCloseAnim = true
end

LUI.createMenu.CombatRecordSpecialists = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CombatRecordSpecialists" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CombatRecordSpecialists.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 18, 70 )
	FEMenuLeftGraphics:setTopBottom( true, false, 91, 708.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local MenuFrame = CoD.GenericMenuFrameIdentityNoFooter.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_SPECIALISTS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_SPECIALISTS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_character" ) )
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
		local f3_local0 = nil
		SizeToSafeArea( element, controller )
		if not f3_local0 then
			f3_local0 = element:dispatchEventToChildren( event )
		end
		return f3_local0
	end )
	self:addElement( feFooterContainerNOTLobby )
	self.feFooterContainerNOTLobby = feFooterContainerNOTLobby
	
	local ItemList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, true )
	ItemList:makeFocusable()
	ItemList:setLeftRight( true, false, 77, 357 )
	ItemList:setTopBottom( true, false, 157.5, 625.5 )
	ItemList:setWidgetType( CoD.CombatRecordStatListItem )
	ItemList:setVerticalCount( 10 )
	ItemList:setVerticalCounter( CoD.verticalCounter )
	ItemList:setDataSource( "CombatRecordSpecialistList" )
	ItemList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f4_local0 = nil
		CombatRecordShowHero( controller, element )
		return f4_local0
	end )
	ItemList:subscribeToGlobalModel( controller, "OtherPlayerStats", "InProgress", function ( model )
		UpdateDataSource( self, ItemList, controller )
	end )
	self:addElement( ItemList )
	self.ItemList = ItemList
	
	local WeaponLabel = LUI.UITightText.new()
	WeaponLabel:setLeftRight( true, false, 77, 125 )
	WeaponLabel:setTopBottom( true, false, 123, 148 )
	WeaponLabel:setText( Engine.Localize( "MENU_WEAPON_CAPS" ) )
	WeaponLabel:setTTF( "fonts/default.ttf" )
	self:addElement( WeaponLabel )
	self.WeaponLabel = WeaponLabel
	
	local StatLabel = LUI.UIText.new()
	StatLabel:setLeftRight( true, false, 243, 425 )
	StatLabel:setTopBottom( true, false, 123, 148 )
	StatLabel:setText( Engine.Localize( "MENU_KILLS_CAPS" ) )
	StatLabel:setTTF( "fonts/default.ttf" )
	StatLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	StatLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( StatLabel )
	self.StatLabel = StatLabel
	
	local KillsStat = CoD.CombatRecordStatHeader.new( self, controller )
	KillsStat:setLeftRight( false, true, -870, -746 )
	KillsStat:setTopBottom( true, false, 182, 238 )
	KillsStat.StatLabel:setText( Engine.Localize( "MENU_KILLS_CAPS" ) )
	self:addElement( KillsStat )
	self.KillsStat = KillsStat
	
	local UsedStat = CoD.CombatRecordStatHeader.new( self, controller )
	UsedStat:setLeftRight( false, true, -746, -622 )
	UsedStat:setTopBottom( true, false, 182, 238 )
	UsedStat.StatLabel:setText( Engine.Localize( "MENU_GAMES_USED_CAPS" ) )
	self:addElement( UsedStat )
	self.UsedStat = UsedStat
	
	local KillsPerUseStat = CoD.CombatRecordStatHeader.new( self, controller )
	KillsPerUseStat:setLeftRight( false, true, -622, -498 )
	KillsPerUseStat:setTopBottom( true, false, 182, 238 )
	KillsPerUseStat.StatLabel:setText( Engine.Localize( "MENU_KILLS_PER_GAME_CAPS" ) )
	self:addElement( KillsPerUseStat )
	self.KillsPerUseStat = KillsPerUseStat
	
	local HeroName = LUI.UIText.new()
	HeroName:setLeftRight( true, false, 411, 593 )
	HeroName:setTopBottom( true, false, 123, 148 )
	HeroName:setRGB( 0.97, 0.32, 0.05 )
	HeroName:setTTF( "fonts/default.ttf" )
	HeroName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	HeroName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( HeroName )
	self.HeroName = HeroName
	
	local WeaponTitle = CoD.CombatRecordLeftTitleWithBackground.new( self, controller )
	WeaponTitle:setLeftRight( true, false, 410, 472 )
	WeaponTitle:setTopBottom( true, false, 149, 179 )
	self:addElement( WeaponTitle )
	self.WeaponTitle = WeaponTitle
	
	local CombatRecordStatDescription = CoD.CombatRecordStatDescription.new( self, controller )
	CombatRecordStatDescription:setLeftRight( true, false, 410, 782 )
	CombatRecordStatDescription:setTopBottom( true, false, 238, 263 )
	self:addElement( CombatRecordStatDescription )
	self.CombatRecordStatDescription = CombatRecordStatDescription
	
	local BlackTransition = LUI.UIImage.new()
	BlackTransition:setLeftRight( true, true, 0, 0 )
	BlackTransition:setTopBottom( true, true, 0, 0 )
	BlackTransition:setRGB( 0, 0, 0 )
	BlackTransition:setAlpha( 0 )
	self:addElement( BlackTransition )
	self.BlackTransition = BlackTransition
	
	local CombatRecordComparingPlayerInfo = CoD.CombatRecordComparingPlayerInfo.new( self, controller )
	CombatRecordComparingPlayerInfo:setLeftRight( false, true, -870, -458 )
	CombatRecordComparingPlayerInfo:setTopBottom( true, false, 24, 84 )
	self:addElement( CombatRecordComparingPlayerInfo )
	self.CombatRecordComparingPlayerInfo = CombatRecordComparingPlayerInfo
	
	KillsStat:linkToElementModel( ItemList, "stat", true, function ( model )
		local stat = Engine.GetModelValue( model )
		if stat then
			KillsStat.StatValue:setText( Engine.Localize( stat ) )
		end
	end )
	KillsStat:linkToElementModel( ItemList, "statComparison", true, function ( model )
		local statComparison = Engine.GetModelValue( model )
		if statComparison then
			KillsStat.ComparedStatValue:setText( Engine.Localize( statComparison ) )
		end
	end )
	UsedStat:linkToElementModel( ItemList, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			UsedStat.StatValue:setText( Engine.Localize( CombatRecordGetItemStatForItemIndex( controller, "used", itemIndex ) ) )
		end
	end )
	UsedStat:linkToElementModel( ItemList, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			UsedStat.ComparedStatValue:setText( Engine.Localize( CombatRecordGetComparisonItemStatForItemIndex( controller, "used", itemIndex ) ) )
		end
	end )
	KillsPerUseStat:linkToElementModel( ItemList, "killsPerUse", true, function ( model )
		local killsPerUse = Engine.GetModelValue( model )
		if killsPerUse then
			KillsPerUseStat.StatValue:setText( Engine.Localize( killsPerUse ) )
		end
	end )
	KillsPerUseStat:linkToElementModel( ItemList, "killsPerUseComparison", true, function ( model )
		local killsPerUseComparison = Engine.GetModelValue( model )
		if killsPerUseComparison then
			KillsPerUseStat.ComparedStatValue:setText( Engine.Localize( killsPerUseComparison ) )
		end
	end )
	HeroName:linkToElementModel( ItemList, "heroName", true, function ( model )
		local heroName = Engine.GetModelValue( model )
		if heroName then
			HeroName:setText( Engine.Localize( heroName ) )
		end
	end )
	WeaponTitle:linkToElementModel( ItemList, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			WeaponTitle.Label:setText( Engine.Localize( name ) )
		end
	end )
	CombatRecordStatDescription:linkToElementModel( ItemList, "statDesc", true, function ( model )
		local statDesc = Engine.GetModelValue( model )
		if statDesc then
			CombatRecordStatDescription.StatDescription:setText( Engine.Localize( statDesc ) )
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
		local f17_local0 = self
		local f17_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "CombatRecordComparing"
		}
		CoD.Menu.UpdateButtonShownState( f17_local0, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "OtherPlayerStats.InProgress" ), function ( model )
		local f18_local0 = self
		local f18_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "OtherPlayerStats.InProgress"
		}
		CoD.Menu.UpdateButtonShownState( f18_local0, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "OtherPlayerStats.Success" ), function ( model )
		local f19_local0 = self
		local f19_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "OtherPlayerStats.Success"
		}
		CoD.Menu.UpdateButtonShownState( f19_local0, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f20_local0 = nil
		SendClientScriptMenuChangeNotify( controller, self, true )
		SetCharacterModeToSessionMode( self, self, controller, Enum.eModes.MODE_MULTIPLAYER )
		ShowHeaderKickerAndIcon( self )
		CombatRecordSetHeadingKickerTextToCombatRecordMode( "" )
		CombatRecordUpdateSelfIdentityWidget( self, controller )
		if not f20_local0 then
			f20_local0 = self:dispatchEventToChildren( event )
		end
		return f20_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		CombatRecordSetComparing( self, controller, false )
		SendClientScriptMenuChangeNotify( controller, menu, false )
		GoBack( self, controller )
		ClearMenuSavedState( menu )
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
		element.UsedStat:close()
		element.KillsPerUseStat:close()
		element.WeaponTitle:close()
		element.CombatRecordStatDescription:close()
		element.CombatRecordComparingPlayerInfo:close()
		element.HeroName:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CombatRecordSpecialists.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

