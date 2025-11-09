require( "ui.uieditor.widgets.Heroes.heroCustomizationOption_EquippedIcon" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgIdle" )
require( "ui.uieditor.widgets.CAC.cac_ListButtonLabel" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

CoD.heroCustomizationOption = InheritFrom( LUI.UIElement )
CoD.heroCustomizationOption.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.heroCustomizationOption )
	self.id = "heroCustomizationOption"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 108 )
	self:setTopBottom( true, false, 0, 108 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local lockedIcon = LUI.UIImage.new()
	lockedIcon:setLeftRight( false, false, -16, 16 )
	lockedIcon:setTopBottom( false, false, -16, 16 )
	lockedIcon:setRGB( 1, 1, 1 )
	lockedIcon:setAlpha( 0 )
	lockedIcon:setImage( RegisterImage( "uie_t7_hud_cac_lock_64" ) )
	lockedIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( lockedIcon )
	self.lockedIcon = lockedIcon
	
	local heroCustomizationOptionEquippedIcon0 = CoD.heroCustomizationOption_EquippedIcon.new( menu, controller )
	heroCustomizationOptionEquippedIcon0:setLeftRight( true, false, 88, 104 )
	heroCustomizationOptionEquippedIcon0:setTopBottom( true, false, 4, 20 )
	heroCustomizationOptionEquippedIcon0:setRGB( 1, 1, 1 )
	self:addElement( heroCustomizationOptionEquippedIcon0 )
	self.heroCustomizationOptionEquippedIcon0 = heroCustomizationOptionEquippedIcon0
	
	local itemImage0 = LUI.UIImage.new()
	itemImage0:setLeftRight( true, true, 0, 0 )
	itemImage0:setTopBottom( true, true, 0, 0 )
	itemImage0:setRGB( 0.48, 0.48, 0.48 )
	itemImage0:setAlpha( 0.15 )
	itemImage0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( itemImage0 )
	self.itemImage0 = itemImage0
	
	local itemImage = LUI.UIImage.new()
	itemImage:setLeftRight( true, true, 0, 0 )
	itemImage:setTopBottom( true, false, 0, 108 )
	itemImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	itemImage:linkToElementModel( self, "color", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemImage:setRGB( modelValue )
		end
	end )
	itemImage:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( itemImage )
	self.itemImage = itemImage
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactive:setTopBottom( true, true, -2, 2 )
	BoxButtonLrgInactive:setRGB( 1, 1, 1 )
	BoxButtonLrgInactive:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local BoxButtonLrgIdle = CoD.cac_ButtonBoxLrgIdle.new( menu, controller )
	BoxButtonLrgIdle:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgIdle:setTopBottom( true, true, -2, 2 )
	BoxButtonLrgIdle:setRGB( 1, 1, 1 )
	BoxButtonLrgIdle:setAlpha( 0.25 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local LabelButton = CoD.cac_ListButtonLabel.new( menu, controller )
	LabelButton:setLeftRight( true, false, 3, 89 )
	LabelButton:setTopBottom( false, false, 32, 52 )
	LabelButton:setRGB( 1, 1, 1 )
	LabelButton.Panel:setAlpha( 0.6 )
	LabelButton.itemName:setRGB( 0.82, 0.85, 0.88 )
	LabelButton:linkToElementModel( self, nil, false, function ( model )
		LabelButton:setModel( model, controller )
	end )
	LabelButton:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LabelButton.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( LabelButton )
	self.LabelButton = LabelButton
	
	local FETitleNumBrdr1 = CoD.FE_TitleNumBrdr.new( menu, controller )
	FETitleNumBrdr1:setLeftRight( true, true, 0, 0 )
	FETitleNumBrdr1:setTopBottom( true, true, 0, 0 )
	FETitleNumBrdr1:setRGB( 1, 1, 1 )
	self:addElement( FETitleNumBrdr1 )
	self.FETitleNumBrdr1 = FETitleNumBrdr1
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, -2, 2 )
	FocusBarT:setTopBottom( true, false, 0, 4 )
	FocusBarT:setRGB( 1, 1, 1 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, -2, 2 )
	FocusBarB:setTopBottom( false, true, -4, 0 )
	FocusBarB:setRGB( 1, 1, 1 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0.25 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				LabelButton:completeAnimation()
				LabelButton.Panel:completeAnimation()
				self.LabelButton.Panel:setAlpha( 0.6 )
				self.clipFinished( LabelButton, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 5 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				FETitleNumBrdr1:completeAnimation()
				self.FETitleNumBrdr1:setLeftRight( true, true, 0, 0 )
				self.FETitleNumBrdr1:setTopBottom( true, true, 0, 0 )
				self.clipFinished( FETitleNumBrdr1, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end
		},
		ColorOption = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				itemImage:completeAnimation()
				self.itemImage:setLeftRight( true, true, 0, 0 )
				self.itemImage:setTopBottom( true, false, 0, 85 )
				self.clipFinished( itemImage, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "ColorOption",
			condition = function ( menu, element, event )
				return IsHeroColorOption( element )
			end
		}
	} )
	self.close = function ( self )
		self.heroCustomizationOptionEquippedIcon0:close()
		self.BoxButtonLrgInactive:close()
		self.BoxButtonLrgIdle:close()
		self.LabelButton:close()
		self.FETitleNumBrdr1:close()
		self.FocusBarT:close()
		self.FocusBarB:close()
		self.itemImage:close()
		CoD.heroCustomizationOption.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

