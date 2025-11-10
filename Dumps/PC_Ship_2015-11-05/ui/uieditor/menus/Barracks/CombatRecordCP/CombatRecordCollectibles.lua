require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Barracks.CombatRecordStatListItem" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.Barracks.CombatRecordRightTitleWithBackground" )
require( "ui.uieditor.widgets.Barracks.CombatRecordStatHeader" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_PerformanceCollectible" )
require( "ui.uieditor.widgets.playercard.SelfIdentityBadge" )

LUI.createMenu.CombatRecordCollectibles = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CombatRecordCollectibles" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CombatRecordCollectibles.buttonPrompts" )
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
	
	local MenuFrame0 = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame0:setLeftRight( true, true, 0, 0 )
	MenuFrame0:setTopBottom( true, true, 0, 0 )
	MenuFrame0.titleLabel:setText( Engine.Localize( "MENU_COLLECTIBLES_CAPS" ) )
	MenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_COLLECTIBLES_CAPS" ) )
	MenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_collectible" ) )
	self:addElement( MenuFrame0 )
	self.MenuFrame0 = MenuFrame0
	
	local ItemList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, true )
	ItemList:makeFocusable()
	ItemList:setLeftRight( true, false, 76, 356 )
	ItemList:setTopBottom( true, false, 157.5, 625.5 )
	ItemList:setDataSource( "CombatRecordCollectiblesList" )
	ItemList:setWidgetType( CoD.CombatRecordStatListItem )
	ItemList:setVerticalCount( 10 )
	ItemList:setVerticalCounter( CoD.verticalCounter )
	ItemList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f2_local0 = nil
		CombatRecordUpdateCollectibles( self, controller, element )
		return f2_local0
	end )
	self:addElement( ItemList )
	self.ItemList = ItemList
	
	local WeaponLabel = LUI.UITightText.new()
	WeaponLabel:setLeftRight( false, false, -564, -516 )
	WeaponLabel:setTopBottom( true, false, 123, 148 )
	WeaponLabel:setText( Engine.Localize( "MENU_TAB_MISSIONS" ) )
	WeaponLabel:setTTF( "fonts/default.ttf" )
	self:addElement( WeaponLabel )
	self.WeaponLabel = WeaponLabel
	
	local StatLabel = LUI.UIText.new()
	StatLabel:setLeftRight( false, false, -466, -284 )
	StatLabel:setTopBottom( true, false, 123, 148 )
	StatLabel:setText( Engine.Localize( "MENU_COLLECTIBLES_FOUND_CAPS" ) )
	StatLabel:setTTF( "fonts/default.ttf" )
	StatLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	StatLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( StatLabel )
	self.StatLabel = StatLabel
	
	local WeaponNameTitle = CoD.CombatRecordRightTitleWithBackground.new( self, controller )
	WeaponNameTitle:setLeftRight( false, false, -230, -125 )
	WeaponNameTitle:setTopBottom( true, false, 116, 146 )
	self:addElement( WeaponNameTitle )
	self.WeaponNameTitle = WeaponNameTitle
	
	local KillsStat = CoD.CombatRecordStatHeader.new( self, controller )
	KillsStat:setLeftRight( false, false, -230, 76 )
	KillsStat:setTopBottom( true, false, 148, 204 )
	KillsStat.StatLabel:setText( Engine.Localize( "MENU_COLLECTIBLES_FOUND_CAPS" ) )
	self:addElement( KillsStat )
	self.KillsStat = KillsStat
	
	local Collectibles = LUI.GridLayout.new( self, controller, false, 0, 0, 7, 0, nil, nil, false, false, 0, 0, false, false )
	Collectibles:setLeftRight( false, false, -6, 323 )
	Collectibles:setTopBottom( true, false, 320.44, 517.44 )
	Collectibles:setScale( 2 )
	Collectibles:setDataSource( "CollectiblesList" )
	Collectibles:setWidgetType( CoD.MissionRecordVault_PerformanceCollectible )
	Collectibles:setHorizontalCount( 3 )
	Collectibles:setVerticalCount( 2 )
	Collectibles:setSpacing( 7 )
	self:addElement( Collectibles )
	self.Collectibles = Collectibles
	
	local SelfIdentityBadge0 = CoD.SelfIdentityBadge.new( self, controller )
	SelfIdentityBadge0:setLeftRight( false, true, -435, -92 )
	SelfIdentityBadge0:setTopBottom( true, false, 22, 82 )
	self:addElement( SelfIdentityBadge0 )
	self.SelfIdentityBadge0 = SelfIdentityBadge0
	
	local BlackTransition = LUI.UIImage.new()
	BlackTransition:setLeftRight( true, true, 0, 0 )
	BlackTransition:setTopBottom( true, true, 0, 0 )
	BlackTransition:setRGB( 0, 0, 0 )
	BlackTransition:setAlpha( 0 )
	self:addElement( BlackTransition )
	self.BlackTransition = BlackTransition
	
	WeaponNameTitle:linkToElementModel( ItemList, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			WeaponNameTitle.Label:setText( Engine.Localize( name ) )
		end
	end )
	KillsStat:linkToElementModel( ItemList, "stat", true, function ( model )
		local stat = Engine.GetModelValue( model )
		if stat then
			KillsStat.StatValue:setText( Engine.Localize( stat ) )
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
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f7_local0 = nil
		SendClientScriptMenuChangeNotify( controller, self, true )
		SendClientScriptNotifyForAdjustedClient( controller, "CustomClass_remove", "" )
		ShowHeaderKickerAndIcon( self )
		CombatRecordSetHeadingKickerTextToCombatRecordGameMode( "" )
		if not f7_local0 then
			f7_local0 = self:dispatchEventToChildren( event )
		end
		return f7_local0
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
	MenuFrame0:setModel( self.buttonModel, controller )
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
		element.MenuFrame0:close()
		element.ItemList:close()
		element.WeaponNameTitle:close()
		element.KillsStat:close()
		element.Collectibles:close()
		element.SelfIdentityBadge0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CombatRecordCollectibles.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

