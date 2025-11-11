require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.CAC.cac_3dTitleIntermediary" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfoPaneItemName" )
require( "ui.uieditor.widgets.CAC.TitleDotsWidget" )
require( "ui.uieditor.widgets.Craft.WeaponBuildKits.WeaponBuildKitsVariantAttachmentList" )
require( "ui.uieditor.widgets.PC.Utility.XCamMouseControl" )
require( "ui.uieditor.widgets.ZMInventory.WeaponBuildkits.WeaponBuildKitsVariantDescription" )

local PreLoadFunc = function ( self, controller )
	local variantModel = CoD.perController[controller].gunsmithVariantModel
	self:setModel( variantModel )
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( controller, variantModel, true )
end

local PostLoadFunc = function ( self, controller )
	local weaponIndex = CoD.GetCustomization( controller, "weapon_index" )
	local weaponName = Engine.Localize( Engine.GetItemName( weaponIndex ) )
	local variantNameModel = self:getModel( controller, "variantName" )
	local variantName = Engine.GetModelValue( variantNameModel )
	self.InfoPaneItemName.weaponNameWithVariant:setState( "ShowVariant" )
end

LUI.createMenu.WeaponBuildKitsCustomizeVariant = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "WeaponBuildKitsCustomizeVariant" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "WeaponBuildKitsCustomizeVariant.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local TitleBacking0 = LUI.UIImage.new()
	TitleBacking0:setLeftRight( 0.5, 0.5, -973, 968 )
	TitleBacking0:setTopBottom( 0.5, 0.5, -541, -412 )
	TitleBacking0:setRGB( 0, 0, 0 )
	self:addElement( TitleBacking0 )
	self.TitleBacking0 = TitleBacking0
	
	local TitleDotsWidget0 = CoD.TitleDotsWidget.new( self, controller )
	TitleDotsWidget0:setLeftRight( 0, 0, -331, 457 )
	TitleDotsWidget0:setTopBottom( 0, 0, -429.5, -192.5 )
	TitleDotsWidget0:setAlpha( 0 )
	self:addElement( TitleDotsWidget0 )
	self.TitleDotsWidget0 = TitleDotsWidget0
	
	local cac3dTitleIntermediary0 = CoD.cac_3dTitleIntermediary.new( self, controller )
	cac3dTitleIntermediary0:setLeftRight( 0, 0, -108, 1390 )
	cac3dTitleIntermediary0:setTopBottom( 0, 0, -6, 213 )
	cac3dTitleIntermediary0:setAlpha( 0 )
	cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_WEAPON_BUILD_KITS_CAPS" ) )
	self:addElement( cac3dTitleIntermediary0 )
	self.cac3dTitleIntermediary0 = cac3dTitleIntermediary0
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( 0, 0, -16, 1940 )
	CategoryListLine0:setTopBottom( 0, 0, 120, 132 )
	CategoryListLine0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local FooterBacking = LUI.UIImage.new()
	FooterBacking:setLeftRight( 0.5, 0.5, -1125, 1125 )
	FooterBacking:setTopBottom( 0.5, 0.5, 446, 540 )
	FooterBacking:setRGB( 0, 0, 0 )
	FooterBacking:setAlpha( 0 )
	self:addElement( FooterBacking )
	self.FooterBacking = FooterBacking
	
	local Pixel20 = LUI.UIImage.new()
	Pixel20:setLeftRight( 0, 0, 48, 102 )
	Pixel20:setTopBottom( 0, 0, 935, 941 )
	Pixel20:setYRot( -180 )
	Pixel20:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel20:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel20 )
	self.Pixel20 = Pixel20
	
	local Pixel200 = LUI.UIImage.new()
	Pixel200:setLeftRight( 0, 0, 48, 102 )
	Pixel200:setTopBottom( 0, 0, 840, 846 )
	Pixel200:setYRot( -180 )
	Pixel200:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel200:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel200 )
	self.Pixel200 = Pixel200
	
	local Pixel201 = LUI.UIImage.new()
	Pixel201:setLeftRight( 0, 0, 1132, 1186 )
	Pixel201:setTopBottom( 0, 0, 935, 941 )
	Pixel201:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel201:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel201 )
	self.Pixel201 = Pixel201
	
	local Pixel2000 = LUI.UIImage.new()
	Pixel2000:setLeftRight( 0, 0, 1132, 1186 )
	Pixel2000:setTopBottom( 0, 0, 840, 846 )
	Pixel2000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2000 )
	self.Pixel2000 = Pixel2000
	
	local Image000000 = LUI.UIImage.new()
	Image000000:setLeftRight( 0, 0, 211, 235 )
	Image000000:setTopBottom( 0, 0, 837, 849 )
	Image000000:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image000000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image000000 )
	self.Image000000 = Image000000
	
	local Image0000000 = LUI.UIImage.new()
	Image0000000:setLeftRight( 0, 0, 211, 235 )
	Image0000000:setTopBottom( 0, 0, 932, 944 )
	Image0000000:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image0000000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0000000 )
	self.Image0000000 = Image0000000
	
	local Image0000001 = LUI.UIImage.new()
	Image0000001:setLeftRight( 0, 0, 798, 822 )
	Image0000001:setTopBottom( 0, 0, 837, 849 )
	Image0000001:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image0000001:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0000001 )
	self.Image0000001 = Image0000001
	
	local Image00000000 = LUI.UIImage.new()
	Image00000000:setLeftRight( 0, 0, 798, 822 )
	Image00000000:setTopBottom( 0, 0, 932, 944 )
	Image00000000:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image00000000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image00000000 )
	self.Image00000000 = Image00000000
	
	local Image00000010 = LUI.UIImage.new()
	Image00000010:setLeftRight( 0, 0, 996, 1020 )
	Image00000010:setTopBottom( 0, 0, 837, 849 )
	Image00000010:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image00000010:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image00000010 )
	self.Image00000010 = Image00000010
	
	local Image000000000 = LUI.UIImage.new()
	Image000000000:setLeftRight( 0, 0, 996, 1020 )
	Image000000000:setTopBottom( 0, 0, 932, 944 )
	Image000000000:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image000000000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image000000000 )
	self.Image000000000 = Image000000000
	
	local InfoPaneItemName = CoD.InfoPaneItemName.new( self, controller )
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
	InfoPaneItemName:setLeftRight( 0, 0, 107, 1049 )
	InfoPaneItemName:setTopBottom( 0, 0, 204.5, 255.5 )
	InfoPaneItemName:linkToElementModel( self, "weaponIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			InfoPaneItemName.weaponNameWithVariant.itemName.itemName:setText( Engine.Localize( GetItemNameFromIndex( modelValue ) ) )
		end
	end )
	InfoPaneItemName:linkToElementModel( self, "variantName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			InfoPaneItemName.weaponNameWithVariant.variantName.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( InfoPaneItemName )
	self.InfoPaneItemName = InfoPaneItemName
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( 0, 1, 0, 0 )
	MenuFrame:setTopBottom( 0, 1, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_WEAPON_BUILD_KITS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_WEAPON_BUILD_KITS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_gunsmith" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local WeaponBuildKitsVariantDescription = CoD.WeaponBuildKitsVariantDescription.new( self, controller )
	WeaponBuildKitsVariantDescription:setLeftRight( 0, 0, 107, 621 )
	WeaponBuildKitsVariantDescription:setTopBottom( 0, 0, 263.5, 296.5 )
	self:addElement( WeaponBuildKitsVariantDescription )
	self.WeaponBuildKitsVariantDescription = WeaponBuildKitsVariantDescription
	
	local LineSide = LUI.UIImage.new()
	LineSide:setLeftRight( 0, 0, 80, 83 )
	LineSide:setTopBottom( 0, 0, 131, 957 )
	LineSide:setZRot( 180 )
	LineSide:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide )
	self.LineSide = LineSide
	
	local Pixel2001 = LUI.UIImage.new()
	Pixel2001:setLeftRight( 0, 0, 48, 102 )
	Pixel2001:setTopBottom( 0, 0, 204, 210 )
	Pixel2001:setYRot( -180 )
	Pixel2001:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2001:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2001 )
	self.Pixel2001 = Pixel2001
	
	local XCamMouseControl = CoD.XCamMouseControl.new( self, controller )
	XCamMouseControl:setLeftRight( 1, 1, -1250, -228 )
	XCamMouseControl:setTopBottom( 0, 1, 264, -298 )
	self:addElement( XCamMouseControl )
	self.XCamMouseControl = XCamMouseControl
	
	local attachmentListFrame = CoD.WeaponBuildKitsVariantAttachmentList.new( self, controller )
	attachmentListFrame:setLeftRight( 0, 1, 0, 0 )
	attachmentListFrame:setTopBottom( 0, 1, 0, 0 )
	attachmentListFrame:linkToElementModel( self, nil, false, function ( model )
		attachmentListFrame:setModel( model, controller )
	end )
	attachmentListFrame:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SizeToSafeArea( element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( attachmentListFrame )
	self.attachmentListFrame = attachmentListFrame
	
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		ShowHeaderKickerAndIcon( self )
		SetHeadingKickerTextToGameMode( "MENU_ZOMBIES_CAPS" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "menu_opened", function ( element, event )
		local retVal = nil
		if not IsLAN() then
			SetHeadingKickerTextToGameMode( "MENU_ZOMBIES_CAPS" )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		SaveWeaponBuildKit( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "PLATFORM_EMBLEM_ROTATE_LAYER", nil )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.TitleDotsWidget0:close()
		self.cac3dTitleIntermediary0:close()
		self.InfoPaneItemName:close()
		self.MenuFrame:close()
		self.WeaponBuildKitsVariantDescription:close()
		self.XCamMouseControl:close()
		self.attachmentListFrame:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "WeaponBuildKitsCustomizeVariant.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

