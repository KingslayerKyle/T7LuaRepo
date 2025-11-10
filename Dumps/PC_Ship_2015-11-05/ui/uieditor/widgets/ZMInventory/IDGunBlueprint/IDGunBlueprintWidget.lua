require( "ui.uieditor.widgets.ZMInventory.IDGunBlueprint.IDGunBlueprintPieceWidget" )

CoD.IDGunBlueprintWidget = InheritFrom( LUI.UIElement )
CoD.IDGunBlueprintWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.IDGunBlueprintWidget )
	self.id = "IDGunBlueprintWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 314 )
	self:setTopBottom( true, false, 0, 129 )
	self.anyChildUsesUpdateState = true
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( true, false, -3, 283.74 )
	BG:setTopBottom( true, false, -41.5, 181.63 )
	BG:setAlpha( 0 )
	BG:setImage( RegisterImage( "uie_t7_base_quest_idgun" ) )
	self:addElement( BG )
	self.BG = BG
	
	local IDGunBlueprintPieceWidget1 = CoD.IDGunBlueprintPieceWidget.new( menu, controller )
	IDGunBlueprintPieceWidget1:setLeftRight( false, false, -112.52, -23.52 )
	IDGunBlueprintPieceWidget1:setTopBottom( false, false, -44.5, 44.5 )
	IDGunBlueprintPieceWidget1:setScale( 1.15 )
	IDGunBlueprintPieceWidget1.PieceImageNew:setImage( RegisterImage( "uie_t7_icon_inventory_heart_new" ) )
	IDGunBlueprintPieceWidget1.PieceImage:setImage( RegisterImage( "uie_t7_icon_inventory_heart" ) )
	IDGunBlueprintPieceWidget1:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and IDGunBlueprintPieceVisible( controller, "ZOD_CRAFTABLE_PIECE_IDGUN_HEART" )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				return IDGunBlueprintPieceVisible( controller, "ZOD_CRAFTABLE_PIECE_IDGUN_HEART" )
			end
		}
	} )
	IDGunBlueprintPieceWidget1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( IDGunBlueprintPieceWidget1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	IDGunBlueprintPieceWidget1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.idgun_part_heart" ), function ( model )
		menu:updateElementState( IDGunBlueprintPieceWidget1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.idgun_part_heart"
		} )
	end )
	IDGunBlueprintPieceWidget1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.idgun_part_skeleton" ), function ( model )
		menu:updateElementState( IDGunBlueprintPieceWidget1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.idgun_part_skeleton"
		} )
	end )
	IDGunBlueprintPieceWidget1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.idgun_part_xenomatter" ), function ( model )
		menu:updateElementState( IDGunBlueprintPieceWidget1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.idgun_part_xenomatter"
		} )
	end )
	self:addElement( IDGunBlueprintPieceWidget1 )
	self.IDGunBlueprintPieceWidget1 = IDGunBlueprintPieceWidget1
	
	local IDGunBlueprintPieceWidget2 = CoD.IDGunBlueprintPieceWidget.new( menu, controller )
	IDGunBlueprintPieceWidget2:setLeftRight( false, false, 24.5, 111.5 )
	IDGunBlueprintPieceWidget2:setTopBottom( false, false, -44.5, 44.5 )
	IDGunBlueprintPieceWidget2:setScale( 1.15 )
	IDGunBlueprintPieceWidget2.PieceImageNew:setImage( RegisterImage( "uie_t7_icon_inventory_tentacle_new" ) )
	IDGunBlueprintPieceWidget2.PieceImage:setImage( RegisterImage( "uie_t7_icon_inventory_tentacle" ) )
	IDGunBlueprintPieceWidget2:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and IDGunBlueprintPieceVisible( controller, "ZOD_CRAFTABLE_PIECE_IDGUN_SKELETON" )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				return IDGunBlueprintPieceVisible( controller, "ZOD_CRAFTABLE_PIECE_IDGUN_SKELETON" )
			end
		}
	} )
	IDGunBlueprintPieceWidget2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( IDGunBlueprintPieceWidget2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	IDGunBlueprintPieceWidget2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.idgun_part_heart" ), function ( model )
		menu:updateElementState( IDGunBlueprintPieceWidget2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.idgun_part_heart"
		} )
	end )
	IDGunBlueprintPieceWidget2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.idgun_part_skeleton" ), function ( model )
		menu:updateElementState( IDGunBlueprintPieceWidget2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.idgun_part_skeleton"
		} )
	end )
	IDGunBlueprintPieceWidget2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.idgun_part_xenomatter" ), function ( model )
		menu:updateElementState( IDGunBlueprintPieceWidget2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.idgun_part_xenomatter"
		} )
	end )
	self:addElement( IDGunBlueprintPieceWidget2 )
	self.IDGunBlueprintPieceWidget2 = IDGunBlueprintPieceWidget2
	
	local IDGunBlueprintPieceWidget3 = CoD.IDGunBlueprintPieceWidget.new( menu, controller )
	IDGunBlueprintPieceWidget3:setLeftRight( false, false, -44.5, 44.5 )
	IDGunBlueprintPieceWidget3:setTopBottom( false, false, -38.93, 50.07 )
	IDGunBlueprintPieceWidget3:setScale( 1.15 )
	IDGunBlueprintPieceWidget3.PieceImageNew:setImage( RegisterImage( "uie_t7_icon_inventory_xenomatter_new" ) )
	IDGunBlueprintPieceWidget3.PieceImage:setImage( RegisterImage( "uie_t7_icon_inventory_xenomatter" ) )
	IDGunBlueprintPieceWidget3:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and IDGunBlueprintPieceVisible( controller, "ZOD_CRAFTABLE_PIECE_IDGUN_XENOMATTER" )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				return IDGunBlueprintPieceVisible( controller, "ZOD_CRAFTABLE_PIECE_IDGUN_XENOMATTER" )
			end
		}
	} )
	IDGunBlueprintPieceWidget3:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( IDGunBlueprintPieceWidget3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	IDGunBlueprintPieceWidget3:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.idgun_part_heart" ), function ( model )
		menu:updateElementState( IDGunBlueprintPieceWidget3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.idgun_part_heart"
		} )
	end )
	IDGunBlueprintPieceWidget3:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.idgun_part_skeleton" ), function ( model )
		menu:updateElementState( IDGunBlueprintPieceWidget3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.idgun_part_skeleton"
		} )
	end )
	IDGunBlueprintPieceWidget3:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.idgun_part_xenomatter" ), function ( model )
		menu:updateElementState( IDGunBlueprintPieceWidget3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.idgun_part_xenomatter"
		} )
	end )
	self:addElement( IDGunBlueprintPieceWidget3 )
	self.IDGunBlueprintPieceWidget3 = IDGunBlueprintPieceWidget3
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				BG:completeAnimation()
				self.BG:setAlpha( 0 )
				self.clipFinished( BG, {} )
				IDGunBlueprintPieceWidget1:completeAnimation()
				self.IDGunBlueprintPieceWidget1:setAlpha( 0 )
				self.clipFinished( IDGunBlueprintPieceWidget1, {} )
				IDGunBlueprintPieceWidget2:completeAnimation()
				self.IDGunBlueprintPieceWidget2:setAlpha( 0 )
				self.clipFinished( IDGunBlueprintPieceWidget2, {} )
				IDGunBlueprintPieceWidget3:completeAnimation()
				self.IDGunBlueprintPieceWidget3:setAlpha( 0 )
				self.clipFinished( IDGunBlueprintPieceWidget3, {} )
			end
		},
		BgVisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				local BGFrame2 = function ( BG, event )
					local BGFrame3 = function ( BG, event )
						local BGFrame4 = function ( BG, event )
							if not event.interrupted then
								BG:beginAnimation( "keyframe", 419, false, true, CoD.TweenType.Linear )
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
							BG:beginAnimation( "keyframe", 2820, false, false, CoD.TweenType.Linear )
							BG:registerEventHandler( "transition_complete_keyframe", BGFrame4 )
						end
					end
					
					if event.interrupted then
						BGFrame3( BG, event )
						return 
					else
						BG:beginAnimation( "keyframe", 330, true, false, CoD.TweenType.Linear )
						BG:setAlpha( 1 )
						BG:registerEventHandler( "transition_complete_keyframe", BGFrame3 )
					end
				end
				
				BG:completeAnimation()
				self.BG:setAlpha( 0 )
				BGFrame2( BG, {} )
				IDGunBlueprintPieceWidget1:completeAnimation()
				self.IDGunBlueprintPieceWidget1:setAlpha( 1 )
				self.clipFinished( IDGunBlueprintPieceWidget1, {} )
				IDGunBlueprintPieceWidget2:completeAnimation()
				self.IDGunBlueprintPieceWidget2:setAlpha( 1 )
				self.clipFinished( IDGunBlueprintPieceWidget2, {} )
				IDGunBlueprintPieceWidget3:completeAnimation()
				self.IDGunBlueprintPieceWidget3:setAlpha( 1 )
				self.clipFinished( IDGunBlueprintPieceWidget3, {} )
			end
		},
		Scoreboard = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				BG:completeAnimation()
				self.BG:setAlpha( 0 )
				self.clipFinished( BG, {} )
				IDGunBlueprintPieceWidget1:completeAnimation()
				self.IDGunBlueprintPieceWidget1:setAlpha( 1 )
				self.clipFinished( IDGunBlueprintPieceWidget1, {} )
				IDGunBlueprintPieceWidget2:completeAnimation()
				self.IDGunBlueprintPieceWidget2:setAlpha( 1 )
				self.clipFinished( IDGunBlueprintPieceWidget2, {} )
				IDGunBlueprintPieceWidget3:completeAnimation()
				self.IDGunBlueprintPieceWidget3:setAlpha( 1 )
				self.clipFinished( IDGunBlueprintPieceWidget3, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "BgVisible",
			condition = function ( menu, element, event )
				return ShowIDGunPartsWidget( controller )
			end
		},
		{
			stateName = "Scoreboard",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_idgun_parts" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_idgun_parts"
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
		element.IDGunBlueprintPieceWidget1:close()
		element.IDGunBlueprintPieceWidget2:close()
		element.IDGunBlueprintPieceWidget3:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

