-- ad8a26decb12e6eaafd20afd553e9bb3
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_Layout_ArenaNewSeasonText" )
require( "ui.uieditor.widgets.Arena.ArenaResultWidget" )

DataSources.ArenaNewSeasonStats = ListHelper_SetupDataSource( "ArenaNewSeasonStats", function ( f1_arg0 )
	local f1_local0 = {}
	if CoD.ArenaUtility.ArenaNewSeasonStats then
		f1_local0 = CoD.ArenaUtility.ArenaNewSeasonStats
		CoD.ArenaUtility.ArenaNewSeasonStats = nil
	end
	return f1_local0
end )
local PreLoadFunc = function ( self, controller )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "arenaNewSeasonState" ), "defaultState" )
end

local PostLoadFunc = function ( f3_arg0, f3_arg1 )
	local f3_local0 = 0
	f3_arg0:registerEventHandler( "bonus_stars_clip_start", function ( element, event )
		f3_local0 = f3_local0 + 1
	end )
	f3_arg0:registerEventHandler( "bonus_stars_clip_over", function ( element, event )
		f3_local0 = f3_local0 - 1
		if f3_local0 == 0 then
			SetControllerModelValue( f3_arg1, "arenaNewSeasonState", "seasonStart" )
		end
	end )
end

CoD.systemOverlay_ArenaNewSeason = InheritFrom( LUI.UIElement )
CoD.systemOverlay_ArenaNewSeason.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.systemOverlay_ArenaNewSeason )
	self.id = "systemOverlay_ArenaNewSeason"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 320 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local ArenaNewSeasonText = CoD.systemOverlay_Layout_ArenaNewSeasonText.new( menu, controller )
	ArenaNewSeasonText:setLeftRight( true, false, 86, 881 )
	ArenaNewSeasonText:setTopBottom( true, false, 10, 60 )
	ArenaNewSeasonText:linkToElementModel( self, nil, false, function ( model )
		ArenaNewSeasonText:setModel( model, controller )
	end )
	ArenaNewSeasonText:mergeStateConditions( {
		{
			stateName = "SeasonFinale",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "arenaNewSeasonState", "seasonFinale" )
			end
		},
		{
			stateName = "BonusStars",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "arenaNewSeasonState", "bonusStars" )
			end
		},
		{
			stateName = "SeasonStart",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "arenaNewSeasonState", "seasonStart" )
			end
		}
	} )
	ArenaNewSeasonText:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "arenaNewSeasonState" ), function ( model )
		menu:updateElementState( ArenaNewSeasonText, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "arenaNewSeasonState"
		} )
	end )
	self:addElement( ArenaNewSeasonText )
	self.ArenaNewSeasonText = ArenaNewSeasonText
	
	local ArenaResultList = LUI.UIList.new( menu, controller, 0, 0, nil, false, false, 0, 0, false, false )
	ArenaResultList:makeFocusable()
	ArenaResultList:setLeftRight( true, false, 56, 1151 )
	ArenaResultList:setTopBottom( true, false, 74, 299 )
	ArenaResultList:setWidgetType( CoD.ArenaResultWidget )
	ArenaResultList:setHorizontalCount( 5 )
	ArenaResultList:setSpacing( 0 )
	ArenaResultList:setDataSource( "ArenaNewSeasonStats" )
	ArenaResultList:registerEventHandler( "menu_loaded", function ( element, event )
		local f12_local0 = nil
		SetControllerModelValue( controller, "arenaNewSeasonState", "seasonFinale" )
		if not f12_local0 then
			f12_local0 = element:dispatchEventToChildren( event )
		end
		return f12_local0
	end )
	ArenaResultList:subscribeToGlobalModel( controller, "PerController", "arenaNewSeasonState", function ( model )
		UpdateSelfElementState( menu, ArenaResultList, controller )
	end )
	ArenaResultList:mergeStateConditions( {
		{
			stateName = "SeasonFinale",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "arenaNewSeasonState", "seasonFinale" )
			end
		},
		{
			stateName = "BonusStars",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "arenaNewSeasonState", "bonusStars" ) and IsSelfModelValueGreaterThan( element, controller, "newSeasonPoints", 0 )
			end
		},
		{
			stateName = "SeasonStart",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "arenaNewSeasonState", "seasonStart" ) and IsSelfModelValueGreaterThan( element, controller, "newSeasonPoints", 0 )
			end
		}
	} )
	ArenaResultList:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "arenaNewSeasonState" ), function ( model )
		menu:updateElementState( ArenaResultList, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "arenaNewSeasonState"
		} )
	end )
	ArenaResultList:linkToElementModel( ArenaResultList, "newSeasonPoints", true, function ( model )
		menu:updateElementState( ArenaResultList, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "newSeasonPoints"
		} )
	end )
	self:addElement( ArenaResultList )
	self.ArenaResultList = ArenaResultList
	
	ArenaResultList.id = "ArenaResultList"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.ArenaResultList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ArenaNewSeasonText:close()
		element.ArenaResultList:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

