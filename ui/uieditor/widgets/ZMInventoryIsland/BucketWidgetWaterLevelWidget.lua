-- 28b2c119d1f79117abfeb4a8fde91e8d
-- This hash is used for caching, delete to decompile the file again

CoD.BucketWidgetWaterLevelWidget = InheritFrom( LUI.UIElement )
CoD.BucketWidgetWaterLevelWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BucketWidgetWaterLevelWidget )
	self.id = "BucketWidgetWaterLevelWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 168 )
	self:setTopBottom( true, false, 0, 168 )
	
	local WaterImage = LUI.UIImage.new()
	WaterImage:setLeftRight( true, true, 0, 0 )
	WaterImage:setTopBottom( true, true, 0, 0 )
	WaterImage:setAlpha( 0 )
	self:addElement( WaterImage )
	self.WaterImage = WaterImage
	
	local WaterFlipbook = LUI.UIImage.new()
	WaterFlipbook:setLeftRight( true, true, 0, 0 )
	WaterFlipbook:setTopBottom( true, true, 0, 0 )
	WaterFlipbook:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook_add" ) )
	WaterFlipbook:setShaderVector( 0, 10, 7, 0, 0 )
	WaterFlipbook:setShaderVector( 1, 20, 0, 0, 0 )
	self:addElement( WaterFlipbook )
	self.WaterFlipbook = WaterFlipbook
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				WaterImage:completeAnimation()
				self.WaterImage:setAlpha( 0 )
				self.clipFinished( WaterImage, {} )

				WaterFlipbook:completeAnimation()
				self.WaterFlipbook:setAlpha( 0 )
				self.clipFinished( WaterFlipbook, {} )
			end
		},
		HidingBucket = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				WaterImage:completeAnimation()
				self.WaterImage:setAlpha( 0 )
				self.clipFinished( WaterImage, {} )

				WaterFlipbook:completeAnimation()
				self.WaterFlipbook:setAlpha( 0 )
				self.clipFinished( WaterFlipbook, {} )
			end
		},
		WaterType0 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				WaterImage:completeAnimation()
				self.WaterImage:setRGB( 0, 0.51, 1 )
				self.WaterImage:setAlpha( 1 )
				self.clipFinished( WaterImage, {} )

				WaterFlipbook:completeAnimation()
				self.WaterFlipbook:setAlpha( 0 )
				self.clipFinished( WaterFlipbook, {} )
			end
		},
		WaterType1 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				WaterImage:completeAnimation()
				self.WaterImage:setRGB( 0.02, 0.87, 0 )
				self.WaterImage:setAlpha( 1 )
				self.clipFinished( WaterImage, {} )

				WaterFlipbook:completeAnimation()
				self.WaterFlipbook:setAlpha( 0 )
				self.clipFinished( WaterFlipbook, {} )
			end
		},
		WaterType2 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				WaterImage:completeAnimation()
				self.WaterImage:setRGB( 0.67, 0.11, 1 )
				self.WaterImage:setAlpha( 1 )
				self.clipFinished( WaterImage, {} )

				WaterFlipbook:completeAnimation()
				self.WaterFlipbook:setAlpha( 0 )
				self.clipFinished( WaterFlipbook, {} )
			end
		},
		WaterType3 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				WaterImage:completeAnimation()
				self.WaterImage:setRGB( 1, 1, 1 )
				self.WaterImage:setAlpha( 1 )
				self.clipFinished( WaterImage, {} )

				WaterFlipbook:completeAnimation()
				self.WaterFlipbook:setAlpha( 1 )
				self.clipFinished( WaterFlipbook, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "HidingBucket",
			condition = function ( menu, element, event )
				return not ShowingAnyBucketPart( controller )
			end
		},
		{
			stateName = "WaterType0",
			condition = function ( menu, element, event )
				return IsBucketWaterType( controller, 0 )
			end
		},
		{
			stateName = "WaterType1",
			condition = function ( menu, element, event )
				return IsBucketWaterType( controller, 1 )
			end
		},
		{
			stateName = "WaterType2",
			condition = function ( menu, element, event )
				return IsBucketWaterType( controller, 2 )
			end
		},
		{
			stateName = "WaterType3",
			condition = function ( menu, element, event )
				return IsBucketWaterType( controller, 3 )
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
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.bucket_bucket_water_type" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.bucket_bucket_water_type"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
