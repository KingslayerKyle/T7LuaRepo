CoD.BM_TradeAgainFocus = InheritFrom( LUI.UIElement )
CoD.BM_TradeAgainFocus.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BM_TradeAgainFocus )
	self.id = "BM_TradeAgainFocus"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 144 )
	self:setTopBottom( true, false, 0, 384 )
	
	local Framefocus = LUI.UIImage.new()
	Framefocus:setLeftRight( true, false, 0, 144 )
	Framefocus:setTopBottom( true, false, 0, 384 )
	Framefocus:setAlpha( 0 )
	Framefocus:setImage( RegisterImage( "uie_t7_blackmarket_framefocus" ) )
	self:addElement( Framefocus )
	self.Framefocus = Framefocus
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Framefocus:completeAnimation()
				self.Framefocus:setAlpha( 0 )
				self.clipFinished( Framefocus, {} )
			end
		},
		Highlighted = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local FramefocusFrame2 = function ( Framefocus, event )
					if not event.interrupted then
						Framefocus:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
					end
					Framefocus:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Framefocus, event )
					else
						Framefocus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Framefocus:completeAnimation()
				self.Framefocus:setAlpha( 0 )
				FramefocusFrame2( Framefocus, {} )
			end
		},
		Off = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local FramefocusFrame2 = function ( Framefocus, event )
					if not event.interrupted then
						Framefocus:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
					end
					Framefocus:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Framefocus, event )
					else
						Framefocus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Framefocus:completeAnimation()
				self.Framefocus:setAlpha( 0.7 )
				FramefocusFrame2( Framefocus, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

