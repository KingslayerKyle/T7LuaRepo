CoD.CSGOAmmoCounter = InheritFrom( LUI.UIElement )
CoD.CSGOAmmoCounter.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CSGOAmmoCounter )
	self.id = "CSGOAmmoCounter"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true

	self.FirstBullet = LUI.UIImage.new()
	self.FirstBullet:setLeftRight( false, true, -58.5 - 6, -50.5 - 6 )
	self.FirstBullet:setTopBottom( false, true, -20, -10 )
	self.FirstBullet:setImage( RegisterImage( "csgo_bullet" ) )
	self:addElement( self.FirstBullet )

	self.FirstBulletMask = LUI.UIImage.new()
	self.FirstBulletMask:setLeftRight( false, true, -58.5 - 6, -50.5 - 6 )
	self.FirstBulletMask:setTopBottom( false, true, -20, -10 )
	self.FirstBulletMask:setImage( RegisterImage( "csgo_bullet_mask" ) )
	self:addElement( self.FirstBulletMask )

	self.Bullet1 = LUI.UIImage.new()
	self.Bullet1:setLeftRight( false, true, -58.5, -50.5 )
	self.Bullet1:setTopBottom( false, true, -20, -10 )
	self.Bullet1:setImage( RegisterImage( "csgo_bullet" ) )
	self:addElement( self.Bullet1 )

	self.Bullet2 = LUI.UIImage.new()
	self.Bullet2:setLeftRight( false, true, -58.5 + 6, -50.5 + 6 )
	self.Bullet2:setTopBottom( false, true, -20, -10 )
	self.Bullet2:setImage( RegisterImage( "csgo_bullet" ) )
	self:addElement( self.Bullet2 )

	self.Bullet3 = LUI.UIImage.new()
	self.Bullet3:setLeftRight( false, true, -58.5 + 6 + 6, -50.5 + 6 + 6 )
	self.Bullet3:setTopBottom( false, true, -20, -10 )
	self.Bullet3:setImage( RegisterImage( "csgo_bullet" ) )
	self:addElement( self.Bullet3 )

	self.Bullet4 = LUI.UIImage.new()
	self.Bullet4:setLeftRight( false, true, -58.5 + 6 + 6 + 6, -50.5 + 6 + 6 + 6 )
	self.Bullet4:setTopBottom( false, true, -20, -10 )
	self.Bullet4:setImage( RegisterImage( "csgo_bullet" ) )
	self:addElement( self.Bullet4 )

	self.Bullet5 = LUI.UIImage.new()
	self.Bullet5:setLeftRight( false, true, -58.5 + 6 + 6 + 6 + 6, -50.5 + 6 + 6 + 6 + 6 )
	self.Bullet5:setTopBottom( false, true, -20, -10 )
	self.Bullet5:setImage( RegisterImage( "csgo_bullet" ) )
	self:addElement( self.Bullet5 )

	self.LastBullet = LUI.UIImage.new()
	self.LastBullet:setLeftRight( false, true, -58.5 + 6 + 6 + 6 + 6 + 6, -50.5 + 6 + 6 + 6 + 6 + 6 )
	self.LastBullet:setTopBottom( false, true, -20, -10 )
	self.LastBullet:setImage( RegisterImage( "csgo_bullet" ) )
	self:addElement( self.LastBullet )

	self.LastBulletMask = LUI.UIImage.new()
	self.LastBulletMask:setLeftRight( false, true, -58.5 + 6 + 6 + 6 + 6 + 6, -50.5 + 6 + 6 + 6 + 6 + 6 )
	self.LastBulletMask:setTopBottom( false, true, -20, -10 )
	self.LastBulletMask:setImage( RegisterImage( "csgo_bullet_mask" ) )
	self:addElement( self.LastBulletMask )

	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Update = function ()
				self:setupElementClipCounter( 1 )

				local LastBulletFiredAnimStage2 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 0, false, false, CoD.TweenType.Linear )
					end
				
					element:setLeftRight( false, true, -58.5 + 6 + 6 + 6 + 6 + 6, -50.5 + 6 + 6 + 6 + 6 + 6 )
					element:setTopBottom( false, true, -20, -10 )
				
					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end

				local LastBulletFiredAnimStage1 = function ( element, event )
					if event.interrupted then
						LastBulletFiredAnimStage2( element, event )
				
						return 
					else
						element:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )

						element:setLeftRight( false, true, -58.5 + 6 + 6 + 6 + 6 + 6 + 25, -50.5 + 6 + 6 + 6 + 6 + 6 + 25 )
						element:setTopBottom( false, true, -20 + 8, -10 + 8 )
						
						element:registerEventHandler( "transition_complete_keyframe", LastBulletFiredAnimStage2 )
					end
				end
				
				self.LastBullet:completeAnimation()
				self.LastBullet:setLeftRight( false, true, -58.5 + 6 + 6 + 6 + 6 + 6, -50.5 + 6 + 6 + 6 + 6 + 6 )
				self.LastBullet:setTopBottom( false, true, -20, -10 )
				LastBulletFiredAnimStage1( self.LastBullet, {} )

				local Bullet5FiredAnimStage2 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 0, false, false, CoD.TweenType.Linear )
					end
				
					element:setLeftRight( false, true, -58.5 + 6 + 6 + 6 + 6, -50.5 + 6 + 6 + 6 + 6 )
				
					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				local Bullet5FiredAnimStage1 = function ( element, event )
					if event.interrupted then
						Bullet5FiredAnimStage2( element, event )
				
						return 
					else
						element:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
				
						element:setLeftRight( false, true, -58.5 + 6 + 6 + 6 + 6 + 6, -50.5 + 6 + 6 + 6 + 6 + 6 )
						
						element:registerEventHandler( "transition_complete_keyframe", Bullet5FiredAnimStage2 )
					end
				end
				
				self.Bullet5:completeAnimation()
				self.Bullet5:setLeftRight( false, true, -58.5 + 6 + 6 + 6 + 6, -50.5 + 6 + 6 + 6 + 6 )
				Bullet5FiredAnimStage1( self.Bullet5, {} )

				local Bullet4FiredAnimStage2 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 0, false, false, CoD.TweenType.Linear )
					end
				
					element:setLeftRight( false, true, -58.5 + 6 + 6 + 6, -50.5 + 6 + 6 + 6 )
				
					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				local Bullet4FiredAnimStage1 = function ( element, event )
					if event.interrupted then
						Bullet4FiredAnimStage2( element, event )
				
						return 
					else
						element:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
				
						element:setLeftRight( false, true, -58.5 + 6 + 6 + 6 + 6, -50.5 + 6 + 6 + 6 + 6 )
						
						element:registerEventHandler( "transition_complete_keyframe", Bullet4FiredAnimStage2 )
					end
				end
				
				self.Bullet4:completeAnimation()
				self.Bullet4:setLeftRight( false, true, -58.5 + 6 + 6 + 6, -50.5 + 6 + 6 + 6 )
				Bullet4FiredAnimStage1( self.Bullet4, {} )

				local Bullet3FiredAnimStage2 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 0, false, false, CoD.TweenType.Linear )
					end
				
					element:setLeftRight( false, true, -58.5 + 6 + 6, -50.5 + 6 + 6 )
				
					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				local Bullet3FiredAnimStage1 = function ( element, event )
					if event.interrupted then
						Bullet3FiredAnimStage2( element, event )
				
						return 
					else
						element:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
				
						element:setLeftRight( false, true, -58.5 + 6 + 6 + 6, -50.5 + 6 + 6 + 6 )
						
						element:registerEventHandler( "transition_complete_keyframe", Bullet3FiredAnimStage2 )
					end
				end
				
				self.Bullet3:completeAnimation()
				self.Bullet3:setLeftRight( false, true, -58.5 + 6 + 6, -50.5 + 6 + 6 )
				Bullet3FiredAnimStage1( self.Bullet3, {} )

				local Bullet2FiredAnimStage2 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 0, false, false, CoD.TweenType.Linear )
					end
				
					element:setLeftRight( false, true, -58.5 + 6, -50.5 + 6 )
				
					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				local Bullet2FiredAnimStage1 = function ( element, event )
					if event.interrupted then
						Bullet2FiredAnimStage2( element, event )
				
						return 
					else
						element:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
				
						element:setLeftRight( false, true, -58.5 + 6 + 6, -50.5 + 6 + 6 )
						
						element:registerEventHandler( "transition_complete_keyframe", Bullet2FiredAnimStage2 )
					end
				end
				
				self.Bullet2:completeAnimation()
				self.Bullet2:setLeftRight( false, true, -58.5 + 6, -50.5 + 6 )
				Bullet2FiredAnimStage1( self.Bullet2, {} )

				local Bullet1FiredAnimStage2 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 0, false, false, CoD.TweenType.Linear )
					end
				
					element:setLeftRight( false, true, -58.5, -50.5 )
				
					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				local Bullet1FiredAnimStage1 = function ( element, event )
					if event.interrupted then
						Bullet1FiredAnimStage2( element, event )
				
						return 
					else
						element:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
				
						element:setLeftRight( false, true, -58.5 + 6, -50.5 + 6 )
						
						element:registerEventHandler( "transition_complete_keyframe", Bullet1FiredAnimStage2 )
					end
				end
				
				self.Bullet1:completeAnimation()
				self.Bullet1:setLeftRight( false, true, -58.5, -50.5 )
				Bullet1FiredAnimStage1( self.Bullet1, {} )

				local FirstBulletFiredAnimStage2 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 0, false, false, CoD.TweenType.Linear )
					end

					element:setLeftRight( false, true, -58.5 - 6, -50.5 - 6 )

					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end

				local FirstBulletFiredAnimStage1 = function ( element, event )
					if event.interrupted then
						FirstBulletFiredAnimStage2( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )

						element:setLeftRight( false, true, -58.5 - 6 + 6, -50.5 - 6 + 6 )
						
						element:registerEventHandler( "transition_complete_keyframe", FirstBulletFiredAnimStage2 )
					end
				end

				self.FirstBullet:completeAnimation()
				self.FirstBullet:setLeftRight( false, true, -58.5 - 6, -50.5 - 6 )
				FirstBulletFiredAnimStage1( self.FirstBullet, {} )
			end
		}
	}

	self:subscribeToGlobalModel( controller, "PerController", "currentWeapon.ammoInClip", function ( model )
		local ammoInClip = Engine.GetModelValue( model )

		if ammoInClip then
			if ammoInClip == 4 then
				self.FirstBullet:setImage( RegisterImage( "blacktransparent" ) )
				self.Bullet1:setImage( RegisterImage( "blacktransparent" ) )

			elseif ammoInClip == 3 then
				self.FirstBullet:setImage( RegisterImage( "blacktransparent" ) )
				self.Bullet1:setImage( RegisterImage( "blacktransparent" ) )
				self.Bullet2:setImage( RegisterImage( "blacktransparent" ) )

			elseif ammoInClip == 2 then
				self.FirstBullet:setImage( RegisterImage( "blacktransparent" ) )
				self.Bullet1:setImage( RegisterImage( "blacktransparent" ) )
				self.Bullet2:setImage( RegisterImage( "blacktransparent" ) )
				self.Bullet3:setImage( RegisterImage( "blacktransparent" ) )

			elseif ammoInClip == 1 then
				self.FirstBullet:setImage( RegisterImage( "blacktransparent" ) )
				self.Bullet1:setImage( RegisterImage( "blacktransparent" ) )
				self.Bullet2:setImage( RegisterImage( "blacktransparent" ) )
				self.Bullet3:setImage( RegisterImage( "blacktransparent" ) )
				self.Bullet4:setImage( RegisterImage( "blacktransparent" ) )

			elseif ammoInClip < 1 then
				self.FirstBullet:setImage( RegisterImage( "blacktransparent" ) )
				self.Bullet1:setImage( RegisterImage( "blacktransparent" ) )
				self.Bullet2:setImage( RegisterImage( "blacktransparent" ) )
				self.Bullet3:setImage( RegisterImage( "blacktransparent" ) )
				self.Bullet4:setImage( RegisterImage( "blacktransparent" ) )
				self.Bullet5:setImage( RegisterImage( "blacktransparent" ) )

			else
				self.FirstBullet:setImage( RegisterImage( "csgo_bullet" ) )
				self.Bullet1:setImage( RegisterImage( "csgo_bullet" ) )
				self.Bullet2:setImage( RegisterImage( "csgo_bullet" ) )
				self.Bullet3:setImage( RegisterImage( "csgo_bullet" ) )
				self.Bullet4:setImage( RegisterImage( "csgo_bullet" ) )
				self.Bullet5:setImage( RegisterImage( "csgo_bullet" ) )
			end
		end

		PlayClip( self, "Update", controller )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FirstBullet:close()
		element.FirstBulletMask:close()
		element.Bullet1:close()
		element.Bullet2:close()
		element.Bullet3:close()
		element.Bullet4:close()
		element.Bullet5:close()
		element.LastBullet:close()
		element.LastBulletMask:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
