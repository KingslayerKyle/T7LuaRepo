require( "ui.uieditor.menus.Craft.EmblemEditor.EmblemSelectOptions" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.CAC.cac_3dTitleIntermediary" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )
require( "ui.uieditor.widgets.CAC.TitleDotsWidget" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemDrawWidgetNew" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemItem" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemSlotsFull" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabBar" )
require( "ui.uieditor.widgets.playercard.SelfIdentityBadge" )

local GetDefaultEmblemIndex = function ( controller )
	local userSettingRootState = CoD.CraftUtility.GetDDLRoot( controller, Enum.StorageFileType.STORAGE_COMMON_SETTINGS )
	local emblemIndex = userSettingRootState.default_emblem_index:get()
	return emblemIndex
end

local PreLoadFunc = function ( self, controller )
	self:subscribeToModel( Engine.CreateModel( Engine.GetModelForController( controller ), "Emblem.UpdateDataSource" ), function ()
		local selectedEmblemModel = CoD.perController[controller].selectedEmblemModel
		if selectedEmblemModel then
			local emblemIndex = Engine.GetModelValue( Engine.GetModel( selectedEmblemModel, "emblemIndex" ) )
			if self.emblemList ~= nil then
				self.emblemList:updateDataSource( true )
				self.emblemList:findItem( {
					emblemIndex = emblemIndex
				}, nil, true, nil )
			end
		end
	end )
	if not IsLive() then
		self.restoreState = function ( self )
			local emblemIndex = GetDefaultEmblemIndex( controller )
			if emblemIndex ~= CoD.CraftUtility.Emblems.INVALID_DEFAULT_EMBLEMINDEX then
				if self.emblemList ~= nil then
					local selectedItemWidget = self.emblemList:findItem( {
						emblemIndex = emblemIndex
					} )
					if selectedItemWidget then
						self.emblemList:processEvent( {
							name = "gain_focus",
							controller = controller,
							selectIndex = selectedItemWidget.gridInfoTable.zeroBasedIndex
						} )
					end
				end
				return true
			else
				return false
			end
		end
		
	end
	CoD.CraftUtility.EmblemColorList = nil
	self.disablePopupOpenCloseAnim = true
end

local PostLoadFunc = function ( self, controller )
	self.emblemList.navigation.right = nil
end

LUI.createMenu.EmblemSelect = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "EmblemSelect" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "EmblemSelect.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( 0.5, 0.5, -957, 963 )
	Background:setTopBottom( 0.5, 0.5, -540, 540 )
	Background:setImage( RegisterImage( "uie_t7_mp_menu_cac_version6_backdrop720p" ) )
	self:addElement( Background )
	self.Background = Background
	
	local emblemSelectBg = LUI.UIImage.new()
	emblemSelectBg:setLeftRight( 0, 1, 0, 0 )
	emblemSelectBg:setTopBottom( 0, 1, 0, 0 )
	emblemSelectBg:setRGB( 0, 0, 0 )
	emblemSelectBg:setAlpha( 0.7 )
	emblemSelectBg:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiply" ) )
	self:addElement( emblemSelectBg )
	self.emblemSelectBg = emblemSelectBg
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( 0, 0, 27, 105 )
	FEMenuLeftGraphics:setTopBottom( 0, 0, 136, 1062 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local TitleDotsWidget0 = CoD.TitleDotsWidget.new( self, controller )
	TitleDotsWidget0:setLeftRight( 0, 0, 5, 793 )
	TitleDotsWidget0:setTopBottom( 0, 0, -97.5, 139.5 )
	TitleDotsWidget0:setAlpha( 0 )
	self:addElement( TitleDotsWidget0 )
	self.TitleDotsWidget0 = TitleDotsWidget0
	
	local cac3dTitleIntermediary0 = CoD.cac_3dTitleIntermediary.new( self, controller )
	cac3dTitleIntermediary0:setLeftRight( 0, 0, -107, 760 )
	cac3dTitleIntermediary0:setTopBottom( 0, 0, -8, 211 )
	cac3dTitleIntermediary0:setAlpha( 0 )
	cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_EMBLEMS_CAPS" ) )
	self:addElement( cac3dTitleIntermediary0 )
	self.cac3dTitleIntermediary0 = cac3dTitleIntermediary0
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( 0, 0, -16, 1940 )
	CategoryListLine:setTopBottom( 0, 0, 120, 132 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local GridPanel = LUI.UIImage.new()
	GridPanel:setLeftRight( 0, 0, 96, 987 )
	GridPanel:setTopBottom( 0, 0, 114, 1026 )
	GridPanel:setRGB( 0, 0, 0 )
	GridPanel:setAlpha( 0.15 )
	self:addElement( GridPanel )
	self.GridPanel = GridPanel
	
	local emblemDrawWidget = CoD.EmblemDrawWidgetNew.new( self, controller )
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
	emblemDrawWidget:setLeftRight( 0, 0, 1032, 1782 )
	emblemDrawWidget:setTopBottom( 0, 0, 205.5, 676.5 )
	self:addElement( emblemDrawWidget )
	self.emblemDrawWidget = emblemDrawWidget
	
	local emblemList = LUI.UIList.new( self, controller, 15, 0, nil, true, false, 0, 0, false, false )
	emblemList:makeFocusable()
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
	emblemList:setLeftRight( 0, 0, 117, 939 )
	emblemList:setTopBottom( 0, 0, 205, 898 )
	emblemList:setWidgetType( CoD.EmblemItem )
	emblemList:setHorizontalCount( 3 )
	emblemList:setVerticalCount( 4 )
	emblemList:setSpacing( 15 )
	emblemList:setDataSource( "EmblemsList" )
	emblemList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ), function ( model )
		local element = emblemList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	emblemList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		local element = emblemList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	emblemList:linkToElementModel( emblemList, "isNonClickableEmblem", true, function ( model )
		local element = emblemList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isNonClickableEmblem"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_START )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	emblemList:linkToElementModel( emblemList, "isBMClassified", true, function ( model )
		local element = emblemList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	emblemList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
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
		return retVal
	end )
	emblemList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_START )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		return retVal
	end )
	emblemList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS", nil )
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
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "", nil )
			return false
		else
			return false
		end
	end, false )
	self:addElement( emblemList )
	self.emblemList = emblemList
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( 0, 1, 0, 0 )
	MenuFrame:setTopBottom( 0, 1, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_EMBLEMS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_EMBLEMS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_emblem" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local tabList = CoD.FE_TabBar.new( self, controller )
	tabList:setLeftRight( 0, 0, 0, 3746 )
	tabList:setTopBottom( 0, 0, 129, 191 )
	tabList.Tabs.grid:setHorizontalCount( 5 )
	tabList.Tabs.grid:setDataSource( "EmblemCategoryTabs" )
	tabList:registerEventHandler( "list_active_changed", function ( element, event )
		local retVal = nil
		EmblemSelect_TabChanged( self, element, controller )
		PlaySoundSetSound( self, "tab_changed" )
		return retVal
	end )
	self:addElement( tabList )
	self.tabList = tabList
	
	local usedSlotsTracker = CoD.EmblemSlotsFull.new( self, controller )
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
	usedSlotsTracker:setLeftRight( 0, 0, 1032, 1215 )
	usedSlotsTracker:setTopBottom( 0, 0, 879, 949 )
	usedSlotsTracker:subscribeToGlobalModel( controller, "PerController", "Emblem.UpdateDataSource", function ( model )
		local element = usedSlotsTracker
		UpdateSelfElementState( self, element, controller )
	end )
	self:addElement( usedSlotsTracker )
	self.usedSlotsTracker = usedSlotsTracker
	
	local SelfIdentityBadge = CoD.SelfIdentityBadge.new( self, controller )
	SelfIdentityBadge:setLeftRight( 1, 1, -652, -138 )
	SelfIdentityBadge:setTopBottom( 0, 0, 35, 125 )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", "identityBadge", function ( model )
		SelfIdentityBadge:setModel( model, controller )
	end )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", nil, function ( model )
		SelfIdentityBadge.CallingCard.CallingCardsFrameWidget:setModel( model, controller )
	end )
	self:addElement( SelfIdentityBadge )
	self.SelfIdentityBadge = SelfIdentityBadge
	
	local EmblemName = CoD.WeaponNameWidget.new( self, controller )
	EmblemName:setLeftRight( 0, 0, 1035, 1779 )
	EmblemName:setTopBottom( 0, 0, 687.5, 738.5 )
	self:addElement( EmblemName )
	self.EmblemName = EmblemName
	
	local EmblemSubtitle = LUI.UIText.new()
	EmblemSubtitle:setLeftRight( 0, 0, 1035, 1776 )
	EmblemSubtitle:setTopBottom( 0, 0, 750, 780 )
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
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			EmblemName.weaponNameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	EmblemSubtitle:linkToElementModel( emblemList, "subTitle", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			EmblemSubtitle:setText( Engine.Localize( modelValue ) )
		end
	end )
	emblemDrawWidget.navigation = {
		left = emblemList,
		up = SelfIdentityBadge
	}
	emblemList.navigation = {
		right = emblemDrawWidget
	}
	SelfIdentityBadge.navigation = {
		down = emblemDrawWidget
	}
	self.resetProperties = function ()
		tabList:completeAnimation()
		tabList:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		HideTabWidget = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				tabList:completeAnimation()
				self.tabList:setAlpha( 0 )
				self.clipFinished( tabList, {} )
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
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		ShowHeaderIconOnly( self )
		SetElementStateByElementName( self, "MenuFrame", controller, "Update" )
		PlayClipOnElement( self, {
			elementName = "MenuFrame",
			clipName = "Intro"
		}, controller )
		PlayClip( self, "Intro", controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		UploadStats( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		EmblemSelect_Back( self, element, controller )
	end )
	emblemDrawWidget.id = "emblemDrawWidget"
	emblemList.id = "emblemList"
	MenuFrame:setModel( self.buttonModel, controller )
	SelfIdentityBadge.id = "SelfIdentityBadge"
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FEMenuLeftGraphics:close()
		self.TitleDotsWidget0:close()
		self.cac3dTitleIntermediary0:close()
		self.emblemDrawWidget:close()
		self.emblemList:close()
		self.MenuFrame:close()
		self.tabList:close()
		self.usedSlotsTracker:close()
		self.SelfIdentityBadge:close()
		self.EmblemName:close()
		self.EmblemSubtitle:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "EmblemSelect.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

