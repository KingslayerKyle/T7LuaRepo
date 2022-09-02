-- 503570c2139765f1564290bb3aab9eb9
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.ZMInventoryStalingrad.GameTimeWidget" )

CoD.Zombie.Timers = {
	{
		header = "DLC3_ROUND_N_COMPLETED",
		headerModelName = "round_complete_num",
		modelName = "round_complete_time"
	},
	{
		header = "DLC3_TIME_SURVIVED",
		modelName = "game_end_time"
	},
	{
		header = "DLC3_TIME_QUEST_COMPLETED",
		modelName = "quest_complete_time"
	}
}
CoD.TimerList_Stalingrad = InheritFrom( LUI.UIElement )
CoD.TimerList_Stalingrad.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.TimerList_Stalingrad )
	self.id = "TimerList_Stalingrad"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 388 )
	self:setTopBottom( true, false, 0, 128 )
	self.anyChildUsesUpdateState = true
	
	local TimerGrid = LUI.GridLayout.new( menu, controller, false, 0, 0, 2, 0, nil, nil, false, false, 0, 0, false, true )
	TimerGrid:setLeftRight( false, false, -194, 194 )
	TimerGrid:setTopBottom( true, false, 0, 128 )
	TimerGrid:setWidgetType( CoD.GameTimeWidget )
	TimerGrid:setHorizontalCount( 3 )
	TimerGrid:setDataSource( "GameTimeWidgetList" )
	self:addElement( TimerGrid )
	self.TimerGrid = TimerGrid
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				TimerGrid:completeAnimation()
				self.TimerGrid:setAlpha( 0 )
				self.clipFinished( TimerGrid, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				TimerGrid:completeAnimation()
				self.TimerGrid:setAlpha( 1 )
				self.clipFinished( TimerGrid, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "forceScoreboard", 1 )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "forceScoreboard" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "forceScoreboard"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.TimerGrid:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

