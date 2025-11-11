CoD.LobbyPlayButton = InheritFrom( LUI.UIElement )
CoD.LobbyPlayButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LobbyPlayButton )
	self.id = "LobbyPlayButton"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 220 )
	self:setTopBottom( 0, 0, 0, 80 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local arrow = LUI.UIImage.new()
	arrow:setLeftRight( 0, 0, -48, 132 )
	arrow:setTopBottom( 0, 0, -54, 126 )
	arrow:setRGB( 0.77, 0.9, 0.88 )
	arrow:setImage( RegisterImage( "uie_menu_icon_play_glow" ) )
	self:addElement( arrow )
	self.arrow = arrow
	
	local arrow2 = LUI.UIImage.new()
	arrow2:setLeftRight( 0, 0, -48, 132 )
	arrow2:setTopBottom( 0, 0, -54, 126 )
	arrow2:setRGB( 0.77, 0.9, 0.88 )
	arrow2:setAlpha( 0.2 )
	arrow2:setImage( RegisterImage( "uie_menu_icon_play_glow" ) )
	arrow2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( arrow2 )
	self.arrow2 = arrow2
	
	local PlayText = LUI.UITightText.new()
	PlayText:setLeftRight( 0, 0, 92, 147 )
	PlayText:setTopBottom( 0, 0, 24, 57 )
	PlayText:setRGB( 0.33, 0.95, 0.71 )
	PlayText:setAlpha( 0.5 )
	PlayText:setText( LocalizeToUpperString( "MENU_PLAY" ) )
	PlayText:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	self:addElement( PlayText )
	self.PlayText = PlayText
	
	local circle = LUI.UIImage.new()
	circle:setLeftRight( 0, 0, 0, 80 )
	circle:setTopBottom( 0, 0, 0, 80 )
	circle:setAlpha( 0 )
	circle:setZRot( 180 )
	circle:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_elliptical_ring" ) )
	circle:setShaderVector( 0, 8.48, 0, 0, 0 )
	circle:setShaderVector( 1, 80, 80, 0, 0 )
	circle:setShaderVector( 2, 0.35, 0.2, 0, 0 )
	self:addElement( circle )
	self.circle = circle
	
	local timer = LUI.UIText.new()
	timer:setLeftRight( 0, 0, 0, 80 )
	timer:setTopBottom( 0, 0, 9, 67 )
	timer:setAlpha( 0 )
	timer:setTTF( "fonts/default.ttf" )
	timer:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	timer:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	timer:subscribeToGlobalModel( controller, "LobbyRoot", "lobbyTimeRemaining", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			timer:setText( modelValue )
		end
	end )
	self:addElement( timer )
	self.timer = timer
	
	self.resetProperties = function ()
		arrow:completeAnimation()
		PlayText:completeAnimation()
		arrow2:completeAnimation()
		circle:completeAnimation()
		timer:completeAnimation()
		arrow:setRGB( 0.77, 0.9, 0.88 )
		arrow:setAlpha( 1 )
		arrow:setScale( 1 )
		PlayText:setLeftRight( 0, 0, 92, 147 )
		PlayText:setTopBottom( 0, 0, 24, 57 )
		PlayText:setRGB( 0.33, 0.95, 0.71 )
		PlayText:setAlpha( 0.5 )
		PlayText:setScale( 1 )
		PlayText:setText( LocalizeToUpperString( "MENU_PLAY" ) )
		arrow2:setAlpha( 0.2 )
		arrow2:setScale( 1 )
		circle:setRGB( 1, 1, 1 )
		circle:setAlpha( 0 )
		timer:setRGB( 1, 1, 1 )
		timer:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				arrow:completeAnimation()
				self.arrow:setAlpha( 0 )
				self.clipFinished( arrow, {} )
				arrow2:completeAnimation()
				self.arrow2:setAlpha( 0 )
				self.clipFinished( arrow2, {} )
				PlayText:completeAnimation()
				self.PlayText:setAlpha( 0 )
				self.clipFinished( PlayText, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				arrow:completeAnimation()
				self.arrow:setAlpha( 0 )
				self.clipFinished( arrow, {} )
				arrow2:completeAnimation()
				self.arrow2:setAlpha( 0 )
				self.clipFinished( arrow2, {} )
				PlayText:completeAnimation()
				self.PlayText:setAlpha( 0 )
				self.clipFinished( PlayText, {} )
			end
		},
		MatchStarting = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				arrow:completeAnimation()
				self.arrow:setAlpha( 0 )
				self.clipFinished( arrow, {} )
				arrow2:completeAnimation()
				self.arrow2:setAlpha( 0 )
				self.clipFinished( arrow2, {} )
				PlayText:completeAnimation()
				self.PlayText:setAlpha( 0.6 )
				self.PlayText:setText( LocalizeToUpperString( "MP_MATCH_STARTING" ) )
				self.clipFinished( PlayText, {} )
				circle:completeAnimation()
				self.circle:setRGB( 0.33, 0.95, 0.71 )
				self.circle:setAlpha( 0.6 )
				self.clipFinished( circle, {} )
				timer:completeAnimation()
				self.timer:setRGB( 0.33, 0.95, 0.71 )
				self.timer:setAlpha( 0.6 )
				self.clipFinished( timer, {} )
			end
		},
		Available = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				arrow2:completeAnimation()
				self.arrow2:setAlpha( 0 )
				self.clipFinished( arrow2, {} )
				PlayText:completeAnimation()
				self.PlayText:setLeftRight( 0, 0, 92, 215 )
				self.PlayText:setTopBottom( 0, 0, 24, 57 )
				self.clipFinished( PlayText, {} )
				timer:completeAnimation()
				self.timer:setRGB( 0.77, 0.9, 0.88 )
				self.clipFinished( timer, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				local arrowFrame2 = function ( arrow, event )
					if not event.interrupted then
						arrow:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
					end
					arrow:setAlpha( 1 )
					arrow:setScale( 1.3 )
					if event.interrupted then
						self.clipFinished( arrow, event )
					else
						arrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				arrow:completeAnimation()
				self.arrow:setAlpha( 1 )
				self.arrow:setScale( 1 )
				arrowFrame2( arrow, {} )
				local arrow2Frame2 = function ( arrow2, event )
					if not event.interrupted then
						arrow2:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
					end
					arrow2:setAlpha( 0.2 )
					arrow2:setScale( 1.3 )
					if event.interrupted then
						self.clipFinished( arrow2, event )
					else
						arrow2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				arrow2:completeAnimation()
				self.arrow2:setAlpha( 0 )
				self.arrow2:setScale( 1 )
				arrow2Frame2( arrow2, {} )
				local PlayTextFrame2 = function ( PlayText, event )
					if not event.interrupted then
						PlayText:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
					end
					PlayText:setLeftRight( 0, 0, 110, 233 )
					PlayText:setTopBottom( 0, 0, 24, 57 )
					PlayText:setRGB( 1, 1, 1 )
					PlayText:setAlpha( 0.9 )
					PlayText:setScale( 1.1 )
					PlayText:setText( LocalizeToUpperString( "MENU_PLAY" ) )
					if event.interrupted then
						self.clipFinished( PlayText, event )
					else
						PlayText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PlayText:completeAnimation()
				self.PlayText:setLeftRight( 0, 0, 92, 215 )
				self.PlayText:setTopBottom( 0, 0, 24, 57 )
				self.PlayText:setRGB( 0.33, 0.95, 0.71 )
				self.PlayText:setAlpha( 0.5 )
				self.PlayText:setScale( 1 )
				self.PlayText:setText( LocalizeToUpperString( "MENU_PLAY" ) )
				PlayTextFrame2( PlayText, {} )
				local circleFrame2 = function ( circle, event )
					if not event.interrupted then
						circle:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
					end
					circle:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( circle, event )
					else
						circle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				circle:completeAnimation()
				self.circle:setAlpha( 0 )
				circleFrame2( circle, {} )
				local timerFrame2 = function ( timer, event )
					if not event.interrupted then
						timer:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
					end
					timer:setRGB( 0.77, 0.9, 0.88 )
					timer:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( timer, event )
					else
						timer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				timer:completeAnimation()
				self.timer:setRGB( 0.77, 0.9, 0.88 )
				self.timer:setAlpha( 0 )
				timerFrame2( timer, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				local arrowFrame2 = function ( arrow, event )
					if not event.interrupted then
						arrow:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
					end
					arrow:setRGB( 0.77, 0.9, 0.88 )
					arrow:setAlpha( 1 )
					arrow:setScale( 1 )
					if event.interrupted then
						self.clipFinished( arrow, event )
					else
						arrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				arrow:completeAnimation()
				self.arrow:setRGB( 0.77, 0.9, 0.88 )
				self.arrow:setAlpha( 1 )
				self.arrow:setScale( 1.3 )
				arrowFrame2( arrow, {} )
				local arrow2Frame2 = function ( arrow2, event )
					if not event.interrupted then
						arrow2:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
					end
					arrow2:setAlpha( 0 )
					arrow2:setScale( 1 )
					if event.interrupted then
						self.clipFinished( arrow2, event )
					else
						arrow2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				arrow2:completeAnimation()
				self.arrow2:setAlpha( 0.2 )
				self.arrow2:setScale( 1.3 )
				arrow2Frame2( arrow2, {} )
				local PlayTextFrame2 = function ( PlayText, event )
					if not event.interrupted then
						PlayText:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
					end
					PlayText:setLeftRight( 0, 0, 92, 215 )
					PlayText:setTopBottom( 0, 0, 24, 57 )
					PlayText:setRGB( 0.33, 0.95, 0.71 )
					PlayText:setAlpha( 0.5 )
					PlayText:setScale( 1 )
					PlayText:setText( LocalizeToUpperString( "MENU_PLAY" ) )
					if event.interrupted then
						self.clipFinished( PlayText, event )
					else
						PlayText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PlayText:completeAnimation()
				self.PlayText:setLeftRight( 0, 0, 110, 233 )
				self.PlayText:setTopBottom( 0, 0, 24, 57 )
				self.PlayText:setRGB( 1, 1, 1 )
				self.PlayText:setAlpha( 0.9 )
				self.PlayText:setScale( 1.1 )
				self.PlayText:setText( LocalizeToUpperString( "MENU_PLAY" ) )
				PlayTextFrame2( PlayText, {} )
				local circleFrame2 = function ( circle, event )
					if not event.interrupted then
						circle:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
					end
					circle:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( circle, event )
					else
						circle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				circle:completeAnimation()
				self.circle:setAlpha( 0 )
				circleFrame2( circle, {} )
				local timerFrame2 = function ( timer, event )
					if not event.interrupted then
						timer:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
					end
					timer:setRGB( 0.77, 0.9, 0.88 )
					timer:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( timer, event )
					else
						timer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				timer:completeAnimation()
				self.timer:setRGB( 0.77, 0.9, 0.88 )
				self.timer:setAlpha( 0 )
				timerFrame2( timer, {} )
			end
		}
	}
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		LaunchGamePrototype( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "", nil )
		return false
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, state )
		if IsSelfInState( self, "Available" ) then
			MakeFocusable( self )
		else
			MakeNotFocusable( self, controller )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.timer:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

