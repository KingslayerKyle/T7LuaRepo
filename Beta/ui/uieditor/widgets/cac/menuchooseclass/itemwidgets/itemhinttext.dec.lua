local PostLoadFunc = function ( self, controller, menu )
	self:linkToElementModel( "hintText", true, function ( model )
		self:processEvent( {
			name = "update_state",
			controller = controller,
			menu = menu
		} )
		self:completeAnimation()
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			local extraTextWidth = 8
			if self.currentState == "LeftAlign" then
				self.textLeftAlign:setText( modelValue )
				local textWidth = self.textLeftAlign:getTextWidth()
				self:setLeftRight( true, false, -extraTextWidth, textWidth + extraTextWidth )
			elseif self.currentState == "RightAlign" then
				self.textRightAlign:setText( modelValue )
				local textWidth = self.textRightAlign:getTextWidth()
				self:setLeftRight( false, true, -textWidth - extraTextWidth, extraTextWidth )
			elseif self.currentState == "CenterAlign" then
				self.textCenterAlign:setText( modelValue )
				local textWidth = self.textCenterAlign:getTextWidth()
				self:setLeftRight( false, false, -textWidth / 2 - extraTextWidth, textWidth / 2 + extraTextWidth )
			end
		end
	end )
end

CoD.ItemHintText = InheritFrom( LUI.UIElement )
CoD.ItemHintText.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ItemHintText )
	self.id = "ItemHintText"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 188 )
	self:setTopBottom( true, false, 0, 50 )
	
	local black = LUI.UIImage.new()
	black:setLeftRight( true, true, 2, -2 )
	black:setTopBottom( true, true, 2, -2 )
	black:setRGB( 0, 0, 0 )
	black:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( black )
	self.black = black
	
	local cachitBG0 = LUI.UIImage.new()
	cachitBG0:setLeftRight( true, true, 0, 0 )
	cachitBG0:setTopBottom( true, true, 0, 0 )
	cachitBG0:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrfull" ) )
	cachitBG0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	cachitBG0:setShaderVector( 0, 0.02, 0.08, 0, 0 )
	cachitBG0:setupNineSliceShader( 4, 4 )
	self:addElement( cachitBG0 )
	self.cachitBG0 = cachitBG0
	
	local textLeftAlign = LUI.UIText.new()
	textLeftAlign:setLeftRight( true, true, 8, 0 )
	textLeftAlign:setTopBottom( false, false, -8, 8 )
	textLeftAlign:setText( Engine.Localize( "MPUI_REQUIRES_DANGER_CLOSE" ) )
	textLeftAlign:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	textLeftAlign:setLetterSpacing( 0.5 )
	textLeftAlign:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	textLeftAlign:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( textLeftAlign )
	self.textLeftAlign = textLeftAlign
	
	local textCenterAlign = LUI.UIText.new()
	textCenterAlign:setLeftRight( true, true, 4, -4 )
	textCenterAlign:setTopBottom( false, false, -8, 8 )
	textCenterAlign:setAlpha( 0 )
	textCenterAlign:setText( Engine.Localize( "MPUI_REQUIRES_DANGER_CLOSE" ) )
	textCenterAlign:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	textCenterAlign:setLetterSpacing( 0.5 )
	textCenterAlign:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	textCenterAlign:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( textCenterAlign )
	self.textCenterAlign = textCenterAlign
	
	local textRightAlign = LUI.UIText.new()
	textRightAlign:setLeftRight( true, true, 0, -8 )
	textRightAlign:setTopBottom( false, false, -8, 8 )
	textRightAlign:setAlpha( 0 )
	textRightAlign:setText( Engine.Localize( "MPUI_REQUIRES_DANGER_CLOSE" ) )
	textRightAlign:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	textRightAlign:setLetterSpacing( 0.5 )
	textRightAlign:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	textRightAlign:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( textRightAlign )
	self.textRightAlign = textRightAlign
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		NoHintText = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				black:completeAnimation()
				self.black:setAlpha( 0 )
				self.clipFinished( black, {} )
				cachitBG0:completeAnimation()
				self.cachitBG0:setAlpha( 0 )
				self.clipFinished( cachitBG0, {} )
				textLeftAlign:completeAnimation()
				self.textLeftAlign:setAlpha( 0 )
				self.clipFinished( textLeftAlign, {} )
				textCenterAlign:completeAnimation()
				self.textCenterAlign:setAlpha( 0 )
				self.clipFinished( textCenterAlign, {} )
				textRightAlign:completeAnimation()
				self.textRightAlign:setAlpha( 0 )
				self.clipFinished( textRightAlign, {} )
			end
		},
		LeftAlign = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				black:completeAnimation()
				self.black:setAlpha( 1 )
				self.clipFinished( black, {} )
				cachitBG0:completeAnimation()
				self.cachitBG0:setLeftRight( true, true, 0, 0 )
				self.cachitBG0:setTopBottom( true, true, 0, 0 )
				self.cachitBG0:setAlpha( 1 )
				self.clipFinished( cachitBG0, {} )
				textLeftAlign:completeAnimation()
				self.textLeftAlign:setAlpha( 1 )
				self.clipFinished( textLeftAlign, {} )
				textCenterAlign:completeAnimation()
				self.textCenterAlign:setAlpha( 0 )
				self.clipFinished( textCenterAlign, {} )
				textRightAlign:completeAnimation()
				self.textRightAlign:setAlpha( 0 )
				self.clipFinished( textRightAlign, {} )
			end
		},
		RightAlign = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				black:completeAnimation()
				self.black:setAlpha( 1 )
				self.clipFinished( black, {} )
				cachitBG0:completeAnimation()
				self.cachitBG0:setLeftRight( true, true, 0, 0 )
				self.cachitBG0:setTopBottom( true, true, 0, 0 )
				self.cachitBG0:setAlpha( 1 )
				self.clipFinished( cachitBG0, {} )
				textLeftAlign:completeAnimation()
				self.textLeftAlign:setAlpha( 0 )
				self.clipFinished( textLeftAlign, {} )
				textCenterAlign:completeAnimation()
				self.textCenterAlign:setAlpha( 0 )
				self.clipFinished( textCenterAlign, {} )
				textRightAlign:completeAnimation()
				self.textRightAlign:setAlpha( 1 )
				self.clipFinished( textRightAlign, {} )
			end
		},
		CenterAlign = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				cachitBG0:completeAnimation()
				self.cachitBG0:setLeftRight( true, true, 0, 0 )
				self.cachitBG0:setTopBottom( true, true, 0, 0 )
				self.clipFinished( cachitBG0, {} )
				textLeftAlign:completeAnimation()
				self.textLeftAlign:setAlpha( 0 )
				self.clipFinished( textLeftAlign, {} )
				textCenterAlign:completeAnimation()
				self.textCenterAlign:setAlpha( 1 )
				self.clipFinished( textCenterAlign, {} )
				textRightAlign:completeAnimation()
				self.textRightAlign:setAlpha( 0 )
				self.clipFinished( textRightAlign, {} )
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
			stateName = "LeftAlign",
			condition = function ( menu, element, event )
				return IsHintTextLeftAlign( element, controller )
			end
		},
		{
			stateName = "RightAlign",
			condition = function ( menu, element, event )
				return IsHintTextRightAlign( element, controller )
			end
		},
		{
			stateName = "CenterAlign",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	self:linkToElementModel( nil, true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		} )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

