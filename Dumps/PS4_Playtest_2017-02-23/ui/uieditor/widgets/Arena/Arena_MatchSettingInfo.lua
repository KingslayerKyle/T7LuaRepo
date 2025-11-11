require( "ui.uieditor.widgets.MP.MatchSettings.matchSettingsTitle" )

CoD.Arena_MatchSettingInfo = InheritFrom( LUI.UIElement )
CoD.Arena_MatchSettingInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Arena_MatchSettingInfo )
	self.id = "Arena_MatchSettingInfo"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 690 )
	self:setTopBottom( 0, 0, 0, 825 )
	
	local BoxButtonLrgIdle0 = LUI.UIImage.new()
	BoxButtonLrgIdle0:setLeftRight( 0, 0, -9, 690 )
	BoxButtonLrgIdle0:setTopBottom( 0, 0, -5, 297 )
	BoxButtonLrgIdle0:setAlpha( 0.4 )
	BoxButtonLrgIdle0:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrgidlefull" ) )
	BoxButtonLrgIdle0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	BoxButtonLrgIdle0:setShaderVector( 0, 0, 0, 0, 0 )
	self:addElement( BoxButtonLrgIdle0 )
	self.BoxButtonLrgIdle0 = BoxButtonLrgIdle0
	
	local Border = LUI.UIImage.new()
	Border:setLeftRight( 0, 0, 0, 681 )
	Border:setTopBottom( 0, 0, 0, 292 )
	Border:setAlpha( 0.43 )
	Border:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrfull" ) )
	Border:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	Border:setShaderVector( 0, 0, 0, 0, 0 )
	Border:setupNineSliceShader( 6, 6 )
	self:addElement( Border )
	self.Border = Border
	
	local image = LUI.UIImage.new()
	image:setLeftRight( 0, 0, 167, 514 )
	image:setTopBottom( 0, 0, -21, 326 )
	image:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			image:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( image )
	self.image = image
	
	local TitleBox = CoD.matchSettingsTitle.new( menu, controller )
	TitleBox:setLeftRight( 0, 0, 6, 783 )
	TitleBox:setTopBottom( 1, 1, -519, -467 )
	TitleBox:linkToElementModel( self, "text", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TitleBox.TitleBox.ScorestreaksLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( TitleBox )
	self.TitleBox = TitleBox
	
	local Description = LUI.UIText.new()
	Description:setLeftRight( 0, 0, 6, 690 )
	Description:setTopBottom( 1, 1, -461, -428 )
	Description:setRGB( 0.74, 0.74, 0.74 )
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
	
	local playlistCount = LUI.UIText.new()
	playlistCount:setLeftRight( 0, 0, 1, 669 )
	playlistCount:setTopBottom( 0, 0, -33, -3 )
	playlistCount:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	playlistCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	playlistCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	playlistCount:linkToElementModel( self, "playlistCount", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			playlistCount:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( playlistCount )
	self.playlistCount = playlistCount
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.TitleBox:close()
		self.image:close()
		self.Description:close()
		self.playlistCount:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

