require( "ui.uieditor.widgets.HUD.ZM_FX.ZmFx_Spark2" )
require( "ui.uieditor.widgets.ZMInventory.ElementalArrows.ElementalArrowItem" )

CoD.CastleElementalArrowNotificationWidgets = InheritFrom( LUI.UIElement )
CoD.CastleElementalArrowNotificationWidgets.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CastleElementalArrowNotificationWidgets )
	self.id = "CastleElementalArrowNotificationWidgets"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 63 )
	self:setTopBottom( true, false, 0, 61 )
	self.anyChildUsesUpdateState = true
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, false, -39, 126 )
	bg:setTopBottom( true, false, -93, 152 )
	bg:setImage( RegisterImage( "uie_t7_base_quest_bg_dlc" ) )
	self:addElement( bg )
	self.bg = bg
	
	local ZmFxSpark20 = CoD.ZmFx_Spark2.new( menu, controller )
	ZmFxSpark20:setLeftRight( false, false, -28.5, 36.5 )
	ZmFxSpark20:setTopBottom( false, false, -43.5, 41.5 )
	ZmFxSpark20:setRGB( 0, 0.74, 1 )
	ZmFxSpark20:setAlpha( 0 )
	ZmFxSpark20:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	ZmFxSpark20.Image0:setShaderVector( 1, 0, 0.4, 0, 0 )
	ZmFxSpark20.Image00:setShaderVector( 1, 0, -0.2, 0, 0 )
	self:addElement( ZmFxSpark20 )
	self.ZmFxSpark20 = ZmFxSpark20
	
	local RitualItem1 = CoD.ElementalArrowItem.new( menu, controller )
	RitualItem1:setLeftRight( false, false, -26.5, 36.5 )
	RitualItem1:setTopBottom( false, false, -30.5, 30.5 )
	RitualItem1:setScale( 1.06 )
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
	RitualItem2:setLeftRight( false, false, -26.5, 36.5 )
	RitualItem2:setTopBottom( false, false, -30.5, 30.5 )
	RitualItem2:setAlpha( 0 )
	RitualItem2:setScale( 1.06 )
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
	RitualItem3:setLeftRight( false, false, -26.5, 36.5 )
	RitualItem3:setTopBottom( false, false, -30.5, 30.5 )
	RitualItem3:setAlpha( 0 )
	RitualItem3:setScale( 1.06 )
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
	RitualItem4:setLeftRight( false, false, -26.5, 36.5 )
	RitualItem4:setTopBottom( false, false, -30.5, 30.5 )
	RitualItem4:setAlpha( 0 )
	RitualItem4:setScale( 1.06 )
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
				self:setupElementClipCounter( 6 )
				bg:completeAnimation()
				self.bg:setAlpha( 0 )
				self.clipFinished( bg, {} )
				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )
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
		Show1 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				bg:completeAnimation()
				self.bg:setAlpha( 1 )
				self.clipFinished( bg, {} )
				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 1 )
				self.clipFinished( ZmFxSpark20, {} )
				RitualItem1:completeAnimation()
				self.RitualItem1:setAlpha( 1 )
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
		Show2 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				bg:completeAnimation()
				self.bg:setAlpha( 1 )
				self.clipFinished( bg, {} )
				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 1 )
				self.clipFinished( ZmFxSpark20, {} )
				RitualItem1:completeAnimation()
				self.RitualItem1:setAlpha( 0 )
				self.clipFinished( RitualItem1, {} )
				RitualItem2:completeAnimation()
				self.RitualItem2:setAlpha( 1 )
				self.clipFinished( RitualItem2, {} )
				RitualItem3:completeAnimation()
				self.RitualItem3:setAlpha( 0 )
				self.clipFinished( RitualItem3, {} )
				RitualItem4:completeAnimation()
				self.RitualItem4:setAlpha( 0 )
				self.clipFinished( RitualItem4, {} )
			end
		},
		Show3 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				bg:completeAnimation()
				self.bg:setAlpha( 1 )
				self.clipFinished( bg, {} )
				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 1 )
				self.clipFinished( ZmFxSpark20, {} )
				RitualItem1:completeAnimation()
				self.RitualItem1:setAlpha( 0 )
				self.clipFinished( RitualItem1, {} )
				RitualItem2:completeAnimation()
				self.RitualItem2:setAlpha( 0 )
				self.clipFinished( RitualItem2, {} )
				RitualItem3:completeAnimation()
				self.RitualItem3:setAlpha( 1 )
				self.clipFinished( RitualItem3, {} )
				RitualItem4:completeAnimation()
				self.RitualItem4:setAlpha( 0 )
				self.clipFinished( RitualItem4, {} )
			end
		},
		Show4 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				bg:completeAnimation()
				self.bg:setAlpha( 1 )
				self.clipFinished( bg, {} )
				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 1 )
				self.clipFinished( ZmFxSpark20, {} )
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
				self.RitualItem4:setAlpha( 1 )
				self.clipFinished( RitualItem4, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Show1",
			condition = function ( menu, element, event )
				local f39_local0
				if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) then
					f39_local0 = IsModelValueEqualTo( controller, "zmInventory.widget_weap_quest_storm", 1 )
				else
					f39_local0 = false
				end
				return f39_local0
			end
		},
		{
			stateName = "Show2",
			condition = function ( menu, element, event )
				local f40_local0
				if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) then
					f40_local0 = IsModelValueEqualTo( controller, "zmInventory.widget_weap_quest_rune", 1 )
				else
					f40_local0 = false
				end
				return f40_local0
			end
		},
		{
			stateName = "Show3",
			condition = function ( menu, element, event )
				local f41_local0
				if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) then
					f41_local0 = IsModelValueEqualTo( controller, "zmInventory.widget_weap_quest_wolf", 1 )
				else
					f41_local0 = false
				end
				return f41_local0
			end
		},
		{
			stateName = "Show4",
			condition = function ( menu, element, event )
				local f42_local0
				if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) then
					f42_local0 = IsModelValueEqualTo( controller, "zmInventory.widget_weap_quest_demon", 1 )
				else
					f42_local0 = false
				end
				return f42_local0
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
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_weap_quest_storm" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_weap_quest_storm"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_weap_quest_rune" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_weap_quest_rune"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_weap_quest_wolf" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_weap_quest_wolf"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_weap_quest_demon" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_weap_quest_demon"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ZmFxSpark20:close()
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

