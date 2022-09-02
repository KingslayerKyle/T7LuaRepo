-- 66318bdaf5753b875411b75907573987
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.ZMInventory.QuestEgg.QuestEggInternal" )

CoD.QuestEggWidget = InheritFrom( LUI.UIElement )
CoD.QuestEggWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.QuestEggWidget )
	self.id = "QuestEggWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 81 )
	self:setTopBottom( true, false, 0, 81 )
	self.anyChildUsesUpdateState = true
	
	local Quest1Egg = CoD.QuestEggInternal.new( menu, controller )
	Quest1Egg:setLeftRight( true, false, 0, 81 )
	Quest1Egg:setTopBottom( true, false, 0, 81 )
	Quest1Egg:mergeStateConditions( {
		{
			stateName = "State1",
			condition = function ( menu, element, event )
				return QuestEggInState( controller, "UI_EGG_STATE_1_CHARGE" ) and not QuestEggQuest1Complete( controller )
			end
		},
		{
			stateName = "State2",
			condition = function ( menu, element, event )
				return QuestEggInState( controller, "UI_EGG_STATE_2_CHARGES" ) and not QuestEggQuest1Complete( controller )
			end
		},
		{
			stateName = "State3",
			condition = function ( menu, element, event )
				return QuestEggInState( controller, "UI_EGG_STATE_3_CHARGES" ) and not QuestEggQuest1Complete( controller )
			end
		},
		{
			stateName = "State4",
			condition = function ( menu, element, event )
				return QuestEggInState( controller, "UI_EGG_STATE_4_CHARGES" ) and not QuestEggQuest1Complete( controller )
			end
		},
		{
			stateName = "DefaultEgg",
			condition = function ( menu, element, event )
				return QuestEggInState( controller, "UI_EGG_STATE_ACQUIRED" ) and not QuestEggQuest1Complete( controller )
			end
		},
		{
			stateName = "Missing",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	Quest1Egg:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.player_sword_quest_egg_state" ), function ( model )
		menu:updateElementState( Quest1Egg, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.player_sword_quest_egg_state"
		} )
	end )
	Quest1Egg:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.player_sword_quest_completed_level_1" ), function ( model )
		menu:updateElementState( Quest1Egg, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.player_sword_quest_completed_level_1"
		} )
	end )
	self:addElement( Quest1Egg )
	self.Quest1Egg = Quest1Egg
	
	local Quest2Egg = CoD.QuestEggInternal.new( menu, controller )
	Quest2Egg:setLeftRight( true, false, 0, 81 )
	Quest2Egg:setTopBottom( true, false, 0, 81 )
	Quest2Egg.State1:setImage( RegisterImage( "uie_t7_icon_inventory_egg_q2_25" ) )
	Quest2Egg.State2:setImage( RegisterImage( "uie_t7_icon_inventory_egg_q2_50" ) )
	Quest2Egg.State3:setImage( RegisterImage( "uie_t7_icon_inventory_egg_q2_75" ) )
	Quest2Egg.State4:setImage( RegisterImage( "uie_t7_icon_inventory_egg_q2_100" ) )
	Quest2Egg.DefaultEggState:setImage( RegisterImage( "uie_t7_icon_inventory_egg_q2_default" ) )
	Quest2Egg:mergeStateConditions( {
		{
			stateName = "State1",
			condition = function ( menu, element, event )
				return QuestEggInState( controller, "UI_EGG_STATE_1_CHARGE" ) and QuestEggQuest1Complete( controller )
			end
		},
		{
			stateName = "State2",
			condition = function ( menu, element, event )
				return QuestEggInState( controller, "UI_EGG_STATE_2_CHARGES" ) and QuestEggQuest1Complete( controller )
			end
		},
		{
			stateName = "State3",
			condition = function ( menu, element, event )
				return QuestEggInState( controller, "UI_EGG_STATE_3_CHARGES" ) and QuestEggQuest1Complete( controller )
			end
		},
		{
			stateName = "State4",
			condition = function ( menu, element, event )
				return QuestEggInState( controller, "UI_EGG_STATE_4_CHARGES" ) and QuestEggQuest1Complete( controller )
			end
		},
		{
			stateName = "DefaultEgg",
			condition = function ( menu, element, event )
				return QuestEggInState( controller, "UI_EGG_STATE_ACQUIRED" ) and QuestEggQuest1Complete( controller )
			end
		},
		{
			stateName = "Missing",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	Quest2Egg:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.player_sword_quest_egg_state" ), function ( model )
		menu:updateElementState( Quest2Egg, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.player_sword_quest_egg_state"
		} )
	end )
	Quest2Egg:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.player_sword_quest_completed_level_1" ), function ( model )
		menu:updateElementState( Quest2Egg, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.player_sword_quest_completed_level_1"
		} )
	end )
	self:addElement( Quest2Egg )
	self.Quest2Egg = Quest2Egg
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				Quest1Egg:completeAnimation()
				self.Quest1Egg:setAlpha( 0 )
				self.clipFinished( Quest1Egg, {} )

				Quest2Egg:completeAnimation()
				self.Quest2Egg:setAlpha( 0 )
				self.clipFinished( Quest2Egg, {} )
			end
		},
		Scoreboard = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				Quest1Egg:completeAnimation()
				self.Quest1Egg:setAlpha( 1 )
				self.clipFinished( Quest1Egg, {} )

				Quest2Egg:completeAnimation()
				self.Quest2Egg:setAlpha( 1 )
				self.clipFinished( Quest2Egg, {} )
			end
		},
		Flashing = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				local Quest1EggFrame2 = function ( Quest1Egg, event )
					local Quest1EggFrame3 = function ( Quest1Egg, event )
						local Quest1EggFrame4 = function ( Quest1Egg, event )
							local Quest1EggFrame5 = function ( Quest1Egg, event )
								if not event.interrupted then
									Quest1Egg:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
								end
								Quest1Egg:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( Quest1Egg, event )
								else
									Quest1Egg:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Quest1EggFrame5( Quest1Egg, event )
								return 
							else
								Quest1Egg:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Linear )
								Quest1Egg:setAlpha( 0 )
								Quest1Egg:registerEventHandler( "transition_complete_keyframe", Quest1EggFrame5 )
							end
						end
						
						if event.interrupted then
							Quest1EggFrame4( Quest1Egg, event )
							return 
						else
							Quest1Egg:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
							Quest1Egg:setAlpha( 1 )
							Quest1Egg:registerEventHandler( "transition_complete_keyframe", Quest1EggFrame4 )
						end
					end
					
					if event.interrupted then
						Quest1EggFrame3( Quest1Egg, event )
						return 
					else
						Quest1Egg:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						Quest1Egg:setAlpha( 0 )
						Quest1Egg:registerEventHandler( "transition_complete_keyframe", Quest1EggFrame3 )
					end
				end
				
				Quest1Egg:completeAnimation()
				self.Quest1Egg:setAlpha( 1 )
				Quest1EggFrame2( Quest1Egg, {} )
				local Quest2EggFrame2 = function ( Quest2Egg, event )
					local Quest2EggFrame3 = function ( Quest2Egg, event )
						local Quest2EggFrame4 = function ( Quest2Egg, event )
							local Quest2EggFrame5 = function ( Quest2Egg, event )
								if not event.interrupted then
									Quest2Egg:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
								end
								Quest2Egg:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( Quest2Egg, event )
								else
									Quest2Egg:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Quest2EggFrame5( Quest2Egg, event )
								return 
							else
								Quest2Egg:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Linear )
								Quest2Egg:setAlpha( 0 )
								Quest2Egg:registerEventHandler( "transition_complete_keyframe", Quest2EggFrame5 )
							end
						end
						
						if event.interrupted then
							Quest2EggFrame4( Quest2Egg, event )
							return 
						else
							Quest2Egg:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
							Quest2Egg:setAlpha( 1 )
							Quest2Egg:registerEventHandler( "transition_complete_keyframe", Quest2EggFrame4 )
						end
					end
					
					if event.interrupted then
						Quest2EggFrame3( Quest2Egg, event )
						return 
					else
						Quest2Egg:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						Quest2Egg:setAlpha( 0 )
						Quest2Egg:registerEventHandler( "transition_complete_keyframe", Quest2EggFrame3 )
					end
				end
				
				Quest2Egg:completeAnimation()
				self.Quest2Egg:setAlpha( 1 )
				Quest2EggFrame2( Quest2Egg, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Scoreboard",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
			end
		},
		{
			stateName = "Flashing",
			condition = function ( menu, element, event )
				return ShowEggWidget( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_egg" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_egg"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Quest1Egg:close()
		element.Quest2Egg:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

