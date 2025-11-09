require( "ui.uieditor.widgets.Arena.ArenaStar" )

CoD.ArenaRankSmall = InheritFrom( LUI.UIElement )
CoD.ArenaRankSmall.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ArenaRankSmall )
	self.id = "ArenaRankSmall"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 110 )
	self:setTopBottom( true, false, 0, 90 )
	self.anyChildUsesUpdateState = true
	
	local rankIcon = LUI.UIImage.new()
	rankIcon:setLeftRight( true, false, 10, 79 )
	rankIcon:setTopBottom( true, false, 5.5, 74.5 )
	rankIcon:setImage( RegisterImage( "uie_t7_hud_arena_rank_10" ) )
	rankIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( rankIcon )
	self.rankIcon = rankIcon
	
	local star1 = CoD.ArenaStar.new( menu, controller )
	star1:setLeftRight( false, true, -47, -31 )
	star1:setTopBottom( true, false, 0, 16 )
	star1:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return IsArenaStarInvisible( element, controller, "1" )
			end
		},
		{
			stateName = "Inactive",
			condition = function ( menu, element, event )
				return IsArenaStarInactive( element, controller, "1" )
			end
		},
		{
			stateName = "Earned",
			condition = function ( menu, element, event )
				return IsArenaStarEarned( element, controller, "1" )
			end
		}
	} )
	star1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "ArenaRank.levelStars" ), function ( model )
		menu:updateElementState( star1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "ArenaRank.levelStars"
		} )
	end )
	star1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "ArenaRank.earnedStars" ), function ( model )
		menu:updateElementState( star1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "ArenaRank.earnedStars"
		} )
	end )
	self:addElement( star1 )
	self.star1 = star1
	
	local star2 = CoD.ArenaStar.new( menu, controller )
	star2:setLeftRight( false, true, -38, -22 )
	star2:setTopBottom( true, false, 16, 32 )
	star2:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return IsArenaStarInvisible( element, controller, "2" )
			end
		},
		{
			stateName = "Inactive",
			condition = function ( menu, element, event )
				return IsArenaStarInactive( element, controller, "2" )
			end
		},
		{
			stateName = "Earned",
			condition = function ( menu, element, event )
				return IsArenaStarEarned( element, controller, "2" )
			end
		}
	} )
	star2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "ArenaRank.levelStars" ), function ( model )
		menu:updateElementState( star2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "ArenaRank.levelStars"
		} )
	end )
	star2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "ArenaRank.earnedStars" ), function ( model )
		menu:updateElementState( star2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "ArenaRank.earnedStars"
		} )
	end )
	self:addElement( star2 )
	self.star2 = star2
	
	local star3 = CoD.ArenaStar.new( menu, controller )
	star3:setLeftRight( false, true, -31, -15 )
	star3:setTopBottom( true, false, 32, 48 )
	star3:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return IsArenaStarInvisible( element, controller, "3" )
			end
		},
		{
			stateName = "Inactive",
			condition = function ( menu, element, event )
				return IsArenaStarInactive( element, controller, "3" )
			end
		},
		{
			stateName = "Earned",
			condition = function ( menu, element, event )
				return IsArenaStarEarned( element, controller, "3" )
			end
		}
	} )
	star3:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "ArenaRank.levelStars" ), function ( model )
		menu:updateElementState( star3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "ArenaRank.levelStars"
		} )
	end )
	star3:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "ArenaRank.earnedStars" ), function ( model )
		menu:updateElementState( star3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "ArenaRank.earnedStars"
		} )
	end )
	self:addElement( star3 )
	self.star3 = star3
	
	local star4 = CoD.ArenaStar.new( menu, controller )
	star4:setLeftRight( false, true, -38, -22 )
	star4:setTopBottom( true, false, 48, 64 )
	star4:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return IsArenaStarInvisible( element, controller, "4" )
			end
		},
		{
			stateName = "Inactive",
			condition = function ( menu, element, event )
				return IsArenaStarInactive( element, controller, "4" )
			end
		},
		{
			stateName = "Earned",
			condition = function ( menu, element, event )
				return IsArenaStarEarned( element, controller, "4" )
			end
		}
	} )
	star4:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "ArenaRank.levelStars" ), function ( model )
		menu:updateElementState( star4, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "ArenaRank.levelStars"
		} )
	end )
	star4:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "ArenaRank.earnedStars" ), function ( model )
		menu:updateElementState( star4, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "ArenaRank.earnedStars"
		} )
	end )
	self:addElement( star4 )
	self.star4 = star4
	
	local star5 = CoD.ArenaStar.new( menu, controller )
	star5:setLeftRight( false, true, -47, -31 )
	star5:setTopBottom( true, false, 64, 80 )
	star5:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return IsArenaStarInvisible( element, controller, "5" )
			end
		},
		{
			stateName = "Inactive",
			condition = function ( menu, element, event )
				return IsArenaStarInactive( element, controller, "5" )
			end
		},
		{
			stateName = "Earned",
			condition = function ( menu, element, event )
				return IsArenaStarEarned( element, controller, "5" )
			end
		}
	} )
	star5:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "ArenaRank.levelStars" ), function ( model )
		menu:updateElementState( star5, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "ArenaRank.levelStars"
		} )
	end )
	star5:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "ArenaRank.earnedStars" ), function ( model )
		menu:updateElementState( star5, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "ArenaRank.earnedStars"
		} )
	end )
	self:addElement( star5 )
	self.star5 = star5
	
	local levelLabel = LUI.UIText.new()
	levelLabel:setLeftRight( true, false, 4, 94 )
	levelLabel:setTopBottom( false, true, -16, 4 )
	levelLabel:setAlpha( 0 )
	levelLabel:setText( Engine.Localize( "MENU_NEW" ) )
	levelLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	levelLabel:setLetterSpacing( 1 )
	levelLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	levelLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( levelLabel )
	self.levelLabel = levelLabel
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.star1:close()
		element.star2:close()
		element.star3:close()
		element.star4:close()
		element.star5:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

