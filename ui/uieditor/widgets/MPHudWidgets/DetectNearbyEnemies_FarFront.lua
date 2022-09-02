-- 02a5861a9768fc2bb41c1e241387080a
-- This hash is used for caching, delete to decompile the file again

CoD.DetectNearbyEnemies_FarFront = InheritFrom( LUI.UIElement )
CoD.DetectNearbyEnemies_FarFront.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.DetectNearbyEnemies_FarFront )
	self.id = "DetectNearbyEnemies_FarFront"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 256 )
	self:setTopBottom( true, false, 0, 16 )
	
	local DetectNearbyEnemiesFarFront = LUI.UIImage.new()
	DetectNearbyEnemiesFarFront:setLeftRight( true, true, 0, 0 )
	DetectNearbyEnemiesFarFront:setTopBottom( true, true, 0, 0 )
	DetectNearbyEnemiesFarFront:setImage( RegisterImage( "uie_t7_mp_hud_perkwidget_6sense_topoutter" ) )
	DetectNearbyEnemiesFarFront:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( DetectNearbyEnemiesFarFront )
	self.DetectNearbyEnemiesFarFront = DetectNearbyEnemiesFarFront
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				DetectNearbyEnemiesFarFront:completeAnimation()
				self.DetectNearbyEnemiesFarFront:setAlpha( 0 )
				self.clipFinished( DetectNearbyEnemiesFarFront, {} )
			end,
			EnemyDetected = function ()
				self:setupElementClipCounter( 1 )

				local DetectNearbyEnemiesFarFrontFrame2 = function ( DetectNearbyEnemiesFarFront, event )
					local DetectNearbyEnemiesFarFrontFrame3 = function ( DetectNearbyEnemiesFarFront, event )
						if not event.interrupted then
							DetectNearbyEnemiesFarFront:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Bounce )
						end
						DetectNearbyEnemiesFarFront:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( DetectNearbyEnemiesFarFront, event )
						else
							DetectNearbyEnemiesFarFront:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						DetectNearbyEnemiesFarFrontFrame3( DetectNearbyEnemiesFarFront, event )
						return 
					else
						DetectNearbyEnemiesFarFront:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						DetectNearbyEnemiesFarFront:setAlpha( 0 )
						DetectNearbyEnemiesFarFront:registerEventHandler( "transition_complete_keyframe", DetectNearbyEnemiesFarFrontFrame3 )
					end
				end
				
				DetectNearbyEnemiesFarFront:completeAnimation()
				self.DetectNearbyEnemiesFarFront:setAlpha( 0.66 )
				DetectNearbyEnemiesFarFrontFrame2( DetectNearbyEnemiesFarFront, {} )
			end
		},
		EnemyDetected = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				DetectNearbyEnemiesFarFront:completeAnimation()
				self.DetectNearbyEnemiesFarFront:setAlpha( 1 )
				self.clipFinished( DetectNearbyEnemiesFarFront, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 1 )

				local DetectNearbyEnemiesFarFrontFrame2 = function ( DetectNearbyEnemiesFarFront, event )
					if not event.interrupted then
						DetectNearbyEnemiesFarFront:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Bounce )
					end
					DetectNearbyEnemiesFarFront:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( DetectNearbyEnemiesFarFront, event )
					else
						DetectNearbyEnemiesFarFront:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DetectNearbyEnemiesFarFront:completeAnimation()
				self.DetectNearbyEnemiesFarFront:setAlpha( 1 )
				DetectNearbyEnemiesFarFrontFrame2( DetectNearbyEnemiesFarFront, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "EnemyDetected",
			condition = function ( menu, element, event )
				return IsEnemyDetected( controller, "front", "far" )
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

