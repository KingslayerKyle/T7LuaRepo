-- 00aede2404da369d1d139bab026a8a31
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Leaderboard.Leaderboard" )
require( "ui.uieditor.widgets.Leaderboard.Leaderboard_PlayerProfileInfoWidget" )
require( "ui.uieditor.widgets.Leaderboard.Leaderboard_RankAndStatsWidget" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

CoD.Leaderboard_GameModeFrame = InheritFrom( LUI.UIElement )
CoD.Leaderboard_GameModeFrame.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Leaderboard_GameModeFrame )
	self.id = "Leaderboard_GameModeFrame"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1160 )
	self:setTopBottom( true, false, 0, 520 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Leaderboard = CoD.Leaderboard.new( menu, controller )
	Leaderboard:setLeftRight( true, false, 20.5, 800.5 )
	Leaderboard:setTopBottom( true, false, 15.5, 520 )
	Leaderboard.LeaderboardRows:setDataSource( "LeaderboardRows" )
	Leaderboard.LeaderboardEmptyText:setText( Engine.Localize( "MENU_LB_EMPTY" ) )
	Leaderboard:subscribeToGlobalModel( controller, "LeaderboardHeader", nil, function ( model )
		Leaderboard.LeaderboardHeader:setModel( model, controller )
	end )
	self:addElement( Leaderboard )
	self.Leaderboard = Leaderboard
	
	local PlayerProfileInfoWidget = CoD.Leaderboard_PlayerProfileInfoWidget.new( menu, controller )
	PlayerProfileInfoWidget:setLeftRight( false, true, -341, -21 )
	PlayerProfileInfoWidget:setTopBottom( true, false, 15.5, 297.5 )
	PlayerProfileInfoWidget:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "PCacheBuffer",
			condition = function ( menu, element, event )
				local f4_local0
				if not IsLeaderboardUpdating() then
					f4_local0 = not IsLeaderboardEmpty()
				else
					f4_local0 = false
				end
				return f4_local0
			end
		}
	} )
	PlayerProfileInfoWidget:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "leaderboard.isUpdating" ), function ( model )
		menu:updateElementState( PlayerProfileInfoWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "leaderboard.isUpdating"
		} )
	end )
	PlayerProfileInfoWidget:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "leaderboard.totalResults" ), function ( model )
		menu:updateElementState( PlayerProfileInfoWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "leaderboard.totalResults"
		} )
	end )
	self:addElement( PlayerProfileInfoWidget )
	self.PlayerProfileInfoWidget = PlayerProfileInfoWidget
	
	local RankAndStatsWidget = CoD.Leaderboard_RankAndStatsWidget.new( menu, controller )
	RankAndStatsWidget:setLeftRight( false, true, -340.5, -20.5 )
	RankAndStatsWidget:setTopBottom( false, true, -215.5, -15.5 )
	RankAndStatsWidget:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f7_local0
				if not IsLeaderboardUpdating() and not IsLeaderboardEmpty() and not IsFreerunLeaderboard( controller ) and not IsDOALeaderboard( controller ) then
					f7_local0 = not IsCustomLeaderboard( controller )
				else
					f7_local0 = false
				end
				return f7_local0
			end
		},
		{
			stateName = "Freerun",
			condition = function ( menu, element, event )
				local f8_local0
				if not IsLeaderboardUpdating() and not IsLeaderboardEmpty() then
					f8_local0 = IsFreerunLeaderboard( controller )
				else
					f8_local0 = false
				end
				return f8_local0
			end
		},
		{
			stateName = "DOA",
			condition = function ( menu, element, event )
				local f9_local0
				if not IsLeaderboardUpdating() and not IsLeaderboardEmpty() then
					f9_local0 = IsDOALeaderboard( controller )
				else
					f9_local0 = false
				end
				return f9_local0
			end
		},
		{
			stateName = "Rankless",
			condition = function ( menu, element, event )
				local f10_local0
				if not IsLeaderboardUpdating() and not IsLeaderboardEmpty() then
					f10_local0 = IsCustomLeaderboard( controller )
				else
					f10_local0 = false
				end
				return f10_local0
			end
		}
	} )
	RankAndStatsWidget:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "leaderboard.isUpdating" ), function ( model )
		menu:updateElementState( RankAndStatsWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "leaderboard.isUpdating"
		} )
	end )
	RankAndStatsWidget:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "leaderboard.totalResults" ), function ( model )
		menu:updateElementState( RankAndStatsWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "leaderboard.totalResults"
		} )
	end )
	self:addElement( RankAndStatsWidget )
	self.RankAndStatsWidget = RankAndStatsWidget
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( false, false, 236.5, 561.5 )
	StartMenuframenoBG0:setTopBottom( false, false, -246.5, 236 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local featlineleft0 = LUI.UIImage.new()
	featlineleft0:setLeftRight( true, false, 979, 983 )
	featlineleft0:setTopBottom( true, false, 132, 465 )
	featlineleft0:setZRot( -90 )
	featlineleft0:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	featlineleft0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( featlineleft0 )
	self.featlineleft0 = featlineleft0
	
	local featlineleft00 = LUI.UIImage.new()
	featlineleft00:setLeftRight( true, false, 979, 983 )
	featlineleft00:setTopBottom( true, false, 234, 567 )
	featlineleft00:setZRot( -90 )
	featlineleft00:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	featlineleft00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( featlineleft00 )
	self.featlineleft00 = featlineleft00
	
	PlayerProfileInfoWidget:linkToElementModel( Leaderboard.LeaderboardRows, "xuid", true, function ( model )
		local xuid = Engine.GetModelValue( model )
		if xuid then
			PlayerProfileInfoWidget.emblem:setupPlayerEmblemByXUID( xuid )
		end
	end )
	PlayerProfileInfoWidget:linkToElementModel( Leaderboard.LeaderboardRows, nil, false, function ( model )
		PlayerProfileInfoWidget.GamerCard:setModel( model, controller )
	end )
	PlayerProfileInfoWidget:linkToElementModel( Leaderboard.LeaderboardRows, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			PlayerProfileInfoWidget.GamerTag.Label0:setText( Engine.Localize( name ) )
		end
	end )
	RankAndStatsWidget:linkToElementModel( Leaderboard.LeaderboardRows, "rankIcon", true, function ( model )
		local rankIcon = Engine.GetModelValue( model )
		if rankIcon then
			RankAndStatsWidget.rankIcon.imgSolid:setImage( RegisterImage( GetRankIconLarge( rankIcon ) ) )
		end
	end )
	RankAndStatsWidget:linkToElementModel( Leaderboard.LeaderboardRows, "rankIcon", true, function ( model )
		local rankIcon = Engine.GetModelValue( model )
		if rankIcon then
			RankAndStatsWidget.rankIcon.imgAdd:setImage( RegisterImage( GetRankIconLarge( rankIcon ) ) )
		end
	end )
	RankAndStatsWidget:linkToElementModel( Leaderboard.LeaderboardRows, "plevel", true, function ( model )
		local plevel = Engine.GetModelValue( model )
		if plevel then
			RankAndStatsWidget.rankText:setRGB( SetToParagonColorIfPrestigeMasterForLeaderboard( 255, 255, 255, plevel ) )
		end
	end )
	RankAndStatsWidget:linkToElementModel( Leaderboard.LeaderboardRows, "rank", true, function ( model )
		local rank = Engine.GetModelValue( model )
		if rank then
			RankAndStatsWidget.rankText.FELabelSubHeadingD0.Label0:setText( Engine.Localize( PrependLocalizedStringWithSeparator( "MENU_LEVEL_CAPS", " ", rank ) ) )
		end
	end )
	RankAndStatsWidget:linkToElementModel( Leaderboard.LeaderboardRows, "rankString", true, function ( model )
		local rankString = Engine.GetModelValue( model )
		if rankString then
			RankAndStatsWidget.ListHeader0:setAlpha( HideIfEmptyString( rankString ) )
		end
	end )
	RankAndStatsWidget:linkToElementModel( Leaderboard.LeaderboardRows, "rankString", true, function ( model )
		local rankString = Engine.GetModelValue( model )
		if rankString then
			RankAndStatsWidget.ListHeader0.btnDisplayTextStroke:setText( Engine.Localize( rankString ) )
		end
	end )
	RankAndStatsWidget:linkToElementModel( Leaderboard.LeaderboardRows, "stat0color", true, function ( model )
		local stat0color = Engine.GetModelValue( model )
		if stat0color then
			RankAndStatsWidget.StatWidget1.StatText:setRGB( stat0color )
		end
	end )
	RankAndStatsWidget:linkToElementModel( Leaderboard.LeaderboardRows, "stat0", true, function ( model )
		local stat0 = Engine.GetModelValue( model )
		if stat0 then
			RankAndStatsWidget.StatWidget1.StatText:setText( Engine.Localize( stat0 ) )
		end
	end )
	RankAndStatsWidget:linkToElementModel( Leaderboard.LeaderboardRows, "stat0label", true, function ( model )
		local stat0label = Engine.GetModelValue( model )
		if stat0label then
			RankAndStatsWidget.StatWidget1.btnDisplayTextStroke:setText( Engine.Localize( stat0label ) )
		end
	end )
	RankAndStatsWidget:linkToElementModel( Leaderboard.LeaderboardRows, "stat1color", true, function ( model )
		local stat1color = Engine.GetModelValue( model )
		if stat1color then
			RankAndStatsWidget.StatWidget2.StatText:setRGB( stat1color )
		end
	end )
	RankAndStatsWidget:linkToElementModel( Leaderboard.LeaderboardRows, "stat1", true, function ( model )
		local stat1 = Engine.GetModelValue( model )
		if stat1 then
			RankAndStatsWidget.StatWidget2.StatText:setText( Engine.Localize( stat1 ) )
		end
	end )
	RankAndStatsWidget:linkToElementModel( Leaderboard.LeaderboardRows, "stat1label", true, function ( model )
		local stat1label = Engine.GetModelValue( model )
		if stat1label then
			RankAndStatsWidget.StatWidget2.btnDisplayTextStroke:setText( Engine.Localize( stat1label ) )
		end
	end )
	RankAndStatsWidget:linkToElementModel( Leaderboard.LeaderboardRows, "stat2color", true, function ( model )
		local stat2color = Engine.GetModelValue( model )
		if stat2color then
			RankAndStatsWidget.StatWidget3.StatText:setRGB( stat2color )
		end
	end )
	RankAndStatsWidget:linkToElementModel( Leaderboard.LeaderboardRows, "stat2", true, function ( model )
		local stat2 = Engine.GetModelValue( model )
		if stat2 then
			RankAndStatsWidget.StatWidget3.StatText:setText( Engine.Localize( stat2 ) )
		end
	end )
	RankAndStatsWidget:linkToElementModel( Leaderboard.LeaderboardRows, "stat2label", true, function ( model )
		local stat2label = Engine.GetModelValue( model )
		if stat2label then
			RankAndStatsWidget.StatWidget3.btnDisplayTextStroke:setText( Engine.Localize( stat2label ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				PlayerProfileInfoWidget:completeAnimation()
				self.PlayerProfileInfoWidget:setAlpha( 0 )
				self.clipFinished( PlayerProfileInfoWidget, {} )
				RankAndStatsWidget:completeAnimation()
				self.RankAndStatsWidget:setAlpha( 0 )
				self.clipFinished( RankAndStatsWidget, {} )
			end
		},
		ShowInfo = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				PlayerProfileInfoWidget:completeAnimation()
				self.PlayerProfileInfoWidget:setAlpha( 1 )
				self.clipFinished( PlayerProfileInfoWidget, {} )
				RankAndStatsWidget:completeAnimation()
				self.RankAndStatsWidget:setAlpha( 1 )
				self.clipFinished( RankAndStatsWidget, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "ShowInfo",
			condition = function ( menu, element, event )
				local f33_local0
				if not IsLeaderboardUpdating() then
					f33_local0 = not IsLeaderboardEmpty()
				else
					f33_local0 = false
				end
				return f33_local0
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "leaderboard.isUpdating" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "leaderboard.isUpdating"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "leaderboard.totalResults" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "leaderboard.totalResults"
		} )
	end )
	Leaderboard.id = "Leaderboard"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.Leaderboard:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Leaderboard:close()
		element.PlayerProfileInfoWidget:close()
		element.RankAndStatsWidget:close()
		element.StartMenuframenoBG0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

