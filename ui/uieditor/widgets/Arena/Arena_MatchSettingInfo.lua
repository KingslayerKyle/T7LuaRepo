-- 5f486899f404b30ab5c3efbd42d243ad
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 460 )
	self:setTopBottom( true, false, 0, 550 )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgIdle0 = LUI.UIImage.new()
	BoxButtonLrgIdle0:setLeftRight( true, false, -6, 460 )
	BoxButtonLrgIdle0:setTopBottom( true, false, -3, 198 )
	BoxButtonLrgIdle0:setAlpha( 0.4 )
	BoxButtonLrgIdle0:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrgidlefull" ) )
	BoxButtonLrgIdle0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	BoxButtonLrgIdle0:setShaderVector( 0, 0.12, 0.12, 0, 0 )
	self:addElement( BoxButtonLrgIdle0 )
	self.BoxButtonLrgIdle0 = BoxButtonLrgIdle0
	
	local Border = LUI.UIImage.new()
	Border:setLeftRight( true, false, 0, 454 )
	Border:setTopBottom( true, false, 0, 195 )
	Border:setAlpha( 0.43 )
	Border:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrfull" ) )
	Border:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	Border:setShaderVector( 0, 0.01, 0.02, 0, 0 )
	Border:setupNineSliceShader( 4, 4 )
	self:addElement( Border )
	self.Border = Border
	
	local image = LUI.UIImage.new()
	image:setLeftRight( true, false, 111.38, 342.63 )
	image:setTopBottom( true, false, -14, 217.25 )
	image:linkToElementModel( self, "image", true, function ( model )
		local _image = Engine.GetModelValue( model )
		if _image then
			image:setImage( RegisterImage( _image ) )
		end
	end )
	self:addElement( image )
	self.image = image
	
	local TitleBox = CoD.matchSettingsTitle.new( menu, controller )
	TitleBox:setLeftRight( true, false, 4, 522 )
	TitleBox:setTopBottom( false, true, -346, -311 )
	TitleBox:linkToElementModel( self, "text", true, function ( model )
		local text = Engine.GetModelValue( model )
		if text then
			TitleBox.TitleBox.ScorestreaksLabel:setText( Engine.Localize( text ) )
		end
	end )
	self:addElement( TitleBox )
	self.TitleBox = TitleBox
	
	local Description = LUI.UIText.new()
	Description:setLeftRight( true, false, 4, 460 )
	Description:setTopBottom( false, true, -307, -285 )
	Description:setRGB( 0.74, 0.74, 0.74 )
	Description:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Description:setLineSpacing( 0.5 )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Description:linkToElementModel( self, "description", true, function ( model )
		local description = Engine.GetModelValue( model )
		if description then
			Description:setText( Engine.Localize( description ) )
		end
	end )
	self:addElement( Description )
	self.Description = Description
	
	local playlistCount = LUI.UIText.new()
	playlistCount:setLeftRight( true, false, 1, 446 )
	playlistCount:setTopBottom( true, false, -22, -2 )
	playlistCount:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	playlistCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	playlistCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	playlistCount:linkToElementModel( self, "playlistCount", true, function ( model )
		local _playlistCount = Engine.GetModelValue( model )
		if _playlistCount then
			playlistCount:setText( Engine.Localize( _playlistCount ) )
		end
	end )
	self:addElement( playlistCount )
	self.playlistCount = playlistCount
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.TitleBox:close()
		element.image:close()
		element.Description:close()
		element.playlistCount:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

