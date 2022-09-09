-- 87e856d11fc62a3b617c6de16fd8738d
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.ZMInventoryIsland.SeedPieceWidget" )

CoD.SeedWidget = InheritFrom( LUI.UIElement )
CoD.SeedWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.SeedWidget )
	self.id = "SeedWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 64 )
	self:setTopBottom( true, false, 0, 164 )
	self.anyChildUsesUpdateState = true
	
	local TopSeed = CoD.SeedPieceWidget.new( menu, controller )
	TopSeed:setLeftRight( true, false, 9.6, 54.4 )
	TopSeed:setTopBottom( true, false, 9.6, 54.4 )
	TopSeed.PieceImageNewGreen:setImage( RegisterImage( "uie_t7_icon_inventory_dlc2_seed_new" ) )
	TopSeed.PieceImage:setImage( RegisterImage( "uie_t7_icon_inventory_dlc2_seed" ) )
	TopSeed:mergeStateConditions( {
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				local f2_local0
				if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) then
					f2_local0 = ShowSeedPartsWidget( controller )
					if f2_local0 then
						f2_local0 = HasBucketSeedItem( controller, "CRAFTABLE_BUCKET_SEED_3" )
					end
				else
					f2_local0 = false
				end
				return f2_local0
			end
		},
		{
			stateName = "NotNewFound",
			condition = function ( menu, element, event )
				local f3_local0
				if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) then
					f3_local0 = ShowBucketOrSeedWidget( controller )
					if f3_local0 then
						f3_local0 = HasBucketSeedItem( controller, "CRAFTABLE_BUCKET_SEED_3" )
					end
				else
					f3_local0 = false
				end
				return f3_local0
			end
		}
	} )
	TopSeed:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( TopSeed, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	TopSeed:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_seed_parts" ), function ( model )
		menu:updateElementState( TopSeed, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_seed_parts"
		} )
	end )
	TopSeed:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.bucket_seed_01" ), function ( model )
		menu:updateElementState( TopSeed, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.bucket_seed_01"
		} )
	end )
	TopSeed:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.bucket_seed_02" ), function ( model )
		menu:updateElementState( TopSeed, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.bucket_seed_02"
		} )
	end )
	TopSeed:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.bucket_seed_03" ), function ( model )
		menu:updateElementState( TopSeed, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.bucket_seed_03"
		} )
	end )
	TopSeed:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_bucket_parts" ), function ( model )
		menu:updateElementState( TopSeed, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_bucket_parts"
		} )
	end )
	self:addElement( TopSeed )
	self.TopSeed = TopSeed
	
	local MiddleSeed = CoD.SeedPieceWidget.new( menu, controller )
	MiddleSeed:setLeftRight( true, false, 9.6, 54.4 )
	MiddleSeed:setTopBottom( true, false, 54.4, 99.2 )
	MiddleSeed.PieceImageNewGreen:setImage( RegisterImage( "uie_t7_icon_inventory_dlc2_seed_new" ) )
	MiddleSeed.PieceImage:setImage( RegisterImage( "uie_t7_icon_inventory_dlc2_seed" ) )
	MiddleSeed:mergeStateConditions( {
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				local f10_local0
				if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) then
					f10_local0 = ShowSeedPartsWidget( controller )
					if f10_local0 then
						f10_local0 = HasBucketSeedItem( controller, "CRAFTABLE_BUCKET_SEED_2" )
						if f10_local0 then
							f10_local0 = not HasBucketSeedItem( controller, "CRAFTABLE_BUCKET_SEED_3" )
						end
					end
				else
					f10_local0 = false
				end
				return f10_local0
			end
		},
		{
			stateName = "NotNewFound",
			condition = function ( menu, element, event )
				local f11_local0
				if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) then
					f11_local0 = ShowBucketOrSeedWidget( controller )
					if f11_local0 then
						f11_local0 = HasBucketSeedItem( controller, "CRAFTABLE_BUCKET_SEED_2" )
					end
				else
					f11_local0 = false
				end
				return f11_local0
			end
		}
	} )
	MiddleSeed:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( MiddleSeed, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	MiddleSeed:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_seed_parts" ), function ( model )
		menu:updateElementState( MiddleSeed, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_seed_parts"
		} )
	end )
	MiddleSeed:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.bucket_seed_01" ), function ( model )
		menu:updateElementState( MiddleSeed, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.bucket_seed_01"
		} )
	end )
	MiddleSeed:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.bucket_seed_02" ), function ( model )
		menu:updateElementState( MiddleSeed, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.bucket_seed_02"
		} )
	end )
	MiddleSeed:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.bucket_seed_03" ), function ( model )
		menu:updateElementState( MiddleSeed, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.bucket_seed_03"
		} )
	end )
	MiddleSeed:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_bucket_parts" ), function ( model )
		menu:updateElementState( MiddleSeed, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_bucket_parts"
		} )
	end )
	self:addElement( MiddleSeed )
	self.MiddleSeed = MiddleSeed
	
	local BottomSeed = CoD.SeedPieceWidget.new( menu, controller )
	BottomSeed:setLeftRight( true, false, 9.6, 54.4 )
	BottomSeed:setTopBottom( true, false, 96.6, 141.4 )
	BottomSeed.PieceImageNewGreen:setImage( RegisterImage( "uie_t7_icon_inventory_dlc2_seed_new" ) )
	BottomSeed.PieceImage:setImage( RegisterImage( "uie_t7_icon_inventory_dlc2_seed" ) )
	BottomSeed:mergeStateConditions( {
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				local f18_local0
				if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) then
					f18_local0 = ShowSeedPartsWidget( controller )
					if f18_local0 then
						f18_local0 = HasBucketSeedItem( controller, "CRAFTABLE_BUCKET_SEED_1" )
						if f18_local0 then
							if not HasBucketSeedItem( controller, "CRAFTABLE_BUCKET_SEED_2" ) then
								f18_local0 = not HasBucketSeedItem( controller, "CRAFTABLE_BUCKET_SEED_3" )
							else
								f18_local0 = false
							end
						end
					end
				else
					f18_local0 = false
				end
				return f18_local0
			end
		},
		{
			stateName = "NotNewFound",
			condition = function ( menu, element, event )
				local f19_local0
				if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) then
					f19_local0 = ShowBucketOrSeedWidget( controller )
					if f19_local0 then
						f19_local0 = HasBucketSeedItem( controller, "CRAFTABLE_BUCKET_SEED_1" )
					end
				else
					f19_local0 = false
				end
				return f19_local0
			end
		}
	} )
	BottomSeed:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( BottomSeed, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	BottomSeed:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_seed_parts" ), function ( model )
		menu:updateElementState( BottomSeed, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_seed_parts"
		} )
	end )
	BottomSeed:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.bucket_seed_01" ), function ( model )
		menu:updateElementState( BottomSeed, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.bucket_seed_01"
		} )
	end )
	BottomSeed:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.bucket_seed_02" ), function ( model )
		menu:updateElementState( BottomSeed, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.bucket_seed_02"
		} )
	end )
	BottomSeed:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.bucket_seed_03" ), function ( model )
		menu:updateElementState( BottomSeed, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.bucket_seed_03"
		} )
	end )
	BottomSeed:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_bucket_parts" ), function ( model )
		menu:updateElementState( BottomSeed, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_bucket_parts"
		} )
	end )
	self:addElement( BottomSeed )
	self.BottomSeed = BottomSeed
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				TopSeed:completeAnimation()
				self.TopSeed:setAlpha( 0 )
				self.clipFinished( TopSeed, {} )

				MiddleSeed:completeAnimation()
				self.MiddleSeed:setAlpha( 0 )
				self.clipFinished( MiddleSeed, {} )

				BottomSeed:completeAnimation()
				self.BottomSeed:setAlpha( 0 )
				self.clipFinished( BottomSeed, {} )
			end
		},
		Seed3 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				TopSeed:completeAnimation()
				self.TopSeed:setAlpha( 1 )
				self.clipFinished( TopSeed, {} )

				MiddleSeed:completeAnimation()
				self.MiddleSeed:setAlpha( 1 )
				self.clipFinished( MiddleSeed, {} )

				BottomSeed:completeAnimation()
				self.BottomSeed:setAlpha( 1 )
				self.clipFinished( BottomSeed, {} )
			end
		},
		Seed2 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				TopSeed:completeAnimation()
				self.TopSeed:setAlpha( 0 )
				self.clipFinished( TopSeed, {} )

				MiddleSeed:completeAnimation()
				self.MiddleSeed:setAlpha( 1 )
				self.clipFinished( MiddleSeed, {} )

				BottomSeed:completeAnimation()
				self.BottomSeed:setAlpha( 1 )
				self.clipFinished( BottomSeed, {} )
			end
		},
		Seed1 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				TopSeed:completeAnimation()
				self.TopSeed:setAlpha( 0 )
				self.clipFinished( TopSeed, {} )

				MiddleSeed:completeAnimation()
				self.MiddleSeed:setAlpha( 0 )
				self.clipFinished( MiddleSeed, {} )

				BottomSeed:completeAnimation()
				self.BottomSeed:setAlpha( 1 )
				self.clipFinished( BottomSeed, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Seed3",
			condition = function ( menu, element, event )
				return HasBucketSeedItem( controller, "CRAFTABLE_BUCKET_SEED_3" )
			end
		},
		{
			stateName = "Seed2",
			condition = function ( menu, element, event )
				return HasBucketSeedItem( controller, "CRAFTABLE_BUCKET_SEED_2" )
			end
		},
		{
			stateName = "Seed1",
			condition = function ( menu, element, event )
				return HasBucketSeedItem( controller, "CRAFTABLE_BUCKET_SEED_1" )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.bucket_seed_01" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.bucket_seed_01"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.bucket_seed_02" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.bucket_seed_02"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.bucket_seed_03" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.bucket_seed_03"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.TopSeed:close()
		element.MiddleSeed:close()
		element.BottomSeed:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
