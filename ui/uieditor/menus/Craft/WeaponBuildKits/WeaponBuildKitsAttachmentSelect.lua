-- 57a7581120f4e859e8437736418f4f10
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.CAC.GridItemButtonBackdropContainer3x4" )
require( "ui.uieditor.widgets.CAC.WeaponAttributes" )
require( "ui.uieditor.widgets.Craft.WeaponBuildKits.WeaponBuildKitsAttachmentItemButtonND" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.CAC.GridItemButtonBackdropSymbols" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideListBoxes" )
require( "ui.uieditor.widgets.CAC.cac_3dTitleIntermediary" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )
require( "ui.uieditor.widgets.Craft.WeaponBuildKits.WeaponBuildKitsLockIcon" )
require( "ui.uieditor.widgets.Gunsmith.GunSmithSubDescription" )
require( "ui.uieditor.widgets.CAC.WeaponAttributes_Internal" )
require( "ui.uieditor.widgets.CAC.cac_LockBig" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.PC.Utility.XCamMouseControl" )

local PreLoadFunc = function ( self, controller )
	self:setModel( CoD.perController[controller].gunsmithAttachmentModel )
	self.restoreState = function ( f2_arg0 )
		f2_arg0.selectionList:findItem( {
			attachmentIndex = Engine.GetModelValue( f2_arg0:getModel() )
		}, nil, true, nil )
	end
	
end

LUI.createMenu.WeaponBuildKitsAttachmentSelect = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "WeaponBuildKitsAttachmentSelect" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "WeaponBuildKitsAttachmentSelect.buttonPrompts" )
	local f3_local1 = self
	self.anyChildUsesUpdateState = true
	
	local TitleBacking0 = LUI.UIImage.new()
	TitleBacking0:setLeftRight( false, false, -649, 645 )
	TitleBacking0:setTopBottom( false, false, -361, -275 )
	TitleBacking0:setRGB( 0, 0, 0 )
	self:addElement( TitleBacking0 )
	self.TitleBacking0 = TitleBacking0
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( f3_local1, controller )
	LeftPanel:setLeftRight( true, false, 64, 430 )
	LeftPanel:setTopBottom( true, false, 84, 667 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local GridItemButtonBackdropContainer3x4 = CoD.GridItemButtonBackdropContainer3x4.new( f3_local1, controller )
	GridItemButtonBackdropContainer3x4:setLeftRight( true, false, 99, 443 )
	GridItemButtonBackdropContainer3x4:setTopBottom( true, false, 145.5, 601.5 )
	GridItemButtonBackdropContainer3x4:setAlpha( 0 )
	self:addElement( GridItemButtonBackdropContainer3x4 )
	self.GridItemButtonBackdropContainer3x4 = GridItemButtonBackdropContainer3x4
	
	local weaponAttributes = CoD.WeaponAttributes.new( f3_local1, controller )
	weaponAttributes:setLeftRight( true, false, 443, 862 )
	weaponAttributes:setTopBottom( false, true, -166, -62 )
	weaponAttributes:setAlpha( 0 )
	weaponAttributes:mergeStateConditions( {
		{
			stateName = "NotVisible",
			condition = function ( menu, element, event )
				return IsCACItemLocked( menu, element, controller )
			end
		}
	} )
	weaponAttributes:linkToElementModel( weaponAttributes, "itemIndex", true, function ( model )
		f3_local1:updateElementState( weaponAttributes, {
			name = "model_validation",
			menu = f3_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( weaponAttributes )
	self.weaponAttributes = weaponAttributes
	
	local selectionList = LUI.UIList.new( f3_local1, controller, 7, 0, nil, true, false, 0, 0, false, false )
	selectionList:makeFocusable()
	selectionList:setLeftRight( true, false, 77, 415 )
	selectionList:setTopBottom( true, false, 137, 590 )
	selectionList:setWidgetType( CoD.WeaponBuildKitsAttachmentItemButtonND )
	selectionList:setHorizontalCount( 3 )
	selectionList:setVerticalCount( 4 )
	selectionList:setSpacing( 7 )
	selectionList:setVerticalCounter( CoD.verticalCounter )
	selectionList:setDataSource( "GunsmithWeaponAttachments" )
	selectionList:linkToElementModel( selectionList, nil, true, function ( model )
		local f6_local0 = selectionList
		local f6_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		}
		CoD.Menu.UpdateButtonShownState( f6_local0, f3_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	selectionList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f7_local0 = nil
		if Gunsmith_IsAttachmentNew( f3_local1, element, controller ) then
			Gunsmith_SetAttachmentAsOld( element, controller )
			UpdateSelfElementState( f3_local1, element, controller )
			Gunsmith_FocusAttachment( self, element, controller, false )
		else
			Gunsmith_FocusAttachment( self, element, controller, false )
		end
		return f7_local0
	end )
	selectionList:registerEventHandler( "gain_focus", function ( element, event )
		local f8_local0 = nil
		if element.gainFocus then
			f8_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f8_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f3_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f8_local0
	end )
	selectionList:registerEventHandler( "lose_focus", function ( element, event )
		local f9_local0 = nil
		if element.loseFocus then
			f9_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f9_local0 = element.super:loseFocus( event )
		end
		return f9_local0
	end )
	f3_local1:AddButtonCallbackFunction( selectionList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
		if not IsAttachmentLockedInWeaponBuildKits( f10_arg0, f10_arg2 ) then
			Gunsmith_SelectAttachment( self, f10_arg0, f10_arg2 )
			GoBack( self, f10_arg2 )
			ClearMenuSavedState( f10_arg1 )
			return true
		else
			
		end
	end, function ( f11_arg0, f11_arg1, f11_arg2 )
		if not IsAttachmentLockedInWeaponBuildKits( f11_arg0, f11_arg2 ) then
			CoD.Menu.SetButtonLabel( f11_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	selectionList:mergeStateConditions( {
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return Gunsmith_IsAttachmentEquipped( menu, element, controller )
			end
		},
		{
			stateName = "New",
			condition = function ( menu, element, event )
				return Gunsmith_IsAttachmentNew( menu, element, controller )
			end
		},
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsAttachmentLockedInWeaponBuildKits( element, controller )
			end
		},
		{
			stateName = "MutuallyExclusive",
			condition = function ( menu, element, event )
				return Gunsmith_IsItemMutuallyExclusiveWithSelection( element, controller )
			end
		}
	} )
	selectionList:linkToElementModel( selectionList, nil, true, function ( model )
		f3_local1:updateElementState( selectionList, {
			name = "model_validation",
			menu = f3_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		} )
	end )
	self:addElement( selectionList )
	self.selectionList = selectionList
	
	local GridItemButtonBackdropSymbols = CoD.GridItemButtonBackdropSymbols.new( f3_local1, controller )
	GridItemButtonBackdropSymbols:setLeftRight( true, false, 99, 1193.67 )
	GridItemButtonBackdropSymbols:setTopBottom( true, false, 145.5, 602.5 )
	GridItemButtonBackdropSymbols:setAlpha( 0 )
	GridItemButtonBackdropSymbols:setZoom( -7.02 )
	self:addElement( GridItemButtonBackdropSymbols )
	self.GridItemButtonBackdropSymbols = GridItemButtonBackdropSymbols
	
	local cacElemsSideListBoxes0 = CoD.cac_ElemsSideListBoxes.new( f3_local1, controller )
	cacElemsSideListBoxes0:setLeftRight( true, false, 18.87, 71.87 )
	cacElemsSideListBoxes0:setTopBottom( true, false, -12, 658 )
	self:addElement( cacElemsSideListBoxes0 )
	self.cacElemsSideListBoxes0 = cacElemsSideListBoxes0
	
	local cac3dTitleIntermediary0 = CoD.cac_3dTitleIntermediary.new( f3_local1, controller )
	cac3dTitleIntermediary0:setLeftRight( true, false, -72, 537 )
	cac3dTitleIntermediary0:setTopBottom( true, false, -4, 142 )
	cac3dTitleIntermediary0:setAlpha( 0 )
	cac3dTitleIntermediary0:subscribeToGlobalModel( controller, "Customization", "weapon_index", function ( model )
		local weaponIndex = Engine.GetModelValue( model )
		if weaponIndex then
			cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( LocalizeWeaponNameIntoString( "MENU_GUNSMITH_ATTACHMENT_SELECT_TITLE", "zm", controller, weaponIndex ) )
		end
	end )
	self:addElement( cac3dTitleIntermediary0 )
	self.cac3dTitleIntermediary0 = cac3dTitleIntermediary0
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( true, false, -11, 1293 )
	CategoryListLine0:setTopBottom( true, false, 80, 88 )
	CategoryListLine0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local WeaponNameWidget0 = CoD.WeaponNameWidget.new( f3_local1, controller )
	WeaponNameWidget0:setLeftRight( true, false, 447, 828 )
	WeaponNameWidget0:setTopBottom( true, false, 137, 171 )
	self:addElement( WeaponNameWidget0 )
	self.WeaponNameWidget0 = WeaponNameWidget0
	
	local BlackHeader = LUI.UIImage.new()
	BlackHeader:setLeftRight( true, false, 77, 413 )
	BlackHeader:setTopBottom( true, false, 92.5, 124.5 )
	BlackHeader:setRGB( 0, 0, 0 )
	BlackHeader:setAlpha( 0.44 )
	self:addElement( BlackHeader )
	self.BlackHeader = BlackHeader
	
	local LockIcon = CoD.WeaponBuildKitsLockIcon.new( f3_local1, controller )
	LockIcon:setLeftRight( true, false, 732, 828 )
	LockIcon:setTopBottom( true, false, 14, 684 )
	LockIcon:mergeStateConditions( {
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsAttachmentLockedInWeaponBuildKits( element, controller )
			end
		}
	} )
	LockIcon:linkToElementModel( LockIcon, nil, true, function ( model )
		f3_local1:updateElementState( LockIcon, {
			name = "model_validation",
			menu = f3_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		} )
	end )
	self:addElement( LockIcon )
	self.LockIcon = LockIcon
	
	local variantName = LUI.UIText.new()
	variantName:setLeftRight( true, false, 83, 283 )
	variantName:setTopBottom( true, false, 97, 122 )
	variantName:setAlpha( 0 )
	variantName:setText( Engine.Localize( "MENU_VARIANTS_CAPS" ) )
	variantName:setTTF( "fonts/default.ttf" )
	variantName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	variantName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( variantName )
	self.variantName = variantName
	
	local GunSmithSubDescription0 = CoD.GunSmithSubDescription.new( f3_local1, controller )
	GunSmithSubDescription0:setLeftRight( true, false, 447, 700 )
	GunSmithSubDescription0:setTopBottom( true, false, 174.5, 211.5 )
	self:addElement( GunSmithSubDescription0 )
	self.GunSmithSubDescription0 = GunSmithSubDescription0
	
	local WeaponAttributes = CoD.WeaponAttributes_Internal.new( f3_local1, controller )
	WeaponAttributes:setLeftRight( true, false, 448, 820 )
	WeaponAttributes:setTopBottom( true, false, 554, 638 )
	self:addElement( WeaponAttributes )
	self.WeaponAttributes = WeaponAttributes
	
	local lockedIcon = CoD.cac_LockBig.new( f3_local1, controller )
	lockedIcon:setLeftRight( true, false, 764, 860 )
	lockedIcon:setTopBottom( true, false, -97, 573 )
	lockedIcon:setAlpha( 0 )
	lockedIcon:linkToElementModel( self, nil, false, function ( model )
		lockedIcon:setModel( model, controller )
	end )
	self:addElement( lockedIcon )
	self.lockedIcon = lockedIcon
	
	local MenuFrame = CoD.GenericMenuFrame.new( f3_local1, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_gunsmith" ) )
	MenuFrame:subscribeToGlobalModel( controller, "Customization", "weapon_index", function ( model )
		local weaponIndex = Engine.GetModelValue( model )
		if weaponIndex then
			MenuFrame.titleLabel:setText( LocalizeWeaponNameIntoString( "MENU_GUNSMITH_ATTACHMENT_SELECT_TITLE", "zm", controller, weaponIndex ) )
		end
	end )
	MenuFrame:subscribeToGlobalModel( controller, "Customization", "weapon_index", function ( model )
		local weaponIndex = Engine.GetModelValue( model )
		if weaponIndex then
			MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( LocalizeWeaponNameIntoString( "MENU_GUNSMITH_ATTACHMENT_SELECT_TITLE", "zm", controller, weaponIndex ) )
		end
	end )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local XCamMouseControl = CoD.XCamMouseControl.new( f3_local1, controller )
	XCamMouseControl:setLeftRight( false, true, -753, -152 )
	XCamMouseControl:setTopBottom( true, true, 227.5, -190.11 )
	self:addElement( XCamMouseControl )
	self.XCamMouseControl = XCamMouseControl
	
	weaponAttributes:linkToElementModel( selectionList, "weaponAttributes", false, function ( model )
		weaponAttributes:setModel( model, controller )
	end )
	WeaponNameWidget0:linkToElementModel( selectionList, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			WeaponNameWidget0.weaponNameLabel:setText( Engine.Localize( name ) )
		end
	end )
	LockIcon:linkToElementModel( selectionList, nil, false, function ( model )
		LockIcon:setModel( model, controller )
	end )
	GunSmithSubDescription0:linkToElementModel( selectionList, "attachmentIndex", true, function ( model )
		local attachmentIndex = Engine.GetModelValue( model )
		if attachmentIndex then
			GunSmithSubDescription0.weaponDescTextBox:setText( Engine.Localize( GetWeaponBuildKitsAttachmentDescription( controller, attachmentIndex ) ) )
		end
	end )
	WeaponAttributes:linkToElementModel( selectionList, "weaponAttributes", false, function ( model )
		WeaponAttributes:setModel( model, controller )
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				GridItemButtonBackdropSymbols:completeAnimation()
				self.GridItemButtonBackdropSymbols:setLeftRight( true, false, 93.66, 1188.34 )
				self.GridItemButtonBackdropSymbols:setTopBottom( true, false, 145.5, 602.5 )
				self.clipFinished( GridItemButtonBackdropSymbols, {} )
				variantName:completeAnimation()
				self.variantName:setAlpha( 0 )
				self.clipFinished( variantName, {} )
				GunSmithSubDescription0:completeAnimation()
				self.GunSmithSubDescription0:setAlpha( 1 )
				self.clipFinished( GunSmithSubDescription0, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
			end
		}
	}
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f29_local0 = nil
		ShowHeaderKickerAndIcon( f3_local1 )
		SetHeadingKickerTextToGameMode( "MENU_ZOMBIES_CAPS" )
		if not f29_local0 then
			f29_local0 = element:dispatchEventToChildren( event )
		end
		return f29_local0
	end )
	self:registerEventHandler( "menu_opened", function ( element, event )
		local f30_local0 = nil
		if not IsLAN() then
			SetHeadingKickerText( "MPUI_PUBLIC_MATCH_LOBBY" )
		end
		if not f30_local0 then
			f30_local0 = element:dispatchEventToChildren( event )
		end
		return f30_local0
	end )
	f3_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f31_arg0, f31_arg1, f31_arg2, f31_arg3 )
		GoBack( self, f31_arg2 )
		ClearMenuSavedState( f31_arg1 )
		return true
	end, function ( f32_arg0, f32_arg1, f32_arg2 )
		CoD.Menu.SetButtonLabel( f32_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	f3_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f33_arg0, f33_arg1, f33_arg2, f33_arg3 )
		return true
	end, function ( f34_arg0, f34_arg1, f34_arg2 )
		CoD.Menu.SetButtonLabel( f34_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	f3_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, function ( f35_arg0, f35_arg1, f35_arg2, f35_arg3 )
		return true
	end, function ( f36_arg0, f36_arg1, f36_arg2 )
		CoD.Menu.SetButtonLabel( f36_arg1, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "PLATFORM_EMBLEM_ROTATE_LAYER" )
		return true
	end, false )
	selectionList.id = "selectionList"
	MenuFrame:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f3_local1
	} )
	if not self:restoreState() then
		self.selectionList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LeftPanel:close()
		element.GridItemButtonBackdropContainer3x4:close()
		element.weaponAttributes:close()
		element.selectionList:close()
		element.GridItemButtonBackdropSymbols:close()
		element.cacElemsSideListBoxes0:close()
		element.cac3dTitleIntermediary0:close()
		element.WeaponNameWidget0:close()
		element.LockIcon:close()
		element.GunSmithSubDescription0:close()
		element.WeaponAttributes:close()
		element.lockedIcon:close()
		element.MenuFrame:close()
		element.XCamMouseControl:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "WeaponBuildKitsAttachmentSelect.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

