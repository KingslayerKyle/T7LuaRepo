require( "ui.uieditor.widgets.HelperWidgets.TextWithBg" )
require( "ui.uieditor.widgets.CodCaster.CodCasterPlayerListHeaderObjectiveColumn" )

CoD.CodCasterPlayerListHeaderWidget = InheritFrom( LUI.UIElement )
CoD.CodCasterPlayerListHeaderWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CodCasterPlayerListHeaderWidget )
	self.id = "CodCasterPlayerListHeaderWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 308 )
	self:setTopBottom( true, false, 0, 25 )
	self.anyChildUsesUpdateState = true
	
	local whiteBG = LUI.UIImage.new()
	whiteBG:setLeftRight( true, true, 0, 0 )
	whiteBG:setTopBottom( true, true, 0, 0 )
	self:addElement( whiteBG )
	self.whiteBG = whiteBG
	
	local TeamName = LUI.UIText.new()
	TeamName:setLeftRight( true, false, 8.09, 200.41 )
	TeamName:setTopBottom( true, false, 5, 23 )
	TeamName:setRGB( 0, 0, 0 )
	TeamName:setText( Engine.Localize( "Team Name" ) )
	TeamName:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	TeamName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TeamName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TeamName )
	self.TeamName = TeamName
	
	local TeamColor = LUI.UIImage.new()
	TeamColor:setLeftRight( true, true, 0, 0 )
	TeamColor:setTopBottom( true, false, 3, -0.5 )
	self:addElement( TeamColor )
	self.TeamColor = TeamColor
	
	local TEMPScoreColumn2Header = CoD.TextWithBg.new( menu, controller )
	TEMPScoreColumn2Header:setLeftRight( false, true, -74.09, -49.09 )
	TEMPScoreColumn2Header:setTopBottom( false, false, -15, 17 )
	TEMPScoreColumn2Header:setAlpha( 0 )
	TEMPScoreColumn2Header.Bg:setRGB( 0.31, 0.31, 0.31 )
	TEMPScoreColumn2Header.Bg:setAlpha( 0 )
	TEMPScoreColumn2Header.Text:setRGB( 0.88, 0.89, 0.93 )
	TEMPScoreColumn2Header.Text:setAlpha( 0.7 )
	TEMPScoreColumn2Header.Text:setText( Engine.Localize( GetScoreboardColumnName( controller, 1, "Score" ) ) )
	TEMPScoreColumn2Header.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( TEMPScoreColumn2Header )
	self.TEMPScoreColumn2Header = TEMPScoreColumn2Header
	
	local TEMPScoreColumn3Header = CoD.TextWithBg.new( menu, controller )
	TEMPScoreColumn3Header:setLeftRight( false, true, -40.08, -0.08 )
	TEMPScoreColumn3Header:setTopBottom( false, false, -15, 17 )
	TEMPScoreColumn3Header:setAlpha( 0 )
	TEMPScoreColumn3Header.Bg:setRGB( 0.31, 0.31, 0.31 )
	TEMPScoreColumn3Header.Bg:setAlpha( 0 )
	TEMPScoreColumn3Header.Text:setRGB( 0.88, 0.89, 0.93 )
	TEMPScoreColumn3Header.Text:setAlpha( 0.7 )
	TEMPScoreColumn3Header.Text:setText( Engine.Localize( GetScoreboardColumnName( controller, 2, "Score" ) ) )
	TEMPScoreColumn3Header.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( TEMPScoreColumn3Header )
	self.TEMPScoreColumn3Header = TEMPScoreColumn3Header
	
	local KD = LUI.UIText.new()
	KD:setLeftRight( false, true, -107.59, -61.59 )
	KD:setTopBottom( true, false, 7.5, 23.5 )
	KD:setRGB( 0, 0, 0 )
	KD:setText( Engine.Localize( "MENU_KD_SHORT" ) )
	KD:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	KD:setLetterSpacing( 2 )
	KD:setLineSpacing( 5 )
	KD:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	KD:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( KD )
	self.KD = KD
	
	local ScoreColumn3Header = CoD.CodCasterPlayerListHeaderObjectiveColumn.new( menu, controller )
	ScoreColumn3Header:setLeftRight( false, true, -26, -6 )
	ScoreColumn3Header:setTopBottom( true, false, 3, 23 )
	self:addElement( ScoreColumn3Header )
	self.ScoreColumn3Header = ScoreColumn3Header
	
	local Killstreak = LUI.UIImage.new()
	Killstreak:setLeftRight( false, true, -58.59, -34.59 )
	Killstreak:setTopBottom( true, false, 2, 26 )
	Killstreak:setImage( RegisterImage( "uie_t7_codcaster_gamemode_killstreak" ) )
	self:addElement( Killstreak )
	self.Killstreak = Killstreak
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				TeamName:completeAnimation()
				self.TeamName:setAlpha( 1 )
				self.clipFinished( TeamName, {} )
				TeamColor:completeAnimation()
				self.TeamColor:setAlpha( 1 )
				self.clipFinished( TeamColor, {} )
			end
		},
		NonTeamBased = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				TeamName:completeAnimation()
				self.TeamName:setAlpha( 0 )
				self.clipFinished( TeamName, {} )
				TeamColor:completeAnimation()
				self.TeamColor:setAlpha( 0 )
				self.clipFinished( TeamColor, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "NonTeamBased",
			condition = function ( menu, element, event )
				return not IsGametypeTeambased()
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.TEMPScoreColumn2Header:close()
		element.TEMPScoreColumn3Header:close()
		element.ScoreColumn3Header:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

