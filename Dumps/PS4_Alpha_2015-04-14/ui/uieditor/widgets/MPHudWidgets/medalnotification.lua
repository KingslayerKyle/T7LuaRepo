local PostLoadFunc = function ( self )
	self:registerEventHandler( "medal_received", CoD.InGameNotificationQueue.MedalReceived )
	self:registerEventHandler( "notification_complete", CoD.InGameNotificationQueue.NotificationComplete )
end

CoD.MedalNotification = InheritFrom( LUI.UIElement )
CoD.MedalNotification.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MedalNotification )
	self.id = "MedalNotification"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 128 )
	self:setTopBottom( true, false, 0, 153 )
	
	local medalImage = LUI.UIImage.new()
	medalImage:setLeftRight( true, false, 0, 128 )
	medalImage:setTopBottom( true, false, 0, 128 )
	medalImage:setRGB( 1, 1, 1 )
	medalImage:setAlpha( 0 )
	medalImage:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint_reveal" ) )
	medalImage:setShaderVector( 0, 0, 0, 0, 0 )
	medalImage:subscribeToGlobalModel( controller, "InGameNotifications", "earnedMedalImage", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			medalImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( medalImage )
	self.medalImage = medalImage
	
	local backGlowImage = LUI.UIImage.new()
	backGlowImage:setLeftRight( false, false, -87.5, 87.5 )
	backGlowImage:setTopBottom( false, false, -105, 95 )
	backGlowImage:setRGB( 0.09, 0.15, 0.19 )
	backGlowImage:setAlpha( 0 )
	backGlowImage:setImage( RegisterImage( "uie_lui_medal_glow" ) )
	backGlowImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( backGlowImage )
	self.backGlowImage = backGlowImage
	
	local innerGlowImage = LUI.UIImage.new()
	innerGlowImage:setLeftRight( false, false, -43.75, 43.75 )
	innerGlowImage:setTopBottom( false, false, -27, 37 )
	innerGlowImage:setRGB( 0.07, 0.04, 0.05 )
	innerGlowImage:setAlpha( 0 )
	innerGlowImage:setImage( RegisterImage( "uie_lui_medal_glow" ) )
	innerGlowImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( innerGlowImage )
	self.innerGlowImage = innerGlowImage
	
	local medalName = LUI.UIText.new()
	medalName:setLeftRight( true, true, 0, 0 )
	medalName:setTopBottom( true, false, 128, 153 )
	medalName:setRGB( 1, 1, 1 )
	medalName:setAlpha( 0 )
	medalName:setTTF( "fonts/default.ttf" )
	medalName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	medalName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	medalName:subscribeToGlobalModel( controller, "InGameNotifications", "earnedMedalName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			medalName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( medalName )
	self.medalName = medalName
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				medalImage:completeAnimation()
				self.medalImage:setAlpha( 0 )
				self.medalImage:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint_reveal" ) )
				self.clipFinished( medalImage, {} )
				backGlowImage:completeAnimation()
				self.backGlowImage:setAlpha( 0 )
				self.clipFinished( backGlowImage, {} )
				innerGlowImage:completeAnimation()
				self.innerGlowImage:setAlpha( 0 )
				self.clipFinished( innerGlowImage, {} )
				medalName:completeAnimation()
				self.medalName:setAlpha( 0 )
				self.clipFinished( medalName, {} )
			end,
			MedalEarned = function ()
				self:setupElementClipCounter( 4 )
				local medalImageFrame2 = function ( medalImage, event )
					local medalImageFrame3 = function ( medalImage, event )
						local medalImageFrame4 = function ( medalImage, event )
							local medalImageFrame5 = function ( medalImage, event )
								if not event.interrupted then
									medalImage:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
								end
								medalImage:setAlpha( 0 )
								medalImage:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint_reveal" ) )
								if event.interrupted then
									self.clipFinished( medalImage, event )
								else
									medalImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								medalImageFrame5( medalImage, event )
								return 
							else
								medalImage:beginAnimation( "keyframe", 1200, false, false, CoD.TweenType.Linear )
								medalImage:registerEventHandler( "transition_complete_keyframe", medalImageFrame5 )
							end
						end
						
						if event.interrupted then
							medalImageFrame4( medalImage, event )
							return 
						else
							medalImage:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
							medalImage:registerEventHandler( "transition_complete_keyframe", medalImageFrame4 )
						end
					end
					
					if event.interrupted then
						medalImageFrame3( medalImage, event )
						return 
					else
						medalImage:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						medalImage:setAlpha( 1 )
						medalImage:registerEventHandler( "transition_complete_keyframe", medalImageFrame3 )
					end
				end
				
				medalImage:completeAnimation()
				self.medalImage:setAlpha( 0 )
				self.medalImage:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint_reveal" ) )
				medalImageFrame2( medalImage, {} )
				local backGlowImageFrame2 = function ( backGlowImage, event )
					local backGlowImageFrame3 = function ( backGlowImage, event )
						local backGlowImageFrame4 = function ( backGlowImage, event )
							if not event.interrupted then
								backGlowImage:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
							end
							backGlowImage:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( backGlowImage, event )
							else
								backGlowImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							backGlowImageFrame4( backGlowImage, event )
							return 
						else
							backGlowImage:beginAnimation( "keyframe", 1500, false, false, CoD.TweenType.Linear )
							backGlowImage:registerEventHandler( "transition_complete_keyframe", backGlowImageFrame4 )
						end
					end
					
					if event.interrupted then
						backGlowImageFrame3( backGlowImage, event )
						return 
					else
						backGlowImage:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						backGlowImage:setAlpha( 1 )
						backGlowImage:registerEventHandler( "transition_complete_keyframe", backGlowImageFrame3 )
					end
				end
				
				backGlowImage:completeAnimation()
				self.backGlowImage:setAlpha( 0 )
				backGlowImageFrame2( backGlowImage, {} )
				local innerGlowImageFrame2 = function ( innerGlowImage, event )
					local innerGlowImageFrame3 = function ( innerGlowImage, event )
						local innerGlowImageFrame4 = function ( innerGlowImage, event )
							if not event.interrupted then
								innerGlowImage:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
							end
							innerGlowImage:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( innerGlowImage, event )
							else
								innerGlowImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							innerGlowImageFrame4( innerGlowImage, event )
							return 
						else
							innerGlowImage:beginAnimation( "keyframe", 1500, false, false, CoD.TweenType.Linear )
							innerGlowImage:registerEventHandler( "transition_complete_keyframe", innerGlowImageFrame4 )
						end
					end
					
					if event.interrupted then
						innerGlowImageFrame3( innerGlowImage, event )
						return 
					else
						innerGlowImage:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						innerGlowImage:setAlpha( 1 )
						innerGlowImage:registerEventHandler( "transition_complete_keyframe", innerGlowImageFrame3 )
					end
				end
				
				innerGlowImage:completeAnimation()
				self.innerGlowImage:setAlpha( 0 )
				innerGlowImageFrame2( innerGlowImage, {} )
				local medalNameFrame2 = function ( medalName, event )
					local medalNameFrame3 = function ( medalName, event )
						local medalNameFrame4 = function ( medalName, event )
							if not event.interrupted then
								medalName:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
							end
							medalName:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( medalName, event )
							else
								medalName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							medalNameFrame4( medalName, event )
							return 
						else
							medalName:beginAnimation( "keyframe", 1500, false, false, CoD.TweenType.Linear )
							medalName:registerEventHandler( "transition_complete_keyframe", medalNameFrame4 )
						end
					end
					
					if event.interrupted then
						medalNameFrame3( medalName, event )
						return 
					else
						medalName:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						medalName:setAlpha( 1 )
						medalName:registerEventHandler( "transition_complete_keyframe", medalNameFrame3 )
					end
				end
				
				medalName:completeAnimation()
				self.medalName:setAlpha( 0 )
				medalNameFrame2( medalName, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				medalImage:completeAnimation()
				self.medalImage:setAlpha( 0 )
				self.medalImage:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint_reveal" ) )
				self.clipFinished( medalImage, {} )
				backGlowImage:completeAnimation()
				self.backGlowImage:setAlpha( 0 )
				self.clipFinished( backGlowImage, {} )
				innerGlowImage:completeAnimation()
				self.innerGlowImage:setAlpha( 0 )
				self.clipFinished( innerGlowImage, {} )
				medalName:completeAnimation()
				self.medalName:setAlpha( 0 )
				self.clipFinished( medalName, {} )
			end
		}
	}
	self.close = function ( self )
		self.medalImage:close()
		self.medalName:close()
		CoD.MedalNotification.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

