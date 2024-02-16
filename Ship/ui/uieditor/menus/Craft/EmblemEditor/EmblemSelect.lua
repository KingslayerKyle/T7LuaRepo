-- 66d20079e9fc9e8087c1109e5a9d896c
-- This hash is used for caching, delete to decompile the file again

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

local f0_local2 = function ( f5_arg0, f5_arg1 )
	f5_arg0.emblemList:registerEventHandler( "input_source_changed", function ( element, event )
		if not f5_arg0.occludedBy then
			element:updateDataSource()
		end
	end )
end

local PostLoadFunc = function ( f7_arg0, f7_arg1 )
	f7_arg0.emblemList.navigation.right = nil
	if CoD.isPC then
		f0_local2( f7_arg0, f7_arg1 )
	end
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
	local f8_local1 = self
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
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f8_local1, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 18, 70 )
	FEMenuLeftGraphics:setTopBottom( true, false, 91, 708.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local TitleDotsWidget0 = CoD.TitleDotsWidget.new( f8_local1, controller )
	TitleDotsWidget0:setLeftRight( true, false, 3, 528.34 )
	TitleDotsWidget0:setTopBottom( true, false, -65.33, 92.67 )
	TitleDotsWidget0:setAlpha( 0 )
	self:addElement( TitleDotsWidget0 )
	self.TitleDotsWidget0 = TitleDotsWidget0
	
	local cac3dTitleIntermediary0 = CoD.cac_3dTitleIntermediary.new( f8_local1, controller )
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
	
	local emblemDrawWidget = CoD.EmblemDrawWidgetNew.new( f8_local1, controller )
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
		f8_local1:updateElementState( emblemDrawWidget, {
			name = "model_validation",
			menu = f8_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		} )
	end )
	self:addElement( emblemDrawWidget )
	self.emblemDrawWidget = emblemDrawWidget
	
	local emblemList = LUI.UIList.new( f8_local1, controller, 10, 0, nil, true, false, 0, 0, false, false )
	emblemList:makeFocusable()
	emblemList:setLeftRight( true, false, 78, 626 )
	emblemList:setTopBottom( true, false, 137, 599 )
	emblemList:setWidgetType( CoD.EmblemItem )
	emblemList:setHorizontalCount( 3 )
	emblemList:setVerticalCount( 4 )
	emblemList:setSpacing( 10 )
	emblemList:setDataSource( "EmblemsList" )
	emblemList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ), function ( model )
		local f12_local0 = emblemList
		local f12_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		}
		CoD.Menu.UpdateButtonShownState( f12_local0, f8_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	emblemList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		local f13_local0 = emblemList
		local f13_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		}
		CoD.Menu.UpdateButtonShownState( f13_local0, f8_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	emblemList:linkToElementModel( emblemList, "isNonClickableEmblem", true, function ( model )
		local f14_local0 = emblemList
		local f14_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isNonClickableEmblem"
		}
		CoD.Menu.UpdateButtonShownState( f14_local0, f8_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( f14_local0, f8_local1, controller, Enum.LUIButton.LUI_KEY_START )
		CoD.Menu.UpdateButtonShownState( f14_local0, f8_local1, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	emblemList:linkToElementModel( emblemList, "isBMClassified", true, function ( model )
		local f15_local0 = emblemList
		local f15_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		}
		CoD.Menu.UpdateButtonShownState( f15_local0, f8_local1, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	emblemList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f16_local0 = nil
		if IsElementInState( element, "New" ) then
			EmblemSelect_GainFocus( self, element, controller )
			SetHintText( self, element, controller )
			UpdateElementState( self, "emblemDrawWidget", controller )
			Emblems_SetEmblemOld( f8_local1, element, controller )
			UpdateSelfElementState( f8_local1, element, controller )
		else
			EmblemSelect_GainFocus( self, element, controller )
			SetHintText( self, element, controller )
			UpdateElementState( self, "emblemDrawWidget", controller )
		end
		return f16_local0
	end )
	emblemList:registerEventHandler( "gain_focus", function ( element, event )
		local f17_local0 = nil
		if element.gainFocus then
			f17_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f17_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f8_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, f8_local1, controller, Enum.LUIButton.LUI_KEY_START )
		CoD.Menu.UpdateButtonShownState( element, f8_local1, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		return f17_local0
	end )
	emblemList:registerEventHandler( "lose_focus", function ( element, event )
		local f18_local0 = nil
		if element.loseFocus then
			f18_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f18_local0 = element.super:loseFocus( event )
		end
		return f18_local0
	end )
	f8_local1:AddButtonCallbackFunction( emblemList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3 )
		if IsLive() and IsSelfModelValueEqualTo( f19_arg0, f19_arg2, "isNonClickableEmblem", 0 ) and not IsElementInState( f19_arg0, "BMClassified" ) and Emblems_CanEnterEmblemEditor( f19_arg0, f19_arg2 ) and not CraftItemIsReadOnly( f19_arg0, f19_arg2 ) and not SelectingGroupEmblem( f19_arg2 ) then
			OpenEmblemEditor( f19_arg0, f19_arg1, f19_arg2, f19_arg3, "EmblemSelect" )
			return true
		elseif CraftItemIsReadOnly( f19_arg0, f19_arg2 ) and not SelectingGroupEmblem( f19_arg2 ) then
			FileshareShowReadonlyToast( self, f19_arg0, f19_arg2 )
			return true
		else
			
		end
	end, function ( f20_arg0, f20_arg1, f20_arg2 )
		CoD.Menu.SetButtonLabel( f20_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if IsLive() and IsSelfModelValueEqualTo( f20_arg0, f20_arg2, "isNonClickableEmblem", 0 ) and not IsElementInState( f20_arg0, "BMClassified" ) and Emblems_CanEnterEmblemEditor( f20_arg0, f20_arg2 ) and not CraftItemIsReadOnly( f20_arg0, f20_arg2 ) and not SelectingGroupEmblem( f20_arg2 ) then
			return true
		elseif CraftItemIsReadOnly( f20_arg0, f20_arg2 ) and not SelectingGroupEmblem( f20_arg2 ) then
			return true
		else
			return false
		end
	end, true )
	f8_local1:AddButtonCallbackFunction( emblemList, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( f21_arg0, f21_arg1, f21_arg2, f21_arg3 )
		if Emblem_IsOccupied( f21_arg0, f21_arg2 ) and IsSelfModelValueEqualTo( f21_arg0, f21_arg2, "isNonClickableEmblem", 0 ) and not IsPreBuiltEmblemTab( f21_arg2 ) and not SelectingGroupEmblem( f21_arg2 ) then
			OpenPopup( self, "EmblemSelectOptions", f21_arg2, "", "" )
			return true
		else
			
		end
	end, function ( f22_arg0, f22_arg1, f22_arg2 )
		CoD.Menu.SetButtonLabel( f22_arg1, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS" )
		if Emblem_IsOccupied( f22_arg0, f22_arg2 ) and IsSelfModelValueEqualTo( f22_arg0, f22_arg2, "isNonClickableEmblem", 0 ) and not IsPreBuiltEmblemTab( f22_arg2 ) and not SelectingGroupEmblem( f22_arg2 ) then
			return true
		else
			return false
		end
	end, true )
	f8_local1:AddButtonCallbackFunction( emblemList, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "S", function ( f23_arg0, f23_arg1, f23_arg2, f23_arg3 )
		if Emblem_IsOccupied( f23_arg0, f23_arg2 ) and IsSelfModelValueEqualTo( f23_arg0, f23_arg2, "isNonClickableEmblem", 0 ) and not IsSelfModelValueTrue( f23_arg0, f23_arg2, "isBMClassified" ) then
			EmblemSelect_SetAsEmblem( self, f23_arg0, f23_arg2 )
			PlaySoundSetSound( self, "toggle" )
			UpdateSelfState( self, f23_arg2 )
			return true
		else
			
		end
	end, function ( f24_arg0, f24_arg1, f24_arg2 )
		if Emblem_IsOccupied( f24_arg0, f24_arg2 ) and IsSelfModelValueEqualTo( f24_arg0, f24_arg2, "isNonClickableEmblem", 0 ) and not IsSelfModelValueTrue( f24_arg0, f24_arg2, "isBMClassified" ) then
			CoD.Menu.SetButtonLabel( f24_arg1, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "" )
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
		f8_local1:updateElementState( emblemList, {
			name = "model_validation",
			menu = f8_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		} )
	end )
	emblemList:linkToElementModel( emblemList, "emblemIndex", true, function ( model )
		f8_local1:updateElementState( emblemList, {
			name = "model_validation",
			menu = f8_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "emblemIndex"
		} )
	end )
	emblemList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ), function ( model )
		f8_local1:updateElementState( emblemList, {
			name = "model_validation",
			menu = f8_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		} )
	end )
	emblemList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		f8_local1:updateElementState( emblemList, {
			name = "model_validation",
			menu = f8_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	emblemList:linkToElementModel( emblemList, "isNonClickableEmblem", true, function ( model )
		f8_local1:updateElementState( emblemList, {
			name = "model_validation",
			menu = f8_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isNonClickableEmblem"
		} )
	end )
	self:addElement( emblemList )
	self.emblemList = emblemList
	
	local MenuFrame = CoD.GenericMenuFrame.new( f8_local1, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_EMBLEMS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_EMBLEMS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_emblem" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local tabList = CoD.FE_TabBar.new( f8_local1, controller )
	tabList:setLeftRight( true, false, 0, 2497 )
	tabList:setTopBottom( true, false, 86, 127 )
	tabList.Tabs.grid:setHorizontalCount( 5 )
	tabList.Tabs.grid:setDataSource( "EmblemCategoryTabs" )
	tabList:registerEventHandler( "list_active_changed", function ( element, event )
		local f33_local0 = nil
		EmblemSelect_TabChanged( self, element, controller )
		PlaySoundSetSound( self, "tab_changed" )
		return f33_local0
	end )
	self:addElement( tabList )
	self.tabList = tabList
	
	local usedSlotsTracker = CoD.EmblemSlotsFull.new( f8_local1, controller )
	usedSlotsTracker:setLeftRight( true, false, 688, 810 )
	usedSlotsTracker:setTopBottom( true, false, 586, 633 )
	usedSlotsTracker:subscribeToGlobalModel( controller, "PerController", "Emblem.UpdateDataSource", function ( model )
		UpdateSelfElementState( f8_local1, usedSlotsTracker, controller )
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
		f8_local1:updateElementState( usedSlotsTracker, {
			name = "model_validation",
			menu = f8_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		} )
	end )
	usedSlotsTracker:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		f8_local1:updateElementState( usedSlotsTracker, {
			name = "model_validation",
			menu = f8_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	self:addElement( usedSlotsTracker )
	self.usedSlotsTracker = usedSlotsTracker
	
	local SelfIdentityBadge = CoD.SelfIdentityBadge.new( f8_local1, controller )
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
	
	local EmblemName = CoD.WeaponNameWidget.new( f8_local1, controller )
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
		f8_local1:updateElementState( self, {
			name = "model_validation",
			menu = f8_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		f8_local1:updateElementState( self, {
			name = "model_validation",
			menu = f8_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	CoD.Menu.AddNavigationHandler( f8_local1, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f50_local0 = nil
		ShowHeaderIconOnly( f8_local1 )
		SetElementStateByElementName( self, "MenuFrame", controller, "Update" )
		PlayClipOnElement( self, {
			elementName = "MenuFrame",
			clipName = "Intro"
		}, controller )
		PlayClip( self, "Intro", controller )
		if not f50_local0 then
			f50_local0 = element:dispatchEventToChildren( event )
		end
		return f50_local0
	end )
	f8_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f51_arg0, f51_arg1, f51_arg2, f51_arg3 )
		GoBack( self, f51_arg2 )
		UploadStats( self, f51_arg2 )
		return true
	end, function ( f52_arg0, f52_arg1, f52_arg2 )
		CoD.Menu.SetButtonLabel( f52_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
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
		menu = f8_local1
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

