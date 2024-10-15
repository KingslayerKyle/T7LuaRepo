CoD.T8NotificationSpinner = InheritFrom( LUI.UIElement )
CoD.T8NotificationSpinner.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.T8NotificationSpinner )
	self.id = "T8NotificationSpinner"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true

	self.image1 = LUI.UIImage.new()
	self.image1:setLeftRight( false, false, -115, 115 )
	self.image1:setTopBottom( true, false, 13, 238 )
	self.image1:setImage( RegisterImage( "ximage_8e02f7e27c64c3c" ) )
	self.image1:setScale( 0.85 )
	self.image1:setAlpha( 0 )
	self:addElement( self.image1 )

	self.mask1 = LUI.UIImage.new()
	self.mask1:setLeftRight( false, false, -115, 115 )
	self.mask1:setTopBottom( true, false, 13, 238 )
	self.mask1:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_panelcircle" ) )
	self.mask1:setRGB( 0, 0, 0 )
	self.mask1:setScale( 0.68 )
	self:addElement( self.mask1 )

	self.image2 = LUI.UIImage.new()
	self.image2:setLeftRight( false, false, -115, 115 )
	self.image2:setTopBottom( true, false, 13, 238 )
	self.image2:setImage( RegisterImage( "ximage_8e0327e27c65155" ) )
	self.image2:setScale( 0.98 )
	self.image2:setAlpha( 0 )
	self:addElement( self.image2 )

	self.image3 = LUI.UIImage.new()
	self.image3:setLeftRight( false, false, -115, 115 )
	self.image3:setTopBottom( true, false, 13, 238 )
	self.image3:setImage( RegisterImage( "ximage_21fed2761db51bb" ) )
	self.image3:setAlpha( 0 )
	self:addElement( self.image3 )

	self.image4 = LUI.UIImage.new()
	self.image4:setLeftRight( false, false, -115, 115 )
	self.image4:setTopBottom( true, false, 13, 238 )
	self.image4:setImage( RegisterImage( "ximage_21fee2761db536e" ) )
	self.image4:setAlpha( 0 )
	self:addElement( self.image4 )

	self.image5 = LUI.UIImage.new()
	self.image5:setLeftRight( false, false, -115, 115 )
	self.image5:setTopBottom( true, false, 13, 238 )
	self.image5:setImage( RegisterImage( "ximage_fb84ace6b89d894" ) )
	self.image5:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self.image5:setAlpha( 0 )
	self:addElement( self.image5 )

	self.image6 = LUI.UIImage.new()
	self.image6:setLeftRight( false, false, -115, 115 )
	self.image6:setTopBottom( true, false, 13, 238 )
	self.image6:setImage( RegisterImage( "ximage_43b58592b187aca" ) )
	self.image6:setZRot( 90 )
	self.image6:setAlpha( 0 )
	self:addElement( self.image6 )

	self.mask2 = LUI.UIImage.new()
	self.mask2:setLeftRight( false, false, -115, 115 )
	self.mask2:setTopBottom( true, false, 139, 238 )
	self.mask2:setImage( RegisterImage( "$white" ) )
	self.mask2:setRGB( 0, 0, 0 )
	self:addElement( self.mask2 )

	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				self.image1:completeAnimation()
				self.image1:setAlpha( 0 )
				self.clipFinished( self.image1, {} )

				self.image2:completeAnimation()
				self.image2:setAlpha( 0 )
				self.clipFinished( self.image2, {} )

				self.image3:completeAnimation()
				self.image3:setAlpha( 0 )
				self.clipFinished( self.image3, {} )

				self.image4:completeAnimation()
				self.image4:setAlpha( 0 )
				self.clipFinished( self.image4, {} )

				self.image5:completeAnimation()
				self.image5:setAlpha( 0 )
				self.clipFinished( self.image5, {} )

				self.image6:completeAnimation()
				self.image6:setAlpha( 0 )
				self.clipFinished( self.image6, {} )
			end,
			Powerup = function ()
				self:setupElementClipCounter( 6 )

				local PowerupAnimRotateRightFast3 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
				
					element:setAlpha( 0 )
				
					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				local PowerupAnimRotateRightFast2 = function ( element, event )
					if event.interrupted then
						PowerupAnimRotateRightFast3( element, event )
				
						return 
					else
						element:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
				
						element:setZRot( -90 )
				
						element:registerEventHandler( "transition_complete_keyframe", PowerupAnimRotateRightFast3 )
					end
				end
				
				local PowerupAnimRotateRightFast1 = function ( element, event )
					if event.interrupted then
						PowerupAnimRotateRightFast2( element, event )
				
						return 
					else
						element:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
				
						element:setAlpha( 1 )
				
						element:registerEventHandler( "transition_complete_keyframe", PowerupAnimRotateRightFast2 )
					end
				end
				
				self.image6:completeAnimation()
				self.image6:setAlpha( 0 )
				self.image6:setZRot( 90 )
				PowerupAnimRotateRightFast1( self.image6, {} )

				local PowerupAnimRotateRight3 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
				
					element:setAlpha( 0 )
				
					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				local PowerupAnimRotateRight2 = function ( element, event )
					if event.interrupted then
						PowerupAnimRotateRight3( element, event )
				
						return 
					else
						element:beginAnimation( "keyframe", 3000, false, false, CoD.TweenType.Linear )
				
						element:setZRot( -90 )
				
						element:registerEventHandler( "transition_complete_keyframe", PowerupAnimRotateRight3 )
					end
				end
				
				local PowerupAnimRotateRight1 = function ( element, event )
					if event.interrupted then
						PowerupAnimRotateRight2( element, event )
				
						return 
					else
						element:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
				
						element:setAlpha( 1 )
				
						element:registerEventHandler( "transition_complete_keyframe", PowerupAnimRotateRight2 )
					end
				end

				self.image2:completeAnimation()
				self.image2:setAlpha( 0 )
				self.image2:setZRot( 0 )
				PowerupAnimRotateRight1( self.image2, {} )
	
				self.image3:completeAnimation()
				self.image3:setAlpha( 0 )
				self.image3:setZRot( 0 )
				PowerupAnimRotateRight1( self.image3, {} )

				local PowerupAnimRotateLeft3 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
				
					element:setAlpha( 0 )
				
					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				local PowerupAnimRotateLeft2 = function ( element, event )
					if event.interrupted then
						PowerupAnimRotateLeft3( element, event )
				
						return 
					else
						element:beginAnimation( "keyframe", 3000, false, false, CoD.TweenType.Linear )
				
						element:setZRot( 90 )
				
						element:registerEventHandler( "transition_complete_keyframe", PowerupAnimRotateLeft3 )
					end
				end
				
				local PowerupAnimRotateLeft1 = function ( element, event )
					if event.interrupted then
						PowerupAnimRotateLeft2( element, event )
				
						return 
					else
						element:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
				
						element:setAlpha( 1 )
				
						element:registerEventHandler( "transition_complete_keyframe", PowerupAnimRotateLeft2 )
					end
				end

				self.image1:completeAnimation()
				self.image1:setAlpha( 0 )
				self.image1:setZRot( 0 )
				PowerupAnimRotateLeft1( self.image1, {} )

				self.image4:completeAnimation()
				self.image4:setAlpha( 0 )
				self.image4:setZRot( 0 )
				PowerupAnimRotateLeft1( self.image4, {} )

				local PowerupAnim3 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
	
					element:setAlpha( 0 )
	
					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end

				local PowerupAnim2 = function ( element, event )
					if event.interrupted then
						PowerupAnim3( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 3000, false, false, CoD.TweenType.Linear )

						element:setAlpha( 1 )

						element:registerEventHandler( "transition_complete_keyframe", PowerupAnim3 )
					end
				end

				local PowerupAnim1 = function ( element, event )
					if event.interrupted then
						PowerupAnim2( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )

						element:setAlpha( 1 )

						element:registerEventHandler( "transition_complete_keyframe", PowerupAnim2 )
					end
				end

				self.image5:completeAnimation()
				self.image5:setAlpha( 0 )
				PowerupAnim1( self.image5, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.image1:close()
		element.mask1:close()
		element.image2:close()
		element.image3:close()
		element.image4:close()
		element.image5:close()
		element.image6:close()
		element.mask2:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
