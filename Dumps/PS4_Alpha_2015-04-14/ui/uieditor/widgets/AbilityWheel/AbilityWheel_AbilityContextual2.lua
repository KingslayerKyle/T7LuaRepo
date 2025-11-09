require( "ui.uieditor.widgets.AbilityWheel.AbilityWheel_Pixel" )
require( "ui.uieditor.widgets.AbilityWheel.AbilityWheel_Icon" )
require( "ui.uieditor.widgets.AbilityWheel.AbilityWheel_DescriptionContextual" )

CoD.AbilityWheel_AbilityContextual2 = InheritFrom( LUI.UIElement )
CoD.AbilityWheel_AbilityContextual2.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AbilityWheel_AbilityContextual2 )
	self.id = "AbilityWheel_AbilityContextual2"
	self.soundSet = "AbilityWheel"
	self:setLeftRight( true, false, 0, 233 )
	self:setTopBottom( true, false, 0, 178 )
	self.anyChildUsesUpdateState = true
	
	local Frame = LUI.UIImage.new()
	Frame:setLeftRight( false, false, -28, 20 )
	Frame:setTopBottom( false, false, -50.84, 5.16 )
	Frame:setRGB( 1, 1, 1 )
	Frame:setAlpha( 0.92 )
	Frame:setYRot( -180 )
	Frame:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_outtercontextframe" ) )
	Frame:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Frame )
	self.Frame = Frame
	
	local Pixel = CoD.AbilityWheel_Pixel.new( menu, controller )
	Pixel:setLeftRight( false, false, -4, 4 )
	Pixel:setTopBottom( false, false, 104, 112 )
	Pixel:setRGB( 1, 1, 1 )
	self:addElement( Pixel )
	self.Pixel = Pixel
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( false, false, -116.5, 116.5 )
	Title:setTopBottom( false, false, 12, 28 )
	Title:setRGB( 0.78, 0.89, 0.93 )
	Title:setAlpha( RandomAddPercent( 1, -30 ) )
	Title:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	Title:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Title:setShaderVector( 0, 0.1, 0, 0, 0 )
	Title:setShaderVector( 1, 0, 0, 0, 0 )
	Title:setShaderVector( 2, 0, 0, 0, 0 )
	Title:setShaderVector( 3, 0, 0, 0, 0 )
	Title:setShaderVector( 4, 0, 0, 0, 0 )
	Title:setLetterSpacing( 1 )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Title:linkToElementModel( self, "displayName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Title:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Title )
	self.Title = Title
	
	local AbilityWheelIcon0 = CoD.AbilityWheel_Icon.new( menu, controller )
	AbilityWheelIcon0:setLeftRight( false, false, -21.5, 19 )
	AbilityWheelIcon0:setTopBottom( false, false, -38.34, 2.16 )
	AbilityWheelIcon0:setRGB( 0.52, 0.73, 0.78 )
	AbilityWheelIcon0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	AbilityWheelIcon0:setShaderVector( 0, 0.1, 0, 0, 0 )
	AbilityWheelIcon0:setShaderVector( 1, 0, 0, 0, 0 )
	AbilityWheelIcon0:setShaderVector( 2, 0, 0, 0, 0 )
	AbilityWheelIcon0:setShaderVector( 3, 0, 0, 0, 0 )
	AbilityWheelIcon0:setShaderVector( 4, 0, 0, 0, 0 )
	AbilityWheelIcon0:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			AbilityWheelIcon0.IconImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( AbilityWheelIcon0 )
	self.AbilityWheelIcon0 = AbilityWheelIcon0
	
	local AbilityWheelDescriptionContextual0 = CoD.AbilityWheel_DescriptionContextual.new( menu, controller )
	AbilityWheelDescriptionContextual0:setLeftRight( false, false, -116.5, 116.5 )
	AbilityWheelDescriptionContextual0:setTopBottom( false, false, 31, 99 )
	AbilityWheelDescriptionContextual0:setRGB( 1, 1, 1 )
	AbilityWheelDescriptionContextual0:setAlpha( 0.9 )
	AbilityWheelDescriptionContextual0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	AbilityWheelDescriptionContextual0:setShaderVector( 0, 0.1, 0, 0, 0 )
	AbilityWheelDescriptionContextual0:setShaderVector( 1, 0, 0, 0, 0 )
	AbilityWheelDescriptionContextual0:setShaderVector( 2, 0, 0, 0, 0 )
	AbilityWheelDescriptionContextual0:setShaderVector( 3, 0, 0, 0, 0 )
	AbilityWheelDescriptionContextual0:setShaderVector( 4, 0, 0, 0, 0 )
	AbilityWheelDescriptionContextual0:linkToElementModel( self, "description", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			AbilityWheelDescriptionContextual0.TextDesc:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( AbilityWheelDescriptionContextual0 )
	self.AbilityWheelDescriptionContextual0 = AbilityWheelDescriptionContextual0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				Frame:completeAnimation()
				self.Frame:setAlpha( 0.61 )
				self.clipFinished( Frame, {} )
				Pixel:completeAnimation()
				self.Pixel:setAlpha( 0 )
				self.clipFinished( Pixel, {} )
				Title:completeAnimation()
				self.Title:setAlpha( RandomAddPercent( 1, -30 ) )
				self.clipFinished( Title, {} )
				AbilityWheelIcon0:completeAnimation()
				self.AbilityWheelIcon0:setAlpha( 1 )
				self.clipFinished( AbilityWheelIcon0, {} )
				AbilityWheelDescriptionContextual0:completeAnimation()
				self.AbilityWheelDescriptionContextual0:setAlpha( 0.9 )
				self.clipFinished( AbilityWheelDescriptionContextual0, {} )
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
				Title:completeAnimation()
				self.Title:setAlpha( RandomAddPercent( 0, -30 ) )
				self.clipFinished( Title, {} )
				AbilityWheelIcon0:completeAnimation()
				self.AbilityWheelIcon0:setAlpha( 0 )
				self.clipFinished( AbilityWheelIcon0, {} )
				AbilityWheelDescriptionContextual0:completeAnimation()
				self.AbilityWheelDescriptionContextual0:setAlpha( 0 )
				self.clipFinished( AbilityWheelDescriptionContextual0, {} )
			end
		}
	}
	self.close = function ( self )
		self.Pixel:close()
		self.AbilityWheelIcon0:close()
		self.AbilityWheelDescriptionContextual0:close()
		self.Title:close()
		CoD.AbilityWheel_AbilityContextual2.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

