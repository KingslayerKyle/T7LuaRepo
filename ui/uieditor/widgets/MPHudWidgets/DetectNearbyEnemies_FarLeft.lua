-- 5ca77f4b1cc7d9009f8ce022ae3cac3a
-- This hash is used for caching, delete to decompile the file again

CoD.DetectNearbyEnemies_FarLeft = InheritFrom( LUI.UIElement )
CoD.DetectNearbyEnemies_FarLeft.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.DetectNearbyEnemies_FarLeft )
	self.id = "DetectNearbyEnemies_FarLeft"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 16 )
	self:setTopBottom( true, false, 0, 176 )
	
	local DetectNearbyEnemiesFarLeft = LUI.UIImage.new()
	DetectNearbyEnemiesFarLeft:setLeftRight( true, true, 0, 0 )
	DetectNearbyEnemiesFarLeft:setTopBottom( true, true, 0, 0 )
	DetectNearbyEnemiesFarLeft:setXRot( -180 )
	DetectNearbyEnemiesFarLeft:setImage( RegisterImage( "uie_t7_mp_hud_perkwidget_6sense_sideoutter" ) )
	DetectNearbyEnemiesFarLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( DetectNearbyEnemiesFarLeft )
	self.DetectNearbyEnemiesFarLeft = DetectNearbyEnemiesFarLeft
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				DetectNearbyEnemiesFarLeft:completeAnimation()
				self.DetectNearbyEnemiesFarLeft:setAlpha( 0 )
				self.clipFinished( DetectNearbyEnemiesFarLeft, {} )
			end,
			EnemyDetected = function ()
				self:setupElementClipCounter( 1 )

				local DetectNearbyEnemiesFarLeftFrame2 = function ( DetectNearbyEnemiesFarLeft, event )
					local DetectNearbyEnemiesFarLeftFrame3 = function ( DetectNearbyEnemiesFarLeft, event )
						if not event.interrupted then
							DetectNearbyEnemiesFarLeft:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Bounce )
						end
						DetectNearbyEnemiesFarLeft:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( DetectNearbyEnemiesFarLeft, event )
						else
							DetectNearbyEnemiesFarLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						DetectNearbyEnemiesFarLeftFrame3( DetectNearbyEnemiesFarLeft, event )
						return 
					else
						DetectNearbyEnemiesFarLeft:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						DetectNearbyEnemiesFarLeft:setAlpha( 0 )
						DetectNearbyEnemiesFarLeft:registerEventHandler( "transition_complete_keyframe", DetectNearbyEnemiesFarLeftFrame3 )
					end
				end
				
				DetectNearbyEnemiesFarLeft:completeAnimation()
				self.DetectNearbyEnemiesFarLeft:setAlpha( 0.66 )
				DetectNearbyEnemiesFarLeftFrame2( DetectNearbyEnemiesFarLeft, {} )
			end
		},
		EnemyDetected = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				DetectNearbyEnemiesFarLeft:completeAnimation()
				self.DetectNearbyEnemiesFarLeft:setAlpha( 1 )
				self.clipFinished( DetectNearbyEnemiesFarLeft, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 1 )

				local DetectNearbyEnemiesFarLeftFrame2 = function ( DetectNearbyEnemiesFarLeft, event )
					if not event.interrupted then
						DetectNearbyEnemiesFarLeft:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Bounce )
					end
					DetectNearbyEnemiesFarLeft:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( DetectNearbyEnemiesFarLeft, event )
					else
						DetectNearbyEnemiesFarLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DetectNearbyEnemiesFarLeft:completeAnimation()
				self.DetectNearbyEnemiesFarLeft:setAlpha( 1 )
				DetectNearbyEnemiesFarLeftFrame2( DetectNearbyEnemiesFarLeft, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "EnemyDetected",
			condition = function ( menu, element, event )
				return IsEnemyDetected( controller, "left", "far" )
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
