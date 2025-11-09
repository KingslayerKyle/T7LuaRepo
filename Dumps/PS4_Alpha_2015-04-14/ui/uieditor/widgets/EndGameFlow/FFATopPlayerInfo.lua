require( "ui.uieditor.widgets.EndGameFlow.FFASideArrow" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.EndGameFlow.KillcamWidgetNumbers" )

CoD.FFATopPlayerInfo = InheritFrom( LUI.UIElement )
CoD.FFATopPlayerInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FFATopPlayerInfo )
	self.id = "FFATopPlayerInfo"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 692 )
	self:setTopBottom( true, false, 0, 143 )
	self.anyChildUsesUpdateState = true
	
	local FFASideArrow0 = CoD.FFASideArrow.new( menu, controller )
	FFASideArrow0:setLeftRight( true, false, 508, 700 )
	FFASideArrow0:setTopBottom( true, false, -1, 143 )
	FFASideArrow0:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( FFASideArrow0 )
	self.FFASideArrow0 = FFASideArrow0
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( menu, controller )
	LeftPanel:setLeftRight( true, false, -117.84, 510 )
	LeftPanel:setTopBottom( true, false, 0, 142 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local RibbonSolid = LUI.UIImage.new()
	RibbonSolid:setLeftRight( true, false, -118.84, -54.84 )
	RibbonSolid:setTopBottom( true, false, -1, 47 )
	RibbonSolid:setRGB( 0.64, 0.64, 0.64 )
	RibbonSolid:setImage( RegisterImage( "uie_t7_hud_mp_notifications_endgame_ribbon1" ) )
	RibbonSolid:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiplyinverse" ) )
	self:addElement( RibbonSolid )
	self.RibbonSolid = RibbonSolid
	
	local Ribbon = LUI.UIImage.new()
	Ribbon:setLeftRight( true, false, -118.84, -54.84 )
	Ribbon:setTopBottom( true, false, -1, 47 )
	Ribbon:setRGB( 1, 1, 1 )
	Ribbon:setImage( RegisterImage( "uie_t7_hud_mp_notifications_endgame_ribbon1" ) )
	Ribbon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Ribbon )
	self.Ribbon = Ribbon
	
	local Score0 = LUI.UITightText.new()
	Score0:setLeftRight( true, false, 548.07, 620.5 )
	Score0:setTopBottom( true, false, 40.25, 88.25 )
	Score0:setRGB( 1, 1, 1 )
	Score0:setAlpha( 0 )
	Score0:setText( Engine.Localize( "30" ) )
	Score0:setTTF( "fonts/default.ttf" )
	self:addElement( Score0 )
	self.Score0 = Score0
	
	local Gamertag = LUI.UIText.new()
	Gamertag:setLeftRight( true, false, 187.52, 442.52 )
	Gamertag:setTopBottom( true, false, 44.25, 72.25 )
	Gamertag:setRGB( 0.96, 0.96, 1 )
	Gamertag:setAlpha( 0.95 )
	Gamertag:setText( Engine.Localize( "WWWWWWWWWWWWWWWW" ) )
	Gamertag:setTTF( "fonts/Entovo.ttf" )
	Gamertag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Gamertag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Gamertag )
	self.Gamertag = Gamertag
	
	local ClanTag = LUI.UIText.new()
	ClanTag:setLeftRight( true, false, 187.52, 257.52 )
	ClanTag:setTopBottom( true, false, 77.25, 105.25 )
	ClanTag:setRGB( 0.96, 0.96, 1 )
	ClanTag:setAlpha( 0.95 )
	ClanTag:setText( Engine.Localize( "{3ARC}" ) )
	ClanTag:setTTF( "fonts/Entovo.ttf" )
	ClanTag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ClanTag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ClanTag )
	self.ClanTag = ClanTag
	
	local TempEmblem = LUI.UIImage.new()
	TempEmblem:setLeftRight( true, false, 65, 193 )
	TempEmblem:setTopBottom( true, false, 7.25, 135.25 )
	TempEmblem:setRGB( 1, 1, 1 )
	TempEmblem:setAlpha( 0 )
	TempEmblem:setImage( RegisterImage( "uie_headicon_dead" ) )
	TempEmblem:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( TempEmblem )
	self.TempEmblem = TempEmblem
	
	local Score = CoD.KillcamWidgetNumbers.new( menu, controller )
	Score:setLeftRight( false, false, 189.5, 309.5 )
	Score:setTopBottom( false, false, -41.38, 52.88 )
	Score:setRGB( 1, 1, 1 )
	Score:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Score:setShaderVector( 0, 0.2, 0, 0, 0 )
	Score:setShaderVector( 1, 0, 0, 0, 0 )
	Score:setShaderVector( 2, 0, 0, 0, 0 )
	Score:setShaderVector( 3, 0, 0, 0, 0 )
	Score:setShaderVector( 4, 0.24, 0.02, 0, 0 )
	Score.Numbers:setRGB( 0.59, 0.64, 0.74 )
	Score.Numbers:setText( Engine.Localize( "XX" ) )
	self:addElement( Score )
	self.Score = Score
	
	local emblem = LUI.UIImage.new()
	emblem:setLeftRight( true, false, -56.84, 175 )
	emblem:setTopBottom( true, false, 0, 142 )
	emblem:setRGB( 1, 1, 1 )
	emblem:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( emblem )
	self.emblem = emblem
	
	self.close = function ( self )
		self.FFASideArrow0:close()
		self.LeftPanel:close()
		self.Score:close()
		CoD.FFATopPlayerInfo.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

