-- 6fe435dde80aa99f21bf96d3db7c01e6
-- This hash is used for caching, delete to decompile the file again

CoD.WinLossRatioWidget = InheritFrom( LUI.UIElement )
CoD.WinLossRatioWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WinLossRatioWidget )
	self.id = "WinLossRatioWidget"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 192 )
	self:setTopBottom( true, false, 0, 192 )
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, false, -39, 231 )
	Glow:setTopBottom( true, false, -39, 231 )
	Glow:setRGB( 0.24, 0.24, 0.26 )
	Glow:setAlpha( 0.4 )
	Glow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local LossesBg = LUI.UIImage.new()
	LossesBg:setLeftRight( true, false, 96, 144 )
	LossesBg:setTopBottom( true, false, 37.5, 85.5 )
	LossesBg:setRGB( 0.24, 0.24, 0.26 )
	LossesBg:setAlpha( 0.4 )
	self:addElement( LossesBg )
	self.LossesBg = LossesBg
	
	local WinsBg = LUI.UIImage.new()
	WinsBg:setLeftRight( true, false, 48, 96 )
	WinsBg:setTopBottom( true, false, 37.5, 85.5 )
	WinsBg:setRGB( 0.95, 0.91, 0.11 )
	WinsBg:setAlpha( 0.85 )
	self:addElement( WinsBg )
	self.WinsBg = WinsBg
	
	local WinsAbbr = LUI.UIText.new()
	WinsAbbr:setLeftRight( true, false, 48, 96 )
	WinsAbbr:setTopBottom( true, false, 39.5, 61.5 )
	WinsAbbr:setRGB( 0, 0, 0 )
	WinsAbbr:setAlpha( 0.77 )
	WinsAbbr:setText( Engine.Localize( "MPUI_AAR_WINS_ABBREV" ) )
	WinsAbbr:setTTF( "fonts/escom.ttf" )
	WinsAbbr:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	WinsAbbr:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( WinsAbbr )
	self.WinsAbbr = WinsAbbr
	
	local TotalWins = LUI.UIText.new()
	TotalWins:setLeftRight( true, false, 48, 96 )
	TotalWins:setTopBottom( true, false, 61.5, 83.5 )
	TotalWins:setRGB( 0, 0, 0 )
	TotalWins:setText( Engine.Localize( "116" ) )
	TotalWins:setTTF( "fonts/escom.ttf" )
	TotalWins:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TotalWins:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TotalWins )
	self.TotalWins = TotalWins
	
	local LossesAbbr = LUI.UIText.new()
	LossesAbbr:setLeftRight( true, false, 96, 144 )
	LossesAbbr:setTopBottom( true, false, 39.5, 61.5 )
	LossesAbbr:setAlpha( 0.75 )
	LossesAbbr:setText( Engine.Localize( "MPUI_AAR_LOSSES_ABBREV" ) )
	LossesAbbr:setTTF( "fonts/escom.ttf" )
	LossesAbbr:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	LossesAbbr:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( LossesAbbr )
	self.LossesAbbr = LossesAbbr
	
	local TotalLosses = LUI.UIText.new()
	TotalLosses:setLeftRight( true, false, 96, 144 )
	TotalLosses:setTopBottom( true, false, 61.5, 83.5 )
	TotalLosses:setText( Engine.Localize( "90" ) )
	TotalLosses:setTTF( "fonts/escom.ttf" )
	TotalLosses:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TotalLosses:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TotalLosses )
	self.TotalLosses = TotalLosses
	
	local WinsRing = LUI.UIImage.new()
	WinsRing:setLeftRight( true, false, 0, 192 )
	WinsRing:setTopBottom( true, false, 0, 192 )
	WinsRing:setRGB( 0.95, 0.91, 0.11 )
	WinsRing:setImage( RegisterImage( "uie_t7_menu_aar_whiteringback" ) )
	self:addElement( WinsRing )
	self.WinsRing = WinsRing
	
	local LossesRing = LUI.UIImage.new()
	LossesRing:setLeftRight( true, false, 0, 192 )
	LossesRing:setTopBottom( true, false, 0, 192 )
	LossesRing:setRGB( 0.15, 0.15, 0.15 )
	LossesRing:setImage( RegisterImage( "uie_t7_menu_aar_whiteringfore" ) )
	LossesRing:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	LossesRing:setShaderVector( 0, 0.37, 0, 0, 0 )
	LossesRing:setShaderVector( 1, 0.5, 0, 0, 0 )
	LossesRing:setShaderVector( 2, 0.5, 0, 0, 0 )
	LossesRing:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( LossesRing )
	self.LossesRing = LossesRing
	
	local Hex0 = LUI.UIImage.new()
	Hex0:setLeftRight( true, false, 50.58, 141.42 )
	Hex0:setTopBottom( true, false, 89.62, 171.38 )
	Hex0:setZRot( 90 )
	Hex0:setImage( RegisterImage( "uie_t7_mp_menu_startflow_hexlarge" ) )
	Hex0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Hex0 )
	self.Hex0 = Hex0
	
	local WinLossRatio = LUI.UIText.new()
	WinLossRatio:setLeftRight( true, false, 48, 144 )
	WinLossRatio:setTopBottom( true, false, 127.5, 152.5 )
	WinLossRatio:setAlpha( 0.85 )
	WinLossRatio:setText( Engine.Localize( "1.28" ) )
	WinLossRatio:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	WinLossRatio:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	WinLossRatio:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( WinLossRatio )
	self.WinLossRatio = WinLossRatio
	
	local RatioLabel = LUI.UIText.new()
	RatioLabel:setLeftRight( true, false, 48, 144 )
	RatioLabel:setTopBottom( true, false, 109.5, 131.5 )
	RatioLabel:setAlpha( 0.75 )
	RatioLabel:setText( Engine.Localize( "MPUI_RATIO_CAPS" ) )
	RatioLabel:setTTF( "fonts/escom.ttf" )
	RatioLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	RatioLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( RatioLabel )
	self.RatioLabel = RatioLabel
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

