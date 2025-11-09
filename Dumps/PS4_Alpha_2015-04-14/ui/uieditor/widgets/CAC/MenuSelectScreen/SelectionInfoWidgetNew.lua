require( "ui.uieditor.widgets.CAC.MenuSelectScreen.PreviewImageWidget" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )
require( "ui.uieditor.widgets.CAC.WeaponAttributes_Internal" )
require( "ui.uieditor.widgets.CAC.cac_WpnLvl" )
require( "ui.uieditor.widgets.CAC.cac_LockBig" )

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
	previewImage:setLeftRight( false, false, -516, 496 )
	previewImage:setTopBottom( false, false, -340, 166 )
	previewImage:setRGB( 1, 1, 1 )
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
	unlockWeaponDescTextBox:setRGB( 1, 1, 1 )
	unlockWeaponDescTextBox:setAlpha( 0.5 )
	unlockWeaponDescTextBox:setText( Engine.Localize( "PERKS_UNLOCKED_AT_LV" ) )
	unlockWeaponDescTextBox:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	unlockWeaponDescTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	unlockWeaponDescTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( unlockWeaponDescTextBox )
	self.unlockWeaponDescTextBox = unlockWeaponDescTextBox
	
	local weaponDescTextBox = LUI.UIText.new()
	weaponDescTextBox:setLeftRight( true, false, 20.51, 276.51 )
	weaponDescTextBox:setTopBottom( true, false, 56, 75 )
	weaponDescTextBox:setRGB( 1, 1, 1 )
	weaponDescTextBox:setAlpha( 0.7 )
	weaponDescTextBox:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	weaponDescTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	weaponDescTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	weaponDescTextBox:linkToElementModel( self, "description", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			weaponDescTextBox:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( weaponDescTextBox )
	self.weaponDescTextBox = weaponDescTextBox
	
	local WeaponNameWidget0 = CoD.WeaponNameWidget.new( menu, controller )
	WeaponNameWidget0:setLeftRight( true, false, 19, 400 )
	WeaponNameWidget0:setTopBottom( true, false, 11, 45 )
	WeaponNameWidget0:setRGB( 1, 1, 1 )
	WeaponNameWidget0:linkToElementModel( self, nil, false, function ( model )
		WeaponNameWidget0:setModel( model, controller )
	end )
	WeaponNameWidget0:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			WeaponNameWidget0.weaponNameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( WeaponNameWidget0 )
	self.WeaponNameWidget0 = WeaponNameWidget0
	
	local WeaponAttributesInternal = CoD.WeaponAttributes_Internal.new( menu, controller )
	WeaponAttributesInternal:setLeftRight( true, false, 18.51, 439.51 )
	WeaponAttributesInternal:setTopBottom( true, false, 396, 482 )
	WeaponAttributesInternal:setRGB( 1, 1, 1 )
	self:addElement( WeaponAttributesInternal )
	self.WeaponAttributesInternal = WeaponAttributesInternal
	
	local cacWpnLvl0 = CoD.cac_WpnLvl.new( menu, controller )
	cacWpnLvl0:setLeftRight( true, false, 20.51, 435.51 )
	cacWpnLvl0:setTopBottom( true, false, 485, 525 )
	cacWpnLvl0:setRGB( 1, 1, 1 )
	cacWpnLvl0.FELabelSubHeadingB0.Label1:setRGB( 0.71, 0.76, 0.77 )
	cacWpnLvl0.FELabelSubHeadingB0.Label1:setText( Engine.Localize( "LEVEL" ) )
	cacWpnLvl0.FELabelSubHeadingB0.Label1:setTTF( "fonts/Entovo.ttf" )
	self:addElement( cacWpnLvl0 )
	self.cacWpnLvl0 = cacWpnLvl0
	
	local lockedIcon = CoD.cac_LockBig.new( menu, controller )
	lockedIcon:setLeftRight( true, false, 371.51, 467.51 )
	lockedIcon:setTopBottom( true, false, -97, 573 )
	lockedIcon:setRGB( 1, 1, 1 )
	lockedIcon:setAlpha( 0 )
	lockedIcon.circles:setRGB( 1, 1, 1 )
	self:addElement( lockedIcon )
	self.lockedIcon = lockedIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				unlockWeaponDescTextBox:completeAnimation()
				self.unlockWeaponDescTextBox:setAlpha( 0 )
				self.clipFinished( unlockWeaponDescTextBox, {} )
				weaponDescTextBox:completeAnimation()
				self.weaponDescTextBox:setAlpha( 1 )
				self.clipFinished( weaponDescTextBox, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
			end
		},
		PerkSelect = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				previewImage:completeAnimation()
				self.previewImage:setAlpha( 1 )
				self.clipFinished( previewImage, {} )
				unlockWeaponDescTextBox:completeAnimation()
				self.unlockWeaponDescTextBox:setAlpha( 0 )
				self.clipFinished( unlockWeaponDescTextBox, {} )
				weaponDescTextBox:completeAnimation()
				self.weaponDescTextBox:setAlpha( 1 )
				self.clipFinished( weaponDescTextBox, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				previewImage:completeAnimation()
				self.previewImage:setAlpha( 0 )
				self.clipFinished( previewImage, {} )
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
		NoAttributesLocked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				previewImage:completeAnimation()
				self.previewImage:setAlpha( 0 )
				self.clipFinished( previewImage, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0.66 )
				self.clipFinished( lockedIcon, {} )
			end
		},
		NoAttributes = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				previewImage:completeAnimation()
				self.previewImage:setAlpha( 0 )
				self.clipFinished( previewImage, {} )
				unlockWeaponDescTextBox:completeAnimation()
				self.unlockWeaponDescTextBox:setAlpha( 0 )
				self.clipFinished( unlockWeaponDescTextBox, {} )
				weaponDescTextBox:completeAnimation()
				self.weaponDescTextBox:setAlpha( 1 )
				self.clipFinished( weaponDescTextBox, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "PerkSelect",
			condition = function ( menu, element, event )
				return IsCurrentMenu( menu, "PerkSelect" )
			end
		},
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "NoAttributesLocked",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "NoAttributes",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self.close = function ( self )
		self.previewImage:close()
		self.WeaponNameWidget0:close()
		self.WeaponAttributesInternal:close()
		self.cacWpnLvl0:close()
		self.lockedIcon:close()
		self.weaponDescTextBox:close()
		CoD.SelectionInfoWidgetNew.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

