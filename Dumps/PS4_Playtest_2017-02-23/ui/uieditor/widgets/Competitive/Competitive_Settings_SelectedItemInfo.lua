require( "ui.uieditor.widgets.GameSettings.GameSettings_GameModeName" )
require( "ui.uieditor.widgets.GameSettings.GameSettings_Optionstextbox" )
require( "ui.uieditor.widgets.GameSettings.GameSettings_titlebox" )

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
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 1080 )
	
	local BoxButtonLrgIdle = LUI.UIImage.new()
	BoxButtonLrgIdle:setLeftRight( 0, 0, 1081, 1831 )
	BoxButtonLrgIdle:setTopBottom( 0, 0, 407, 843 )
	BoxButtonLrgIdle:setAlpha( 0.25 )
	BoxButtonLrgIdle:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrgidlefull" ) )
	BoxButtonLrgIdle:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	BoxButtonLrgIdle:setShaderVector( 0, 0, 0, 0, 0 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local GameSettingsGameModeName0 = CoD.GameSettings_GameModeName.new( menu, controller )
	GameSettingsGameModeName0:setLeftRight( 0, 0, 1090, 1824 )
	GameSettingsGameModeName0:setTopBottom( 0, 0, 911.5, 968.5 )
	self:addElement( GameSettingsGameModeName0 )
	self.GameSettingsGameModeName0 = GameSettingsGameModeName0
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 0, 1090, 1824 )
	Image0:setTopBottom( 0, 0, 211, 820 )
	Image0:setRGB( 0.5, 0.5, 0.5 )
	Image0:setAlpha( 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local ItemImage = LUI.UIImage.new()
	ItemImage:setLeftRight( 0, 0, 1183, 1731 )
	ItemImage:setTopBottom( 0, 0, 432, 648 )
	ItemImage:subscribeToGlobalModel( controller, "GametypeSettings", "image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ItemImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( ItemImage )
	self.ItemImage = ItemImage
	
	local GameSettingstitlebox = CoD.GameSettings_titlebox.new( menu, controller )
	GameSettingstitlebox:setLeftRight( 0, 0, 1090, 1618 )
	GameSettingstitlebox:setTopBottom( 0, 0, 212, 266 )
	GameSettingstitlebox:subscribeToGlobalModel( controller, "GametypeSettings", "title", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GameSettingstitlebox.ScorestreaksLabel:setText( LocalizeToUpperString( modelValue ) )
		end
	end )
	self:addElement( GameSettingstitlebox )
	self.GameSettingstitlebox = GameSettingstitlebox
	
	local GameSettingsOptionstextbox = CoD.GameSettings_Optionstextbox.new( menu, controller )
	GameSettingsOptionstextbox:setLeftRight( 0, 0, 1089, 1823 )
	GameSettingsOptionstextbox:setTopBottom( 0, 0, 272, 305 )
	GameSettingsOptionstextbox:subscribeToGlobalModel( controller, "GametypeSettings", "description", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GameSettingsOptionstextbox.TextBox:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( GameSettingsOptionstextbox )
	self.GameSettingsOptionstextbox = GameSettingsOptionstextbox
	
	local Border = LUI.UIImage.new()
	Border:setLeftRight( 0, 0, 1089, 1823 )
	Border:setTopBottom( 0, 0, 409, 838 )
	Border:setAlpha( 0.5 )
	Border:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrfull" ) )
	Border:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	Border:setShaderVector( 0, 0, 0, 0, 0 )
	Border:setupNineSliceShader( 6, 6 )
	self:addElement( Border )
	self.Border = Border
	
	self.resetProperties = function ()
		ItemImage:completeAnimation()
		Border:completeAnimation()
		ItemImage:setLeftRight( 0, 0, 1183, 1731 )
		ItemImage:setTopBottom( 0, 0, 432, 648 )
		ItemImage:setAlpha( 1 )
		Border:setAlpha( 0.5 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		SquareImage = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				ItemImage:completeAnimation()
				self.ItemImage:setLeftRight( 0, 0, 1267, 1645 )
				self.ItemImage:setTopBottom( 0, 0, 435, 813 )
				self.clipFinished( ItemImage, {} )
			end
		},
		WeaponImage = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				ItemImage:completeAnimation()
				self.ItemImage:setLeftRight( 0, 0, 1144.5, 1767.5 )
				self.ItemImage:setTopBottom( 0, 0, 490, 760 )
				self.clipFinished( ItemImage, {} )
			end
		},
		CollapsedImage = {
			DefaultClip = function ()
				self.resetProperties()
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GameSettingsGameModeName0:close()
		self.GameSettingstitlebox:close()
		self.GameSettingsOptionstextbox:close()
		self.ItemImage:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

