CoD.SplitscreenSignInRow = InheritFrom( LUI.UIElement )
CoD.SplitscreenSignInRow.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.SplitscreenSignInRow )
	self.id = "SplitscreenSignInRow"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 360 )
	self:setTopBottom( true, false, 0, 25 )
	
	local gradientbackground = LUI.UIImage.new()
	gradientbackground:setLeftRight( true, true, 0, 0 )
	gradientbackground:setTopBottom( true, true, 25, -25 )
	gradientbackground:setRGB( 1, 1, 1 )
	gradientbackground:setAlpha( 0.2 )
	gradientbackground:setImage( RegisterImage( "uie_mp_cac_grad_stretch" ) )
	gradientbackground:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( gradientbackground )
	self.gradientbackground = gradientbackground
	
	local label = LUI.UITightText.new()
	label:setLeftRight( true, true, 27, -27 )
	label:setTopBottom( false, false, -13.5, 11.5 )
	label:setRGB( 1, 1, 1 )
	label:setText( Engine.Localize( "PLATFORM_FEEDER_SECONDARY_CONTROLLER_PLAY" ) )
	label:setTTF( "fonts/default.ttf" )
	self:addElement( label )
	self.label = label
	
	local highlight = LUI.UIImage.new()
	highlight:setLeftRight( true, true, 1, -1 )
	highlight:setTopBottom( true, true, 1, -16 )
	highlight:setRGB( 1, 1, 1 )
	highlight:setAlpha( 0.44 )
	highlight:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( highlight )
	self.highlight = highlight
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		WaitingForController = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				label:completeAnimation()
				self.label:setText( Engine.Localize( "PLATFORM_FEEDER_SECONDARY_CONTROLLER_PLUGIN" ) )
				self.clipFinished( label, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

