require( "ui.uieditor.widgets.Freerun.FR_BestTime" )
require( "ui.uieditor.widgets.Freerun.FR_Difficulty" )
require( "ui.uieditor.widgets.MP.MatchSettings.matchSettingsTitle" )

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
	self:setLeftRight( 0, 0, 0, 675 )
	self:setTopBottom( 0, 0, 0, 825 )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgIdle = LUI.UIImage.new()
	BoxButtonLrgIdle:setLeftRight( 0, 0, -8, 684 )
	BoxButtonLrgIdle:setTopBottom( 0, 0, -6, 480 )
	BoxButtonLrgIdle:setAlpha( 0 )
	BoxButtonLrgIdle:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrgidlefull" ) )
	BoxButtonLrgIdle:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	BoxButtonLrgIdle:setShaderVector( 0, 0, 0, 0, 0 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local image = LUI.UIImage.new()
	image:setLeftRight( 0, 1, 113, -113 )
	image:setTopBottom( 0, 1, 12, -364 )
	image:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			image:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( image )
	self.image = image
	
	local TitleBox = CoD.matchSettingsTitle.new( menu, controller )
	TitleBox:setLeftRight( 0, 0, 6, 680 )
	TitleBox:setTopBottom( 1, 1, -333, -281 )
	TitleBox:linkToElementModel( self, "text", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TitleBox.TitleBox.ScorestreaksLabel:setText( modelValue )
		end
	end )
	self:addElement( TitleBox )
	self.TitleBox = TitleBox
	
	local Description = LUI.UIText.new()
	Description:setLeftRight( 0, 0, 6, 675 )
	Description:setTopBottom( 1, 1, -269, -236 )
	Description:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Description:setLineSpacing( 0.5 )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Description:linkToElementModel( self, "description", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Description:setText( modelValue )
		end
	end )
	self:addElement( Description )
	self.Description = Description
	
	local Border = LUI.UIImage.new()
	Border:setLeftRight( 0, 1, 0, 0 )
	Border:setTopBottom( 0, 1, 0, -352 )
	Border:setAlpha( 0.43 )
	Border:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrfull" ) )
	Border:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	Border:setShaderVector( 0, 0, 0, 0, 0 )
	Border:setupNineSliceShader( 6, 6 )
	self:addElement( Border )
	self.Border = Border
	
	local FRBestTime = CoD.FR_BestTime.new( menu, controller )
	FRBestTime:setLeftRight( 1, 1, -209, -3 )
	FRBestTime:setTopBottom( 1, 1, -442.5, -349.5 )
	FRBestTime.BestTimeValueText:setText( Engine.Localize( "--:--:--" ) )
	self:addElement( FRBestTime )
	self.FRBestTime = FRBestTime
	
	local FRDifficulty = CoD.FR_Difficulty.new( menu, controller )
	FRDifficulty:setLeftRight( 0, 0, 5, 339 )
	FRDifficulty:setTopBottom( 1, 1, -488, -455 )
	FRDifficulty:linkToElementModel( self, "location", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FRDifficulty.SubTitle:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( FRDifficulty )
	self.FRDifficulty = FRDifficulty
	
	self.resetProperties = function ()
		image:completeAnimation()
		Description:completeAnimation()
		TitleBox:completeAnimation()
		Border:completeAnimation()
		FRBestTime:completeAnimation()
		FRDifficulty:completeAnimation()
		BoxButtonLrgIdle:completeAnimation()
		image:setLeftRight( 0, 1, 113, -113 )
		image:setTopBottom( 0, 1, 12, -364 )
		Description:setLeftRight( 0, 0, 6, 675 )
		Description:setTopBottom( 1, 1, -269, -236 )
		TitleBox:setLeftRight( 0, 0, 6, 680 )
		TitleBox:setTopBottom( 1, 1, -333, -281 )
		Border:setLeftRight( 0, 1, 0, 0 )
		Border:setTopBottom( 0, 1, 0, -352 )
		FRBestTime:setLeftRight( 1, 1, -209, -3 )
		FRBestTime:setTopBottom( 1, 1, -442.5, -349.5 )
		FRDifficulty:setAlpha( 1 )
		BoxButtonLrgIdle:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				image:completeAnimation()
				self.image:setLeftRight( 0, 1, 0, -16 )
				self.image:setTopBottom( 0, 1, 0, -450 )
				self.clipFinished( image, {} )
				TitleBox:completeAnimation()
				self.TitleBox:setLeftRight( 0, 0, 0, 376 )
				self.TitleBox:setTopBottom( 1, 1, -427, -375 )
				self.clipFinished( TitleBox, {} )
				Description:completeAnimation()
				self.Description:setLeftRight( 0, 0, 4.5, 656.5 )
				self.Description:setTopBottom( 1, 1, -365, -332 )
				self.clipFinished( Description, {} )
				Border:completeAnimation()
				self.Border:setLeftRight( 0, 1, -3, -13 )
				self.Border:setTopBottom( 0, 1, -1, -447 )
				self.clipFinished( Border, {} )
				FRBestTime:completeAnimation()
				self.FRBestTime:setLeftRight( 1, 1, -218, -12 )
				self.FRBestTime:setTopBottom( 1, 1, -537.5, -444.5 )
				self.clipFinished( FRBestTime, {} )
			end
		},
		AspectRatio_1x1 = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0.4 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				image:completeAnimation()
				self.image:setLeftRight( 0, 0, 338, 338 )
				self.image:setTopBottom( 0, 0, 236, 236 )
				self.clipFinished( image, {} )
				TitleBox:completeAnimation()
				self.TitleBox:setLeftRight( 0, 0, 1, 675 )
				self.TitleBox:setTopBottom( 1, 1, -333, -281 )
				self.clipFinished( TitleBox, {} )
				Description:completeAnimation()
				self.Description:setLeftRight( 0, 0, 6, 675 )
				self.Description:setTopBottom( 0, 0, 557, 590 )
				self.clipFinished( Description, {} )
				Border:completeAnimation()
				self.Border:setLeftRight( 0, 0, 338, 338 )
				self.Border:setTopBottom( 0, 0, 237, 237 )
				self.clipFinished( Border, {} )
				FRDifficulty:completeAnimation()
				self.FRDifficulty:setAlpha( 0 )
				self.clipFinished( FRDifficulty, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.TitleBox:close()
		self.FRBestTime:close()
		self.FRDifficulty:close()
		self.image:close()
		self.Description:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

