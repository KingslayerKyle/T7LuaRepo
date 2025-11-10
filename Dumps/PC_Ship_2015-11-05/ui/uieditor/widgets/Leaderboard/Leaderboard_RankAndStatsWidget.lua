require( "ui.uieditor.widgets.Lobby.Common.FE_ImageA" )
require( "ui.uieditor.widgets.Lobby.Common.FE_SlideSubHeader" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ListHeader" )
require( "ui.uieditor.widgets.Leaderboard.Leaderboard_StatWidget" )

CoD.Leaderboard_RankAndStatsWidget = InheritFrom( LUI.UIElement )
CoD.Leaderboard_RankAndStatsWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Leaderboard_RankAndStatsWidget )
	self.id = "Leaderboard_RankAndStatsWidget"
	self.soundSet = "CAC_PrimaryWeapon"
	self:setLeftRight( true, false, 0, 320 )
	self:setTopBottom( true, false, 0, 200 )
	self.anyChildUsesUpdateState = true
	
	local rankIcon = CoD.FE_ImageA.new( menu, controller )
	rankIcon:setLeftRight( true, false, 4, 88 )
	rankIcon:setTopBottom( true, false, 3, 87 )
	self:addElement( rankIcon )
	self.rankIcon = rankIcon
	
	local rankText = CoD.FE_SlideSubHeader.new( menu, controller )
	rankText:setLeftRight( true, false, 99.9, 228.9 )
	rankText:setTopBottom( true, false, 45, 81 )
	rankText.FELabelSubHeadingD0.Label0:setText( Engine.Localize( PrependLocalizedStringWithSeparator( "MENU_LEVEL_CAPS", " ", "LEVEL 53" ) ) )
	self:addElement( rankText )
	self.rankText = rankText
	
	local ListHeader0 = CoD.FE_ListHeader.new( menu, controller )
	ListHeader0:setLeftRight( true, false, 100, 305 )
	ListHeader0:setTopBottom( true, false, 12.88, 40.88 )
	ListHeader0.btnDisplayTextStroke:setText( Engine.Localize( "RANK_" ) )
	ListHeader0.btnDisplayTextStroke:setShaderVector( 0, 0.06, 0, 0, 0 )
	ListHeader0.btnDisplayTextStroke:setShaderVector( 1, 0.02, 0, 0, 0 )
	ListHeader0.btnDisplayTextStroke:setShaderVector( 2, 1, 0, 0, 0 )
	ListHeader0.btnDisplayTextStroke:setLetterSpacing( 0.5 )
	self:addElement( ListHeader0 )
	self.ListHeader0 = ListHeader0
	
	local StatWidget1 = CoD.Leaderboard_StatWidget.new( menu, controller )
	StatWidget1:setLeftRight( true, false, 4, 104 )
	StatWidget1:setTopBottom( true, false, 100, 185 )
	StatWidget1.StatText:setText( Engine.Localize( "888888" ) )
	StatWidget1.btnDisplayTextStroke:setText( Engine.Localize( "FEATURED" ) )
	self:addElement( StatWidget1 )
	self.StatWidget1 = StatWidget1
	
	local StatWidget2 = CoD.Leaderboard_StatWidget.new( menu, controller )
	StatWidget2:setLeftRight( false, false, -50, 50 )
	StatWidget2:setTopBottom( true, false, 100, 185 )
	StatWidget2.StatText:setText( Engine.Localize( "888888" ) )
	StatWidget2.btnDisplayTextStroke:setText( Engine.Localize( "FEATURED" ) )
	StatWidget2:mergeStateConditions( {
		{
			stateName = "invisable",
			condition = function ( menu, element, event )
				return IsZMGlobalsLeaderboard( controller )
			end
		}
	} )
	self:addElement( StatWidget2 )
	self.StatWidget2 = StatWidget2
	
	local StatWidget3 = CoD.Leaderboard_StatWidget.new( menu, controller )
	StatWidget3:setLeftRight( false, true, -104, -4 )
	StatWidget3:setTopBottom( true, false, 100, 185 )
	StatWidget3.StatText:setText( Engine.Localize( "888888" ) )
	StatWidget3.btnDisplayTextStroke:setText( Engine.Localize( "FEATURED" ) )
	StatWidget3:mergeStateConditions( {
		{
			stateName = "invisable",
			condition = function ( menu, element, event )
				return IsZMGlobalsLeaderboard( controller )
			end
		}
	} )
	self:addElement( StatWidget3 )
	self.StatWidget3 = StatWidget3
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				rankIcon:completeAnimation()
				self.rankIcon:setAlpha( 0 )
				self.clipFinished( rankIcon, {} )
				rankText:completeAnimation()
				self.rankText:setAlpha( 0 )
				self.clipFinished( rankText, {} )
				ListHeader0:completeAnimation()
				self.ListHeader0:setAlpha( 0 )
				self.clipFinished( ListHeader0, {} )
				StatWidget1:completeAnimation()
				self.StatWidget1:setAlpha( 0 )
				self.clipFinished( StatWidget1, {} )
				StatWidget2:completeAnimation()
				self.StatWidget2:setAlpha( 0 )
				self.clipFinished( StatWidget2, {} )
				StatWidget3:completeAnimation()
				self.StatWidget3:setAlpha( 0 )
				self.clipFinished( StatWidget3, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				rankIcon:completeAnimation()
				self.rankIcon:setAlpha( 1 )
				self.clipFinished( rankIcon, {} )
				rankText:completeAnimation()
				self.rankText:setAlpha( 1 )
				self.clipFinished( rankText, {} )
				ListHeader0:completeAnimation()
				self.ListHeader0:setAlpha( 1 )
				self.clipFinished( ListHeader0, {} )
				StatWidget1:completeAnimation()
				self.StatWidget1:setAlpha( 1 )
				self.clipFinished( StatWidget1, {} )
				StatWidget2:completeAnimation()
				self.StatWidget2:setAlpha( 1 )
				self.clipFinished( StatWidget2, {} )
				StatWidget3:completeAnimation()
				self.StatWidget3:setAlpha( 1 )
				self.clipFinished( StatWidget3, {} )
			end
		},
		Freerun = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				rankIcon:completeAnimation()
				self.rankIcon:setAlpha( 0 )
				self.clipFinished( rankIcon, {} )
				rankText:completeAnimation()
				self.rankText:setAlpha( 0 )
				self.clipFinished( rankText, {} )
				ListHeader0:completeAnimation()
				self.ListHeader0:setAlpha( 0 )
				self.clipFinished( ListHeader0, {} )
				StatWidget1:completeAnimation()
				self.StatWidget1:setLeftRight( true, false, 4, 104 )
				self.StatWidget1:setTopBottom( true, false, 15, 100 )
				self.StatWidget1:setAlpha( 1 )
				self.clipFinished( StatWidget1, {} )
				StatWidget2:completeAnimation()
				self.StatWidget2:setLeftRight( false, false, -50, 50 )
				self.StatWidget2:setTopBottom( true, false, 15, 100 )
				self.StatWidget2:setAlpha( 1 )
				self.clipFinished( StatWidget2, {} )
				StatWidget3:completeAnimation()
				self.StatWidget3:setLeftRight( false, true, -104, -4 )
				self.StatWidget3:setTopBottom( true, false, 15, 100 )
				self.StatWidget3:setAlpha( 1 )
				self.clipFinished( StatWidget3, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.rankIcon:close()
		element.rankText:close()
		element.ListHeader0:close()
		element.StatWidget1:close()
		element.StatWidget2:close()
		element.StatWidget3:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

