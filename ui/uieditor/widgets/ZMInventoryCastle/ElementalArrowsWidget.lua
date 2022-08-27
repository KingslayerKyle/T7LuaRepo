-- 54475f72ca406cf7ffacec6edd173399
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.ZMInventory.ElementalArrows.ElementalArrowItem" )

CoD.ElementalArrowsWidget = InheritFrom( LUI.UIElement )
CoD.ElementalArrowsWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ElementalArrowsWidget )
	self.id = "ElementalArrowsWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 285 )
	self:setTopBottom( true, false, 0, 119 )
	self.anyChildUsesUpdateState = true
	
	local RitualBg = LUI.UIImage.new()
	RitualBg:setLeftRight( true, false, -139.48, 343.98 )
	RitualBg:setTopBottom( true, false, -46.97, 172.34 )
	RitualBg:setAlpha( 0 )
	RitualBg:setImage( RegisterImage( "uie_t7_base_quest_ritual" ) )
	self:addElement( RitualBg )
	self.RitualBg = RitualBg
	
	local RitualItem1 = CoD.ElementalArrowItem.new( menu, controller )
	RitualItem1:setLeftRight( false, false, -140.5, -77.5 )
	RitualItem1:setTopBottom( false, false, -30.32, 30.68 )
	RitualItem1:setScale( 1.8 )
	RitualItem1.BackgroundComplete:setImage( RegisterImage( "uie_t7_icon_inventory_dlc_quest_sigil_storm" ) )
	RitualItem1.ArrowComplete:setImage( RegisterImage( "uie_t7_icon_inventory_dlc_quest_arrow_fixed_storm" ) )
	RitualItem1.ArrowBroken:setImage( RegisterImage( "uie_t7_icon_inventory_dlc_quest_arrow_broken_storm" ) )
	RitualItem1:subscribeToGlobalModel( controller, "ZMQuestItemHolders", "quest_state_storm", function ( model )
		local questStateStorm = Engine.GetModelValue( model )
		if questStateStorm then
			RitualItem1.CircleFill:setShaderVector( 0, ConvertToCastleQuestProgressPercent( CoD.GetVectorComponentFromString( questStateStorm, 1 ), CoD.GetVectorComponentFromString( questStateStorm, 2 ), CoD.GetVectorComponentFromString( questStateStorm, 3 ), CoD.GetVectorComponentFromString( questStateStorm, 4 ) ) )
		end
	end )
	RitualItem1:subscribeToGlobalModel( controller, "ZMQuestItemHolders", "quest_owner_storm", function ( model )
		local questOwnerStorm = Engine.GetModelValue( model )
		if questOwnerStorm then
			RitualItem1.PlayerImage:setImage( RegisterImage( GetCastleQuestOwnerImageFromEnum( questOwnerStorm ) ) )
		end
	end )
	RitualItem1:mergeStateConditions( {
		{
			stateName = "Finished",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "zmInventory.quest_state_storm", 6 )
			end
		},
		{
			stateName = "MostlyFinished",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "zmInventory.quest_state_storm", 5 )
			end
		},
		{
			stateName = "InProgress",
			condition = function ( menu, element, event )
				return IsModelValueGreaterThan( controller, "zmInventory.quest_state_storm", 0 )
			end
		}
	} )
	RitualItem1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( RitualItem1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	RitualItem1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_quest_items" ), function ( model )
		menu:updateElementState( RitualItem1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_quest_items"
		} )
	end )
	RitualItem1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.quest_state_storm" ), function ( model )
		menu:updateElementState( RitualItem1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.quest_state_storm"
		} )
	end )
	self:addElement( RitualItem1 )
	self.RitualItem1 = RitualItem1
	
	local RitualItem2 = CoD.ElementalArrowItem.new( menu, controller )
	RitualItem2:setLeftRight( false, false, -33.5, 29.5 )
	RitualItem2:setTopBottom( false, false, -27.47, 33.53 )
	RitualItem2:setScale( 1.8 )
	RitualItem2.BackgroundComplete:setImage( RegisterImage( "uie_t7_icon_inventory_dlc_quest_sigil_rune" ) )
	RitualItem2.ArrowComplete:setImage( RegisterImage( "uie_t7_icon_inventory_dlc_quest_arrow_fixed_rune" ) )
	RitualItem2.ArrowBroken:setImage( RegisterImage( "uie_t7_icon_inventory_dlc_quest_arrow_broken_rune" ) )
	RitualItem2:subscribeToGlobalModel( controller, "ZMQuestItemHolders", "quest_state_rune", function ( model )
		local questStateRune = Engine.GetModelValue( model )
		if questStateRune then
			RitualItem2.CircleFill:setShaderVector( 0, ConvertToCastleQuestProgressPercent( CoD.GetVectorComponentFromString( questStateRune, 1 ), CoD.GetVectorComponentFromString( questStateRune, 2 ), CoD.GetVectorComponentFromString( questStateRune, 3 ), CoD.GetVectorComponentFromString( questStateRune, 4 ) ) )
		end
	end )
	RitualItem2:subscribeToGlobalModel( controller, "ZMQuestItemHolders", "quest_owner_rune", function ( model )
		local questOwnerRune = Engine.GetModelValue( model )
		if questOwnerRune then
			RitualItem2.PlayerImage:setImage( RegisterImage( GetCastleQuestOwnerImageFromEnum( questOwnerRune ) ) )
		end
	end )
	RitualItem2:mergeStateConditions( {
		{
			stateName = "Finished",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "zmInventory.quest_state_rune", 6 )
			end
		},
		{
			stateName = "MostlyFinished",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "zmInventory.quest_state_rune", 5 )
			end
		},
		{
			stateName = "InProgress",
			condition = function ( menu, element, event )
				return IsModelValueGreaterThan( controller, "zmInventory.quest_state_rune", 0 )
			end
		}
	} )
	RitualItem2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( RitualItem2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	RitualItem2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_quest_items" ), function ( model )
		menu:updateElementState( RitualItem2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_quest_items"
		} )
	end )
	RitualItem2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.quest_state_rune" ), function ( model )
		menu:updateElementState( RitualItem2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.quest_state_rune"
		} )
	end )
	self:addElement( RitualItem2 )
	self.RitualItem2 = RitualItem2
	
	local RitualItem3 = CoD.ElementalArrowItem.new( menu, controller )
	RitualItem3:setLeftRight( false, false, 70.01, 133.01 )
	RitualItem3:setTopBottom( false, false, -24.47, 36.53 )
	RitualItem3:setScale( 1.8 )
	RitualItem3.BackgroundComplete:setImage( RegisterImage( "uie_t7_icon_inventory_dlc_quest_arrow_broken_wolf-22" ) )
	RitualItem3.ArrowComplete:setImage( RegisterImage( "uie_t7_icon_inventory_dlc_quest_arrow_fixed_wolf" ) )
	RitualItem3.ArrowBroken:setImage( RegisterImage( "uie_t7_icon_inventory_dlc_quest_arrow_broken_wolf" ) )
	RitualItem3:subscribeToGlobalModel( controller, "ZMQuestItemHolders", "quest_state_wolf", function ( model )
		local questStateWolf = Engine.GetModelValue( model )
		if questStateWolf then
			RitualItem3.CircleFill:setShaderVector( 0, ConvertToCastleQuestProgressPercent( CoD.GetVectorComponentFromString( questStateWolf, 1 ), CoD.GetVectorComponentFromString( questStateWolf, 2 ), CoD.GetVectorComponentFromString( questStateWolf, 3 ), CoD.GetVectorComponentFromString( questStateWolf, 4 ) ) )
		end
	end )
	RitualItem3:subscribeToGlobalModel( controller, "ZMQuestItemHolders", "quest_owner_wolf", function ( model )
		local questOwnerWolf = Engine.GetModelValue( model )
		if questOwnerWolf then
			RitualItem3.PlayerImage:setImage( RegisterImage( GetCastleQuestOwnerImageFromEnum( questOwnerWolf ) ) )
		end
	end )
	RitualItem3:mergeStateConditions( {
		{
			stateName = "Finished",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "zmInventory.quest_state_wolf", 6 )
			end
		},
		{
			stateName = "MostlyFinished",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "zmInventory.quest_state_wolf", 5 )
			end
		},
		{
			stateName = "InProgress",
			condition = function ( menu, element, event )
				return IsModelValueGreaterThan( controller, "zmInventory.quest_state_wolf", 0 )
			end
		}
	} )
	RitualItem3:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( RitualItem3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	RitualItem3:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_quest_items" ), function ( model )
		menu:updateElementState( RitualItem3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_quest_items"
		} )
	end )
	RitualItem3:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.quest_state_wolf" ), function ( model )
		menu:updateElementState( RitualItem3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.quest_state_wolf"
		} )
	end )
	self:addElement( RitualItem3 )
	self.RitualItem3 = RitualItem3
	
	local RitualItem4 = CoD.ElementalArrowItem.new( menu, controller )
	RitualItem4:setLeftRight( false, false, 177.5, 240.5 )
	RitualItem4:setTopBottom( false, false, -27.47, 33.53 )
	RitualItem4:setScale( 1.8 )
	RitualItem4:subscribeToGlobalModel( controller, "ZMQuestItemHolders", "quest_state_demon", function ( model )
		local questStateDemon = Engine.GetModelValue( model )
		if questStateDemon then
			RitualItem4.CircleFill:setShaderVector( 0, ConvertToCastleQuestProgressPercent( CoD.GetVectorComponentFromString( questStateDemon, 1 ), CoD.GetVectorComponentFromString( questStateDemon, 2 ), CoD.GetVectorComponentFromString( questStateDemon, 3 ), CoD.GetVectorComponentFromString( questStateDemon, 4 ) ) )
		end
	end )
	RitualItem4:subscribeToGlobalModel( controller, "ZMQuestItemHolders", "quest_owner_demon", function ( model )
		local questOwnerDemon = Engine.GetModelValue( model )
		if questOwnerDemon then
			RitualItem4.PlayerImage:setImage( RegisterImage( GetCastleQuestOwnerImageFromEnum( questOwnerDemon ) ) )
		end
	end )
	RitualItem4:mergeStateConditions( {
		{
			stateName = "Finished",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "zmInventory.quest_state_demon", 6 )
			end
		},
		{
			stateName = "MostlyFinished",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "zmInventory.quest_state_demon", 5 )
			end
		},
		{
			stateName = "InProgress",
			condition = function ( menu, element, event )
				return IsModelValueGreaterThan( controller, "zmInventory.quest_state_demon", 0 )
			end
		}
	} )
	RitualItem4:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( RitualItem4, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	RitualItem4:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_quest_items" ), function ( model )
		menu:updateElementState( RitualItem4, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_quest_items"
		} )
	end )
	RitualItem4:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.quest_state_demon" ), function ( model )
		menu:updateElementState( RitualItem4, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.quest_state_demon"
		} )
	end )
	self:addElement( RitualItem4 )
	self.RitualItem4 = RitualItem4
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				RitualBg:completeAnimation()
				self.RitualBg:setAlpha( 0 )
				self.clipFinished( RitualBg, {} )
				RitualItem1:completeAnimation()
				self.RitualItem1:setAlpha( 0 )
				self.clipFinished( RitualItem1, {} )
				RitualItem2:completeAnimation()
				self.RitualItem2:setAlpha( 0 )
				self.clipFinished( RitualItem2, {} )
				RitualItem3:completeAnimation()
				self.RitualItem3:setAlpha( 0 )
				self.clipFinished( RitualItem3, {} )
				RitualItem4:completeAnimation()
				self.RitualItem4:setAlpha( 0 )
				self.clipFinished( RitualItem4, {} )
			end
		},
		BgVisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				local RitualBgFrame2 = function ( RitualBg, event )
					local RitualBgFrame3 = function ( RitualBg, event )
						local RitualBgFrame4 = function ( RitualBg, event )
							local RitualBgFrame5 = function ( RitualBg, event )
								local RitualBgFrame6 = function ( RitualBg, event )
									local RitualBgFrame7 = function ( RitualBg, event )
										if not event.interrupted then
											RitualBg:beginAnimation( "keyframe", 509, false, true, CoD.TweenType.Linear )
										end
										RitualBg:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( RitualBg, event )
										else
											RitualBg:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										RitualBgFrame7( RitualBg, event )
										return 
									else
										RitualBg:beginAnimation( "keyframe", 930, false, false, CoD.TweenType.Linear )
										RitualBg:setAlpha( 1 )
										RitualBg:registerEventHandler( "transition_complete_keyframe", RitualBgFrame7 )
									end
								end
								
								if event.interrupted then
									RitualBgFrame6( RitualBg, event )
									return 
								else
									RitualBg:beginAnimation( "keyframe", 649, false, false, CoD.TweenType.Linear )
									RitualBg:setAlpha( 0.9 )
									RitualBg:registerEventHandler( "transition_complete_keyframe", RitualBgFrame6 )
								end
							end
							
							if event.interrupted then
								RitualBgFrame5( RitualBg, event )
								return 
							else
								RitualBg:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
								RitualBg:setAlpha( 1 )
								RitualBg:registerEventHandler( "transition_complete_keyframe", RitualBgFrame5 )
							end
						end
						
						if event.interrupted then
							RitualBgFrame4( RitualBg, event )
							return 
						else
							RitualBg:beginAnimation( "keyframe", 510, false, false, CoD.TweenType.Linear )
							RitualBg:setAlpha( 0.9 )
							RitualBg:registerEventHandler( "transition_complete_keyframe", RitualBgFrame4 )
						end
					end
					
					if event.interrupted then
						RitualBgFrame3( RitualBg, event )
						return 
					else
						RitualBg:beginAnimation( "keyframe", 680, true, true, CoD.TweenType.Elastic )
						RitualBg:setAlpha( 1 )
						RitualBg:registerEventHandler( "transition_complete_keyframe", RitualBgFrame3 )
					end
				end
				
				RitualBg:completeAnimation()
				self.RitualBg:setAlpha( 0 )
				RitualBgFrame2( RitualBg, {} )
				RitualItem1:completeAnimation()
				self.RitualItem1:setAlpha( 1 )
				self.clipFinished( RitualItem1, {} )
				RitualItem2:completeAnimation()
				self.RitualItem2:setAlpha( 1 )
				self.clipFinished( RitualItem2, {} )
				RitualItem3:completeAnimation()
				self.RitualItem3:setAlpha( 1 )
				self.clipFinished( RitualItem3, {} )
				RitualItem4:completeAnimation()
				self.RitualItem4:setAlpha( 1 )
				self.clipFinished( RitualItem4, {} )
			end
		},
		Scoreboard = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				RitualBg:completeAnimation()
				self.RitualBg:setAlpha( 0 )
				self.clipFinished( RitualBg, {} )
				RitualItem1:completeAnimation()
				self.RitualItem1:setLeftRight( false, false, -140.5, -77.5 )
				self.RitualItem1:setTopBottom( false, false, -30.32, 30.68 )
				self.RitualItem1:setAlpha( 1 )
				self.clipFinished( RitualItem1, {} )
				RitualItem2:completeAnimation()
				self.RitualItem2:setLeftRight( false, false, -33.5, 29.5 )
				self.RitualItem2:setTopBottom( false, false, -27.47, 33.53 )
				self.RitualItem2:setAlpha( 1 )
				self.clipFinished( RitualItem2, {} )
				RitualItem3:completeAnimation()
				self.RitualItem3:setLeftRight( false, false, 70.01, 133.01 )
				self.RitualItem3:setTopBottom( false, false, -24.47, 36.53 )
				self.RitualItem3:setAlpha( 1 )
				self.clipFinished( RitualItem3, {} )
				RitualItem4:completeAnimation()
				self.RitualItem4:setLeftRight( false, false, 177.5, 240.5 )
				self.RitualItem4:setTopBottom( false, false, -27.47, 33.53 )
				self.RitualItem4:setAlpha( 1 )
				self.clipFinished( RitualItem4, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "BgVisible",
			condition = function ( menu, element, event )
				return ShowQuestItemsWidget( controller )
			end
		},
		{
			stateName = "Scoreboard",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_quest_items" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_quest_items"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.RitualItem1:close()
		element.RitualItem2:close()
		element.RitualItem3:close()
		element.RitualItem4:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

