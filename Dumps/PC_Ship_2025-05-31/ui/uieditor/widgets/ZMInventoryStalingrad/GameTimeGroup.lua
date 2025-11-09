require( "ui.uieditor.widgets.ZMInventoryStalingrad.GameTimeWidget" )

local PreLoadFunc = function ( self, controller )
	local f1_local0 = Engine.CreateModel( Engine.GetModelForController( controller ), "hudItems.time" )
	Engine.CreateModel( f1_local0, "round_complete_time" )
	Engine.CreateModel( f1_local0, "round_complete_num" )
	Engine.CreateModel( f1_local0, "game_end_time" )
	Engine.CreateModel( f1_local0, "quest_complete_time" )
	Engine.CreateModel( f1_local0, "game_start_time" )
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	local f2_local0 = Engine.CreateModel( Engine.GetModelForController( f2_arg1 ), "hudItems.time" )
	f2_arg0.CurrentClockTime.GameTimer:subscribeToModel( Engine.GetModel( f2_local0, "game_start_time" ), function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			f2_arg0.CurrentClockTime.GameTimer:setupServerTime( modelValue )
		end
	end )
	f2_arg0.QuestTime.GameTimer:subscribeToModel( Engine.GetModel( f2_local0, "quest_complete_time" ), function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			f2_arg0.QuestTime.GameTimer:setupServerTime( 0 - modelValue * 1000 )
		end
	end )
	f2_arg0.Last5RoundTime.GameTimer:subscribeToModel( Engine.GetModel( f2_local0, "round_complete_time" ), function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			f2_arg0.Last5RoundTime.GameTimer:setupServerTime( 0 - modelValue * 1000 )
		end
	end )
	f2_arg0.SurviveTime.GameTimer:subscribeToModel( Engine.GetModel( f2_local0, "game_end_time" ), function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			f2_arg0.SurviveTime.GameTimer:setupServerTime( 0 - modelValue * 1000 )
		end
	end )
end

CoD.GameTimeGroup = InheritFrom( LUI.UIElement )
CoD.GameTimeGroup.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GameTimeGroup )
	self.id = "GameTimeGroup"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 396 )
	self:setTopBottom( true, false, 0, 96 )
	self.anyChildUsesUpdateState = true
	
	local CurrentClockTime = CoD.GameTimeWidget.new( menu, controller )
	CurrentClockTime:setLeftRight( true, false, 0, 128 )
	CurrentClockTime:setTopBottom( true, false, 0, 96 )
	CurrentClockTime.TimeElasped:setText( Engine.Localize( "DLC3_TIME_CURRENT" ) )
	CurrentClockTime:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsZombies() and IsModelValueEqualTo( controller, "hudItems.time.game_end_time", 0 )
			end
		}
	} )
	CurrentClockTime:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( CurrentClockTime, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	CurrentClockTime:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.time.game_end_time" ), function ( model )
		menu:updateElementState( CurrentClockTime, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.time.game_end_time"
		} )
	end )
	self:addElement( CurrentClockTime )
	self.CurrentClockTime = CurrentClockTime
	
	local SurviveTime = CoD.GameTimeWidget.new( menu, controller )
	SurviveTime:setLeftRight( true, false, 0, 128 )
	SurviveTime:setTopBottom( true, false, 0, 96 )
	SurviveTime.TimeElasped:setText( Engine.Localize( "DLC3_TIME_SURVIVED" ) )
	SurviveTime:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsZombies() and not IsModelValueEqualTo( controller, "hudItems.time.game_end_time", 0 )
			end
		}
	} )
	SurviveTime:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( SurviveTime, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	SurviveTime:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.time.game_end_time" ), function ( model )
		menu:updateElementState( SurviveTime, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.time.game_end_time"
		} )
	end )
	self:addElement( SurviveTime )
	self.SurviveTime = SurviveTime
	
	local Last5RoundTime = CoD.GameTimeWidget.new( menu, controller )
	Last5RoundTime:setLeftRight( true, false, 134, 262 )
	Last5RoundTime:setTopBottom( true, false, 0, 96 )
	Last5RoundTime:subscribeToGlobalModel( controller, "HUDItems", "time.round_complete_num", function ( model )
		local timeRoundCompleteNum = Engine.GetModelValue( model )
		if timeRoundCompleteNum then
			Last5RoundTime.TimeElasped:setText( LocalizeIntoString( "DLC3_ROUND_N_COMPLETED", timeRoundCompleteNum ) )
		end
	end )
	Last5RoundTime:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsZombies() and not IsModelValueEqualTo( controller, "hudItems.time.round_complete_time", 0 )
			end
		}
	} )
	Last5RoundTime:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( Last5RoundTime, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	Last5RoundTime:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.time.round_complete_time" ), function ( model )
		menu:updateElementState( Last5RoundTime, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.time.round_complete_time"
		} )
	end )
	self:addElement( Last5RoundTime )
	self.Last5RoundTime = Last5RoundTime
	
	local QuestTime = CoD.GameTimeWidget.new( menu, controller )
	QuestTime:setLeftRight( true, false, 268, 396 )
	QuestTime:setTopBottom( true, false, 0, 96 )
	QuestTime.TimeElasped:setText( Engine.Localize( "DLC3_TIME_QUEST_COMPLETED" ) )
	QuestTime:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsZombies() and not IsModelValueEqualTo( controller, "hudItems.time.quest_complete_time", 0 )
			end
		}
	} )
	QuestTime:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( QuestTime, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	QuestTime:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.time.quest_complete_time" ), function ( model )
		menu:updateElementState( QuestTime, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.time.quest_complete_time"
		} )
	end )
	self:addElement( QuestTime )
	self.QuestTime = QuestTime
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				CurrentClockTime:completeAnimation()
				self.CurrentClockTime:setAlpha( 0 )
				self.clipFinished( CurrentClockTime, {} )
				SurviveTime:completeAnimation()
				self.SurviveTime:setAlpha( 0 )
				self.clipFinished( SurviveTime, {} )
				Last5RoundTime:completeAnimation()
				self.Last5RoundTime:setAlpha( 0 )
				self.clipFinished( Last5RoundTime, {} )
				QuestTime:completeAnimation()
				self.QuestTime:setAlpha( 0 )
				self.clipFinished( QuestTime, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				CurrentClockTime:completeAnimation()
				self.CurrentClockTime:setAlpha( 1 )
				self.clipFinished( CurrentClockTime, {} )
				SurviveTime:completeAnimation()
				self.SurviveTime:setAlpha( 1 )
				self.clipFinished( SurviveTime, {} )
				Last5RoundTime:completeAnimation()
				self.Last5RoundTime:setAlpha( 1 )
				self.clipFinished( Last5RoundTime, {} )
				QuestTime:completeAnimation()
				self.QuestTime:setAlpha( 1 )
				self.clipFinished( QuestTime, {} )
			end
		},
		InventoryScreen = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				SurviveTime:completeAnimation()
				self.SurviveTime:setAlpha( 1 )
				self.clipFinished( SurviveTime, {} )
				Last5RoundTime:completeAnimation()
				self.Last5RoundTime:setAlpha( 0 )
				self.clipFinished( Last5RoundTime, {} )
				QuestTime:completeAnimation()
				self.QuestTime:setAlpha( 0 )
				self.clipFinished( QuestTime, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsZombies()
			end
		},
		{
			stateName = "InventoryScreen",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CurrentClockTime:close()
		element.SurviveTime:close()
		element.Last5RoundTime:close()
		element.QuestTime:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

