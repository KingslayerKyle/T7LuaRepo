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
	self:setLeftRight( true, false, 0, 84 )
	self:setTopBottom( true, false, 0, 110 )
	
	local border = CoD.BorderThin.new( menu, controller )
	border:setLeftRight( true, false, 0, 84 )
	border:setTopBottom( true, false, 0, 84 )
	border:setRGB( 0.1, 0.1, 0.1 )
	self:addElement( border )
	self.border = border
	
	local prestige = LUI.UIText.new()
	prestige:setLeftRight( true, true, 0, 0 )
	prestige:setTopBottom( false, true, -12, 4 )
	prestige:setRGB( 0.93, 0.93, 0.93 )
	prestige:setAlpha( HideIfEmptyString( 1 ) )
	prestige:setText( Engine.Localize( "EM_PRESTIGE04A" ) )
	prestige:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	prestige:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	prestige:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( prestige )
	self.prestige = prestige
	
	local levelBackground = LUI.UIImage.new()
	levelBackground:setLeftRight( true, true, 20, -20 )
	levelBackground:setTopBottom( false, true, -34, -20 )
	levelBackground:setRGB( 0.72, 0.72, 0.72 )
	levelBackground:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( levelBackground )
	self.levelBackground = levelBackground
	
	local level = LUI.UIText.new()
	level:setLeftRight( false, false, -22, 22 )
	level:setTopBottom( false, true, -34, -20 )
	level:setRGB( 0, 0, 0 )
	level:setText( Engine.Localize( "35" ) )
	level:setTTF( "fonts/default.ttf" )
	level:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	level:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( level )
	self.level = level
	
	local rankIconSolid = LUI.UIImage.new()
	rankIconSolid:setLeftRight( false, false, -32, 32 )
	rankIconSolid:setTopBottom( true, false, 5, 69 )
	rankIconSolid:setRGB( 0, 0, 0 )
	rankIconSolid:setAlpha( 0.3 )
	rankIconSolid:setZoom( -5 )
	rankIconSolid:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( rankIconSolid )
	self.rankIconSolid = rankIconSolid
	
	local rankIconAdd = LUI.UIImage.new()
	rankIconAdd:setLeftRight( false, false, -32, 32 )
	rankIconAdd:setTopBottom( true, false, 5, 69 )
	rankIconAdd:setRGB( 1, 1, 1 )
	rankIconAdd:setImage( RegisterImage( "uie_t7_icon_rank_mp_level_01_lrg" ) )
	rankIconAdd:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( rankIconAdd )
	self.rankIconAdd = rankIconAdd
	
	self.close = function ( self )
		self.border:close()
		CoD.Social_Rank.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

