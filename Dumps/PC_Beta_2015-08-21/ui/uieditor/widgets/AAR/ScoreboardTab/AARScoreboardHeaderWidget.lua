require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidgetMP_PanelContainer" )
require( "ui.uieditor.widgets.HelperWidgets.TextWithBg" )

CoD.AARScoreboardHeaderWidget = InheritFrom( LUI.UIElement )
CoD.AARScoreboardHeaderWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AARScoreboardHeaderWidget )
	self.id = "AARScoreboardHeaderWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 851 )
	self:setTopBottom( true, false, 0, 32 )
	self.anyChildUsesUpdateState = true
	
	local PanelAmmo = CoD.DamageWidgetMP_PanelContainer.new( menu, controller )
	PanelAmmo:setLeftRight( true, true, -3, 2 )
	PanelAmmo:setTopBottom( true, true, -1.33, 2.34 )
	PanelAmmo:setRGB( 0.23, 0.23, 0.23 )
	PanelAmmo:setZoom( -10 )
	PanelAmmo.PanelAmmo0:setShaderVector( 0, 30, 10, 0, 0 )
	self:addElement( PanelAmmo )
	self.PanelAmmo = PanelAmmo
	
	local GametypeAndMapName = LUI.UIText.new()
	GametypeAndMapName:setLeftRight( true, false, 7, 323 )
	GametypeAndMapName:setTopBottom( false, false, -10.5, 14.5 )
	GametypeAndMapName:setText( Engine.Localize( "MENU_SCOREBOARD_HEADER" ) )
	GametypeAndMapName:setTTF( "fonts/escom.ttf" )
	GametypeAndMapName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	GametypeAndMapName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( GametypeAndMapName )
	self.GametypeAndMapName = GametypeAndMapName
	
	local ScoreColumn1Header0 = CoD.TextWithBg.new( menu, controller )
	ScoreColumn1Header0:setLeftRight( false, false, -9.5, 77.5 )
	ScoreColumn1Header0:setTopBottom( true, false, 0, 32 )
	ScoreColumn1Header0:setAlpha( 0.8 )
	ScoreColumn1Header0.Bg:setRGB( 0.31, 0.31, 0.31 )
	ScoreColumn1Header0.Bg:setAlpha( 0 )
	ScoreColumn1Header0.Text:setText( Engine.Localize( "Score" ) )
	ScoreColumn1Header0.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( ScoreColumn1Header0 )
	self.ScoreColumn1Header0 = ScoreColumn1Header0
	
	local ScoreColumn2Header0 = CoD.TextWithBg.new( menu, controller )
	ScoreColumn2Header0:setLeftRight( false, false, 77.5, 164.5 )
	ScoreColumn2Header0:setTopBottom( true, false, 0, 32 )
	ScoreColumn2Header0:setAlpha( 0.8 )
	ScoreColumn2Header0.Bg:setRGB( 0.31, 0.31, 0.31 )
	ScoreColumn2Header0.Bg:setAlpha( 0 )
	ScoreColumn2Header0.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ScoreColumn2Header0:subscribeToGlobalModel( controller, "Scoreboard", "column2Header", function ( model )
		local column2Header = Engine.GetModelValue( model )
		if column2Header then
			ScoreColumn2Header0.Text:setText( Engine.Localize( column2Header ) )
		end
	end )
	self:addElement( ScoreColumn2Header0 )
	self.ScoreColumn2Header0 = ScoreColumn2Header0
	
	local ScoreColumn3Header0 = CoD.TextWithBg.new( menu, controller )
	ScoreColumn3Header0:setLeftRight( false, false, 164.5, 251.5 )
	ScoreColumn3Header0:setTopBottom( true, false, 0, 32 )
	ScoreColumn3Header0:setAlpha( 0.8 )
	ScoreColumn3Header0.Bg:setRGB( 0.31, 0.31, 0.31 )
	ScoreColumn3Header0.Bg:setAlpha( 0 )
	ScoreColumn3Header0.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ScoreColumn3Header0:subscribeToGlobalModel( controller, "Scoreboard", "column3Header", function ( model )
		local column3Header = Engine.GetModelValue( model )
		if column3Header then
			ScoreColumn3Header0.Text:setText( Engine.Localize( column3Header ) )
		end
	end )
	self:addElement( ScoreColumn3Header0 )
	self.ScoreColumn3Header0 = ScoreColumn3Header0
	
	local ScoreColumn4Header0 = CoD.TextWithBg.new( menu, controller )
	ScoreColumn4Header0:setLeftRight( false, false, 251.5, 338.5 )
	ScoreColumn4Header0:setTopBottom( true, false, 0, 32 )
	ScoreColumn4Header0:setAlpha( 0.8 )
	ScoreColumn4Header0.Bg:setRGB( 0.31, 0.31, 0.31 )
	ScoreColumn4Header0.Bg:setAlpha( 0 )
	ScoreColumn4Header0.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ScoreColumn4Header0:subscribeToGlobalModel( controller, "Scoreboard", "column4Header", function ( model )
		local column4Header = Engine.GetModelValue( model )
		if column4Header then
			ScoreColumn4Header0.Text:setText( Engine.Localize( column4Header ) )
		end
	end )
	self:addElement( ScoreColumn4Header0 )
	self.ScoreColumn4Header0 = ScoreColumn4Header0
	
	local ScoreColumn5Header0 = CoD.TextWithBg.new( menu, controller )
	ScoreColumn5Header0:setLeftRight( false, false, 338.5, 425.5 )
	ScoreColumn5Header0:setTopBottom( true, false, 0, 32 )
	ScoreColumn5Header0:setAlpha( 0.8 )
	ScoreColumn5Header0.Bg:setRGB( 0.31, 0.31, 0.31 )
	ScoreColumn5Header0.Bg:setAlpha( 0 )
	ScoreColumn5Header0.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ScoreColumn5Header0:subscribeToGlobalModel( controller, "Scoreboard", "column5Header", function ( model )
		local column5Header = Engine.GetModelValue( model )
		if column5Header then
			ScoreColumn5Header0.Text:setText( Engine.Localize( column5Header ) )
		end
	end )
	self:addElement( ScoreColumn5Header0 )
	self.ScoreColumn5Header0 = ScoreColumn5Header0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.PanelAmmo:close()
		element.ScoreColumn1Header0:close()
		element.ScoreColumn2Header0:close()
		element.ScoreColumn3Header0:close()
		element.ScoreColumn4Header0:close()
		element.ScoreColumn5Header0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

