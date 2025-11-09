require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgIdle" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.CAC.cac_ListButtonLabel" )
require( "ui.uieditor.widgets.CAC.cac_ListButtonLabelCount" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

CoD.GunsmithWeaponListButton = InheritFrom( LUI.UIElement )
CoD.GunsmithWeaponListButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GunsmithWeaponListButton )
	self.id = "GunsmithWeaponListButton"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 339 )
	self:setTopBottom( true, false, 0, 65 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactiveDiag:setTopBottom( true, true, -2, 2 )
	BoxButtonLrgInactiveDiag:setRGB( 1, 1, 1 )
	BoxButtonLrgInactiveDiag:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
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
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local itemImageSolid = LUI.UIImage.new()
	itemImageSolid:setLeftRight( true, false, 0, 65 )
	itemImageSolid:setTopBottom( true, true, 0, 0 )
	itemImageSolid:setRGB( 0, 0, 0 )
	itemImageSolid:setAlpha( 0 )
	itemImageSolid:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	itemImageSolid:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemImageSolid:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( itemImageSolid )
	self.itemImageSolid = itemImageSolid
	
	local FocusBorder = CoD.FE_TitleNumBrdr.new( menu, controller )
	FocusBorder:setLeftRight( true, true, 0, 0 )
	FocusBorder:setTopBottom( true, true, -0.5, 0 )
	FocusBorder:setRGB( 1, 0.3, 0 )
	FocusBorder:setAlpha( 0 )
	self:addElement( FocusBorder )
	self.FocusBorder = FocusBorder
	
	local itemImage = LUI.UIImage.new()
	itemImage:setLeftRight( true, false, 0, 65 )
	itemImage:setTopBottom( true, true, 0, 0 )
	itemImage:setRGB( 1, 1, 1 )
	itemImage:setAlpha( 0.3 )
	itemImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	itemImage:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( itemImage )
	self.itemImage = itemImage
	
	local LabelButton = CoD.cac_ListButtonLabel.new( menu, controller )
	LabelButton:setLeftRight( true, false, 82, 168 )
	LabelButton:setTopBottom( false, false, -9.5, 10.5 )
	LabelButton:setRGB( 1, 1, 1 )
	LabelButton.itemName:setRGB( 0.82, 0.85, 0.88 )
	LabelButton:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LabelButton.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( LabelButton )
	self.LabelButton = LabelButton
	
	local LabelButtonCount = CoD.cac_ListButtonLabelCount.new( menu, controller )
	LabelButtonCount:setLeftRight( false, true, -36, -14 )
	LabelButtonCount:setTopBottom( false, false, -9, 11 )
	LabelButtonCount:setRGB( 1, 1, 1 )
	LabelButtonCount:linkToElementModel( self, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LabelButtonCount.ButtonLabelCount.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	LabelButtonCount:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:addElement( LabelButtonCount )
	self.LabelButtonCount = LabelButtonCount
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, -2, 2 )
	FocusBarT:setTopBottom( true, false, -4, 0 )
	FocusBarT:setRGB( 1, 1, 1 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, -2, 2 )
	FocusBarB:setTopBottom( false, true, 0, 4 )
	FocusBarB:setRGB( 1, 1, 1 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local glitch = LUI.UIImage.new()
	glitch:setLeftRight( true, true, -12, 7 )
	glitch:setTopBottom( true, false, -8.75, 4.75 )
	glitch:setRGB( 1, 0.09, 0 )
	glitch:setAlpha( 0 )
	glitch:setImage( RegisterImage( "uie_t7_effect_glitches_menu10" ) )
	glitch:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glitch )
	self.glitch = glitch
	
	local glitch2 = LUI.UIImage.new()
	glitch2:setLeftRight( true, true, -8.5, 8.5 )
	glitch2:setTopBottom( false, true, -6, 9 )
	glitch2:setRGB( 1, 0.15, 0 )
	glitch2:setAlpha( 0 )
	glitch2:setImage( RegisterImage( "uie_t7_effect_glitches_menu10" ) )
	glitch2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glitch2 )
	self.glitch2 = glitch2
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self:setupElementClipCounter( 4 )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				glitch:completeAnimation()
				self.glitch:setAlpha( 1 )
				self.clipFinished( glitch, {} )
				glitch2:completeAnimation()
				self.glitch2:setAlpha( 1 )
				self.clipFinished( glitch2, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		NotListFocus = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self.close = function ( self )
		self.BoxButtonLrgInactiveDiag:close()
		self.BoxButtonLrgInactive:close()
		self.BoxButtonLrgIdle:close()
		self.FocusBorder:close()
		self.LabelButton:close()
		self.LabelButtonCount:close()
		self.FocusBarT:close()
		self.FocusBarB:close()
		self.itemImageSolid:close()
		self.itemImage:close()
		CoD.GunsmithWeaponListButton.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

