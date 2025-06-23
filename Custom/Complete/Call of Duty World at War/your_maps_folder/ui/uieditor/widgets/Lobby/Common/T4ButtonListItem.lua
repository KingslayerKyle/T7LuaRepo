CoD.T4ButtonListItem = InheritFrom( LUI.UIElement )
CoD.T4ButtonListItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.T4ButtonListItem )
	self.id = "T4ButtonListItem"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 300 )
	self:setTopBottom( true, false, 0, 31.5 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true

	self.Background = LUI.UIImage.new()
	self.Background:setLeftRight( true, true, 0, 0 )
	self.Background:setTopBottom( true, true, 0, 0 )
	self.Background:setImage( RegisterImage( "$white" ) )
	self.Background:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	self.Background:setShaderVector( 0.05, 0.5, 0.05, 0.5, 0 )
	self.Background:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( self.Background )

	self.DividerTop = LUI.UIImage.new()
	self.DividerTop:setLeftRight( true, true, 0, 0 )
	self.DividerTop:setTopBottom( true, false, 0, 2 )
	self.DividerTop:setImage( RegisterImage( "$white" ) )
	self.DividerTop:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	self.DividerTop:setShaderVector( 0, 0.2, 0.2, 0.2, 0.2 )
	self.DividerTop:setRGB( 0.7, 0.7, 0.7 )
	self:addElement( self.DividerTop )

	self.DividerBottom = LUI.UIImage.new()
	self.DividerBottom:setLeftRight( true, true, 0, 0 )
	self.DividerBottom:setTopBottom( false, true, -2, 0 )
	self.DividerBottom:setImage( RegisterImage( "$white" ) )
	self.DividerBottom:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	self.DividerBottom:setShaderVector( 0, 0.2, 0.2, 0.2, 0.2 )
	self.DividerBottom:setRGB( 0.7, 0.7, 0.7 )
	self:addElement( self.DividerBottom )
	
	self.btnDisplayTextShadow = LUI.UIText.new()
	self.btnDisplayTextShadow:setLeftRight( true, true, -100 + 0.5, 100 + 0.5 )
	self.btnDisplayTextShadow:setTopBottom( true, true, -13 + 0.5, 13 + 0.5 )
	self.btnDisplayTextShadow:setTTF( "fonts/itc_legacy_sans_bold.ttf" )
	self.btnDisplayTextShadow:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	self.btnDisplayTextShadow:setScale( 0.5 )
	self.btnDisplayTextShadow:setRGB( 0, 0, 0 )
	self.btnDisplayTextShadow:linkToElementModel( self, "displayText", true, function ( model ) 
		local displayText = Engine.GetModelValue( model )

		if displayText then
			self.btnDisplayTextShadow:setText( Engine.Localize( LocalizeToUpperString( displayText ) ) )
		end
	end )
	self:addElement( self.btnDisplayTextShadow )

	self.btnDisplayText = LUI.UIText.new()
	self.btnDisplayText:setLeftRight( true, true, -100, 100 )
	self.btnDisplayText:setTopBottom( true, true, -13, 13 )
	self.btnDisplayText:setTTF( "fonts/itc_legacy_sans_bold.ttf" )
	self.btnDisplayText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	self.btnDisplayText:setScale( 0.5 )
	self.btnDisplayText:linkToElementModel( self, "displayText", true, function ( model ) 
		local displayText = Engine.GetModelValue( model )

		if displayText then
			self.btnDisplayText:setText( Engine.Localize( LocalizeToUpperString( displayText ) ) )
		end
	end )
	self:addElement( self.btnDisplayText )
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				self.Background:completeAnimation()
				self.Background:setAlpha( 0.1 )
				self.clipFinished( self.Background, {} )

				self.DividerTop:completeAnimation()
				self.DividerTop:setAlpha( 0.05 )
				self.clipFinished( self.DividerTop, {} )

				self.DividerBottom:completeAnimation()
				self.DividerBottom:setAlpha( 0.05 )
				self.clipFinished( self.DividerBottom, {} )

				self.btnDisplayTextShadow:completeAnimation()
				self.btnDisplayTextShadow:setAlpha( 1 )
				self.clipFinished( self.btnDisplayTextShadow, {} )

				self.btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 1 )
				self.btnDisplayText:setRGB( 0.7, 0.7, 0.7 )
				self.clipFinished( self.btnDisplayText, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 5 )

				self.Background:completeAnimation()
				self.Background:setAlpha( 0.5 )
				self.clipFinished( self.Background, {} )

				self.DividerTop:completeAnimation()
				self.DividerTop:setAlpha( 1 )
				self.clipFinished( self.DividerTop, {} )

				self.DividerBottom:completeAnimation()
				self.DividerBottom:setAlpha( 1 )
				self.clipFinished( self.DividerBottom, {} )

				local BackgroundFocusAnimationStage2 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end

					element:setAlpha( 1 )

					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end

				local BackgroundFocusAnimationStage1 = function ( element, event )
					if event.interrupted then
						BackgroundFocusAnimationStage2( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )

						element:setAlpha( 0.5 )

						element:registerEventHandler( "transition_complete_keyframe", BackgroundFocusAnimationStage2 )
					end
				end

				self.btnDisplayTextShadow:completeAnimation()
				self.btnDisplayTextShadow:setAlpha( 1 )
				BackgroundFocusAnimationStage1( self.btnDisplayTextShadow, {} )

				self.btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 1 )
				self.btnDisplayText:setRGB( 0.95, 0.72, 0.21 )
				BackgroundFocusAnimationStage1( self.btnDisplayText, {} )

				self.nextClip = "Focus"
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Background:close()
		element.DividerTop:close()
		element.DividerBottom:close()
		element.btnDisplayTextShadow:close()
		element.btnDisplayText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
