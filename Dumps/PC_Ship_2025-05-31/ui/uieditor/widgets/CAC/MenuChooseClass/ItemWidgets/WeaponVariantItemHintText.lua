local PostLoadFunc = function ( self, controller, menu )
	self.updateText = function ( f2_arg0, f2_arg1 )
		local f2_local0, f2_local1, f2_local2, f2_local3 = f2_arg0.warningIcon:getLocalLeftRight()
		ScaleWidgetToLabelWrappedLeftAlign( f2_arg0, f2_arg1, -(f2_local3 - f2_local2 + 15), 8 )
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
	
	local warningIcon = LUI.UIImage.new()
	warningIcon:setLeftRight( true, false, 2, 52 )
	warningIcon:setTopBottom( false, false, -26.5, 23.5 )
	warningIcon:setImage( RegisterImage( "uie_cac_icons_warning" ) )
	self:addElement( warningIcon )
	self.warningIcon = warningIcon
	
	local hintText = LUI.UIText.new()
	hintText:setLeftRight( true, false, 53, 215 )
	hintText:setTopBottom( false, false, -8, 8 )
	hintText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	hintText:setLetterSpacing( 0.5 )
	hintText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	hintText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	hintText:linkToElementModel( self, "hintText", true, function ( model )
		local _hintText = Engine.GetModelValue( model )
		if _hintText then
			hintText:setText( Engine.Localize( _hintText ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( hintText, "setText", function ( element, controller )
		CallCustomElementFunction_Self( self, "updateText", element )
	end )
	self:addElement( hintText )
	self.hintText = hintText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				black:completeAnimation()
				self.black:setAlpha( 1 )
				self.clipFinished( black, {} )
				cachitBG0:completeAnimation()
				self.cachitBG0:setLeftRight( true, true, 0, 0 )
				self.cachitBG0:setTopBottom( true, true, 0, 0 )
				self.cachitBG0:setAlpha( 1 )
				self.clipFinished( cachitBG0, {} )
				warningIcon:completeAnimation()
				self.warningIcon:setAlpha( 1 )
				self.clipFinished( warningIcon, {} )
				hintText:completeAnimation()
				self.hintText:setAlpha( 1 )
				self.clipFinished( hintText, {} )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.hintText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

