-- a0db7ceea723028438a4b618c86b2a17
-- This hash is used for caching, delete to decompile the file again

CoD.DetectNearbyEnemies_FarBack = InheritFrom( LUI.UIElement )
CoD.DetectNearbyEnemies_FarBack.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.DetectNearbyEnemies_FarBack )
	self.id = "DetectNearbyEnemies_FarBack"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 256 )
	self:setTopBottom( true, false, 0, 16 )
	
	local DetectNearbyEnemiesFarBack = LUI.UIImage.new()
	DetectNearbyEnemiesFarBack:setLeftRight( true, true, 0, 0 )
	DetectNearbyEnemiesFarBack:setTopBottom( true, true, 0, 0 )
	DetectNearbyEnemiesFarBack:setXRot( -180 )
	DetectNearbyEnemiesFarBack:setImage( RegisterImage( "uie_t7_mp_hud_perkwidget_6sense_topoutter" ) )
	DetectNearbyEnemiesFarBack:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( DetectNearbyEnemiesFarBack )
	self.DetectNearbyEnemiesFarBack = DetectNearbyEnemiesFarBack
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				DetectNearbyEnemiesFarBack:completeAnimation()
				self.DetectNearbyEnemiesFarBack:setAlpha( 0 )
				self.clipFinished( DetectNearbyEnemiesFarBack, {} )
			end,
			EnemyDetected = function ()
				self:setupElementClipCounter( 1 )
				local DetectNearbyEnemiesFarBackFrame2 = function ( DetectNearbyEnemiesFarBack, event )
					local DetectNearbyEnemiesFarBackFrame3 = function ( DetectNearbyEnemiesFarBack, event )
						if not event.interrupted then
							DetectNearbyEnemiesFarBack:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Bounce )
						end
						DetectNearbyEnemiesFarBack:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( DetectNearbyEnemiesFarBack, event )
						else
							DetectNearbyEnemiesFarBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						DetectNearbyEnemiesFarBackFrame3( DetectNearbyEnemiesFarBack, event )
						return 
					else
						DetectNearbyEnemiesFarBack:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						DetectNearbyEnemiesFarBack:setAlpha( 0 )
						DetectNearbyEnemiesFarBack:registerEventHandler( "transition_complete_keyframe", DetectNearbyEnemiesFarBackFrame3 )
					end
				end
				
				DetectNearbyEnemiesFarBack:completeAnimation()
				self.DetectNearbyEnemiesFarBack:setAlpha( 0.66 )
				DetectNearbyEnemiesFarBackFrame2( DetectNearbyEnemiesFarBack, {} )
			end
		},
		EnemyDetected = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				DetectNearbyEnemiesFarBack:completeAnimation()
				self.DetectNearbyEnemiesFarBack:setAlpha( 1 )
				self.clipFinished( DetectNearbyEnemiesFarBack, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 1 )
				local DetectNearbyEnemiesFarBackFrame2 = function ( DetectNearbyEnemiesFarBack, event )
					if not event.interrupted then
						DetectNearbyEnemiesFarBack:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Bounce )
					end
					DetectNearbyEnemiesFarBack:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( DetectNearbyEnemiesFarBack, event )
					else
						DetectNearbyEnemiesFarBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DetectNearbyEnemiesFarBack:completeAnimation()
				self.DetectNearbyEnemiesFarBack:setAlpha( 1 )
				DetectNearbyEnemiesFarBackFrame2( DetectNearbyEnemiesFarBack, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "EnemyDetected",
			condition = function ( menu, element, event )
				return IsEnemyDetected( controller, "back", "far" )
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

