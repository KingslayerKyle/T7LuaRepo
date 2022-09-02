-- a38b40569bb8418b0e83d88b9b7d4746
-- This hash is used for caching, delete to decompile the file again

CoD.DetectNearbyEnemies_CloseBack = InheritFrom( LUI.UIElement )
CoD.DetectNearbyEnemies_CloseBack.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.DetectNearbyEnemies_CloseBack )
	self.id = "DetectNearbyEnemies_CloseBack"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 248 )
	self:setTopBottom( true, false, 0, 80 )
	
	local DetectNearbyEnemiesCloseBack = LUI.UIImage.new()
	DetectNearbyEnemiesCloseBack:setLeftRight( true, true, 0, 0 )
	DetectNearbyEnemiesCloseBack:setTopBottom( true, true, 0, 0 )
	DetectNearbyEnemiesCloseBack:setXRot( -180 )
	DetectNearbyEnemiesCloseBack:setImage( RegisterImage( "uie_t7_mp_hud_perkwidget_6sense_topinner" ) )
	DetectNearbyEnemiesCloseBack:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( DetectNearbyEnemiesCloseBack )
	self.DetectNearbyEnemiesCloseBack = DetectNearbyEnemiesCloseBack
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				DetectNearbyEnemiesCloseBack:completeAnimation()
				self.DetectNearbyEnemiesCloseBack:setAlpha( 0 )
				self.clipFinished( DetectNearbyEnemiesCloseBack, {} )
			end,
			EnemyDetected = function ()
				self:setupElementClipCounter( 1 )

				local DetectNearbyEnemiesCloseBackFrame2 = function ( DetectNearbyEnemiesCloseBack, event )
					local DetectNearbyEnemiesCloseBackFrame3 = function ( DetectNearbyEnemiesCloseBack, event )
						if not event.interrupted then
							DetectNearbyEnemiesCloseBack:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Bounce )
						end
						DetectNearbyEnemiesCloseBack:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( DetectNearbyEnemiesCloseBack, event )
						else
							DetectNearbyEnemiesCloseBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						DetectNearbyEnemiesCloseBackFrame3( DetectNearbyEnemiesCloseBack, event )
						return 
					else
						DetectNearbyEnemiesCloseBack:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						DetectNearbyEnemiesCloseBack:setAlpha( 0 )
						DetectNearbyEnemiesCloseBack:registerEventHandler( "transition_complete_keyframe", DetectNearbyEnemiesCloseBackFrame3 )
					end
				end
				
				DetectNearbyEnemiesCloseBack:completeAnimation()
				self.DetectNearbyEnemiesCloseBack:setAlpha( 0.66 )
				DetectNearbyEnemiesCloseBackFrame2( DetectNearbyEnemiesCloseBack, {} )
			end
		},
		EnemyDetected = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				DetectNearbyEnemiesCloseBack:completeAnimation()
				self.DetectNearbyEnemiesCloseBack:setAlpha( 1 )
				self.clipFinished( DetectNearbyEnemiesCloseBack, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 1 )

				local DetectNearbyEnemiesCloseBackFrame2 = function ( DetectNearbyEnemiesCloseBack, event )
					if not event.interrupted then
						DetectNearbyEnemiesCloseBack:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Bounce )
					end
					DetectNearbyEnemiesCloseBack:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( DetectNearbyEnemiesCloseBack, event )
					else
						DetectNearbyEnemiesCloseBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DetectNearbyEnemiesCloseBack:completeAnimation()
				self.DetectNearbyEnemiesCloseBack:setAlpha( 1 )
				DetectNearbyEnemiesCloseBackFrame2( DetectNearbyEnemiesCloseBack, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "EnemyDetected",
			condition = function ( menu, element, event )
				return IsEnemyDetected( controller, "back", "close" )
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

