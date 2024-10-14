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
					image = "h1_powerup_maxammo"
				} )
			end
		end
	end )
end

CoD.H1Notification = InheritFrom( LUI.UIElement )
CoD.H1Notification.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.H1Notification )
	self.id = "H1Notification"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true

	self.background = LUI.UIImage.new()
	self.background:setLeftRight( false, false, -33.5 - 100, 33.5 + 100 )
	self.background:setTopBottom( false, true, -233 - 100, -166 + 100 )
	self.background:setImage( RegisterImage( "$white" ) )
	self.background:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	self.background:setShaderVector( 0, 0.5, 0.5, 0.5, 0.5 )
	self.background:setRGB( 0, 0, 0 )
	self.background:setScale( 0.5 )
	self:addElement( self.background )

	self.image = LUI.UIImage.new()
	self.image:setLeftRight( false, false, -33.5, 33.5 )
	self.image:setTopBottom( false, true, -233, -166 )
	self.image:setImage( RegisterImage( "blacktransparent" ) )
	self:addElement( self.image )

	self.text = LUI.UIText.new()
	self.text:setLeftRight( true, true, 0, 0 )
	self.text:setTopBottom( true, false, 537 + 10, 603 - 10 )
	self.text:setText( Engine.Localize( "" ) )
	self.text:setTTF( "fonts/defaultbold.otf" )
	self.text:setScale( 0.5 )
	self:addElement( self.text )
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				self.background:completeAnimation()
				self.background:setAlpha( 0 )
				self.clipFinished( self.background, {} )

				self.image:completeAnimation()
				self.image:setAlpha( 0 )
				self.clipFinished( self.image, {} )

				self.text:completeAnimation()
				self.text:setAlpha( 0 )
				self.clipFinished( self.text, {} )
			end,
			Powerup = function ()
				self:setupElementClipCounter( 3 )

				local PowerupAnim3 = function ( element, event )
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

				local PowerupAnim2 = function ( element, event )
					if event.interrupted then
						PowerupAnim3( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )

						element:setAlpha( 1 )

						element:registerEventHandler( "transition_complete_keyframe", PowerupAnim3 )
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

				self.background:completeAnimation()
				self.background:setAlpha( 0 )
				PowerupAnim1( self.background, {} )

				self.image:completeAnimation()
				self.image:setAlpha( 0 )
				PowerupAnim1( self.image, {} )

				self.text:completeAnimation()
				self.text:setAlpha( 0 )
				PowerupAnim1( self.text, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.background:close()
		element.image:close()
		element.text:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
