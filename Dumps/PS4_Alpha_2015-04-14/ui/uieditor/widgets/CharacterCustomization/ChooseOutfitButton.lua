require( "ui.uieditor.widgets.Border" )

CoD.ChooseOutfitButton = InheritFrom( LUI.UIElement )
CoD.ChooseOutfitButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.ChooseOutfitButton )
	self.id = "ChooseOutfitButton"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 120 )
	self:setTopBottom( true, false, 0, 120 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background:setRGB( 1, 1, 1 )
	background:setAlpha( 0.4 )
	background:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( background )
	self.background = background
	
	local extraCamRender = LUI.UIImage.new()
	extraCamRender:setLeftRight( true, true, 0, 0 )
	extraCamRender:setTopBottom( true, true, 0, 0 )
	extraCamRender:setRGB( 0.5, 0.5, 0.5 )
	extraCamRender:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	extraCamRender:linkToElementModel( self, "extraCamRender", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			extraCamRender:setupOutfitExtraCamRender( modelValue )
		end
	end )
	self:addElement( extraCamRender )
	self.extraCamRender = extraCamRender
	
	local lockImage = LUI.UIImage.new()
	lockImage:setLeftRight( false, false, -32, 32 )
	lockImage:setTopBottom( false, false, -32, 32 )
	lockImage:setRGB( 1, 1, 1 )
	lockImage:setImage( RegisterImage( "uie_t7_hud_cac_lock_64" ) )
	lockImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( lockImage )
	self.lockImage = lockImage
	
	local textBacking = LUI.UIImage.new()
	textBacking:setLeftRight( true, true, 0, 0 )
	textBacking:setTopBottom( false, true, -25, -5 )
	textBacking:setRGB( 0, 0, 0 )
	textBacking:setAlpha( 0.8 )
	textBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( textBacking )
	self.textBacking = textBacking
	
	local outfitName = LUI.UITightText.new()
	outfitName:setLeftRight( true, false, 5, 80 )
	outfitName:setTopBottom( false, true, -25, -5 )
	outfitName:setRGB( 1, 1, 1 )
	outfitName:setTTF( "fonts/escom.ttf" )
	outfitName:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			outfitName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( outfitName )
	self.outfitName = outfitName
	
	local border = CoD.Border.new( menu, controller )
	border:setLeftRight( true, true, 0, 0 )
	border:setTopBottom( true, true, 0, 0 )
	border:setRGB( 0.74, 0.74, 0.74 )
	self:addElement( border )
	self.border = border
	
	local selected = LUI.UIImage.new()
	selected:setLeftRight( false, true, -20, -4 )
	selected:setTopBottom( true, false, 4, 20 )
	selected:setRGB( ColorSet.SelectedGreen.r, ColorSet.SelectedGreen.g, ColorSet.SelectedGreen.b )
	selected:setAlpha( 0 )
	selected:setImage( RegisterImage( "uie_t7_hud_cac_equipped_16" ) )
	selected:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( selected )
	self.selected = selected
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				extraCamRender:completeAnimation()
				self.extraCamRender:setRGB( 1, 1, 1 )
				self.clipFinished( extraCamRender, {} )
				lockImage:completeAnimation()
				self.lockImage:setAlpha( 0 )
				self.clipFinished( lockImage, {} )
				border:completeAnimation()
				self.border:setRGB( 1, 1, 1 )
				self.clipFinished( border, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 1 )
				border:completeAnimation()
				self.border:setRGB( 1, 0.41, 0 )
				self.clipFinished( border, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				extraCamRender:completeAnimation()
				self.extraCamRender:setRGB( 0.5, 0.5, 0.5 )
				self.clipFinished( extraCamRender, {} )
				lockImage:completeAnimation()
				self.lockImage:setAlpha( 1 )
				self.clipFinished( lockImage, {} )
				border:completeAnimation()
				self.border:setRGB( 0.34, 0.34, 0.34 )
				self.clipFinished( border, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 1 )
				border:completeAnimation()
				self.border:setRGB( 0.74, 0.74, 0.74 )
				self.clipFinished( border, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsDisabled( element, controller )
			end
		}
	} )
	self:linkToElementModel( self, "disabled", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		} )
	end )
	self.close = function ( self )
		self.border:close()
		self.extraCamRender:close()
		self.outfitName:close()
		CoD.ChooseOutfitButton.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

