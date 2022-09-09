-- 2ae97e4c9242983e4518ce704e40bb3b
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.ZMInventoryIsland.WonderWeaponPieceWidget" )

CoD.WonderWeaponBlueprintWidget_Island = InheritFrom( LUI.UIElement )
CoD.WonderWeaponBlueprintWidget_Island.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.WonderWeaponBlueprintWidget_Island )
	self.id = "WonderWeaponBlueprintWidget_Island"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 314 )
	self:setTopBottom( true, false, 0, 129 )
	self.anyChildUsesUpdateState = true
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, false, -26.5, 347.96 )
	bg:setTopBottom( true, false, -57.16, 198.57 )
	bg:setImage( RegisterImage( "uie_t7_base_quest_wonder_dlc2" ) )
	self:addElement( bg )
	self.bg = bg
	
	local WonderWeaponPieceWidget1 = CoD.WonderWeaponPieceWidget.new( menu, controller )
	WonderWeaponPieceWidget1:setLeftRight( true, false, 20, 109 )
	WonderWeaponPieceWidget1:setTopBottom( true, false, 23.24, 112.24 )
	WonderWeaponPieceWidget1:setScale( 0.87 )
	WonderWeaponPieceWidget1.PieceImageNewGreen:setImage( RegisterImage( "uie_t7_icon_inventory_dlc2_wonderweapon_piece1_new" ) )
	WonderWeaponPieceWidget1.PieceImage:setImage( RegisterImage( "uie_t7_icon_inventory_dlc2_wonderweapon_piece1" ) )
	WonderWeaponPieceWidget1:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and HasWonderWeaponItem( controller, "CRAFTABLE_PART_WONDERWEAPON_TUBE" )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				local f3_local0
				if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) then
					f3_local0 = ShowWonderWeaponPartsWidget( controller )
					if f3_local0 then
						f3_local0 = HasWonderWeaponItem( controller, "CRAFTABLE_PART_WONDERWEAPON_TUBE" )
					end
				else
					f3_local0 = false
				end
				return f3_local0
			end
		}
	} )
	WonderWeaponPieceWidget1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( WonderWeaponPieceWidget1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	WonderWeaponPieceWidget1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.wonderweapon_part_wwi" ), function ( model )
		menu:updateElementState( WonderWeaponPieceWidget1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.wonderweapon_part_wwi"
		} )
	end )
	WonderWeaponPieceWidget1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.wonderweapon_part_wwii" ), function ( model )
		menu:updateElementState( WonderWeaponPieceWidget1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.wonderweapon_part_wwii"
		} )
	end )
	WonderWeaponPieceWidget1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.wonderweapon_part_wwiii" ), function ( model )
		menu:updateElementState( WonderWeaponPieceWidget1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.wonderweapon_part_wwiii"
		} )
	end )
	WonderWeaponPieceWidget1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_wonderweapon_parts" ), function ( model )
		menu:updateElementState( WonderWeaponPieceWidget1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_wonderweapon_parts"
		} )
	end )
	self:addElement( WonderWeaponPieceWidget1 )
	self.WonderWeaponPieceWidget1 = WonderWeaponPieceWidget1
	
	local WonderWeaponPieceWidget0 = CoD.WonderWeaponPieceWidget.new( menu, controller )
	WonderWeaponPieceWidget0:setLeftRight( true, false, 161, 250 )
	WonderWeaponPieceWidget0:setTopBottom( true, false, 23.24, 112.24 )
	WonderWeaponPieceWidget0:setScale( 0.95 )
	WonderWeaponPieceWidget0.PieceImageNewGreen:setImage( RegisterImage( "uie_t7_icon_inventory_dlc2_wonderweapon_piece3_new" ) )
	WonderWeaponPieceWidget0.PieceImage:setImage( RegisterImage( "uie_t7_icon_inventory_dlc2_wonderweapon_piece3" ) )
	WonderWeaponPieceWidget0:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and HasWonderWeaponItem( controller, "CRAFTABLE_PART_WONDERWEAPON_FLASK" )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				local f10_local0
				if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) then
					f10_local0 = ShowWonderWeaponPartsWidget( controller )
					if f10_local0 then
						f10_local0 = HasWonderWeaponItem( controller, "CRAFTABLE_PART_WONDERWEAPON_FLASK" )
					end
				else
					f10_local0 = false
				end
				return f10_local0
			end
		}
	} )
	WonderWeaponPieceWidget0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( WonderWeaponPieceWidget0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	WonderWeaponPieceWidget0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.wonderweapon_part_wwi" ), function ( model )
		menu:updateElementState( WonderWeaponPieceWidget0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.wonderweapon_part_wwi"
		} )
	end )
	WonderWeaponPieceWidget0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.wonderweapon_part_wwii" ), function ( model )
		menu:updateElementState( WonderWeaponPieceWidget0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.wonderweapon_part_wwii"
		} )
	end )
	WonderWeaponPieceWidget0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.wonderweapon_part_wwiii" ), function ( model )
		menu:updateElementState( WonderWeaponPieceWidget0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.wonderweapon_part_wwiii"
		} )
	end )
	WonderWeaponPieceWidget0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_wonderweapon_parts" ), function ( model )
		menu:updateElementState( WonderWeaponPieceWidget0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_wonderweapon_parts"
		} )
	end )
	self:addElement( WonderWeaponPieceWidget0 )
	self.WonderWeaponPieceWidget0 = WonderWeaponPieceWidget0
	
	local WonderWeaponPieceWidget2 = CoD.WonderWeaponPieceWidget.new( menu, controller )
	WonderWeaponPieceWidget2:setLeftRight( true, false, 93, 182 )
	WonderWeaponPieceWidget2:setTopBottom( true, false, 23.24, 112.24 )
	WonderWeaponPieceWidget2.PieceImageNewGreen:setImage( RegisterImage( "uie_t7_icon_inventory_dlc2_wonderweapon_piece2_new" ) )
	WonderWeaponPieceWidget2.PieceImage:setImage( RegisterImage( "uie_t7_icon_inventory_dlc2_wonderweapon_piece2" ) )
	WonderWeaponPieceWidget2:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and HasWonderWeaponItem( controller, "CRAFTABLE_PART_WONDERWEAPON_PLANT" )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				local f17_local0
				if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) then
					f17_local0 = ShowWonderWeaponPartsWidget( controller )
					if f17_local0 then
						f17_local0 = HasWonderWeaponItem( controller, "CRAFTABLE_PART_WONDERWEAPON_PLANT" )
					end
				else
					f17_local0 = false
				end
				return f17_local0
			end
		}
	} )
	WonderWeaponPieceWidget2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( WonderWeaponPieceWidget2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	WonderWeaponPieceWidget2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.wonderweapon_part_wwi" ), function ( model )
		menu:updateElementState( WonderWeaponPieceWidget2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.wonderweapon_part_wwi"
		} )
	end )
	WonderWeaponPieceWidget2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.wonderweapon_part_wwii" ), function ( model )
		menu:updateElementState( WonderWeaponPieceWidget2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.wonderweapon_part_wwii"
		} )
	end )
	WonderWeaponPieceWidget2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.wonderweapon_part_wwiii" ), function ( model )
		menu:updateElementState( WonderWeaponPieceWidget2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.wonderweapon_part_wwiii"
		} )
	end )
	WonderWeaponPieceWidget2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_wonderweapon_parts" ), function ( model )
		menu:updateElementState( WonderWeaponPieceWidget2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_wonderweapon_parts"
		} )
	end )
	self:addElement( WonderWeaponPieceWidget2 )
	self.WonderWeaponPieceWidget2 = WonderWeaponPieceWidget2
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				bg:completeAnimation()
				self.bg:setAlpha( 0 )
				self.clipFinished( bg, {} )

				WonderWeaponPieceWidget1:completeAnimation()
				self.WonderWeaponPieceWidget1:setAlpha( 0 )
				self.clipFinished( WonderWeaponPieceWidget1, {} )

				WonderWeaponPieceWidget0:completeAnimation()
				self.WonderWeaponPieceWidget0:setAlpha( 0 )
				self.clipFinished( WonderWeaponPieceWidget0, {} )

				WonderWeaponPieceWidget2:completeAnimation()
				self.WonderWeaponPieceWidget2:setAlpha( 0 )
				self.clipFinished( WonderWeaponPieceWidget2, {} )
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
							bg:beginAnimation( "keyframe", 2720, false, false, CoD.TweenType.Linear )
							bg:registerEventHandler( "transition_complete_keyframe", bgFrame4 )
						end
					end
					
					if event.interrupted then
						bgFrame3( bg, event )
						return 
					else
						bg:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
						bg:setAlpha( 1 )
						bg:registerEventHandler( "transition_complete_keyframe", bgFrame3 )
					end
				end
				
				bg:completeAnimation()
				self.bg:setAlpha( 0 )
				bgFrame2( bg, {} )

				WonderWeaponPieceWidget1:completeAnimation()
				self.WonderWeaponPieceWidget1:setAlpha( 1 )
				self.clipFinished( WonderWeaponPieceWidget1, {} )

				WonderWeaponPieceWidget0:completeAnimation()
				self.WonderWeaponPieceWidget0:setAlpha( 1 )
				self.clipFinished( WonderWeaponPieceWidget0, {} )

				WonderWeaponPieceWidget2:completeAnimation()
				self.WonderWeaponPieceWidget2:setAlpha( 1 )
				self.clipFinished( WonderWeaponPieceWidget2, {} )
			end
		},
		Scoreboard = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				bg:completeAnimation()
				self.bg:setAlpha( 0 )
				self.clipFinished( bg, {} )

				WonderWeaponPieceWidget1:completeAnimation()
				self.WonderWeaponPieceWidget1:setAlpha( 1 )
				self.clipFinished( WonderWeaponPieceWidget1, {} )

				WonderWeaponPieceWidget0:completeAnimation()
				self.WonderWeaponPieceWidget0:setAlpha( 1 )
				self.clipFinished( WonderWeaponPieceWidget0, {} )

				WonderWeaponPieceWidget2:completeAnimation()
				self.WonderWeaponPieceWidget2:setAlpha( 1 )
				self.clipFinished( WonderWeaponPieceWidget2, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "BgVisible",
			condition = function ( menu, element, event )
				return ShowWonderWeaponPartsWidget( controller )
			end
		},
		{
			stateName = "Scoreboard",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_wonderweapon_parts" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_wonderweapon_parts"
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
		element.WonderWeaponPieceWidget1:close()
		element.WonderWeaponPieceWidget0:close()
		element.WonderWeaponPieceWidget2:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
