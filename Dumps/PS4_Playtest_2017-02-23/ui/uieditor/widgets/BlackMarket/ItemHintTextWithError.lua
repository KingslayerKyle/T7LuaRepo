require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.HintTextArrow" )

local PostLoadFunc = function ( self, controller, menu )
	LUI.OverrideFunction_CallOriginalFirst( self.errorText, "setText", function ( element, text )
		ScaleWidgetToLargerLabelCentered( self, element, self.textCenterAlign, 8 )
	end )
	LUI.OverrideFunction_CallOriginalFirst( self.textCenterAlign, "setText", function ( element, text )
		ScaleWidgetToLargerLabelCentered( self, element, self.errorText, 8 )
	end )
end

CoD.ItemHintTextWithError = InheritFrom( LUI.UIElement )
CoD.ItemHintTextWithError.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ItemHintTextWithError )
	self.id = "ItemHintTextWithError"
	self.soundSet = "CAC"
	self:setLeftRight( 0, 0, 0, 243 )
	self:setTopBottom( 0, 0, 0, 63 )
	self.anyChildUsesUpdateState = true
	
	local black = LUI.UIImage.new()
	black:setLeftRight( 0, 1, 3, -3 )
	black:setTopBottom( 0, 1, 3, -3 )
	black:setRGB( 0, 0, 0 )
	black:setAlpha( 0.65 )
	black:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( black )
	self.black = black
	
	local cachitBG0 = LUI.UIImage.new()
	cachitBG0:setLeftRight( 0, 1, 0, 0 )
	cachitBG0:setTopBottom( 0, 1, 0, 0 )
	cachitBG0:setAlpha( 0.32 )
	cachitBG0:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrfull" ) )
	cachitBG0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	cachitBG0:setShaderVector( 0, 0, 0, 0, 0 )
	cachitBG0:setupNineSliceShader( 6, 6 )
	self:addElement( cachitBG0 )
	self.cachitBG0 = cachitBG0
	
	local textCenterAlign = LUI.UIText.new()
	textCenterAlign:setLeftRight( 0, 1, 12.5, -5.5 )
	textCenterAlign:setTopBottom( 0.5, 0.5, -24, 0 )
	textCenterAlign:setText( Engine.Localize( "MPUI_REQUIRES_DANGER_CLOSE" ) )
	textCenterAlign:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	textCenterAlign:setLetterSpacing( 0.5 )
	textCenterAlign:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	textCenterAlign:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( textCenterAlign, "setText", function ( element, text )
		ScaleWidgetToLabelLeftJustify( self, element, 10 )
	end )
	self:addElement( textCenterAlign )
	self.textCenterAlign = textCenterAlign
	
	local errorText = LUI.UIText.new()
	errorText:setLeftRight( 0, 1, 12.5, -5.5 )
	errorText:setTopBottom( 0.5, 0.5, 2, 26 )
	errorText:setRGB( 0.93, 0.17, 0.17 )
	errorText:setText( Engine.Localize( "MPUI_REQUIRES_DANGER_CLOSE" ) )
	errorText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	errorText:setLetterSpacing( 0.5 )
	errorText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	errorText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( errorText )
	self.errorText = errorText
	
	local hintArrow0 = CoD.HintTextArrow.new( menu, controller )
	hintArrow0:setLeftRight( 0, 0, 115.5, 130.5 )
	hintArrow0:setTopBottom( 0, 0, -17.5, -2.5 )
	hintArrow0:linkToElementModel( self, nil, false, function ( model )
		hintArrow0:setModel( model, controller )
	end )
	self:addElement( hintArrow0 )
	self.hintArrow0 = hintArrow0
	
	self.resetProperties = function ()
		errorText:completeAnimation()
		textCenterAlign:completeAnimation()
		hintArrow0:completeAnimation()
		black:completeAnimation()
		cachitBG0:completeAnimation()
		errorText:setLeftRight( 0, 1, 12.5, -5.5 )
		errorText:setTopBottom( 0.5, 0.5, 2, 26 )
		errorText:setAlpha( 1 )
		textCenterAlign:setLeftRight( 0, 1, 12.5, -5.5 )
		textCenterAlign:setTopBottom( 0.5, 0.5, -24, 0 )
		textCenterAlign:setAlpha( 1 )
		hintArrow0:setLeftRight( 0, 0, 115.5, 130.5 )
		hintArrow0:setTopBottom( 0, 0, -17.5, -2.5 )
		black:setLeftRight( 0, 1, 3, -3 )
		black:setTopBottom( 0, 1, 3, -3 )
		black:setAlpha( 0.65 )
		cachitBG0:setLeftRight( 0, 1, 0, 0 )
		cachitBG0:setTopBottom( 0, 1, 0, 0 )
		cachitBG0:setAlpha( 0.32 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				textCenterAlign:completeAnimation()
				self.textCenterAlign:setLeftRight( 0, 1, 8.5, -11.5 )
				self.textCenterAlign:setTopBottom( 0.5, 0.5, -24, 0 )
				self.clipFinished( textCenterAlign, {} )
				errorText:completeAnimation()
				self.errorText:setLeftRight( 0, 1, 8.5, -11.5 )
				self.errorText:setTopBottom( 0.5, 0.5, 2, 26 )
				self.clipFinished( errorText, {} )
				hintArrow0:completeAnimation()
				self.hintArrow0:setLeftRight( 0, 0, 114.5, 129.5 )
				self.hintArrow0:setTopBottom( 0, 0, -19.5, -4.5 )
				self.clipFinished( hintArrow0, {} )
			end
		},
		NoHintText = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				black:completeAnimation()
				self.black:setAlpha( 0 )
				self.clipFinished( black, {} )
				cachitBG0:completeAnimation()
				self.cachitBG0:setAlpha( 0 )
				self.clipFinished( cachitBG0, {} )
				textCenterAlign:completeAnimation()
				self.textCenterAlign:setAlpha( 0 )
				self.clipFinished( textCenterAlign, {} )
				errorText:completeAnimation()
				self.errorText:setAlpha( 0 )
				self.clipFinished( errorText, {} )
			end
		},
		CenterAlign = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		LeftAlign = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				black:completeAnimation()
				self.black:setLeftRight( 0, 1, -54, -60 )
				self.black:setTopBottom( 0, 1, 3, -3 )
				self.clipFinished( black, {} )
				cachitBG0:completeAnimation()
				self.cachitBG0:setLeftRight( 0, 1, -57, -57 )
				self.cachitBG0:setTopBottom( 0, 1, 0, 0 )
				self.clipFinished( cachitBG0, {} )
				textCenterAlign:completeAnimation()
				self.textCenterAlign:setLeftRight( 0, 1, -48.5, -68.5 )
				self.textCenterAlign:setTopBottom( 0.5, 0.5, -24, 0 )
				self.clipFinished( textCenterAlign, {} )
				errorText:completeAnimation()
				self.errorText:setLeftRight( 0, 1, -48.5, -68.5 )
				self.errorText:setTopBottom( 0.5, 0.5, 2, 26 )
				self.clipFinished( errorText, {} )
				hintArrow0:completeAnimation()
				self.hintArrow0:setLeftRight( 0, 0, 58.5, 73.5 )
				self.hintArrow0:setTopBottom( 0, 0, -17.5, -2.5 )
				self.clipFinished( hintArrow0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "NoHintText",
			condition = function ( menu, element, event )
				return not HasHintText( element )
			end
		},
		{
			stateName = "CenterAlign",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "LeftAlign",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	self:linkToElementModel( self, nil, true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.hintArrow0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

