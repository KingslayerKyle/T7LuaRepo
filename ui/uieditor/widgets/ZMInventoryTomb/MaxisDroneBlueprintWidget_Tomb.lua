-- 9508d1307a1f2a4c147ea11ed9dde195
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.ZMInventory.RocketShieldBluePrint.RocketShieldPieceWidget" )

CoD.MaxisDroneBlueprintWidget_Tomb = InheritFrom( LUI.UIElement )
CoD.MaxisDroneBlueprintWidget_Tomb.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.MaxisDroneBlueprintWidget_Tomb )
	self.id = "MaxisDroneBlueprintWidget_Tomb"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 314 )
	self:setTopBottom( true, false, 0, 129 )
	self.anyChildUsesUpdateState = true
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, false, -19, 325.57 )
	bg:setTopBottom( true, false, -51.16, 184.16 )
	bg:setImage( RegisterImage( "uie_t7_zm_hd_inventory_quest_drone" ) )
	self:addElement( bg )
	self.bg = bg
	
	local MaxisDronePieceWidget1 = CoD.RocketShieldPieceWidget.new( menu, controller )
	MaxisDronePieceWidget1:setLeftRight( true, false, 13.5, 102.5 )
	MaxisDronePieceWidget1:setTopBottom( true, false, 21, 110 )
	MaxisDronePieceWidget1:setScale( 1.01 )
	MaxisDronePieceWidget1.PieceImageNewGreen:setImage( RegisterImage( "uie_t7_zm_icon_hd_maxisdrone_1" ) )
	MaxisDronePieceWidget1.PieceImage:setImage( RegisterImage( "uie_t7_zm_icon_hd_maxisdrone_1" ) )
	MaxisDronePieceWidget1:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and IsInventoryPieceVisible( controller, "piece_quadrotor_zm_body" )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				return IsInventoryWidgetVisible( controller, "show_maxis_drone_parts_widget" ) and IsInventoryPieceVisible( controller, "piece_quadrotor_zm_body" )
			end
		}
	} )
	MaxisDronePieceWidget1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( MaxisDronePieceWidget1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	MaxisDronePieceWidget1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.piece_quadrotor_zm_body" ), function ( model )
		menu:updateElementState( MaxisDronePieceWidget1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.piece_quadrotor_zm_body"
		} )
	end )
	MaxisDronePieceWidget1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.show_maxis_drone_parts_widget" ), function ( model )
		menu:updateElementState( MaxisDronePieceWidget1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.show_maxis_drone_parts_widget"
		} )
	end )
	self:addElement( MaxisDronePieceWidget1 )
	self.MaxisDronePieceWidget1 = MaxisDronePieceWidget1
	
	local MaxisDronePieceWidget2 = CoD.RocketShieldPieceWidget.new( menu, controller )
	MaxisDronePieceWidget2:setLeftRight( true, false, 108.5, 197.5 )
	MaxisDronePieceWidget2:setTopBottom( true, false, 20, 109 )
	MaxisDronePieceWidget2.PieceImageNewGreen:setImage( RegisterImage( "uie_t7_zm_icon_hd_maxisdrone_2" ) )
	MaxisDronePieceWidget2.PieceImage:setImage( RegisterImage( "uie_t7_zm_icon_hd_maxisdrone_2" ) )
	MaxisDronePieceWidget2:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and IsInventoryPieceVisible( controller, "piece_quadrotor_zm_brain" )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				return IsInventoryWidgetVisible( controller, "show_maxis_drone_parts_widget" ) and IsInventoryPieceVisible( controller, "piece_quadrotor_zm_brain" )
			end
		}
	} )
	MaxisDronePieceWidget2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( MaxisDronePieceWidget2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	MaxisDronePieceWidget2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.piece_quadrotor_zm_brain" ), function ( model )
		menu:updateElementState( MaxisDronePieceWidget2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.piece_quadrotor_zm_brain"
		} )
	end )
	MaxisDronePieceWidget2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.show_maxis_drone_parts_widget" ), function ( model )
		menu:updateElementState( MaxisDronePieceWidget2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.show_maxis_drone_parts_widget"
		} )
	end )
	self:addElement( MaxisDronePieceWidget2 )
	self.MaxisDronePieceWidget2 = MaxisDronePieceWidget2
	
	local MaxisDronePieceWidget3 = CoD.RocketShieldPieceWidget.new( menu, controller )
	MaxisDronePieceWidget3:setLeftRight( true, false, 197.5, 286.5 )
	MaxisDronePieceWidget3:setTopBottom( true, false, 20, 109 )
	MaxisDronePieceWidget3:setScale( 0.92 )
	MaxisDronePieceWidget3.PieceImageNewGreen:setImage( RegisterImage( "uie_t7_zm_icon_hd_maxisdrone_3" ) )
	MaxisDronePieceWidget3.PieceImage:setImage( RegisterImage( "uie_t7_zm_icon_hd_maxisdrone_3" ) )
	MaxisDronePieceWidget3:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and IsInventoryPieceVisible( controller, "piece_quadrotor_zm_engine" )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				return IsInventoryWidgetVisible( controller, "show_maxis_drone_parts_widget" ) and IsInventoryPieceVisible( controller, "piece_quadrotor_zm_engine" )
			end
		}
	} )
	MaxisDronePieceWidget3:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( MaxisDronePieceWidget3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	MaxisDronePieceWidget3:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.piece_quadrotor_zm_engine" ), function ( model )
		menu:updateElementState( MaxisDronePieceWidget3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.piece_quadrotor_zm_engine"
		} )
	end )
	MaxisDronePieceWidget3:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.show_maxis_drone_parts_widget" ), function ( model )
		menu:updateElementState( MaxisDronePieceWidget3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.show_maxis_drone_parts_widget"
		} )
	end )
	self:addElement( MaxisDronePieceWidget3 )
	self.MaxisDronePieceWidget3 = MaxisDronePieceWidget3
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				bg:completeAnimation()
				self.bg:setAlpha( 0 )
				self.clipFinished( bg, {} )

				MaxisDronePieceWidget1:completeAnimation()
				self.MaxisDronePieceWidget1:setAlpha( 0 )
				self.clipFinished( MaxisDronePieceWidget1, {} )

				MaxisDronePieceWidget2:completeAnimation()
				self.MaxisDronePieceWidget2:setAlpha( 0 )
				self.clipFinished( MaxisDronePieceWidget2, {} )

				MaxisDronePieceWidget3:completeAnimation()
				self.MaxisDronePieceWidget3:setAlpha( 0 )
				self.clipFinished( MaxisDronePieceWidget3, {} )
			end
		},
		Scoreboard = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				bg:completeAnimation()
				self.bg:setAlpha( 0 )
				self.clipFinished( bg, {} )

				MaxisDronePieceWidget1:completeAnimation()
				self.MaxisDronePieceWidget1:setLeftRight( true, false, 13.5, 102.5 )
				self.MaxisDronePieceWidget1:setTopBottom( true, false, 21, 110 )
				self.MaxisDronePieceWidget1:setAlpha( 1 )
				self.MaxisDronePieceWidget1:setScale( 1.05 )
				self.clipFinished( MaxisDronePieceWidget1, {} )

				MaxisDronePieceWidget2:completeAnimation()
				self.MaxisDronePieceWidget2:setLeftRight( true, false, 108.5, 197.5 )
				self.MaxisDronePieceWidget2:setTopBottom( true, false, 20, 109 )
				self.MaxisDronePieceWidget2:setAlpha( 1 )
				self.MaxisDronePieceWidget2:setScale( 1 )
				self.clipFinished( MaxisDronePieceWidget2, {} )

				MaxisDronePieceWidget3:completeAnimation()
				self.MaxisDronePieceWidget3:setLeftRight( true, false, 197.5, 286.5 )
				self.MaxisDronePieceWidget3:setTopBottom( true, false, 20, 109 )
				self.MaxisDronePieceWidget3:setAlpha( 1 )
				self.MaxisDronePieceWidget3:setScale( 0.92 )
				self.clipFinished( MaxisDronePieceWidget3, {} )
			end
		},
		BgVisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				local bgFrame2 = function ( bg, event )
					local bgFrame3 = function ( bg, event )
						local bgFrame4 = function ( bg, event )
							if not event.interrupted then
								bg:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Linear )
							end
							bg:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( bg, event )
							else
								bg:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							bgFrame4( bg, event )
							return 
						else
							bg:beginAnimation( "keyframe", 2700, false, false, CoD.TweenType.Linear )
							bg:registerEventHandler( "transition_complete_keyframe", bgFrame4 )
						end
					end
					
					if event.interrupted then
						bgFrame3( bg, event )
						return 
					else
						bg:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						bg:setAlpha( 1 )
						bg:registerEventHandler( "transition_complete_keyframe", bgFrame3 )
					end
				end
				
				bg:completeAnimation()
				self.bg:setAlpha( 0 )
				bgFrame2( bg, {} )

				MaxisDronePieceWidget1:completeAnimation()
				self.MaxisDronePieceWidget1:setLeftRight( true, false, 41, 130 )
				self.MaxisDronePieceWidget1:setTopBottom( true, false, 19, 108 )
				self.MaxisDronePieceWidget1:setAlpha( 1 )
				self.MaxisDronePieceWidget1:setScale( 0.89 )
				self.clipFinished( MaxisDronePieceWidget1, {} )

				MaxisDronePieceWidget2:completeAnimation()
				self.MaxisDronePieceWidget2:setLeftRight( true, false, 125.5, 214.5 )
				self.MaxisDronePieceWidget2:setTopBottom( true, false, 16, 105 )
				self.MaxisDronePieceWidget2:setAlpha( 1 )
				self.MaxisDronePieceWidget2:setScale( 0.82 )
				self.clipFinished( MaxisDronePieceWidget2, {} )

				MaxisDronePieceWidget3:completeAnimation()
				self.MaxisDronePieceWidget3:setLeftRight( true, false, 205.5, 294.5 )
				self.MaxisDronePieceWidget3:setTopBottom( true, false, 16.5, 105.5 )
				self.MaxisDronePieceWidget3:setAlpha( 1 )
				self.MaxisDronePieceWidget3:setScale( 0.8 )
				self.clipFinished( MaxisDronePieceWidget3, {} )
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
				return IsInventoryWidgetVisible( controller, "show_maxis_drone_parts_widget" )
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
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.show_maxis_drone_parts_widget" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.show_maxis_drone_parts_widget"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.MaxisDronePieceWidget1:close()
		element.MaxisDronePieceWidget2:close()
		element.MaxisDronePieceWidget3:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

