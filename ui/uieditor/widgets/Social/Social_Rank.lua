-- 36717493601699a2a3333349e9e53980
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Social.Social_RanksFrame" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.Social.Social_Rank_PrestigeText" )

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
	
	local WhiteBox = LUI.UIImage.new()
	WhiteBox:setLeftRight( true, false, 1, 79 )
	WhiteBox:setTopBottom( true, false, 2, 113 )
	WhiteBox:setAlpha( 0.05 )
	self:addElement( WhiteBox )
	self.WhiteBox = WhiteBox
	
	local SocialRanksFrame = CoD.Social_RanksFrame.new( menu, controller )
	SocialRanksFrame:setLeftRight( true, false, 0, 80 )
	SocialRanksFrame:setTopBottom( true, false, 0, 115 )
	self:addElement( SocialRanksFrame )
	self.SocialRanksFrame = SocialRanksFrame
	
	local gameModeBG = LUI.UIImage.new()
	gameModeBG:setLeftRight( true, true, 2, -2 )
	gameModeBG:setTopBottom( false, true, -17, -3 )
	gameModeBG:setRGB( 0, 0, 0 )
	gameModeBG:setAlpha( 0.5 )
	self:addElement( gameModeBG )
	self.gameModeBG = gameModeBG
	
	local ImageBorder = CoD.FE_TitleNumBrdr.new( menu, controller )
	ImageBorder:setLeftRight( false, false, -39, 39 )
	ImageBorder:setTopBottom( true, false, 117, 135.5 )
	ImageBorder:setAlpha( 0.65 )
	self:addElement( ImageBorder )
	self.ImageBorder = ImageBorder
	
	local level = LUI.UIText.new()
	level:setLeftRight( false, false, -38, 38 )
	level:setTopBottom( false, false, 60.25, 78.25 )
	level:setRGB( 0.58, 0.64, 0.65 )
	level:setText( Engine.Localize( "35" ) )
	level:setTTF( "fonts/escom.ttf" )
	level:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	level:setShaderVector( 0, 0, 1, 0, 0 )
	level:setShaderVector( 1, 0, 0, 0, 0 )
	level:setShaderVector( 2, 0, 0, 0, 0 )
	level:setShaderVector( 3, 0, 0, 0, 0 )
	level:setShaderVector( 4, 0, 0, 0, 0 )
	level:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	level:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( level )
	self.level = level
	
	local rankIconAdd = LUI.UIImage.new()
	rankIconAdd:setLeftRight( false, false, -31.5, 31.5 )
	rankIconAdd:setTopBottom( false, true, -93, -30 )
	self:addElement( rankIconAdd )
	self.rankIconAdd = rankIconAdd
	
	local GameMode = LUI.UIText.new()
	GameMode:setLeftRight( false, false, -40, 39 )
	GameMode:setTopBottom( false, true, -17, -3 )
	GameMode:setScale( LanguageOverrideNumber( "japanese", 0.8, 1 ) )
	GameMode:setText( Engine.Localize( "MENU_GAMETYPE_CAPS" ) )
	GameMode:setTTF( "fonts/default.ttf" )
	GameMode:setLetterSpacing( LanguageOverrideNumber( "japanese", -4, 0 ) )
	GameMode:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	GameMode:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( GameMode )
	self.GameMode = GameMode
	
	local prestige = CoD.Social_Rank_PrestigeText.new( menu, controller )
	prestige:setLeftRight( false, false, -55, 55 )
	prestige:setTopBottom( false, false, -73.5, -55.5 )
	prestige.prestige:setText( Engine.Localize( "" ) )
	self:addElement( prestige )
	self.prestige = prestige
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.SocialRanksFrame:close()
		element.ImageBorder:close()
		element.prestige:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

