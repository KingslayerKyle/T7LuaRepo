local SecondsToClock = function ( seconds )
	local seconds = tonumber( seconds )

	local hours = string.format( "%02.f", math.floor( seconds / 3600 ) );
	local mins = string.format( "%02.f", math.floor( seconds / 60 - ( hours * 60 ) ) );
	local secs = string.format( "%02.f", math.floor( seconds - hours * 3600 - mins * 60 ) );

	return mins .. ":" .. secs
end

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
	self:setLeftRight( true, false, 0, 43 )
	self:setTopBottom( true, false, 0, 43 )

	self.image = LUI.UIImage.new()
	self.image:setLeftRight( true, false, 0, 43 )
	self.image:setTopBottom( true, false, 0, 43 )
	self.image:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )

		if image then
			self.image:setImage( RegisterImage( image ) )
		end
	end )
	self:addElement( self.image )

	self.time = LUI.UIText.new()
	self.time:setLeftRight( true, true, 0, 0 )
	self.time:setTopBottom( true, false, 29, 66 )
	self.time:setTTF( "fonts/defaultbold.otf" )
	self.time:setScale( 0.5 )
	self.time:linkToElementModel( self, "time", true, function ( model )
		local time = Engine.GetModelValue( model )
		
		if time then
			if time > 59 then
				if time == 255 then
					self.time:setText( Engine.Localize( "04:15+" ) )
				else
					self.time:setText( Engine.Localize( SecondsToClock ( time ) ) )
				end
			else
				self.time:setText( Engine.Localize( time ) )
			end
		end
	end )
	self:addElement( self.time )

	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				self.image:completeAnimation()
				self.image:setAlpha( 0 )
				self.clipFinished( self.image, {} )

				self.time:completeAnimation()
				self.time:setAlpha( 0 )
				self.clipFinished( self.time, {} )
			end
		},
		STATE_ON = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				self.image:completeAnimation()
				self.image:setAlpha( 1 )
				self.clipFinished( self.image, {} )

				self.time:completeAnimation()
				self.time:setAlpha( 1 )
				self.clipFinished( self.time, {} )
			end
		},
		STATE_FLASHING_OFF = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				self.image:completeAnimation()
				self.image:setAlpha( 0 )
				self.clipFinished( self.image, {} )

				self.time:completeAnimation()
				self.time:setAlpha( 0 )
				self.clipFinished( self.time, {} )
			end
		},
		STATE_FLASHING_ON = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				self.image:completeAnimation()
				self.image:setAlpha( 1 )
				self.clipFinished( self.image, {} )

				self.time:completeAnimation()
				self.time:setAlpha( 1 )
				self.clipFinished( self.time, {} )
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
		element.time:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
