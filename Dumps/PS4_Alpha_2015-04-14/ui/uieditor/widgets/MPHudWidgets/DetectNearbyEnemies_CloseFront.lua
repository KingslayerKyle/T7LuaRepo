CoD.DetectNearbyEnemies_CloseFront = InheritFrom( LUI.UIElement )
CoD.DetectNearbyEnemies_CloseFront.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.DetectNearbyEnemies_CloseFront )
	self.id = "DetectNearbyEnemies_CloseFront"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 248 )
	self:setTopBottom( true, false, 0, 80 )
	
	local DetectNearbyEnemiesCloseFront = LUI.UIImage.new()
	DetectNearbyEnemiesCloseFront:setLeftRight( true, true, 0, 0 )
	DetectNearbyEnemiesCloseFront:setTopBottom( true, true, 0, 0 )
	DetectNearbyEnemiesCloseFront:setRGB( 1, 1, 1 )
	DetectNearbyEnemiesCloseFront:setImage( RegisterImage( "uie_t7_mp_hud_perkwidget_6sense_topinner" ) )
	DetectNearbyEnemiesCloseFront:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( DetectNearbyEnemiesCloseFront )
	self.DetectNearbyEnemiesCloseFront = DetectNearbyEnemiesCloseFront
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				DetectNearbyEnemiesCloseFront:completeAnimation()
				self.DetectNearbyEnemiesCloseFront:setAlpha( 0 )
				self.clipFinished( DetectNearbyEnemiesCloseFront, {} )
			end,
			EnemyDetected = function ()
				self:setupElementClipCounter( 1 )
				local DetectNearbyEnemiesCloseFrontFrame2 = function ( DetectNearbyEnemiesCloseFront, event )
					local DetectNearbyEnemiesCloseFrontFrame3 = function ( DetectNearbyEnemiesCloseFront, event )
						if not event.interrupted then
							DetectNearbyEnemiesCloseFront:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Bounce )
						end
						DetectNearbyEnemiesCloseFront:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( DetectNearbyEnemiesCloseFront, event )
						else
							DetectNearbyEnemiesCloseFront:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						DetectNearbyEnemiesCloseFrontFrame3( DetectNearbyEnemiesCloseFront, event )
						return 
					else
						DetectNearbyEnemiesCloseFront:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						DetectNearbyEnemiesCloseFront:setAlpha( 0 )
						DetectNearbyEnemiesCloseFront:registerEventHandler( "transition_complete_keyframe", DetectNearbyEnemiesCloseFrontFrame3 )
					end
				end
				
				DetectNearbyEnemiesCloseFront:completeAnimation()
				self.DetectNearbyEnemiesCloseFront:setAlpha( 0.66 )
				DetectNearbyEnemiesCloseFrontFrame2( DetectNearbyEnemiesCloseFront, {} )
			end
		},
		EnemyDetected = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				DetectNearbyEnemiesCloseFront:completeAnimation()
				self.DetectNearbyEnemiesCloseFront:setAlpha( 1 )
				self.clipFinished( DetectNearbyEnemiesCloseFront, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 1 )
				local DetectNearbyEnemiesCloseFrontFrame2 = function ( DetectNearbyEnemiesCloseFront, event )
					if not event.interrupted then
						DetectNearbyEnemiesCloseFront:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Bounce )
					end
					DetectNearbyEnemiesCloseFront:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( DetectNearbyEnemiesCloseFront, event )
					else
						DetectNearbyEnemiesCloseFront:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DetectNearbyEnemiesCloseFront:completeAnimation()
				self.DetectNearbyEnemiesCloseFront:setAlpha( 1 )
				DetectNearbyEnemiesCloseFrontFrame2( DetectNearbyEnemiesCloseFront, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "EnemyDetected",
			condition = function ( menu, element, event )
				return IsEnemyDetected( controller, "front", "close" )
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

