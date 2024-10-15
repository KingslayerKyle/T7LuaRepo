require( "ui.uieditor.widgets.HUD.T8NotificationWidget.T8NotificationSpinner" )

local GetPowerupTitle = function ( clientFieldName )
	local title = ""
	local split = LUI.splitString( clientFieldName, "_" )

	for index = 1, #split do
		if split[index] ~= "powerup" then
			if title ~= "" then
				title = title .. " "
			end

			title = title .. string.upper( split[index]:sub( 1, 1 ) ) .. split[index]:sub( 2, -1 )
		end
	end

	title = title .. "!"

	return title
end

local PostLoadFunc = function ( self, controller )
	self.notificationQueueEmptyModel = Engine.CreateModel( Engine.GetModelForController( controller ), "NotificationQueueEmpty" )

	self.playNotification = function ( self, notificationData )
		if notificationData.clip ~= nil and notificationData.title ~= nil then
			self.text1:setText( Engine.Localize( notificationData.title ) )
			self.text2:setText( Engine.Localize( notificationData.title ) )

			self:playClip( notificationData.clip )
			self.spinner:playClip( notificationData.clip )
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
							title = GetPowerupTitle( CoD.PowerUps.ClientFieldNames[index].clientFieldName )
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
					title = "Max Ammo!"
				} )
			end
		end
	end )
end

CoD.T8Notification = InheritFrom( LUI.UIElement )
CoD.T8Notification.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.T8Notification )
	self.id = "T8Notification"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true

	self.background = LUI.UIImage.new()
	self.background:setLeftRight( false, false, -115, 115 )
	self.background:setTopBottom( true, false, 13, 238 )
	self.background:setImage( RegisterImage( "ximage_1c0c1d922919e7e" ) )
	self.background:setAlpha( 0 )
	self:addElement( self.background )

	self.spinner = CoD.T8NotificationSpinner.new( self, controller )
	self.spinner:setLeftRight( true, true, 0, 0 )
	self.spinner:setTopBottom( true, true, 0, 0 )
	self.spinner:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( self.spinner )

	self.footer = LUI.UIImage.new()
	self.footer:setLeftRight( false, false, -119, 119 )
	self.footer:setTopBottom( true, false, 118, 143 )
	self.footer:setImage( RegisterImage( "ximage_f0098a976c6efd9" ) )
	self.footer:setAlpha( 0 )
	self:addElement( self.footer )

	self.text1 = LUI.UIText.new()
	self.text1:setLeftRight( true, true, 0, 0 )
	self.text1:setTopBottom( true, false, 162, 208 )
	self.text1:setText( Engine.Localize( "" ) )
	self.text1:setTTF( "fonts/skorzhen.ttf" )
	self.text1:setRGB( 0, 0, 0 )
	self.text1:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	self.text1:setShaderVector( 0, 0.4, 0, 0, 0 )
	self.text1:setShaderVector( 1, 0.4, 0, 0, 0 )
	self.text1:setShaderVector( 2, 1, 0, 0, 0 )
	self.text1:setScale( 0.5 )
	self.text1:setAlpha( 0 )
	self:addElement( self.text1 )

	self.text2 = LUI.UIText.new()
	self.text2:setLeftRight( true, true, 0, 0 )
	self.text2:setTopBottom( true, false, 162, 208 )
	self.text2:setText( Engine.Localize( "" ) )
	self.text2:setTTF( "fonts/skorzhen.ttf" )
	self.text2:setRGB( 0.96, 0.66, 0 )
	self.text2:setScale( 0.5 )
	self.text2:setAlpha( 0 )
	self:addElement( self.text2 )
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				self.background:completeAnimation()
				self.background:setAlpha( 0 )
				self.clipFinished( self.background, {} )

				self.footer:completeAnimation()
				self.footer:setAlpha( 0 )
				self.clipFinished( self.footer, {} )

				self.text1:completeAnimation()
				self.text1:setAlpha( 0 )
				self.clipFinished( self.text1, {} )
				
				self.text2:completeAnimation()
				self.text2:setAlpha( 0 )
				self.clipFinished( self.text2, {} )
			end,
			Powerup = function ()
				self:setupElementClipCounter( 4 )

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

				self.background:completeAnimation()
				self.background:setAlpha( 0 )
				PowerupAnim1( self.background, {} )

				self.footer:completeAnimation()
				self.footer:setAlpha( 0 )
				PowerupAnim1( self.footer, {} )

				self.text1:completeAnimation()
				self.text1:setAlpha( 0 )
				PowerupAnim1( self.text1, {} )
				
				self.text2:completeAnimation()
				self.text2:setAlpha( 0 )
				PowerupAnim1( self.text2, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.background:close()
		element.spinner:close()
		element.footer:close()
		element.text1:close()
		element.text2:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
