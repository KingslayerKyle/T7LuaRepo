CoD.KingslayerPowerupsListItem = InheritFrom( LUI.UIElement )
CoD.KingslayerPowerupsListItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.KingslayerPowerupsListItem )
	self.id = "KingslayerPowerupsListItem"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 50 )
	self:setTopBottom( true, false, 0, 50 )

	self.image = LUI.UIImage.new()
	self.image:setLeftRight( true, false, 0, 50 )
	self.image:setTopBottom( true, false, 0, 50 )
	self.image:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )

		if image then
			self.image:setImage( RegisterImage( image ) )
		end
	end )
	self:addElement( self.image )

	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				self.image:completeAnimation()
				self.image:setAlpha( 0 )
				self.clipFinished( self.image, {} )
			end
		},
		STATE_ON = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				self.image:completeAnimation()
				self.image:setAlpha( 1 )
				self.clipFinished( self.image, {} )
			end
		},
		STATE_FLASHING_OFF = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				self.image:completeAnimation()
				self.image:setAlpha( 0 )
				self.clipFinished( self.image, {} )
			end
		},
		STATE_FLASHING_ON = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				self.image:completeAnimation()
				self.image:setAlpha( 1 )
				self.clipFinished( self.image, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "STATE_ON",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "state", 1 )
			end
		},
		{
			stateName = "STATE_FLASHING_OFF",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "state", 2 )
			end
		},
		{
			stateName = "STATE_FLASHING_ON",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "state", 3 )
			end
		}
	} )

	self:linkToElementModel( self, "state", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "state"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.image:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
