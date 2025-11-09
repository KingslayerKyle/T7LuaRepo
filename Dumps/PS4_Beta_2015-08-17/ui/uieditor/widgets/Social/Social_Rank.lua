require( "ui.uieditor.widgets.BorderThin" )

CoD.Social_Rank = InheritFrom( LUI.UIElement )
CoD.Social_Rank.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Social_Rank )
	self.id = "Social_Rank"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 80 )
	self:setTopBottom( true, false, 0, 115 )
	self.anyChildUsesUpdateState = true
	
	local border = CoD.BorderThin.new( menu, controller )
	border:setLeftRight( true, true, 0, 0 )
	border:setTopBottom( true, true, 0, 0 )
	border:setRGB( 0.1, 0.1, 0.1 )
	border.BoxButtonLrgIdle:setAlpha( 1 )
	self:addElement( border )
	self.border = border
	
	local levelBackground = LUI.UIImage.new()
	levelBackground:setLeftRight( true, true, 19, -21 )
	levelBackground:setTopBottom( false, true, -7, 7 )
	levelBackground:setRGB( 0.72, 0.72, 0.72 )
	self:addElement( levelBackground )
	self.levelBackground = levelBackground
	
	local level = LUI.UIText.new()
	level:setLeftRight( false, false, -21, 19 )
	level:setTopBottom( false, true, -7, 7 )
	level:setRGB( 0, 0, 0 )
	level:setText( Engine.Localize( "35" ) )
	level:setTTF( "fonts/default.ttf" )
	level:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	level:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( level )
	self.level = level
	
	local rankIconAdd = LUI.UIImage.new()
	rankIconAdd:setLeftRight( false, false, -31.5, 31.5 )
	rankIconAdd:setTopBottom( false, true, -89, -26 )
	self:addElement( rankIconAdd )
	self.rankIconAdd = rankIconAdd
	
	local prestige = LUI.UIText.new()
	prestige:setLeftRight( false, false, -40, 40 )
	prestige:setTopBottom( false, true, 14, 33 )
	prestige:setText( Engine.Localize( "" ) )
	prestige:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	prestige:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	prestige:setShaderVector( 0, 0.06, 0, 0, 0 )
	prestige:setShaderVector( 1, 0.02, 0, 0, 0 )
	prestige:setShaderVector( 2, 1, 0, 0, 0 )
	prestige:setLetterSpacing( 0.5 )
	prestige:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	prestige:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( prestige )
	self.prestige = prestige
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.border:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

