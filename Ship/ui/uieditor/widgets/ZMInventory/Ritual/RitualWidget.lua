-- 45342fe77f9a939267091e339faad411
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.ZMInventory.Ritual.RitualItem" )

CoD.RitualWidget = InheritFrom( LUI.UIElement )
CoD.RitualWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.RitualWidget )
	self.id = "RitualWidget"
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
	
	local RitualItem1 = CoD.RitualItem.new( menu, controller )
	RitualItem1:setLeftRight( false, false, -142.5, -79.5 )
	RitualItem1:setTopBottom( false, false, -30.47, 30.53 )
	RitualItem1:setScale( 1.4 )
	RitualItem1.RitualItemImage:setImage( RegisterImage( "uie_t7_icon_inventory_badge" ) )
	RitualItem1.MissingImage:setImage( RegisterImage( "uie_t7_icon_inventory_badge_disabled" ) )
	RitualItem1.RitualItemNewImage:setImage( RegisterImage( "uie_t7_icon_inventory_badge_new" ) )
	RitualItem1.RitualItemInUseByOtherPlayer.InUseByOtherPlayerImage:setImage( RegisterImage( "uie_t7_icon_inventory_badge_inuse" ) )
	RitualItem1:subscribeToGlobalModel( controller, "ZMQuestItemHolders", "holder_of_detective", function ( model )
		local holderOfDetective = Engine.GetModelValue( model )
		if holderOfDetective then
			RitualItem1.RitualItemInUseByOtherPlayer.PlayerImage:setImage( RegisterImage( GetQuestItemHolderImageFromEnum( holderOfDetective ) ) )
		end
	end )
	RitualItem1:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and IsRitualItemInState( controller, "ZOD_NAME_DETECTIVE", "CLIENTFIELD_ZOD_UI_QUEST_STATE_GOT_MEMENTO" )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				local f4_local0
				if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) then
					f4_local0 = IsRitualItemInState( controller, "ZOD_NAME_DETECTIVE", "CLIENTFIELD_ZOD_UI_QUEST_STATE_GOT_MEMENTO" )
				else
					f4_local0 = false
				end
				return f4_local0
			end
		},
		{
			stateName = "Completed",
			condition = function ( menu, element, event )
				return IsRitualItemInState( controller, "ZOD_NAME_DETECTIVE", "CLIENTFIELD_ZOD_UI_QUEST_STATE_USED_RELIC" )
			end
		},
		{
			stateName = "Worm",
			condition = function ( menu, element, event )
				return IsRitualItemInState( controller, "ZOD_NAME_DETECTIVE", "CLIENTFIELD_ZOD_UI_QUEST_STATE_GOT_RELIC" )
			end
		},
		{
			stateName = "Activated",
			condition = function ( menu, element, event )
				return IsRitualItemBeingUsed( controller, "ZOD_NAME_DETECTIVE" )
			end
		},
		{
			stateName = "InUseByOtherPlayer",
			condition = function ( menu, element, event )
				local f8_local0
				if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) then
					f8_local0 = IsRitualItemWithAnotherPlayer( controller, "ZOD_NAME_DETECTIVE" )
				else
					f8_local0 = false
				end
				return f8_local0
			end
		},
		{
			stateName = "Missing",
			condition = function ( menu, element, event )
				return IsRitualItemMissing( controller, "ZOD_NAME_DETECTIVE" )
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
	RitualItem1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.quest_state_boxer" ), function ( model )
		menu:updateElementState( RitualItem1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.quest_state_boxer"
		} )
	end )
	RitualItem1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.quest_state_detective" ), function ( model )
		menu:updateElementState( RitualItem1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.quest_state_detective"
		} )
	end )
	RitualItem1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.quest_state_femme" ), function ( model )
		menu:updateElementState( RitualItem1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.quest_state_femme"
		} )
	end )
	RitualItem1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.quest_state_magician" ), function ( model )
		menu:updateElementState( RitualItem1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.quest_state_magician"
		} )
	end )
	RitualItem1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.used_quest_key_location" ), function ( model )
		menu:updateElementState( RitualItem1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.used_quest_key_location"
		} )
	end )
	RitualItem1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.check_boxer_memento" ), function ( model )
		menu:updateElementState( RitualItem1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.check_boxer_memento"
		} )
	end )
	RitualItem1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.check_detective_memento" ), function ( model )
		menu:updateElementState( RitualItem1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.check_detective_memento"
		} )
	end )
	RitualItem1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.check_magician_memento" ), function ( model )
		menu:updateElementState( RitualItem1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.check_magician_memento"
		} )
	end )
	RitualItem1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.check_femme_memento" ), function ( model )
		menu:updateElementState( RitualItem1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.check_femme_memento"
		} )
	end )
	self:addElement( RitualItem1 )
	self.RitualItem1 = RitualItem1
	
	local RitualItem2 = CoD.RitualItem.new( menu, controller )
	RitualItem2:setLeftRight( false, false, -68, -5 )
	RitualItem2:setTopBottom( false, false, -30.47, 30.53 )
	RitualItem2:setScale( 1.4 )
	RitualItem2.RitualItemImage:setImage( RegisterImage( "uie_t7_icon_inventory_hairpiece" ) )
	RitualItem2.MissingImage:setImage( RegisterImage( "uie_t7_icon_inventory_hairpiece_disabled" ) )
	RitualItem2.RitualItemNewImage:setImage( RegisterImage( "uie_t7_icon_inventory_hairpiece_new" ) )
	RitualItem2.RitualItemInUseByOtherPlayer.InUseByOtherPlayerImage:setImage( RegisterImage( "uie_t7_icon_inventory_hairpiece_inuse" ) )
	RitualItem2:subscribeToGlobalModel( controller, "ZMQuestItemHolders", "holder_of_femme", function ( model )
		local holderOfFemme = Engine.GetModelValue( model )
		if holderOfFemme then
			RitualItem2.RitualItemInUseByOtherPlayer.PlayerImage:setImage( RegisterImage( GetQuestItemHolderImageFromEnum( holderOfFemme ) ) )
		end
	end )
	RitualItem2:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and IsRitualItemInState( controller, "ZOD_NAME_FEMME", "CLIENTFIELD_ZOD_UI_QUEST_STATE_GOT_MEMENTO" )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				local f22_local0
				if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) then
					f22_local0 = IsRitualItemInState( controller, "ZOD_NAME_FEMME", "CLIENTFIELD_ZOD_UI_QUEST_STATE_GOT_MEMENTO" )
				else
					f22_local0 = false
				end
				return f22_local0
			end
		},
		{
			stateName = "Completed",
			condition = function ( menu, element, event )
				return IsRitualItemInState( controller, "ZOD_NAME_FEMME", "CLIENTFIELD_ZOD_UI_QUEST_STATE_USED_RELIC" )
			end
		},
		{
			stateName = "Worm",
			condition = function ( menu, element, event )
				return IsRitualItemInState( controller, "ZOD_NAME_FEMME", "CLIENTFIELD_ZOD_UI_QUEST_STATE_GOT_RELIC" )
			end
		},
		{
			stateName = "Activated",
			condition = function ( menu, element, event )
				return IsRitualItemBeingUsed( controller, "ZOD_NAME_FEMME" )
			end
		},
		{
			stateName = "InUseByOtherPlayer",
			condition = function ( menu, element, event )
				local f26_local0
				if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) then
					f26_local0 = IsRitualItemWithAnotherPlayer( controller, "ZOD_NAME_FEMME" )
				else
					f26_local0 = false
				end
				return f26_local0
			end
		},
		{
			stateName = "Missing",
			condition = function ( menu, element, event )
				return IsRitualItemMissing( controller, "ZOD_NAME_FEMME" )
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
	RitualItem2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.quest_state_boxer" ), function ( model )
		menu:updateElementState( RitualItem2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.quest_state_boxer"
		} )
	end )
	RitualItem2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.quest_state_detective" ), function ( model )
		menu:updateElementState( RitualItem2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.quest_state_detective"
		} )
	end )
	RitualItem2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.quest_state_femme" ), function ( model )
		menu:updateElementState( RitualItem2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.quest_state_femme"
		} )
	end )
	RitualItem2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.quest_state_magician" ), function ( model )
		menu:updateElementState( RitualItem2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.quest_state_magician"
		} )
	end )
	RitualItem2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.used_quest_key_location" ), function ( model )
		menu:updateElementState( RitualItem2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.used_quest_key_location"
		} )
	end )
	RitualItem2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.check_boxer_memento" ), function ( model )
		menu:updateElementState( RitualItem2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.check_boxer_memento"
		} )
	end )
	RitualItem2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.check_detective_memento" ), function ( model )
		menu:updateElementState( RitualItem2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.check_detective_memento"
		} )
	end )
	RitualItem2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.check_magician_memento" ), function ( model )
		menu:updateElementState( RitualItem2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.check_magician_memento"
		} )
	end )
	RitualItem2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.check_femme_memento" ), function ( model )
		menu:updateElementState( RitualItem2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.check_femme_memento"
		} )
	end )
	self:addElement( RitualItem2 )
	self.RitualItem2 = RitualItem2
	
	local RitualItem3 = CoD.RitualItem.new( menu, controller )
	RitualItem3:setLeftRight( false, false, 8.01, 71.01 )
	RitualItem3:setTopBottom( false, false, -30.47, 30.53 )
	RitualItem3:setScale( 1.4 )
	RitualItem3.RitualItemImage:setImage( RegisterImage( "uie_t7_icon_inventory_pen" ) )
	RitualItem3.MissingImage:setImage( RegisterImage( "uie_t7_icon_inventory_pen_disabled" ) )
	RitualItem3.RitualItemNewImage:setImage( RegisterImage( "uie_t7_icon_inventory_pen_new" ) )
	RitualItem3.RitualItemInUseByOtherPlayer.InUseByOtherPlayerImage:setImage( RegisterImage( "uie_t7_icon_inventory_pen_inuse" ) )
	RitualItem3:subscribeToGlobalModel( controller, "ZMQuestItemHolders", "holder_of_magician", function ( model )
		local holderOfMagician = Engine.GetModelValue( model )
		if holderOfMagician then
			RitualItem3.RitualItemInUseByOtherPlayer.PlayerImage:setImage( RegisterImage( GetQuestItemHolderImageFromEnum( holderOfMagician ) ) )
		end
	end )
	RitualItem3:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and IsRitualItemInState( controller, "ZOD_NAME_MAGICIAN", "CLIENTFIELD_ZOD_UI_QUEST_STATE_GOT_MEMENTO" )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				local f40_local0
				if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) then
					f40_local0 = IsRitualItemInState( controller, "ZOD_NAME_MAGICIAN", "CLIENTFIELD_ZOD_UI_QUEST_STATE_GOT_MEMENTO" )
				else
					f40_local0 = false
				end
				return f40_local0
			end
		},
		{
			stateName = "Completed",
			condition = function ( menu, element, event )
				return IsRitualItemInState( controller, "ZOD_NAME_MAGICIAN", "CLIENTFIELD_ZOD_UI_QUEST_STATE_USED_RELIC" )
			end
		},
		{
			stateName = "Worm",
			condition = function ( menu, element, event )
				return IsRitualItemInState( controller, "ZOD_NAME_MAGICIAN", "CLIENTFIELD_ZOD_UI_QUEST_STATE_GOT_RELIC" )
			end
		},
		{
			stateName = "Activated",
			condition = function ( menu, element, event )
				return IsRitualItemBeingUsed( controller, "ZOD_NAME_MAGICIAN" )
			end
		},
		{
			stateName = "InUseByOtherPlayer",
			condition = function ( menu, element, event )
				local f44_local0
				if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) then
					f44_local0 = IsRitualItemWithAnotherPlayer( controller, "ZOD_NAME_MAGICIAN" )
				else
					f44_local0 = false
				end
				return f44_local0
			end
		},
		{
			stateName = "Missing",
			condition = function ( menu, element, event )
				return IsRitualItemMissing( controller, "ZOD_NAME_MAGICIAN" )
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
	RitualItem3:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.quest_state_boxer" ), function ( model )
		menu:updateElementState( RitualItem3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.quest_state_boxer"
		} )
	end )
	RitualItem3:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.quest_state_detective" ), function ( model )
		menu:updateElementState( RitualItem3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.quest_state_detective"
		} )
	end )
	RitualItem3:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.quest_state_femme" ), function ( model )
		menu:updateElementState( RitualItem3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.quest_state_femme"
		} )
	end )
	RitualItem3:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.quest_state_magician" ), function ( model )
		menu:updateElementState( RitualItem3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.quest_state_magician"
		} )
	end )
	RitualItem3:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.used_quest_key_location" ), function ( model )
		menu:updateElementState( RitualItem3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.used_quest_key_location"
		} )
	end )
	RitualItem3:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.check_boxer_memento" ), function ( model )
		menu:updateElementState( RitualItem3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.check_boxer_memento"
		} )
	end )
	RitualItem3:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.check_detective_memento" ), function ( model )
		menu:updateElementState( RitualItem3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.check_detective_memento"
		} )
	end )
	RitualItem3:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.check_magician_memento" ), function ( model )
		menu:updateElementState( RitualItem3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.check_magician_memento"
		} )
	end )
	RitualItem3:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.check_femme_memento" ), function ( model )
		menu:updateElementState( RitualItem3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.check_femme_memento"
		} )
	end )
	self:addElement( RitualItem3 )
	self.RitualItem3 = RitualItem3
	
	local RitualItem4 = CoD.RitualItem.new( menu, controller )
	RitualItem4:setLeftRight( false, false, 88.5, 151.5 )
	RitualItem4:setTopBottom( false, false, -30.47, 30.53 )
	RitualItem4:setScale( 1.4 )
	RitualItem4.RitualItemImage:setImage( RegisterImage( "uie_t7_icon_inventory_belt" ) )
	RitualItem4.MissingImage:setImage( RegisterImage( "uie_t7_icon_inventory_belt_disabled" ) )
	RitualItem4.RitualItemNewImage:setImage( RegisterImage( "uie_t7_icon_inventory_belt_new" ) )
	RitualItem4.RitualItemInUseByOtherPlayer.InUseByOtherPlayerImage:setImage( RegisterImage( "uie_t7_icon_inventory_belt_inuse" ) )
	RitualItem4:subscribeToGlobalModel( controller, "ZMQuestItemHolders", "holder_of_boxer", function ( model )
		local holderOfBoxer = Engine.GetModelValue( model )
		if holderOfBoxer then
			RitualItem4.RitualItemInUseByOtherPlayer.PlayerImage:setImage( RegisterImage( GetQuestItemHolderImageFromEnum( holderOfBoxer ) ) )
		end
	end )
	RitualItem4:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and IsRitualItemInState( controller, "ZOD_NAME_BOXER", "CLIENTFIELD_ZOD_UI_QUEST_STATE_GOT_MEMENTO" )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				local f58_local0
				if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) then
					f58_local0 = IsRitualItemInState( controller, "ZOD_NAME_BOXER", "CLIENTFIELD_ZOD_UI_QUEST_STATE_GOT_MEMENTO" )
				else
					f58_local0 = false
				end
				return f58_local0
			end
		},
		{
			stateName = "Completed",
			condition = function ( menu, element, event )
				return IsRitualItemInState( controller, "ZOD_NAME_BOXER", "CLIENTFIELD_ZOD_UI_QUEST_STATE_USED_RELIC" )
			end
		},
		{
			stateName = "Worm",
			condition = function ( menu, element, event )
				return IsRitualItemInState( controller, "ZOD_NAME_BOXER", "CLIENTFIELD_ZOD_UI_QUEST_STATE_GOT_RELIC" )
			end
		},
		{
			stateName = "Activated",
			condition = function ( menu, element, event )
				return IsRitualItemBeingUsed( controller, "ZOD_NAME_BOXER" )
			end
		},
		{
			stateName = "InUseByOtherPlayer",
			condition = function ( menu, element, event )
				local f62_local0
				if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) then
					f62_local0 = IsRitualItemWithAnotherPlayer( controller, "ZOD_NAME_BOXER" )
				else
					f62_local0 = false
				end
				return f62_local0
			end
		},
		{
			stateName = "Missing",
			condition = function ( menu, element, event )
				return IsRitualItemMissing( controller, "ZOD_NAME_BOXER" )
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
	RitualItem4:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.quest_state_boxer" ), function ( model )
		menu:updateElementState( RitualItem4, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.quest_state_boxer"
		} )
	end )
	RitualItem4:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.quest_state_detective" ), function ( model )
		menu:updateElementState( RitualItem4, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.quest_state_detective"
		} )
	end )
	RitualItem4:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.quest_state_femme" ), function ( model )
		menu:updateElementState( RitualItem4, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.quest_state_femme"
		} )
	end )
	RitualItem4:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.quest_state_magician" ), function ( model )
		menu:updateElementState( RitualItem4, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.quest_state_magician"
		} )
	end )
	RitualItem4:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.used_quest_key_location" ), function ( model )
		menu:updateElementState( RitualItem4, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.used_quest_key_location"
		} )
	end )
	RitualItem4:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.check_boxer_memento" ), function ( model )
		menu:updateElementState( RitualItem4, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.check_boxer_memento"
		} )
	end )
	RitualItem4:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.check_detective_memento" ), function ( model )
		menu:updateElementState( RitualItem4, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.check_detective_memento"
		} )
	end )
	RitualItem4:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.check_magician_memento" ), function ( model )
		menu:updateElementState( RitualItem4, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.check_magician_memento"
		} )
	end )
	RitualItem4:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.check_femme_memento" ), function ( model )
		menu:updateElementState( RitualItem4, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.check_femme_memento"
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
