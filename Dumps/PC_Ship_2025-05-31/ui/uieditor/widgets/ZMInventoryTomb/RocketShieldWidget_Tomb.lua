require( "ui.uieditor.widgets.ZMInventory.RocketShieldBluePrint.RocketShieldPieceWidget" )

CoD.RocketShieldWidget_Tomb = InheritFrom( LUI.UIElement )
CoD.RocketShieldWidget_Tomb.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.RocketShieldWidget_Tomb )
	self.id = "RocketShieldWidget_Tomb"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 314 )
	self:setTopBottom( true, false, 0, 129 )
	self.anyChildUsesUpdateState = true
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, false, -19, 325.57 )
	bg:setTopBottom( true, false, -51.16, 184.16 )
	bg:setImage( RegisterImage( "uie_t7_zm_hd_inventory_quest_shield" ) )
	self:addElement( bg )
	self.bg = bg
	
	local RocketShieldPieceWidget1 = CoD.RocketShieldPieceWidget.new( menu, controller )
	RocketShieldPieceWidget1:setLeftRight( true, false, 19, 108 )
	RocketShieldPieceWidget1:setTopBottom( true, false, 22, 111 )
	RocketShieldPieceWidget1.PieceImageNewGreen:setImage( RegisterImage( "uie_t7_zm_icon_hd_shieldpart_1" ) )
	RocketShieldPieceWidget1.PieceImage:setImage( RegisterImage( "uie_t7_zm_icon_hd_shieldpart_1" ) )
	RocketShieldPieceWidget1:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and RocketShieldBlueprintPieceVisible( controller, "CLIENTFIELD_CRAFTABLE_PIECE_RIOTSHIELD_CLAMP" )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				return IsInventoryWidgetVisible( controller, "widget_shield_parts" ) and RocketShieldBlueprintPieceVisible( controller, "CLIENTFIELD_CRAFTABLE_PIECE_RIOTSHIELD_CLAMP" )
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
	RocketShieldPieceWidget2:setLeftRight( true, false, 119.5, 208.5 )
	RocketShieldPieceWidget2:setTopBottom( true, false, 20, 109 )
	RocketShieldPieceWidget2.PieceImageNewGreen:setImage( RegisterImage( "uie_t7_zm_icon_hd_shieldpart_2" ) )
	RocketShieldPieceWidget2.PieceImage:setImage( RegisterImage( "uie_t7_zm_icon_hd_shieldpart_2" ) )
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
				return IsInventoryWidgetVisible( controller, "widget_shield_parts" ) and RocketShieldBlueprintPieceVisible( controller, "CLIENTFIELD_CRAFTABLE_PIECE_RIOTSHIELD_DOOR" )
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
	RocketShieldPieceWidget3:setLeftRight( true, false, 216, 305 )
	RocketShieldPieceWidget3:setTopBottom( true, false, 20, 109 )
	RocketShieldPieceWidget3.PieceImageNewGreen:setImage( RegisterImage( "uie_t7_zm_icon_hd_shieldpart_3" ) )
	RocketShieldPieceWidget3.PieceImage:setImage( RegisterImage( "uie_t7_zm_icon_hd_shieldpart_3" ) )
	RocketShieldPieceWidget3:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and RocketShieldBlueprintPieceVisible( controller, "CLIENTFIELD_CRAFTABLE_PIECE_RIOTSHIELD_DOLLY" )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				return IsInventoryWidgetVisible( controller, "widget_shield_parts" ) and RocketShieldBlueprintPieceVisible( controller, "CLIENTFIELD_CRAFTABLE_PIECE_RIOTSHIELD_DOLLY" )
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
				bg:completeAnimation()
				self.bg:setAlpha( 0 )
				self.clipFinished( bg, {} )
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
		Scoreboard = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				bg:completeAnimation()
				self.bg:setAlpha( 0 )
				self.clipFinished( bg, {} )
				RocketShieldPieceWidget1:completeAnimation()
				self.RocketShieldPieceWidget1:setLeftRight( true, false, 19, 108 )
				self.RocketShieldPieceWidget1:setTopBottom( true, false, 22, 111 )
				self.RocketShieldPieceWidget1:setAlpha( 1 )
				self.RocketShieldPieceWidget1:setScale( 1 )
				self.clipFinished( RocketShieldPieceWidget1, {} )
				RocketShieldPieceWidget2:completeAnimation()
				self.RocketShieldPieceWidget2:setLeftRight( true, false, 119.5, 208.5 )
				self.RocketShieldPieceWidget2:setTopBottom( true, false, 20, 109 )
				self.RocketShieldPieceWidget2:setAlpha( 1 )
				self.RocketShieldPieceWidget2:setScale( 1 )
				self.clipFinished( RocketShieldPieceWidget2, {} )
				RocketShieldPieceWidget3:completeAnimation()
				self.RocketShieldPieceWidget3:setLeftRight( true, false, 216, 305 )
				self.RocketShieldPieceWidget3:setTopBottom( true, false, 20, 109 )
				self.RocketShieldPieceWidget3:setAlpha( 1 )
				self.RocketShieldPieceWidget3:setScale( 1 )
				self.clipFinished( RocketShieldPieceWidget3, {} )
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
				RocketShieldPieceWidget1:completeAnimation()
				self.RocketShieldPieceWidget1:setLeftRight( true, false, 36.5, 125.5 )
				self.RocketShieldPieceWidget1:setTopBottom( true, false, 17.5, 106.5 )
				self.RocketShieldPieceWidget1:setAlpha( 1 )
				self.RocketShieldPieceWidget1:setScale( 0.81 )
				self.clipFinished( RocketShieldPieceWidget1, {} )
				RocketShieldPieceWidget2:completeAnimation()
				self.RocketShieldPieceWidget2:setLeftRight( true, false, 120, 209 )
				self.RocketShieldPieceWidget2:setTopBottom( true, false, 17, 106 )
				self.RocketShieldPieceWidget2:setAlpha( 1 )
				self.RocketShieldPieceWidget2:setScale( 0.81 )
				self.clipFinished( RocketShieldPieceWidget2, {} )
				RocketShieldPieceWidget3:completeAnimation()
				self.RocketShieldPieceWidget3:setLeftRight( true, false, 200.5, 289.5 )
				self.RocketShieldPieceWidget3:setTopBottom( true, false, 17, 106 )
				self.RocketShieldPieceWidget3:setAlpha( 1 )
				self.RocketShieldPieceWidget3:setScale( 0.81 )
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
		element.RocketShieldPieceWidget1:close()
		element.RocketShieldPieceWidget2:close()
		element.RocketShieldPieceWidget3:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

