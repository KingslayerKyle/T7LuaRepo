local PostLoadFunc = function ( self, controller )
	self.notificationQueueEmptyModel = Engine.CreateModel( Engine.GetModelForController( controller ), "NotificationQueueEmpty" )

	self.playNotification = function ( self, notificationData )
		if notificationData.clip ~= nil and notificationData.title ~= nil and notificationData.image ~= nil then
			self.text:setText( Engine.Localize( notificationData.title ) )
			self.image:setImage( RegisterImage( notificationData.image ) )

			self:playClip( notificationData.clip )
		end
	end
	
	self.appendNotification = function ( self, notificationData )
		if self.notificationInProgress == true or Engine.GetModelValue( self.notificationQueueEmptyModel ) ~= true then
			local notification = self.nextNotification

			if notification == nil then
				self.nextNotification = LUI.ShallowCopy( notificationData )
			end

			while notification and notification.next ~= nil do
				notification = notification.next
			end

			if notification ~= nil then
				notification.next = LUI.ShallowCopy( notificationData )
			end
		else
			self:playNotification( LUI.ShallowCopy( notificationData ) )
		end
	end
	
	self.notificationInProgress = false
	self.nextNotification = nil

	LUI.OverrideFunction_CallOriginalSecond( self, "playClip", function ( element )
		element.notificationInProgress = true
	end )

	self:registerEventHandler( "clip_over", function ( element, event )
		self.notificationInProgress = false

		if self.nextNotification ~= nil then
			self:playNotification( self.nextNotification )
			self.nextNotification = self.nextNotification.next
		end
	end )

	self:subscribeToModel( self.notificationQueueEmptyModel, function ( model )
		if Engine.GetModelValue( model ) == true then
			self:processEvent( {
				name = "clip_over"
			} )
		end
	end )

	-- Subscribe to each of the powerup clientfields and append notification based on the powerup state
	for index = 1, #CoD.PowerUps.ClientFieldNames do
		local powerupState = Engine.GetModel( Engine.GetModelForController( controller ), CoD.PowerUps.ClientFieldNames[index].clientFieldName .. ".state" )

		if powerupState then
			self:subscribeToModel( powerupState, function ( model )
				if Engine.GetModelValue( model ) then
					if Engine.GetModelValue( model ) == 1 then
						self:appendNotification( {
							clip = "Powerup",
							title = string.upper( CoD.PowerUps.ClientFieldNames[index].clientFieldName:gsub( "powerup", "" ):gsub( "_", " " ) ),
							image = CoD.PowerUps.ClientFieldNames[index].image
						} )
					end
				end
			end )
		end
	end

	-- Max ammo has no clientfield so we'll use the scriptNotify since we already have access to it
	self:subscribeToGlobalModel( controller, "PerController", "scriptNotify", function ( model )
		if IsParamModelEqualToString( model, "zombie_notification" ) then
			if Engine.Localize( Engine.GetIString( CoD.GetScriptNotifyData( model )[1], "CS_LOCALIZED_STRINGS" ) ):find( "Max Ammo" ) then
				self:appendNotification( {
					clip = "Powerup",
					title = "MAX AMMO",
					image = "zm_powerup_max_ammo"
				} )
			end
		end
	end )
end

CoD.IW7Notification = InheritFrom( LUI.UIElement )
CoD.IW7Notification.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.IW7Notification )
	self.id = "IW7Notification"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true

	self.circle = LUI.UIImage.new()
	self.circle:setLeftRight( false, false, -200, 200 )
	self.circle:setTopBottom( true, false, 35, 435 )
	self.circle:setImage( RegisterImage( "zm_tix_arcane_spinner" ) )
	self.circle:setScale( 0.4 )
	self:addElement( self.circle )

	self.background1 = LUI.UIImage.new()
	self.background1:setLeftRight( false, false, -200, 200 )
	self.background1:setTopBottom( true, false, 35, 435 )
	self.background1:setImage( RegisterImage( "zm_powerup_glow_element" ) )
	self:addElement( self.background1 )

	self.background2 = LUI.UIImage.new()
	self.background2:setLeftRight( false, false, -200, 200 )
	self.background2:setTopBottom( true, false, 35, 435 )
	self.background2:setImage( RegisterImage( "zm_powerup_glow_element" ) )
	self:addElement( self.background2 )

	self.image = LUI.UIImage.new()
	self.image:setLeftRight( false, false, -200, 200 )
	self.image:setTopBottom( true, false, 35, 435 )
	self.image:setImage( RegisterImage( "blacktransparent" ) )
	self.image:setScale( 0.6 )
	self:addElement( self.image )

	self.text = LUI.UIText.new()
	self.text:setLeftRight( false, false, -200, 200 )
	self.text:setTopBottom( true, false, 350, 380 )
	self.text:setText( Engine.Localize( "" ) )
	self.text:setTTF( "fonts/blender_pro_bold.ttf" )
	self.text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self:addElement( self.text )
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				self.circle:completeAnimation()
				self.circle:setAlpha( 0 )
				self.clipFinished( self.circle, {} )

				self.background1:completeAnimation()
				self.background1:setAlpha( 0 )
				self.clipFinished( self.background1, {} )

				self.background2:completeAnimation()
				self.background2:setAlpha( 0 )
				self.clipFinished( self.background2, {} )

				self.image:completeAnimation()
				self.image:setAlpha( 0 )
				self.clipFinished( self.image, {} )

				self.text:completeAnimation()
				self.text:setAlpha( 0 )
				self.clipFinished( self.text, {} )
			end,
			Powerup = function ()
				self:setupElementClipCounter( 5 )

				local ImageAnim4 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
				
					element:setAlpha( 0 )
				
					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end

				local ImageAnim3 = function ( element, event )
					if event.interrupted then
						ImageAnim4( element, event )
				
						return 
					else
						element:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
				
						element:setLeftRight( false, false, -200 + 620, 200 + 620 )
						element:setTopBottom( true, false, 35 - 202.5, 435 - 202.5 )
				
						element:registerEventHandler( "transition_complete_keyframe", ImageAnim4 )
					end
				end
				
				local ImageAnim2 = function ( element, event )
					if event.interrupted then
						ImageAnim3( element, event )
				
						return 
					else
						element:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
				
						element:setScale( 0.17 )
				
						element:registerEventHandler( "transition_complete_keyframe", ImageAnim3 )
					end
				end
				
				local ImageAnim1 = function ( element, event )
					if event.interrupted then
						ImageAnim2( element, event )
				
						return 
					else
						element:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
				
						element:setAlpha( 1 )
				
						element:registerEventHandler( "transition_complete_keyframe", ImageAnim2 )
					end
				end
				
				self.image:completeAnimation()
				self.image:setAlpha( 0 )
				self.image:setScale( 0.6 )
				self.image:setLeftRight( false, false, -200, 200 )
				self.image:setTopBottom( true, false, 35, 435 )
				ImageAnim1( self.image, {} )

				local Background2Anim3 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
				
					element:setAlpha( 0 )
				
					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				local Background2Anim2 = function ( element, event )
					if event.interrupted then
						Background2Anim3( element, event )
				
						return 
					else
						element:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
				
						element:setScale( 0.5 )
				
						element:registerEventHandler( "transition_complete_keyframe", Background2Anim3 )
					end
				end
				
				local Background2Anim1 = function ( element, event )
					if event.interrupted then
						Background2Anim2( element, event )
				
						return 
					else
						element:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
				
						element:setAlpha( 1 )
				
						element:registerEventHandler( "transition_complete_keyframe", Background2Anim2 )
					end
				end
				
				self.background2:completeAnimation()
				self.background2:setAlpha( 0 )
				self.background2:setScale( 1 )
				Background2Anim1( self.background2, {} )

				local PowerupAnim2 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
	
					element:setAlpha( 0 )
	
					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end

				local PowerupAnim1 = function ( element, event )
					if event.interrupted then
						PowerupAnim2( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )

						element:setAlpha( 1 )

						element:registerEventHandler( "transition_complete_keyframe", PowerupAnim2 )
					end
				end

				self.text:completeAnimation()
				self.text:setAlpha( 0 )
				PowerupAnim1( self.text, {} )

				self.background1:completeAnimation()
				self.background1:setAlpha( 0 )
				PowerupAnim1( self.background1, {} )

				self.circle:completeAnimation()
				self.circle:setAlpha( 0 )
				PowerupAnim1( self.circle, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.circle:close()
		element.background1:close()
		element.background2:close()
		element.image:close()
		element.text:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
