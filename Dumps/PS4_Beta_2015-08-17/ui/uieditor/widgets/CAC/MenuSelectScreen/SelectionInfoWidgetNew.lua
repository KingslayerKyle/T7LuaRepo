require( "ui.uieditor.widgets.CAC.MenuSelectScreen.PreviewImageWidget" )
require( "ui.uieditor.widgets.CAC.cac_PrimaryWeaponDescription" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfoPaneItemName" )
require( "ui.uieditor.widgets.CAC.WeaponAttributes_Internal" )
require( "ui.uieditor.widgets.CAC.cac_WpnLvl" )
require( "ui.uieditor.widgets.CAC.cac_LockBig" )
require( "ui.uieditor.widgets.PC.Utility.XCamMouseControl" )

CoD.SelectionInfoWidgetNew = InheritFrom( LUI.UIElement )
CoD.SelectionInfoWidgetNew.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SelectionInfoWidgetNew )
	self.id = "SelectionInfoWidgetNew"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 850 )
	self:setTopBottom( true, false, 0, 596 )
	self.anyChildUsesUpdateState = true
	
	local previewImage = CoD.PreviewImageWidget.new( menu, controller )
	previewImage:setLeftRight( false, true, -915.66, 6.51 )
	previewImage:setTopBottom( false, true, -584, -122 )
	previewImage:setAlpha( 0 )
	previewImage:setZoom( -150 )
	previewImage:mergeStateConditions( {
		{
			stateName = "Square",
			condition = function ( menu, element, event )
				return IsMenuPreviewImageSquare( menu )
			end
		}
	} )
	self:addElement( previewImage )
	self.previewImage = previewImage
	
	local unlockWeaponDescTextBox = LUI.UIText.new()
	unlockWeaponDescTextBox:setLeftRight( true, false, 20.51, 276.51 )
	unlockWeaponDescTextBox:setTopBottom( true, false, 56, 75 )
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
	weaponDescTextBox:setLeftRight( true, false, 19, 276 )
	weaponDescTextBox:setTopBottom( true, false, 51, 73 )
	weaponDescTextBox:linkToElementModel( self, "description", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			weaponDescTextBox.weaponDescTextBox:setText( Engine.Localize( modelValue ) )
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
	
	local weaponProgression = CoD.cac_WpnLvl.new( menu, controller )
	weaponProgression:setLeftRight( true, false, 435, 850 )
	weaponProgression:setTopBottom( true, false, 492, 532 )
	weaponProgression.levelLabel.Label1:setText( Engine.Localize( "LEVEL" ) )
	weaponProgression.levelLabel.Label1:setTTF( "fonts/escom.ttf" )
	weaponProgression:linkToElementModel( self, nil, false, function ( model )
		weaponProgression:setModel( model, controller )
	end )
	weaponProgression:linkToElementModel( self, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			weaponProgression.nextLevel:setText( Engine.Localize( GetNextWeaponLevel( controller, modelValue ) ) )
		end
	end )
	weaponProgression:linkToElementModel( self, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			weaponProgression.currentLevelBacking:setText( Engine.Localize( GetCurrentWeaponLevelFromLoadout( controller, modelValue ) ) )
		end
	end )
	weaponProgression:linkToElementModel( self, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			weaponProgression.currentLevel:setText( Engine.Localize( GetCurrentWeaponLevelFromLoadout( controller, modelValue ) ) )
		end
	end )
	weaponProgression:linkToElementModel( self, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			weaponProgression.cacWpnLvlMeter0.Meter:setShaderVector( 0, GetCurrentWeaponXP( controller, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) ) )
		end
	end )
	self:addElement( weaponProgression )
	self.weaponProgression = weaponProgression
	
	local lockedIcon = CoD.cac_LockBig.new( menu, controller )
	lockedIcon:setLeftRight( true, false, 371.51, 467.51 )
	lockedIcon:setTopBottom( true, false, -97, 573 )
	lockedIcon:setAlpha( 0 )
	lockedIcon:linkToElementModel( self, nil, false, function ( model )
		lockedIcon:setModel( model, controller )
	end )
	self:addElement( lockedIcon )
	self.lockedIcon = lockedIcon
	
	local guide0 = LUI.UIImage.new()
	guide0:setLeftRight( true, false, 19.51, 147.51 )
	guide0:setTopBottom( true, false, 0, 59.5 )
	guide0:setRGB( 1, 0.53, 0 )
	guide0:setAlpha( 0 )
	self:addElement( guide0 )
	self.guide0 = guide0
	
	local xcamMouse = CoD.XCamMouseControl.new( menu, controller )
	xcamMouse:setLeftRight( true, true, 147.51, -125 )
	xcamMouse:setTopBottom( true, true, 47, -156 )
	self:addElement( xcamMouse )
	self.xcamMouse = xcamMouse
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				previewImage:completeAnimation()
				self.previewImage:setAlpha( 0 )
				self.clipFinished( previewImage, {} )
				unlockWeaponDescTextBox:completeAnimation()
				self.unlockWeaponDescTextBox:setAlpha( 0 )
				self.clipFinished( unlockWeaponDescTextBox, {} )
				weaponDescTextBox:completeAnimation()
				self.weaponDescTextBox:setAlpha( 1 )
				self.clipFinished( weaponDescTextBox, {} )
				WeaponAttributesInternal:completeAnimation()
				self.WeaponAttributesInternal:setAlpha( 1 )
				self.clipFinished( WeaponAttributesInternal, {} )
				weaponProgression:completeAnimation()
				self.weaponProgression:setAlpha( 1 )
				self.clipFinished( weaponProgression, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 1 )
				self.clipFinished( lockedIcon, {} )
			end
		},
		VariantSelect = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				previewImage:completeAnimation()
				self.previewImage:setAlpha( 0 )
				self.clipFinished( previewImage, {} )
				unlockWeaponDescTextBox:completeAnimation()
				self.unlockWeaponDescTextBox:setAlpha( 0 )
				self.clipFinished( unlockWeaponDescTextBox, {} )
				weaponDescTextBox:completeAnimation()
				self.weaponDescTextBox:setAlpha( 0 )
				self.clipFinished( weaponDescTextBox, {} )
				WeaponAttributesInternal:completeAnimation()
				self.WeaponAttributesInternal:setAlpha( 1 )
				self.clipFinished( WeaponAttributesInternal, {} )
				weaponProgression:completeAnimation()
				self.weaponProgression:setAlpha( 1 )
				self.clipFinished( weaponProgression, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
			end
		},
		AttachmentLocked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				previewImage:completeAnimation()
				self.previewImage:setAlpha( 0 )
				self.clipFinished( previewImage, {} )
				unlockWeaponDescTextBox:completeAnimation()
				self.unlockWeaponDescTextBox:setAlpha( 1 )
				self.clipFinished( unlockWeaponDescTextBox, {} )
				weaponDescTextBox:completeAnimation()
				self.weaponDescTextBox:setAlpha( 0 )
				self.clipFinished( weaponDescTextBox, {} )
				WeaponAttributesInternal:completeAnimation()
				self.WeaponAttributesInternal:setAlpha( 1 )
				self.clipFinished( WeaponAttributesInternal, {} )
				weaponProgression:completeAnimation()
				self.weaponProgression:setAlpha( 1 )
				self.clipFinished( weaponProgression, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 1 )
				self.clipFinished( lockedIcon, {} )
			end
		},
		EquipmentSelectLocked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				previewImage:completeAnimation()
				self.previewImage:setAlpha( 0 )
				self.clipFinished( previewImage, {} )
				unlockWeaponDescTextBox:completeAnimation()
				self.unlockWeaponDescTextBox:setAlpha( 1 )
				self.clipFinished( unlockWeaponDescTextBox, {} )
				weaponDescTextBox:completeAnimation()
				self.weaponDescTextBox:setAlpha( 0 )
				self.clipFinished( weaponDescTextBox, {} )
				WeaponAttributesInternal:completeAnimation()
				self.WeaponAttributesInternal:setAlpha( 0 )
				self.clipFinished( WeaponAttributesInternal, {} )
				weaponProgression:completeAnimation()
				self.weaponProgression:setAlpha( 0 )
				self.clipFinished( weaponProgression, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 1 )
				self.clipFinished( lockedIcon, {} )
			end
		},
		EquipmentSelect = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				previewImage:completeAnimation()
				self.previewImage:setAlpha( 0 )
				self.clipFinished( previewImage, {} )
				unlockWeaponDescTextBox:completeAnimation()
				self.unlockWeaponDescTextBox:setAlpha( 0 )
				self.clipFinished( unlockWeaponDescTextBox, {} )
				weaponDescTextBox:completeAnimation()
				self.weaponDescTextBox:setAlpha( 1 )
				self.clipFinished( weaponDescTextBox, {} )
				WeaponAttributesInternal:completeAnimation()
				self.WeaponAttributesInternal:setAlpha( 0 )
				self.clipFinished( WeaponAttributesInternal, {} )
				weaponProgression:completeAnimation()
				self.weaponProgression:setAlpha( 0 )
				self.clipFinished( weaponProgression, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 1 )
				self.clipFinished( lockedIcon, {} )
			end
		},
		CybercoreRigSelectLocked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				previewImage:completeAnimation()
				self.previewImage:setAlpha( 0 )
				self.clipFinished( previewImage, {} )
				unlockWeaponDescTextBox:completeAnimation()
				self.unlockWeaponDescTextBox:setAlpha( 1 )
				self.clipFinished( unlockWeaponDescTextBox, {} )
				weaponDescTextBox:completeAnimation()
				self.weaponDescTextBox:setAlpha( 0 )
				self.clipFinished( weaponDescTextBox, {} )
				WeaponAttributesInternal:completeAnimation()
				self.WeaponAttributesInternal:setAlpha( 0 )
				self.clipFinished( WeaponAttributesInternal, {} )
				weaponProgression:completeAnimation()
				self.weaponProgression:setAlpha( 0 )
				self.clipFinished( weaponProgression, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 1 )
				self.clipFinished( lockedIcon, {} )
			end
		},
		CybercoreRigSelect = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				previewImage:completeAnimation()
				self.previewImage:setAlpha( 1 )
				self.clipFinished( previewImage, {} )
				unlockWeaponDescTextBox:completeAnimation()
				self.unlockWeaponDescTextBox:setAlpha( 0 )
				self.clipFinished( unlockWeaponDescTextBox, {} )
				weaponDescTextBox:completeAnimation()
				self.weaponDescTextBox:setAlpha( 1 )
				self.clipFinished( weaponDescTextBox, {} )
				WeaponAttributesInternal:completeAnimation()
				self.WeaponAttributesInternal:setAlpha( 0 )
				self.clipFinished( WeaponAttributesInternal, {} )
				weaponProgression:completeAnimation()
				self.weaponProgression:setAlpha( 0 )
				self.clipFinished( weaponProgression, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				previewImage:completeAnimation()
				self.previewImage:setAlpha( 0 )
				self.clipFinished( previewImage, {} )
				unlockWeaponDescTextBox:completeAnimation()
				self.unlockWeaponDescTextBox:setAlpha( 1 )
				self.clipFinished( unlockWeaponDescTextBox, {} )
				weaponDescTextBox:completeAnimation()
				self.weaponDescTextBox:setAlpha( 0 )
				self.clipFinished( weaponDescTextBox, {} )
				weaponProgression:completeAnimation()
				self.weaponProgression:setAlpha( 0 )
				self.clipFinished( weaponProgression, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0.66 )
				self.clipFinished( lockedIcon, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "VariantSelect",
			condition = function ( menu, element, event )
				return IsCurrentMenuWeaponMenu( menu ) and IsGlobalModelValueEqualTo( element, controller, "WGSV_Category", CoD.WGSV_Category.GUNSMITH_VARIANT )
			end
		},
		{
			stateName = "AttachmentLocked",
			condition = function ( menu, element, event )
				return IsCurrentMenuAttachmentMenu( menu ) and IsCACItemLocked( menu, element, controller )
			end
		},
		{
			stateName = "EquipmentSelectLocked",
			condition = function ( menu, element, event )
				return IsCACItemLocked( menu, element, controller ) and IsCurrentMenuEquipmentMenu( menu )
			end
		},
		{
			stateName = "EquipmentSelect",
			condition = function ( menu, element, event )
				return IsCurrentMenuEquipmentMenu( menu )
			end
		},
		{
			stateName = "CybercoreRigSelectLocked",
			condition = function ( menu, element, event )
				return IsCACItemLocked( menu, element, controller ) and IsCurrentMenuCybercoreOrRigMenu( menu )
			end
		},
		{
			stateName = "CybercoreRigSelect",
			condition = function ( menu, element, event )
				return IsCurrentMenu( menu, "TacticalRigSelect" )
			end
		},
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsCACItemLocked( menu, element, controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "WGSV_Category" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "WGSV_Category"
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
		self.previewImage:close()
		self.weaponDescTextBox:close()
		self.itemName:close()
		self.WeaponAttributesInternal:close()
		self.weaponProgression:close()
		self.lockedIcon:close()
		self.xcamMouse:close()
		self.unlockWeaponDescTextBox:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

