require( "ui.uieditor.widgets.BorderBakedMask" )
require( "ui.uieditor.widgets.BorderBakedSolid" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgIdle" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.CAC.CustomClassListScreen.Panes.CustomClassPlusSymbol" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.PersonalizePrompt" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

CoD.WeaponItemModelWidget_Internal = InheritFrom( LUI.UIElement )
CoD.WeaponItemModelWidget_Internal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WeaponItemModelWidget_Internal )
	self.id = "WeaponItemModelWidget_Internal"
	self.soundSet = "CAC"
	self:setLeftRight( 0, 0, 0, 193 )
	self:setTopBottom( 0, 0, 0, 193 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BorderBakedMask0 = CoD.BorderBakedMask.new( menu, controller )
	BorderBakedMask0:setLeftRight( 0, 1, 0, 0 )
	BorderBakedMask0:setTopBottom( 0, 1, 0, 0 )
	BorderBakedMask0:setRGB( 0, 0, 0 )
	BorderBakedMask0:setAlpha( 0 )
	self:addElement( BorderBakedMask0 )
	self.BorderBakedMask0 = BorderBakedMask0
	
	local BorderBakedSolid0 = CoD.BorderBakedSolid.new( menu, controller )
	BorderBakedSolid0:setLeftRight( 0, 1, 1, -1 )
	BorderBakedSolid0:setTopBottom( 0, 1, 1, -1 )
	BorderBakedSolid0:setAlpha( 0 )
	self:addElement( BorderBakedSolid0 )
	self.BorderBakedSolid0 = BorderBakedSolid0
	
	local BoxButtonLrgIdle = CoD.cac_ButtonBoxLrgIdle.new( menu, controller )
	BoxButtonLrgIdle:setLeftRight( 0, 1, 0, 0 )
	BoxButtonLrgIdle:setTopBottom( 0, 1, 0, 0 )
	BoxButtonLrgIdle:setAlpha( 0 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( 0, 1, 0, 0 )
	BoxButtonLrgInactiveDiag:setTopBottom( 0, 1, 0, 0 )
	BoxButtonLrgInactiveDiag:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( 0, 1, 0, 0 )
	BoxButtonLrgInactive:setTopBottom( 0, 1, 0, 0 )
	BoxButtonLrgInactive:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local itemImage = LUI.UIImage.new()
	itemImage:setLeftRight( 0, 1, 4, -4 )
	itemImage:setTopBottom( 0, 1, 4, -4 )
	itemImage:setAlpha( 0.5 )
	itemImage:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( itemImage )
	self.itemImage = itemImage
	
	local plusIcon = CoD.CustomClassPlusSymbol.new( menu, controller )
	plusIcon:setLeftRight( 0.5, 0.5, 275, 15 )
	plusIcon:setTopBottom( 0.5, 0.5, -13, 20 )
	plusIcon:setRGB( 1, 0.41, 0 )
	plusIcon:setAlpha( 0 )
	self:addElement( plusIcon )
	self.plusIcon = plusIcon
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 0, 9, 33 )
	Image0:setTopBottom( 0, 0, 10, 34 )
	Image0:setAlpha( 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local personalizePrompt = CoD.PersonalizePrompt.new( menu, controller )
	personalizePrompt:setLeftRight( 0.5, 0.5, -92, 92 )
	personalizePrompt:setTopBottom( 1, 1, -35, -5 )
	personalizePrompt:setAlpha( 0 )
	personalizePrompt.promptText:setText( Engine.Localize( "MPUI_BUTTON_PERSONALIZE_CAPS" ) )
	self:addElement( personalizePrompt )
	self.personalizePrompt = personalizePrompt
	
	local glitch = LUI.UIImage.new()
	glitch:setLeftRight( 0, 1, -7, 7 )
	glitch:setTopBottom( 0, 0, -14, 6 )
	glitch:setRGB( 1, 0.09, 0 )
	glitch:setAlpha( 0 )
	glitch:setImage( RegisterImage( "uie_t7_effect_glitches_menu10" ) )
	glitch:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glitch )
	self.glitch = glitch
	
	local glitch2 = LUI.UIImage.new()
	glitch2:setLeftRight( 0, 1, -7, 7 )
	glitch2:setTopBottom( 1, 1, -7, 15 )
	glitch2:setRGB( 1, 0.15, 0 )
	glitch2:setAlpha( 0 )
	glitch2:setImage( RegisterImage( "uie_t7_effect_glitches_menu10" ) )
	glitch2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glitch2 )
	self.glitch2 = glitch2
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( 0, 1, 0, 0 )
	StartMenuframenoBG0:setTopBottom( 0, 1, 0, 0 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( 0, 1, 0, 0 )
	FocusBarT:setTopBottom( 0, 0, -1, 5 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( 0, 1, 0, 0 )
	FocusBarB:setTopBottom( 1, 1, -5, 1 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	self.resetProperties = function ()
		FocusBarT:completeAnimation()
		FocusBarB:completeAnimation()
		BorderBakedMask0:completeAnimation()
		BorderBakedSolid0:completeAnimation()
		itemImage:completeAnimation()
		Image0:completeAnimation()
		personalizePrompt:completeAnimation()
		plusIcon:completeAnimation()
		FocusBarT:setAlpha( 0 )
		FocusBarB:setAlpha( 0 )
		BorderBakedMask0:setAlpha( 0 )
		BorderBakedSolid0:setAlpha( 0 )
		itemImage:setAlpha( 0.5 )
		Image0:setRGB( 1, 1, 1 )
		Image0:setAlpha( 0 )
		personalizePrompt:setAlpha( 0 )
		plusIcon:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end
		},
		Equipped = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setAlpha( 0.9 )
				self.clipFinished( BorderBakedMask0, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 1 )
				self.clipFinished( BorderBakedSolid0, {} )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0.8 )
				self.clipFinished( itemImage, {} )
				Image0:completeAnimation()
				self.Image0:setRGB( 1, 0, 0 )
				self.clipFinished( Image0, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setAlpha( 0.9 )
				self.clipFinished( BorderBakedMask0, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 1 )
				self.clipFinished( BorderBakedSolid0, {} )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 1 )
				self.clipFinished( itemImage, {} )
				Image0:completeAnimation()
				self.Image0:setRGB( 1, 0, 0 )
				self.clipFinished( Image0, {} )
			end
		},
		WeaponEquipped = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setAlpha( 0.9 )
				self.clipFinished( BorderBakedMask0, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 1 )
				self.clipFinished( BorderBakedSolid0, {} )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0.8 )
				self.clipFinished( itemImage, {} )
				Image0:completeAnimation()
				self.Image0:setRGB( 1, 0, 0 )
				self.clipFinished( Image0, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setAlpha( 0.9 )
				self.clipFinished( BorderBakedMask0, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 1 )
				self.clipFinished( BorderBakedSolid0, {} )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 1 )
				self.clipFinished( itemImage, {} )
				Image0:completeAnimation()
				self.Image0:setRGB( 1, 0, 0 )
				self.clipFinished( Image0, {} )
				personalizePrompt:completeAnimation()
				self.personalizePrompt:setAlpha( 1 )
				self.clipFinished( personalizePrompt, {} )
			end
		},
		Available = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setAlpha( 0.9 )
				self.clipFinished( BorderBakedMask0, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 1 )
				self.clipFinished( BorderBakedSolid0, {} )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0 )
				self.clipFinished( itemImage, {} )
				Image0:completeAnimation()
				self.Image0:setRGB( 0, 1, 0 )
				self.clipFinished( Image0, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setAlpha( 0.9 )
				self.clipFinished( BorderBakedMask0, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 1 )
				self.clipFinished( BorderBakedSolid0, {} )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0 )
				self.clipFinished( itemImage, {} )
				plusIcon:completeAnimation()
				self.plusIcon:setAlpha( 1 )
				self.clipFinished( plusIcon, {} )
				Image0:completeAnimation()
				self.Image0:setRGB( 0, 1, 0 )
				self.clipFinished( Image0, {} )
			end
		},
		NotEquippable = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setAlpha( 0.9 )
				self.clipFinished( BorderBakedMask0, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 1 )
				self.clipFinished( BorderBakedSolid0, {} )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0 )
				self.clipFinished( itemImage, {} )
				Image0:completeAnimation()
				self.Image0:setRGB( 0, 0, 1 )
				self.clipFinished( Image0, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setAlpha( 0.9 )
				self.clipFinished( BorderBakedMask0, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 1 )
				self.clipFinished( BorderBakedSolid0, {} )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0 )
				self.clipFinished( itemImage, {} )
				Image0:completeAnimation()
				self.Image0:setAlpha( 1 )
				self.clipFinished( Image0, {} )
			end
		},
		NotAvailable = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setAlpha( 0.9 )
				self.clipFinished( BorderBakedMask0, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 1 )
				self.clipFinished( BorderBakedSolid0, {} )
				Image0:completeAnimation()
				self.Image0:setRGB( 1, 1, 0 )
				self.clipFinished( Image0, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setAlpha( 0.9 )
				self.clipFinished( BorderBakedMask0, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 1 )
				self.clipFinished( BorderBakedSolid0, {} )
				Image0:completeAnimation()
				self.Image0:setRGB( 1, 1, 0 )
				self.clipFinished( Image0, {} )
			end
		},
		NotVisible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0 )
				self.clipFinished( itemImage, {} )
				Image0:completeAnimation()
				self.Image0:setRGB( 1, 0.5, 0 )
				self.clipFinished( Image0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return IsCACSlotEquipped( menu, element, controller )
			end
		},
		{
			stateName = "WeaponEquipped",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Available",
			condition = function ( menu, element, event )
				return IsCACSlotAvailable( menu, element, controller )
			end
		},
		{
			stateName = "NotEquippable",
			condition = function ( menu, element, event )
				return not IsCACSlotEquipped( menu, element, controller )
			end
		},
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				return not IsCACSlotAvailable( menu, element, controller )
			end
		},
		{
			stateName = "NotVisible",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BorderBakedMask0:close()
		self.BorderBakedSolid0:close()
		self.BoxButtonLrgIdle:close()
		self.BoxButtonLrgInactiveDiag:close()
		self.BoxButtonLrgInactive:close()
		self.plusIcon:close()
		self.personalizePrompt:close()
		self.StartMenuframenoBG0:close()
		self.FocusBarT:close()
		self.FocusBarB:close()
		self.itemImage:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

