require( "ui.uieditor.widgets.ZMInventoryIsland.GasMaskPieceWidget" )

CoD.GasMaskBlueprintWidget_Island = InheritFrom( LUI.UIElement )
CoD.GasMaskBlueprintWidget_Island.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GasMaskBlueprintWidget_Island )
	self.id = "GasMaskBlueprintWidget_Island"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 314 )
	self:setTopBottom( true, false, 0, 129 )
	self.anyChildUsesUpdateState = true
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, false, -38.62, 303.03 )
	bg:setTopBottom( true, false, -43.5, 189.82 )
	bg:setImage( RegisterImage( "uie_t7_base_quest_gasmask_dlc2" ) )
	self:addElement( bg )
	self.bg = bg
	
	local GasMaskPieceWidget1 = CoD.GasMaskPieceWidget.new( menu, controller )
	GasMaskPieceWidget1:setLeftRight( true, false, 16, 105 )
	GasMaskPieceWidget1:setTopBottom( true, false, 23.24, 112.24 )
	GasMaskPieceWidget1:setScale( 0.9 )
	GasMaskPieceWidget1.PieceImageNewGreen:setImage( RegisterImage( "uie_t7_icon_inventory_dlc2_gasmask_piece1_new" ) )
	GasMaskPieceWidget1.PieceImage:setImage( RegisterImage( "uie_t7_icon_inventory_dlc2_gasmask_piece1" ) )
	GasMaskPieceWidget1:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and HasGasMaskItem( controller, "CRAFTABLE_PART_GASMASK_MASK" )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				local f3_local0
				if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) then
					f3_local0 = ShowGasMaskPartsWidget( controller )
					if f3_local0 then
						f3_local0 = HasGasMaskItem( controller, "CRAFTABLE_PART_GASMASK_MASK" )
					end
				else
					f3_local0 = false
				end
				return f3_local0
			end
		}
	} )
	GasMaskPieceWidget1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( GasMaskPieceWidget1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	GasMaskPieceWidget1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.gaskmask_part_visor" ), function ( model )
		menu:updateElementState( GasMaskPieceWidget1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.gaskmask_part_visor"
		} )
	end )
	GasMaskPieceWidget1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.gaskmask_part_strap" ), function ( model )
		menu:updateElementState( GasMaskPieceWidget1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.gaskmask_part_strap"
		} )
	end )
	GasMaskPieceWidget1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.gaskmask_part_filter" ), function ( model )
		menu:updateElementState( GasMaskPieceWidget1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.gaskmask_part_filter"
		} )
	end )
	GasMaskPieceWidget1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_gasmask_parts" ), function ( model )
		menu:updateElementState( GasMaskPieceWidget1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_gasmask_parts"
		} )
	end )
	self:addElement( GasMaskPieceWidget1 )
	self.GasMaskPieceWidget1 = GasMaskPieceWidget1
	
	local GasMaskPieceWidget0 = CoD.GasMaskPieceWidget.new( menu, controller )
	GasMaskPieceWidget0:setLeftRight( true, false, 87.74, 176.74 )
	GasMaskPieceWidget0:setTopBottom( true, false, 24.24, 113.24 )
	GasMaskPieceWidget0:setScale( 0.95 )
	GasMaskPieceWidget0.PieceImageNewGreen:setImage( RegisterImage( "uie_t7_icon_inventory_dlc2_gasmask_piece2_new" ) )
	GasMaskPieceWidget0.PieceImage:setImage( RegisterImage( "uie_t7_icon_inventory_dlc2_gasmask_piece2" ) )
	GasMaskPieceWidget0:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and HasGasMaskItem( controller, "CRAFTABLE_PART_GASMASK_TUBE" )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				local f10_local0
				if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) then
					f10_local0 = ShowGasMaskPartsWidget( controller )
					if f10_local0 then
						f10_local0 = HasGasMaskItem( controller, "CRAFTABLE_PART_GASMASK_TUBE" )
					end
				else
					f10_local0 = false
				end
				return f10_local0
			end
		}
	} )
	GasMaskPieceWidget0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( GasMaskPieceWidget0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	GasMaskPieceWidget0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.gaskmask_part_visor" ), function ( model )
		menu:updateElementState( GasMaskPieceWidget0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.gaskmask_part_visor"
		} )
	end )
	GasMaskPieceWidget0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.gaskmask_part_strap" ), function ( model )
		menu:updateElementState( GasMaskPieceWidget0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.gaskmask_part_strap"
		} )
	end )
	GasMaskPieceWidget0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.gaskmask_part_filter" ), function ( model )
		menu:updateElementState( GasMaskPieceWidget0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.gaskmask_part_filter"
		} )
	end )
	GasMaskPieceWidget0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_gasmask_parts" ), function ( model )
		menu:updateElementState( GasMaskPieceWidget0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_gasmask_parts"
		} )
	end )
	self:addElement( GasMaskPieceWidget0 )
	self.GasMaskPieceWidget0 = GasMaskPieceWidget0
	
	local GasMaskPieceWidget2 = CoD.GasMaskPieceWidget.new( menu, controller )
	GasMaskPieceWidget2:setLeftRight( true, false, 154.74, 243.74 )
	GasMaskPieceWidget2:setTopBottom( true, false, 23.24, 112.24 )
	GasMaskPieceWidget2.PieceImageNewGreen:setImage( RegisterImage( "uie_t7_icon_inventory_dlc2_gasmask_piece3_new" ) )
	GasMaskPieceWidget2.PieceImage:setImage( RegisterImage( "uie_t7_icon_inventory_dlc2_gasmask_piece3" ) )
	GasMaskPieceWidget2:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and HasGasMaskItem( controller, "CRAFTABLE_PART_GASMASK_CANISTER" )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				local f17_local0
				if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) then
					f17_local0 = ShowGasMaskPartsWidget( controller )
					if f17_local0 then
						f17_local0 = HasGasMaskItem( controller, "CRAFTABLE_PART_GASMASK_CANISTER" )
					end
				else
					f17_local0 = false
				end
				return f17_local0
			end
		}
	} )
	GasMaskPieceWidget2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( GasMaskPieceWidget2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	GasMaskPieceWidget2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.gaskmask_part_visor" ), function ( model )
		menu:updateElementState( GasMaskPieceWidget2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.gaskmask_part_visor"
		} )
	end )
	GasMaskPieceWidget2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.gaskmask_part_strap" ), function ( model )
		menu:updateElementState( GasMaskPieceWidget2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.gaskmask_part_strap"
		} )
	end )
	GasMaskPieceWidget2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.gaskmask_part_filter" ), function ( model )
		menu:updateElementState( GasMaskPieceWidget2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.gaskmask_part_filter"
		} )
	end )
	GasMaskPieceWidget2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_gasmask_parts" ), function ( model )
		menu:updateElementState( GasMaskPieceWidget2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_gasmask_parts"
		} )
	end )
	self:addElement( GasMaskPieceWidget2 )
	self.GasMaskPieceWidget2 = GasMaskPieceWidget2
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				bg:completeAnimation()
				self.bg:setAlpha( 0 )
				self.clipFinished( bg, {} )
				GasMaskPieceWidget1:completeAnimation()
				self.GasMaskPieceWidget1:setAlpha( 0 )
				self.clipFinished( GasMaskPieceWidget1, {} )
				GasMaskPieceWidget0:completeAnimation()
				self.GasMaskPieceWidget0:setAlpha( 0 )
				self.clipFinished( GasMaskPieceWidget0, {} )
				GasMaskPieceWidget2:completeAnimation()
				self.GasMaskPieceWidget2:setAlpha( 0 )
				self.clipFinished( GasMaskPieceWidget2, {} )
			end
		},
		BgVisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				local bgFrame2 = function ( bg, event )
					local bgFrame3 = function ( bg, event )
						local bgFrame4 = function ( bg, event )
							if not event.interrupted then
								bg:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
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
						bg:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
						bg:setAlpha( 1 )
						bg:registerEventHandler( "transition_complete_keyframe", bgFrame3 )
					end
				end
				
				bg:completeAnimation()
				self.bg:setAlpha( 0 )
				bgFrame2( bg, {} )
				GasMaskPieceWidget1:completeAnimation()
				self.GasMaskPieceWidget1:setAlpha( 1 )
				self.clipFinished( GasMaskPieceWidget1, {} )
				GasMaskPieceWidget0:completeAnimation()
				self.GasMaskPieceWidget0:setAlpha( 1 )
				self.clipFinished( GasMaskPieceWidget0, {} )
				GasMaskPieceWidget2:completeAnimation()
				self.GasMaskPieceWidget2:setAlpha( 1 )
				self.clipFinished( GasMaskPieceWidget2, {} )
			end
		},
		Scoreboard = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				bg:completeAnimation()
				self.bg:setAlpha( 0 )
				self.clipFinished( bg, {} )
				GasMaskPieceWidget1:completeAnimation()
				self.GasMaskPieceWidget1:setAlpha( 1 )
				self.clipFinished( GasMaskPieceWidget1, {} )
				GasMaskPieceWidget0:completeAnimation()
				self.GasMaskPieceWidget0:setAlpha( 1 )
				self.clipFinished( GasMaskPieceWidget0, {} )
				GasMaskPieceWidget2:completeAnimation()
				self.GasMaskPieceWidget2:setAlpha( 1 )
				self.clipFinished( GasMaskPieceWidget2, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "BgVisible",
			condition = function ( menu, element, event )
				return ShowGasMaskPartsWidget( controller )
			end
		},
		{
			stateName = "Scoreboard",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_gasmask_parts" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_gasmask_parts"
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
		element.GasMaskPieceWidget1:close()
		element.GasMaskPieceWidget0:close()
		element.GasMaskPieceWidget2:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

