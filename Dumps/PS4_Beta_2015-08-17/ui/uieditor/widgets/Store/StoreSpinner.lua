CoD.StoreSpinner = InheritFrom( LUI.UIElement )
CoD.StoreSpinner.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.StoreSpinner )
	self.id = "StoreSpinner"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 64 )
	self:setTopBottom( true, false, 0, 64 )
	
	local imgSpinner = LUI.UIImage.new()
	imgSpinner:setLeftRight( true, true, 0, 0 )
	imgSpinner:setTopBottom( true, true, 0, 0 )
	imgSpinner:setImage( RegisterImage( "uie_img_t7_menu_popup_spinner" ) )
	self:addElement( imgSpinner )
	self.imgSpinner = imgSpinner
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local imgSpinnerFrame2 = function ( imgSpinner, event )
					if not event.interrupted then
						imgSpinner:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					imgSpinner:setZRot( 360 )
					if event.interrupted then
						self.clipFinished( imgSpinner, event )
					else
						imgSpinner:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				imgSpinner:completeAnimation()
				self.imgSpinner:setZRot( 0 )
				imgSpinnerFrame2( imgSpinner, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

