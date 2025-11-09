require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.AAR_PT_Numbers" )

CoD.ScoreboardFactionWidget = InheritFrom( LUI.UIElement )
CoD.ScoreboardFactionWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.ScoreboardFactionWidget )
	self.id = "ScoreboardFactionWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 234 )
	self:setTopBottom( true, false, 0, 84 )
	self.anyChildUsesUpdateState = true
	
	local Panel = CoD.FE_ButtonPanelShaderContainer.new( menu, controller )
	Panel:setLeftRight( true, true, 0, 0 )
	Panel:setTopBottom( true, true, 0, 0 )
	Panel:setRGB( 0.56, 0.56, 0.56 )
	Panel.FEButtonPanel:setShaderVector( 0, 30, 0, 0, 0 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local FactionIcon = LUI.UIImage.new()
	FactionIcon:setLeftRight( false, true, -152.02, 24.98 )
	FactionIcon:setTopBottom( true, false, -58, 119 )
	FactionIcon:setRGB( 1, 1, 1 )
	FactionIcon:setAlpha( 0.39 )
	FactionIcon:setImage( RegisterImage( "uie_t7_mp_hud_faction_icon_faction1" ) )
	FactionIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( FactionIcon )
	self.FactionIcon = FactionIcon
	
	local Score = LUI.UIText.new()
	Score:setLeftRight( true, false, 9, 89 )
	Score:setTopBottom( true, false, 0, 48 )
	Score:setRGB( 1, 1, 1 )
	Score:setAlpha( 0 )
	Score:setText( Engine.Localize( "200" ) )
	Score:setTTF( "fonts/default.ttf" )
	Score:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Score:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Score )
	self.Score = Score
	
	local FactionName = LUI.UIText.new()
	FactionName:setLeftRight( true, false, 8.98, 163.02 )
	FactionName:setTopBottom( true, false, 51.5, 70.5 )
	FactionName:setRGB( 0.88, 0.9, 0.93 )
	FactionName:setText( Engine.Localize( "MPUI_AXIS_CAPS" ) )
	FactionName:setTTF( "fonts/Entovo.ttf" )
	FactionName:setLetterSpacing( 1.9 )
	FactionName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	FactionName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( FactionName )
	self.FactionName = FactionName
	
	local Score0 = CoD.AAR_PT_Numbers.new( menu, controller )
	Score0:setLeftRight( true, false, -12, 213 )
	Score0:setTopBottom( true, false, -0.05, 55 )
	Score0:setRGB( 1, 1, 1 )
	Score0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Score0:setShaderVector( 0, 0.2, 0, 0, 0 )
	Score0:setShaderVector( 1, 0, 0, 0, 0 )
	Score0:setShaderVector( 2, 0, 0, 0, 0 )
	Score0:setShaderVector( 3, 0, 0, 0, 0 )
	Score0:setShaderVector( 4, 0.24, 0.02, 0, 0 )
	Score0.Numbers:setRGB( 0.72, 0.75, 0.82 )
	Score0.Numbers:setText( Engine.Localize( "2150" ) )
	self:addElement( Score0 )
	self.Score0 = Score0
	
	self.close = function ( self )
		self.Panel:close()
		self.Score0:close()
		CoD.ScoreboardFactionWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

