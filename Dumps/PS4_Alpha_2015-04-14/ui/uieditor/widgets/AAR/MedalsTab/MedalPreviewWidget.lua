require( "ui.uieditor.widgets.Border" )

CoD.MedalPreviewWidget = InheritFrom( LUI.UIElement )
CoD.MedalPreviewWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MedalPreviewWidget )
	self.id = "MedalPreviewWidget"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 287 )
	self:setTopBottom( true, false, 0, 562 )
	
	local TopPartBorder = CoD.Border.new( menu, controller )
	TopPartBorder:setLeftRight( true, false, 0, 286.57 )
	TopPartBorder:setTopBottom( true, false, 0, 281 )
	TopPartBorder:setRGB( 1, 1, 1 )
	self:addElement( TopPartBorder )
	self.TopPartBorder = TopPartBorder
	
	local MedalImage = LUI.UIImage.new()
	MedalImage:setLeftRight( true, false, 32, 254.57 )
	MedalImage:setTopBottom( true, false, 16.48, 238.48 )
	MedalImage:setRGB( 1, 1, 1 )
	MedalImage:setImage( RegisterImage( "uie_headicon_dead" ) )
	MedalImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( MedalImage )
	self.MedalImage = MedalImage
	
	local Times = LUI.UIText.new()
	Times:setLeftRight( true, false, 0, 286.57 )
	Times:setTopBottom( true, false, 256, 281 )
	Times:setRGB( 1, 1, 1 )
	Times:setText( Engine.Localize( "x2" ) )
	Times:setTTF( "fonts/default.ttf" )
	Times:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Times:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Times )
	self.Times = Times
	
	local BottomPartBorder = CoD.Border.new( menu, controller )
	BottomPartBorder:setLeftRight( true, false, 0, 286.57 )
	BottomPartBorder:setTopBottom( true, false, 281, 562 )
	BottomPartBorder:setRGB( 1, 1, 1 )
	self:addElement( BottomPartBorder )
	self.BottomPartBorder = BottomPartBorder
	
	local MedalName = LUI.UITightText.new()
	MedalName:setLeftRight( true, false, 12.29, 144.29 )
	MedalName:setTopBottom( true, false, 295.63, 325.63 )
	MedalName:setRGB( 1, 1, 1 )
	MedalName:setText( Engine.Localize( "Bloodthirsty" ) )
	MedalName:setTTF( "fonts/default.ttf" )
	self:addElement( MedalName )
	self.MedalName = MedalName
	
	local MedalDescription = LUI.UIText.new()
	MedalDescription:setLeftRight( true, false, 12.29, 254.57 )
	MedalDescription:setTopBottom( true, false, 335.17, 360.17 )
	MedalDescription:setRGB( 1, 1, 1 )
	MedalDescription:setText( Engine.Localize( "Killed 5 players without dying." ) )
	MedalDescription:setTTF( "fonts/default.ttf" )
	MedalDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	MedalDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( MedalDescription )
	self.MedalDescription = MedalDescription
	
	local XpBg = LUI.UIImage.new()
	XpBg:setLeftRight( true, false, 0, 286.57 )
	XpBg:setTopBottom( true, false, 496, 562 )
	XpBg:setRGB( 0, 0, 0 )
	XpBg:setAlpha( 0.31 )
	XpBg:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( XpBg )
	self.XpBg = XpBg
	
	local XpIcon = LUI.UIImage.new()
	XpIcon:setLeftRight( true, false, 32, 78.29 )
	XpIcon:setTopBottom( true, false, 505.85, 552.15 )
	XpIcon:setImage( RegisterImage( "uie_t7_hud_mp_notifications_xp" ) )
	XpIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( XpIcon )
	self.XpIcon = XpIcon
	
	local XpValue = LUI.UITightText.new()
	XpValue:setLeftRight( true, false, 93, 181 )
	XpValue:setTopBottom( true, false, 516.5, 541.5 )
	XpValue:setText( Engine.Localize( "+1000 XP" ) )
	XpValue:setTTF( "fonts/default.ttf" )
	self:addElement( XpValue )
	self.XpValue = XpValue
	
	self.close = function ( self )
		self.TopPartBorder:close()
		self.BottomPartBorder:close()
		CoD.MedalPreviewWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

