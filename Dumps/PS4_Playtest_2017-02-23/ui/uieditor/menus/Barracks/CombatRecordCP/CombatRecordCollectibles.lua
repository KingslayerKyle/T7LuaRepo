require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrameIdentity" )
require( "ui.uieditor.widgets.Barracks.CombatRecordRightTitleWithBackground" )
require( "ui.uieditor.widgets.Barracks.CombatRecordStatHeader" )
require( "ui.uieditor.widgets.Barracks.CombatRecordStatListItem" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_PerformanceCollectible" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )

LUI.createMenu.CombatRecordCollectibles = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CombatRecordCollectibles" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CombatRecordCollectibles.buttonPrompts" )
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
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_COLLECTIBLES_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_COLLECTIBLES_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_collectible" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local ItemList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	ItemList:makeFocusable()
	ItemList:setLeftRight( 0, 0, 114, 534 )
	ItemList:setTopBottom( 0, 0, 243, 931 )
	ItemList:setWidgetType( CoD.CombatRecordStatListItem )
	ItemList:setVerticalCount( 10 )
	ItemList:setVerticalCounter( CoD.verticalCounter )
	ItemList:setDataSource( "CombatRecordCollectiblesList" )
	ItemList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		CombatRecordUpdateCollectibles( self, controller, element )
		return retVal
	end )
	self:addElement( ItemList )
	self.ItemList = ItemList
	
	local WeaponLabel = LUI.UITightText.new()
	WeaponLabel:setLeftRight( 0.5, 0.5, -846, -774 )
	WeaponLabel:setTopBottom( 0, 0, 184, 222 )
	WeaponLabel:setText( Engine.Localize( "MENU_TAB_MISSIONS" ) )
	WeaponLabel:setTTF( "fonts/default.ttf" )
	self:addElement( WeaponLabel )
	self.WeaponLabel = WeaponLabel
	
	local StatLabel = LUI.UIText.new()
	StatLabel:setLeftRight( 0.5, 0.5, -740, -426 )
	StatLabel:setTopBottom( 0, 0, 184, 222 )
	StatLabel:setText( Engine.Localize( "MENU_COLLECTIBLES_FOUND_CAPS" ) )
	StatLabel:setTTF( "fonts/default.ttf" )
	StatLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	StatLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( StatLabel )
	self.StatLabel = StatLabel
	
	local WeaponNameTitle = CoD.CombatRecordRightTitleWithBackground.new( self, controller )
	WeaponNameTitle:setLeftRight( 0.5, 0.5, -345, -187 )
	WeaponNameTitle:setTopBottom( 0, 0, 174, 219 )
	self:addElement( WeaponNameTitle )
	self.WeaponNameTitle = WeaponNameTitle
	
	local KillsStat = CoD.CombatRecordStatHeader.new( self, controller )
	KillsStat:setLeftRight( 0.5, 0.5, -345, 114 )
	KillsStat:setTopBottom( 0, 0, 222, 306 )
	KillsStat.StatLabel:setText( Engine.Localize( "MENU_COLLECTIBLES_FOUND_CAPS" ) )
	KillsStat.ComparedStatValue:setText( Engine.Localize( "42,000" ) )
	self:addElement( KillsStat )
	self.KillsStat = KillsStat
	
	local Collectibles = LUI.GridLayout.new( self, controller, false, 0, 0, 10, 0, nil, nil, false, false, 0, 0, false, false )
	Collectibles:setLeftRight( 0.5, 0.5, -7.5, 483.5 )
	Collectibles:setTopBottom( 0, 0, 481, 775 )
	Collectibles:setScale( 2 )
	Collectibles:setWidgetType( CoD.MissionRecordVault_PerformanceCollectible )
	Collectibles:setHorizontalCount( 3 )
	Collectibles:setVerticalCount( 2 )
	Collectibles:setSpacing( 10 )
	Collectibles:setDataSource( "CollectiblesList" )
	self:addElement( Collectibles )
	self.Collectibles = Collectibles
	
	local BlackTransition = LUI.UIImage.new()
	BlackTransition:setLeftRight( 0, 1, 0, 0 )
	BlackTransition:setTopBottom( 0, 1, 0, 0 )
	BlackTransition:setRGB( 0, 0, 0 )
	BlackTransition:setAlpha( 0 )
	self:addElement( BlackTransition )
	self.BlackTransition = BlackTransition
	
	WeaponNameTitle:linkToElementModel( ItemList, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			WeaponNameTitle.Label:setText( Engine.Localize( modelValue ) )
		end
	end )
	KillsStat:linkToElementModel( ItemList, "stat", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			KillsStat.StatValue:setText( Engine.Localize( modelValue ) )
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
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SendClientScriptMenuChangeNotify( controller, self, true )
		SendClientScriptNotifyForAdjustedClient( controller, "CustomClass_remove", "" )
		ShowHeaderKickerAndIcon( self )
		CombatRecordSetHeadingKickerTextToCombatRecordGameMode( "" )
		CombatRecordUpdateSelfIdentityWidget( self, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "ESCAPE", function ( element, menu, controller, model )
		SendClientScriptMenuChangeNotify( controller, menu, false )
		GoBack( self, controller )
		ClearMenuSavedState( menu )
		SendClientScriptNotifyForAdjustedClient( controller, "CustomClass_closed", "" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
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
		self.WeaponNameTitle:close()
		self.KillsStat:close()
		self.Collectibles:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CombatRecordCollectibles.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

