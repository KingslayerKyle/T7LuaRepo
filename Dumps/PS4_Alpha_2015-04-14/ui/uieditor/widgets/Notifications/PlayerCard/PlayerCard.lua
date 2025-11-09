require( "ui.uieditor.widgets.Notifications.PlayerCard.PlayerCard_Label" )

CoD.PlayerCard = InheritFrom( LUI.UIElement )
CoD.PlayerCard.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PlayerCard )
	self.id = "PlayerCard"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 276 )
	self:setTopBottom( true, false, 0, 59 )
	self.anyChildUsesUpdateState = true
	
	local CardImage = LUI.UIImage.new()
	CardImage:setLeftRight( true, false, 50.66, 266.66 )
	CardImage:setTopBottom( true, false, 2, 58 )
	CardImage:setRGB( 1, 1, 1 )
	CardImage:setImage( RegisterImage( "uie_t7_icon_callingcard_temp2_lrg" ) )
	CardImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( CardImage )
	self.CardImage = CardImage
	
	local GamerTag = CoD.PlayerCard_Label.new( menu, controller )
	GamerTag:setLeftRight( true, false, 59, 145 )
	GamerTag:setTopBottom( true, false, 2, 22 )
	GamerTag:setRGB( 1, 1, 1 )
	GamerTag.Panel:setAlpha( 0.6 )
	GamerTag.itemName:setText( Engine.Localize( "WWWWWWWWWWWWWWWWW" ) )
	LUI.OverrideFunction_CallOriginalFirst( GamerTag, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 1 )
	end )
	self:addElement( GamerTag )
	self.GamerTag = GamerTag
	
	local ClanTag = CoD.PlayerCard_Label.new( menu, controller )
	ClanTag:setLeftRight( true, false, 59, 145 )
	ClanTag:setTopBottom( true, false, 21, 41 )
	ClanTag:setRGB( 1, 1, 1 )
	ClanTag.Panel:setAlpha( 0.6 )
	ClanTag.itemName:setText( Engine.Localize( "[TREY}" ) )
	LUI.OverrideFunction_CallOriginalFirst( ClanTag, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 1 )
	end )
	self:addElement( ClanTag )
	self.ClanTag = ClanTag
	
	local HeroBacking = LUI.UIImage.new()
	HeroBacking:setLeftRight( true, false, -2, 62 )
	HeroBacking:setTopBottom( true, false, -8, 64 )
	HeroBacking:setRGB( 1, 1, 1 )
	HeroBacking:setImage( RegisterImage( "uie_img_t7_hud_widget_playercard_playerbacking" ) )
	HeroBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( HeroBacking )
	self.HeroBacking = HeroBacking
	
	local TeamColor = LUI.UIImage.new()
	TeamColor:setLeftRight( true, false, -2, 62 )
	TeamColor:setTopBottom( true, false, 2, 42 )
	TeamColor:setRGB( ColorSet.FriendlyBlue.r, ColorSet.FriendlyBlue.g, ColorSet.FriendlyBlue.b )
	TeamColor:setAlpha( 0.59 )
	TeamColor:setImage( RegisterImage( "uie_img_t7_hud_widget_playercard_playerbackingelements" ) )
	TeamColor:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( TeamColor )
	self.TeamColor = TeamColor
	
	local HeroLobbyClientExtraCamRender = LUI.UIImage.new()
	HeroLobbyClientExtraCamRender:setLeftRight( true, false, 1, 59 )
	HeroLobbyClientExtraCamRender:setTopBottom( true, false, -9, 49 )
	HeroLobbyClientExtraCamRender:setRGB( 1, 1, 1 )
	HeroLobbyClientExtraCamRender:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( HeroLobbyClientExtraCamRender )
	self.HeroLobbyClientExtraCamRender = HeroLobbyClientExtraCamRender
	
	local BackingElement = LUI.UIImage.new()
	BackingElement:setLeftRight( true, false, 2, 58 )
	BackingElement:setTopBottom( true, false, 40, 64 )
	BackingElement:setRGB( 1, 1, 1 )
	BackingElement:setImage( RegisterImage( "uie_img_t7_hud_widget_playercard_lowerelement" ) )
	BackingElement:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( BackingElement )
	self.BackingElement = BackingElement
	
	local RankIcon = LUI.UIImage.new()
	RankIcon:setLeftRight( true, false, 30.66, 46.66 )
	RankIcon:setTopBottom( true, false, 44, 60 )
	RankIcon:setRGB( 1, 1, 1 )
	RankIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( RankIcon )
	self.RankIcon = RankIcon
	
	local Rank = LUI.UIText.new()
	Rank:setLeftRight( true, false, 10, 30 )
	Rank:setTopBottom( true, false, 42, 62 )
	Rank:setRGB( 1, 1, 1 )
	Rank:setText( Engine.Localize( "55" ) )
	Rank:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Rank:setLetterSpacing( 0.5 )
	Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Rank )
	self.Rank = Rank
	
	self.close = function ( self )
		self.GamerTag:close()
		self.ClanTag:close()
		CoD.PlayerCard.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

