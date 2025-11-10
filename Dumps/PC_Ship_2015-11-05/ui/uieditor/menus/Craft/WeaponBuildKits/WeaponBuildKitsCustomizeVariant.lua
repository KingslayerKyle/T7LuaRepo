require( "ui.uieditor.widgets.CAC.TitleDotsWidget" )
require( "ui.uieditor.widgets.CAC.cac_3dTitleIntermediary" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfoPaneItemName" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.ZMInventory.WeaponBuildkits.WeaponBuildKitsVariantDescription" )
require( "ui.uieditor.widgets.PC.Utility.XCamMouseControl" )
require( "ui.uieditor.widgets.Craft.WeaponBuildKits.WeaponBuildKitsVariantAttachmentList" )

local PreLoadFunc = function ( self, controller )
	local f1_local0 = CoD.perController[controller].gunsmithVariantModel
	self:setModel( f1_local0 )
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( controller, f1_local0, true )
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	local f2_local0 = Engine.Localize( Engine.GetItemName( CoD.GetCustomization( f2_arg1, "weapon_index" ) ) )
	local f2_local1 = Engine.GetModelValue( f2_arg0:getModel( f2_arg1, "variantName" ) )
	f2_arg0.InfoPaneItemName.weaponNameWithVariant:setState( "ShowVariant" )
end

LUI.createMenu.WeaponBuildKitsCustomizeVariant = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "WeaponBuildKitsCustomizeVariant" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "WeaponBuildKitsCustomizeVariant.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local TitleBacking0 = LUI.UIImage.new()
	TitleBacking0:setLeftRight( false, false, -649, 645 )
	TitleBacking0:setTopBottom( false, false, -361, -275 )
	TitleBacking0:setRGB( 0, 0, 0 )
	self:addElement( TitleBacking0 )
	self.TitleBacking0 = TitleBacking0
	
	local TitleDotsWidget0 = CoD.TitleDotsWidget.new( self, controller )
	TitleDotsWidget0:setLeftRight( true, false, -221, 304.34 )
	TitleDotsWidget0:setTopBottom( true, false, -286.33, -128.33 )
	TitleDotsWidget0:setAlpha( 0 )
	self:addElement( TitleDotsWidget0 )
	self.TitleDotsWidget0 = TitleDotsWidget0
	
	local cac3dTitleIntermediary0 = CoD.cac_3dTitleIntermediary.new( self, controller )
	cac3dTitleIntermediary0:setLeftRight( true, false, -72, 927 )
	cac3dTitleIntermediary0:setTopBottom( true, false, -4, 142 )
	cac3dTitleIntermediary0:setAlpha( 0 )
	cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_WEAPON_BUILD_KITS_CAPS" ) )
	self:addElement( cac3dTitleIntermediary0 )
	self.cac3dTitleIntermediary0 = cac3dTitleIntermediary0
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( true, false, -11, 1293 )
	CategoryListLine0:setTopBottom( true, false, 80, 88 )
	CategoryListLine0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local FooterBacking = LUI.UIImage.new()
	FooterBacking:setLeftRight( false, false, -750, 750 )
	FooterBacking:setTopBottom( false, false, 297, 360 )
	FooterBacking:setRGB( 0, 0, 0 )
	FooterBacking:setAlpha( 0 )
	self:addElement( FooterBacking )
	self.FooterBacking = FooterBacking
	
	local Pixel20 = LUI.UIImage.new()
	Pixel20:setLeftRight( true, false, 31.87, 67.87 )
	Pixel20:setTopBottom( true, false, 623, 627 )
	Pixel20:setYRot( -180 )
	Pixel20:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel20:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel20 )
	self.Pixel20 = Pixel20
	
	local Pixel200 = LUI.UIImage.new()
	Pixel200:setLeftRight( true, false, 31.87, 67.87 )
	Pixel200:setTopBottom( true, false, 560, 564 )
	Pixel200:setYRot( -180 )
	Pixel200:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel200:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel200 )
	self.Pixel200 = Pixel200
	
	local Pixel201 = LUI.UIImage.new()
	Pixel201:setLeftRight( true, false, 754.87, 790.87 )
	Pixel201:setTopBottom( true, false, 623, 627 )
	Pixel201:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel201:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel201 )
	self.Pixel201 = Pixel201
	
	local Pixel2000 = LUI.UIImage.new()
	Pixel2000:setLeftRight( true, false, 754.87, 790.87 )
	Pixel2000:setTopBottom( true, false, 560, 564 )
	Pixel2000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2000 )
	self.Pixel2000 = Pixel2000
	
	local Image000000 = LUI.UIImage.new()
	Image000000:setLeftRight( true, false, 140.87, 156.87 )
	Image000000:setTopBottom( true, false, 558, 566 )
	Image000000:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image000000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image000000 )
	self.Image000000 = Image000000
	
	local Image0000000 = LUI.UIImage.new()
	Image0000000:setLeftRight( true, false, 140.87, 156.87 )
	Image0000000:setTopBottom( true, false, 621, 629 )
	Image0000000:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image0000000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0000000 )
	self.Image0000000 = Image0000000
	
	local Image0000001 = LUI.UIImage.new()
	Image0000001:setLeftRight( true, false, 531.87, 547.87 )
	Image0000001:setTopBottom( true, false, 558, 566 )
	Image0000001:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image0000001:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0000001 )
	self.Image0000001 = Image0000001
	
	local Image00000000 = LUI.UIImage.new()
	Image00000000:setLeftRight( true, false, 531.87, 547.87 )
	Image00000000:setTopBottom( true, false, 621, 629 )
	Image00000000:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image00000000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image00000000 )
	self.Image00000000 = Image00000000
	
	local Image00000010 = LUI.UIImage.new()
	Image00000010:setLeftRight( true, false, 663.87, 679.87 )
	Image00000010:setTopBottom( true, false, 558, 566 )
	Image00000010:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image00000010:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image00000010 )
	self.Image00000010 = Image00000010
	
	local Image000000000 = LUI.UIImage.new()
	Image000000000:setLeftRight( true, false, 663.87, 679.87 )
	Image000000000:setTopBottom( true, false, 621, 629 )
	Image000000000:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image000000000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image000000000 )
	self.Image000000000 = Image000000000
	
	local InfoPaneItemName = CoD.InfoPaneItemName.new( self, controller )
	InfoPaneItemName:setLeftRight( true, false, 71, 699 )
	InfoPaneItemName:setTopBottom( true, false, 136, 170 )
	InfoPaneItemName:linkToElementModel( self, "weaponIndex", true, function ( model )
		local weaponIndex = Engine.GetModelValue( model )
		if weaponIndex then
			InfoPaneItemName.weaponNameWithVariant.itemName.itemName:setText( Engine.Localize( GetItemNameFromIndex( weaponIndex ) ) )
		end
	end )
	InfoPaneItemName:linkToElementModel( self, "variantName", true, function ( model )
		local variantName = Engine.GetModelValue( model )
		if variantName then
			InfoPaneItemName.weaponNameWithVariant.variantName.itemName:setText( Engine.Localize( variantName ) )
		end
	end )
	InfoPaneItemName:mergeStateConditions( {
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		},
		{
			stateName = "Available",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "NotEquippable",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	self:addElement( InfoPaneItemName )
	self.InfoPaneItemName = InfoPaneItemName
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_WEAPON_BUILD_KITS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_WEAPON_BUILD_KITS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_gunsmith" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local WeaponBuildKitsVariantDescription = CoD.WeaponBuildKitsVariantDescription.new( self, controller )
	WeaponBuildKitsVariantDescription:setLeftRight( true, false, 71, 413.67 )
	WeaponBuildKitsVariantDescription:setTopBottom( true, false, 176, 198 )
	self:addElement( WeaponBuildKitsVariantDescription )
	self.WeaponBuildKitsVariantDescription = WeaponBuildKitsVariantDescription
	
	local LineSide = LUI.UIImage.new()
	LineSide:setLeftRight( true, false, 53, 55 )
	LineSide:setTopBottom( true, false, 87, 638 )
	LineSide:setZRot( 180 )
	LineSide:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide )
	self.LineSide = LineSide
	
	local Pixel2001 = LUI.UIImage.new()
	Pixel2001:setLeftRight( true, false, 31.87, 67.87 )
	Pixel2001:setTopBottom( true, false, 136, 140 )
	Pixel2001:setYRot( -180 )
	Pixel2001:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2001:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2001 )
	self.Pixel2001 = Pixel2001
	
	local XCamMouseControl = CoD.XCamMouseControl.new( self, controller )
	XCamMouseControl:setLeftRight( false, true, -833, -152 )
	XCamMouseControl:setTopBottom( true, true, 176, -199.11 )
	self:addElement( XCamMouseControl )
	self.XCamMouseControl = XCamMouseControl
	
	local attachmentListFrame = CoD.WeaponBuildKitsVariantAttachmentList.new( self, controller )
	attachmentListFrame:setLeftRight( true, true, 0, 0 )
	attachmentListFrame:setTopBottom( true, true, 0, 0 )
	attachmentListFrame:linkToElementModel( self, nil, false, function ( model )
		attachmentListFrame:setModel( model, controller )
	end )
	attachmentListFrame:registerEventHandler( "menu_loaded", function ( element, event )
		local f11_local0 = nil
		SizeToSafeArea( element, controller )
		if not f11_local0 then
			f11_local0 = element:dispatchEventToChildren( event )
		end
		return f11_local0
	end )
	self:addElement( attachmentListFrame )
	self.attachmentListFrame = attachmentListFrame
	
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f12_local0 = nil
		ShowHeaderKickerAndIcon( self )
		SetHeadingKickerTextToGameMode( "MENU_ZOMBIES_CAPS" )
		if not f12_local0 then
			f12_local0 = self:dispatchEventToChildren( event )
		end
		return f12_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		SaveWeaponBuildKit( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "PLATFORM_EMBLEM_ROTATE_LAYER" )
		return true
	end, false )
	MenuFrame:setModel( self.buttonModel, controller )
	attachmentListFrame.id = "attachmentListFrame"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.attachmentListFrame:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.TitleDotsWidget0:close()
		element.cac3dTitleIntermediary0:close()
		element.InfoPaneItemName:close()
		element.MenuFrame:close()
		element.WeaponBuildKitsVariantDescription:close()
		element.XCamMouseControl:close()
		element.attachmentListFrame:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "WeaponBuildKitsCustomizeVariant.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

