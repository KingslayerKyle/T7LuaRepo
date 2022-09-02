-- 9834a3ea4f13dba0e86527e3d62e793d
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.cac_PrimaryWeaponDescription" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfoPaneItemName" )
require( "ui.uieditor.widgets.CAC.WeaponAttributes_Internal" )
require( "ui.uieditor.widgets.CAC.cac_LockBig" )
require( "ui.uieditor.widgets.PC.Utility.XCamMouseControl" )

CoD.ChooseShowcaseWeapon_SelectionInfoWidget = InheritFrom( LUI.UIElement )
CoD.ChooseShowcaseWeapon_SelectionInfoWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ChooseShowcaseWeapon_SelectionInfoWidget )
	self.id = "ChooseShowcaseWeapon_SelectionInfoWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 850 )
	self:setTopBottom( true, false, 0, 596 )
	self.anyChildUsesUpdateState = true
	
	local purchaseWeaponDescTextBox = LUI.UIText.new()
	purchaseWeaponDescTextBox:setLeftRight( true, false, 19, 384 )
	purchaseWeaponDescTextBox:setTopBottom( true, false, 51, 73 )
	purchaseWeaponDescTextBox:setAlpha( 0 )
	purchaseWeaponDescTextBox:setText( Engine.Localize( "MENU_SHOWCASEWEAPON_PURCHASE" ) )
	purchaseWeaponDescTextBox:setTTF( "fonts/default.ttf" )
	purchaseWeaponDescTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	purchaseWeaponDescTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( purchaseWeaponDescTextBox )
	self.purchaseWeaponDescTextBox = purchaseWeaponDescTextBox
	
	local unlockWeaponDescTextBox = LUI.UIText.new()
	unlockWeaponDescTextBox:setLeftRight( true, false, 19, 384 )
	unlockWeaponDescTextBox:setTopBottom( true, false, 51, 73 )
	unlockWeaponDescTextBox:setAlpha( 0 )
	unlockWeaponDescTextBox:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	unlockWeaponDescTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	unlockWeaponDescTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	unlockWeaponDescTextBox:linkToElementModel( self, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			unlockWeaponDescTextBox:setText( GetUnlockDescription( controller, itemIndex ) )
		end
	end )
	self:addElement( unlockWeaponDescTextBox )
	self.unlockWeaponDescTextBox = unlockWeaponDescTextBox
	
	local weaponDescTextBox = CoD.cac_PrimaryWeaponDescription.new( menu, controller )
	weaponDescTextBox:setLeftRight( true, false, 19, 384 )
	weaponDescTextBox:setTopBottom( true, false, 51, 73 )
	weaponDescTextBox:linkToElementModel( self, "description", true, function ( model )
		local description = Engine.GetModelValue( model )
		if description then
			weaponDescTextBox.weaponDescTextBox:setText( Engine.Localize( description ) )
		end
	end )
	self:addElement( weaponDescTextBox )
	self.weaponDescTextBox = weaponDescTextBox
	
	local itemName = CoD.InfoPaneItemName.new( menu, controller )
	itemName:setLeftRight( true, false, 18, 399 )
	itemName:setTopBottom( true, false, 13, 47 )
	itemName.weaponNameWithVariant.itemName.itemName:setText( Engine.Localize( "WEAPON_AR_STANDARD" ) )
	itemName.weaponNameWithVariant.variantName:setAlpha( 1 )
	itemName.weaponNameWithVariant.variantName.itemName:setText( Engine.Localize( "WEAPON_AR_STANDARD" ) )
	itemName:linkToElementModel( self, nil, false, function ( model )
		itemName:setModel( model, controller )
	end )
	itemName:mergeStateConditions( {
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
	self:addElement( itemName )
	self.itemName = itemName
	
	local WeaponAttributesInternal = CoD.WeaponAttributes_Internal.new( menu, controller )
	WeaponAttributesInternal:setLeftRight( true, false, 18, 439 )
	WeaponAttributesInternal:setTopBottom( true, false, 440, 526 )
	self:addElement( WeaponAttributesInternal )
	self.WeaponAttributesInternal = WeaponAttributesInternal
	
	local lockedIcon = CoD.cac_LockBig.new( menu, controller )
	lockedIcon:setLeftRight( true, false, 371.51, 467.51 )
	lockedIcon:setTopBottom( true, false, -97, 573 )
	lockedIcon:setAlpha( 0 )
	lockedIcon:linkToElementModel( self, nil, false, function ( model )
		lockedIcon:setModel( model, controller )
	end )
	lockedIcon:mergeStateConditions( {
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsCACItemLockedOrNotPurchased( menu, element, controller ) and not IsSelfModelValueTrue( element, controller, "isBMClassified" )
			end
		},
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				local f11_local0
				if not IsInPermanentUnlockMenu( controller ) then
					f11_local0 = AlwaysFalse()
				else
					f11_local0 = false
				end
				return f11_local0
			end
		}
	} )
	lockedIcon:linkToElementModel( lockedIcon, "itemIndex", true, function ( model )
		menu:updateElementState( lockedIcon, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	lockedIcon:linkToElementModel( lockedIcon, "isBMClassified", true, function ( model )
		menu:updateElementState( lockedIcon, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		} )
	end )
	self:addElement( lockedIcon )
	self.lockedIcon = lockedIcon
	
	local xcamMouse = CoD.XCamMouseControl.new( menu, controller )
	xcamMouse:setLeftRight( true, true, 147.51, -125 )
	xcamMouse:setTopBottom( true, true, 47, -156 )
	self:addElement( xcamMouse )
	self.xcamMouse = xcamMouse
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				purchaseWeaponDescTextBox:completeAnimation()
				self.purchaseWeaponDescTextBox:setAlpha( 0 )
				self.clipFinished( purchaseWeaponDescTextBox, {} )

				unlockWeaponDescTextBox:completeAnimation()
				self.unlockWeaponDescTextBox:setLeftRight( true, false, 19.51, 275.51 )
				self.unlockWeaponDescTextBox:setTopBottom( true, false, 54, 73 )
				self.unlockWeaponDescTextBox:setAlpha( 0 )
				self.clipFinished( unlockWeaponDescTextBox, {} )

				weaponDescTextBox:completeAnimation()
				self.weaponDescTextBox:setAlpha( 1 )
				self.clipFinished( weaponDescTextBox, {} )

				WeaponAttributesInternal:completeAnimation()
				self.WeaponAttributesInternal:setAlpha( 1 )
				self.clipFinished( WeaponAttributesInternal, {} )

				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 1 )
				self.clipFinished( lockedIcon, {} )
			end
		},
		BMClassified = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				purchaseWeaponDescTextBox:completeAnimation()
				self.purchaseWeaponDescTextBox:setAlpha( 0 )
				self.clipFinished( purchaseWeaponDescTextBox, {} )

				unlockWeaponDescTextBox:completeAnimation()
				self.unlockWeaponDescTextBox:setAlpha( 0 )
				self.clipFinished( unlockWeaponDescTextBox, {} )

				weaponDescTextBox:completeAnimation()
				self.weaponDescTextBox:setAlpha( 1 )
				self.clipFinished( weaponDescTextBox, {} )

				itemName:completeAnimation()
				self.itemName:setAlpha( 1 )
				self.clipFinished( itemName, {} )

				WeaponAttributesInternal:completeAnimation()
				self.WeaponAttributesInternal:setAlpha( 0 )
				self.clipFinished( WeaponAttributesInternal, {} )

				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 1 )
				self.clipFinished( lockedIcon, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				purchaseWeaponDescTextBox:completeAnimation()
				self.purchaseWeaponDescTextBox:setAlpha( 0 )
				self.clipFinished( purchaseWeaponDescTextBox, {} )

				unlockWeaponDescTextBox:completeAnimation()
				self.unlockWeaponDescTextBox:setAlpha( 1 )
				self.clipFinished( unlockWeaponDescTextBox, {} )

				weaponDescTextBox:completeAnimation()
				self.weaponDescTextBox:setAlpha( 0 )
				self.clipFinished( weaponDescTextBox, {} )

				WeaponAttributesInternal:completeAnimation()
				self.WeaponAttributesInternal:setAlpha( 1 )
				self.clipFinished( WeaponAttributesInternal, {} )

				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0.66 )
				self.clipFinished( lockedIcon, {} )
			end
		},
		NotAvailable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				purchaseWeaponDescTextBox:completeAnimation()
				self.purchaseWeaponDescTextBox:setAlpha( 1 )
				self.clipFinished( purchaseWeaponDescTextBox, {} )

				unlockWeaponDescTextBox:completeAnimation()
				self.unlockWeaponDescTextBox:setAlpha( 0 )
				self.clipFinished( unlockWeaponDescTextBox, {} )

				weaponDescTextBox:completeAnimation()
				self.weaponDescTextBox:setAlpha( 0 )
				self.clipFinished( weaponDescTextBox, {} )

				WeaponAttributesInternal:completeAnimation()
				self.WeaponAttributesInternal:setAlpha( 1 )
				self.clipFinished( WeaponAttributesInternal, {} )

				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0.66 )
				self.clipFinished( lockedIcon, {} )
			end
		},
		VariantSelect = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				purchaseWeaponDescTextBox:completeAnimation()
				self.purchaseWeaponDescTextBox:setAlpha( 0 )
				self.clipFinished( purchaseWeaponDescTextBox, {} )

				unlockWeaponDescTextBox:completeAnimation()
				self.unlockWeaponDescTextBox:setLeftRight( true, false, 19.51, 275.51 )
				self.unlockWeaponDescTextBox:setTopBottom( true, false, 54, 73 )
				self.unlockWeaponDescTextBox:setAlpha( 0 )
				self.clipFinished( unlockWeaponDescTextBox, {} )

				weaponDescTextBox:completeAnimation()
				self.weaponDescTextBox:setAlpha( 0 )
				self.clipFinished( weaponDescTextBox, {} )

				WeaponAttributesInternal:completeAnimation()
				self.WeaponAttributesInternal:setAlpha( 1 )
				self.clipFinished( WeaponAttributesInternal, {} )

				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 1 )
				self.clipFinished( lockedIcon, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "BMClassified",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isBMClassified" )
			end
		},
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsCACItemLocked( menu, element, controller )
			end
		},
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				return not IsCACItemPurchased( element, controller )
			end
		},
		{
			stateName = "VariantSelect",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	self:linkToElementModel( self, "isBMClassified", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		} )
	end )
	self:linkToElementModel( self, "itemIndex", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.weaponDescTextBox:close()
		element.itemName:close()
		element.WeaponAttributesInternal:close()
		element.lockedIcon:close()
		element.xcamMouse:close()
		element.unlockWeaponDescTextBox:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

