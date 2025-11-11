require( "ui.uieditor.widgets.GameSettings.GameSettings_texbox" )
require( "ui.uieditor.widgets.GameSettings.GameSettings_titlesecbox" )

local PostLoadFunc = function ( self, controller, menu )
	local gametype = Dvar.ui_gametype:get()
	local gameTypeInfo = Engine.GetGameTypeInfo( gametype )
	local image = gameTypeInfo.image
	local name = gameTypeInfo.nameRefCaps
	local description = gameTypeInfo.descriptionRef
	self.image:setImage( RegisterImage( image ) )
	self.GameSettingstexbox.TextBox:setText( Engine.Localize( description ) )
	self.GameSettingstitlesecbox.Textbox:setText( Engine.Localize( name ) )
end

CoD.GameSettings_MatchSettingsInfo = InheritFrom( LUI.UIElement )
CoD.GameSettings_MatchSettingsInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GameSettings_MatchSettingsInfo )
	self.id = "GameSettings_MatchSettingsInfo"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 733 )
	self:setTopBottom( 0, 0, 0, 481 )
	
	local BoxButtonLrgIdle = LUI.UIImage.new()
	BoxButtonLrgIdle:setLeftRight( 0, 0, -4, 445 )
	BoxButtonLrgIdle:setTopBottom( 0, 0, 23, 320 )
	BoxButtonLrgIdle:setAlpha( 0.25 )
	BoxButtonLrgIdle:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrgidlefull" ) )
	BoxButtonLrgIdle:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	BoxButtonLrgIdle:setShaderVector( 0, 0, 0, 0, 0 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local Border = LUI.UIImage.new()
	Border:setLeftRight( 0, 0, 0, 440 )
	Border:setTopBottom( 0, 0, 28, 318 )
	Border:setAlpha( 0.5 )
	Border:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrfull" ) )
	Border:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	Border:setShaderVector( 0, 0, 0, 0, 0 )
	Border:setupNineSliceShader( 6, 6 )
	self:addElement( Border )
	self.Border = Border
	
	local image = LUI.UIImage.new()
	image:setLeftRight( 0, 0, 93, 348 )
	image:setTopBottom( 0, 0, 45, 300 )
	image:setImage( RegisterImage( "playlist_war" ) )
	self:addElement( image )
	self.image = image
	
	local GameSettingstitlesecbox = CoD.GameSettings_titlesecbox.new( menu, controller )
	GameSettingstitlesecbox:setLeftRight( 0, 0, 0, 528 )
	GameSettingstitlesecbox:setTopBottom( 0, 0, 336, 378 )
	GameSettingstitlesecbox:subscribeToGlobalModel( controller, "GametypeSettings", "gametype", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GameSettingstitlesecbox.Textbox:setText( LocalizeToUpperString( modelValue ) )
		end
	end )
	self:addElement( GameSettingstitlesecbox )
	self.GameSettingstitlesecbox = GameSettingstitlesecbox
	
	local GameSettingstexbox = CoD.GameSettings_texbox.new( menu, controller )
	GameSettingstexbox:setLeftRight( 0, 0, 0, 734 )
	GameSettingstexbox:setTopBottom( 0, 0, 379, 417 )
	GameSettingstexbox.TextBox:setText( Engine.Localize( "WEAPON_PDW57_DESC" ) )
	self:addElement( GameSettingstexbox )
	self.GameSettingstexbox = GameSettingstexbox
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GameSettingstitlesecbox:close()
		self.GameSettingstexbox:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

