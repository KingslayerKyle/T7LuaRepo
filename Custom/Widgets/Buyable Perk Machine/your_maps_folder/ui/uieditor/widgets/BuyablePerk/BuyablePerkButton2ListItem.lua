CoD.BuyablePerkButton2ListItem = InheritFrom( LUI.UIElement )
CoD.BuyablePerkButton2ListItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BuyablePerkButton2ListItem )
	self.id = "BuyablePerkButton2ListItem"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 120 )
	self:setTopBottom( true, false, 0, 30 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true

	self.image = LUI.UIImage.new()
	self.image:setLeftRight( true, true, 0, 0 )
	self.image:setTopBottom( true, true, 0, 0 )
	self.image:setImage( RegisterImage( "$white" ) )
	self.image:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	self.image:setShaderVector( 0, 0.25, 0.25, 0.25, 0.25 )
	self.image:setRGB( 0, 0, 0 )
	self.image:setAlpha( 0.5 )
	self:addElement( self.image )

	self.text = LUI.UIText.new()
	self.text:setLeftRight( true, true, 0, 0 )
	self.text:setTopBottom( true, true, -5, 5 )
	self.text:setText( Engine.Localize( "" ) )
	self.text:setTTF( "fonts/escom.ttf" )
	self.text:setScale( 0.5 )
	self.text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self.text:linkToElementModel( self, "text", true, function ( model ) 
		local text = Engine.GetModelValue( model )

		if text then
			self.text:setText( Engine.Localize( text ) )
		end
	end )
	self:addElement( self.text )
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				self.image:completeAnimation()
				self.image:setRGB( 0, 0, 0 )
				self.clipFinished( self.image, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 1 )

				self.image:completeAnimation()
				self.image:setRGB( 0.3, 0.3, 0.3 )
				self.clipFinished( self.image, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 1 )

				local imageLoseFocusFrame1 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end

					element:setRGB( 0, 0, 0 )

					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				self.image:completeAnimation()
				self.image:setRGB( 0.3, 0.3, 0.3 )
				imageLoseFocusFrame1( self.image, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 1 )

				local imageGainFocusFrame1 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end

					element:setRGB( 0.3, 0.3, 0.3 )

					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				self.image:completeAnimation()
				self.image:setRGB( 0, 0, 0 )
				imageGainFocusFrame1( self.image, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.image:close()
		element.text:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
