local SetReviveRGB = function ( self, controller, element )
	local stateFlagsModel = Engine.GetModel( self:getModel(), "stateFlags" )
	local clockPercentModel = Engine.GetModel( self:getModel(), "clockPercent" )
	local stateFlags = Engine.GetModelValue( stateFlagsModel )
	local clockPercent = Engine.GetModelValue( clockPercentModel )

	if stateFlags ~= nil and clockPercent ~= nil then
		if stateFlags == 3 then
			element:setRGB( 1, 1, 1 )
			return
		end

		element:setRGB( 1, math.max( 0, math.min( 1, clockPercent ) ), 0 )
	end
end

CoD.T4Revive = InheritFrom( LUI.UIElement )
CoD.T4Revive.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.T4Revive )
	self.id = "T4Revive"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 220 )
	self:setTopBottom( true, false, 0, 220 )
	self.anyChildUsesUpdateState = true

	self.image = LUI.UIImage.new()
	self.image:setLeftRight( false, false, -50, 50 )
	self.image:setTopBottom( false, false, -50, 50 )
	self.image:setImage( RegisterImage( "t4_waypoint_revive" ) )
	self.image:linkToElementModel( self, "clockPercent", true, function ( model )
		SetReviveRGB( self, controller, self.image )
	end )
	self.image:linkToElementModel( self, "stateFlags", true, function ( model )
		SetReviveRGB( self, controller, self.image )
	end )
	self:addElement( self.image )

	self.percentbg = LUI.UIImage.new()
	self.percentbg:setLeftRight( false, false, -135, 135 )
	self.percentbg:setTopBottom( true, false, 240, 260 )
	self.percentbg:setImage( RegisterImage( "$white" ) )
	self.percentbg:setRGB( 0, 0, 0 )
	self.percentbg:setAlpha( 0.5 )
	self:addElement( self.percentbg )

	self.percent = LUI.UIImage.new()
	self.percent:setLeftRight( false, false, -130, 130 )
	self.percent:setTopBottom( true, false, 245, 255 )
	self.percent:setImage( RegisterImage( "$white" ) )
	self.percent:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
	self.percent:setShaderVector( 1, 0, 0, 0, 0 )
	self.percent:setShaderVector( 2, 1, 0, 0, 0 )
	self.percent:setShaderVector( 3, 0, 0, 0, 0 )
	self.percent:linkToElementModel( self, "clockPercent", true, function ( model )
		local clockPercent = Engine.GetModelValue( model )

		if clockPercent then
			self.percent:setShaderVector( 0,
				CoD.GetVectorComponentFromString( clockPercent, 1 ),
				CoD.GetVectorComponentFromString( clockPercent, 2 ),
				CoD.GetVectorComponentFromString( clockPercent, 3 ),
				CoD.GetVectorComponentFromString( clockPercent, 4 ) )
		end
	end )
	self:addElement( self.percent )

	self.text = LUI.UIText.new()
	self.text:setLeftRight( false, false, -105, 105 )
	self.text:setTopBottom( true, false, 165, 255 )
	self.text:setText( Engine.Localize( "ZOMBIE_REVIVING" ) )
	self.text:setTTF( "fonts/itc_legacy_sans_bold.ttf" )
	self.text:setScale( 0.5 )
	self:addElement( self.text )

	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				self.image:completeAnimation()
				self.image:setAlpha( 0 )
				self.clipFinished( self.image, {} )

				self.percentbg:completeAnimation()
				self.percentbg:setAlpha( 0 )
				self.clipFinished( self.percentbg, {} )

				self.percent:completeAnimation()
				self.percent:setAlpha( 0 )
				self.clipFinished( self.percent, {} )

				self.text:completeAnimation()
				self.text:setAlpha( 0 )
				self.clipFinished( self.text, {} )
			end
		},
		Reviving = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				self.image:completeAnimation()
				self.image:setAlpha( 1 )
				self.clipFinished( self.image, {} )

				self.percentbg:completeAnimation()
				self.percentbg:setAlpha( 0.5 )
				self.clipFinished( self.percentbg, {} )

				self.percent:completeAnimation()
				self.percent:setAlpha( 1 )
				self.clipFinished( self.percent, {} )

				self.text:completeAnimation()
				self.text:setAlpha( 1 )
				self.clipFinished( self.text, {} )
			end
		},
		BleedingOut_Low = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				self.image:completeAnimation()
				self.image:setAlpha( 1 )
				self.clipFinished( self.image, {} )

				self.percentbg:completeAnimation()
				self.percentbg:setAlpha( 0 )
				self.clipFinished( self.percentbg, {} )

				self.percent:completeAnimation()
				self.percent:setAlpha( 0 )
				self.clipFinished( self.percent, {} )

				self.text:completeAnimation()
				self.text:setAlpha( 0 )
				self.clipFinished( self.text, {} )
			end
		},
		BleedingOut = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				self.image:completeAnimation()
				self.image:setAlpha( 1 )
				self.clipFinished( self.image, {} )

				self.percentbg:completeAnimation()
				self.percentbg:setAlpha( 0 )
				self.clipFinished( self.percentbg, {} )

				self.percent:completeAnimation()
				self.percent:setAlpha( 0 )
				self.clipFinished( self.percent, {} )

				self.text:completeAnimation()
				self.text:setAlpha( 0 )
				self.clipFinished( self.text, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Reviving",
			condition = function ( menu, element, event )
				return IsSelfModelValueEnumBitSet( element, controller, "stateFlags", Enum.BleedOutStateFlags.BLEEDOUT_STATE_FLAG_BEING_REVIVED )
			end
		},
		{
			stateName = "BleedingOut_Low",
			condition = function ( menu, element, event )
				return IsSelfModelValueEnumBitSet( element, controller, "stateFlags", Enum.BleedOutStateFlags.BLEEDOUT_STATE_FLAG_BLEEDING_OUT ) and IsSelfModelValueLessThanOrEqualTo( element, controller, "bleedOutPercent", 0.3 )
			end
		},
		{
			stateName = "BleedingOut",
			condition = function ( menu, element, event )
				return IsSelfModelValueEnumBitSet( element, controller, "stateFlags", Enum.BleedOutStateFlags.BLEEDOUT_STATE_FLAG_BLEEDING_OUT )
			end
		}
	} )
	self:linkToElementModel( self, "stateFlags", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "stateFlags"
		} )
	end )
	self:linkToElementModel( self, "bleedOutPercent", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "bleedOutPercent"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.image:close()
		element.percentbg:close()
		element.percent:close()
		element.text:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
