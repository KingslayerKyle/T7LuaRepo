local PostLoadFunc = function ( self, event )
	self:registerEventHandler( "killstreak_received", CoD.InGameNotificationQueue.KillstreakReceived )
	self:registerEventHandler( "notification_complete", CoD.InGameNotificationQueue.NotificationComplete )
end

CoD.KillstreakNotification = InheritFrom( LUI.UIElement )
CoD.KillstreakNotification.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.KillstreakNotification )
	self.id = "KillstreakNotification"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 128 )
	self:setTopBottom( true, false, 0, 158 )
	
	local textDarkSplashImage = LUI.UIImage.new()
	textDarkSplashImage:setLeftRight( true, false, 0, 128 )
	textDarkSplashImage:setTopBottom( true, false, 81, 156 )
	textDarkSplashImage:setRGB( 1, 1, 1 )
	textDarkSplashImage:setImage( RegisterImage( "uie_ks_menu_background" ) )
	textDarkSplashImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( textDarkSplashImage )
	self.textDarkSplashImage = textDarkSplashImage
	
	local killstreakName = LUI.UIText.new()
	killstreakName:setLeftRight( true, true, 0, 0 )
	killstreakName:setTopBottom( true, false, 105, 130 )
	killstreakName:setRGB( 1, 1, 1 )
	killstreakName:setTTF( "fonts/default.ttf" )
	killstreakName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	killstreakName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	killstreakName:subscribeToGlobalModel( controller, "InGameNotifications", "earnedKillstreakName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			killstreakName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( killstreakName )
	self.killstreakName = killstreakName
	
	local darkSplashImage = LUI.UIImage.new()
	darkSplashImage:setLeftRight( true, false, 0, 128 )
	darkSplashImage:setTopBottom( true, false, 0, 128 )
	darkSplashImage:setRGB( 1, 1, 1 )
	darkSplashImage:setImage( RegisterImage( "uie_ks_menu_background" ) )
	darkSplashImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( darkSplashImage )
	self.darkSplashImage = darkSplashImage
	
	local killstreakImage = LUI.UIImage.new()
	killstreakImage:setLeftRight( true, false, 0, 128 )
	killstreakImage:setTopBottom( true, false, 0, 128 )
	killstreakImage:setRGB( 1, 1, 1 )
	killstreakImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	killstreakImage:subscribeToGlobalModel( controller, "InGameNotifications", "earnedKillstreakImage", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			killstreakImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( killstreakImage )
	self.killstreakImage = killstreakImage
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				textDarkSplashImage:completeAnimation()
				self.textDarkSplashImage:setAlpha( 0 )
				self.clipFinished( textDarkSplashImage, {} )
				killstreakName:completeAnimation()
				self.killstreakName:setAlpha( 0 )
				self.clipFinished( killstreakName, {} )
				darkSplashImage:completeAnimation()
				self.darkSplashImage:setAlpha( 0 )
				self.clipFinished( darkSplashImage, {} )
				killstreakImage:completeAnimation()
				self.killstreakImage:setAlpha( 0 )
				self.clipFinished( killstreakImage, {} )
			end,
			KillstreakEarned = function ()
				self:setupElementClipCounter( 4 )
				local textDarkSplashImageFrame2 = function ( textDarkSplashImage, event )
					local textDarkSplashImageFrame3 = function ( textDarkSplashImage, event )
						local textDarkSplashImageFrame4 = function ( textDarkSplashImage, event )
							if not event.interrupted then
								textDarkSplashImage:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
							end
							textDarkSplashImage:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( textDarkSplashImage, event )
							else
								textDarkSplashImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							textDarkSplashImageFrame4( textDarkSplashImage, event )
							return 
						else
							textDarkSplashImage:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
							textDarkSplashImage:registerEventHandler( "transition_complete_keyframe", textDarkSplashImageFrame4 )
						end
					end
					
					if event.interrupted then
						textDarkSplashImageFrame3( textDarkSplashImage, event )
						return 
					else
						textDarkSplashImage:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						textDarkSplashImage:setAlpha( 0.7 )
						textDarkSplashImage:registerEventHandler( "transition_complete_keyframe", textDarkSplashImageFrame3 )
					end
				end
				
				textDarkSplashImage:completeAnimation()
				self.textDarkSplashImage:setAlpha( 0 )
				textDarkSplashImageFrame2( textDarkSplashImage, {} )
				local killstreakNameFrame2 = function ( killstreakName, event )
					local killstreakNameFrame3 = function ( killstreakName, event )
						local killstreakNameFrame4 = function ( killstreakName, event )
							if not event.interrupted then
								killstreakName:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
							end
							killstreakName:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( killstreakName, event )
							else
								killstreakName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							killstreakNameFrame4( killstreakName, event )
							return 
						else
							killstreakName:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
							killstreakName:registerEventHandler( "transition_complete_keyframe", killstreakNameFrame4 )
						end
					end
					
					if event.interrupted then
						killstreakNameFrame3( killstreakName, event )
						return 
					else
						killstreakName:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						killstreakName:setAlpha( 1 )
						killstreakName:registerEventHandler( "transition_complete_keyframe", killstreakNameFrame3 )
					end
				end
				
				killstreakName:completeAnimation()
				self.killstreakName:setAlpha( 0 )
				killstreakNameFrame2( killstreakName, {} )
				local darkSplashImageFrame2 = function ( darkSplashImage, event )
					local darkSplashImageFrame3 = function ( darkSplashImage, event )
						local darkSplashImageFrame4 = function ( darkSplashImage, event )
							if not event.interrupted then
								darkSplashImage:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
							end
							darkSplashImage:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( darkSplashImage, event )
							else
								darkSplashImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							darkSplashImageFrame4( darkSplashImage, event )
							return 
						else
							darkSplashImage:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
							darkSplashImage:registerEventHandler( "transition_complete_keyframe", darkSplashImageFrame4 )
						end
					end
					
					if event.interrupted then
						darkSplashImageFrame3( darkSplashImage, event )
						return 
					else
						darkSplashImage:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						darkSplashImage:setAlpha( 1 )
						darkSplashImage:registerEventHandler( "transition_complete_keyframe", darkSplashImageFrame3 )
					end
				end
				
				darkSplashImage:completeAnimation()
				self.darkSplashImage:setAlpha( 0 )
				darkSplashImageFrame2( darkSplashImage, {} )
				local killstreakImageFrame2 = function ( killstreakImage, event )
					local killstreakImageFrame3 = function ( killstreakImage, event )
						local killstreakImageFrame4 = function ( killstreakImage, event )
							if not event.interrupted then
								killstreakImage:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
							end
							killstreakImage:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( killstreakImage, event )
							else
								killstreakImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							killstreakImageFrame4( killstreakImage, event )
							return 
						else
							killstreakImage:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
							killstreakImage:registerEventHandler( "transition_complete_keyframe", killstreakImageFrame4 )
						end
					end
					
					if event.interrupted then
						killstreakImageFrame3( killstreakImage, event )
						return 
					else
						killstreakImage:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						killstreakImage:setAlpha( 1 )
						killstreakImage:registerEventHandler( "transition_complete_keyframe", killstreakImageFrame3 )
					end
				end
				
				killstreakImage:completeAnimation()
				self.killstreakImage:setAlpha( 0 )
				killstreakImageFrame2( killstreakImage, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				textDarkSplashImage:completeAnimation()
				self.textDarkSplashImage:setAlpha( 0 )
				self.clipFinished( textDarkSplashImage, {} )
				killstreakName:completeAnimation()
				self.killstreakName:setAlpha( 0 )
				self.clipFinished( killstreakName, {} )
				darkSplashImage:completeAnimation()
				self.darkSplashImage:setAlpha( 0 )
				self.clipFinished( darkSplashImage, {} )
				killstreakImage:completeAnimation()
				self.killstreakImage:setAlpha( 0 )
				self.clipFinished( killstreakImage, {} )
			end
		}
	}
	self.close = function ( self )
		self.killstreakName:close()
		self.killstreakImage:close()
		CoD.KillstreakNotification.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

