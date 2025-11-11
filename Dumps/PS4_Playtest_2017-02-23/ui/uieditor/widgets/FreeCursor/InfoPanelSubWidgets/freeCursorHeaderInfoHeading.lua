CoD.freeCursorHeaderInfoHeading = InheritFrom( LUI.UIElement )
CoD.freeCursorHeaderInfoHeading.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.freeCursorHeaderInfoHeading )
	self.id = "freeCursorHeaderInfoHeading"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 399 )
	self:setTopBottom( 0, 0, 0, 28 )
	
	local useString = LUI.UIText.new()
	useString:setLeftRight( 0, 0, 0, 391 )
	useString:setTopBottom( 0, 0, 0, 28 )
	useString:setRGB( 0.91, 0.89, 0.48 )
	useString:setTTF( "fonts/default.ttf" )
	useString:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	useString:setShaderVector( 0, 0.03, 0, 0, 0 )
	useString:setShaderVector( 1, 0.02, 0, 0, 0 )
	useString:setShaderVector( 2, 1, 0, 0, 0 )
	useString:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	useString:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	useString:linkToElementModel( self, "header", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			useString:setText( Engine.Localize( GetItemHeaderUseString( modelValue ) ) )
		end
	end )
	self:addElement( useString )
	self.useString = useString
	
	local heading = LUI.UIText.new()
	heading:setLeftRight( 0, 0, 0, 399 )
	heading:setTopBottom( 0, 0, 0, 28 )
	heading:setRGB( 0.91, 0.89, 0.48 )
	heading:setTTF( "fonts/default.ttf" )
	heading:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	heading:setShaderVector( 0, 0.03, 0, 0, 0 )
	heading:setShaderVector( 1, 0.02, 0, 0, 0 )
	heading:setShaderVector( 2, 1, 0, 0, 0 )
	heading:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	heading:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	heading:linkToElementModel( self, "header", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			heading:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( heading )
	self.heading = heading
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.useString:close()
		self.heading:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

