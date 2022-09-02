-- 1d897405b919b0ebdea9ad05b31e6fc8
-- This hash is used for caching, delete to decompile the file again

CoD.CodCasterMap = InheritFrom( LUI.UIElement )
CoD.CodCasterMap.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.CodCasterMap )
	self.id = "CodCasterMap"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	
	local minimapMap = LUI.UIImage.new()
	minimapMap:setLeftRight( true, true, 219, -219 )
	minimapMap:setTopBottom( true, true, -4.5, 4.5 )
	minimapMap:setAlpha( 0.21 )
	minimapMap:setupCompassMap( Enum.CompassType.COMPASS_TYPE_FULL )
	self:addElement( minimapMap )
	self.minimapMap = minimapMap
	
	local minimapItems = LUI.UIImage.new()
	minimapItems:setLeftRight( true, true, 219, -219 )
	minimapItems:setTopBottom( true, true, -4.5, 4.5 )
	minimapItems:setAlpha( 0.2 )
	minimapItems:setupCompassItems( Enum.CompassType.COMPASS_TYPE_FULL )
	self:addElement( minimapItems )
	self.minimapItems = minimapItems
	
	local minimapOverlay = LUI.UIImage.new()
	minimapOverlay:setLeftRight( true, true, 219, -219 )
	minimapOverlay:setTopBottom( true, true, -4.5, 4.5 )
	minimapOverlay:setAlpha( 0.19 )
	minimapOverlay:setupCompassOverlay( Enum.CompassType.COMPASS_TYPE_FULL )
	self:addElement( minimapOverlay )
	self.minimapOverlay = minimapOverlay
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				minimapMap:completeAnimation()
				self.minimapMap:setAlpha( 0 )
				self.clipFinished( minimapMap, {} )

				minimapItems:completeAnimation()
				self.minimapItems:setAlpha( 0 )
				self.clipFinished( minimapItems, {} )

				minimapOverlay:completeAnimation()
				self.minimapOverlay:setAlpha( 0 )
				self.clipFinished( minimapOverlay, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				minimapMap:completeAnimation()
				self.minimapMap:setAlpha( 1 )
				self.clipFinished( minimapMap, {} )

				minimapItems:completeAnimation()
				self.minimapItems:setAlpha( 1 )
				self.clipFinished( minimapItems, {} )

				minimapOverlay:completeAnimation()
				self.minimapOverlay:setAlpha( 1 )
				self.clipFinished( minimapOverlay, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsModelValueTrue( controller, "CodCaster.showFullScreenMap" )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CodCaster.showFullScreenMap" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CodCaster.showFullScreenMap"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

