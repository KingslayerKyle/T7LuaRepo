-- a04f988ab1118b0b3047d33bffcff4df
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BorderBakedMask" )
require( "ui.uieditor.widgets.BorderBakedSolid" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgIdle" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CAC.CustomClassListScreen.Panes.CustomClassPlusSymbol" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.PersonalizePrompt" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

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
	self:setLeftRight( true, false, 0, 129 )
	self:setTopBottom( true, false, 0, 129 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BorderBakedMask0 = CoD.BorderBakedMask.new( menu, controller )
	BorderBakedMask0:setLeftRight( true, true, 0, 0 )
	BorderBakedMask0:setTopBottom( true, true, 0, 0 )
	BorderBakedMask0:setRGB( 0, 0, 0 )
	BorderBakedMask0:setAlpha( 0 )
	self:addElement( BorderBakedMask0 )
	self.BorderBakedMask0 = BorderBakedMask0
	
	local BorderBakedSolid0 = CoD.BorderBakedSolid.new( menu, controller )
	BorderBakedSolid0:setLeftRight( true, true, 0.5, -0.5 )
	BorderBakedSolid0:setTopBottom( true, true, 0.5, -0.5 )
	BorderBakedSolid0:setAlpha( 0 )
	self:addElement( BorderBakedSolid0 )
	self.BorderBakedSolid0 = BorderBakedSolid0
	
	local BoxButtonLrgIdle = CoD.cac_ButtonBoxLrgIdle.new( menu, controller )
	BoxButtonLrgIdle:setLeftRight( true, true, 0, 0 )
	BoxButtonLrgIdle:setTopBottom( true, true, 0, 0 )
	BoxButtonLrgIdle:setAlpha( 0 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( true, true, 0, 0 )
	BoxButtonLrgInactiveDiag:setTopBottom( true, true, 0, 0 )
	BoxButtonLrgInactiveDiag:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( true, true, 0, 0 )
	BoxButtonLrgInactive:setTopBottom( true, true, 0, 0 )
	BoxButtonLrgInactive:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local itemImage = LUI.UIImage.new()
	itemImage:setLeftRight( true, true, 3, -3 )
	itemImage:setTopBottom( true, true, 3, -3 )
	itemImage:setAlpha( 0.5 )
	itemImage:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			itemImage:setImage( RegisterImage( image ) )
		end
	end )
	self:addElement( itemImage )
	self.itemImage = itemImage
	
	local plusIcon = CoD.CustomClassPlusSymbol.new( menu, controller )
	plusIcon:setLeftRight( false, false, 183, 10 )
	plusIcon:setTopBottom( false, false, -9, 13 )
	plusIcon:setRGB( 1, 0.41, 0 )
	plusIcon:setAlpha( 0 )
	self:addElement( plusIcon )
	self.plusIcon = plusIcon
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 6, 22 )
	Image0:setTopBottom( true, false, 7, 23 )
	Image0:setAlpha( 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local personalizePrompt = CoD.PersonalizePrompt.new( menu, controller )
	personalizePrompt:setLeftRight( false, false, -61.5, 61.5 )
	personalizePrompt:setTopBottom( false, true, -23, -3 )
	personalizePrompt:setAlpha( 0 )
	personalizePrompt.promptText:setText( Engine.Localize( "MPUI_BUTTON_PERSONALIZE_CAPS" ) )
	self:addElement( personalizePrompt )
	self.personalizePrompt = personalizePrompt
	
	local glitch = LUI.UIImage.new()
	glitch:setLeftRight( true, true, -4.5, 4.5 )
	glitch:setTopBottom( true, false, -9.75, 3.75 )
	glitch:setRGB( 1, 0.09, 0 )
	glitch:setAlpha( 0 )
	glitch:setImage( RegisterImage( "uie_t7_effect_glitches_menu10" ) )
	glitch:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glitch )
	self.glitch = glitch
	
	local glitch2 = LUI.UIImage.new()
	glitch2:setLeftRight( true, true, -4.5, 4.5 )
	glitch2:setTopBottom( false, true, -5, 10 )
	glitch2:setRGB( 1, 0.15, 0 )
	glitch2:setAlpha( 0 )
	glitch2:setImage( RegisterImage( "uie_t7_effect_glitches_menu10" ) )
	glitch2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glitch2 )
	self.glitch2 = glitch2
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( true, true, 0, 0 )
	StartMenuframenoBG0:setTopBottom( true, true, 0, 0 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, 0, 0 )
	FocusBarT:setTopBottom( true, false, -1, 3 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, 0, 0 )
	FocusBarB:setTopBottom( false, true, -3, 1 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )

				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setAlpha( 0 )
				self.clipFinished( BorderBakedMask0, {} )

				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 0 )
				self.clipFinished( BorderBakedSolid0, {} )

				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgIdle, {} )

				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )

				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0.5 )
				self.clipFinished( itemImage, {} )

				plusIcon:completeAnimation()
				self.plusIcon:setAlpha( 0 )
				self.clipFinished( plusIcon, {} )

				Image0:completeAnimation()
				self.Image0:setRGB( 1, 1, 1 )
				self.clipFinished( Image0, {} )

				personalizePrompt:completeAnimation()
				self.personalizePrompt:setAlpha( 0 )
				self.clipFinished( personalizePrompt, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 7 )

				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgIdle, {} )

				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )

				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )

				plusIcon:completeAnimation()
				self.plusIcon:setAlpha( 0 )
				self.clipFinished( plusIcon, {} )

				personalizePrompt:completeAnimation()
				self.personalizePrompt:setAlpha( 0 )
				self.clipFinished( personalizePrompt, {} )

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
				self:setupElementClipCounter( 6 )

				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setAlpha( 0.9 )
				self.clipFinished( BorderBakedMask0, {} )

				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 1 )
				self.clipFinished( BorderBakedSolid0, {} )

				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0.8 )
				self.clipFinished( itemImage, {} )

				plusIcon:completeAnimation()
				self.plusIcon:setAlpha( 0 )
				self.clipFinished( plusIcon, {} )

				Image0:completeAnimation()
				self.Image0:setRGB( 1, 0, 0 )
				self.clipFinished( Image0, {} )

				personalizePrompt:completeAnimation()
				self.personalizePrompt:setAlpha( 0 )
				self.clipFinished( personalizePrompt, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 6 )

				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setAlpha( 0.9 )
				self.clipFinished( BorderBakedMask0, {} )

				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 1 )
				self.clipFinished( BorderBakedSolid0, {} )

				itemImage:completeAnimation()
				self.itemImage:setAlpha( 1 )
				self.clipFinished( itemImage, {} )

				plusIcon:completeAnimation()
				self.plusIcon:setAlpha( 0 )
				self.clipFinished( plusIcon, {} )

				Image0:completeAnimation()
				self.Image0:setRGB( 1, 0, 0 )
				self.clipFinished( Image0, {} )

				personalizePrompt:completeAnimation()
				self.personalizePrompt:setAlpha( 0 )
				self.clipFinished( personalizePrompt, {} )
			end
		},
		WeaponEquipped = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setAlpha( 0.9 )
				self.clipFinished( BorderBakedMask0, {} )

				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 1 )
				self.clipFinished( BorderBakedSolid0, {} )

				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0.8 )
				self.clipFinished( itemImage, {} )

				plusIcon:completeAnimation()
				self.plusIcon:setAlpha( 0 )
				self.clipFinished( plusIcon, {} )

				Image0:completeAnimation()
				self.Image0:setRGB( 1, 0, 0 )
				self.clipFinished( Image0, {} )

				personalizePrompt:completeAnimation()
				self.personalizePrompt:setAlpha( 0 )
				self.clipFinished( personalizePrompt, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 6 )

				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setAlpha( 0.9 )
				self.clipFinished( BorderBakedMask0, {} )

				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 1 )
				self.clipFinished( BorderBakedSolid0, {} )

				itemImage:completeAnimation()
				self.itemImage:setAlpha( 1 )
				self.clipFinished( itemImage, {} )

				plusIcon:completeAnimation()
				self.plusIcon:setAlpha( 0 )
				self.clipFinished( plusIcon, {} )

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
				self:setupElementClipCounter( 6 )

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
				self.plusIcon:setAlpha( 0 )
				self.clipFinished( plusIcon, {} )

				Image0:completeAnimation()
				self.Image0:setRGB( 0, 1, 0 )
				self.clipFinished( Image0, {} )

				personalizePrompt:completeAnimation()
				self.personalizePrompt:setAlpha( 0 )
				self.clipFinished( personalizePrompt, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 6 )

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

				personalizePrompt:completeAnimation()
				self.personalizePrompt:setAlpha( 0 )
				self.clipFinished( personalizePrompt, {} )
			end
		},
		NotEquippable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

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
				self.plusIcon:setAlpha( 0 )
				self.clipFinished( plusIcon, {} )

				Image0:completeAnimation()
				self.Image0:setRGB( 0, 0, 1 )
				self.clipFinished( Image0, {} )

				personalizePrompt:completeAnimation()
				self.personalizePrompt:setAlpha( 0 )
				self.clipFinished( personalizePrompt, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 6 )

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
				self.plusIcon:setAlpha( 0 )
				self.clipFinished( plusIcon, {} )

				Image0:completeAnimation()
				self.Image0:setAlpha( 1 )
				self.clipFinished( Image0, {} )

				personalizePrompt:completeAnimation()
				self.personalizePrompt:setAlpha( 0 )
				self.clipFinished( personalizePrompt, {} )
			end
		},
		NotAvailable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setAlpha( 0.9 )
				self.clipFinished( BorderBakedMask0, {} )

				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 1 )
				self.clipFinished( BorderBakedSolid0, {} )

				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0.5 )
				self.clipFinished( itemImage, {} )

				plusIcon:completeAnimation()
				self.plusIcon:setAlpha( 0 )
				self.clipFinished( plusIcon, {} )

				Image0:completeAnimation()
				self.Image0:setRGB( 1, 1, 0 )
				self.clipFinished( Image0, {} )

				personalizePrompt:completeAnimation()
				self.personalizePrompt:setAlpha( 0 )
				self.clipFinished( personalizePrompt, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 6 )

				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setAlpha( 0.9 )
				self.clipFinished( BorderBakedMask0, {} )

				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 1 )
				self.clipFinished( BorderBakedSolid0, {} )

				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0.5 )
				self.clipFinished( itemImage, {} )

				plusIcon:completeAnimation()
				self.plusIcon:setAlpha( 0 )
				self.clipFinished( plusIcon, {} )

				Image0:completeAnimation()
				self.Image0:setRGB( 1, 1, 0 )
				self.clipFinished( Image0, {} )

				personalizePrompt:completeAnimation()
				self.personalizePrompt:setAlpha( 0 )
				self.clipFinished( personalizePrompt, {} )
			end
		},
		NotVisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setAlpha( 0 )
				self.clipFinished( BorderBakedMask0, {} )

				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 0 )
				self.clipFinished( BorderBakedSolid0, {} )

				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0 )
				self.clipFinished( itemImage, {} )

				plusIcon:completeAnimation()
				self.plusIcon:setAlpha( 0 )
				self.clipFinished( plusIcon, {} )

				Image0:completeAnimation()
				self.Image0:setRGB( 1, 0.5, 0 )
				self.clipFinished( Image0, {} )

				personalizePrompt:completeAnimation()
				self.personalizePrompt:setAlpha( 0 )
				self.clipFinished( personalizePrompt, {} )
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BorderBakedMask0:close()
		element.BorderBakedSolid0:close()
		element.BoxButtonLrgIdle:close()
		element.BoxButtonLrgInactiveDiag:close()
		element.BoxButtonLrgInactive:close()
		element.plusIcon:close()
		element.personalizePrompt:close()
		element.StartMenuframenoBG0:close()
		element.FocusBarT:close()
		element.FocusBarB:close()
		element.itemImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

