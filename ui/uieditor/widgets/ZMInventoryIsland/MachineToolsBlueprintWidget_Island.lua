-- 30e004b2b1350e670b42fdb4d833059c
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.ZMInventoryIsland.MachineToolsPieceWidget" )

CoD.MachineToolsBlueprintWidget_Island = InheritFrom( LUI.UIElement )
CoD.MachineToolsBlueprintWidget_Island.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MachineToolsBlueprintWidget_Island )
	self.id = "MachineToolsBlueprintWidget_Island"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 314 )
	self:setTopBottom( true, false, 0, 129 )
	self.anyChildUsesUpdateState = true
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, false, -44.57, 324.57 )
	bg:setTopBottom( true, false, -48.5, 203.6 )
	bg:setImage( RegisterImage( "uie_t7_base_quest_pap_dlc2" ) )
	self:addElement( bg )
	self.bg = bg
	
	local MachineToolsPieceWidget1 = CoD.MachineToolsPieceWidget.new( menu, controller )
	MachineToolsPieceWidget1:setLeftRight( true, false, 13, 102 )
	MachineToolsPieceWidget1:setTopBottom( true, false, 26.24, 115.24 )
	MachineToolsPieceWidget1:setScale( 0.95 )
	MachineToolsPieceWidget1.PieceImageNewGreen:setImage( RegisterImage( "uie_t7_icon_inventory_dlc2_packapunch_piece1_new" ) )
	MachineToolsPieceWidget1.PieceImage:setImage( RegisterImage( "uie_t7_icon_inventory_dlc2_packapunch_piece1" ) )
	MachineToolsPieceWidget1:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and HasMachineToolsItem( controller, "CRAFTABLE_PART_MACHINETOOLS_WHEEL" )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				local f3_local0
				if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) then
					f3_local0 = ShowMachineToolsPartsWidget( controller )
					if f3_local0 then
						f3_local0 = HasMachineToolsItem( controller, "CRAFTABLE_PART_MACHINETOOLS_WHEEL" )
					end
				else
					f3_local0 = false
				end
				return f3_local0
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
	MachineToolsPieceWidget1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.valveone_part_lever" ), function ( model )
		menu:updateElementState( MachineToolsPieceWidget1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.valveone_part_lever"
		} )
	end )
	MachineToolsPieceWidget1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.valvetwo_part_lever" ), function ( model )
		menu:updateElementState( MachineToolsPieceWidget1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.valvetwo_part_lever"
		} )
	end )
	MachineToolsPieceWidget1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.valvethree_part_lever" ), function ( model )
		menu:updateElementState( MachineToolsPieceWidget1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.valvethree_part_lever"
		} )
	end )
	MachineToolsPieceWidget1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_machinetools_parts" ), function ( model )
		menu:updateElementState( MachineToolsPieceWidget1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_machinetools_parts"
		} )
	end )
	self:addElement( MachineToolsPieceWidget1 )
	self.MachineToolsPieceWidget1 = MachineToolsPieceWidget1
	
	local MachineToolsPieceWidget0 = CoD.MachineToolsPieceWidget.new( menu, controller )
	MachineToolsPieceWidget0:setLeftRight( true, false, 78, 167 )
	MachineToolsPieceWidget0:setTopBottom( true, false, 26.24, 115.24 )
	MachineToolsPieceWidget0:setScale( 1.05 )
	MachineToolsPieceWidget0.PieceImageNewGreen:setImage( RegisterImage( "uie_t7_icon_inventory_dlc2_packapunch_piece2_new" ) )
	MachineToolsPieceWidget0.PieceImage:setImage( RegisterImage( "uie_t7_icon_inventory_dlc2_packapunch_piece2" ) )
	MachineToolsPieceWidget0:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and HasMachineToolsItem( controller, "CRAFTABLE_PART_MACHINETOOLS_WRENCH" )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				local f10_local0
				if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) then
					f10_local0 = ShowMachineToolsPartsWidget( controller )
					if f10_local0 then
						f10_local0 = HasMachineToolsItem( controller, "CRAFTABLE_PART_MACHINETOOLS_WRENCH" )
					end
				else
					f10_local0 = false
				end
				return f10_local0
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
	MachineToolsPieceWidget0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.valveone_part_lever" ), function ( model )
		menu:updateElementState( MachineToolsPieceWidget0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.valveone_part_lever"
		} )
	end )
	MachineToolsPieceWidget0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.valvetwo_part_lever" ), function ( model )
		menu:updateElementState( MachineToolsPieceWidget0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.valvetwo_part_lever"
		} )
	end )
	MachineToolsPieceWidget0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.valvethree_part_lever" ), function ( model )
		menu:updateElementState( MachineToolsPieceWidget0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.valvethree_part_lever"
		} )
	end )
	MachineToolsPieceWidget0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_machinetools_parts" ), function ( model )
		menu:updateElementState( MachineToolsPieceWidget0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_machinetools_parts"
		} )
	end )
	self:addElement( MachineToolsPieceWidget0 )
	self.MachineToolsPieceWidget0 = MachineToolsPieceWidget0
	
	local MachineToolsPieceWidget2 = CoD.MachineToolsPieceWidget.new( menu, controller )
	MachineToolsPieceWidget2:setLeftRight( true, false, 146, 235 )
	MachineToolsPieceWidget2:setTopBottom( true, false, 24.24, 113.24 )
	MachineToolsPieceWidget2:setScale( 1.1 )
	MachineToolsPieceWidget2.PieceImageNewGreen:setImage( RegisterImage( "uie_t7_icon_inventory_dlc2_packapunch_piece3_new" ) )
	MachineToolsPieceWidget2.PieceImage:setImage( RegisterImage( "uie_t7_icon_inventory_dlc2_packapunch_piece3" ) )
	MachineToolsPieceWidget2:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and HasMachineToolsItem( controller, "CRAFTABLE_PART_MACHINETOOLS_GAUGE" )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				local f17_local0
				if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) then
					f17_local0 = ShowMachineToolsPartsWidget( controller )
					if f17_local0 then
						f17_local0 = HasMachineToolsItem( controller, "CRAFTABLE_PART_MACHINETOOLS_GAUGE" )
					end
				else
					f17_local0 = false
				end
				return f17_local0
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
	MachineToolsPieceWidget2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.valveone_part_lever" ), function ( model )
		menu:updateElementState( MachineToolsPieceWidget2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.valveone_part_lever"
		} )
	end )
	MachineToolsPieceWidget2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.valvetwo_part_lever" ), function ( model )
		menu:updateElementState( MachineToolsPieceWidget2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.valvetwo_part_lever"
		} )
	end )
	MachineToolsPieceWidget2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.valvethree_part_lever" ), function ( model )
		menu:updateElementState( MachineToolsPieceWidget2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.valvethree_part_lever"
		} )
	end )
	MachineToolsPieceWidget2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_machinetools_parts" ), function ( model )
		menu:updateElementState( MachineToolsPieceWidget2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_machinetools_parts"
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
				self.MachineToolsPieceWidget1:setAlpha( 1 )
				self.clipFinished( MachineToolsPieceWidget1, {} )
				MachineToolsPieceWidget0:completeAnimation()
				self.MachineToolsPieceWidget0:setAlpha( 1 )
				self.clipFinished( MachineToolsPieceWidget0, {} )
				MachineToolsPieceWidget2:completeAnimation()
				self.MachineToolsPieceWidget2:setAlpha( 1 )
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
				self.MachineToolsPieceWidget1:setAlpha( 1 )
				self.clipFinished( MachineToolsPieceWidget1, {} )
				MachineToolsPieceWidget0:completeAnimation()
				self.MachineToolsPieceWidget0:setAlpha( 1 )
				self.clipFinished( MachineToolsPieceWidget0, {} )
				MachineToolsPieceWidget2:completeAnimation()
				self.MachineToolsPieceWidget2:setAlpha( 1 )
				self.clipFinished( MachineToolsPieceWidget2, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "BgVisible",
			condition = function ( menu, element, event )
				return ShowMachineToolsPartsWidget( controller )
			end
		},
		{
			stateName = "Scoreboard",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_machinetools_parts" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_machinetools_parts"
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
		element.MachineToolsPieceWidget1:close()
		element.MachineToolsPieceWidget0:close()
		element.MachineToolsPieceWidget2:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

