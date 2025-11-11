require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )

CoD.CombatRecordRightTitleWithBackground = InheritFrom( LUI.UIElement )
CoD.CombatRecordRightTitleWithBackground.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CombatRecordRightTitleWithBackground )
	self.id = "CombatRecordRightTitleWithBackground"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( 0, 0, 0, 384 )
	self:setTopBottom( 0, 0, 0, 54 )
	
	local TitleGlow1 = CoD.cac_ItemTitleGlow.new( menu, controller )
	TitleGlow1:setLeftRight( 0, 1, 0, 0 )
	TitleGlow1:setTopBottom( 0, 1, -4, 4 )
	TitleGlow1:setRGB( 0.9, 0.9, 0.9 )
	self:addElement( TitleGlow1 )
	self.TitleGlow1 = TitleGlow1
	
	local Label = LUI.UIText.new()
	Label:setLeftRight( 0, 0, 7, 381 )
	Label:setTopBottom( 0.5, 0.5, -18, 18 )
	Label:setRGB( 0, 0, 0 )
	Label:setText( Engine.Localize( "MENU_FAVORITE_SPECIALIST" ) )
	Label:setTTF( "fonts/escom.ttf" )
	Label:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	Label:setShaderVector( 0, 0.05, 0, 0, 0 )
	Label:setShaderVector( 1, 0.3, 0, 0, 0 )
	Label:setShaderVector( 2, 1, 0, 0, 0 )
	Label:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Label:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( Label, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 7 )
	end )
	self:addElement( Label )
	self.Label = Label
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.TitleGlow1:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

