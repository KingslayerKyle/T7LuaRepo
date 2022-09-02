-- 1a3b7e1a502495934d3411abb41c0d61
-- This hash is used for caching, delete to decompile the file again

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:setHandleMouse( true )
end

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		f0_local0( self, controller, menu )
	end
end

CoD.FileshareArrow = InheritFrom( LUI.UIElement )
CoD.FileshareArrow.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.FileshareArrow )
	self.id = "FileshareArrow"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 60 )
	self:setTopBottom( true, false, 0, 60 )
	
	local ArrowR = LUI.UIImage.new()
	ArrowR:setLeftRight( true, false, 0, 60 )
	ArrowR:setTopBottom( true, false, 0, 60 )
	ArrowR:setScale( 1.2 )
	ArrowR:setImage( RegisterImage( "uie_t7_icon_menu_options_arrow" ) )
	self:addElement( ArrowR )
	self.ArrowR = ArrowR
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				ArrowR:completeAnimation()
				self.ArrowR:setRGB( 1, 1, 1 )
				self.ArrowR:setAlpha( 0.2 )
				self.ArrowR:setScale( 0.8 )
				self.clipFinished( ArrowR, {} )
			end
		},
		Hide = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local ArrowRFrame2 = function ( ArrowR, event )
					if not event.interrupted then
						ArrowR:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
					end
					ArrowR:setRGB( 1, 1, 1 )
					ArrowR:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ArrowR, event )
					else
						ArrowR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ArrowR:completeAnimation()
				self.ArrowR:setRGB( 1, 1, 1 )
				self.ArrowR:setAlpha( 0 )
				ArrowRFrame2( ArrowR, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local ArrowRFrame2 = function ( ArrowR, event )
					if not event.interrupted then
						ArrowR:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
					end
					ArrowR:setRGB( 1, 1, 1 )
					ArrowR:setAlpha( 1 )
					ArrowR:setScale( 1.2 )
					if event.interrupted then
						self.clipFinished( ArrowR, event )
					else
						ArrowR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ArrowR:completeAnimation()
				self.ArrowR:setRGB( 1, 1, 1 )
				self.ArrowR:setAlpha( 0.2 )
				self.ArrowR:setScale( 0.8 )
				ArrowRFrame2( ArrowR, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 1 )

				local ArrowRFrame2 = function ( ArrowR, event )
					if not event.interrupted then
						ArrowR:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
					end
					ArrowR:setRGB( 1, 0.46, 0 )
					ArrowR:setAlpha( 1 )
					ArrowR:setScale( 1.2 )
					if event.interrupted then
						self.clipFinished( ArrowR, event )
					else
						ArrowR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ArrowR:completeAnimation()
				self.ArrowR:setRGB( 1, 0.46, 0 )
				self.ArrowR:setAlpha( 0.2 )
				self.ArrowR:setScale( 0.8 )
				ArrowRFrame2( ArrowR, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

