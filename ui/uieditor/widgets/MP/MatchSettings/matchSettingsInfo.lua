-- e80cff85b977bc54191563117814d995
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.MP.MatchSettings.matchSettingsTitle" )
require( "ui.uieditor.widgets.verticalScrollingTextBox" )
require( "ui.uieditor.widgets.Freerun.FR_BestTime" )
require( "ui.uieditor.widgets.Freerun.FR_Difficulty" )

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
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgIdle = LUI.UIImage.new()
	BoxButtonLrgIdle:setLeftRight( true, false, -5, 456 )
	BoxButtonLrgIdle:setTopBottom( true, false, -4, 319.95 )
	BoxButtonLrgIdle:setAlpha( 0 )
	BoxButtonLrgIdle:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrgidlefull" ) )
	BoxButtonLrgIdle:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	BoxButtonLrgIdle:setShaderVector( 0, 0.12, 0.12, 0, 0 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local image = LUI.UIImage.new()
	image:setLeftRight( true, true, 75.5, -75.5 )
	image:setTopBottom( true, true, 7.97, -243.03 )
	image:linkToElementModel( self, "image", true, function ( model )
		local _image = Engine.GetModelValue( model )
		if _image then
			image:setImage( RegisterImage( MapImageToModPreview( _image ) ) )
		end
	end )
	self:addElement( image )
	self.image = image
	
	local TitleBox = CoD.matchSettingsTitle.new( menu, controller )
	TitleBox:setLeftRight( true, false, 4, 453 )
	TitleBox:setTopBottom( false, true, -222, -187 )
	TitleBox:linkToElementModel( self, "text", true, function ( model )
		local text = Engine.GetModelValue( model )
		if text then
			TitleBox.TitleBox.ScorestreaksLabel:setText( text )
		end
	end )
	self:addElement( TitleBox )
	self.TitleBox = TitleBox
	
	local Description = CoD.verticalScrollingTextBox.new( menu, controller )
	Description:setLeftRight( true, false, 4, 465 )
	Description:setTopBottom( true, false, 383, 563 )
	Description.textBox:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Description.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Description:linkToElementModel( self, "description", true, function ( model )
		local description = Engine.GetModelValue( model )
		if description then
			Description.textBox:setText( Engine.Localize( description ) )
		end
	end )
	self:addElement( Description )
	self.Description = Description
	
	local Border = LUI.UIImage.new()
	Border:setLeftRight( true, true, 0, 0 )
	Border:setTopBottom( true, true, 0, -234.05 )
	Border:setAlpha( 0.43 )
	Border:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrfull" ) )
	Border:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	Border:setShaderVector( 0, 0.01, 0.01, 0, 0 )
	Border:setupNineSliceShader( 4, 4 )
	self:addElement( Border )
	self.Border = Border
	
	local FRBestTime = CoD.FR_BestTime.new( menu, controller )
	FRBestTime:setLeftRight( false, true, -139, -2 )
	FRBestTime:setTopBottom( false, true, -295.05, -233.05 )
	FRBestTime.BestTimeValueText:setText( Engine.Localize( "--:--:--" ) )
	self:addElement( FRBestTime )
	self.FRBestTime = FRBestTime
	
	local FRDifficulty = CoD.FR_Difficulty.new( menu, controller )
	FRDifficulty:setLeftRight( true, false, 3, 226 )
	FRDifficulty:setTopBottom( false, true, -325.05, -303.05 )
	FRDifficulty:linkToElementModel( self, "location", true, function ( model )
		local location = Engine.GetModelValue( model )
		if location then
			FRDifficulty.SubTitle:setText( Engine.Localize( location ) )
		end
	end )
	self:addElement( FRDifficulty )
	self.FRDifficulty = FRDifficulty
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgIdle, {} )

				image:completeAnimation()
				self.image:setLeftRight( true, true, 0, -11 )
				self.image:setTopBottom( true, true, 0, -299.75 )
				self.image:setAlpha( 1 )
				self.clipFinished( image, {} )

				TitleBox:completeAnimation()
				self.TitleBox:setLeftRight( true, false, 0, 251 )
				self.TitleBox:setTopBottom( false, true, -285, -250 )
				self.clipFinished( TitleBox, {} )

				Border:completeAnimation()
				self.Border:setLeftRight( true, true, -2, -9 )
				self.Border:setTopBottom( true, true, -1, -298.04 )
				self.clipFinished( Border, {} )

				FRBestTime:completeAnimation()
				self.FRBestTime:setLeftRight( false, true, -145, -8 )
				self.FRBestTime:setTopBottom( false, true, -358.04, -296.04 )
				self.clipFinished( FRBestTime, {} )
			end
		},
		AspectRatio_1x1 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0.4 )
				self.clipFinished( BoxButtonLrgIdle, {} )

				image:completeAnimation()
				self.image:setLeftRight( true, false, 75.5, 374.5 )
				self.image:setTopBottom( true, false, 7.97, 306.97 )
				self.clipFinished( image, {} )

				TitleBox:completeAnimation()
				self.TitleBox:setLeftRight( true, false, 1, 450 )
				self.TitleBox:setTopBottom( false, true, -222, -187 )
				self.clipFinished( TitleBox, {} )

				Border:completeAnimation()
				self.Border:setLeftRight( true, false, 0, 450 )
				self.Border:setTopBottom( true, false, 0, 315.95 )
				self.clipFinished( Border, {} )

				FRDifficulty:completeAnimation()
				self.FRDifficulty:setAlpha( 0 )
				self.clipFinished( FRDifficulty, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.TitleBox:close()
		element.Description:close()
		element.FRBestTime:close()
		element.FRDifficulty:close()
		element.image:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

