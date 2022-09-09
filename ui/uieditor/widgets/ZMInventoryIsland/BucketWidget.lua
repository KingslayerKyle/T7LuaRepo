-- ee38dad895649bb454bfddb47d2159c8
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.ZMInventoryIsland.BucketWidgetBucket" )
require( "ui.uieditor.widgets.ZMInventoryIsland.BucketWidgetWaterLevelWidget" )

CoD.BucketWidget = InheritFrom( LUI.UIElement )
CoD.BucketWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BucketWidget )
	self.id = "BucketWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 196 )
	self:setTopBottom( true, false, 0, 232 )
	self.anyChildUsesUpdateState = true
	
	local RegularBucket = CoD.BucketWidgetBucket.new( menu, controller )
	RegularBucket:setLeftRight( true, false, 14, 182 )
	RegularBucket:setTopBottom( true, false, 32, 200 )
	RegularBucket.PieceImageNewGreen:setImage( RegisterImage( "uie_t7_icon_inventory_dlc2_bucket_new" ) )
	RegularBucket.PieceImage:setImage( RegisterImage( "uie_t7_icon_inventory_dlc2_bucket" ) )
	RegularBucket:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and IsBucketAtLevel( controller, 1 )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				return ShowBucketPartsWidget( controller ) and IsBucketAtLevel( controller, 1 )
			end
		},
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return ShowBucketOrSeedWidget( controller ) and IsBucketAtLevel( controller, 1 )
			end
		}
	} )
	RegularBucket:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( RegularBucket, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	RegularBucket:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.bucket_bucket_type" ), function ( model )
		menu:updateElementState( RegularBucket, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.bucket_bucket_type"
		} )
	end )
	RegularBucket:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_bucket_parts" ), function ( model )
		menu:updateElementState( RegularBucket, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_bucket_parts"
		} )
	end )
	RegularBucket:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_seed_parts" ), function ( model )
		menu:updateElementState( RegularBucket, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_seed_parts"
		} )
	end )
	self:addElement( RegularBucket )
	self.RegularBucket = RegularBucket
	
	local GoldBucket = CoD.BucketWidgetBucket.new( menu, controller )
	GoldBucket:setLeftRight( true, false, 14, 182 )
	GoldBucket:setTopBottom( true, false, 32, 200 )
	GoldBucket.PieceImageNewGreen:setImage( RegisterImage( "uie_t7_icon_inventory_dlc2_bucket_gold_new" ) )
	GoldBucket.PieceImage:setImage( RegisterImage( "uie_t7_icon_inventory_dlc2_bucket_gold" ) )
	GoldBucket:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and IsBucketAtLevel( controller, 2 )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				return ShowBucketPartsWidget( controller ) and IsBucketAtLevel( controller, 2 )
			end
		},
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return ShowBucketOrSeedWidget( controller ) and IsBucketAtLevel( controller, 2 )
			end
		}
	} )
	GoldBucket:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( GoldBucket, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	GoldBucket:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.bucket_bucket_type" ), function ( model )
		menu:updateElementState( GoldBucket, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.bucket_bucket_type"
		} )
	end )
	GoldBucket:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_bucket_parts" ), function ( model )
		menu:updateElementState( GoldBucket, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_bucket_parts"
		} )
	end )
	GoldBucket:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_seed_parts" ), function ( model )
		menu:updateElementState( GoldBucket, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_seed_parts"
		} )
	end )
	self:addElement( GoldBucket )
	self.GoldBucket = GoldBucket
	
	local level1 = CoD.BucketWidgetWaterLevelWidget.new( menu, controller )
	level1:setLeftRight( true, false, 14, 182 )
	level1:setTopBottom( true, false, 32, 200 )
	level1:setAlpha( 0.7 )
	level1.WaterImage:setImage( RegisterImage( "uie_t7_icon_inventory_dlc2_bucket_t1_a" ) )
	level1.WaterFlipbook:setImage( RegisterImage( "uie_t7_zm_dlc2_flipbook_water_t1_a" ) )
	level1:mergeStateConditions( {
		{
			stateName = "WaterType0",
			condition = function ( menu, element, event )
				return IsBucketWaterType( controller, 0 ) and IsBucketWaterLevel( controller, 1 )
			end
		},
		{
			stateName = "WaterType1",
			condition = function ( menu, element, event )
				return IsBucketWaterType( controller, 1 ) and IsBucketWaterLevel( controller, 1 )
			end
		},
		{
			stateName = "WaterType2",
			condition = function ( menu, element, event )
				return IsBucketWaterType( controller, 2 ) and IsBucketWaterLevel( controller, 1 )
			end
		},
		{
			stateName = "WaterType3",
			condition = function ( menu, element, event )
				return IsBucketWaterType( controller, 3 ) and IsBucketWaterLevel( controller, 1 )
			end
		}
	} )
	level1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( level1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	level1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_bucket_parts" ), function ( model )
		menu:updateElementState( level1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_bucket_parts"
		} )
	end )
	level1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_seed_parts" ), function ( model )
		menu:updateElementState( level1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_seed_parts"
		} )
	end )
	level1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.bucket_bucket_water_type" ), function ( model )
		menu:updateElementState( level1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.bucket_bucket_water_type"
		} )
	end )
	level1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.bucket_bucket_water_level" ), function ( model )
		menu:updateElementState( level1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.bucket_bucket_water_level"
		} )
	end )
	self:addElement( level1 )
	self.level1 = level1
	
	local level2 = CoD.BucketWidgetWaterLevelWidget.new( menu, controller )
	level2:setLeftRight( true, false, 14, 182 )
	level2:setTopBottom( true, false, 32, 200 )
	level2:setAlpha( 0.7 )
	level2.WaterImage:setImage( RegisterImage( "uie_t7_icon_inventory_dlc2_bucket_t1_b" ) )
	level2.WaterFlipbook:setImage( RegisterImage( "uie_t7_zm_dlc2_flipbook_water_t1_b" ) )
	level2:mergeStateConditions( {
		{
			stateName = "WaterType0",
			condition = function ( menu, element, event )
				return IsBucketWaterType( controller, 0 ) and IsBucketWaterLevel( controller, 2 )
			end
		},
		{
			stateName = "WaterType1",
			condition = function ( menu, element, event )
				return IsBucketWaterType( controller, 1 ) and IsBucketWaterLevel( controller, 2 )
			end
		},
		{
			stateName = "WaterType2",
			condition = function ( menu, element, event )
				return IsBucketWaterType( controller, 2 ) and IsBucketWaterLevel( controller, 2 )
			end
		},
		{
			stateName = "WaterType3",
			condition = function ( menu, element, event )
				return IsBucketWaterType( controller, 3 ) and IsBucketWaterLevel( controller, 2 )
			end
		}
	} )
	level2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( level2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	level2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_bucket_parts" ), function ( model )
		menu:updateElementState( level2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_bucket_parts"
		} )
	end )
	level2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_seed_parts" ), function ( model )
		menu:updateElementState( level2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_seed_parts"
		} )
	end )
	level2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.bucket_bucket_water_type" ), function ( model )
		menu:updateElementState( level2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.bucket_bucket_water_type"
		} )
	end )
	level2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.bucket_bucket_water_level" ), function ( model )
		menu:updateElementState( level2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.bucket_bucket_water_level"
		} )
	end )
	self:addElement( level2 )
	self.level2 = level2
	
	local level3 = CoD.BucketWidgetWaterLevelWidget.new( menu, controller )
	level3:setLeftRight( true, false, 14, 182 )
	level3:setTopBottom( true, false, 32, 200 )
	level3:setAlpha( 0.7 )
	level3.WaterImage:setImage( RegisterImage( "uie_t7_icon_inventory_dlc2_bucket_t1_c" ) )
	level3.WaterFlipbook:setImage( RegisterImage( "uie_t7_zm_dlc2_flipbook_water_t1_c" ) )
	level3:mergeStateConditions( {
		{
			stateName = "WaterType0",
			condition = function ( menu, element, event )
				return IsBucketWaterType( controller, 0 ) and IsBucketWaterLevel( controller, 3 )
			end
		},
		{
			stateName = "WaterType1",
			condition = function ( menu, element, event )
				return IsBucketWaterType( controller, 1 ) and IsBucketWaterLevel( controller, 3 )
			end
		},
		{
			stateName = "WaterType2",
			condition = function ( menu, element, event )
				return IsBucketWaterType( controller, 2 ) and IsBucketWaterLevel( controller, 3 )
			end
		},
		{
			stateName = "WaterType3",
			condition = function ( menu, element, event )
				return IsBucketWaterType( controller, 3 ) and IsBucketWaterLevel( controller, 3 )
			end
		}
	} )
	level3:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( level3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	level3:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_bucket_parts" ), function ( model )
		menu:updateElementState( level3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_bucket_parts"
		} )
	end )
	level3:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_seed_parts" ), function ( model )
		menu:updateElementState( level3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_seed_parts"
		} )
	end )
	level3:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.bucket_bucket_water_type" ), function ( model )
		menu:updateElementState( level3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.bucket_bucket_water_type"
		} )
	end )
	level3:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.bucket_bucket_water_level" ), function ( model )
		menu:updateElementState( level3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.bucket_bucket_water_level"
		} )
	end )
	self:addElement( level3 )
	self.level3 = level3
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				RegularBucket:completeAnimation()
				self.RegularBucket:setAlpha( 0 )
				self.clipFinished( RegularBucket, {} )

				GoldBucket:completeAnimation()
				self.GoldBucket:setAlpha( 0 )
				self.clipFinished( GoldBucket, {} )

				level1:completeAnimation()
				self.level1:setAlpha( 0 )
				self.clipFinished( level1, {} )

				level2:completeAnimation()
				self.level2:setAlpha( 0 )
				self.clipFinished( level2, {} )

				level3:completeAnimation()
				self.level3:setAlpha( 0 )
				self.clipFinished( level3, {} )
			end
		},
		Scoreboard = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				RegularBucket:completeAnimation()
				self.RegularBucket:setAlpha( 1 )
				self.clipFinished( RegularBucket, {} )

				GoldBucket:completeAnimation()
				self.GoldBucket:setAlpha( 1 )
				self.clipFinished( GoldBucket, {} )

				level1:completeAnimation()
				self.level1:setAlpha( 0.7 )
				self.clipFinished( level1, {} )

				level2:completeAnimation()
				self.level2:setAlpha( 0.7 )
				self.clipFinished( level2, {} )

				level3:completeAnimation()
				self.level3:setAlpha( 0.7 )
				self.clipFinished( level3, {} )
			end
		},
		BGWidget = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				RegularBucket:completeAnimation()
				self.RegularBucket:setAlpha( 1 )
				self.clipFinished( RegularBucket, {} )

				GoldBucket:completeAnimation()
				self.GoldBucket:setAlpha( 1 )
				self.clipFinished( GoldBucket, {} )

				level1:completeAnimation()
				self.level1:setAlpha( 0.7 )
				self.clipFinished( level1, {} )

				level2:completeAnimation()
				self.level2:setAlpha( 0.7 )
				self.clipFinished( level2, {} )

				level3:completeAnimation()
				self.level3:setAlpha( 0.7 )
				self.clipFinished( level3, {} )
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
			stateName = "BGWidget",
			condition = function ( menu, element, event )
				local f47_local0
				if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) then
					f47_local0 = ShowBucketOrSeedWidget( controller )
				else
					f47_local0 = false
				end
				return f47_local0
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
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_bucket_parts" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_bucket_parts"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_seed_parts" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_seed_parts"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.RegularBucket:close()
		element.GoldBucket:close()
		element.level1:close()
		element.level2:close()
		element.level3:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
