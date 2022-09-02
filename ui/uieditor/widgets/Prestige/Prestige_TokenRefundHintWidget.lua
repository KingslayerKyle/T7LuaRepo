-- ba1e0befbadea650b0aadfff0d704659
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 188 )
	self:setTopBottom( true, false, 0, 32 )
	self.anyChildUsesUpdateState = true
	
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
	cachitBG0:setShaderVector( 0, 0.02, 0.12, 0, 0 )
	cachitBG0:setupNineSliceShader( 4, 4 )
	self:addElement( cachitBG0 )
	self.cachitBG0 = cachitBG0
	
	local textCenterAlign = LUI.UIText.new()
	textCenterAlign:setLeftRight( true, true, 4, -4 )
	textCenterAlign:setTopBottom( false, false, -8, 8 )
	textCenterAlign:setText( Engine.Localize( "MENU_PRESTIGE_UNLOCK_TOKEN_REFUND" ) )
	textCenterAlign:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	textCenterAlign:setLetterSpacing( 0.5 )
	textCenterAlign:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	textCenterAlign:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )

	LUI.OverrideFunction_CallOriginalFirst( textCenterAlign, "setText", function ( element, controller )
		ScaleWidgetToLabelCentered( self, element, 8 )
	end )
	self:addElement( textCenterAlign )
	self.textCenterAlign = textCenterAlign
	
	local hintArrow = CoD.HintTextArrow.new( menu, controller )
	hintArrow:setLeftRight( true, false, 99, 89 )
	hintArrow:setTopBottom( false, false, -31, -21 )
	hintArrow:mergeStateConditions( {
		{
			stateName = "NoHintText",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:addElement( hintArrow )
	self.hintArrow = hintArrow
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		Below = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				hintArrow:completeAnimation()
				self.hintArrow:setLeftRight( false, false, 5, -5 )
				self.hintArrow:setTopBottom( true, false, -15, -5 )
				self.hintArrow:setZRot( 0 )
				self.clipFinished( hintArrow, {} )
			end
		},
		Right = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				hintArrow:completeAnimation()
				self.hintArrow:setLeftRight( true, false, -5, -15 )
				self.hintArrow:setTopBottom( false, false, -5, 5 )
				self.hintArrow:setZRot( 90 )
				self.clipFinished( hintArrow, {} )
			end
		},
		Left = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				hintArrow:completeAnimation()
				self.hintArrow:setLeftRight( false, true, 15, 5 )
				self.hintArrow:setTopBottom( false, false, -5, 5 )
				self.hintArrow:setZRot( -90 )
				self.clipFinished( hintArrow, {} )
			end
		},
		Above = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				hintArrow:completeAnimation()
				self.hintArrow:setLeftRight( false, false, 5, -5 )
				self.hintArrow:setTopBottom( false, true, 5, 15 )
				self.hintArrow:setZRot( 180 )
				self.clipFinished( hintArrow, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.hintArrow:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

