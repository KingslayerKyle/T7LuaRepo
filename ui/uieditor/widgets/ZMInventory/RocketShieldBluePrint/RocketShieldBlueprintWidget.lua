-- 7d4aa60f361ced5f602efce88a6367e7
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.ZMInventory.RocketShieldBluePrint.RocketShieldPieceWidget" )

CoD.RocketShieldBlueprintWidget = InheritFrom( LUI.UIElement )
CoD.RocketShieldBlueprintWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.RocketShieldBlueprintWidget )
	self.id = "RocketShieldBlueprintWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 314 )
	self:setTopBottom( true, false, 0, 129 )
	self.anyChildUsesUpdateState = true
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( true, false, -39.8, 284 )
	BG:setTopBottom( true, false, -46.52, 188.83 )
	BG:setAlpha( 0 )
	BG:setImage( RegisterImage( "uie_t7_base_quest_shield" ) )
	self:addElement( BG )
	self.BG = BG
	
	local RocketShieldPieceWidget1 = CoD.RocketShieldPieceWidget.new( menu, controller )
	RocketShieldPieceWidget1:setLeftRight( true, false, 92.74, 181.26 )
	RocketShieldPieceWidget1:setTopBottom( true, false, 20.24, 108.76 )
	RocketShieldPieceWidget1:setScale( 1.12 )
	RocketShieldPieceWidget1.PieceImageNewGreen:setImage( RegisterImage( "uie_t7_icon_inventory_shield_a_new" ) )
	RocketShieldPieceWidget1.PieceImage:setImage( RegisterImage( "uie_t7_icon_inventory_shield_a" ) )
	RocketShieldPieceWidget1:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and RocketShieldBlueprintPieceVisible( controller, "CLIENTFIELD_CRAFTABLE_PIECE_RIOTSHIELD_DOLLY" )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				return RocketShieldBlueprintPieceVisible( controller, "CLIENTFIELD_CRAFTABLE_PIECE_RIOTSHIELD_DOLLY" )
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
	RocketShieldPieceWidget1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.piece_riotshield_dolly" ), function ( model )
		menu:updateElementState( RocketShieldPieceWidget1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.piece_riotshield_dolly"
		} )
	end )
	RocketShieldPieceWidget1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.piece_riotshield_door" ), function ( model )
		menu:updateElementState( RocketShieldPieceWidget1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.piece_riotshield_door"
		} )
	end )
	RocketShieldPieceWidget1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.piece_riotshield_clamp" ), function ( model )
		menu:updateElementState( RocketShieldPieceWidget1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.piece_riotshield_clamp"
		} )
	end )
	self:addElement( RocketShieldPieceWidget1 )
	self.RocketShieldPieceWidget1 = RocketShieldPieceWidget1
	
	local RocketShieldPieceWidget2 = CoD.RocketShieldPieceWidget.new( menu, controller )
	RocketShieldPieceWidget2:setLeftRight( true, false, 170.74, 259.26 )
	RocketShieldPieceWidget2:setTopBottom( true, false, 20.24, 108.76 )
	RocketShieldPieceWidget2:setScale( 1.12 )
	RocketShieldPieceWidget2.PieceImageNewGreen:setImage( RegisterImage( "uie_t7_icon_inventory_shield_b_new" ) )
	RocketShieldPieceWidget2.PieceImage:setImage( RegisterImage( "uie_t7_icon_inventory_shield_b" ) )
	RocketShieldPieceWidget2:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and RocketShieldBlueprintPieceVisible( controller, "CLIENTFIELD_CRAFTABLE_PIECE_RIOTSHIELD_DOOR" )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				return RocketShieldBlueprintPieceVisible( controller, "CLIENTFIELD_CRAFTABLE_PIECE_RIOTSHIELD_DOOR" )
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
	RocketShieldPieceWidget2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.piece_riotshield_dolly" ), function ( model )
		menu:updateElementState( RocketShieldPieceWidget2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.piece_riotshield_dolly"
		} )
	end )
	RocketShieldPieceWidget2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.piece_riotshield_door" ), function ( model )
		menu:updateElementState( RocketShieldPieceWidget2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.piece_riotshield_door"
		} )
	end )
	RocketShieldPieceWidget2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.piece_riotshield_clamp" ), function ( model )
		menu:updateElementState( RocketShieldPieceWidget2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.piece_riotshield_clamp"
		} )
	end )
	self:addElement( RocketShieldPieceWidget2 )
	self.RocketShieldPieceWidget2 = RocketShieldPieceWidget2
	
	local RocketShieldPieceWidget3 = CoD.RocketShieldPieceWidget.new( menu, controller )
	RocketShieldPieceWidget3:setLeftRight( true, false, 13.27, 101.79 )
	RocketShieldPieceWidget3:setTopBottom( true, false, 20.24, 108.76 )
	RocketShieldPieceWidget3:setScale( 1.12 )
	RocketShieldPieceWidget3.PieceImageNewGreen:setImage( RegisterImage( "uie_t7_icon_inventory_shield_c_new" ) )
	RocketShieldPieceWidget3.PieceImage:setImage( RegisterImage( "uie_t7_icon_inventory_shield_c" ) )
	RocketShieldPieceWidget3:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and RocketShieldBlueprintPieceVisible( controller, "CLIENTFIELD_CRAFTABLE_PIECE_RIOTSHIELD_CLAMP" )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				return RocketShieldBlueprintPieceVisible( controller, "CLIENTFIELD_CRAFTABLE_PIECE_RIOTSHIELD_CLAMP" )
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
	RocketShieldPieceWidget3:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.piece_riotshield_dolly" ), function ( model )
		menu:updateElementState( RocketShieldPieceWidget3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.piece_riotshield_dolly"
		} )
	end )
	RocketShieldPieceWidget3:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.piece_riotshield_door" ), function ( model )
		menu:updateElementState( RocketShieldPieceWidget3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.piece_riotshield_door"
		} )
	end )
	RocketShieldPieceWidget3:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.piece_riotshield_clamp" ), function ( model )
		menu:updateElementState( RocketShieldPieceWidget3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.piece_riotshield_clamp"
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
				self.clipFinished( RocketShieldPieceWidget1, {} )

				RocketShieldPieceWidget2:completeAnimation()
				self.RocketShieldPieceWidget2:setAlpha( 0 )
				self.clipFinished( RocketShieldPieceWidget2, {} )

				RocketShieldPieceWidget3:completeAnimation()
				self.RocketShieldPieceWidget3:setAlpha( 0 )
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
								BG:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
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
							BG:beginAnimation( "keyframe", 2609, false, false, CoD.TweenType.Linear )
							BG:registerEventHandler( "transition_complete_keyframe", BGFrame4 )
						end
					end
					
					if event.interrupted then
						BGFrame3( BG, event )
						return 
					else
						BG:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						BG:setAlpha( 1 )
						BG:registerEventHandler( "transition_complete_keyframe", BGFrame3 )
					end
				end
				
				BG:completeAnimation()
				self.BG:setAlpha( 0 )
				BGFrame2( BG, {} )

				RocketShieldPieceWidget1:completeAnimation()
				self.RocketShieldPieceWidget1:setAlpha( 1 )
				self.clipFinished( RocketShieldPieceWidget1, {} )

				RocketShieldPieceWidget2:completeAnimation()
				self.RocketShieldPieceWidget2:setAlpha( 1 )
				self.clipFinished( RocketShieldPieceWidget2, {} )

				RocketShieldPieceWidget3:completeAnimation()
				self.RocketShieldPieceWidget3:setAlpha( 1 )
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
				self.RocketShieldPieceWidget1:setAlpha( 1 )
				self.clipFinished( RocketShieldPieceWidget1, {} )

				RocketShieldPieceWidget2:completeAnimation()
				self.RocketShieldPieceWidget2:setAlpha( 1 )
				self.clipFinished( RocketShieldPieceWidget2, {} )

				RocketShieldPieceWidget3:completeAnimation()
				self.RocketShieldPieceWidget3:setAlpha( 1 )
				self.clipFinished( RocketShieldPieceWidget3, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "BgVisible",
			condition = function ( menu, element, event )
				return ShowRocketShieldPartsWidget( controller )
			end
		},
		{
			stateName = "Scoreboard",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_shield_parts" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_shield_parts"
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
		element.RocketShieldPieceWidget1:close()
		element.RocketShieldPieceWidget2:close()
		element.RocketShieldPieceWidget3:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

