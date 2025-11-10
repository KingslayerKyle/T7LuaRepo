require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.playercard.SelfIdentityBadge" )
require( "ui.uieditor.widgets.Barracks.CombatRecordStatListItem" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.Barracks.CombatRecordStatHeader" )
require( "ui.uieditor.widgets.Barracks.CombatRecordRightTitleWithBackground" )
require( "ui.uieditor.widgets.PC.Utility.XCamMouseControl" )

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
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( false, false, -576, -272 )
	LeftPanel:setTopBottom( true, true, 88, -43 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 18, 70 )
	FEMenuLeftGraphics:setTopBottom( true, false, 91, 708.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_WEAPONS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_WEAPONS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_cac" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local SelfIdentityBadge = CoD.SelfIdentityBadge.new( self, controller )
	SelfIdentityBadge:setLeftRight( false, true, -435, -92 )
	SelfIdentityBadge:setTopBottom( true, false, 22, 82 )
	self:addElement( SelfIdentityBadge )
	self.SelfIdentityBadge = SelfIdentityBadge
	
	local ItemList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, true )
	ItemList:makeFocusable()
	ItemList:setLeftRight( false, false, -564, -284 )
	ItemList:setTopBottom( true, false, 157.5, 625.5 )
	ItemList:setDataSource( "CombatRecordWeaponsList" )
	ItemList:setWidgetType( CoD.CombatRecordStatListItem )
	ItemList:setVerticalCount( 10 )
	ItemList:setVerticalCounter( CoD.verticalCounter )
	ItemList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f3_local0 = nil
		CombatRecordShowModelForItemIndex( controller, element )
		return f3_local0
	end )
	self:addElement( ItemList )
	self.ItemList = ItemList
	
	local WeaponLabel = LUI.UITightText.new()
	WeaponLabel:setLeftRight( false, false, -564, -516 )
	WeaponLabel:setTopBottom( true, false, 123, 148 )
	WeaponLabel:setText( Engine.Localize( "MENU_WEAPON_CAPS" ) )
	WeaponLabel:setTTF( "fonts/default.ttf" )
	self:addElement( WeaponLabel )
	self.WeaponLabel = WeaponLabel
	
	local StatLabel = LUI.UIText.new()
	StatLabel:setLeftRight( false, false, -398, -216 )
	StatLabel:setTopBottom( true, false, 123, 148 )
	StatLabel:setText( Engine.Localize( "MENU_KILLS_CAPS" ) )
	StatLabel:setTTF( "fonts/default.ttf" )
	StatLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	StatLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( StatLabel )
	self.StatLabel = StatLabel
	
	local KillsStat = CoD.CombatRecordStatHeader.new( self, controller )
	KillsStat:setLeftRight( false, false, -230, -106 )
	KillsStat:setTopBottom( true, false, 179, 235 )
	KillsStat.StatLabel:setText( Engine.Localize( "MENU_KILLS_CAPS" ) )
	self:addElement( KillsStat )
	self.KillsStat = KillsStat
	
	local KDStat = CoD.CombatRecordStatHeader.new( self, controller )
	KDStat:setLeftRight( false, false, -106, -40 )
	KDStat:setTopBottom( true, false, 179, 235 )
	KDStat.StatLabel:setText( Engine.Localize( "MENU_KD_SHORT" ) )
	self:addElement( KDStat )
	self.KDStat = KDStat
	
	local HeadshotsStat = CoD.CombatRecordStatHeader.new( self, controller )
	HeadshotsStat:setLeftRight( false, false, -40, 84 )
	HeadshotsStat:setTopBottom( false, false, -181, -125 )
	HeadshotsStat.StatLabel:setText( Engine.Localize( "MENU_HEADSHOTS_CAPS" ) )
	self:addElement( HeadshotsStat )
	self.HeadshotsStat = HeadshotsStat
	
	local CombatRecordStatHeader2 = CoD.CombatRecordStatHeader.new( self, controller )
	CombatRecordStatHeader2:setLeftRight( false, false, 84, 208 )
	CombatRecordStatHeader2:setTopBottom( false, false, -181, -125 )
	CombatRecordStatHeader2.StatLabel:setText( Engine.Localize( "MENU_ACCURACY_CAPS" ) )
	self:addElement( CombatRecordStatHeader2 )
	self.CombatRecordStatHeader2 = CombatRecordStatHeader2
	
	local WeaponNameTitle = CoD.CombatRecordRightTitleWithBackground.new( self, controller )
	WeaponNameTitle:setLeftRight( false, false, -231, -126 )
	WeaponNameTitle:setTopBottom( true, false, 148, 178 )
	self:addElement( WeaponNameTitle )
	self.WeaponNameTitle = WeaponNameTitle
	
	local XCamMouseControl = CoD.XCamMouseControl.new( self, controller )
	XCamMouseControl:setLeftRight( false, false, -76, 424 )
	XCamMouseControl:setTopBottom( true, true, 225.5, -94.5 )
	self:addElement( XCamMouseControl )
	self.XCamMouseControl = XCamMouseControl
	
	local BlackTransition = LUI.UIImage.new()
	BlackTransition:setLeftRight( true, true, 0, 0 )
	BlackTransition:setTopBottom( true, true, 0, 0 )
	BlackTransition:setRGB( 0, 0, 0 )
	BlackTransition:setAlpha( 0 )
	self:addElement( BlackTransition )
	self.BlackTransition = BlackTransition
	
	KillsStat:linkToElementModel( ItemList, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			KillsStat.StatValue:setText( Engine.Localize( CombatRecordGetItemStatForItemIndex( controller, "kills", itemIndex ) ) )
		end
	end )
	KDStat:linkToElementModel( ItemList, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			KDStat.StatValue:setText( Engine.Localize( CombatRecordGetTwoStatRatioForItemIndex( controller, "kills", "deathsDuringUse", itemIndex ) ) )
		end
	end )
	HeadshotsStat:linkToElementModel( ItemList, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			HeadshotsStat.StatValue:setText( Engine.Localize( CombatRecordGetItemStatForItemIndex( controller, "headshots", itemIndex ) ) )
		end
	end )
	CombatRecordStatHeader2:linkToElementModel( ItemList, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			CombatRecordStatHeader2.StatValue:setText( Engine.Localize( FractionToPercentage( CombatRecordGetTwoStatRatioForItemIndex( controller, "hits", "shots", itemIndex ) ) ) )
		end
	end )
	WeaponNameTitle:linkToElementModel( ItemList, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			WeaponNameTitle.Label:setText( Engine.Localize( name ) )
		end
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
				self:setupElementClipCounter( 3 )
				KDStat:completeAnimation()
				self.KDStat:setAlpha( 0 )
				self.clipFinished( KDStat, {} )
				HeadshotsStat:completeAnimation()
				self.HeadshotsStat:setLeftRight( false, false, -106, 18 )
				self.HeadshotsStat:setTopBottom( false, false, -181, -125 )
				self.clipFinished( HeadshotsStat, {} )
				CombatRecordStatHeader2:completeAnimation()
				self.CombatRecordStatHeader2:setLeftRight( false, false, 18, 142 )
				self.CombatRecordStatHeader2:setTopBottom( false, false, -181, -125 )
				self.clipFinished( CombatRecordStatHeader2, {} )
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
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f13_local0 = nil
		SendClientScriptMenuChangeNotify( controller, self, true )
		ShowHeaderKickerAndIcon( self )
		CombatRecordSetHeadingKickerTextToCombatRecordMode( "" )
		if not f13_local0 then
			f13_local0 = self:dispatchEventToChildren( event )
		end
		return f13_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		SendClientScriptMenuChangeNotify( controller, menu, false )
		GoBack( self, controller )
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
	MenuFrame:setModel( self.buttonModel, controller )
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
		element.LeftPanel:close()
		element.FEMenuLeftGraphics:close()
		element.MenuFrame:close()
		element.SelfIdentityBadge:close()
		element.ItemList:close()
		element.KillsStat:close()
		element.KDStat:close()
		element.HeadshotsStat:close()
		element.CombatRecordStatHeader2:close()
		element.WeaponNameTitle:close()
		element.XCamMouseControl:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CombatRecordWeapons.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

