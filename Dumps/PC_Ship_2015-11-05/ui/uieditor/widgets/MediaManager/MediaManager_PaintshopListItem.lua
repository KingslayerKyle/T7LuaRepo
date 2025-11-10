require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgIdle" )
require( "ui.uieditor.widgets.CAC.cac_ListButtonLabel" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )

CoD.MediaManager_PaintshopListItem = InheritFrom( LUI.UIElement )
CoD.MediaManager_PaintshopListItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MediaManager_PaintshopListItem )
	self.id = "MediaManager_PaintshopListItem"
	self.soundSet = "Paintshop"
	self:setLeftRight( true, false, 0, 280 )
	self:setTopBottom( true, false, 0, 65 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactiveDiag:setTopBottom( true, true, -2, 2 )
	BoxButtonLrgInactiveDiag:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactive:setTopBottom( true, true, -2, 2 )
	BoxButtonLrgInactive:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local BoxButtonLrgIdle = CoD.cac_ButtonBoxLrgIdle.new( menu, controller )
	BoxButtonLrgIdle:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgIdle:setTopBottom( true, true, -2, 2 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local BuyMoreImage = LUI.UIImage.new()
	BuyMoreImage:setLeftRight( true, false, 24.5, 45.5 )
	BuyMoreImage:setTopBottom( true, false, 23, 44 )
	BuyMoreImage:setAlpha( 0 )
	BuyMoreImage:setImage( RegisterImage( "uie_uie_custom_element_example_image" ) )
	self:addElement( BuyMoreImage )
	self.BuyMoreImage = BuyMoreImage
	
	local extraCamRender = LUI.UIImage.new()
	extraCamRender:setLeftRight( true, true, 0, -212 )
	extraCamRender:setTopBottom( true, true, 0, 0 )
	extraCamRender:linkToElementModel( self, "paintjobSlotAndIndex", true, function ( model )
		local paintjobSlotAndIndex = Engine.GetModelValue( model )
		if paintjobSlotAndIndex then
			extraCamRender:setupWCPaintjobIconExtraCamRender( GetPaintshopExtraCamParameters( controller, paintjobSlotAndIndex ) )
		end
	end )
	self:addElement( extraCamRender )
	self.extraCamRender = extraCamRender
	
	local LabelButton = CoD.cac_ListButtonLabel.new( menu, controller )
	LabelButton:setLeftRight( true, false, 85, 265 )
	LabelButton:setTopBottom( false, false, -10.25, 9.75 )
	LabelButton:linkToElementModel( self, "paintjobName", true, function ( model )
		local paintjobName = Engine.GetModelValue( model )
		if paintjobName then
			LabelButton.itemName:setText( Engine.Localize( GetPaintjobName( paintjobName ) ) )
		end
	end )
	self:addElement( LabelButton )
	self.LabelButton = LabelButton
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, -2, 2 )
	FocusBarT:setTopBottom( true, false, -4, 0 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, -2, 2 )
	FocusBarB:setTopBottom( false, true, 0, 4 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local FocusBorder = CoD.FE_TitleNumBrdr.new( menu, controller )
	FocusBorder:setLeftRight( true, true, 0, 0 )
	FocusBorder:setTopBottom( true, true, -0.5, 0 )
	FocusBorder:setRGB( 1, 0.3, 0 )
	FocusBorder:setAlpha( 0 )
	self:addElement( FocusBorder )
	self.FocusBorder = FocusBorder
	
	local glitch = LUI.UIImage.new()
	glitch:setLeftRight( true, true, -5, 4 )
	glitch:setTopBottom( true, false, -9.75, 3.75 )
	glitch:setRGB( 1, 0.09, 0 )
	glitch:setAlpha( 0 )
	glitch:setImage( RegisterImage( "uie_t7_effect_glitches_menu10" ) )
	glitch:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glitch )
	self.glitch = glitch
	
	local glitch2 = LUI.UIImage.new()
	glitch2:setLeftRight( true, true, -5, 4 )
	glitch2:setTopBottom( false, true, -5, 10 )
	glitch2:setRGB( 1, 0.15, 0 )
	glitch2:setAlpha( 0 )
	glitch2:setImage( RegisterImage( "uie_t7_effect_glitches_menu10" ) )
	glitch2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glitch2 )
	self.glitch2 = glitch2
	
	local itemImageLine = LUI.UIImage.new()
	itemImageLine:setLeftRight( true, false, 68, 72 )
	itemImageLine:setTopBottom( false, false, -32.5, 32.5 )
	itemImageLine:setAlpha( 0.3 )
	itemImageLine:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	itemImageLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( itemImageLine )
	self.itemImageLine = itemImageLine
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 22, 46 )
	Image0:setTopBottom( true, false, 20, 44 )
	Image0:setAlpha( 0 )
	Image0:setImage( RegisterImage( "uie_headicon_dead" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local PlusImage = LUI.UIImage.new()
	PlusImage:setLeftRight( true, false, 2, 66 )
	PlusImage:setTopBottom( true, false, 1, 65 )
	PlusImage:setImage( RegisterImage( "uie_t7_menu_cacselection_plus" ) )
	self:addElement( PlusImage )
	self.PlusImage = PlusImage
	
	self.PlusImage:linkToElementModel( self, "showBuyImage", true, function ( model )
		local showBuyImage = Engine.GetModelValue( model )
		if showBuyImage then
			PlusImage:setAlpha( showBuyImage )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 2 )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, true, -2, 2 )
				self.FocusBarT:setTopBottom( true, false, 0, 4 )
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, true, -2, 2 )
				self.FocusBarB:setTopBottom( false, true, -3, 1 )
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 2 )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, true, -2, 2 )
				self.FocusBarT:setTopBottom( true, false, 0, 4 )
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, true, -2, 2 )
				self.FocusBarB:setTopBottom( false, true, -4, 0 )
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 2 )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BoxButtonLrgInactiveDiag:close()
		element.BoxButtonLrgInactive:close()
		element.BoxButtonLrgIdle:close()
		element.LabelButton:close()
		element.FocusBarT:close()
		element.FocusBarB:close()
		element.FocusBorder:close()
		element.extraCamRender:close()
		element.PlusImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

