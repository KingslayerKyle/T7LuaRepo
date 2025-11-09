require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.CAC.GridItemButtonBackdropContainer3x4" )
require( "ui.uieditor.widgets.CAC.WeaponAttributes" )
require( "ui.uieditor.widgets.Craft.WeaponBuildKits.WeaponBuildKitsAttachmentItemButtonND" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.CAC.GridItemButtonBackdropSymbols" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideListBoxes" )
require( "ui.uieditor.widgets.CAC.cac_3dTitleIntermediary" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )
require( "ui.uieditor.widgets.Gunsmith.GunSmithSubDescription" )

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
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "WeaponBuildKitsAttachmentSelect.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local TitleBacking0 = LUI.UIImage.new()
	TitleBacking0:setLeftRight( false, false, -649, 645 )
	TitleBacking0:setTopBottom( false, false, -361, -275 )
	TitleBacking0:setRGB( 0, 0, 0 )
	self:addElement( TitleBacking0 )
	self.TitleBacking0 = TitleBacking0
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( true, false, 64, 418 )
	LeftPanel:setTopBottom( true, false, 84, 667 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local FooterBacking = LUI.UIImage.new()
	FooterBacking:setLeftRight( false, false, -750, 750 )
	FooterBacking:setTopBottom( false, false, 297, 360 )
	FooterBacking:setRGB( 0, 0, 0 )
	self:addElement( FooterBacking )
	self.FooterBacking = FooterBacking
	
	local GridItemButtonBackdropContainer3x4 = CoD.GridItemButtonBackdropContainer3x4.new( self, controller )
	GridItemButtonBackdropContainer3x4:setLeftRight( true, false, 99, 443 )
	GridItemButtonBackdropContainer3x4:setTopBottom( true, false, 145.5, 601.5 )
	GridItemButtonBackdropContainer3x4:setAlpha( 0 )
	self:addElement( GridItemButtonBackdropContainer3x4 )
	self.GridItemButtonBackdropContainer3x4 = GridItemButtonBackdropContainer3x4
	
	local weaponAttributes = CoD.WeaponAttributes.new( self, controller )
	weaponAttributes:setLeftRight( true, false, 443, 862 )
	weaponAttributes:setTopBottom( false, true, -166, -62 )
	weaponAttributes:mergeStateConditions( {
		{
			stateName = "NotVisible",
			condition = function ( menu, element, event )
				return IsCACItemLocked( menu, element, controller )
			end
		}
	} )
	weaponAttributes:linkToElementModel( weaponAttributes, "itemIndex", true, function ( model )
		self:updateElementState( weaponAttributes, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( weaponAttributes )
	self.weaponAttributes = weaponAttributes
	
	local selectionList = LUI.UIList.new( self, controller, 7, 0, nil, true, false, 0, 0, false, false )
	selectionList:makeFocusable()
	selectionList:setLeftRight( true, false, 77, 415 )
	selectionList:setTopBottom( true, false, 137, 590 )
	selectionList:setDataSource( "GunsmithWeaponAttachments" )
	selectionList:setWidgetType( CoD.WeaponBuildKitsAttachmentItemButtonND )
	selectionList:setHorizontalCount( 3 )
	selectionList:setVerticalCount( 4 )
	selectionList:setSpacing( 7 )
	selectionList:setVerticalCounter( CoD.verticalCounter )
	selectionList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f6_local0 = nil
		Gunsmith_FocusAttachment( self, element, controller )
		return f6_local0
	end )
	selectionList:registerEventHandler( "gain_focus", function ( element, event )
		local f7_local0 = nil
		if element.gainFocus then
			f7_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f7_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		return f7_local0
	end )
	selectionList:registerEventHandler( "lose_focus", function ( element, event )
		local f8_local0 = nil
		if element.loseFocus then
			f8_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f8_local0 = element.super:loseFocus( event )
		end
		return f8_local0
	end )
	self:AddButtonCallbackFunction( selectionList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsAttachmentLockedInWeaponBuildKits( element, controller ) then
			Gunsmith_SelectAttachment( self, element, controller )
			GoBack( self, controller )
			ClearMenuSavedState( menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsAttachmentLockedInWeaponBuildKits( element, controller ) then
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( selectionList, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "T", function ( element, menu, controller, model )
		Gunsmith_Attachment_ToggleVariant( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "MENU_TOGGLE_ACV" )
		return true
	end, false )
	selectionList:mergeStateConditions( {
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsAttachmentLockedInWeaponBuildKits( element, controller )
			end
		},
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return Gunsmith_IsAttachmentEquipped( menu, element, controller )
			end
		},
		{
			stateName = "MutuallyExclusive",
			condition = function ( menu, element, event )
				return Gunsmith_IsItemMutuallyExclusiveWithSelection( element, controller )
			end
		}
	} )
	self:addElement( selectionList )
	self.selectionList = selectionList
	
	local GridItemButtonBackdropSymbols = CoD.GridItemButtonBackdropSymbols.new( self, controller )
	GridItemButtonBackdropSymbols:setLeftRight( true, false, 99, 1193.67 )
	GridItemButtonBackdropSymbols:setTopBottom( true, false, 145.5, 602.5 )
	GridItemButtonBackdropSymbols:setAlpha( 0 )
	GridItemButtonBackdropSymbols:setZoom( -7.02 )
	self:addElement( GridItemButtonBackdropSymbols )
	self.GridItemButtonBackdropSymbols = GridItemButtonBackdropSymbols
	
	local cacElemsSideListBoxes0 = CoD.cac_ElemsSideListBoxes.new( self, controller )
	cacElemsSideListBoxes0:setLeftRight( true, false, 18.87, 71.87 )
	cacElemsSideListBoxes0:setTopBottom( true, false, -12, 658 )
	self:addElement( cacElemsSideListBoxes0 )
	self.cacElemsSideListBoxes0 = cacElemsSideListBoxes0
	
	local cac3dTitleIntermediary0 = CoD.cac_3dTitleIntermediary.new( self, controller )
	cac3dTitleIntermediary0:setLeftRight( true, false, -72, 537 )
	cac3dTitleIntermediary0:setTopBottom( true, false, -4, 142 )
	cac3dTitleIntermediary0:subscribeToGlobalModel( controller, "Customization", "weapon_index", function ( model )
		local weaponIndex = Engine.GetModelValue( model )
		if weaponIndex then
			cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( LocalizeWeaponNameIntoString( "MENU_GUNSMITH_ATTACHMENT_SELECT_TITLE", controller, weaponIndex ) ) )
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
	
	local WeaponNameWidget0 = CoD.WeaponNameWidget.new( self, controller )
	WeaponNameWidget0:setLeftRight( true, false, 431, 812 )
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
	
	local variantName = LUI.UIText.new()
	variantName:setLeftRight( true, false, 83, 283 )
	variantName:setTopBottom( true, false, 97, 122 )
	variantName:setText( Engine.Localize( "MENU_VARIANTS_CAPS" ) )
	variantName:setTTF( "fonts/default.ttf" )
	variantName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	variantName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( variantName )
	self.variantName = variantName
	
	local GunSmithSubDescription0 = CoD.GunSmithSubDescription.new( self, controller )
	GunSmithSubDescription0:setLeftRight( true, false, 431, 684 )
	GunSmithSubDescription0:setTopBottom( true, false, 174.5, 211.5 )
	self:addElement( GunSmithSubDescription0 )
	self.GunSmithSubDescription0 = GunSmithSubDescription0
	
	weaponAttributes:linkToElementModel( selectionList, "weaponAttributes", false, function ( model )
		weaponAttributes:setModel( model, controller )
	end )
	WeaponNameWidget0:linkToElementModel( selectionList, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			WeaponNameWidget0.weaponNameLabel:setText( Engine.Localize( name ) )
		end
	end )
	GunSmithSubDescription0:linkToElementModel( selectionList, "attachmentIndex", true, function ( model )
		local attachmentIndex = Engine.GetModelValue( model )
		if attachmentIndex then
			GunSmithSubDescription0.weaponDescTextBox:setText( Engine.Localize( GetWeaponBuildKitsAttachmentDescription( controller, attachmentIndex ) ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				weaponAttributes:completeAnimation()
				self.weaponAttributes:setLeftRight( true, false, 459, 878 )
				self.weaponAttributes:setTopBottom( false, true, -166, -62 )
				self.clipFinished( weaponAttributes, {} )
				GridItemButtonBackdropSymbols:completeAnimation()
				self.GridItemButtonBackdropSymbols:setLeftRight( true, false, 93.66, 1188.34 )
				self.GridItemButtonBackdropSymbols:setTopBottom( true, false, 145.5, 602.5 )
				self.clipFinished( GridItemButtonBackdropSymbols, {} )
				variantName:completeAnimation()
				self.variantName:setAlpha( 1 )
				self.clipFinished( variantName, {} )
				GunSmithSubDescription0:completeAnimation()
				self.GunSmithSubDescription0:setAlpha( 1 )
				self.clipFinished( GunSmithSubDescription0, {} )
			end
		}
	}
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		ClearMenuSavedState( menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	selectionList.id = "selectionList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
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
		element.GunSmithSubDescription0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "WeaponBuildKitsAttachmentSelect.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

