CoD.CPFirstTimeFlowButton = InheritFrom( LUI.UIElement )
CoD.CPFirstTimeFlowButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CPFirstTimeFlowButton )
	self.id = "CPFirstTimeFlowButton"
	self.soundSet = "MultiplayerMain"
	self:setLeftRight( 0, 0, 0, 400 )
	self:setTopBottom( 0, 0, 0, 297 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local TextBox = LUI.UIText.new()
	TextBox:setLeftRight( 0, 0, 146, 681 )
	TextBox:setTopBottom( 0, 0, 163, 196 )
	TextBox:setRGB( 0.33, 0.95, 0.71 )
	TextBox:setAlpha( 0.3 )
	TextBox:setText( Engine.Localize( "MENU_START_YOUR_CAREER_CAPS" ) )
	TextBox:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	TextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox )
	self.TextBox = TextBox
	
	local arrow = LUI.UIImage.new()
	arrow:setLeftRight( 0, 0, 0, 180 )
	arrow:setTopBottom( 0, 0, 84, 264 )
	arrow:setRGB( 0.77, 0.9, 0.88 )
	arrow:setImage( RegisterImage( "uie_menu_icon_play_glow" ) )
	self:addElement( arrow )
	self.arrow = arrow
	
	local arrow2 = LUI.UIImage.new()
	arrow2:setLeftRight( 0, 0, 0, 180 )
	arrow2:setTopBottom( 0, 0, 84, 264 )
	arrow2:setRGB( 0.77, 0.9, 0.88 )
	arrow2:setAlpha( 0.2 )
	arrow2:setImage( RegisterImage( "uie_menu_icon_play_glow" ) )
	arrow2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( arrow2 )
	self.arrow2 = arrow2
	
	local frame = LUI.UIImage.new()
	frame:setLeftRight( 0, 0, -7, 197 )
	frame:setTopBottom( 0, 0, 72, 276 )
	frame:setAlpha( 0.4 )
	frame:setImage( RegisterImage( "uie_menu_icon_playframe_glow" ) )
	frame:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( frame )
	self.frame = frame
	
	self.resetProperties = function ()
		arrow2:completeAnimation()
		arrow:completeAnimation()
		TextBox:completeAnimation()
		frame:completeAnimation()
		arrow2:setAlpha( 0.2 )
		arrow2:setScale( 1 )
		arrow:setScale( 1 )
		TextBox:setLeftRight( 0, 0, 146, 681 )
		TextBox:setTopBottom( 0, 0, 163, 196 )
		TextBox:setAlpha( 0.3 )
		TextBox:setScale( 1 )
		frame:setAlpha( 0.4 )
		frame:setScale( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				arrow2:completeAnimation()
				self.arrow2:setAlpha( 0 )
				self.clipFinished( arrow2, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				local TextBoxFrame2 = function ( TextBox, event )
					if not event.interrupted then
						TextBox:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					TextBox:setLeftRight( 0, 0, 180, 715 )
					TextBox:setTopBottom( 0, 0, 163, 196 )
					TextBox:setAlpha( 0.8 )
					TextBox:setScale( 1.1 )
					if event.interrupted then
						self.clipFinished( TextBox, event )
					else
						TextBox:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TextBox:completeAnimation()
				self.TextBox:setLeftRight( 0, 0, 146, 681 )
				self.TextBox:setTopBottom( 0, 0, 163, 196 )
				self.TextBox:setAlpha( 0.3 )
				self.TextBox:setScale( 1 )
				TextBoxFrame2( TextBox, {} )
				local arrowFrame2 = function ( arrow, event )
					if not event.interrupted then
						arrow:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					arrow:setScale( 1.3 )
					if event.interrupted then
						self.clipFinished( arrow, event )
					else
						arrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				arrow:completeAnimation()
				self.arrow:setScale( 1 )
				arrowFrame2( arrow, {} )
				local arrow2Frame2 = function ( arrow2, event )
					if not event.interrupted then
						arrow2:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					arrow2:setAlpha( 0.3 )
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
				local frameFrame2 = function ( frame, event )
					if not event.interrupted then
						frame:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					frame:setAlpha( 0.45 )
					frame:setScale( 1.1 )
					if event.interrupted then
						self.clipFinished( frame, event )
					else
						frame:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				frame:completeAnimation()
				self.frame:setAlpha( 0.3 )
				self.frame:setScale( 1 )
				frameFrame2( frame, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				local TextBoxFrame2 = function ( TextBox, event )
					if not event.interrupted then
						TextBox:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					TextBox:setLeftRight( 0, 0, 146, 681 )
					TextBox:setTopBottom( 0, 0, 163, 196 )
					TextBox:setAlpha( 0.3 )
					TextBox:setScale( 1 )
					if event.interrupted then
						self.clipFinished( TextBox, event )
					else
						TextBox:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TextBox:completeAnimation()
				self.TextBox:setLeftRight( 0, 0, 180, 715 )
				self.TextBox:setTopBottom( 0, 0, 163, 196 )
				self.TextBox:setAlpha( 0.8 )
				self.TextBox:setScale( 1.1 )
				TextBoxFrame2( TextBox, {} )
				local arrowFrame2 = function ( arrow, event )
					if not event.interrupted then
						arrow:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					arrow:setScale( 1 )
					if event.interrupted then
						self.clipFinished( arrow, event )
					else
						arrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				arrow:completeAnimation()
				self.arrow:setScale( 1.3 )
				arrowFrame2( arrow, {} )
				local arrow2Frame2 = function ( arrow2, event )
					if not event.interrupted then
						arrow2:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
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
				self.arrow2:setAlpha( 0.3 )
				self.arrow2:setScale( 1.3 )
				arrow2Frame2( arrow2, {} )
				local frameFrame2 = function ( frame, event )
					if not event.interrupted then
						frame:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					frame:setAlpha( 0.3 )
					frame:setScale( 1 )
					if event.interrupted then
						self.clipFinished( frame, event )
					else
						frame:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				frame:completeAnimation()
				self.frame:setAlpha( 0.45 )
				self.frame:setScale( 1.1 )
				frameFrame2( frame, {} )
			end
		}
	}
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		OpenChangeFaction( self, element, controller, "", menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

