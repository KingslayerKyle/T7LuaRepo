require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfoPaneItemName" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.PC.Utility.XCamMouseControl" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithVariantAttachmentList" )

local PreLoadFunc = function ( self, controller )
	local f1_local0 = CoD.perController[controller].gunsmithVariantModel
	self:setModel( f1_local0 )
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( controller, f1_local0, true )
	self.disableLeaderChangePopupShutdown = true
	if CoD.perController[controller].confirmVariantNameButtonPressed and CoD.perController[controller].confirmVariantNameButtonPressed == true then
		local f1_local1 = DataSources.GunsmithSnapshot.getModel( controller )
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
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GunsmithCustomizeVariant.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( true, false, -11, 1293 )
	CategoryListLine0:setTopBottom( true, false, 80, 88 )
	CategoryListLine0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine0:setAlpha( 0 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local InfoPaneItemName = CoD.InfoPaneItemName.new( self, controller )
	InfoPaneItemName:setLeftRight( true, false, 71, 452 )
	InfoPaneItemName:setTopBottom( true, false, 136, 170 )
	InfoPaneItemName.weaponNameWithVariant.variantName:setAlpha( 1 )
	InfoPaneItemName:linkToElementModel( self, "weaponIndex", true, function ( model )
		local weaponIndex = Engine.GetModelValue( model )
		if weaponIndex then
			InfoPaneItemName.weaponNameWithVariant.itemName.itemName:setText( Engine.Localize( GetItemNameFromIndexMP( weaponIndex ) ) )
		end
	end )
	InfoPaneItemName:linkToElementModel( self, "variantNameBig", true, function ( model )
		local variantNameBig = Engine.GetModelValue( model )
		if variantNameBig then
			InfoPaneItemName.weaponNameWithVariant.variantName.itemName:setText( variantNameBig )
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
		local itemName = Engine.GetModelValue( model )
		if itemName then
			GunsmithDescription:setText( Engine.Localize( itemName ) )
		end
	end )
	self:addElement( GunsmithDescription )
	self.GunsmithDescription = GunsmithDescription
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_GUNSMITH_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_GUNSMITH_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_gunsmith" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
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
	XCamMouseControl:setLeftRight( true, true, 150, -150 )
	XCamMouseControl:setTopBottom( true, true, 198, -211 )
	self:addElement( XCamMouseControl )
	self.XCamMouseControl = XCamMouseControl
	
	local attachmentListFrame = CoD.GunsmithVariantAttachmentList.new( self, controller )
	attachmentListFrame:setLeftRight( true, true, 0, 0 )
	attachmentListFrame:setTopBottom( true, true, 0, 0 )
	attachmentListFrame:linkToElementModel( self, nil, false, function ( model )
		attachmentListFrame:setModel( model, controller )
	end )
	attachmentListFrame:registerEventHandler( "menu_loaded", function ( element, event )
		local f12_local0 = nil
		SizeToSafeArea( element, controller )
		if not f12_local0 then
			f12_local0 = element:dispatchEventToChildren( event )
		end
		return f12_local0
	end )
	self:addElement( attachmentListFrame )
	self.attachmentListFrame = attachmentListFrame
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				CategoryListLine0:completeAnimation()
				self.CategoryListLine0:setAlpha( 0 )
				self.clipFinished( CategoryListLine0, {} )
				InfoPaneItemName:completeAnimation()
				self.InfoPaneItemName:setLeftRight( true, false, 71, 452 )
				self.InfoPaneItemName:setTopBottom( true, false, 136, 170 )
				self.InfoPaneItemName:setAlpha( 1 )
				self.clipFinished( InfoPaneItemName, {} )
				GunsmithDescription:completeAnimation()
				self.GunsmithDescription:setAlpha( 1 )
				self.clipFinished( GunsmithDescription, {} )
				MenuFrame:completeAnimation()
				self.MenuFrame:setAlpha( 1 )
				self.clipFinished( MenuFrame, {} )
			end
		},
		ArabicFrontEnd = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				CategoryListLine0:completeAnimation()
				self.CategoryListLine0:setAlpha( 0 )
				self.clipFinished( CategoryListLine0, {} )
				InfoPaneItemName:completeAnimation()
				self.InfoPaneItemName:setLeftRight( true, false, 71, 452 )
				self.InfoPaneItemName:setTopBottom( true, false, 136, 170 )
				self.InfoPaneItemName:setAlpha( 1 )
				self.clipFinished( InfoPaneItemName, {} )
				GunsmithDescription:completeAnimation()
				self.GunsmithDescription:setAlpha( 1 )
				self.clipFinished( GunsmithDescription, {} )
				MenuFrame:completeAnimation()
				self.MenuFrame:setAlpha( 1 )
				self.clipFinished( MenuFrame, {} )
			end
		}
	}
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f15_local0 = nil
		ShowHeaderIconOnly( self )
		if not f15_local0 then
			f15_local0 = self:dispatchEventToChildren( event )
		end
		return f15_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		Gunsmith_OpenSaveVariantPopup( self, element, controller, menu )
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
		element.InfoPaneItemName:close()
		element.MenuFrame:close()
		element.XCamMouseControl:close()
		element.attachmentListFrame:close()
		element.GunsmithDescription:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "GunsmithCustomizeVariant.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

