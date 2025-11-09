require( "ui.uieditor.widgets.ZMInventory.RocketShieldBluePrint.RocketShieldPieceWidget" )

CoD.RunesOfCreationWidget_Genesis = InheritFrom( LUI.UIElement )
CoD.RunesOfCreationWidget_Genesis.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.RunesOfCreationWidget_Genesis )
	self.id = "RunesOfCreationWidget_Genesis"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 408 )
	self:setTopBottom( true, false, 0, 129 )
	self.anyChildUsesUpdateState = true
	
	local RocketShieldPieceWidget1 = CoD.RocketShieldPieceWidget.new( menu, controller )
	RocketShieldPieceWidget1:setLeftRight( true, false, 103.56, 192.08 )
	RocketShieldPieceWidget1:setTopBottom( true, false, 20.24, 108.76 )
	RocketShieldPieceWidget1:setScale( 1.1 )
	RocketShieldPieceWidget1.PieceImageNewGreen:setImage( RegisterImage( "uie_t7_icon_inventory_dlc4_rune2" ) )
	RocketShieldPieceWidget1.PieceImage:setImage( RegisterImage( "uie_t7_icon_inventory_dlc4_rune2" ) )
	RocketShieldPieceWidget1:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and IsInventoryPieceVisible( controller, "gen_rune_electricity" )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				return IsInventoryWidgetVisible( controller, "widget_rune_parts" ) and IsInventoryPieceVisible( controller, "gen_rune_electricity" )
			end
		}
	} )
	RocketShieldPieceWidget1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( RocketShieldPieceWidget1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	RocketShieldPieceWidget1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.gen_rune_electricity" ), function ( model )
		menu:updateElementState( RocketShieldPieceWidget1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.gen_rune_electricity"
		} )
	end )
	RocketShieldPieceWidget1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_rune_parts" ), function ( model )
		menu:updateElementState( RocketShieldPieceWidget1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_rune_parts"
		} )
	end )
	self:addElement( RocketShieldPieceWidget1 )
	self.RocketShieldPieceWidget1 = RocketShieldPieceWidget1
	
	local RocketShieldPieceWidget2 = CoD.RocketShieldPieceWidget.new( menu, controller )
	RocketShieldPieceWidget2:setLeftRight( true, false, 207.78, 296.3 )
	RocketShieldPieceWidget2:setTopBottom( true, false, 17.74, 106.26 )
	RocketShieldPieceWidget2:setScale( 1.1 )
	RocketShieldPieceWidget2.PieceImageNewGreen:setImage( RegisterImage( "uie_t7_icon_inventory_dlc4_rune3" ) )
	RocketShieldPieceWidget2.PieceImage:setImage( RegisterImage( "uie_t7_icon_inventory_dlc4_rune3" ) )
	RocketShieldPieceWidget2:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and IsInventoryPieceVisible( controller, "gen_rune_fire" )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				return IsInventoryWidgetVisible( controller, "widget_rune_parts" ) and IsInventoryPieceVisible( controller, "gen_rune_fire" )
			end
		}
	} )
	RocketShieldPieceWidget2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( RocketShieldPieceWidget2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	RocketShieldPieceWidget2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.gen_rune_fire" ), function ( model )
		menu:updateElementState( RocketShieldPieceWidget2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.gen_rune_fire"
		} )
	end )
	RocketShieldPieceWidget2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_rune_parts" ), function ( model )
		menu:updateElementState( RocketShieldPieceWidget2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_rune_parts"
		} )
	end )
	self:addElement( RocketShieldPieceWidget2 )
	self.RocketShieldPieceWidget2 = RocketShieldPieceWidget2
	
	local RocketShieldPieceWidget3 = CoD.RocketShieldPieceWidget.new( menu, controller )
	RocketShieldPieceWidget3:setLeftRight( true, false, 3.27, 91.79 )
	RocketShieldPieceWidget3:setTopBottom( true, false, 20.24, 108.76 )
	RocketShieldPieceWidget3:setScale( 1.1 )
	RocketShieldPieceWidget3.PieceImageNewGreen:setImage( RegisterImage( "uie_t7_icon_inventory_dlc4_rune1" ) )
	RocketShieldPieceWidget3.PieceImage:setImage( RegisterImage( "uie_t7_icon_inventory_dlc4_rune1" ) )
	RocketShieldPieceWidget3:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and IsInventoryPieceVisible( controller, "gen_rune_light" )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				return IsInventoryWidgetVisible( controller, "widget_rune_parts" ) and IsInventoryPieceVisible( controller, "gen_rune_light" )
			end
		}
	} )
	RocketShieldPieceWidget3:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( RocketShieldPieceWidget3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	RocketShieldPieceWidget3:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.gen_rune_light" ), function ( model )
		menu:updateElementState( RocketShieldPieceWidget3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.gen_rune_light"
		} )
	end )
	RocketShieldPieceWidget3:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_rune_parts" ), function ( model )
		menu:updateElementState( RocketShieldPieceWidget3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_rune_parts"
		} )
	end )
	self:addElement( RocketShieldPieceWidget3 )
	self.RocketShieldPieceWidget3 = RocketShieldPieceWidget3
	
	local RocketShieldPieceWidget0 = CoD.RocketShieldPieceWidget.new( menu, controller )
	RocketShieldPieceWidget0:setLeftRight( true, false, 309.3, 397.82 )
	RocketShieldPieceWidget0:setTopBottom( true, false, 17.74, 106.26 )
	RocketShieldPieceWidget0:setScale( 1.1 )
	RocketShieldPieceWidget0.PieceImageNewGreen:setImage( RegisterImage( "uie_t7_icon_inventory_dlc4_rune4" ) )
	RocketShieldPieceWidget0.PieceImage:setImage( RegisterImage( "uie_t7_icon_inventory_dlc4_rune4" ) )
	RocketShieldPieceWidget0:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and IsInventoryPieceVisible( controller, "gen_rune_shadow" )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				return IsInventoryWidgetVisible( controller, "widget_rune_parts" ) and IsInventoryPieceVisible( controller, "gen_rune_shadow" )
			end
		}
	} )
	RocketShieldPieceWidget0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( RocketShieldPieceWidget0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	RocketShieldPieceWidget0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.gen_rune_shadow" ), function ( model )
		menu:updateElementState( RocketShieldPieceWidget0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.gen_rune_shadow"
		} )
	end )
	RocketShieldPieceWidget0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_rune_parts" ), function ( model )
		menu:updateElementState( RocketShieldPieceWidget0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_rune_parts"
		} )
	end )
	self:addElement( RocketShieldPieceWidget0 )
	self.RocketShieldPieceWidget0 = RocketShieldPieceWidget0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				RocketShieldPieceWidget1:completeAnimation()
				self.RocketShieldPieceWidget1:setAlpha( 0 )
				self.RocketShieldPieceWidget1:setScale( 0.9 )
				self.clipFinished( RocketShieldPieceWidget1, {} )
				RocketShieldPieceWidget2:completeAnimation()
				self.RocketShieldPieceWidget2:setAlpha( 0 )
				self.RocketShieldPieceWidget2:setScale( 1 )
				self.clipFinished( RocketShieldPieceWidget2, {} )
				RocketShieldPieceWidget3:completeAnimation()
				self.RocketShieldPieceWidget3:setAlpha( 0 )
				self.RocketShieldPieceWidget3:setScale( 1 )
				self.clipFinished( RocketShieldPieceWidget3, {} )
				RocketShieldPieceWidget0:completeAnimation()
				self.RocketShieldPieceWidget0:setAlpha( 0 )
				self.clipFinished( RocketShieldPieceWidget0, {} )
			end
		},
		Scoreboard = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				RocketShieldPieceWidget1:completeAnimation()
				self.RocketShieldPieceWidget1:setLeftRight( true, false, 103.56, 192.08 )
				self.RocketShieldPieceWidget1:setTopBottom( true, false, 20.24, 108.76 )
				self.RocketShieldPieceWidget1:setAlpha( 1 )
				self.RocketShieldPieceWidget1:setScale( 1.1 )
				self.clipFinished( RocketShieldPieceWidget1, {} )
				RocketShieldPieceWidget2:completeAnimation()
				self.RocketShieldPieceWidget2:setLeftRight( true, false, 207.78, 296.3 )
				self.RocketShieldPieceWidget2:setTopBottom( true, false, 17.74, 106.26 )
				self.RocketShieldPieceWidget2:setAlpha( 1 )
				self.RocketShieldPieceWidget2:setScale( 1.1 )
				self.clipFinished( RocketShieldPieceWidget2, {} )
				RocketShieldPieceWidget3:completeAnimation()
				self.RocketShieldPieceWidget3:setLeftRight( true, false, 3.27, 91.79 )
				self.RocketShieldPieceWidget3:setTopBottom( true, false, 20.24, 108.76 )
				self.RocketShieldPieceWidget3:setAlpha( 1 )
				self.RocketShieldPieceWidget3:setScale( 1.1 )
				self.clipFinished( RocketShieldPieceWidget3, {} )
				RocketShieldPieceWidget0:completeAnimation()
				self.RocketShieldPieceWidget0:setLeftRight( true, false, 309.3, 397.82 )
				self.RocketShieldPieceWidget0:setTopBottom( true, false, 17.74, 106.26 )
				self.RocketShieldPieceWidget0:setAlpha( 1 )
				self.RocketShieldPieceWidget0:setScale( 1.1 )
				self.clipFinished( RocketShieldPieceWidget0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Scoreboard",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.RocketShieldPieceWidget1:close()
		element.RocketShieldPieceWidget2:close()
		element.RocketShieldPieceWidget3:close()
		element.RocketShieldPieceWidget0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

