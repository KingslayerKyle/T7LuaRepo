CoD.H1ButtonListItem = InheritFrom( LUI.UIElement )
CoD.H1ButtonListItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.H1ButtonListItem )
	self.id = "H1ButtonListItem"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 240 )
	self:setTopBottom( true, false, 0, 32 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true

	self.Background = LUI.UIImage.new()
	self.Background:setLeftRight( true, true, 0, 0 )
	self.Background:setTopBottom( true, true, 0, 0 )
	self.Background:setImage( RegisterImage( "h1_btn_unfocused" ) )
	self:addElement( self.Background )

	self.Glow1 = LUI.UIImage.new()
	self.Glow1:setLeftRight( true, true, 0, 0 )
	self.Glow1:setTopBottom( true, true, 0, 0 )
	self.Glow1:setImage( RegisterImage( "h1_btn_focused" ) )
	self:addElement( self.Glow1 )
	
	self.btnDisplayText = LUI.UIText.new()
	self.btnDisplayText:setLeftRight( true, true, -122.5, 200 )
	self.btnDisplayText:setTopBottom( true, true, 0, 0 )
	self.btnDisplayText:setTTF( "fonts/defaultbold.otf" )
	self.btnDisplayText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self.btnDisplayText:setScale( 0.5 )
	self.btnDisplayText:linkToElementModel( self, "displayText", true, function ( model ) 
		local displayText = Engine.GetModelValue( model )

		if displayText then
			self.btnDisplayText:setText( Engine.Localize( LocalizeToUpperString( displayText ) ) )
		end
	end )
	self:addElement( self.btnDisplayText )
	
	self.btnDisplayTextStroke = LUI.UIText.new()
	self.btnDisplayTextStroke:setLeftRight( true, true, -122.5, 200 )
	self.btnDisplayTextStroke:setTopBottom( true, true, 0, 0 )
	self.btnDisplayTextStroke:setTTF( "fonts/defaultbold.otf" )
	self.btnDisplayTextStroke:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self.btnDisplayTextStroke:setScale( 0.5 )
	self.btnDisplayTextStroke:linkToElementModel( self, "displayText", true, function ( model )
		local displayText = Engine.GetModelValue( model )

		if displayText then
			self.btnDisplayTextStroke:setText( Engine.Localize( LocalizeToUpperString( displayText ) ) )
		end
	end )
	self:addElement( self.btnDisplayTextStroke )
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				self.Background:completeAnimation()
				self.Background:setAlpha( 1 )
				self.clipFinished( self.Background, {} )

				self.Glow1:completeAnimation()
				self.Glow1:setAlpha( 0 )
				self.clipFinished( self.Glow1, {} )

				self.btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 0.5 )
				self.clipFinished( self.btnDisplayText, {} )

				self.btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setAlpha( 0 )
				self.clipFinished( self.btnDisplayTextStroke, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 4 )

				self.Background:completeAnimation()
				self.Background:setAlpha( 0 )
				self.clipFinished( self.Background, {} )

				self.Glow1:completeAnimation()
				self.Glow1:setAlpha( 1 )
				self.clipFinished( self.Glow1, {} )

				self.btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 0 )
				self.clipFinished( self.btnDisplayText, {} )

				self.btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setAlpha( 1 )
				self.clipFinished( self.btnDisplayTextStroke, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 2 )

				local btnDisplayTextFrame1 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end

					element:setAlpha( 0.5 )
					
					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				self.btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 0 )
				btnDisplayTextFrame1( self.btnDisplayText, {} )

				local btnDisplayTextStrokeFrame1 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end

					element:setAlpha( 0 )

					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				self.btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setAlpha( 1 )
				btnDisplayTextStrokeFrame1( self.btnDisplayTextStroke, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 2 )

				local btnDisplayTextFrame1 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end

					element:setAlpha( 0 )

					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				self.btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 0.5 )
				btnDisplayTextFrame1( self.btnDisplayText, {} )

				local btnDisplayTextStrokeFrame1 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end

					element:setAlpha( 1 )

					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				self.btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setAlpha( 0 )
				btnDisplayTextStrokeFrame1( self.btnDisplayTextStroke, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Background:close()
		element.Glow1:close()
		element.btnDisplayText:close()
		element.btnDisplayTextStroke:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
