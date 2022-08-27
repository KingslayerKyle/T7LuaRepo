-- ebc2740fa8e5346234a40e7a32f9fbd2
-- This hash is used for caching, delete to decompile the file again

CoD.CryptokeyItemHintTextInternal_Left = InheritFrom( LUI.UIElement )
CoD.CryptokeyItemHintTextInternal_Left.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CryptokeyItemHintTextInternal_Left )
	self.id = "CryptokeyItemHintTextInternal_Left"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 432 )
	self:setTopBottom( true, false, 0, 26 )
	
	local cachitBG0 = LUI.UIImage.new()
	cachitBG0:setLeftRight( true, true, -10, 10 )
	cachitBG0:setTopBottom( true, true, -10, 15 )
	cachitBG0:setImage( RegisterImage( "uie_t7_blackmarket_hint_box" ) )
	cachitBG0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	cachitBG0:setShaderVector( 0, 0.04, 0.26, 0, 0 )
	cachitBG0:setupNineSliceShader( 18, 18 )
	self:addElement( cachitBG0 )
	self.cachitBG0 = cachitBG0
	
	local textCenterAlign = LUI.UIText.new()
	textCenterAlign:setLeftRight( true, false, 0, 422 )
	textCenterAlign:setTopBottom( true, false, 5, 22 )
	textCenterAlign:setText( Engine.Localize( "MPUI_REQUIRES_DANGER_CLOSE" ) )
	textCenterAlign:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	textCenterAlign:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	textCenterAlign:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( textCenterAlign, "setText", function ( element, controller )
		ScaleWidgetToLabelWrappedWithMinimum( self, element, 5, 5, 423 )
	end )
	self:addElement( textCenterAlign )
	self.textCenterAlign = textCenterAlign
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				cachitBG0:completeAnimation()
				self.cachitBG0:setAlpha( 1 )
				self.clipFinished( cachitBG0, {} )
				textCenterAlign:completeAnimation()
				self.textCenterAlign:setAlpha( 1 )
				self.clipFinished( textCenterAlign, {} )
			end
		},
		NoHintText = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				cachitBG0:completeAnimation()
				self.cachitBG0:setAlpha( 0 )
				self.clipFinished( cachitBG0, {} )
				textCenterAlign:completeAnimation()
				self.textCenterAlign:setAlpha( 0 )
				self.clipFinished( textCenterAlign, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "NoHintText",
			condition = function ( menu, element, event )
				return not HasHintText( element )
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
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

