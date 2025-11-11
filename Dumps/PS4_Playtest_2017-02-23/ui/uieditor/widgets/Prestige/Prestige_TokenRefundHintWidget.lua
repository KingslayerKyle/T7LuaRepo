require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.HintTextArrow" )

CoD.Prestige_TokenRefundHintWidget = InheritFrom( LUI.UIElement )
CoD.Prestige_TokenRefundHintWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Prestige_TokenRefundHintWidget )
	self.id = "Prestige_TokenRefundHintWidget"
	self.soundSet = "CAC"
	self:setLeftRight( 0, 0, 0, 282 )
	self:setTopBottom( 0, 0, 0, 48 )
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
	textCenterAlign:setText( Engine.Localize( "MENU_PRESTIGE_UNLOCK_TOKEN_REFUND" ) )
	textCenterAlign:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	textCenterAlign:setLetterSpacing( 0.5 )
	textCenterAlign:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	textCenterAlign:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( textCenterAlign, "setText", function ( element, text )
		ScaleWidgetToLabelCentered( self, element, 8 )
	end )
	self:addElement( textCenterAlign )
	self.textCenterAlign = textCenterAlign
	
	local hintArrow = CoD.HintTextArrow.new( menu, controller )
	hintArrow:mergeStateConditions( {
		{
			stateName = "NoHintText",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	hintArrow:setLeftRight( 0, 0, 148.5, 133.5 )
	hintArrow:setTopBottom( 0.5, 0.5, -46.5, -31.5 )
	self:addElement( hintArrow )
	self.hintArrow = hintArrow
	
	self.resetProperties = function ()
		hintArrow:completeAnimation()
		hintArrow:setLeftRight( 0, 0, 148.5, 133.5 )
		hintArrow:setTopBottom( 0.5, 0.5, -46.5, -31.5 )
		hintArrow:setZRot( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Below = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				hintArrow:completeAnimation()
				self.hintArrow:setLeftRight( 0.5, 0.5, 7.5, -7.5 )
				self.hintArrow:setTopBottom( 0, 0, -22.5, -7.5 )
				self.clipFinished( hintArrow, {} )
			end
		},
		Right = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				hintArrow:completeAnimation()
				self.hintArrow:setLeftRight( 0, 0, -7.5, -22.5 )
				self.hintArrow:setTopBottom( 0.5, 0.5, -7.5, 7.5 )
				self.hintArrow:setZRot( 90 )
				self.clipFinished( hintArrow, {} )
			end
		},
		Left = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				hintArrow:completeAnimation()
				self.hintArrow:setLeftRight( 1, 1, 22.5, 7.5 )
				self.hintArrow:setTopBottom( 0.5, 0.5, -7.5, 7.5 )
				self.hintArrow:setZRot( -90 )
				self.clipFinished( hintArrow, {} )
			end
		},
		Above = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				hintArrow:completeAnimation()
				self.hintArrow:setLeftRight( 0.5, 0.5, 7.5, -7.5 )
				self.hintArrow:setTopBottom( 1, 1, 7.5, 22.5 )
				self.hintArrow:setZRot( 180 )
				self.clipFinished( hintArrow, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.hintArrow:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

