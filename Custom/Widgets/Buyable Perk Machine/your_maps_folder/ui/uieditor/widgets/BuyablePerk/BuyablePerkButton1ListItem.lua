CoD.BuyablePerkButton1ListItem = InheritFrom( LUI.UIElement )
CoD.BuyablePerkButton1ListItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BuyablePerkButton1ListItem )
	self.id = "BuyablePerkButton1ListItem"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 50 )
	self:setTopBottom( true, false, 0, 50 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true

	self.image = LUI.UIImage.new()
	self.image:setLeftRight( true, true, 0, 0 )
	self.image:setTopBottom( true, true, 0, 0 )
	self.image:setImage( RegisterImage( "blacktransparent" ) )
	self.image:linkToElementModel( self, "image", true, function ( model ) 
		local image = Engine.GetModelValue( model )

		if image then
			self.image:setImage( RegisterImage( image ) )
		end
	end )
	self.image:linkToElementModel( self, "hasPerk", true, function ( model ) 
		local hasPerk = Engine.GetModelValue( model )

		if hasPerk then
			self.image:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiply" ) )
		end
	end )
	self:addElement( self.image )
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				self.image:completeAnimation()
				self.image:setTopBottom( true, true, 0, 0 )
				self.clipFinished( self.image, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 1 )

				self.image:completeAnimation()
				self.image:setTopBottom( true, true, -10, -10 )
				self.clipFinished( self.image, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 1 )

				local imageLoseFocusFrame1 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end

					element:setTopBottom( true, true, 0, 0 )

					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				self.image:completeAnimation()
				self.image:setTopBottom( true, true, -10, -10 )
				imageLoseFocusFrame1( self.image, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 1 )

				local imageGainFocusFrame1 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end

					element:setTopBottom( true, true, -10, -10 )

					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				self.image:completeAnimation()
				self.image:setTopBottom( true, true, 0, 0 )
				imageGainFocusFrame1( self.image, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.image:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
