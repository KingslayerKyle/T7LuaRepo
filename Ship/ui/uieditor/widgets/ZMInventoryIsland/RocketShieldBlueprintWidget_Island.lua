-- b1ff32aa9268483b3d6aaf3290616dc1
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.ZMInventory.RocketShieldBluePrint.RocketShieldPieceWidget" )

CoD.RocketShieldBlueprintWidget_Island = InheritFrom( LUI.UIElement )
CoD.RocketShieldBlueprintWidget_Island.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.RocketShieldBlueprintWidget_Island )
	self.id = "RocketShieldBlueprintWidget_Island"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 314 )
	self:setTopBottom( true, false, 0, 129 )
	self.anyChildUsesUpdateState = true
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( true, false, -22, 273.14 )
	BG:setTopBottom( true, false, -34.5, 167.06 )
	BG:setImage( RegisterImage( "uie_t7_base_quest_shield_dlc2" ) )
	self:addElement( BG )
	self.BG = BG
	
	local RocketShieldPieceWidget1 = CoD.RocketShieldPieceWidget.new( menu, controller )
	RocketShieldPieceWidget1:setLeftRight( true, false, 87.74, 176.26 )
	RocketShieldPieceWidget1:setTopBottom( true, false, 20.24, 108.76 )
	RocketShieldPieceWidget1:setScale( 0.9 )
	RocketShieldPieceWidget1.PieceImageNewGreen:setImage( RegisterImage( "uie_t7_icon_inventory_dlc2_shield_frame_new" ) )
	RocketShieldPieceWidget1.PieceImage:setImage( RegisterImage( "uie_t7_icon_inventory_dlc2_shield_frame" ) )
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
				local f3_local0
				if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) then
					f3_local0 = ShowRocketShieldPartsWidget( controller )
					if f3_local0 then
						f3_local0 = RocketShieldBlueprintPieceVisible( controller, "CLIENTFIELD_CRAFTABLE_PIECE_RIOTSHIELD_DOLLY" )
					end
				else
					f3_local0 = false
				end
				return f3_local0
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
	RocketShieldPieceWidget1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_shield_parts" ), function ( model )
		menu:updateElementState( RocketShieldPieceWidget1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_shield_parts"
		} )
	end )
	self:addElement( RocketShieldPieceWidget1 )
	self.RocketShieldPieceWidget1 = RocketShieldPieceWidget1
	
	local RocketShieldPieceWidget2 = CoD.RocketShieldPieceWidget.new( menu, controller )
	RocketShieldPieceWidget2:setLeftRight( true, false, 157.74, 246.26 )
	RocketShieldPieceWidget2:setTopBottom( true, false, 19.24, 107.76 )
	RocketShieldPieceWidget2:setScale( 0.95 )
	RocketShieldPieceWidget2.PieceImageNewGreen:setImage( RegisterImage( "uie_t7_icon_inventory_dlc2_shield_door_new" ) )
	RocketShieldPieceWidget2.PieceImage:setImage( RegisterImage( "uie_t7_icon_inventory_dlc2_shield_door" ) )
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
				local f10_local0
				if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) then
					f10_local0 = ShowRocketShieldPartsWidget( controller )
					if f10_local0 then
						f10_local0 = RocketShieldBlueprintPieceVisible( controller, "CLIENTFIELD_CRAFTABLE_PIECE_RIOTSHIELD_DOOR" )
					end
				else
					f10_local0 = false
				end
				return f10_local0
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
	RocketShieldPieceWidget2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_shield_parts" ), function ( model )
		menu:updateElementState( RocketShieldPieceWidget2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_shield_parts"
		} )
	end )
	self:addElement( RocketShieldPieceWidget2 )
	self.RocketShieldPieceWidget2 = RocketShieldPieceWidget2
	
	local RocketShieldPieceWidget3 = CoD.RocketShieldPieceWidget.new( menu, controller )
	RocketShieldPieceWidget3:setLeftRight( true, false, 15.27, 103.79 )
	RocketShieldPieceWidget3:setTopBottom( true, false, 20.24, 108.76 )
	RocketShieldPieceWidget3:setScale( 0.95 )
	RocketShieldPieceWidget3.PieceImageNewGreen:setImage( RegisterImage( "uie_t7_icon_inventory_dlc2_shield_window_new" ) )
	RocketShieldPieceWidget3.PieceImage:setImage( RegisterImage( "uie_t7_icon_inventory_dlc2_shield_window" ) )
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
				local f17_local0
				if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) then
					f17_local0 = ShowRocketShieldPartsWidget( controller )
					if f17_local0 then
						f17_local0 = RocketShieldBlueprintPieceVisible( controller, "CLIENTFIELD_CRAFTABLE_PIECE_RIOTSHIELD_CLAMP" )
					end
				else
					f17_local0 = false
				end
				return f17_local0
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
	RocketShieldPieceWidget3:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_shield_parts" ), function ( model )
		menu:updateElementState( RocketShieldPieceWidget3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_shield_parts"
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
				self.RocketShieldPieceWidget1:setLeftRight( true, false, 88.74, 177.26 )
				self.RocketShieldPieceWidget1:setTopBottom( true, false, 23.24, 111.76 )
				self.RocketShieldPieceWidget1:setAlpha( 0 )
				self.RocketShieldPieceWidget1:setScale( 0.9 )
				self.clipFinished( RocketShieldPieceWidget1, {} )

				RocketShieldPieceWidget2:completeAnimation()
				self.RocketShieldPieceWidget2:setLeftRight( true, false, 158.74, 247.26 )
				self.RocketShieldPieceWidget2:setTopBottom( true, false, 19.24, 107.76 )
				self.RocketShieldPieceWidget2:setAlpha( 0 )
				self.RocketShieldPieceWidget2:setScale( 1 )
				self.clipFinished( RocketShieldPieceWidget2, {} )

				RocketShieldPieceWidget3:completeAnimation()
				self.RocketShieldPieceWidget3:setLeftRight( true, false, 15.27, 103.79 )
				self.RocketShieldPieceWidget3:setTopBottom( true, false, 20.24, 108.76 )
				self.RocketShieldPieceWidget3:setAlpha( 0 )
				self.RocketShieldPieceWidget3:setScale( 1 )
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
