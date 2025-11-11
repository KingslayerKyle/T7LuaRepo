require( "ui.uieditor.widgets.CAC.cac_LockBig" )
require( "ui.uieditor.widgets.CAC.cac_PrimaryWeaponDescription" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfoPaneItemName" )
require( "ui.uieditor.widgets.CAC.WeaponAttributes_Internal" )
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
	self:setLeftRight( 0, 0, 0, 1275 )
	self:setTopBottom( 0, 0, 0, 894 )
	self.anyChildUsesUpdateState = true
	
	local purchaseWeaponDescTextBox = LUI.UIText.new()
	purchaseWeaponDescTextBox:setLeftRight( 0, 0, 28, 576 )
	purchaseWeaponDescTextBox:setTopBottom( 0, 0, 77, 110 )
	purchaseWeaponDescTextBox:setAlpha( 0 )
	purchaseWeaponDescTextBox:setText( Engine.Localize( "MENU_SHOWCASEWEAPON_PURCHASE" ) )
	purchaseWeaponDescTextBox:setTTF( "fonts/default.ttf" )
	purchaseWeaponDescTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	purchaseWeaponDescTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( purchaseWeaponDescTextBox )
	self.purchaseWeaponDescTextBox = purchaseWeaponDescTextBox
	
	local unlockWeaponDescTextBox = LUI.UIText.new()
	unlockWeaponDescTextBox:setLeftRight( 0, 0, 28, 576 )
	unlockWeaponDescTextBox:setTopBottom( 0, 0, 77, 110 )
	unlockWeaponDescTextBox:setAlpha( 0 )
	unlockWeaponDescTextBox:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	unlockWeaponDescTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	unlockWeaponDescTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	unlockWeaponDescTextBox:linkToElementModel( self, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			unlockWeaponDescTextBox:setText( GetUnlockDescription( controller, modelValue ) )
		end
	end )
	self:addElement( unlockWeaponDescTextBox )
	self.unlockWeaponDescTextBox = unlockWeaponDescTextBox
	
	local weaponDescTextBox = CoD.cac_PrimaryWeaponDescription.new( menu, controller )
	weaponDescTextBox:setLeftRight( 0, 0, 28, 576 )
	weaponDescTextBox:setTopBottom( 0, 0, 76.5, 109.5 )
	weaponDescTextBox:linkToElementModel( self, "description", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			weaponDescTextBox.weaponDescTextBox:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( weaponDescTextBox )
	self.weaponDescTextBox = weaponDescTextBox
	
	local itemName = CoD.InfoPaneItemName.new( menu, controller )
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
	itemName:setLeftRight( 0, 0, 27, 599 )
	itemName:setTopBottom( 0, 0, 19.5, 70.5 )
	itemName.weaponNameWithVariant.itemName.itemName:setText( Engine.Localize( "WEAPON_AR_STANDARD" ) )
	itemName.weaponNameWithVariant.variantName:setAlpha( 1 )
	itemName.weaponNameWithVariant.variantName.itemName:setText( Engine.Localize( "WEAPON_AR_STANDARD" ) )
	itemName:linkToElementModel( self, nil, false, function ( model )
		itemName:setModel( model, controller )
	end )
	self:addElement( itemName )
	self.itemName = itemName
	
	local WeaponAttributesInternal = CoD.WeaponAttributes_Internal.new( menu, controller )
	WeaponAttributesInternal:setLeftRight( 0, 0, 27, 658 )
	WeaponAttributesInternal:setTopBottom( 0, 0, 660, 789 )
	self:addElement( WeaponAttributesInternal )
	self.WeaponAttributesInternal = WeaponAttributesInternal
	
	local lockedIcon = CoD.cac_LockBig.new( menu, controller )
	lockedIcon:mergeStateConditions( {
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsCACItemLockedOrNotPurchased( menu, element, controller )
			end
		},
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				local f10_local0
				if not IsInPermanentUnlockMenu( controller ) then
					f10_local0 = AlwaysFalse()
				else
					f10_local0 = false
				end
				return f10_local0
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
	lockedIcon:setLeftRight( 0, 0, 557, 701 )
	lockedIcon:setTopBottom( 0, 0, -145.5, 859.5 )
	lockedIcon:setAlpha( 0 )
	lockedIcon:linkToElementModel( self, nil, false, function ( model )
		lockedIcon:setModel( model, controller )
	end )
	self:addElement( lockedIcon )
	self.lockedIcon = lockedIcon
	
	local xcamMouse = CoD.XCamMouseControl.new( menu, controller )
	xcamMouse:setLeftRight( 0, 1, 221, -187 )
	xcamMouse:setTopBottom( 0, 1, 70, -234 )
	self:addElement( xcamMouse )
	self.xcamMouse = xcamMouse
	
	self.resetProperties = function ()
		lockedIcon:completeAnimation()
		unlockWeaponDescTextBox:completeAnimation()
		WeaponAttributesInternal:completeAnimation()
		weaponDescTextBox:completeAnimation()
		purchaseWeaponDescTextBox:completeAnimation()
		lockedIcon:setAlpha( 0 )
		unlockWeaponDescTextBox:setLeftRight( 0, 0, 28, 576 )
		unlockWeaponDescTextBox:setTopBottom( 0, 0, 77, 110 )
		unlockWeaponDescTextBox:setAlpha( 0 )
		WeaponAttributesInternal:setAlpha( 1 )
		weaponDescTextBox:setAlpha( 1 )
		purchaseWeaponDescTextBox:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				unlockWeaponDescTextBox:completeAnimation()
				self.unlockWeaponDescTextBox:setLeftRight( 0, 0, 29, 413 )
				self.unlockWeaponDescTextBox:setTopBottom( 0, 0, 81.5, 109.5 )
				self.clipFinished( unlockWeaponDescTextBox, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 1 )
				self.clipFinished( lockedIcon, {} )
			end
		},
		BMClassified = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				WeaponAttributesInternal:completeAnimation()
				self.WeaponAttributesInternal:setAlpha( 0 )
				self.clipFinished( WeaponAttributesInternal, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				unlockWeaponDescTextBox:completeAnimation()
				self.unlockWeaponDescTextBox:setAlpha( 1 )
				self.clipFinished( unlockWeaponDescTextBox, {} )
				weaponDescTextBox:completeAnimation()
				self.weaponDescTextBox:setAlpha( 0 )
				self.clipFinished( weaponDescTextBox, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0.66 )
				self.clipFinished( lockedIcon, {} )
			end
		},
		NotAvailable = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				purchaseWeaponDescTextBox:completeAnimation()
				self.purchaseWeaponDescTextBox:setAlpha( 1 )
				self.clipFinished( purchaseWeaponDescTextBox, {} )
				weaponDescTextBox:completeAnimation()
				self.weaponDescTextBox:setAlpha( 0 )
				self.clipFinished( weaponDescTextBox, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0.66 )
				self.clipFinished( lockedIcon, {} )
			end
		},
		VariantSelect = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				unlockWeaponDescTextBox:completeAnimation()
				self.unlockWeaponDescTextBox:setLeftRight( 0, 0, 29, 413 )
				self.unlockWeaponDescTextBox:setTopBottom( 0, 0, 81.5, 109.5 )
				self.clipFinished( unlockWeaponDescTextBox, {} )
				weaponDescTextBox:completeAnimation()
				self.weaponDescTextBox:setAlpha( 0 )
				self.clipFinished( weaponDescTextBox, {} )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.weaponDescTextBox:close()
		self.itemName:close()
		self.WeaponAttributesInternal:close()
		self.lockedIcon:close()
		self.xcamMouse:close()
		self.unlockWeaponDescTextBox:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

