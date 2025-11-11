require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.Social.Social_Rank_PrestigeText" )
require( "ui.uieditor.widgets.Social.Social_RanksFrame" )

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
	self:setLeftRight( 0, 0, 0, 120 )
	self:setTopBottom( 0, 0, 0, 172 )
	
	local WhiteBox = LUI.UIImage.new()
	WhiteBox:setLeftRight( 0, 0, 1, 118 )
	WhiteBox:setTopBottom( 0, 0, 3, 169 )
	WhiteBox:setAlpha( 0.05 )
	self:addElement( WhiteBox )
	self.WhiteBox = WhiteBox
	
	local SocialRanksFrame = CoD.Social_RanksFrame.new( menu, controller )
	SocialRanksFrame:setLeftRight( 0, 0, 0, 120 )
	SocialRanksFrame:setTopBottom( 0, 0, 0, 172 )
	self:addElement( SocialRanksFrame )
	self.SocialRanksFrame = SocialRanksFrame
	
	local gameModeBG = LUI.UIImage.new()
	gameModeBG:setLeftRight( 0, 1, 3, -3 )
	gameModeBG:setTopBottom( 1, 1, -25, -4 )
	gameModeBG:setRGB( 0, 0, 0 )
	gameModeBG:setAlpha( 0.5 )
	self:addElement( gameModeBG )
	self.gameModeBG = gameModeBG
	
	local ImageBorder = CoD.FE_TitleNumBrdr.new( menu, controller )
	ImageBorder:setLeftRight( 0.5, 0.5, -58.5, 58.5 )
	ImageBorder:setTopBottom( 0, 0, 175, 203 )
	ImageBorder:setAlpha( 0.65 )
	self:addElement( ImageBorder )
	self.ImageBorder = ImageBorder
	
	local level = LUI.UIText.new()
	level:setLeftRight( 0.5, 0.5, -57, 57 )
	level:setTopBottom( 0.5, 0.5, 90, 117 )
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
	rankIconAdd:setLeftRight( 0.5, 0.5, -47, 47 )
	rankIconAdd:setTopBottom( 1, 1, -139, -45 )
	self:addElement( rankIconAdd )
	self.rankIconAdd = rankIconAdd
	
	local GameMode = LUI.UIText.new()
	GameMode:setLeftRight( 0.5, 0.5, -60, 58 )
	GameMode:setTopBottom( 1, 1, -25, -4 )
	GameMode:setScale( LanguageOverrideNumber( "japanese", 0.8, 1 ) )
	GameMode:setText( Engine.Localize( "MENU_GAMETYPE_CAPS" ) )
	GameMode:setTTF( "fonts/default.ttf" )
	GameMode:setLetterSpacing( LanguageOverrideNumber( "japanese", -4, 0 ) )
	GameMode:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	GameMode:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( GameMode )
	self.GameMode = GameMode
	
	local prestige = CoD.Social_Rank_PrestigeText.new( menu, controller )
	prestige:setLeftRight( 0.5, 0.5, -58, 60 )
	prestige:setTopBottom( 0.5, 0.5, -113.5, -86.5 )
	prestige.prestige:setText( Engine.Localize( "" ) )
	self:addElement( prestige )
	self.prestige = prestige
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.SocialRanksFrame:close()
		self.ImageBorder:close()
		self.prestige:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

