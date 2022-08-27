-- d13fa0b6bf6960a71703d160da75f7ab
-- This hash is used for caching, delete to decompile the file again

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
	rankText.FELabelSubHeadingD0.Label0:setText( Engine.Localize( PrependLocalizedStringWithSeparator( "MENU_LEVEL_CAPS", " ", "" ) ) )
	self:addElement( rankText )
	self.rankText = rankText
	
	local ListHeader0 = CoD.FE_ListHeader.new( menu, controller )
	ListHeader0:setLeftRight( true, false, 100, 305 )
	ListHeader0:setTopBottom( true, false, 12.88, 40.88 )
	ListHeader0.btnDisplayTextStroke:setText( "" )
	ListHeader0.btnDisplayTextStroke:setShaderVector( 0, 0.06, 0, 0, 0 )
	ListHeader0.btnDisplayTextStroke:setShaderVector( 1, 0.02, 0, 0, 0 )
	ListHeader0.btnDisplayTextStroke:setShaderVector( 2, 1, 0, 0, 0 )
	ListHeader0.btnDisplayTextStroke:setLetterSpacing( 0.5 )
	self:addElement( ListHeader0 )
	self.ListHeader0 = ListHeader0
	
	local StatWidget1 = CoD.Leaderboard_StatWidget.new( menu, controller )
	StatWidget1:setLeftRight( true, false, 4, 104 )
	StatWidget1:setTopBottom( true, false, 100, 185 )
	StatWidget1.StatText:setText( "" )
	StatWidget1.btnDisplayTextStroke:setText( "" )
	StatWidget1:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:addElement( StatWidget1 )
	self.StatWidget1 = StatWidget1
	
	local StatWidget2 = CoD.Leaderboard_StatWidget.new( menu, controller )
	StatWidget2:setLeftRight( false, false, -50, 50 )
	StatWidget2:setTopBottom( true, false, 100, 185 )
	StatWidget2.StatText:setText( "" )
	StatWidget2.btnDisplayTextStroke:setText( "" )
	StatWidget2:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return IsGlobalModelValueLessThan( controller, "leaderboard.header.numDataColumns", 2 )
			end
		}
	} )
	StatWidget2:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "leaderboard.header.numDataColumns" ), function ( model )
		menu:updateElementState( StatWidget2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "leaderboard.header.numDataColumns"
		} )
	end )
	self:addElement( StatWidget2 )
	self.StatWidget2 = StatWidget2
	
	local StatWidget3 = CoD.Leaderboard_StatWidget.new( menu, controller )
	StatWidget3:setLeftRight( false, true, -104, -4 )
	StatWidget3:setTopBottom( true, false, 100, 185 )
	StatWidget3.StatText:setText( "" )
	StatWidget3.btnDisplayTextStroke:setText( "" )
	StatWidget3:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return IsGlobalModelValueLessThan( controller, "leaderboard.header.numDataColumns", 3 )
			end
		}
	} )
	StatWidget3:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "leaderboard.header.numDataColumns" ), function ( model )
		menu:updateElementState( StatWidget3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "leaderboard.header.numDataColumns"
		} )
	end )
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
				self.StatWidget1:setTopBottom( true, false, 2, 87 )
				self.StatWidget1:setAlpha( 1 )
				self.clipFinished( StatWidget1, {} )
				StatWidget2:completeAnimation()
				self.StatWidget2:setLeftRight( false, false, -50, 50 )
				self.StatWidget2:setTopBottom( true, false, 2, 87 )
				self.StatWidget2:setAlpha( 1 )
				self.clipFinished( StatWidget2, {} )
				StatWidget3:completeAnimation()
				self.StatWidget3:setLeftRight( false, true, -104, -4 )
				self.StatWidget3:setTopBottom( true, false, 2, 87 )
				self.StatWidget3:setAlpha( 1 )
				self.clipFinished( StatWidget3, {} )
			end
		},
		DOA = {
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
				self.StatWidget1:setTopBottom( true, false, 2, 87 )
				self.StatWidget1:setAlpha( 1 )
				self.clipFinished( StatWidget1, {} )
				StatWidget2:completeAnimation()
				self.StatWidget2:setLeftRight( false, false, -50, 50 )
				self.StatWidget2:setTopBottom( true, false, 2, 87 )
				self.StatWidget2:setAlpha( 1 )
				self.clipFinished( StatWidget2, {} )
				StatWidget3:completeAnimation()
				self.StatWidget3:setLeftRight( false, true, -104, -4 )
				self.StatWidget3:setTopBottom( true, false, 2, 87 )
				self.StatWidget3:setAlpha( 1 )
				self.clipFinished( StatWidget3, {} )
			end
		},
		Rankless = {
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
				self.StatWidget1:setTopBottom( true, false, 2, 87 )
				self.StatWidget1:setAlpha( 1 )
				self.clipFinished( StatWidget1, {} )
				StatWidget2:completeAnimation()
				self.StatWidget2:setLeftRight( false, false, -50, 50 )
				self.StatWidget2:setTopBottom( true, false, 2, 87 )
				self.StatWidget2:setAlpha( 1 )
				self.clipFinished( StatWidget2, {} )
				StatWidget3:completeAnimation()
				self.StatWidget3:setLeftRight( false, true, -104, -4 )
				self.StatWidget3:setTopBottom( true, false, 2, 87 )
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

