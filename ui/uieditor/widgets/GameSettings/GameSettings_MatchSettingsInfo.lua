-- 0e1191d295268e5a3dc05395cf853732
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.GameSettings.GameSettings_titlesecbox" )
require( "ui.uieditor.widgets.GameSettings.GameSettings_texbox" )

local PostLoadFunc = function ( self, controller, menu )
	local f1_local0 = Dvar.ui_gametype:get()
	local f1_local1 = Engine.StructTableLookupString( CoDShared.gametypesStructTable, "name", f1_local0, "image" )
	local f1_local2 = Engine.StructTableLookupString( CoDShared.gametypesStructTable, "name", f1_local0, "name_ref_caps" )
	local f1_local3 = Engine.StructTableLookupString( CoDShared.gametypesStructTable, "name", f1_local0, "description" )
	self.image:setImage( RegisterImage( f1_local1 ) )
	self.GameSettingstexbox.TextBox:setText( Engine.Localize( f1_local3 ) )
	self.GameSettingstitlesecbox.Textbox:setText( Engine.Localize( f1_local2 ) )
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
	self:setLeftRight( true, false, 0, 489 )
	self:setTopBottom( true, false, 0, 321 )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgIdle = LUI.UIImage.new()
	BoxButtonLrgIdle:setLeftRight( true, false, -3, 296.38 )
	BoxButtonLrgIdle:setTopBottom( true, false, 15.45, 213.73 )
	BoxButtonLrgIdle:setAlpha( 0.25 )
	BoxButtonLrgIdle:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrgidlefull" ) )
	BoxButtonLrgIdle:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	BoxButtonLrgIdle:setShaderVector( 0, 0.12, 0.12, 0, 0 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local Border = LUI.UIImage.new()
	Border:setLeftRight( true, false, 0, 293.38 )
	Border:setTopBottom( true, false, 18.45, 211.73 )
	Border:setAlpha( 0.5 )
	Border:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrfull" ) )
	Border:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	Border:setShaderVector( 0, 0.03, 0.03, 0, 0 )
	Border:setupNineSliceShader( 4, 4 )
	self:addElement( Border )
	self.Border = Border
	
	local image = LUI.UIImage.new()
	image:setLeftRight( true, false, 61.69, 231.69 )
	image:setTopBottom( true, false, 30.09, 200.09 )
	image:setImage( RegisterImage( "uie_t7_menu_mp_icons_gamemode_graphic_groundwar" ) )
	self:addElement( image )
	self.image = image
	
	local GameSettingstitlesecbox = CoD.GameSettings_titlesecbox.new( menu, controller )
	GameSettingstitlesecbox:setLeftRight( true, false, 0, 352 )
	GameSettingstitlesecbox:setTopBottom( true, false, 224, 252 )
	GameSettingstitlesecbox:subscribeToGlobalModel( controller, "GametypeSettings", "gametype", function ( model )
		local gametype = Engine.GetModelValue( model )
		if gametype then
			GameSettingstitlesecbox.Textbox:setText( Engine.Localize( LocalizeToUpperString( gametype ) ) )
		end
	end )
	self:addElement( GameSettingstitlesecbox )
	self.GameSettingstitlesecbox = GameSettingstitlesecbox
	
	local GameSettingstexbox = CoD.GameSettings_texbox.new( menu, controller )
	GameSettingstexbox:setLeftRight( true, false, 0, 489 )
	GameSettingstexbox:setTopBottom( true, false, 253, 278 )
	self:addElement( GameSettingstexbox )
	self.GameSettingstexbox = GameSettingstexbox
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GameSettingstitlesecbox:close()
		element.GameSettingstexbox:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

