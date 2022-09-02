-- b8d5f292aa5d5ce2cc48f89a88516ddc
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.ZMInventoryCastle.RagnarokPieceWidget" )

CoD.RagnarokBlueprintWidget_Castle = InheritFrom( LUI.UIElement )
CoD.RagnarokBlueprintWidget_Castle.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.RagnarokBlueprintWidget_Castle )
	self.id = "RagnarokBlueprintWidget_Castle"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 314 )
	self:setTopBottom( true, false, 0, 129 )
	self.anyChildUsesUpdateState = true
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( true, false, -39.8, 284 )
	BG:setTopBottom( true, false, -46.52, 188.83 )
	BG:setAlpha( 0 )
	BG:setImage( RegisterImage( "uie_t7_base_quest_spikes_dlc" ) )
	self:addElement( BG )
	self.BG = BG
	
	local RagnarokPieceWidgetBody = CoD.RagnarokPieceWidget.new( menu, controller )
	RagnarokPieceWidgetBody:setLeftRight( true, false, 234, 323 )
	RagnarokPieceWidgetBody:setTopBottom( true, false, 22.23, 111.23 )
	RagnarokPieceWidgetBody:setScale( 0.9 )
	RagnarokPieceWidgetBody.PieceImageNewGreen:setImage( RegisterImage( "uie_t7_icon_inventory_dlc_talon_spikes_body_new" ) )
	RagnarokPieceWidgetBody.PieceImage:setImage( RegisterImage( "uie_t7_icon_inventory_dlc_talon_spikes_body" ) )
	RagnarokPieceWidgetBody:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and HasTalonSpikeItem( controller, "CRAFTABLE_PART_GRAVITYSPIKE_BODY" )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "zmInventory.widget_gravityspike_parts", 1 ) and HasTalonSpikeItem( controller, "CRAFTABLE_PART_GRAVITYSPIKE_BODY" )
			end
		}
	} )
	RagnarokPieceWidgetBody:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( RagnarokPieceWidgetBody, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	RagnarokPieceWidgetBody:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.gravityspike_part_body" ), function ( model )
		menu:updateElementState( RagnarokPieceWidgetBody, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.gravityspike_part_body"
		} )
	end )
	RagnarokPieceWidgetBody:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.gravityspike_part_guards" ), function ( model )
		menu:updateElementState( RagnarokPieceWidgetBody, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.gravityspike_part_guards"
		} )
	end )
	RagnarokPieceWidgetBody:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.gravityspike_part_handle" ), function ( model )
		menu:updateElementState( RagnarokPieceWidgetBody, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.gravityspike_part_handle"
		} )
	end )
	RagnarokPieceWidgetBody:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_gravityspike_parts" ), function ( model )
		menu:updateElementState( RagnarokPieceWidgetBody, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_gravityspike_parts"
		} )
	end )
	self:addElement( RagnarokPieceWidgetBody )
	self.RagnarokPieceWidgetBody = RagnarokPieceWidgetBody
	
	local RagnarokPieceWidgetGuards = CoD.RagnarokPieceWidget.new( menu, controller )
	RagnarokPieceWidgetGuards:setLeftRight( true, false, 16, 105 )
	RagnarokPieceWidgetGuards:setTopBottom( true, false, 24.23, 113.23 )
	RagnarokPieceWidgetGuards:setScale( 0.95 )
	RagnarokPieceWidgetGuards.PieceImageNewGreen:setImage( RegisterImage( "uie_t7_icon_inventory_dlc_talon_spikes_guards_new" ) )
	RagnarokPieceWidgetGuards.PieceImage:setImage( RegisterImage( "uie_t7_icon_inventory_dlc_talon_spikes_guards" ) )
	RagnarokPieceWidgetGuards:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and HasTalonSpikeItem( controller, "CRAFTABLE_PART_GRAVITYSPIKE_GUARDS" )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "zmInventory.widget_gravityspike_parts", 1 ) and HasTalonSpikeItem( controller, "CRAFTABLE_PART_GRAVITYSPIKE_GUARDS" )
			end
		}
	} )
	RagnarokPieceWidgetGuards:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( RagnarokPieceWidgetGuards, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	RagnarokPieceWidgetGuards:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.gravityspike_part_body" ), function ( model )
		menu:updateElementState( RagnarokPieceWidgetGuards, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.gravityspike_part_body"
		} )
	end )
	RagnarokPieceWidgetGuards:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.gravityspike_part_guards" ), function ( model )
		menu:updateElementState( RagnarokPieceWidgetGuards, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.gravityspike_part_guards"
		} )
	end )
	RagnarokPieceWidgetGuards:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.gravityspike_part_handle" ), function ( model )
		menu:updateElementState( RagnarokPieceWidgetGuards, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.gravityspike_part_handle"
		} )
	end )
	RagnarokPieceWidgetGuards:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_gravityspike_parts" ), function ( model )
		menu:updateElementState( RagnarokPieceWidgetGuards, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_gravityspike_parts"
		} )
	end )
	self:addElement( RagnarokPieceWidgetGuards )
	self.RagnarokPieceWidgetGuards = RagnarokPieceWidgetGuards
	
	local RagnarokPieceWidgetHandle = CoD.RagnarokPieceWidget.new( menu, controller )
	RagnarokPieceWidgetHandle:setLeftRight( true, false, 124.1, 213.1 )
	RagnarokPieceWidgetHandle:setTopBottom( true, false, 25.23, 114.23 )
	RagnarokPieceWidgetHandle:setScale( 0.9 )
	RagnarokPieceWidgetHandle.PieceImageNewGreen:setImage( RegisterImage( "uie_t7_icon_inventory_dlc_talon_spikes_handle_new" ) )
	RagnarokPieceWidgetHandle.PieceImage:setImage( RegisterImage( "uie_t7_icon_inventory_dlc_talon_spikes_handle" ) )
	RagnarokPieceWidgetHandle:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and HasTalonSpikeItem( controller, "CRAFTABLE_PART_GRAVITYSPIKE_HANDLE" )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "zmInventory.widget_gravityspike_parts", 1 ) and HasTalonSpikeItem( controller, "CRAFTABLE_PART_GRAVITYSPIKE_HANDLE" )
			end
		}
	} )
	RagnarokPieceWidgetHandle:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( RagnarokPieceWidgetHandle, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	RagnarokPieceWidgetHandle:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.gravityspike_part_body" ), function ( model )
		menu:updateElementState( RagnarokPieceWidgetHandle, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.gravityspike_part_body"
		} )
	end )
	RagnarokPieceWidgetHandle:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.gravityspike_part_guards" ), function ( model )
		menu:updateElementState( RagnarokPieceWidgetHandle, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.gravityspike_part_guards"
		} )
	end )
	RagnarokPieceWidgetHandle:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.gravityspike_part_handle" ), function ( model )
		menu:updateElementState( RagnarokPieceWidgetHandle, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.gravityspike_part_handle"
		} )
	end )
	RagnarokPieceWidgetHandle:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_gravityspike_parts" ), function ( model )
		menu:updateElementState( RagnarokPieceWidgetHandle, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_gravityspike_parts"
		} )
	end )
	self:addElement( RagnarokPieceWidgetHandle )
	self.RagnarokPieceWidgetHandle = RagnarokPieceWidgetHandle
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				BG:completeAnimation()
				self.BG:setAlpha( 0 )
				self.clipFinished( BG, {} )

				RagnarokPieceWidgetBody:completeAnimation()
				self.RagnarokPieceWidgetBody:setAlpha( 0 )
				self.clipFinished( RagnarokPieceWidgetBody, {} )

				RagnarokPieceWidgetGuards:completeAnimation()
				self.RagnarokPieceWidgetGuards:setAlpha( 0 )
				self.clipFinished( RagnarokPieceWidgetGuards, {} )

				RagnarokPieceWidgetHandle:completeAnimation()
				self.RagnarokPieceWidgetHandle:setAlpha( 0 )
				self.clipFinished( RagnarokPieceWidgetHandle, {} )
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

				RagnarokPieceWidgetBody:completeAnimation()
				self.RagnarokPieceWidgetBody:setLeftRight( true, false, 176, 265 )
				self.RagnarokPieceWidgetBody:setTopBottom( true, false, 23.23, 112.23 )
				self.RagnarokPieceWidgetBody:setAlpha( 1 )
				self.RagnarokPieceWidgetBody:setScale( 0.85 )
				self.clipFinished( RagnarokPieceWidgetBody, {} )

				RagnarokPieceWidgetGuards:completeAnimation()
				self.RagnarokPieceWidgetGuards:setLeftRight( true, false, 8, 97 )
				self.RagnarokPieceWidgetGuards:setTopBottom( true, false, 25.23, 114.23 )
				self.RagnarokPieceWidgetGuards:setAlpha( 1 )
				self.RagnarokPieceWidgetGuards:setScale( 0.85 )
				self.clipFinished( RagnarokPieceWidgetGuards, {} )

				RagnarokPieceWidgetHandle:completeAnimation()
				self.RagnarokPieceWidgetHandle:setLeftRight( true, false, 93, 182 )
				self.RagnarokPieceWidgetHandle:setTopBottom( true, false, 25.23, 114.23 )
				self.RagnarokPieceWidgetHandle:setAlpha( 1 )
				self.RagnarokPieceWidgetHandle:setScale( 0.85 )
				self.clipFinished( RagnarokPieceWidgetHandle, {} )
			end
		},
		Scoreboard = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				BG:completeAnimation()
				self.BG:setLeftRight( true, false, -39.8, 284 )
				self.BG:setTopBottom( true, false, -47.94, 187.41 )
				self.BG:setAlpha( 0 )
				self.clipFinished( BG, {} )

				RagnarokPieceWidgetBody:completeAnimation()
				self.RagnarokPieceWidgetBody:setLeftRight( true, false, 234, 323 )
				self.RagnarokPieceWidgetBody:setTopBottom( true, false, 21.23, 110.23 )
				self.RagnarokPieceWidgetBody:setAlpha( 1 )
				self.RagnarokPieceWidgetBody:setScale( 0.9 )
				self.clipFinished( RagnarokPieceWidgetBody, {} )

				RagnarokPieceWidgetGuards:completeAnimation()
				self.RagnarokPieceWidgetGuards:setLeftRight( true, false, 19, 108 )
				self.RagnarokPieceWidgetGuards:setTopBottom( true, false, 23.23, 112.23 )
				self.RagnarokPieceWidgetGuards:setAlpha( 1 )
				self.RagnarokPieceWidgetGuards:setScale( 0.9 )
				self.clipFinished( RagnarokPieceWidgetGuards, {} )

				RagnarokPieceWidgetHandle:completeAnimation()
				self.RagnarokPieceWidgetHandle:setLeftRight( true, false, 126.1, 215.1 )
				self.RagnarokPieceWidgetHandle:setTopBottom( true, false, 22.23, 111.23 )
				self.RagnarokPieceWidgetHandle:setAlpha( 1 )
				self.RagnarokPieceWidgetHandle:setScale( 0.85 )
				self.clipFinished( RagnarokPieceWidgetHandle, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "BgVisible",
			condition = function ( menu, element, event )
				return ShowGravitySpikePartsWidget( controller )
			end
		},
		{
			stateName = "Scoreboard",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_gravityspike_parts" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_gravityspike_parts"
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
		element.RagnarokPieceWidgetBody:close()
		element.RagnarokPieceWidgetGuards:close()
		element.RagnarokPieceWidgetHandle:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

