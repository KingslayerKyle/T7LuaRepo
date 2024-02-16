require( "ui.uieditor.widgets.Scorestreaks.scorestreaks_TitleBox" )

CoD.matchSettingsInfo = InheritFrom( LUI.UIElement )
CoD.matchSettingsInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.matchSettingsInfo )
	self.id = "matchSettingsInfo"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 450 )
	self:setTopBottom( true, false, 0, 550 )
	
	local image = LUI.UIImage.new()
	image:setLeftRight( true, false, 75.5, 374.5 )
	image:setTopBottom( true, false, 7.97, 306.97 )
	image:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			image:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( image )
	self.image = image
	
	local TitleBox = CoD.scorestreaks_TitleBox.new( menu, controller )
	TitleBox:setLeftRight( true, false, 1, 252 )
	TitleBox:setTopBottom( true, false, 328, 363 )
	TitleBox:linkToElementModel( self, "text", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TitleBox.ScorestreaksLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( TitleBox )
	self.TitleBox = TitleBox
	
	local Description = LUI.UIText.new()
	Description:setLeftRight( true, false, 4, 450 )
	Description:setTopBottom( true, false, 371, 393 )
	Description:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Description:setLineSpacing( 0.5 )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Description:linkToElementModel( self, "description", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Description:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Description )
	self.Description = Description
	
	local Border = LUI.UIImage.new()
	Border:setLeftRight( true, false, 0, 450 )
	Border:setTopBottom( true, false, 0, 315.95 )
	Border:setAlpha( 0.43 )
	Border:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrfull" ) )
	Border:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	Border:setShaderVector( 0, 0.03, 0.03, 0, 0 )
	Border:setupNineSliceShader( 4, 4 )
	self:addElement( Border )
	self.Border = Border
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				image:completeAnimation()
				self.image:setLeftRight( true, false, 0, 437.71 )
				self.image:setTopBottom( true, false, 1, 249.25 )
				self.image:setAlpha( 1 )
				self.clipFinished( image, {} )
				TitleBox:completeAnimation()
				self.TitleBox:setLeftRight( true, false, 0, 251 )
				self.TitleBox:setTopBottom( true, false, 265, 300 )
				self.clipFinished( TitleBox, {} )
				Description:completeAnimation()
				self.Description:setLeftRight( true, false, 3, 437.71 )
				self.Description:setTopBottom( true, false, 307, 329 )
				self.clipFinished( Description, {} )
				Border:completeAnimation()
				self.Border:setLeftRight( true, false, -2, 441 )
				self.Border:setTopBottom( true, false, -1, 251.96 )
				self.clipFinished( Border, {} )
			end
		},
		AspectRatio_1x1 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				image:completeAnimation()
				self.image:setLeftRight( true, false, 75.5, 374.5 )
				self.image:setTopBottom( true, false, 7.97, 306.97 )
				self.clipFinished( image, {} )
				TitleBox:completeAnimation()
				self.TitleBox:setLeftRight( true, false, 1, 252 )
				self.TitleBox:setTopBottom( true, false, 328, 363 )
				self.clipFinished( TitleBox, {} )
				Description:completeAnimation()
				self.Description:setLeftRight( true, false, 4, 450 )
				self.Description:setTopBottom( true, false, 371, 393 )
				self.clipFinished( Description, {} )
				Border:completeAnimation()
				self.Border:setLeftRight( true, false, 0, 450 )
				self.Border:setTopBottom( true, false, 0, 315.95 )
				self.clipFinished( Border, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.TitleBox:close()
		self.image:close()
		self.Description:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

