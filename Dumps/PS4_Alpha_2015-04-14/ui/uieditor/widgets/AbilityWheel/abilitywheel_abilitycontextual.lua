require( "ui.uieditor.widgets.AbilityWheel.AbilityWheel_Pixel" )
require( "ui.uieditor.widgets.AbilityWheel.AbilityWheel_Icon" )

CoD.AbilityWheel_AbilityContextual = InheritFrom( LUI.UIElement )
CoD.AbilityWheel_AbilityContextual.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AbilityWheel_AbilityContextual )
	self.id = "AbilityWheel_AbilityContextual"
	self.soundSet = "AbilityWheel"
	self:setLeftRight( true, false, 0, 233 )
	self:setTopBottom( true, false, 0, 178 )
	self.anyChildUsesUpdateState = true
	
	local Frame = LUI.UIImage.new()
	Frame:setLeftRight( true, false, 96.5, 144.5 )
	Frame:setTopBottom( true, false, 109, 165 )
	Frame:setRGB( 1, 1, 1 )
	Frame:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_outtercontextframe" ) )
	Frame:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Frame )
	self.Frame = Frame
	
	local Pixel = CoD.AbilityWheel_Pixel.new( menu, controller )
	Pixel:setLeftRight( false, false, -4, 4 )
	Pixel:setTopBottom( false, false, -66, -58 )
	Pixel:setRGB( 1, 1, 1 )
	Pixel:setAlpha( 0.6 )
	self:addElement( Pixel )
	self.Pixel = Pixel
	
	local Description0 = LUI.UIText.new()
	Description0:setLeftRight( true, false, 18, 215 )
	Description0:setTopBottom( true, false, 58.42, 74.42 )
	Description0:setRGB( 1, 1, 1 )
	Description0:setAlpha( RandomAddPercent( 0.9, -30 ) )
	Description0:setTTF( "fonts/Entovo.ttf" )
	Description0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Description0:setShaderVector( 0, 0.1, 0.5, 0, 0 )
	Description0:setShaderVector( 1, 0, 0, 0, 0 )
	Description0:setShaderVector( 2, 0, 0, 0, 0 )
	Description0:setShaderVector( 3, 0, 0, 0, 0 )
	Description0:setShaderVector( 4, 0, 0, 0, 0 )
	Description0:setLetterSpacing( 1 )
	Description0:setLineSpacing( 1 )
	Description0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Description0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Description0:linkToElementModel( self, "description", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Description0:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Description0 )
	self.Description0 = Description0
	
	local Title0 = LUI.UIText.new()
	Title0:setLeftRight( true, false, 0, 233 )
	Title0:setTopBottom( true, false, 39.42, 55.42 )
	Title0:setRGB( 1, 1, 1 )
	Title0:setAlpha( RandomAddPercent( 0.9, -30 ) )
	Title0:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	Title0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Title0:setShaderVector( 0, 0.1, 0.5, 0, 0 )
	Title0:setShaderVector( 1, 0, 0, 0, 0 )
	Title0:setShaderVector( 2, 0, 0, 0, 0 )
	Title0:setShaderVector( 3, 0, 0, 0, 0 )
	Title0:setShaderVector( 4, 0, 0, 0, 0 )
	Title0:setLetterSpacing( 2.1 )
	Title0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Title0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Title0:linkToElementModel( self, "displayName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Title0:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Title0 )
	self.Title0 = Title0
	
	local Image = CoD.AbilityWheel_Icon.new( menu, controller )
	Image:setLeftRight( true, false, 100.58, 132.42 )
	Image:setTopBottom( true, false, 126, 157.84 )
	Image:setRGB( 1, 1, 1 )
	Image:setAlpha( RandomAddPercent( 0.89, -30 ) )
	Image:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Image.IconImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( Image )
	self.Image = Image
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				Frame:completeAnimation()
				self.Frame:setAlpha( 0 )
				self.clipFinished( Frame, {} )
				Pixel:completeAnimation()
				self.Pixel:setAlpha( 0 )
				self.clipFinished( Pixel, {} )
				Description0:completeAnimation()
				self.Description0:setAlpha( RandomAddPercent( 0.9, -30 ) )
				self.clipFinished( Description0, {} )
				Title0:completeAnimation()
				self.Title0:setAlpha( RandomAddPercent( 0.9, -30 ) )
				self.clipFinished( Title0, {} )
				Image:completeAnimation()
				self.Image:setAlpha( RandomAddPercent( 1, -30 ) )
				self.clipFinished( Image, {} )
			end
		},
		Inactive = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				Frame:completeAnimation()
				self.Frame:setAlpha( 0 )
				self.clipFinished( Frame, {} )
				Pixel:completeAnimation()
				self.Pixel:setAlpha( 0 )
				self.clipFinished( Pixel, {} )
				Description0:completeAnimation()
				self.Description0:setAlpha( RandomAddPercent( 0, -30 ) )
				self.clipFinished( Description0, {} )
				Title0:completeAnimation()
				self.Title0:setAlpha( RandomAddPercent( 0, -30 ) )
				self.clipFinished( Title0, {} )
				Image:completeAnimation()
				self.Image:setAlpha( RandomAddPercent( 0, -30 ) )
				self.clipFinished( Image, {} )
			end
		}
	}
	self.close = function ( self )
		self.Pixel:close()
		self.Image:close()
		self.Description0:close()
		self.Title0:close()
		CoD.AbilityWheel_AbilityContextual.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

