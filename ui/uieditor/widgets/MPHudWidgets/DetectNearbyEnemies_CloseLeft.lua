-- d92cdaa83a8641d1e8be69953bb7e980
-- This hash is used for caching, delete to decompile the file again

CoD.DetectNearbyEnemies_CloseLeft = InheritFrom( LUI.UIElement )
CoD.DetectNearbyEnemies_CloseLeft.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.DetectNearbyEnemies_CloseLeft )
	self.id = "DetectNearbyEnemies_CloseLeft"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 112 )
	self:setTopBottom( true, false, 0, 160 )
	
	local DetectNearbyEnemiesCloseLeft = LUI.UIImage.new()
	DetectNearbyEnemiesCloseLeft:setLeftRight( true, true, 0, 0 )
	DetectNearbyEnemiesCloseLeft:setTopBottom( true, true, 0, 0 )
	DetectNearbyEnemiesCloseLeft:setImage( RegisterImage( "uie_t7_mp_hud_perkwidget_6sense_sideinner" ) )
	DetectNearbyEnemiesCloseLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( DetectNearbyEnemiesCloseLeft )
	self.DetectNearbyEnemiesCloseLeft = DetectNearbyEnemiesCloseLeft
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				DetectNearbyEnemiesCloseLeft:completeAnimation()
				self.DetectNearbyEnemiesCloseLeft:setAlpha( 0 )
				self.clipFinished( DetectNearbyEnemiesCloseLeft, {} )
			end,
			EnemyDetected = function ()
				self:setupElementClipCounter( 1 )

				local DetectNearbyEnemiesCloseLeftFrame2 = function ( DetectNearbyEnemiesCloseLeft, event )
					local DetectNearbyEnemiesCloseLeftFrame3 = function ( DetectNearbyEnemiesCloseLeft, event )
						if not event.interrupted then
							DetectNearbyEnemiesCloseLeft:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Bounce )
						end
						DetectNearbyEnemiesCloseLeft:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( DetectNearbyEnemiesCloseLeft, event )
						else
							DetectNearbyEnemiesCloseLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						DetectNearbyEnemiesCloseLeftFrame3( DetectNearbyEnemiesCloseLeft, event )
						return 
					else
						DetectNearbyEnemiesCloseLeft:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						DetectNearbyEnemiesCloseLeft:setAlpha( 0 )
						DetectNearbyEnemiesCloseLeft:registerEventHandler( "transition_complete_keyframe", DetectNearbyEnemiesCloseLeftFrame3 )
					end
				end
				
				DetectNearbyEnemiesCloseLeft:completeAnimation()
				self.DetectNearbyEnemiesCloseLeft:setAlpha( 0.66 )
				DetectNearbyEnemiesCloseLeftFrame2( DetectNearbyEnemiesCloseLeft, {} )
			end
		},
		EnemyDetected = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				DetectNearbyEnemiesCloseLeft:completeAnimation()
				self.DetectNearbyEnemiesCloseLeft:setAlpha( 1 )
				self.clipFinished( DetectNearbyEnemiesCloseLeft, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 1 )

				local DetectNearbyEnemiesCloseLeftFrame2 = function ( DetectNearbyEnemiesCloseLeft, event )
					if not event.interrupted then
						DetectNearbyEnemiesCloseLeft:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Bounce )
					end
					DetectNearbyEnemiesCloseLeft:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( DetectNearbyEnemiesCloseLeft, event )
					else
						DetectNearbyEnemiesCloseLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DetectNearbyEnemiesCloseLeft:completeAnimation()
				self.DetectNearbyEnemiesCloseLeft:setAlpha( 1 )
				DetectNearbyEnemiesCloseLeftFrame2( DetectNearbyEnemiesCloseLeft, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "EnemyDetected",
			condition = function ( menu, element, event )
				return IsEnemyDetected( controller, "left", "close" )
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

