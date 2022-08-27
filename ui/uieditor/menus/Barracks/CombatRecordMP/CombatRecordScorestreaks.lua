-- f8593e5c92b4400f0da2d23de9134353
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.menus.Barracks.CombatRecordMP.CombatRecordFriendSidebar" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Background" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrameIdentity" )
require( "ui.uieditor.widgets.Barracks.CombatRecordStatListItem" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.Barracks.CombatRecordStatHeader" )
require( "ui.uieditor.widgets.Barracks.CombatRecordRightTitleWithBackground" )
require( "ui.uieditor.widgets.Barracks.CombatRecordComparingPlayerInfo" )

local PreLoadFunc = function ( self, controller )
	self.disablePopupOpenCloseAnim = true
end

LUI.createMenu.CombatRecordScorestreaks = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CombatRecordScorestreaks" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CombatRecordScorestreaks.buttonPrompts" )
	local f2_local1 = self
	self.anyChildUsesUpdateState = true
	
	local StartMenuBackground0 = CoD.StartMenu_Background.new( f2_local1, controller )
	StartMenuBackground0:setLeftRight( true, true, 0, 0 )
	StartMenuBackground0:setTopBottom( true, true, 0, 0 )
	StartMenuBackground0:mergeStateConditions( {
		{
			stateName = "InGame",
			condition = function ( menu, element, event )
				return IsInGame()
			end
		}
	} )
	self:addElement( StartMenuBackground0 )
	self.StartMenuBackground0 = StartMenuBackground0
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( true, true, 0, 0 )
	BlackBG:setTopBottom( true, true, 0, 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local BlackTint = LUI.UIImage.new()
	BlackTint:setLeftRight( false, false, -576, -265 )
	BlackTint:setTopBottom( false, false, -276, 302 )
	BlackTint:setRGB( 0, 0, 0 )
	BlackTint:setAlpha( 0.3 )
	self:addElement( BlackTint )
	self.BlackTint = BlackTint
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f2_local1, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 18, 70 )
	FEMenuLeftGraphics:setTopBottom( true, false, 91, 708.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local MenuFrame = CoD.GenericMenuFrameIdentity.new( f2_local1, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_SCORESTREAKS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_SCORESTREAKS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_scorestreak" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local ItemList = LUI.UIList.new( f2_local1, controller, 2, 0, nil, false, false, 0, 0, false, true )
	ItemList:makeFocusable()
	ItemList:setLeftRight( true, false, 79, 359 )
	ItemList:setTopBottom( true, false, 157.5, 625.5 )
	ItemList:setWidgetType( CoD.CombatRecordStatListItem )
	ItemList:setVerticalCount( 10 )
	ItemList:setVerticalCounter( CoD.verticalCounter )
	ItemList:setDataSource( "CombatRecordScorestreakList" )
	ItemList:subscribeToGlobalModel( controller, "OtherPlayerStats", "InProgress", function ( model )
		UpdateDataSource( self, ItemList, controller )
	end )
	self:addElement( ItemList )
	self.ItemList = ItemList
	
	local WeaponLabel = LUI.UITightText.new()
	WeaponLabel:setLeftRight( true, false, 79, 127 )
	WeaponLabel:setTopBottom( true, false, 123, 148 )
	WeaponLabel:setText( Engine.Localize( "MENU_WEAPON_CAPS" ) )
	WeaponLabel:setTTF( "fonts/default.ttf" )
	self:addElement( WeaponLabel )
	self.WeaponLabel = WeaponLabel
	
	local StatLabel = LUI.UIText.new()
	StatLabel:setLeftRight( true, false, 219.5, 401.5 )
	StatLabel:setTopBottom( true, false, 123, 148 )
	StatLabel:setText( Engine.Localize( "MENU_KILLS_SLASH_ASSISTS_CAPS" ) )
	StatLabel:setTTF( "fonts/default.ttf" )
	StatLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	StatLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( StatLabel )
	self.StatLabel = StatLabel
	
	local KillsStat = CoD.CombatRecordStatHeader.new( f2_local1, controller )
	KillsStat:setLeftRight( false, false, -230, -106 )
	KillsStat:setTopBottom( false, false, -181, -125 )
	self:addElement( KillsStat )
	self.KillsStat = KillsStat
	
	local KillsPerUseStat = CoD.CombatRecordStatHeader.new( f2_local1, controller )
	KillsPerUseStat:setLeftRight( false, false, -106, 18 )
	KillsPerUseStat:setTopBottom( false, false, -181, -125 )
	self:addElement( KillsPerUseStat )
	self.KillsPerUseStat = KillsPerUseStat
	
	local UsedStat = CoD.CombatRecordStatHeader.new( f2_local1, controller )
	UsedStat:setLeftRight( false, false, 18, 142 )
	UsedStat:setTopBottom( false, false, -181, -125 )
	UsedStat.StatLabel:setText( Engine.Localize( "MENU_USED_CAPS" ) )
	self:addElement( UsedStat )
	self.UsedStat = UsedStat
	
	local WeaponNameTitle = CoD.CombatRecordRightTitleWithBackground.new( f2_local1, controller )
	WeaponNameTitle:setLeftRight( true, false, 409, 557 )
	WeaponNameTitle:setTopBottom( true, false, 148, 178 )
	self:addElement( WeaponNameTitle )
	self.WeaponNameTitle = WeaponNameTitle
	
	local ScorestreakImage = LUI.UIImage.new()
	ScorestreakImage:setLeftRight( false, true, -664, -289 )
	ScorestreakImage:setTopBottom( true, false, 237.13, 612.13 )
	self:addElement( ScorestreakImage )
	self.ScorestreakImage = ScorestreakImage
	
	local CombatRecordComparingPlayerInfo = CoD.CombatRecordComparingPlayerInfo.new( f2_local1, controller )
	CombatRecordComparingPlayerInfo:setLeftRight( false, true, -870, -458 )
	CombatRecordComparingPlayerInfo:setTopBottom( true, false, 22, 82 )
	self:addElement( CombatRecordComparingPlayerInfo )
	self.CombatRecordComparingPlayerInfo = CombatRecordComparingPlayerInfo
	
	KillsStat:linkToElementModel( ItemList, "statName", true, function ( model )
		local statName = Engine.GetModelValue( model )
		if statName then
			KillsStat.StatLabel:setText( Engine.Localize( statName ) )
		end
	end )
	KillsStat:linkToElementModel( ItemList, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			KillsStat.StatValue:setText( Engine.Localize( CombatRecordGetItemKillsOrAssistsForItemIndex( controller, itemIndex ) ) )
		end
	end )
	KillsStat:linkToElementModel( ItemList, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			KillsStat.ComparedStatValue:setText( Engine.Localize( CombatRecordGetComparisonItemKillsOrAssistsForItemIndex( controller, itemIndex ) ) )
		end
	end )
	KillsPerUseStat:linkToElementModel( ItemList, "statPerUseString", true, function ( model )
		local statPerUseString = Engine.GetModelValue( model )
		if statPerUseString then
			KillsPerUseStat.StatLabel:setText( Engine.Localize( statPerUseString ) )
		end
	end )
	KillsPerUseStat:linkToElementModel( ItemList, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			KillsPerUseStat.StatValue:setText( Engine.Localize( CombatRecordGetKillsOrAssistsRatioForItemIndex( controller, "used", itemIndex ) ) )
		end
	end )
	KillsPerUseStat:linkToElementModel( ItemList, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			KillsPerUseStat.ComparedStatValue:setText( Engine.Localize( CombatRecordGetComparisonKillsOrAssistsRatioForItemIndex( controller, "used", itemIndex ) ) )
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
	WeaponNameTitle:linkToElementModel( ItemList, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			WeaponNameTitle.Label:setText( Engine.Localize( name ) )
		end
	end )
	ScorestreakImage:linkToElementModel( ItemList, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			ScorestreakImage:setImage( RegisterImage( AppendString( "_menu_large", GetItemImageByIndexAndMode( "mp", itemIndex ) ) ) )
		end
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CombatRecordComparing" ), function ( model )
		local f15_local0 = self
		local f15_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "CombatRecordComparing"
		}
		CoD.Menu.UpdateButtonShownState( f15_local0, f2_local1, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "OtherPlayerStats.InProgress" ), function ( model )
		local f16_local0 = self
		local f16_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "OtherPlayerStats.InProgress"
		}
		CoD.Menu.UpdateButtonShownState( f16_local0, f2_local1, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "OtherPlayerStats.Success" ), function ( model )
		local f17_local0 = self
		local f17_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "OtherPlayerStats.Success"
		}
		CoD.Menu.UpdateButtonShownState( f17_local0, f2_local1, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f18_local0 = nil
		ShowHeaderKickerAndIcon( f2_local1 )
		CombatRecordSetHeadingKickerTextToCombatRecordMode( "" )
		CombatRecordUpdateSelfIdentityWidget( self, controller )
		if not f18_local0 then
			f18_local0 = element:dispatchEventToChildren( event )
		end
		return f18_local0
	end )
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3 )
		CombatRecordSetComparing( self, f19_arg2, false )
		GoBack( self, f19_arg2 )
		ClearMenuSavedState( f19_arg1 )
		return true
	end, function ( f20_arg0, f20_arg1, f20_arg2 )
		CoD.Menu.SetButtonLabel( f20_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "F", function ( f21_arg0, f21_arg1, f21_arg2, f21_arg3 )
		if EnableCombatRecordCompare( f21_arg2 ) and not IsCombatRecordForRemotePlayer() then
			OpenPopup( self, "CombatRecordFriendSidebar", f21_arg2 )
			return true
		elseif EnableCombatRecordCompare( f21_arg2 ) and IsCombatRecordForRemotePlayer() then
			CombatRecordSetComparing( self, f21_arg2, true )
			CombatRecordCompareAgainstLocalPlayer( f21_arg2 )
			UpdateElementDataSource( self, "ItemList" )
			return true
		else
			
		end
	end, function ( f22_arg0, f22_arg1, f22_arg2 )
		if EnableCombatRecordCompare( f22_arg2 ) and not IsCombatRecordForRemotePlayer() then
			CoD.Menu.SetButtonLabel( f22_arg1, Enum.LUIButton.LUI_KEY_START, "MENU_COMPARE" )
			return true
		elseif EnableCombatRecordCompare( f22_arg2 ) and IsCombatRecordForRemotePlayer() then
			CoD.Menu.SetButtonLabel( f22_arg1, Enum.LUIButton.LUI_KEY_START, "MENU_COMPARE" )
			return true
		else
			return false
		end
	end, false )
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "C", function ( f23_arg0, f23_arg1, f23_arg2, f23_arg3 )
		if IsComparingStats( f23_arg2 ) then
			CombatRecordSetComparing( self, f23_arg2, false )
			return true
		else
			
		end
	end, function ( f24_arg0, f24_arg1, f24_arg2 )
		if IsComparingStats( f24_arg2 ) then
			CoD.Menu.SetButtonLabel( f24_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_CLEAR_COMPARE" )
			return true
		else
			return false
		end
	end, false )
	MenuFrame:setModel( self.buttonModel, controller )
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
		element.StartMenuBackground0:close()
		element.FEMenuLeftGraphics:close()
		element.MenuFrame:close()
		element.ItemList:close()
		element.KillsStat:close()
		element.KillsPerUseStat:close()
		element.UsedStat:close()
		element.WeaponNameTitle:close()
		element.CombatRecordComparingPlayerInfo:close()
		element.ScorestreakImage:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CombatRecordScorestreaks.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

