CoD.IW7ButtonListItem = InheritFrom( LUI.UIElement )
CoD.IW7ButtonListItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.IW7ButtonListItem )
	self.id = "IW7ButtonListItem"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 212 )
	self:setTopBottom( true, false, 0, 17 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true

	self.Background = LUI.UIImage.new()
	self.Background:setLeftRight( true, true, 0, 0 )
	self.Background:setTopBottom( true, true, 0, 0 )
	self.Background:setImage( RegisterImage( "$white" ) )
	self.Background:setRGB( 0, 0, 0 )
	self.Background:setAlpha( 0.5 )
	self:addElement( self.Background )

	self.Glow1 = LUI.UIImage.new()
	self.Glow1:setLeftRight( true, true, -10, 10 )
	self.Glow1:setTopBottom( true, true, -5, 5 )
	self.Glow1:setImage( RegisterImage( "cp_main_button_background" ) )
	self.Glow1:setAlpha( 0.7 )
	self:addElement( self.Glow1 )

	self.Glow2 = LUI.UIImage.new()
	self.Glow2:setLeftRight( true, true, -5, 5 )
	self.Glow2:setTopBottom( true, true, 0, 0 )
	self.Glow2:setImage( RegisterImage( "cp_main_button_glow" ) )
	self.Glow2:setAlpha( 0.7 )
	self:addElement( self.Glow2 )

	self.Blood = LUI.UIImage.new()
	self.Blood:setLeftRight( true, false, -50, 60 )
	self.Blood:setTopBottom( true, false, -50, 60 )
	self.Blood:setImage( RegisterImage( "cp_main_button_blood_splatter" ) )
	self.Blood:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self.Blood:setAlpha( 0.7 )
	self:addElement( self.Blood )
	
	self.btnDisplayText = LUI.UIText.new()
	self.btnDisplayText:setLeftRight( true, true, 0, 0 )
	self.btnDisplayText:setTopBottom( true, true, 0, 0 )
	self.btnDisplayText:setTTF( "fonts/blender_pro_medium.ttf" )
	self.btnDisplayText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self.btnDisplayText:setScale( 0.9 )
	self.btnDisplayText:linkToElementModel( self, "displayText", true, function ( model ) 
		local displayText = Engine.GetModelValue( model )

		if displayText then
			self.btnDisplayText:setText( Engine.Localize( LocalizeToUpperString( displayText ) ) )
		end
	end )
	self:addElement( self.btnDisplayText )
	
	self.btnDisplayTextStroke = LUI.UIText.new()
	self.btnDisplayTextStroke:setLeftRight( true, true, 0, 0 )
	self.btnDisplayTextStroke:setTopBottom( true, true, 0, 0 )
	self.btnDisplayTextStroke:setTTF( "fonts/blender_pro_medium.ttf" )
	self.btnDisplayTextStroke:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self.btnDisplayTextStroke:setScale( 0.9 )
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
				self:setupElementClipCounter( 6 )

				self.Background:completeAnimation()
				self.Background:setAlpha( 0.5 )
				self.clipFinished( self.Background, {} )

				self.Glow1:completeAnimation()
				self.Glow1:setAlpha( 0 )
				self.clipFinished( self.Glow1, {} )

				self.Glow2:completeAnimation()
				self.Glow2:setAlpha( 0 )
				self.clipFinished( self.Glow2, {} )

				self.Blood:completeAnimation()
				self.Blood:setAlpha( 0 )
				self.clipFinished( self.Blood, {} )

				self.btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 1 )
				self.btnDisplayText:setZoom( 0 )
				self.clipFinished( self.btnDisplayText, {} )

				self.btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setAlpha( 0 )
				self.btnDisplayTextStroke:setZoom( 0 )
				self.clipFinished( self.btnDisplayTextStroke, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 6 )

				self.Background:completeAnimation()
				self.Background:setAlpha( 0 )
				self.clipFinished( self.Background, {} )

				self.Glow1:completeAnimation()
				self.Glow1:setAlpha( 0.7 )
				self.clipFinished( self.Glow1, {} )

				self.Glow2:completeAnimation()
				self.Glow2:setAlpha( 0.7 )
				self.clipFinished( self.Glow2, {} )

				self.Blood:completeAnimation()
				self.Blood:setAlpha( 0.7 )
				self.clipFinished( self.Blood, {} )

				self.btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 0 )
				self.btnDisplayText:setZoom( -305 )
				self.clipFinished( self.btnDisplayText, {} )

				self.btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setAlpha( 1 )
				self.btnDisplayTextStroke:setZoom( 10 )
				self.clipFinished( self.btnDisplayTextStroke, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 2 )

				local btnDisplayTextFrame1 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end

					element:setAlpha( 1 )
					element:setZoom( 0 )
					
					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				self.btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 0 )
				self.btnDisplayText:setZoom( 10 )
				btnDisplayTextFrame1( self.btnDisplayText, {} )

				local btnDisplayTextStrokeFrame1 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end

					element:setAlpha( 0 )
					element:setZoom( 0 )

					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				self.btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setAlpha( 1 )
				self.btnDisplayTextStroke:setZoom( 10 )
				btnDisplayTextStrokeFrame1( self.btnDisplayTextStroke, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 2 )

				local btnDisplayTextFrame1 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end

					element:setAlpha( 0 )
					element:setZoom( 10 )

					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				self.btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 1 )
				self.btnDisplayText:setZoom( 0 )
				btnDisplayTextFrame1( self.btnDisplayText, {} )

				local btnDisplayTextStrokeFrame1 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end

					element:setAlpha( 1 )
					element:setZoom( 10 )

					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				self.btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setAlpha( 0 )
				self.btnDisplayTextStroke:setZoom( 0 )
				btnDisplayTextStrokeFrame1( self.btnDisplayTextStroke, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Background:close()
		element.Glow1:close()
		element.Glow2:close()
		element.Blood:close()
		element.btnDisplayText:close()
		element.btnDisplayTextStroke:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
