require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.HintTextArrow" )

local PostLoadFunc = function ( self, controller, menu )
	LUI.OverrideFunction_CallOriginalFirst( self.errorText, "setText", function ( element, controller )
		ScaleWidgetToLargerLabelCentered( self, element, self.textCenterAlign, 8 )
	end )
	LUI.OverrideFunction_CallOriginalFirst( self.textCenterAlign, "setText", function ( element, controller )
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
	self:setLeftRight( true, false, 0, 162 )
	self:setTopBottom( true, false, 0, 42 )
	self.anyChildUsesUpdateState = true
	
	local black = LUI.UIImage.new()
	black:setLeftRight( true, true, 2, -2 )
	black:setTopBottom( true, true, 2, -2 )
	black:setRGB( 0, 0, 0 )
	black:setAlpha( 0.65 )
	black:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( black )
	self.black = black
	
	local cachitBG0 = LUI.UIImage.new()
	cachitBG0:setLeftRight( true, true, 0, 0 )
	cachitBG0:setTopBottom( true, true, 0, 0 )
	cachitBG0:setAlpha( 0.32 )
	cachitBG0:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrfull" ) )
	cachitBG0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	cachitBG0:setShaderVector( 0, 0.02, 0.1, 0, 0 )
	cachitBG0:setupNineSliceShader( 4, 4 )
	self:addElement( cachitBG0 )
	self.cachitBG0 = cachitBG0
	
	local textCenterAlign = LUI.UITightText.new()
	textCenterAlign:setLeftRight( true, true, 19.5, -17.5 )
	textCenterAlign:setTopBottom( false, false, -16, 0 )
	textCenterAlign:setText( Engine.Localize( "MPUI_REQUIRES_DANGER_CLOSE" ) )
	textCenterAlign:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	textCenterAlign:setLetterSpacing( 0.5 )
	LUI.OverrideFunction_CallOriginalFirst( textCenterAlign, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 10 )
	end )
	self:addElement( textCenterAlign )
	self.textCenterAlign = textCenterAlign
	
	local errorText = LUI.UIText.new()
	errorText:setLeftRight( true, true, 8, -4 )
	errorText:setTopBottom( false, false, 1, 17 )
	errorText:setRGB( 0.93, 0.17, 0.17 )
	errorText:setText( Engine.Localize( "MPUI_REQUIRES_DANGER_CLOSE" ) )
	errorText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	errorText:setLetterSpacing( 0.5 )
	errorText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	errorText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( errorText )
	self.errorText = errorText
	
	local hintArrow0 = CoD.HintTextArrow.new( menu, controller )
	hintArrow0:setLeftRight( true, false, 77, 87 )
	hintArrow0:setTopBottom( true, false, -12, -2 )
	hintArrow0:linkToElementModel( self, nil, false, function ( model )
		hintArrow0:setModel( model, controller )
	end )
	self:addElement( hintArrow0 )
	self.hintArrow0 = hintArrow0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				black:completeAnimation()
				self.black:setLeftRight( true, true, 2, -2 )
				self.black:setTopBottom( true, true, 2, -2 )
				self.clipFinished( black, {} )
				cachitBG0:completeAnimation()
				self.cachitBG0:setLeftRight( true, true, 0, 0 )
				self.cachitBG0:setTopBottom( true, true, 0, 0 )
				self.clipFinished( cachitBG0, {} )
				textCenterAlign:completeAnimation()
				self.textCenterAlign:setLeftRight( true, true, 6, -8 )
				self.textCenterAlign:setTopBottom( false, false, -16, 0 )
				self.clipFinished( textCenterAlign, {} )
				errorText:completeAnimation()
				self.errorText:setLeftRight( true, true, 6, -8 )
				self.errorText:setTopBottom( false, false, 1, 17 )
				self.errorText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
				self.clipFinished( errorText, {} )
				hintArrow0:completeAnimation()
				self.hintArrow0:setLeftRight( true, false, 76, 86 )
				self.hintArrow0:setTopBottom( true, false, -13, -3 )
				self.clipFinished( hintArrow0, {} )
			end
		},
		NoHintText = {
			DefaultClip = function ()
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
				self:setupElementClipCounter( 2 )
				textCenterAlign:completeAnimation()
				self.textCenterAlign:setAlpha( 1 )
				self.clipFinished( textCenterAlign, {} )
				errorText:completeAnimation()
				self.errorText:setAlpha( 1 )
				self.clipFinished( errorText, {} )
			end
		},
		LeftAlign = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				black:completeAnimation()
				self.black:setLeftRight( true, true, -36, -40 )
				self.black:setTopBottom( true, true, 2, -2 )
				self.clipFinished( black, {} )
				cachitBG0:completeAnimation()
				self.cachitBG0:setLeftRight( true, true, -38, -38 )
				self.cachitBG0:setTopBottom( true, true, 0, 0 )
				self.clipFinished( cachitBG0, {} )
				textCenterAlign:completeAnimation()
				self.textCenterAlign:setLeftRight( true, true, -32, -46 )
				self.textCenterAlign:setTopBottom( false, false, -16, 0 )
				self.clipFinished( textCenterAlign, {} )
				errorText:completeAnimation()
				self.errorText:setLeftRight( true, true, -32, -46 )
				self.errorText:setTopBottom( false, false, 1, 17 )
				self.errorText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
				self.clipFinished( errorText, {} )
				hintArrow0:completeAnimation()
				self.hintArrow0:setLeftRight( true, false, 39, 49 )
				self.hintArrow0:setTopBottom( true, false, -12, -2 )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.hintArrow0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

