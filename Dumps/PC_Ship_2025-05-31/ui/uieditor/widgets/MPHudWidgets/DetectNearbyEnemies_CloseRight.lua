CoD.DetectNearbyEnemies_CloseRight = InheritFrom( LUI.UIElement )
CoD.DetectNearbyEnemies_CloseRight.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.DetectNearbyEnemies_CloseRight )
	self.id = "DetectNearbyEnemies_CloseRight"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 112 )
	self:setTopBottom( true, false, 0, 160 )
	
	local DetectNearbyEnemiesCloseRight = LUI.UIImage.new()
	DetectNearbyEnemiesCloseRight:setLeftRight( true, true, 0, 0 )
	DetectNearbyEnemiesCloseRight:setTopBottom( true, true, 0, 0 )
	DetectNearbyEnemiesCloseRight:setYRot( -180 )
	DetectNearbyEnemiesCloseRight:setImage( RegisterImage( "uie_t7_mp_hud_perkwidget_6sense_sideinner" ) )
	DetectNearbyEnemiesCloseRight:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( DetectNearbyEnemiesCloseRight )
	self.DetectNearbyEnemiesCloseRight = DetectNearbyEnemiesCloseRight
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				DetectNearbyEnemiesCloseRight:completeAnimation()
				self.DetectNearbyEnemiesCloseRight:setAlpha( 0 )
				self.clipFinished( DetectNearbyEnemiesCloseRight, {} )
			end,
			EnemyDetected = function ()
				self:setupElementClipCounter( 1 )
				local DetectNearbyEnemiesCloseRightFrame2 = function ( DetectNearbyEnemiesCloseRight, event )
					local DetectNearbyEnemiesCloseRightFrame3 = function ( DetectNearbyEnemiesCloseRight, event )
						if not event.interrupted then
							DetectNearbyEnemiesCloseRight:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Bounce )
						end
						DetectNearbyEnemiesCloseRight:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( DetectNearbyEnemiesCloseRight, event )
						else
							DetectNearbyEnemiesCloseRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						DetectNearbyEnemiesCloseRightFrame3( DetectNearbyEnemiesCloseRight, event )
						return 
					else
						DetectNearbyEnemiesCloseRight:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						DetectNearbyEnemiesCloseRight:setAlpha( 0 )
						DetectNearbyEnemiesCloseRight:registerEventHandler( "transition_complete_keyframe", DetectNearbyEnemiesCloseRightFrame3 )
					end
				end
				
				DetectNearbyEnemiesCloseRight:completeAnimation()
				self.DetectNearbyEnemiesCloseRight:setAlpha( 0.66 )
				DetectNearbyEnemiesCloseRightFrame2( DetectNearbyEnemiesCloseRight, {} )
			end
		},
		EnemyDetected = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				DetectNearbyEnemiesCloseRight:completeAnimation()
				self.DetectNearbyEnemiesCloseRight:setAlpha( 1 )
				self.clipFinished( DetectNearbyEnemiesCloseRight, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 1 )
				local DetectNearbyEnemiesCloseRightFrame2 = function ( DetectNearbyEnemiesCloseRight, event )
					if not event.interrupted then
						DetectNearbyEnemiesCloseRight:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Bounce )
					end
					DetectNearbyEnemiesCloseRight:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( DetectNearbyEnemiesCloseRight, event )
					else
						DetectNearbyEnemiesCloseRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DetectNearbyEnemiesCloseRight:completeAnimation()
				self.DetectNearbyEnemiesCloseRight:setAlpha( 1 )
				DetectNearbyEnemiesCloseRightFrame2( DetectNearbyEnemiesCloseRight, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "EnemyDetected",
			condition = function ( menu, element, event )
				return IsEnemyDetected( controller, "right", "close" )
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

