require( "ui.uieditor.menus.Craft.Gunsmith.GunsmithSaveChanges" )
require( "ui.uieditor.widgets.CAC.TitleDotsWidget" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithVariantAttachments" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithCustomizeGraphics" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfoPaneItemName" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )

local PreLoadFunc = function ( self, controller )
	local variantModel = CoD.perController[controller].gunsmithVariantModel
	self:setModel( variantModel )
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( controller, variantModel, true )
end

LUI.createMenu.GunsmithCustomizeVariant = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "GunsmithCustomizeVariant" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GunsmithCustomizeVariant.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local TitleDotsWidget0 = CoD.TitleDotsWidget.new( self, controller )
	TitleDotsWidget0:setLeftRight( true, false, -221, 304.34 )
	TitleDotsWidget0:setTopBottom( true, false, -286.33, -128.33 )
	TitleDotsWidget0:setAlpha( 0 )
	self:addElement( TitleDotsWidget0 )
	self.TitleDotsWidget0 = TitleDotsWidget0
	
	local variantAttachments = CoD.GunsmithVariantAttachments.new( self, controller )
	variantAttachments:setLeftRight( true, false, 81.53, 754.87 )
	variantAttachments:setTopBottom( true, false, 539.13, 639.13 )
	variantAttachments:linkToElementModel( self, nil, false, function ( model )
		variantAttachments:setModel( model, controller )
	end )
	variantAttachments:mergeStateConditions( {
		{
			stateName = "SpecialWeapon",
			condition = function ( menu, element, event )
				return Gunsmith_IsSpecialWeapon( menu, element, controller )
			end
		},
		{
			stateName = "Handguns",
			condition = function ( menu, element, event )
				return Gunsmith_IsHandguns( menu, element, controller )
			end
		}
	} )
	self:addElement( variantAttachments )
	self.variantAttachments = variantAttachments
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( true, false, -11, 1293 )
	CategoryListLine0:setTopBottom( true, false, 80, 88 )
	CategoryListLine0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine0:setAlpha( 0 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local GunsmithCustomizeGraphics0 = CoD.GunsmithCustomizeGraphics.new( self, controller )
	GunsmithCustomizeGraphics0:setLeftRight( true, false, 3, 71 )
	GunsmithCustomizeGraphics0:setTopBottom( true, false, -10.57, 659.43 )
	self:addElement( GunsmithCustomizeGraphics0 )
	self.GunsmithCustomizeGraphics0 = GunsmithCustomizeGraphics0
	
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
	Image000000:setLeftRight( true, false, 159.87, 175.87 )
	Image000000:setTopBottom( true, false, 558, 566 )
	Image000000:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image000000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image000000 )
	self.Image000000 = Image000000
	
	local Image0000000 = LUI.UIImage.new()
	Image0000000:setLeftRight( true, false, 159.87, 175.87 )
	Image0000000:setTopBottom( true, false, 621, 629 )
	Image0000000:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image0000000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0000000 )
	self.Image0000000 = Image0000000
	
	local Image0000001 = LUI.UIImage.new()
	Image0000001:setLeftRight( true, false, 550.87, 566.87 )
	Image0000001:setTopBottom( true, false, 558, 566 )
	Image0000001:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image0000001:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0000001 )
	self.Image0000001 = Image0000001
	
	local Image00000000 = LUI.UIImage.new()
	Image00000000:setLeftRight( true, false, 550.87, 566.87 )
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
	
	local Image0000002 = LUI.UIImage.new()
	Image0000002:setLeftRight( true, false, 32.87, 48.87 )
	Image0000002:setTopBottom( true, false, 134, 142 )
	Image0000002:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image0000002:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0000002 )
	self.Image0000002 = Image0000002
	
	local Image00000020 = LUI.UIImage.new()
	Image00000020:setLeftRight( true, false, 32.87, 48.87 )
	Image00000020:setTopBottom( true, false, 166, 174 )
	Image00000020:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image00000020:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image00000020 )
	self.Image00000020 = Image00000020
	
	local InfoPaneItemName = CoD.InfoPaneItemName.new( self, controller )
	InfoPaneItemName:setLeftRight( true, false, 71, 452 )
	InfoPaneItemName:setTopBottom( true, false, 136, 170 )
	InfoPaneItemName.weaponNameWithVariant.variantName:setAlpha( 1 )
	InfoPaneItemName:linkToElementModel( self, "weaponIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			InfoPaneItemName.weaponNameWithVariant.itemName.itemName:setText( Engine.Localize( GetItemNameFromIndex( modelValue ) ) )
		end
	end )
	InfoPaneItemName:linkToElementModel( self, "variantNameBig", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			InfoPaneItemName.weaponNameWithVariant.variantName.itemName:setText( Engine.Localize( modelValue ) )
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
				return AlwaysFalse()
			end
		},
		{
			stateName = "NeedsWildcard",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "NotEquippable",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:addElement( InfoPaneItemName )
	self.InfoPaneItemName = InfoPaneItemName
	
	local GunsmithDescription = LUI.UIText.new()
	GunsmithDescription:setLeftRight( true, false, 71, 271 )
	GunsmithDescription:setTopBottom( true, false, 179.16, 204.16 )
	GunsmithDescription:setTTF( "fonts/default.ttf" )
	GunsmithDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	GunsmithDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	GunsmithDescription:subscribeToGlobalModel( controller, "GunsmithSelectedItemProperties", "itemName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GunsmithDescription:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( GunsmithDescription )
	self.GunsmithDescription = GunsmithDescription
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_GUNSMITH" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_GUNSMITH_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_gunsmith" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		ShowHeaderIconOnly( self )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		OpenPopup( self, "GunsmithSaveChanges", controller )
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
	variantAttachments.id = "variantAttachments"
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
		self.variantAttachments:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.TitleDotsWidget0:close()
		self.variantAttachments:close()
		self.GunsmithCustomizeGraphics0:close()
		self.InfoPaneItemName:close()
		self.MenuFrame:close()
		self.GunsmithDescription:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "GunsmithCustomizeVariant.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

