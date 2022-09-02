-- d11d487a15c7bffdef67b78a654f2e36
-- This hash is used for caching, delete to decompile the file again

CoD.DetectNearbyEnemies_FarRight = InheritFrom( LUI.UIElement )
CoD.DetectNearbyEnemies_FarRight.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.DetectNearbyEnemies_FarRight )
	self.id = "DetectNearbyEnemies_FarRight"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 16 )
	self:setTopBottom( true, false, 0, 176 )
	
	local DetectNearbyEnemiesFarRight = LUI.UIImage.new()
	DetectNearbyEnemiesFarRight:setLeftRight( true, true, 0, 0 )
	DetectNearbyEnemiesFarRight:setTopBottom( true, true, 0, 0 )
	DetectNearbyEnemiesFarRight:setXRot( -180 )
	DetectNearbyEnemiesFarRight:setYRot( -180 )
	DetectNearbyEnemiesFarRight:setImage( RegisterImage( "uie_t7_mp_hud_perkwidget_6sense_sideoutter" ) )
	DetectNearbyEnemiesFarRight:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( DetectNearbyEnemiesFarRight )
	self.DetectNearbyEnemiesFarRight = DetectNearbyEnemiesFarRight
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				DetectNearbyEnemiesFarRight:completeAnimation()
				self.DetectNearbyEnemiesFarRight:setAlpha( 0 )
				self.clipFinished( DetectNearbyEnemiesFarRight, {} )
			end,
			EnemyDetected = function ()
				self:setupElementClipCounter( 1 )

				local DetectNearbyEnemiesFarRightFrame2 = function ( DetectNearbyEnemiesFarRight, event )
					local DetectNearbyEnemiesFarRightFrame3 = function ( DetectNearbyEnemiesFarRight, event )
						if not event.interrupted then
							DetectNearbyEnemiesFarRight:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Bounce )
						end
						DetectNearbyEnemiesFarRight:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( DetectNearbyEnemiesFarRight, event )
						else
							DetectNearbyEnemiesFarRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						DetectNearbyEnemiesFarRightFrame3( DetectNearbyEnemiesFarRight, event )
						return 
					else
						DetectNearbyEnemiesFarRight:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						DetectNearbyEnemiesFarRight:setAlpha( 0 )
						DetectNearbyEnemiesFarRight:registerEventHandler( "transition_complete_keyframe", DetectNearbyEnemiesFarRightFrame3 )
					end
				end
				
				DetectNearbyEnemiesFarRight:completeAnimation()
				self.DetectNearbyEnemiesFarRight:setAlpha( 0.66 )
				DetectNearbyEnemiesFarRightFrame2( DetectNearbyEnemiesFarRight, {} )
			end
		},
		EnemyDetected = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				DetectNearbyEnemiesFarRight:completeAnimation()
				self.DetectNearbyEnemiesFarRight:setAlpha( 1 )
				self.clipFinished( DetectNearbyEnemiesFarRight, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 1 )

				local DetectNearbyEnemiesFarRightFrame2 = function ( DetectNearbyEnemiesFarRight, event )
					if not event.interrupted then
						DetectNearbyEnemiesFarRight:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Bounce )
					end
					DetectNearbyEnemiesFarRight:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( DetectNearbyEnemiesFarRight, event )
					else
						DetectNearbyEnemiesFarRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DetectNearbyEnemiesFarRight:completeAnimation()
				self.DetectNearbyEnemiesFarRight:setAlpha( 1 )
				DetectNearbyEnemiesFarRightFrame2( DetectNearbyEnemiesFarRight, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "EnemyDetected",
			condition = function ( menu, element, event )
				return IsEnemyDetected( controller, "right", "far" )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.sixthsense" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.sixthsense"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

