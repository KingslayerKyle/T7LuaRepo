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
	self:setLeftRight( 0, 0, 0, 1740 )
	self:setTopBottom( 0, 0, 0, 780 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Leaderboard = CoD.Leaderboard.new( menu, controller )
	Leaderboard:setLeftRight( 0, 0, 31, 1201 )
	Leaderboard:setTopBottom( 0, 0, 23, 780 )
	Leaderboard.LeaderboardRows:setDataSource( "LeaderboardRows" )
	Leaderboard.LeaderboardEmptyText:setText( Engine.Localize( "MENU_LB_EMPTY" ) )
	Leaderboard:subscribeToGlobalModel( controller, "LeaderboardHeader", nil, function ( model )
		Leaderboard.LeaderboardHeader:setModel( model, controller )
	end )
	self:addElement( Leaderboard )
	self.Leaderboard = Leaderboard
	
	local PlayerProfileInfoWidget = CoD.Leaderboard_PlayerProfileInfoWidget.new( menu, controller )
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
	PlayerProfileInfoWidget:subscribeToModel( Engine.GetModel( DataSources.LeaderboardRows.getModel( controller ), "status" ), function ( model )
		menu:updateElementState( PlayerProfileInfoWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "status"
		} )
	end )
	PlayerProfileInfoWidget:subscribeToModel( Engine.GetModel( DataSources.LeaderboardRows.getModel( controller ), "totalCount" ), function ( model )
		menu:updateElementState( PlayerProfileInfoWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "totalCount"
		} )
	end )
	PlayerProfileInfoWidget:setLeftRight( 1, 1, -512, -32 )
	PlayerProfileInfoWidget:setTopBottom( 0, 0, 23.5, 446.5 )
	self:addElement( PlayerProfileInfoWidget )
	self.PlayerProfileInfoWidget = PlayerProfileInfoWidget
	
	local RankAndStatsWidget = CoD.Leaderboard_RankAndStatsWidget.new( menu, controller )
	RankAndStatsWidget:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f7_local0
				if not IsLeaderboardUpdating() and not IsLeaderboardEmpty() and not IsFreerunLeaderboard( controller ) then
					f7_local0 = not IsDOALeaderboard( controller )
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
		}
	} )
	RankAndStatsWidget:subscribeToModel( Engine.GetModel( DataSources.LeaderboardRows.getModel( controller ), "status" ), function ( model )
		menu:updateElementState( RankAndStatsWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "status"
		} )
	end )
	RankAndStatsWidget:subscribeToModel( Engine.GetModel( DataSources.LeaderboardRows.getModel( controller ), "totalCount" ), function ( model )
		menu:updateElementState( RankAndStatsWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "totalCount"
		} )
	end )
	RankAndStatsWidget:setLeftRight( 1, 1, -511, -31 )
	RankAndStatsWidget:setTopBottom( 1, 1, -323, -23 )
	self:addElement( RankAndStatsWidget )
	self.RankAndStatsWidget = RankAndStatsWidget
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( 0.5, 0.5, 354, 842 )
	StartMenuframenoBG0:setTopBottom( 0.5, 0.5, -370, 354 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local featlineleft0 = LUI.UIImage.new()
	featlineleft0:setLeftRight( 0, 0, 1469, 1475 )
	featlineleft0:setTopBottom( 0, 0, 198, 698 )
	featlineleft0:setZRot( -90 )
	featlineleft0:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	featlineleft0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( featlineleft0 )
	self.featlineleft0 = featlineleft0
	
	local featlineleft00 = LUI.UIImage.new()
	featlineleft00:setLeftRight( 0, 0, 1469, 1475 )
	featlineleft00:setTopBottom( 0, 0, 351, 851 )
	featlineleft00:setZRot( -90 )
	featlineleft00:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	featlineleft00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( featlineleft00 )
	self.featlineleft00 = featlineleft00
	
	PlayerProfileInfoWidget:linkToElementModel( Leaderboard.LeaderboardRows, "xuid", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PlayerProfileInfoWidget.emblem:setupPlayerEmblemByXUID( modelValue )
		end
	end )
	PlayerProfileInfoWidget:linkToElementModel( Leaderboard.LeaderboardRows, nil, false, function ( model )
		PlayerProfileInfoWidget.GamerCard:setModel( model, controller )
	end )
	PlayerProfileInfoWidget:linkToElementModel( Leaderboard.LeaderboardRows, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PlayerProfileInfoWidget.GamerTag.Label0:setText( Engine.Localize( modelValue ) )
		end
	end )
	RankAndStatsWidget:linkToElementModel( Leaderboard.LeaderboardRows, "rankIcon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RankAndStatsWidget.rankIcon.imgSolid:setImage( RegisterImage( GetRankIconLarge( modelValue ) ) )
		end
	end )
	RankAndStatsWidget:linkToElementModel( Leaderboard.LeaderboardRows, "rankIcon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RankAndStatsWidget.rankIcon.imgAdd:setImage( RegisterImage( GetRankIconLarge( modelValue ) ) )
		end
	end )
	RankAndStatsWidget:linkToElementModel( Leaderboard.LeaderboardRows, "plevel", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RankAndStatsWidget.rankText:setRGB( SetToParagonColorIfPrestigeMasterForLeaderboard( 255, 255, 255, modelValue ) )
		end
	end )
	RankAndStatsWidget:linkToElementModel( Leaderboard.LeaderboardRows, "rank", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RankAndStatsWidget.rankText.FELabelSubHeadingD0.Label0:setText( Engine.Localize( PrependLocalizedStringWithSeparator( "MENU_LEVEL_CAPS", " ", modelValue ) ) )
		end
	end )
	RankAndStatsWidget:linkToElementModel( Leaderboard.LeaderboardRows, "rankString", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RankAndStatsWidget.ListHeader0:setAlpha( HideIfEmptyString( modelValue ) )
		end
	end )
	RankAndStatsWidget:linkToElementModel( Leaderboard.LeaderboardRows, "rankString", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RankAndStatsWidget.ListHeader0.btnDisplayTextStroke:setText( Engine.Localize( modelValue ) )
		end
	end )
	RankAndStatsWidget:linkToElementModel( Leaderboard.LeaderboardRows, "stat0color", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RankAndStatsWidget.StatWidget1.StatText:setRGB( modelValue )
		end
	end )
	RankAndStatsWidget:linkToElementModel( Leaderboard.LeaderboardRows, "stat0", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RankAndStatsWidget.StatWidget1.StatText:setText( Engine.Localize( modelValue ) )
		end
	end )
	RankAndStatsWidget:linkToElementModel( Leaderboard.LeaderboardRows, "stat0label", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RankAndStatsWidget.StatWidget1.btnDisplayTextStroke:setText( Engine.Localize( modelValue ) )
		end
	end )
	RankAndStatsWidget:linkToElementModel( Leaderboard.LeaderboardRows, "stat1color", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RankAndStatsWidget.StatWidget2.StatText:setRGB( modelValue )
		end
	end )
	RankAndStatsWidget:linkToElementModel( Leaderboard.LeaderboardRows, "stat1", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RankAndStatsWidget.StatWidget2.StatText:setText( Engine.Localize( modelValue ) )
		end
	end )
	RankAndStatsWidget:linkToElementModel( Leaderboard.LeaderboardRows, "stat1label", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RankAndStatsWidget.StatWidget2.btnDisplayTextStroke:setText( Engine.Localize( modelValue ) )
		end
	end )
	RankAndStatsWidget:linkToElementModel( Leaderboard.LeaderboardRows, "stat2color", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RankAndStatsWidget.StatWidget3.StatText:setRGB( modelValue )
		end
	end )
	RankAndStatsWidget:linkToElementModel( Leaderboard.LeaderboardRows, "stat2", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RankAndStatsWidget.StatWidget3.StatText:setText( Engine.Localize( modelValue ) )
		end
	end )
	RankAndStatsWidget:linkToElementModel( Leaderboard.LeaderboardRows, "stat2label", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RankAndStatsWidget.StatWidget3.btnDisplayTextStroke:setText( Engine.Localize( modelValue ) )
		end
	end )
	Leaderboard.navigation = {
		right = PlayerProfileInfoWidget
	}
	PlayerProfileInfoWidget.navigation = {
		left = Leaderboard
	}
	self.resetProperties = function ()
		RankAndStatsWidget:completeAnimation()
		PlayerProfileInfoWidget:completeAnimation()
		RankAndStatsWidget:setAlpha( 1 )
		PlayerProfileInfoWidget:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
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
				self.resetProperties()
				self:setupElementClipCounter( 0 )
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
	self:subscribeToModel( Engine.GetModel( DataSources.LeaderboardRows.getModel( controller ), "status" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "status"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( DataSources.LeaderboardRows.getModel( controller ), "totalCount" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "totalCount"
		} )
	end )
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	Leaderboard.id = "Leaderboard"
	PlayerProfileInfoWidget.id = "PlayerProfileInfoWidget"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.Leaderboard:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Leaderboard:close()
		self.PlayerProfileInfoWidget:close()
		self.RankAndStatsWidget:close()
		self.StartMenuframenoBG0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

