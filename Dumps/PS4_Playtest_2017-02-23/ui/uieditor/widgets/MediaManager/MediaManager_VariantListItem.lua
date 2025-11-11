require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgIdle" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.CAC.cac_IconTokenGrid" )
require( "ui.uieditor.widgets.CAC.cac_LabelNew" )
require( "ui.uieditor.widgets.CAC.cac_ListButtonLabel" )
require( "ui.uieditor.widgets.CAC.cac_lock" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )

CoD.MediaManager_VariantListItem = InheritFrom( LUI.UIElement )
CoD.MediaManager_VariantListItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MediaManager_VariantListItem )
	self.id = "MediaManager_VariantListItem"
	self.soundSet = "Paintshop"
	self:setLeftRight( 0, 0, 0, 420 )
	self:setTopBottom( 0, 0, 0, 97 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( 0, 1, -3, 3 )
	BoxButtonLrgInactiveDiag:setTopBottom( 0, 1, -3, 3 )
	BoxButtonLrgInactiveDiag:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( 0, 1, -3, 3 )
	BoxButtonLrgInactive:setTopBottom( 0, 1, -3, 3 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local BoxButtonLrgIdle = CoD.cac_ButtonBoxLrgIdle.new( menu, controller )
	BoxButtonLrgIdle:setLeftRight( 0, 1, -3, 3 )
	BoxButtonLrgIdle:setTopBottom( 0, 1, -3, 3 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local extraCamRender = LUI.UIImage.new()
	extraCamRender:setLeftRight( 0, 1, 0, -318 )
	extraCamRender:setTopBottom( 0, 1, 0, 0 )
	extraCamRender:linkToElementModel( self, "variantIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			extraCamRender:setupWCVariantIconExtraCamRender( GetGunsmithExtraCamParameters( controller, modelValue ) )
		end
	end )
	self:addElement( extraCamRender )
	self.extraCamRender = extraCamRender
	
	local LabelButton = CoD.cac_ListButtonLabel.new( menu, controller )
	LabelButton:setLeftRight( 0, 0, 129, 399 )
	LabelButton:setTopBottom( 0.5, 0.5, -15, 15 )
	LabelButton:linkToElementModel( self, "variantName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LabelButton.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( LabelButton )
	self.LabelButton = LabelButton
	
	local equippedIcon = LUI.UIImage.new()
	equippedIcon:setLeftRight( 1, 1, -21, 0 )
	equippedIcon:setTopBottom( 0, 0, 0, 21 )
	equippedIcon:setRGB( 0.56, 0.68, 0.27 )
	equippedIcon:setAlpha( 0 )
	equippedIcon:setImage( RegisterImage( "t7_hud_cac_equipped_16" ) )
	self:addElement( equippedIcon )
	self.equippedIcon = equippedIcon
	
	local alertIcon = LUI.UIImage.new()
	alertIcon:setLeftRight( 1, 1, -21, 0 )
	alertIcon:setTopBottom( 0, 0, 0, 21 )
	alertIcon:setRGB( 1, 0.41, 0 )
	alertIcon:setAlpha( 0 )
	alertIcon:setImage( RegisterImage( "t7_hud_cac_warning_16" ) )
	self:addElement( alertIcon )
	self.alertIcon = alertIcon
	
	local lockedIcon = CoD.cac_lock.new( menu, controller )
	lockedIcon:setLeftRight( 0.5, 0.5, -18, 18 )
	lockedIcon:setTopBottom( 0.5, 0.5, -24, 24 )
	lockedIcon:setAlpha( 0 )
	self:addElement( lockedIcon )
	self.lockedIcon = lockedIcon
	
	local IconNew = CoD.cac_LabelNew.new( menu, controller )
	IconNew:setLeftRight( 0.5, 0.5, -81, 81 )
	IconNew:setTopBottom( 0.5, 0.5, -17, 19 )
	IconNew:setAlpha( 0 )
	self:addElement( IconNew )
	self.IconNew = IconNew
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( 0, 1, -3, 3 )
	FocusBarT:setTopBottom( 0, 0, -6, 0 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( 0, 1, -3, 3 )
	FocusBarB:setTopBottom( 1, 1, 0, 6 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local FocusBorder = CoD.FE_TitleNumBrdr.new( menu, controller )
	FocusBorder:setLeftRight( 0, 1, 0, 0 )
	FocusBorder:setTopBottom( 0, 1, 0, 0 )
	FocusBorder:setRGB( 1, 0.3, 0 )
	FocusBorder:setAlpha( 0 )
	self:addElement( FocusBorder )
	self.FocusBorder = FocusBorder
	
	local glitch = LUI.UIImage.new()
	glitch:setLeftRight( 0, 1, -8, 6 )
	glitch:setTopBottom( 0, 0, -14, 6 )
	glitch:setRGB( 1, 0.09, 0 )
	glitch:setAlpha( 0 )
	glitch:setImage( RegisterImage( "uie_t7_effect_glitches_menu10" ) )
	glitch:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glitch )
	self.glitch = glitch
	
	local glitch2 = LUI.UIImage.new()
	glitch2:setLeftRight( 0, 1, -8, 6 )
	glitch2:setTopBottom( 1, 1, -7, 15 )
	glitch2:setRGB( 1, 0.15, 0 )
	glitch2:setAlpha( 0 )
	glitch2:setImage( RegisterImage( "uie_t7_effect_glitches_menu10" ) )
	glitch2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glitch2 )
	self.glitch2 = glitch2
	
	local cacIconTokenGrid0 = CoD.cac_IconTokenGrid.new( menu, controller )
	cacIconTokenGrid0:setLeftRight( 1, 1, -42, 0 )
	cacIconTokenGrid0:setTopBottom( 0, 0, -1, 41 )
	cacIconTokenGrid0:setAlpha( 0 )
	self:addElement( cacIconTokenGrid0 )
	self.cacIconTokenGrid0 = cacIconTokenGrid0
	
	local itemImageLine = LUI.UIImage.new()
	itemImageLine:setLeftRight( 0, 0, 102, 108 )
	itemImageLine:setTopBottom( 0.5, 0.5, -49, 49 )
	itemImageLine:setAlpha( 0.3 )
	itemImageLine:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	itemImageLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( itemImageLine )
	self.itemImageLine = itemImageLine
	
	local PlusImage = LUI.UIImage.new()
	PlusImage:setLeftRight( 0, 0, 21, 87 )
	PlusImage:setTopBottom( 0, 0, 14, 80 )
	PlusImage:linkToElementModel( self, "plusImageSrc", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PlusImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( PlusImage )
	self.PlusImage = PlusImage
	
	self.extraCamRender:linkToElementModel( self, "showBuyImage", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			extraCamRender:setAlpha( Negate( modelValue ) )
		end
	end )
	self.PlusImage:linkToElementModel( self, "showBuyImage", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PlusImage:setAlpha( modelValue )
		end
	end )
	self.resetProperties = function ()
		BoxButtonLrgInactive:completeAnimation()
		FocusBarB:completeAnimation()
		FocusBarT:completeAnimation()
		BoxButtonLrgInactive:setAlpha( 1 )
		FocusBarB:setLeftRight( 0, 1, -3, 3 )
		FocusBarB:setTopBottom( 1, 1, 0, 6 )
		FocusBarB:setAlpha( 0 )
		FocusBarT:setLeftRight( 0, 1, -3, 3 )
		FocusBarT:setTopBottom( 0, 0, -6, 0 )
		FocusBarT:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( 0, 1, -3, 3 )
				self.FocusBarT:setTopBottom( 0, 0, 0, 6 )
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( 0, 1, -3, 3 )
				self.FocusBarB:setTopBottom( 1, 1, -5, 1 )
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( 0, 1, -3, 3 )
				self.FocusBarT:setTopBottom( 0, 0, 0, 6 )
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( 0, 1, -3, 3 )
				self.FocusBarB:setTopBottom( 1, 1, -6, 0 )
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BoxButtonLrgInactiveDiag:close()
		self.BoxButtonLrgInactive:close()
		self.BoxButtonLrgIdle:close()
		self.LabelButton:close()
		self.lockedIcon:close()
		self.IconNew:close()
		self.FocusBarT:close()
		self.FocusBarB:close()
		self.FocusBorder:close()
		self.cacIconTokenGrid0:close()
		self.extraCamRender:close()
		self.PlusImage:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

