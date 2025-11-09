require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.CAC.TitleDotsWidget" )
require( "ui.uieditor.widgets.CAC.cac_3dTitleIntermediary" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemDrawWidgetNew" )
require( "ui.uieditor.menus.Craft.EmblemEditor.EmblemSelectOptions" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemItem" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabBar" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemSlotsFull" )
require( "ui.uieditor.widgets.playercard.SelfIdentityBadge" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )

local f0_local0 = function ( f1_arg0 )
	local f1_local0 = CoD.CraftUtility.GetDDLRoot( f1_arg0, Enum.StorageFileType.STORAGE_COMMON_SETTINGS )
	return f1_local0.default_emblem_index:get()
end

local PreLoadFunc = function ( self, controller )
	self:subscribeToModel( Engine.CreateModel( Engine.GetModelForController( controller ), "Emblem.UpdateDataSource" ), function ()
		local f3_local0 = CoD.perController[controller].selectedEmblemModel
		if f3_local0 then
			local f3_local1 = Engine.GetModelValue( Engine.GetModel( f3_local0, "emblemIndex" ) )
			if self.emblemList ~= nil then
				self.emblemList:updateDataSource( true )
				self.emblemList:findItem( {
					emblemIndex = f3_local1
				}, nil, true, nil )
			end
		end
	end )
	if not IsLive() then
		self.restoreState = function ( f4_arg0 )
			local f4_local0 = f0_local0( controller )
			if f4_local0 ~= CoD.CraftUtility.Emblems.INVALID_DEFAULT_EMBLEMINDEX then
				if f4_arg0.emblemList ~= nil then
					local f4_local1 = f4_arg0.emblemList:findItem( {
						emblemIndex = f4_local0
					} )
					if f4_local1 then
						f4_arg0.emblemList:processEvent( {
							name = "gain_focus",
							controller = controller,
							selectIndex = f4_local1.gridInfoTable.zeroBasedIndex
						} )
					end
				end
				return true
			else
				return false
			end
		end
		
	end
	CoD.emblem.ColorList = nil
	self.disablePopupOpenCloseAnim = true
end

local PostLoadFunc = function ( f5_arg0, f5_arg1 )
	f5_arg0.emblemList.navigation.right = nil
end

LUI.createMenu.EmblemSelect = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "EmblemSelect" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "EmblemSelect.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( false, false, -638, 642 )
	Background:setTopBottom( false, false, -360, 360 )
	Background:setImage( RegisterImage( "uie_t7_mp_menu_cac_version6_backdrop720p" ) )
	self:addElement( Background )
	self.Background = Background
	
	local emblemSelectBg = LUI.UIImage.new()
	emblemSelectBg:setLeftRight( true, true, 0, 0 )
	emblemSelectBg:setTopBottom( true, true, 0, 0 )
	emblemSelectBg:setRGB( 0, 0, 0 )
	emblemSelectBg:setAlpha( 0.7 )
	emblemSelectBg:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiply" ) )
	self:addElement( emblemSelectBg )
	self.emblemSelectBg = emblemSelectBg
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 18, 70 )
	FEMenuLeftGraphics:setTopBottom( true, false, 91, 708.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local TitleDotsWidget0 = CoD.TitleDotsWidget.new( self, controller )
	TitleDotsWidget0:setLeftRight( true, false, 3, 528.34 )
	TitleDotsWidget0:setTopBottom( true, false, -65.33, 92.67 )
	TitleDotsWidget0:setAlpha( 0 )
	self:addElement( TitleDotsWidget0 )
	self.TitleDotsWidget0 = TitleDotsWidget0
	
	local cac3dTitleIntermediary0 = CoD.cac_3dTitleIntermediary.new( self, controller )
	cac3dTitleIntermediary0:setLeftRight( true, false, -71.25, 506.75 )
	cac3dTitleIntermediary0:setTopBottom( true, false, -5.5, 140.5 )
	cac3dTitleIntermediary0:setAlpha( 0 )
	cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_EMBLEMS_CAPS" ) )
	self:addElement( cac3dTitleIntermediary0 )
	self.cac3dTitleIntermediary0 = cac3dTitleIntermediary0
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, -11, 1293 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local GridPanel = LUI.UIImage.new()
	GridPanel:setLeftRight( true, false, 64, 658 )
	GridPanel:setTopBottom( true, false, 76, 684 )
	GridPanel:setRGB( 0, 0, 0 )
	GridPanel:setAlpha( 0.15 )
	self:addElement( GridPanel )
	self.GridPanel = GridPanel
	
	local emblemDrawWidget = CoD.EmblemDrawWidgetNew.new( self, controller )
	emblemDrawWidget:setLeftRight( true, false, 688, 1188 )
	emblemDrawWidget:setTopBottom( true, false, 137, 451 )
	emblemDrawWidget:mergeStateConditions( {
		{
			stateName = "Unfocusable",
			condition = function ( menu, element, event )
				return Emblem_IsOccupied( element, controller )
			end
		},
		{
			stateName = "EmptySlot",
			condition = function ( menu, element, event )
				return not Emblem_IsOccupied( element, controller )
			end
		}
	} )
	emblemDrawWidget:linkToElementModel( emblemDrawWidget, "isBMClassified", true, function ( model )
		self:updateElementState( emblemDrawWidget, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		} )
	end )
	self:addElement( emblemDrawWidget )
	self.emblemDrawWidget = emblemDrawWidget
	
	local emblemList = LUI.UIList.new( self, controller, 10, 0, nil, true, false, 0, 0, false, false )
	emblemList:makeFocusable()
	emblemList:setLeftRight( true, false, 78, 626 )
	emblemList:setTopBottom( true, false, 137, 599 )
	emblemList:setWidgetType( CoD.EmblemItem )
	emblemList:setHorizontalCount( 3 )
	emblemList:setVerticalCount( 4 )
	emblemList:setSpacing( 10 )
	emblemList:setDataSource( "EmblemsList" )
	emblemList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ), function ( model )
		local f10_local0 = emblemList
		local f10_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		}
		CoD.Menu.UpdateButtonShownState( f10_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	emblemList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		local f11_local0 = emblemList
		local f11_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		}
		CoD.Menu.UpdateButtonShownState( f11_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	emblemList:linkToElementModel( emblemList, "isNonClickableEmblem", true, function ( model )
		local f12_local0 = emblemList
		local f12_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isNonClickableEmblem"
		}
		CoD.Menu.UpdateButtonShownState( f12_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( f12_local0, self, controller, Enum.LUIButton.LUI_KEY_START )
		CoD.Menu.UpdateButtonShownState( f12_local0, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	emblemList:linkToElementModel( emblemList, "isBMClassified", true, function ( model )
		local f13_local0 = emblemList
		local f13_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		}
		CoD.Menu.UpdateButtonShownState( f13_local0, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	emblemList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f14_local0 = nil
		if IsElementInState( element, "New" ) then
			EmblemSelect_GainFocus( self, element, controller )
			SetHintText( self, element, controller )
			UpdateElementState( self, "emblemDrawWidget", controller )
			Emblems_SetEmblemOld( self, element, controller )
			UpdateSelfElementState( self, element, controller )
		else
			EmblemSelect_GainFocus( self, element, controller )
			SetHintText( self, element, controller )
			UpdateElementState( self, "emblemDrawWidget", controller )
		end
		return f14_local0
	end )
	emblemList:registerEventHandler( "gain_focus", function ( element, event )
		local f15_local0 = nil
		if element.gainFocus then
			f15_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f15_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_START )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		return f15_local0
	end )
	emblemList:registerEventHandler( "lose_focus", function ( element, event )
		local f16_local0 = nil
		if element.loseFocus then
			f16_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f16_local0 = element.super:loseFocus( event )
		end
		return f16_local0
	end )
	self:AddButtonCallbackFunction( emblemList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsLive() and IsSelfModelValueEqualTo( element, controller, "isNonClickableEmblem", 0 ) and not IsElementInState( element, "BMClassified" ) and Emblems_CanEnterEmblemEditor( element, controller ) and not CraftItemIsReadOnly( element, controller ) and not SelectingGroupEmblem( controller ) then
			OpenEmblemEditor( element, menu, controller, model, "EmblemSelect" )
			return true
		elseif CraftItemIsReadOnly( element, controller ) and not SelectingGroupEmblem( controller ) then
			FileshareShowReadonlyToast( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if IsLive() and IsSelfModelValueEqualTo( element, controller, "isNonClickableEmblem", 0 ) and not IsElementInState( element, "BMClassified" ) and Emblems_CanEnterEmblemEditor( element, controller ) and not CraftItemIsReadOnly( element, controller ) and not SelectingGroupEmblem( controller ) then
			return true
		elseif CraftItemIsReadOnly( element, controller ) and not SelectingGroupEmblem( controller ) then
			return true
		else
			return false
		end
	end, true )
	self:AddButtonCallbackFunction( emblemList, controller, Enum.LUIButton.LUI_KEY_START, nil, function ( element, menu, controller, model )
		if Emblem_IsOccupied( element, controller ) and IsSelfModelValueEqualTo( element, controller, "isNonClickableEmblem", 0 ) and not IsPreBuiltEmblemTab( controller ) and not SelectingGroupEmblem( controller ) then
			OpenPopup( self, "EmblemSelectOptions", controller, "", "" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS" )
		if Emblem_IsOccupied( element, controller ) and IsSelfModelValueEqualTo( element, controller, "isNonClickableEmblem", 0 ) and not IsPreBuiltEmblemTab( controller ) and not SelectingGroupEmblem( controller ) then
			return true
		else
			return false
		end
	end, true )
	self:AddButtonCallbackFunction( emblemList, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, nil, function ( element, menu, controller, model )
		if Emblem_IsOccupied( element, controller ) and IsSelfModelValueEqualTo( element, controller, "isNonClickableEmblem", 0 ) and not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
			EmblemSelect_SetAsEmblem( self, element, controller )
			PlaySoundSetSound( self, "toggle" )
			UpdateSelfState( self, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if Emblem_IsOccupied( element, controller ) and IsSelfModelValueEqualTo( element, controller, "isNonClickableEmblem", 0 ) and not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "" )
			return false
		else
			return false
		end
	end, false )
	emblemList:mergeStateConditions( {
		{
			stateName = "EmptySlot",
			condition = function ( menu, element, event )
				return not Emblem_IsOccupied( element, controller )
			end
		},
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return Emblems_IsDefaultEmblemEquipped( menu, element, controller ) and not IsLive()
			end
		},
		{
			stateName = "NonClickableEmptySlot",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "isNonClickableEmblem", 1 )
			end
		}
	} )
	emblemList:linkToElementModel( emblemList, "isBMClassified", true, function ( model )
		self:updateElementState( emblemList, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		} )
	end )
	emblemList:linkToElementModel( emblemList, "emblemIndex", true, function ( model )
		self:updateElementState( emblemList, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "emblemIndex"
		} )
	end )
	emblemList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ), function ( model )
		self:updateElementState( emblemList, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		} )
	end )
	emblemList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		self:updateElementState( emblemList, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	emblemList:linkToElementModel( emblemList, "isNonClickableEmblem", true, function ( model )
		self:updateElementState( emblemList, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isNonClickableEmblem"
		} )
	end )
	self:addElement( emblemList )
	self.emblemList = emblemList
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_EMBLEMS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_EMBLEMS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_emblem" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local tabList = CoD.FE_TabBar.new( self, controller )
	tabList:setLeftRight( true, false, 0, 2497 )
	tabList:setTopBottom( true, false, 86, 127 )
	tabList.Tabs.grid:setHorizontalCount( 5 )
	tabList.Tabs.grid:setDataSource( "EmblemCategoryTabs" )
	tabList:registerEventHandler( "list_active_changed", function ( element, event )
		local f31_local0 = nil
		EmblemSelect_TabChanged( self, element, controller )
		PlaySoundSetSound( self, "tab_changed" )
		return f31_local0
	end )
	self:addElement( tabList )
	self.tabList = tabList
	
	local usedSlotsTracker = CoD.EmblemSlotsFull.new( self, controller )
	usedSlotsTracker:setLeftRight( true, false, 688, 810 )
	usedSlotsTracker:setTopBottom( true, false, 586, 633 )
	usedSlotsTracker:subscribeToGlobalModel( controller, "PerController", "Emblem.UpdateDataSource", function ( model )
		UpdateSelfElementState( self, usedSlotsTracker, controller )
	end )
	usedSlotsTracker:mergeStateConditions( {
		{
			stateName = "SlotsFull",
			condition = function ( menu, element, event )
				return CraftSlotsFullByStorageType( controller, Enum.StorageFileType.STORAGE_EMBLEMS ) and IsLive()
			end
		},
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return not IsLive()
			end
		}
	} )
	usedSlotsTracker:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ), function ( model )
		self:updateElementState( usedSlotsTracker, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		} )
	end )
	usedSlotsTracker:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		self:updateElementState( usedSlotsTracker, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	self:addElement( usedSlotsTracker )
	self.usedSlotsTracker = usedSlotsTracker
	
	local SelfIdentityBadge = CoD.SelfIdentityBadge.new( self, controller )
	SelfIdentityBadge:setLeftRight( false, true, -435, -92 )
	SelfIdentityBadge:setTopBottom( true, false, 23, 83 )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", "identityBadge", function ( model )
		SelfIdentityBadge:setModel( model, controller )
	end )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", nil, function ( model )
		SelfIdentityBadge.CallingCard.CallingCardsFrameWidget:setModel( model, controller )
	end )
	self:addElement( SelfIdentityBadge )
	self.SelfIdentityBadge = SelfIdentityBadge
	
	local EmblemName = CoD.WeaponNameWidget.new( self, controller )
	EmblemName:setLeftRight( true, false, 690, 1186 )
	EmblemName:setTopBottom( true, false, 458.07, 492.07 )
	self:addElement( EmblemName )
	self.EmblemName = EmblemName
	
	local EmblemSubtitle = LUI.UIText.new()
	EmblemSubtitle:setLeftRight( true, false, 690, 1184 )
	EmblemSubtitle:setTopBottom( true, false, 500.16, 520.16 )
	EmblemSubtitle:setTTF( "fonts/default.ttf" )
	EmblemSubtitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	EmblemSubtitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( EmblemSubtitle )
	self.EmblemSubtitle = EmblemSubtitle
	
	emblemDrawWidget:linkToElementModel( emblemList, nil, false, function ( model )
		emblemDrawWidget:setModel( model, controller )
	end )
	EmblemName:linkToElementModel( emblemList, nil, false, function ( model )
		EmblemName:setModel( model, controller )
	end )
	EmblemName:linkToElementModel( emblemList, "emblemTitle", true, function ( model )
		local emblemTitle = Engine.GetModelValue( model )
		if emblemTitle then
			EmblemName.weaponNameLabel:setText( emblemTitle )
		end
	end )
	EmblemSubtitle:linkToElementModel( emblemList, "subTitle", true, function ( model )
		local subTitle = Engine.GetModelValue( model )
		if subTitle then
			EmblemSubtitle:setText( Engine.Localize( subTitle ) )
		end
	end )
	emblemDrawWidget.navigation = {
		left = emblemList
	}
	emblemList.navigation = {
		right = emblemDrawWidget
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				tabList:completeAnimation()
				self.tabList:setAlpha( 1 )
				self.clipFinished( tabList, {} )
				usedSlotsTracker:completeAnimation()
				self.usedSlotsTracker:setAlpha( 1 )
				self.clipFinished( usedSlotsTracker, {} )
			end
		},
		HideTabWidget = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				tabList:completeAnimation()
				self.tabList:setAlpha( 0 )
				self.clipFinished( tabList, {} )
				usedSlotsTracker:completeAnimation()
				self.usedSlotsTracker:setAlpha( 1 )
				self.clipFinished( usedSlotsTracker, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "HideTabWidget",
			condition = function ( menu, element, event )
				return not IsLive()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ), function ( model )
		self:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		self:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f48_local0 = nil
		ShowHeaderIconOnly( self )
		SetElementStateByElementName( self, "MenuFrame", controller, "Update" )
		PlayClipOnElement( self, {
			elementName = "MenuFrame",
			clipName = "Intro"
		}, controller )
		PlayClip( self, "Intro", controller )
		if not f48_local0 then
			f48_local0 = self:dispatchEventToChildren( event )
		end
		return f48_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		UploadStats( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		EmblemSelect_Back( self, element, controller )
	end )
	emblemDrawWidget.id = "emblemDrawWidget"
	emblemList.id = "emblemList"
	MenuFrame:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.emblemList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEMenuLeftGraphics:close()
		element.TitleDotsWidget0:close()
		element.cac3dTitleIntermediary0:close()
		element.emblemDrawWidget:close()
		element.emblemList:close()
		element.MenuFrame:close()
		element.tabList:close()
		element.usedSlotsTracker:close()
		element.SelfIdentityBadge:close()
		element.EmblemName:close()
		element.EmblemSubtitle:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "EmblemSelect.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

