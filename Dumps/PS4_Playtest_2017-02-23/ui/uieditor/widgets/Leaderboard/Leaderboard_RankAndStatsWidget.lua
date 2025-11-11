require( "ui.uieditor.widgets.Leaderboard.Leaderboard_StatWidget" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ImageA" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ListHeader" )
require( "ui.uieditor.widgets.Lobby.Common.FE_SlideSubHeader" )

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
	self:setLeftRight( 0, 0, 0, 480 )
	self:setTopBottom( 0, 0, 0, 300 )
	self.anyChildUsesUpdateState = true
	
	local rankIcon = CoD.FE_ImageA.new( menu, controller )
	rankIcon:setLeftRight( 0, 0, 6, 132 )
	rankIcon:setTopBottom( 0, 0, 5, 131 )
	self:addElement( rankIcon )
	self.rankIcon = rankIcon
	
	local rankText = CoD.FE_SlideSubHeader.new( menu, controller )
	rankText:setLeftRight( 0, 0, 150, 344 )
	rankText:setTopBottom( 0, 0, 67, 121 )
	rankText.FELabelSubHeadingD0.Label0:setText( Engine.Localize( PrependLocalizedStringWithSeparator( "MENU_LEVEL_CAPS", " ", "LEVEL 53" ) ) )
	self:addElement( rankText )
	self.rankText = rankText
	
	local ListHeader0 = CoD.FE_ListHeader.new( menu, controller )
	ListHeader0:setLeftRight( 0, 0, 150, 458 )
	ListHeader0:setTopBottom( 0, 0, 19, 61 )
	ListHeader0.btnDisplayTextStroke:setText( Engine.Localize( "RANK_" ) )
	ListHeader0.btnDisplayTextStroke:setShaderVector( 0, 0.06, 0, 0, 0 )
	ListHeader0.btnDisplayTextStroke:setShaderVector( 1, 0.02, 0, 0, 0 )
	ListHeader0.btnDisplayTextStroke:setShaderVector( 2, 1, 0, 0, 0 )
	ListHeader0.btnDisplayTextStroke:setLetterSpacing( 0.5 )
	self:addElement( ListHeader0 )
	self.ListHeader0 = ListHeader0
	
	local StatWidget1 = CoD.Leaderboard_StatWidget.new( menu, controller )
	StatWidget1:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	StatWidget1:setLeftRight( 0, 0, 6, 156 )
	StatWidget1:setTopBottom( 0, 0, 150, 278 )
	StatWidget1.StatText:setText( Engine.Localize( "888888" ) )
	StatWidget1.btnDisplayTextStroke:setText( Engine.Localize( "FEATURED" ) )
	self:addElement( StatWidget1 )
	self.StatWidget1 = StatWidget1
	
	local StatWidget2 = CoD.Leaderboard_StatWidget.new( menu, controller )
	StatWidget2:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return IsGlobalDataSourceModelValueLessThan( controller, "LeaderboardHeader", "numDataColumns", 2 )
			end
		}
	} )
	StatWidget2:subscribeToModel( Engine.GetModel( DataSources.LeaderboardHeader.getModel( controller ), "numDataColumns" ), function ( model )
		menu:updateElementState( StatWidget2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "numDataColumns"
		} )
	end )
	StatWidget2:setLeftRight( 0.5, 0.5, -75, 75 )
	StatWidget2:setTopBottom( 0, 0, 150, 278 )
	StatWidget2.StatText:setText( Engine.Localize( "888888" ) )
	StatWidget2.btnDisplayTextStroke:setText( Engine.Localize( "FEATURED" ) )
	self:addElement( StatWidget2 )
	self.StatWidget2 = StatWidget2
	
	local StatWidget3 = CoD.Leaderboard_StatWidget.new( menu, controller )
	StatWidget3:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return IsGlobalDataSourceModelValueLessThan( controller, "LeaderboardHeader", "numDataColumns", 3 )
			end
		}
	} )
	StatWidget3:subscribeToModel( Engine.GetModel( DataSources.LeaderboardHeader.getModel( controller ), "numDataColumns" ), function ( model )
		menu:updateElementState( StatWidget3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "numDataColumns"
		} )
	end )
	StatWidget3:setLeftRight( 1, 1, -156, -6 )
	StatWidget3:setTopBottom( 0, 0, 150, 278 )
	StatWidget3.StatText:setText( Engine.Localize( "888888" ) )
	StatWidget3.btnDisplayTextStroke:setText( Engine.Localize( "FEATURED" ) )
	self:addElement( StatWidget3 )
	self.StatWidget3 = StatWidget3
	
	self.resetProperties = function ()
		rankText:completeAnimation()
		ListHeader0:completeAnimation()
		rankIcon:completeAnimation()
		StatWidget1:completeAnimation()
		StatWidget2:completeAnimation()
		StatWidget3:completeAnimation()
		rankText:setAlpha( 1 )
		ListHeader0:setAlpha( 1 )
		rankIcon:setAlpha( 1 )
		StatWidget1:setLeftRight( 0, 0, 6, 156 )
		StatWidget1:setTopBottom( 0, 0, 150, 278 )
		StatWidget1:setAlpha( 1 )
		StatWidget2:setLeftRight( 0.5, 0.5, -75, 75 )
		StatWidget2:setTopBottom( 0, 0, 150, 278 )
		StatWidget2:setAlpha( 1 )
		StatWidget3:setLeftRight( 1, 1, -156, -6 )
		StatWidget3:setTopBottom( 0, 0, 150, 278 )
		StatWidget3:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
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
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Freerun = {
			DefaultClip = function ()
				self.resetProperties()
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
				self.StatWidget1:setLeftRight( 0, 0, 6, 156 )
				self.StatWidget1:setTopBottom( 0, 0, 3, 131 )
				self.clipFinished( StatWidget1, {} )
				StatWidget2:completeAnimation()
				self.StatWidget2:setLeftRight( 0.5, 0.5, -75, 75 )
				self.StatWidget2:setTopBottom( 0, 0, 3, 131 )
				self.clipFinished( StatWidget2, {} )
				StatWidget3:completeAnimation()
				self.StatWidget3:setLeftRight( 1, 1, -156, -6 )
				self.StatWidget3:setTopBottom( 0, 0, 3, 131 )
				self.clipFinished( StatWidget3, {} )
			end
		},
		DOA = {
			DefaultClip = function ()
				self.resetProperties()
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
				self.StatWidget1:setLeftRight( 0, 0, 6, 156 )
				self.StatWidget1:setTopBottom( 0, 0, 3, 131 )
				self.clipFinished( StatWidget1, {} )
				StatWidget2:completeAnimation()
				self.StatWidget2:setLeftRight( 0.5, 0.5, -75, 75 )
				self.StatWidget2:setTopBottom( 0, 0, 3, 131 )
				self.clipFinished( StatWidget2, {} )
				StatWidget3:completeAnimation()
				self.StatWidget3:setLeftRight( 1, 1, -156, -6 )
				self.StatWidget3:setTopBottom( 0, 0, 3, 131 )
				self.clipFinished( StatWidget3, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.rankIcon:close()
		self.rankText:close()
		self.ListHeader0:close()
		self.StatWidget1:close()
		self.StatWidget2:close()
		self.StatWidget3:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

