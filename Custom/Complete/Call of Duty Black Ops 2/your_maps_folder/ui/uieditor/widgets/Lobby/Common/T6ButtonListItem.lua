CoD.T6ButtonListItem = InheritFrom( LUI.UIElement )
CoD.T6ButtonListItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.T6ButtonListItem )
	self.id = "T6ButtonListItem"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 160 )
	self:setTopBottom( true, false, 0, 31 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true

	self.Brackets1 = LUI.UIImage.new()
	self.Brackets1:setLeftRight( true, false, 0 - 2, 75 - 2 )
	self.Brackets1:setTopBottom( true, true, 0, 0 )
	self.Brackets1:setImage( RegisterImage( "menu_vis_bracket_small_zm" ) )
	self.Brackets1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( self.Brackets1 )

	self.Brackets2 = LUI.UIImage.new()
	self.Brackets2:setLeftRight( false, true, -75 + 2, 0 + 2 )
	self.Brackets2:setTopBottom( true, true, 0 + 2, 0 - 2 )
	self.Brackets2:setImage( RegisterImage( "menu_vis_bracket_small_zm" ) )
	self.Brackets2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self.Brackets2:setZRot( 180 )
	self:addElement( self.Brackets2 )
	
	self.btnDisplayText = LUI.UIText.new()
	self.btnDisplayText:setLeftRight( true, true, 0, 0 )
	self.btnDisplayText:setTopBottom( true, true, 0, 0 )
	self.btnDisplayText:setTTF( "fonts/bigFont.ttf" )
	self.btnDisplayText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
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
	self.btnDisplayTextStroke:setTTF( "fonts/bigFont.ttf" )
	self.btnDisplayTextStroke:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
	self.btnDisplayTextStroke:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
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
				self:setupElementClipCounter( 4 )

				self.Brackets1:completeAnimation()
				self.Brackets1:setAlpha( 0 )
				self.clipFinished( self.Brackets1, {} )

				self.Brackets2:completeAnimation()
				self.Brackets2:setAlpha( 0 )
				self.clipFinished( self.Brackets2, {} )

				self.btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 1 )
				self.clipFinished( self.btnDisplayText, {} )

				self.btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setAlpha( 0 )
				self.clipFinished( self.btnDisplayTextStroke, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 4 )

				self.Brackets1:completeAnimation()
				self.Brackets1:setAlpha( 1 )
				self.clipFinished( self.Brackets1, {} )

				self.Brackets2:completeAnimation()
				self.Brackets2:setAlpha( 1 )
				self.clipFinished( self.Brackets2, {} )

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
						element:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end

					element:setAlpha( 1 )
					
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
						element:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
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
						element:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end

					element:setAlpha( 0 )

					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				self.btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 1 )
				btnDisplayTextFrame1( self.btnDisplayText, {} )

				local btnDisplayTextStrokeFrame1 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
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
		element.Brackets1:close()
		element.Brackets2:close()
		element.btnDisplayText:close()
		element.btnDisplayTextStroke:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
