-- ed2ac99329145d84521b5e06943cd9bb
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.ZMInventory.RocketShieldBluePrint.RocketShieldPieceWidget" )

CoD.DragonCollarControllerWidgets_stalingrad = InheritFrom( LUI.UIElement )
CoD.DragonCollarControllerWidgets_stalingrad.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.DragonCollarControllerWidgets_stalingrad )
	self.id = "DragonCollarControllerWidgets_stalingrad"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 408 )
	self:setTopBottom( true, false, 0, 129 )
	self.anyChildUsesUpdateState = true
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( true, false, -19.56, 263.04 )
	BG:setTopBottom( true, false, -34.5, 158.5 )
	BG:setImage( RegisterImage( "uie_t7_base_quest_dragoncollarcontroller_dlc3" ) )
	self:addElement( BG )
	self.BG = BG
	
	local RocketShieldPieceWidget1 = CoD.RocketShieldPieceWidget.new( menu, controller )
	RocketShieldPieceWidget1:setLeftRight( true, false, 171.74, 260.26 )
	RocketShieldPieceWidget1:setTopBottom( true, false, 20.24, 108.76 )
	RocketShieldPieceWidget1:setScale( 1.3 )
	RocketShieldPieceWidget1.PieceImageNewGreen:setImage( RegisterImage( "uie_t7_icon_inventory_dlc3_dcc_piece3_new" ) )
	RocketShieldPieceWidget1.PieceImage:setImage( RegisterImage( "uie_t7_icon_inventory_dlc3_dcc_piece3" ) )
	RocketShieldPieceWidget1:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and IsInventoryPieceVisible( controller, "dragonride_part_codes" )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				return IsInventoryPieceVisible( controller, "dragonride_part_codes" ) and IsInventoryWidgetVisible( controller, "widget_dragonride_parts" )
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
	RocketShieldPieceWidget1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.dragonride_part_codes" ), function ( model )
		menu:updateElementState( RocketShieldPieceWidget1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.dragonride_part_codes"
		} )
	end )
	RocketShieldPieceWidget1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_dragonride_parts" ), function ( model )
		menu:updateElementState( RocketShieldPieceWidget1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_dragonride_parts"
		} )
	end )
	self:addElement( RocketShieldPieceWidget1 )
	self.RocketShieldPieceWidget1 = RocketShieldPieceWidget1
	
	local RocketShieldPieceWidget2 = CoD.RocketShieldPieceWidget.new( menu, controller )
	RocketShieldPieceWidget2:setLeftRight( true, false, 309.74, 398.26 )
	RocketShieldPieceWidget2:setTopBottom( true, false, 17.74, 106.26 )
	RocketShieldPieceWidget2:setScale( 1.3 )
	RocketShieldPieceWidget2.PieceImageNewGreen:setImage( RegisterImage( "uie_t7_icon_inventory_dlc3_dcc_piece4_new" ) )
	RocketShieldPieceWidget2.PieceImage:setImage( RegisterImage( "uie_t7_icon_inventory_dlc3_dcc_piece4" ) )
	RocketShieldPieceWidget2:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and IsInventoryPieceVisible( controller, "dragonride_part_map" )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				return IsInventoryPieceVisible( controller, "dragonride_part_map" ) and IsInventoryWidgetVisible( controller, "widget_dragonride_parts" )
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
	RocketShieldPieceWidget2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.dragonride_part_map" ), function ( model )
		menu:updateElementState( RocketShieldPieceWidget2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.dragonride_part_map"
		} )
	end )
	RocketShieldPieceWidget2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_dragonride_parts" ), function ( model )
		menu:updateElementState( RocketShieldPieceWidget2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_dragonride_parts"
		} )
	end )
	self:addElement( RocketShieldPieceWidget2 )
	self.RocketShieldPieceWidget2 = RocketShieldPieceWidget2
	
	local RocketShieldPieceWidget3 = CoD.RocketShieldPieceWidget.new( menu, controller )
	RocketShieldPieceWidget3:setLeftRight( true, false, 15.27, 103.79 )
	RocketShieldPieceWidget3:setTopBottom( true, false, 20.24, 108.76 )
	RocketShieldPieceWidget3:setScale( 1.25 )
	RocketShieldPieceWidget3.PieceImageNewGreen:setImage( RegisterImage( "uie_t7_icon_inventory_dlc3_dcc_piece1_new" ) )
	RocketShieldPieceWidget3.PieceImage:setImage( RegisterImage( "uie_t7_icon_inventory_dlc3_dcc_piece1" ) )
	RocketShieldPieceWidget3:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and IsInventoryPieceVisible( controller, "dragonride_part_transmitter" )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				return IsInventoryPieceVisible( controller, "dragonride_part_transmitter" ) and IsInventoryWidgetVisible( controller, "widget_dragonride_parts" )
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
	RocketShieldPieceWidget3:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.dragonride_part_transmitter" ), function ( model )
		menu:updateElementState( RocketShieldPieceWidget3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.dragonride_part_transmitter"
		} )
	end )
	RocketShieldPieceWidget3:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_dragonride_parts" ), function ( model )
		menu:updateElementState( RocketShieldPieceWidget3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_dragonride_parts"
		} )
	end )
	self:addElement( RocketShieldPieceWidget3 )
	self.RocketShieldPieceWidget3 = RocketShieldPieceWidget3
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				BG:completeAnimation()
				self.BG:setAlpha( 0 )
				self.clipFinished( BG, {} )

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
			end
		},
		Scoreboard = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				BG:completeAnimation()
				self.BG:setAlpha( 0 )
				self.clipFinished( BG, {} )

				RocketShieldPieceWidget1:completeAnimation()
				self.RocketShieldPieceWidget1:setLeftRight( true, false, 174.74, 263.26 )
				self.RocketShieldPieceWidget1:setTopBottom( true, false, 22.24, 110.76 )
				self.RocketShieldPieceWidget1:setAlpha( 1 )
				self.RocketShieldPieceWidget1:setScale( 1.35 )
				self.clipFinished( RocketShieldPieceWidget1, {} )

				RocketShieldPieceWidget2:completeAnimation()
				self.RocketShieldPieceWidget2:setLeftRight( true, false, 329.74, 418.26 )
				self.RocketShieldPieceWidget2:setTopBottom( true, false, 20.74, 109.26 )
				self.RocketShieldPieceWidget2:setAlpha( 1 )
				self.RocketShieldPieceWidget2:setScale( 1.4 )
				self.clipFinished( RocketShieldPieceWidget2, {} )

				RocketShieldPieceWidget3:completeAnimation()
				self.RocketShieldPieceWidget3:setLeftRight( true, false, 27.44, 115.96 )
				self.RocketShieldPieceWidget3:setTopBottom( true, false, 22.24, 110.76 )
				self.RocketShieldPieceWidget3:setAlpha( 1 )
				self.RocketShieldPieceWidget3:setScale( 1.35 )
				self.clipFinished( RocketShieldPieceWidget3, {} )
			end
		},
		BgVisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				local BGFrame2 = function ( BG, event )
					local BGFrame3 = function ( BG, event )
						local BGFrame4 = function ( BG, event )
							if not event.interrupted then
								BG:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
							end
							BG:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( BG, event )
							else
								BG:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							BGFrame4( BG, event )
							return 
						else
							BG:beginAnimation( "keyframe", 2670, false, false, CoD.TweenType.Linear )
							BG:registerEventHandler( "transition_complete_keyframe", BGFrame4 )
						end
					end
					
					if event.interrupted then
						BGFrame3( BG, event )
						return 
					else
						BG:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
						BG:setAlpha( 1 )
						BG:registerEventHandler( "transition_complete_keyframe", BGFrame3 )
					end
				end
				
				BG:completeAnimation()
				self.BG:setAlpha( 0 )
				BGFrame2( BG, {} )

				RocketShieldPieceWidget1:completeAnimation()
				self.RocketShieldPieceWidget1:setLeftRight( true, false, 89.79, 178.31 )
				self.RocketShieldPieceWidget1:setTopBottom( true, false, 22.24, 110.76 )
				self.RocketShieldPieceWidget1:setAlpha( 1 )
				self.RocketShieldPieceWidget1:setScale( 1.1 )
				self.clipFinished( RocketShieldPieceWidget1, {} )

				RocketShieldPieceWidget2:completeAnimation()
				self.RocketShieldPieceWidget2:setLeftRight( true, false, 159.52, 248.04 )
				self.RocketShieldPieceWidget2:setTopBottom( true, false, 20.24, 108.76 )
				self.RocketShieldPieceWidget2:setAlpha( 1 )
				self.RocketShieldPieceWidget2:setScale( 1.1 )
				self.clipFinished( RocketShieldPieceWidget2, {} )

				RocketShieldPieceWidget3:completeAnimation()
				self.RocketShieldPieceWidget3:setLeftRight( true, false, 14.27, 102.79 )
				self.RocketShieldPieceWidget3:setTopBottom( true, false, 23.24, 111.76 )
				self.RocketShieldPieceWidget3:setAlpha( 1 )
				self.RocketShieldPieceWidget3:setScale( 1.1 )
				self.clipFinished( RocketShieldPieceWidget3, {} )
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
			stateName = "BgVisible",
			condition = function ( menu, element, event )
				return IsInventoryWidgetVisible( controller, "widget_dragonride_parts" )
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
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_dragonride_parts" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_dragonride_parts"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.RocketShieldPieceWidget1:close()
		element.RocketShieldPieceWidget2:close()
		element.RocketShieldPieceWidget3:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
