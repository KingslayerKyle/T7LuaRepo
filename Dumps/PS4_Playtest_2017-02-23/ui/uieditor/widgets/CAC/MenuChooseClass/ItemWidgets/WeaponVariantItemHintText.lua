local PostLoadFunc = function ( self, controller, menu )
	self.updateText = function ( self, element )
		local _, _, leftOffset, rightOffset = self.warningIcon:getLocalLeftRight()
		local iconOffset = rightOffset - leftOffset + 15
		ScaleWidgetToLabelWrappedLeftAlign( self, element, -iconOffset, 8 )
	end
	
end

CoD.WeaponVariantItemHintText = InheritFrom( LUI.UIElement )
CoD.WeaponVariantItemHintText.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WeaponVariantItemHintText )
	self.id = "WeaponVariantItemHintText"
	self.soundSet = "CAC"
	self:setLeftRight( 0, 0, 0, 282 )
	self:setTopBottom( 0, 0, 0, 75 )
	
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
	
	local warningIcon = LUI.UIImage.new()
	warningIcon:setLeftRight( 0, 0, 3, 78 )
	warningIcon:setTopBottom( 0.5, 0.5, -40, 35 )
	warningIcon:setImage( RegisterImage( "cac_mods_warning_wv_icon" ) )
	self:addElement( warningIcon )
	self.warningIcon = warningIcon
	
	local hintText = LUI.UIText.new()
	hintText:setLeftRight( 0, 0, 80, 323 )
	hintText:setTopBottom( 0.5, 0.5, -12, 12 )
	hintText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	hintText:setLetterSpacing( 0.5 )
	hintText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	hintText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	hintText:linkToElementModel( self, "hintText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			hintText:setText( Engine.Localize( modelValue ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( hintText, "setText", function ( element, text )
		CallCustomElementFunction_Self( self, "updateText", element )
	end )
	self:addElement( hintText )
	self.hintText = hintText
	
	self.resetProperties = function ()
		black:completeAnimation()
		cachitBG0:completeAnimation()
		warningIcon:completeAnimation()
		hintText:completeAnimation()
		black:setAlpha( 1 )
		cachitBG0:setAlpha( 1 )
		warningIcon:setAlpha( 1 )
		hintText:setAlpha( 1 )
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
				self:setupElementClipCounter( 4 )
				black:completeAnimation()
				self.black:setAlpha( 0 )
				self.clipFinished( black, {} )
				cachitBG0:completeAnimation()
				self.cachitBG0:setAlpha( 0 )
				self.clipFinished( cachitBG0, {} )
				warningIcon:completeAnimation()
				self.warningIcon:setAlpha( 0 )
				self.clipFinished( warningIcon, {} )
				hintText:completeAnimation()
				self.hintText:setAlpha( 0 )
				self.clipFinished( hintText, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "NoHintText",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.hintText:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

