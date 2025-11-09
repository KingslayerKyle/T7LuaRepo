require( "ui.uieditor.widgets.CAC.MenuSelectScreen.PreviewImageWidget" )
require( "ui.uieditor.widgets.CAC.UnlockTokensWidget" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )
require( "ui.uieditor.widgets.CAC.WeaponAttributes_Internal" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.SelectionInfoWidgetItemBox" )

local PostLoadFunc = function ( self, controller )
	self:subscribeToElementModel( self, nil, function ( model )
		local modelValue = Engine.GetModel( model, "itemIndex" )
		if modelValue then
			local itemIndex = Engine.GetModelValue( modelValue )
			self.unlockWeaponDescTextBox:setText( CoD.GetUnlockStringForItemIndex( controller, itemIndex ) )
		end
		self:processEvent( {
			name = "update_state",
			controller = controller
		} )
	end )
	if self.WeaponNameWidget0 then
		self.WeaponNameWidget0:linkToElementModel( self, "name", true, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				self.WeaponNameWidget0.weaponNameLabel:setText( LocalizeToUpperString( modelValue ) )
				local textWidth = self.WeaponNameWidget0.weaponNameLabel:getTextWidth()
				local left, top, right, bottom = self.WeaponNameWidget0:getLocalRect()
				local extraTextWidth = 16
				self.WeaponNameWidget0:setLeftRight( true, false, left, left + textWidth + extraTextWidth )
			end
		end )
	end
end

CoD.SelectionInfoWidget_old = InheritFrom( LUI.UIElement )
CoD.SelectionInfoWidget_old.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SelectionInfoWidget_old )
	self.id = "SelectionInfoWidget_old"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 717 )
	self:setTopBottom( true, false, 0, 510 )
	self.anyChildUsesUpdateState = true
	
	local previewImage = CoD.PreviewImageWidget.new( menu, controller )
	previewImage:setLeftRight( true, false, -146, 866 )
	previewImage:setTopBottom( true, false, -87.5, 418.5 )
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
	
	local InfoBoxStroke = LUI.UIImage.new()
	InfoBoxStroke:setLeftRight( true, false, 0, 717.34 )
	InfoBoxStroke:setTopBottom( true, false, 372.67, 455.34 )
	InfoBoxStroke:setRGB( 1, 1, 1 )
	InfoBoxStroke:setZoom( -120 )
	InfoBoxStroke:setImage( RegisterImage( "uie_img_t7_menu_cacselection_infoboxastroke" ) )
	InfoBoxStroke:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( InfoBoxStroke )
	self.InfoBoxStroke = InfoBoxStroke
	
	local InfoBox = LUI.UIImage.new()
	InfoBox:setLeftRight( true, false, 0, 720 )
	InfoBox:setTopBottom( true, false, 373, 458.34 )
	InfoBox:setRGB( 1, 1, 1 )
	InfoBox:setZoom( -20 )
	InfoBox:setImage( RegisterImage( "uie_img_t7_menu_cacselection_infoboxa" ) )
	InfoBox:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( InfoBox )
	self.InfoBox = InfoBox
	
	local InfoBoxTitleBack = LUI.UIImage.new()
	InfoBoxTitleBack:setLeftRight( true, false, 0, 717.34 )
	InfoBoxTitleBack:setTopBottom( true, false, 333, 367.67 )
	InfoBoxTitleBack:setRGB( 1, 1, 1 )
	InfoBoxTitleBack:setZoom( -50 )
	InfoBoxTitleBack:setImage( RegisterImage( "uie_img_t7_menu_cacselection_infoboxatitleback" ) )
	InfoBoxTitleBack:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( InfoBoxTitleBack )
	self.InfoBoxTitleBack = InfoBoxTitleBack
	
	local unlockWeaponDescTextBox = LUI.UIText.new()
	unlockWeaponDescTextBox:setLeftRight( true, false, 21.84, 255.84 )
	unlockWeaponDescTextBox:setTopBottom( true, false, 389.43, 406.43 )
	unlockWeaponDescTextBox:setRGB( 0.44, 0.51, 0.56 )
	unlockWeaponDescTextBox:setAlpha( 0 )
	unlockWeaponDescTextBox:setText( Engine.Localize( "PERKS_UNLOCKED_AT_LV" ) )
	unlockWeaponDescTextBox:setTTF( "fonts/default.ttf" )
	unlockWeaponDescTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	unlockWeaponDescTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( unlockWeaponDescTextBox )
	self.unlockWeaponDescTextBox = unlockWeaponDescTextBox
	
	local weaponDescTextBox = LUI.UIText.new()
	weaponDescTextBox:setLeftRight( true, false, 21.84, 255.84 )
	weaponDescTextBox:setTopBottom( true, false, 389.43, 406.43 )
	weaponDescTextBox:setRGB( 1, 1, 1 )
	weaponDescTextBox:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
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
	
	local unlockTokensWidget = CoD.UnlockTokensWidget.new( menu, controller )
	unlockTokensWidget:setLeftRight( false, true, -210, 0 )
	unlockTokensWidget:setTopBottom( true, false, 464, 492 )
	unlockTokensWidget:setRGB( 1, 1, 1 )
	self:addElement( unlockTokensWidget )
	self.unlockTokensWidget = unlockTokensWidget
	
	local lockedIcon = LUI.UIImage.new()
	lockedIcon:setLeftRight( false, false, -32, 32 )
	lockedIcon:setTopBottom( false, false, -96, -32 )
	lockedIcon:setRGB( 0.63, 0.72, 0.79 )
	lockedIcon:setAlpha( 0.66 )
	lockedIcon:setZoom( -110 )
	lockedIcon:setImage( RegisterImage( "uie_t7_hud_cac_lock_64" ) )
	lockedIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( lockedIcon )
	self.lockedIcon = lockedIcon
	
	local WeaponNameWidget0 = CoD.WeaponNameWidget.new( menu, controller )
	WeaponNameWidget0:setLeftRight( true, false, 0, 442 )
	WeaponNameWidget0:setTopBottom( false, false, 79, 113 )
	WeaponNameWidget0:setRGB( 0.85, 0.85, 0.85 )
	WeaponNameWidget0:setZoom( 45 )
	WeaponNameWidget0:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			WeaponNameWidget0.weaponNameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( WeaponNameWidget0 )
	self.WeaponNameWidget0 = WeaponNameWidget0
	
	local WeaponAttributesInternal = CoD.WeaponAttributes_Internal.new( menu, controller )
	WeaponAttributesInternal:setLeftRight( true, false, 10.51, 277.51 )
	WeaponAttributesInternal:setTopBottom( true, false, 377, 451 )
	WeaponAttributesInternal:setRGB( 1, 1, 1 )
	WeaponAttributesInternal:setAlpha( 0 )
	self:addElement( WeaponAttributesInternal )
	self.WeaponAttributesInternal = WeaponAttributesInternal
	
	local Separator = LUI.UIImage.new()
	Separator:setLeftRight( true, false, 10.51, 15.85 )
	Separator:setTopBottom( true, false, 374, 454 )
	Separator:setRGB( 1, 1, 1 )
	Separator:setAlpha( 0 )
	Separator:setImage( RegisterImage( "uie_img_t7_menu_cacselection_infoboxaseparator" ) )
	Separator:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Separator )
	self.Separator = Separator
	
	local SelectionInfoWidgetItemBox = CoD.SelectionInfoWidgetItemBox.new( menu, controller )
	SelectionInfoWidgetItemBox:setLeftRight( true, false, -1, 719.34 )
	SelectionInfoWidgetItemBox:setTopBottom( true, false, -147, 478 )
	SelectionInfoWidgetItemBox:setRGB( 1, 1, 1 )
	SelectionInfoWidgetItemBox:setAlpha( 0.74 )
	self:addElement( SelectionInfoWidgetItemBox )
	self.SelectionInfoWidgetItemBox = SelectionInfoWidgetItemBox
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				previewImage:completeAnimation()
				self.previewImage:setAlpha( 1 )
				self.clipFinished( previewImage, {} )
				unlockWeaponDescTextBox:completeAnimation()
				self.unlockWeaponDescTextBox:setLeftRight( true, false, 267, 501 )
				self.unlockWeaponDescTextBox:setTopBottom( true, false, 379.43, 396.43 )
				self.unlockWeaponDescTextBox:setAlpha( 0 )
				self.clipFinished( unlockWeaponDescTextBox, {} )
				weaponDescTextBox:completeAnimation()
				self.weaponDescTextBox:setLeftRight( true, false, 267, 501 )
				self.weaponDescTextBox:setTopBottom( true, false, 379.43, 396.43 )
				self.weaponDescTextBox:setAlpha( 1 )
				self.clipFinished( weaponDescTextBox, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
				Separator:completeAnimation()
				self.Separator:setLeftRight( true, false, 255.67, 261.01 )
				self.Separator:setTopBottom( true, false, 374, 454 )
				self.clipFinished( Separator, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				previewImage:completeAnimation()
				self.previewImage:setAlpha( 0 )
				self.clipFinished( previewImage, {} )
				InfoBoxStroke:completeAnimation()
				self.InfoBoxStroke:setZoom( -75 )
				self.clipFinished( InfoBoxStroke, {} )
				unlockWeaponDescTextBox:completeAnimation()
				self.unlockWeaponDescTextBox:setLeftRight( true, false, 267, 501 )
				self.unlockWeaponDescTextBox:setTopBottom( true, false, 379.43, 396.43 )
				self.unlockWeaponDescTextBox:setAlpha( 1 )
				self.clipFinished( unlockWeaponDescTextBox, {} )
				weaponDescTextBox:completeAnimation()
				self.weaponDescTextBox:setLeftRight( true, false, 267, 501 )
				self.weaponDescTextBox:setTopBottom( true, false, 379.43, 396.43 )
				self.weaponDescTextBox:setAlpha( 0 )
				self.clipFinished( weaponDescTextBox, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0.66 )
				self.clipFinished( lockedIcon, {} )
				Separator:completeAnimation()
				self.Separator:setLeftRight( true, false, 255.67, 261.01 )
				self.Separator:setTopBottom( true, false, 374, 454 )
				self.clipFinished( Separator, {} )
			end
		},
		NoAttributesLocked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				previewImage:completeAnimation()
				self.previewImage:setAlpha( 0 )
				self.clipFinished( previewImage, {} )
				unlockWeaponDescTextBox:completeAnimation()
				self.unlockWeaponDescTextBox:setLeftRight( true, false, 21.84, 255.84 )
				self.unlockWeaponDescTextBox:setTopBottom( true, false, 379.43, 396.43 )
				self.clipFinished( unlockWeaponDescTextBox, {} )
				weaponDescTextBox:completeAnimation()
				self.weaponDescTextBox:setLeftRight( true, false, 21.84, 255.84 )
				self.weaponDescTextBox:setTopBottom( true, false, 379.43, 396.43 )
				self.clipFinished( weaponDescTextBox, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0.66 )
				self.clipFinished( lockedIcon, {} )
				Separator:completeAnimation()
				self.Separator:setLeftRight( true, false, 10.51, 15.85 )
				self.Separator:setTopBottom( true, false, 374, 454 )
				self.clipFinished( Separator, {} )
			end
		},
		NoAttributes = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				previewImage:completeAnimation()
				self.previewImage:setAlpha( 0 )
				self.clipFinished( previewImage, {} )
				unlockWeaponDescTextBox:completeAnimation()
				self.unlockWeaponDescTextBox:setLeftRight( true, false, 21.84, 255.84 )
				self.unlockWeaponDescTextBox:setTopBottom( true, false, 389.43, 406.43 )
				self.unlockWeaponDescTextBox:setAlpha( 0 )
				self.clipFinished( unlockWeaponDescTextBox, {} )
				weaponDescTextBox:completeAnimation()
				self.weaponDescTextBox:setLeftRight( true, false, 21.84, 255.84 )
				self.weaponDescTextBox:setTopBottom( true, false, 389.43, 406.43 )
				self.weaponDescTextBox:setAlpha( 1 )
				self.clipFinished( weaponDescTextBox, {} )
				Separator:completeAnimation()
				self.Separator:setLeftRight( true, false, 10.51, 15.85 )
				self.Separator:setTopBottom( true, false, 374, 454 )
				self.clipFinished( Separator, {} )
			end
		}
	}
	self.close = function ( self )
		self.previewImage:close()
		self.unlockTokensWidget:close()
		self.WeaponNameWidget0:close()
		self.WeaponAttributesInternal:close()
		self.SelectionInfoWidgetItemBox:close()
		self.weaponDescTextBox:close()
		CoD.SelectionInfoWidget_old.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

