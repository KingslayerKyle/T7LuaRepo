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
	Frame:setLeftRight( false, false, -37, 32.61 )
	Frame:setTopBottom( false, false, -76.84, 3.16 )
	Frame:setRGB( 0.65, 0.67, 0.19 )
	Frame:setYRot( -180 )
	Frame:setScale( 0.9 )
	Frame:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_outtercontextframe" ) )
	Frame:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Frame )
	self.Frame = Frame
	
	local Pixel = CoD.AbilityWheel_Pixel.new( menu, controller )
	Pixel:setLeftRight( false, false, -4, 4 )
	Pixel:setTopBottom( false, false, 104, 112 )
	self:addElement( Pixel )
	self.Pixel = Pixel
	
	local AbilityWheelIcon0 = CoD.AbilityWheel_Icon.new( menu, controller )
	AbilityWheelIcon0:setLeftRight( false, false, -21.43, 27.43 )
	AbilityWheelIcon0:setTopBottom( false, false, -57.7, -8.84 )
	AbilityWheelIcon0:setRGB( 0.65, 0.67, 0.19 )
	AbilityWheelIcon0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	AbilityWheelIcon0:setShaderVector( 0, 0.01, -1, 0, 0 )
	AbilityWheelIcon0:setShaderVector( 1, 0, 0, 0, 0 )
	AbilityWheelIcon0:setShaderVector( 2, 0, 0, 0, 0 )
	AbilityWheelIcon0:setShaderVector( 3, 0, 0, 0, 0 )
	AbilityWheelIcon0:setShaderVector( 4, 0, 0, 0, 0 )
	AbilityWheelIcon0:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			AbilityWheelIcon0.IconImage:setImage( RegisterImage( image ) )
		end
	end )
	self:addElement( AbilityWheelIcon0 )
	self.AbilityWheelIcon0 = AbilityWheelIcon0
	
	local AbilityWheelDescriptionContextual0 = CoD.AbilityWheel_DescriptionContextual.new( menu, controller )
	AbilityWheelDescriptionContextual0:setLeftRight( false, false, -116.5, 116.5 )
	AbilityWheelDescriptionContextual0:setTopBottom( false, false, 30, 98 )
	AbilityWheelDescriptionContextual0:setAlpha( 0.9 )
	AbilityWheelDescriptionContextual0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	AbilityWheelDescriptionContextual0:setShaderVector( 0, 0.1, 0, 0, 0 )
	AbilityWheelDescriptionContextual0:setShaderVector( 1, 0, 0, 0, 0 )
	AbilityWheelDescriptionContextual0:setShaderVector( 2, 0, 0, 0, 0 )
	AbilityWheelDescriptionContextual0:setShaderVector( 3, 0, 0, 0, 0 )
	AbilityWheelDescriptionContextual0:setShaderVector( 4, 0, 0, 0, 0 )
	AbilityWheelDescriptionContextual0:linkToElementModel( self, "description", true, function ( model )
		local description = Engine.GetModelValue( model )
		if description then
			AbilityWheelDescriptionContextual0.TextDesc:setText( Engine.Localize( description ) )
		end
	end )
	self:addElement( AbilityWheelDescriptionContextual0 )
	self.AbilityWheelDescriptionContextual0 = AbilityWheelDescriptionContextual0
	
	local PanelGlow00 = LUI.UIImage.new()
	PanelGlow00:setLeftRight( true, false, 45.26, 195.74 )
	PanelGlow00:setTopBottom( true, false, -18.69, 134.16 )
	PanelGlow00:setRGB( 0.97, 0.74, 0.13 )
	PanelGlow00:setAlpha( 0 )
	PanelGlow00:setScale( 0.7 )
	PanelGlow00:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	PanelGlow00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( PanelGlow00 )
	self.PanelGlow00 = PanelGlow00
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( false, false, -116.5, 116.5 )
	Title:setTopBottom( false, false, 11, 29 )
	Title:setRGB( 0.65, 0.67, 0.19 )
	Title:setAlpha( RandomAddPercent( -30, 1 ) )
	Title:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	Title:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Title:setShaderVector( 0, 0.1, -1, 0, 0 )
	Title:setShaderVector( 1, 0.5, 0, 0, 0 )
	Title:setShaderVector( 2, 0, 0, 0, 0 )
	Title:setShaderVector( 3, 0, 0, 0, 0 )
	Title:setShaderVector( 4, 0, 0, 0, 0 )
	Title:setLetterSpacing( 1 )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Title:linkToElementModel( self, "displayName", true, function ( model )
		local displayName = Engine.GetModelValue( model )
		if displayName then
			Title:setText( Engine.Localize( displayName ) )
		end
	end )
	self:addElement( Title )
	self.Title = Title
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				Frame:completeAnimation()
				self.Frame:setLeftRight( false, false, -37, 32.61 )
				self.Frame:setTopBottom( false, false, -76.84, 3.16 )
				self.Frame:setAlpha( 1 )
				self.Frame:setScale( 0.9 )
				self.clipFinished( Frame, {} )
				Pixel:completeAnimation()
				self.Pixel:setAlpha( 0 )
				self.clipFinished( Pixel, {} )
				AbilityWheelIcon0:completeAnimation()
				self.AbilityWheelIcon0:setLeftRight( false, false, -21.43, 27.43 )
				self.AbilityWheelIcon0:setTopBottom( false, false, -57.7, -8.84 )
				self.AbilityWheelIcon0:setAlpha( 1 )
				self.AbilityWheelIcon0:setScale( 1 )
				self.clipFinished( AbilityWheelIcon0, {} )
				AbilityWheelDescriptionContextual0:completeAnimation()
				self.AbilityWheelDescriptionContextual0:setAlpha( 0.9 )
				self.clipFinished( AbilityWheelDescriptionContextual0, {} )
				PanelGlow00:completeAnimation()
				self.PanelGlow00:setAlpha( 0 )
				self.clipFinished( PanelGlow00, {} )
				Title:completeAnimation()
				self.Title:setAlpha( RandomAddPercent( -30, 1 ) )
				self.clipFinished( Title, {} )
			end
		},
		Inactive = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				Frame:completeAnimation()
				self.Frame:setAlpha( 0 )
				self.clipFinished( Frame, {} )
				Pixel:completeAnimation()
				self.Pixel:setAlpha( 0 )
				self.clipFinished( Pixel, {} )
				AbilityWheelIcon0:completeAnimation()
				self.AbilityWheelIcon0:setAlpha( 0 )
				self.clipFinished( AbilityWheelIcon0, {} )
				AbilityWheelDescriptionContextual0:completeAnimation()
				self.AbilityWheelDescriptionContextual0:setAlpha( 0 )
				self.clipFinished( AbilityWheelDescriptionContextual0, {} )
				PanelGlow00:completeAnimation()
				self.PanelGlow00:setAlpha( 0 )
				self.clipFinished( PanelGlow00, {} )
				Title:completeAnimation()
				self.Title:setAlpha( RandomAddPercent( -30, 0 ) )
				self.clipFinished( Title, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Pixel:close()
		element.AbilityWheelIcon0:close()
		element.AbilityWheelDescriptionContextual0:close()
		element.Title:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

