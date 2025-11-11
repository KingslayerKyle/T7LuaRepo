require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfoPaneItemName" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithVariantAttachmentList" )
require( "ui.uieditor.widgets.PC.Utility.XCamMouseControl" )

local PreLoadFunc = function ( self, controller )
	local variantModel = CoD.perController[controller].gunsmithVariantModel
	self:setModel( variantModel )
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( controller, variantModel, true )
	self.disableLeaderChangePopupShutdown = true
	if CoD.perController[controller].confirmVariantNameButtonPressed and CoD.perController[controller].confirmVariantNameButtonPressed == true then
		local gunsmithSnapshotModel = DataSources.GunsmithSnapshot.getModel( controller )
		CoD.perController[controller].confirmVariantNameButtonPressed = false
	end
end

LUI.createMenu.GunsmithCustomizeVariant = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "GunsmithCustomizeVariant" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GunsmithCustomizeVariant.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( 0, 0, -16, 1940 )
	CategoryListLine0:setTopBottom( 0, 0, 120, 132 )
	CategoryListLine0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine0:setAlpha( 0 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
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
	InfoPaneItemName:setLeftRight( 0, 0, 106, 678 )
	InfoPaneItemName:setTopBottom( 0, 0, 204.5, 255.5 )
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
	self:addElement( InfoPaneItemName )
	self.InfoPaneItemName = InfoPaneItemName
	
	local GunsmithDescription = LUI.UIText.new()
	GunsmithDescription:setLeftRight( 0, 0, 106, 406 )
	GunsmithDescription:setTopBottom( 0, 0, 268, 306 )
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
	MenuFrame:setLeftRight( 0, 1, 0, 0 )
	MenuFrame:setTopBottom( 0, 1, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_GUNSMITH_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_GUNSMITH_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_gunsmith" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
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
	XCamMouseControl:setLeftRight( 0, 1, 225, -225 )
	XCamMouseControl:setTopBottom( 0, 1, 297, -317 )
	self:addElement( XCamMouseControl )
	self.XCamMouseControl = XCamMouseControl
	
	local attachmentListFrame = CoD.GunsmithVariantAttachmentList.new( self, controller )
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
		ShowHeaderIconOnly( self )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		Gunsmith_OpenSaveVariantPopup( self, element, controller, menu )
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
		self.InfoPaneItemName:close()
		self.MenuFrame:close()
		self.XCamMouseControl:close()
		self.attachmentListFrame:close()
		self.GunsmithDescription:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "GunsmithCustomizeVariant.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

