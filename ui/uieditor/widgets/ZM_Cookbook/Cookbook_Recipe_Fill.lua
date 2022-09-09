-- a057a5f9aeac36c998fb0e5afabc6745
-- This hash is used for caching, delete to decompile the file again

local PreLoadFunc = function ( self, controller )
	self:linkToElementModel( self, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		local f2_local1 = Engine.GetModelValue( Engine.GetModel( self:getModel(), "count" ) )
		Engine.SetModelValue( Engine.GetModel( self:getModel(), "percentComplete" ), math.min( GetConsumableCountFromIndex( controller, modelValue ), f2_local1 ) / f2_local1 )
	end )
end

CoD.Cookbook_Recipe_Fill = InheritFrom( LUI.UIElement )
CoD.Cookbook_Recipe_Fill.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Cookbook_Recipe_Fill )
	self.id = "Cookbook_Recipe_Fill"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 90 )
	self:setTopBottom( true, false, 0, 41 )
	
	local fill = LUI.UIImage.new()
	fill:setLeftRight( true, false, 0, 90 )
	fill:setTopBottom( true, false, 0, 40.91 )
	fill:setImage( RegisterImage( "uie_t7_zm_cookbook_fill" ) )
	fill:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
	fill:setShaderVector( 1, 0, 0, 0, 0 )
	fill:setShaderVector( 2, 1, 0, 0, 0 )
	fill:setShaderVector( 3, 0, 0, 0, 0 )
	fill:linkToElementModel( self, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			fill:setRGB( GetCookbookPipeColorForItemIndex( controller, itemIndex ) )
		end
	end )
	fill:linkToElementModel( self, "percentComplete", true, function ( model )
		local percentComplete = Engine.GetModelValue( model )
		if percentComplete then
			fill:setShaderVector( 0, CoD.GetVectorComponentFromString( percentComplete, 1 ), CoD.GetVectorComponentFromString( percentComplete, 2 ), CoD.GetVectorComponentFromString( percentComplete, 3 ), CoD.GetVectorComponentFromString( percentComplete, 4 ) )
		end
	end )
	self:addElement( fill )
	self.fill = fill
	
	local fillAnimated = LUI.UIImage.new()
	fillAnimated:setLeftRight( true, false, 0, 90 )
	fillAnimated:setTopBottom( true, false, 0, 40.91 )
	fillAnimated:setZRot( 180 )
	fillAnimated:setImage( RegisterImage( "uie_t7_zm_cookbook_fill_flip" ) )
	fillAnimated:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
	fillAnimated:setShaderVector( 0, 1, 0, 0, 0 )
	fillAnimated:setShaderVector( 1, 0, 0, 0, 0 )
	fillAnimated:setShaderVector( 2, 1, 0, 0, 0 )
	fillAnimated:setShaderVector( 3, 0, 0, 0, 0 )
	fillAnimated:linkToElementModel( self, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			fillAnimated:setRGB( GetCookbookPipeColorForItemIndex( controller, itemIndex ) )
		end
	end )
	self:addElement( fillAnimated )
	self.fillAnimated = fillAnimated
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				fill:completeAnimation()
				self.fill:setAlpha( 1 )
				self.clipFinished( fill, {} )

				fillAnimated:completeAnimation()
				self.fillAnimated:setAlpha( 0 )
				self.clipFinished( fillAnimated, {} )
			end,
			Drain = function ()
				self:setupElementClipCounter( 2 )

				fill:completeAnimation()
				self.fill:setAlpha( 0 )
				self.clipFinished( fill, {} )
				local fillAnimatedFrame2 = function ( fillAnimated, event )
					if not event.interrupted then
						fillAnimated:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
					end
					fillAnimated:setAlpha( 1 )
					fillAnimated:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
					fillAnimated:setShaderVector( 0, 0, 0, 0, 0 )
					fillAnimated:setShaderVector( 1, 0, 0, 0, 0 )
					fillAnimated:setShaderVector( 2, 1, 0, 0, 0 )
					fillAnimated:setShaderVector( 3, 0, 0, 0, 0 )
					if event.interrupted then
						self.clipFinished( fillAnimated, event )
					else
						fillAnimated:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				fillAnimated:completeAnimation()
				self.fillAnimated:setAlpha( 1 )
				self.fillAnimated:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
				self.fillAnimated:setShaderVector( 0, 1, 0, 0, 0 )
				self.fillAnimated:setShaderVector( 1, 0, 0, 0, 0 )
				self.fillAnimated:setShaderVector( 2, 1, 0, 0, 0 )
				self.fillAnimated:setShaderVector( 3, 0, 0, 0, 0 )
				fillAnimatedFrame2( fillAnimated, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.fill:close()
		element.fillAnimated:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
