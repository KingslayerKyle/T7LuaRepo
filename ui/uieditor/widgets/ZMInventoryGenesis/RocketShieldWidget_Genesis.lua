-- fc3cffb0761a132f12fd0b4c3117a0d3
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.ZMInventory.RocketShieldBluePrint.RocketShieldPieceWidget" )

CoD.RocketShieldWidget_Genesis = InheritFrom( LUI.UIElement )
CoD.RocketShieldWidget_Genesis.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.RocketShieldWidget_Genesis )
	self.id = "RocketShieldWidget_Genesis"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 314 )
	self:setTopBottom( true, false, 0, 129 )
	self.anyChildUsesUpdateState = true
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, false, -11.57, 256.29 )
	bg:setTopBottom( true, false, -20.72, 162.2 )
	bg:setImage( RegisterImage( "uie_t7_base_quest_shield_dlc4" ) )
	self:addElement( bg )
	self.bg = bg
	
	local MachineToolsPieceWidget1 = CoD.RocketShieldPieceWidget.new( menu, controller )
	MachineToolsPieceWidget1:setLeftRight( true, false, 11, 100 )
	MachineToolsPieceWidget1:setTopBottom( true, false, 26.24, 115.24 )
	MachineToolsPieceWidget1:setScale( 1.35 )
	MachineToolsPieceWidget1.PieceImageNewGreen:setImage( RegisterImage( "uie_t7_icon_inventory_dlc4_shield1_new" ) )
	MachineToolsPieceWidget1.PieceImage:setImage( RegisterImage( "uie_t7_icon_inventory_dlc4_shield1" ) )
	MachineToolsPieceWidget1:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and IsInventoryPieceVisible( controller, "piece_riotshield_dolly" )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				return IsInventoryWidgetVisible( controller, "widget_shield_parts" ) and IsInventoryPieceVisible( controller, "piece_riotshield_dolly" )
			end
		}
	} )
	MachineToolsPieceWidget1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( MachineToolsPieceWidget1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	MachineToolsPieceWidget1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.piece_riotshield_dolly" ), function ( model )
		menu:updateElementState( MachineToolsPieceWidget1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.piece_riotshield_dolly"
		} )
	end )
	MachineToolsPieceWidget1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_shield_parts" ), function ( model )
		menu:updateElementState( MachineToolsPieceWidget1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_shield_parts"
		} )
	end )
	self:addElement( MachineToolsPieceWidget1 )
	self.MachineToolsPieceWidget1 = MachineToolsPieceWidget1
	
	local MachineToolsPieceWidget0 = CoD.RocketShieldPieceWidget.new( menu, controller )
	MachineToolsPieceWidget0:setLeftRight( true, false, 145, 234 )
	MachineToolsPieceWidget0:setTopBottom( true, false, 26.24, 115.24 )
	MachineToolsPieceWidget0:setScale( 1.35 )
	MachineToolsPieceWidget0.PieceImageNewGreen:setImage( RegisterImage( "uie_t7_icon_inventory_dlc4_shield2_new" ) )
	MachineToolsPieceWidget0.PieceImage:setImage( RegisterImage( "uie_t7_icon_inventory_dlc4_shield2" ) )
	MachineToolsPieceWidget0:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and IsInventoryPieceVisible( controller, "piece_riotshield_door" )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				return IsInventoryWidgetVisible( controller, "widget_shield_parts" ) and IsInventoryPieceVisible( controller, "piece_riotshield_door" )
			end
		}
	} )
	MachineToolsPieceWidget0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( MachineToolsPieceWidget0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	MachineToolsPieceWidget0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.piece_riotshield_door" ), function ( model )
		menu:updateElementState( MachineToolsPieceWidget0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.piece_riotshield_door"
		} )
	end )
	MachineToolsPieceWidget0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_shield_parts" ), function ( model )
		menu:updateElementState( MachineToolsPieceWidget0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_shield_parts"
		} )
	end )
	self:addElement( MachineToolsPieceWidget0 )
	self.MachineToolsPieceWidget0 = MachineToolsPieceWidget0
	
	local MachineToolsPieceWidget2 = CoD.RocketShieldPieceWidget.new( menu, controller )
	MachineToolsPieceWidget2:setLeftRight( true, false, 282.5, 371.5 )
	MachineToolsPieceWidget2:setTopBottom( true, false, 26.24, 115.24 )
	MachineToolsPieceWidget2:setScale( 1.35 )
	MachineToolsPieceWidget2.PieceImageNewGreen:setImage( RegisterImage( "uie_t7_icon_inventory_dlc4_shield3_new" ) )
	MachineToolsPieceWidget2.PieceImage:setImage( RegisterImage( "uie_t7_icon_inventory_dlc4_shield3" ) )
	MachineToolsPieceWidget2:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and IsInventoryPieceVisible( controller, "piece_riotshield_clamp" )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				return IsInventoryWidgetVisible( controller, "widget_shield_parts" ) and IsInventoryPieceVisible( controller, "piece_riotshield_clamp" )
			end
		}
	} )
	MachineToolsPieceWidget2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( MachineToolsPieceWidget2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	MachineToolsPieceWidget2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.piece_riotshield_clamp" ), function ( model )
		menu:updateElementState( MachineToolsPieceWidget2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.piece_riotshield_clamp"
		} )
	end )
	MachineToolsPieceWidget2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_shield_parts" ), function ( model )
		menu:updateElementState( MachineToolsPieceWidget2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_shield_parts"
		} )
	end )
	self:addElement( MachineToolsPieceWidget2 )
	self.MachineToolsPieceWidget2 = MachineToolsPieceWidget2
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				bg:completeAnimation()
				self.bg:setAlpha( 0 )
				self.clipFinished( bg, {} )

				MachineToolsPieceWidget1:completeAnimation()
				self.MachineToolsPieceWidget1:setAlpha( 0 )
				self.clipFinished( MachineToolsPieceWidget1, {} )

				MachineToolsPieceWidget0:completeAnimation()
				self.MachineToolsPieceWidget0:setAlpha( 0 )
				self.clipFinished( MachineToolsPieceWidget0, {} )

				MachineToolsPieceWidget2:completeAnimation()
				self.MachineToolsPieceWidget2:setAlpha( 0 )
				self.clipFinished( MachineToolsPieceWidget2, {} )
			end
		},
		Scoreboard = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				bg:completeAnimation()
				self.bg:setAlpha( 0 )
				self.clipFinished( bg, {} )

				MachineToolsPieceWidget1:completeAnimation()
				self.MachineToolsPieceWidget1:setLeftRight( true, false, 14, 103 )
				self.MachineToolsPieceWidget1:setTopBottom( true, false, 26.24, 115.24 )
				self.MachineToolsPieceWidget1:setAlpha( 1 )
				self.MachineToolsPieceWidget1:setScale( 1.2 )
				self.clipFinished( MachineToolsPieceWidget1, {} )

				MachineToolsPieceWidget0:completeAnimation()
				self.MachineToolsPieceWidget0:setLeftRight( true, false, 112.5, 201.5 )
				self.MachineToolsPieceWidget0:setTopBottom( true, false, 28.24, 117.24 )
				self.MachineToolsPieceWidget0:setAlpha( 1 )
				self.MachineToolsPieceWidget0:setScale( 1.2 )
				self.clipFinished( MachineToolsPieceWidget0, {} )

				MachineToolsPieceWidget2:completeAnimation()
				self.MachineToolsPieceWidget2:setLeftRight( true, false, 208.79, 297.79 )
				self.MachineToolsPieceWidget2:setTopBottom( true, false, 26.24, 115.24 )
				self.MachineToolsPieceWidget2:setAlpha( 1 )
				self.MachineToolsPieceWidget2:setScale( 1.3 )
				self.clipFinished( MachineToolsPieceWidget2, {} )
			end
		},
		BgVisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				local bgFrame2 = function ( bg, event )
					local bgFrame3 = function ( bg, event )
						local bgFrame4 = function ( bg, event )
							if not event.interrupted then
								bg:beginAnimation( "keyframe", 339, false, false, CoD.TweenType.Linear )
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
							bg:beginAnimation( "keyframe", 2710, false, false, CoD.TweenType.Linear )
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

				MachineToolsPieceWidget1:completeAnimation()
				self.MachineToolsPieceWidget1:setLeftRight( true, false, 3, 92 )
				self.MachineToolsPieceWidget1:setTopBottom( true, false, 25.24, 114.24 )
				self.MachineToolsPieceWidget1:setAlpha( 1 )
				self.MachineToolsPieceWidget1:setScale( 1.05 )
				self.clipFinished( MachineToolsPieceWidget1, {} )

				MachineToolsPieceWidget0:completeAnimation()
				self.MachineToolsPieceWidget0:setLeftRight( true, false, 79.86, 168.86 )
				self.MachineToolsPieceWidget0:setTopBottom( true, false, 24.24, 113.24 )
				self.MachineToolsPieceWidget0:setAlpha( 1 )
				self.MachineToolsPieceWidget0:setScale( 1.07 )
				self.clipFinished( MachineToolsPieceWidget0, {} )

				MachineToolsPieceWidget2:completeAnimation()
				self.MachineToolsPieceWidget2:setLeftRight( true, false, 153.29, 242.29 )
				self.MachineToolsPieceWidget2:setTopBottom( true, false, 23.24, 112.24 )
				self.MachineToolsPieceWidget2:setAlpha( 1 )
				self.MachineToolsPieceWidget2:setScale( 0.93 )
				self.clipFinished( MachineToolsPieceWidget2, {} )
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
				return IsInventoryWidgetVisible( controller, "widget_shield_parts" )
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
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_shield_parts" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_shield_parts"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.MachineToolsPieceWidget1:close()
		element.MachineToolsPieceWidget0:close()
		element.MachineToolsPieceWidget2:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

