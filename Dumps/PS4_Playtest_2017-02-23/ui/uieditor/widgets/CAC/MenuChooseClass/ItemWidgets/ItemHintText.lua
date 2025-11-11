require( "ui.uieditor.widgets.CAC.NewBreadcrumb" )

local PostLoadFunc = function ( self, controller, menu )
	self:linkToElementModel( self, "hintText", true, function ( model )
		self:processEvent( {
			name = "update_state",
			controller = controller,
			menu = menu
		} )
		self:completeAnimation()
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			self.textCenterAlign:setText( modelValue )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( self.textCenterAlign, "setText", function ( element, text )
		local textWidth = element:getTextWidth()
		local extraTextWidth = 8
		if self.currentState == "RightHasNew" then
			self:setLeftRight( false, true, -(textWidth + 14) - extraTextWidth, extraTextWidth )
		elseif self.currentState == "CenterHasNew" then
			textWidth = textWidth + 14
			self:setLeftRight( false, false, -textWidth / 2 - extraTextWidth, textWidth / 2 + extraTextWidth )
		elseif self.currentState == "LeftAlign" then
			self:setLeftRight( true, false, -extraTextWidth, textWidth + extraTextWidth )
		elseif self.currentState == "RightAlign" then
			self:setLeftRight( false, true, -textWidth - extraTextWidth, extraTextWidth )
		elseif self.currentState == "CenterAlign" then
			self:setLeftRight( false, false, -textWidth / 2 - extraTextWidth, textWidth / 2 + extraTextWidth )
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
	self:setLeftRight( 0, 0, 0, 282 )
	self:setTopBottom( 0, 0, 0, 75 )
	self.anyChildUsesUpdateState = true
	
	local black = LUI.UIImage.new()
	black:setLeftRight( 0, 1, 3, -3 )
	black:setTopBottom( 0, 1, 3, -3 )
	black:setRGB( 0, 0, 0 )
	black:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( black )
	self.black = black
	
	local cachitBG0 = LUI.UIImage.new()
	cachitBG0:setLeftRight( 0, 1, 0, 0 )
	cachitBG0:setTopBottom( 0, 1, 0, 0 )
	cachitBG0:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrfull" ) )
	cachitBG0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	cachitBG0:setShaderVector( 0, 0, 0, 0, 0 )
	cachitBG0:setupNineSliceShader( 6, 6 )
	self:addElement( cachitBG0 )
	self.cachitBG0 = cachitBG0
	
	local textCenterAlign = LUI.UIText.new()
	textCenterAlign:setLeftRight( 0, 1, 6, -6 )
	textCenterAlign:setTopBottom( 0.5, 0.5, -12, 12 )
	textCenterAlign:setText( Engine.Localize( "MPUI_REQUIRES_DANGER_CLOSE" ) )
	textCenterAlign:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	textCenterAlign:setLetterSpacing( 0.5 )
	textCenterAlign:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	textCenterAlign:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( textCenterAlign )
	self.textCenterAlign = textCenterAlign
	
	local newIcon = CoD.NewBreadcrumb.new( menu, controller )
	newIcon:setLeftRight( 1, 1, -24, -6 )
	newIcon:setTopBottom( 0.5, 0.5, -8, 10 )
	newIcon:setAlpha( 0 )
	self:addElement( newIcon )
	self.newIcon = newIcon
	
	self.resetProperties = function ()
		textCenterAlign:completeAnimation()
		black:completeAnimation()
		cachitBG0:completeAnimation()
		newIcon:completeAnimation()
		textCenterAlign:setLeftRight( 0, 1, 6, -6 )
		textCenterAlign:setTopBottom( 0.5, 0.5, -12, 12 )
		textCenterAlign:setAlpha( 1 )
		textCenterAlign:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
		black:setAlpha( 1 )
		cachitBG0:setAlpha( 1 )
		newIcon:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		NoHintText = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				black:completeAnimation()
				self.black:setAlpha( 0 )
				self.clipFinished( black, {} )
				cachitBG0:completeAnimation()
				self.cachitBG0:setAlpha( 0 )
				self.clipFinished( cachitBG0, {} )
				textCenterAlign:completeAnimation()
				self.textCenterAlign:setAlpha( 0 )
				self.clipFinished( textCenterAlign, {} )
			end
		},
		RightHasNew = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				textCenterAlign:completeAnimation()
				self.textCenterAlign:setLeftRight( 0, 1, 0, -30 )
				self.textCenterAlign:setTopBottom( 0.5, 0.5, -12, 12 )
				self.textCenterAlign:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
				self.clipFinished( textCenterAlign, {} )
				newIcon:completeAnimation()
				self.newIcon:setAlpha( 1 )
				self.clipFinished( newIcon, {} )
			end
		},
		CenterHasNew = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				textCenterAlign:completeAnimation()
				self.textCenterAlign:setLeftRight( 0, 1, 6, -24 )
				self.textCenterAlign:setTopBottom( 0.5, 0.5, -12, 12 )
				self.clipFinished( textCenterAlign, {} )
				newIcon:completeAnimation()
				self.newIcon:setAlpha( 1 )
				self.clipFinished( newIcon, {} )
			end
		},
		LeftAlign = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				textCenterAlign:completeAnimation()
				self.textCenterAlign:setLeftRight( 0, 1, 12, 0 )
				self.textCenterAlign:setTopBottom( 0.5, 0.5, -12, 12 )
				self.textCenterAlign:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
				self.clipFinished( textCenterAlign, {} )
			end
		},
		RightAlign = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				textCenterAlign:completeAnimation()
				self.textCenterAlign:setLeftRight( 0, 1, 0, -12 )
				self.textCenterAlign:setTopBottom( 0.5, 0.5, -12, 12 )
				self.textCenterAlign:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
				self.clipFinished( textCenterAlign, {} )
			end
		},
		CenterAlign = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
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
			stateName = "RightHasNew",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "CenterHasNew",
			condition = function ( menu, element, event )
				return AlwaysFalse()
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
	self:linkToElementModel( self, nil, true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.newIcon:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

