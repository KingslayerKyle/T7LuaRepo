-- e307306135056db64ec1ccc887b9615e
-- This hash is used for caching, delete to decompile the file again

CoD.MinimapHelperItems = InheritFrom( LUI.UIElement )
CoD.MinimapHelperItems.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MinimapHelperItems )
	self.id = "MinimapHelperItems"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 721 )
	self:setTopBottom( true, false, 0, 721 )
	
	local items = LUI.UIImage.new()
	items:setLeftRight( true, true, 0, 0 )
	items:setTopBottom( true, true, 0, 0 )
	items:setupCompassItems( Enum.CompassType.COMPASS_TYPE_FULL )
	self:addElement( items )
	self.items = items
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				items:completeAnimation()
				self.items:setAlpha( 0.95 )
				self.clipFinished( items, {} )
				self.nextClip = "DefaultClip"
			end
		},
		CounterUAV = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				items:completeAnimation()
				self.items:setAlpha( 0 )
				self.clipFinished( items, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "CounterUAV",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_COUNTER_UAV_ACTIVE )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_COUNTER_UAV_ACTIVE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_COUNTER_UAV_ACTIVE
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

