require( "ui.uieditor.widgets.GameSettings.GameSettings_GameModeName" )
require( "ui.uieditor.widgets.GameSettings.GameSettings_titlebox" )
require( "ui.uieditor.widgets.GameSettings.GameSettings_Optionstextbox" )

CoD.Competitive_Settings_SelectedItemInfo = InheritFrom( LUI.UIElement )
CoD.Competitive_Settings_SelectedItemInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Competitive_Settings_SelectedItemInfo )
	self.id = "Competitive_Settings_SelectedItemInfo"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgIdle = LUI.UIImage.new()
	BoxButtonLrgIdle:setLeftRight( true, false, 721, 1221 )
	BoxButtonLrgIdle:setTopBottom( true, false, 271, 562 )
	BoxButtonLrgIdle:setAlpha( 0.25 )
	BoxButtonLrgIdle:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrgidlefull" ) )
	BoxButtonLrgIdle:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	BoxButtonLrgIdle:setShaderVector( 0, 0.12, 0.12, 0, 0 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local GameSettingsGameModeName0 = CoD.GameSettings_GameModeName.new( menu, controller )
	GameSettingsGameModeName0:setLeftRight( true, false, 727, 1216 )
	GameSettingsGameModeName0:setTopBottom( true, false, 607.5, 645.5 )
	self:addElement( GameSettingsGameModeName0 )
	self.GameSettingsGameModeName0 = GameSettingsGameModeName0
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 727, 1216 )
	Image0:setTopBottom( true, false, 140.5, 546.5 )
	Image0:setRGB( 0.5, 0.5, 0.5 )
	Image0:setAlpha( 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local ItemImage = LUI.UIImage.new()
	ItemImage:setLeftRight( true, false, 789, 1154 )
	ItemImage:setTopBottom( true, false, 288, 432 )
	ItemImage:subscribeToGlobalModel( controller, "GametypeSettings", "image", function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			ItemImage:setImage( RegisterImage( image ) )
		end
	end )
	self:addElement( ItemImage )
	self.ItemImage = ItemImage
	
	local GameSettingstitlebox = CoD.GameSettings_titlebox.new( menu, controller )
	GameSettingstitlebox:setLeftRight( true, false, 727, 1079 )
	GameSettingstitlebox:setTopBottom( true, false, 141.5, 177.5 )
	GameSettingstitlebox:subscribeToGlobalModel( controller, "GametypeSettings", "title", function ( model )
		local title = Engine.GetModelValue( model )
		if title then
			GameSettingstitlebox.ScorestreaksLabel:setText( Engine.Localize( LocalizeToUpperString( title ) ) )
		end
	end )
	self:addElement( GameSettingstitlebox )
	self.GameSettingstitlebox = GameSettingstitlebox
	
	local GameSettingsOptionstextbox = CoD.GameSettings_Optionstextbox.new( menu, controller )
	GameSettingsOptionstextbox:setLeftRight( true, false, 726.3, 1215.3 )
	GameSettingsOptionstextbox:setTopBottom( true, false, 181.5, 203.5 )
	GameSettingsOptionstextbox:subscribeToGlobalModel( controller, "GametypeSettings", "description", function ( model )
		local description = Engine.GetModelValue( model )
		if description then
			GameSettingsOptionstextbox.TextBox:setText( Engine.Localize( description ) )
		end
	end )
	self:addElement( GameSettingsOptionstextbox )
	self.GameSettingsOptionstextbox = GameSettingsOptionstextbox
	
	local Border = LUI.UIImage.new()
	Border:setLeftRight( true, false, 726, 1215 )
	Border:setTopBottom( true, false, 273, 559 )
	Border:setAlpha( 0.5 )
	Border:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrfull" ) )
	Border:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	Border:setShaderVector( 0, 0.01, 0.01, 0, 0 )
	Border:setupNineSliceShader( 4, 4 )
	self:addElement( Border )
	self.Border = Border
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		SquareImage = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				ItemImage:completeAnimation()
				self.ItemImage:setLeftRight( true, false, 844.5, 1096.5 )
				self.ItemImage:setTopBottom( true, false, 290, 542 )
				self.clipFinished( ItemImage, {} )
				Border:completeAnimation()
				self.Border:setAlpha( 0.5 )
				self.clipFinished( Border, {} )
			end
		},
		WeaponImage = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				ItemImage:completeAnimation()
				self.ItemImage:setLeftRight( true, false, 762.94, 1178.06 )
				self.ItemImage:setTopBottom( true, false, 326.48, 506.52 )
				self.clipFinished( ItemImage, {} )
				Border:completeAnimation()
				self.Border:setAlpha( 0.5 )
				self.clipFinished( Border, {} )
			end
		},
		CollapsedImage = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				ItemImage:completeAnimation()
				self.ItemImage:setAlpha( 0 )
				self.clipFinished( ItemImage, {} )
				Border:completeAnimation()
				self.Border:setAlpha( 0 )
				self.clipFinished( Border, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GameSettingsGameModeName0:close()
		element.GameSettingstitlebox:close()
		element.GameSettingsOptionstextbox:close()
		element.ItemImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

