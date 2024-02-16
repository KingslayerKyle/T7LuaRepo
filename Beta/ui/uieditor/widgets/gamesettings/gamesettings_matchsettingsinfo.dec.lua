require( "ui.uieditor.widgets.Scorestreaks.scorestreaks_TitleBox" )

local PostLoadFunc = function ( self, controller, menu )
	local gametype = Dvar.ui_gametype:get()
	local image = Engine.StructTableLookupString( CoD.gametypesStructTable, "name", gametype, "image" )
	local name = Engine.StructTableLookupString( CoD.gametypesStructTable, "name", gametype, "name_ref_caps" )
	local description = Engine.StructTableLookupString( CoD.gametypesStructTable, "name", gametype, "description" )
	self.image:setImage( RegisterImage( image ) )
	self.TitleBox.ScorestreaksLabel:setText( Engine.Localize( name ) )
	self.Description:setText( Engine.Localize( description ) )
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
	self:setLeftRight( true, false, 0, 313 )
	self:setTopBottom( true, false, 0, 342 )
	
	local image = LUI.UIImage.new()
	image:setLeftRight( true, false, 75.5, 237 )
	image:setTopBottom( true, false, 7.97, 183.02 )
	self:addElement( image )
	self.image = image
	
	local TitleBox = CoD.scorestreaks_TitleBox.new( menu, controller )
	TitleBox:setLeftRight( true, false, 0, 251 )
	TitleBox:setTopBottom( true, false, 200.5, 235.5 )
	TitleBox.ScorestreaksLabel:setText( Engine.Localize( "Care Package" ) )
	self:addElement( TitleBox )
	self.TitleBox = TitleBox
	
	local Description = LUI.UIText.new()
	Description:setLeftRight( true, false, 0, 313 )
	Description:setTopBottom( true, false, 243, 265 )
	Description:setText( Engine.Localize( "MENU_NEW" ) )
	Description:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Description )
	self.Description = Description
	
	local Border = LUI.UIImage.new()
	Border:setLeftRight( true, false, 0, 313 )
	Border:setTopBottom( true, false, 0, 192 )
	Border:setAlpha( 0.43 )
	Border:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrfull" ) )
	Border:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	Border:setShaderVector( 0, 0.03, 0.03, 0, 0 )
	Border:setupNineSliceShader( 4, 4 )
	self:addElement( Border )
	self.Border = Border
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.TitleBox:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

