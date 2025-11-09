require( "ui.uieditor.widgets.ZMInventory.RocketShieldBluePrint.RocketShieldPieceWidget" )

CoD.KeeperProtectorWidgets_Genesis = InheritFrom( LUI.UIElement )
CoD.KeeperProtectorWidgets_Genesis.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.KeeperProtectorWidgets_Genesis )
	self.id = "KeeperProtectorWidgets_Genesis"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 314 )
	self:setTopBottom( true, false, 0, 129 )
	self.anyChildUsesUpdateState = true
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, false, -11.57, 256.29 )
	bg:setTopBottom( true, false, -20.72, 162.2 )
	bg:setImage( RegisterImage( "uie_t7_base_quest_keeper_dlc4" ) )
	self:addElement( bg )
	self.bg = bg
	
	local MachineToolsPieceWidget1 = CoD.RocketShieldPieceWidget.new( menu, controller )
	MachineToolsPieceWidget1:setLeftRight( true, false, 11, 100 )
	MachineToolsPieceWidget1:setTopBottom( true, false, 26.24, 115.24 )
	MachineToolsPieceWidget1:setScale( 1.2 )
	MachineToolsPieceWidget1.PieceImageNewGreen:setImage( RegisterImage( "uie_t7_icon_inventory_dlc4_keeper_new" ) )
	MachineToolsPieceWidget1.PieceImage:setImage( RegisterImage( "uie_t7_icon_inventory_dlc4_keeper" ) )
	MachineToolsPieceWidget1:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and IsInventoryPieceVisible( controller, "keeper_callbox_head" )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				return IsInventoryWidgetVisible( controller, "widget_keeper_protector_parts" ) and IsInventoryPieceVisible( controller, "keeper_callbox_head" )
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
	MachineToolsPieceWidget1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.keeper_callbox_head" ), function ( model )
		menu:updateElementState( MachineToolsPieceWidget1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.keeper_callbox_head"
		} )
	end )
	MachineToolsPieceWidget1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_keeper_protector_parts" ), function ( model )
		menu:updateElementState( MachineToolsPieceWidget1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_keeper_protector_parts"
		} )
	end )
	self:addElement( MachineToolsPieceWidget1 )
	self.MachineToolsPieceWidget1 = MachineToolsPieceWidget1
	
	local MachineToolsPieceWidget0 = CoD.RocketShieldPieceWidget.new( menu, controller )
	MachineToolsPieceWidget0:setLeftRight( true, false, 111, 200 )
	MachineToolsPieceWidget0:setTopBottom( true, false, 26.24, 115.24 )
	MachineToolsPieceWidget0:setScale( 1.3 )
	MachineToolsPieceWidget0.PieceImageNewGreen:setImage( RegisterImage( "uie_t7_icon_inventory_dlc4_crystal_new" ) )
	MachineToolsPieceWidget0.PieceImage:setImage( RegisterImage( "uie_t7_icon_inventory_dlc4_crystal" ) )
	MachineToolsPieceWidget0:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and IsInventoryPieceVisible( controller, "keeper_callbox_gem" )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				return IsInventoryWidgetVisible( controller, "widget_keeper_protector_parts" ) and IsInventoryPieceVisible( controller, "keeper_callbox_gem" )
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
	MachineToolsPieceWidget0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.keeper_callbox_gem" ), function ( model )
		menu:updateElementState( MachineToolsPieceWidget0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.keeper_callbox_gem"
		} )
	end )
	MachineToolsPieceWidget0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_keeper_protector_parts" ), function ( model )
		menu:updateElementState( MachineToolsPieceWidget0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_keeper_protector_parts"
		} )
	end )
	self:addElement( MachineToolsPieceWidget0 )
	self.MachineToolsPieceWidget0 = MachineToolsPieceWidget0
	
	local MachineToolsPieceWidget2 = CoD.RocketShieldPieceWidget.new( menu, controller )
	MachineToolsPieceWidget2:setLeftRight( true, false, 211.5, 300.5 )
	MachineToolsPieceWidget2:setTopBottom( true, false, 26.24, 115.24 )
	MachineToolsPieceWidget2:setScale( 1.4 )
	MachineToolsPieceWidget2.PieceImageNewGreen:setImage( RegisterImage( "uie_t7_icon_inventory_dlc4_totem_new" ) )
	MachineToolsPieceWidget2.PieceImage:setImage( RegisterImage( "uie_t7_icon_inventory_dlc4_totem" ) )
	MachineToolsPieceWidget2:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and IsInventoryPieceVisible( controller, "keeper_callbox_totem" )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				return IsInventoryWidgetVisible( controller, "widget_keeper_protector_parts" ) and IsInventoryPieceVisible( controller, "keeper_callbox_totem" )
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
	MachineToolsPieceWidget2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.keeper_callbox_totem" ), function ( model )
		menu:updateElementState( MachineToolsPieceWidget2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.keeper_callbox_totem"
		} )
	end )
	MachineToolsPieceWidget2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_keeper_protector_parts" ), function ( model )
		menu:updateElementState( MachineToolsPieceWidget2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_keeper_protector_parts"
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
				self.MachineToolsPieceWidget1:setLeftRight( true, false, 11, 100 )
				self.MachineToolsPieceWidget1:setTopBottom( true, false, 26.24, 115.24 )
				self.MachineToolsPieceWidget1:setAlpha( 1 )
				self.MachineToolsPieceWidget1:setScale( 1.2 )
				self.clipFinished( MachineToolsPieceWidget1, {} )
				MachineToolsPieceWidget0:completeAnimation()
				self.MachineToolsPieceWidget0:setLeftRight( true, false, 111, 200 )
				self.MachineToolsPieceWidget0:setTopBottom( true, false, 26.24, 115.24 )
				self.MachineToolsPieceWidget0:setAlpha( 1 )
				self.MachineToolsPieceWidget0:setScale( 1.3 )
				self.clipFinished( MachineToolsPieceWidget0, {} )
				MachineToolsPieceWidget2:completeAnimation()
				self.MachineToolsPieceWidget2:setLeftRight( true, false, 210.5, 299.5 )
				self.MachineToolsPieceWidget2:setTopBottom( true, false, 26.24, 115.24 )
				self.MachineToolsPieceWidget2:setAlpha( 1 )
				self.MachineToolsPieceWidget2:setScale( 1.4 )
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
				self.MachineToolsPieceWidget1:setLeftRight( true, false, 5, 92 )
				self.MachineToolsPieceWidget1:setTopBottom( true, false, 26.24, 113.24 )
				self.MachineToolsPieceWidget1:setAlpha( 1 )
				self.MachineToolsPieceWidget1:setScale( 0.9 )
				self.clipFinished( MachineToolsPieceWidget1, {} )
				MachineToolsPieceWidget0:completeAnimation()
				self.MachineToolsPieceWidget0:setLeftRight( true, false, 72.86, 161.86 )
				self.MachineToolsPieceWidget0:setTopBottom( true, false, 25.24, 114.24 )
				self.MachineToolsPieceWidget0:setAlpha( 1 )
				self.MachineToolsPieceWidget0:setScale( 1 )
				self.clipFinished( MachineToolsPieceWidget0, {} )
				MachineToolsPieceWidget2:completeAnimation()
				self.MachineToolsPieceWidget2:setLeftRight( true, false, 146.29, 235.29 )
				self.MachineToolsPieceWidget2:setTopBottom( true, false, 25.24, 114.24 )
				self.MachineToolsPieceWidget2:setAlpha( 1 )
				self.MachineToolsPieceWidget2:setScale( 1.1 )
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
				return IsInventoryWidgetVisible( controller, "widget_keeper_protector_parts" )
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
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_keeper_protector_parts" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_keeper_protector_parts"
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

