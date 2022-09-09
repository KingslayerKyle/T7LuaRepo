-- e130a86b91ed19559bac4fdd0816dd5c
-- This hash is used for caching, delete to decompile the file again

CoD.PulseRifleReticle_Numbers_Widget = InheritFrom( LUI.UIElement )
CoD.PulseRifleReticle_Numbers_Widget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.PulseRifleReticle_Numbers_Widget )
	self.id = "PulseRifleReticle_Numbers_Widget"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 96 )
	self:setTopBottom( true, false, 0, 144 )
	
	local Digit9 = LUI.UIImage.new()
	Digit9:setLeftRight( true, false, 0, 96 )
	Digit9:setTopBottom( true, false, 0, 144 )
	Digit9:setAlpha( 0 )
	Digit9:setImage( RegisterImage( "uie_t7_mp_hud_pulse_rnd_nmbr9" ) )
	self:addElement( Digit9 )
	self.Digit9 = Digit9
	
	local Digit8 = LUI.UIImage.new()
	Digit8:setLeftRight( true, false, 0, 96 )
	Digit8:setTopBottom( true, false, 0, 144 )
	Digit8:setAlpha( 0 )
	Digit8:setImage( RegisterImage( "uie_t7_mp_hud_pulse_rnd_nmbr8" ) )
	self:addElement( Digit8 )
	self.Digit8 = Digit8
	
	local Digit7 = LUI.UIImage.new()
	Digit7:setLeftRight( true, false, 0, 96 )
	Digit7:setTopBottom( true, false, 0, 144 )
	Digit7:setAlpha( 0 )
	Digit7:setImage( RegisterImage( "uie_t7_mp_hud_pulse_rnd_nmbr7" ) )
	self:addElement( Digit7 )
	self.Digit7 = Digit7
	
	local Digit6 = LUI.UIImage.new()
	Digit6:setLeftRight( true, false, 0, 96 )
	Digit6:setTopBottom( true, false, 0, 144 )
	Digit6:setAlpha( 0 )
	Digit6:setImage( RegisterImage( "uie_t7_mp_hud_pulse_rnd_nmbr6" ) )
	self:addElement( Digit6 )
	self.Digit6 = Digit6
	
	local Digit5 = LUI.UIImage.new()
	Digit5:setLeftRight( true, false, 0, 96 )
	Digit5:setTopBottom( true, false, 0, 144 )
	Digit5:setAlpha( 0 )
	Digit5:setImage( RegisterImage( "uie_t7_mp_hud_pulse_rnd_nmbr5" ) )
	self:addElement( Digit5 )
	self.Digit5 = Digit5
	
	local Digit4 = LUI.UIImage.new()
	Digit4:setLeftRight( true, false, 0, 96 )
	Digit4:setTopBottom( true, false, 0, 144 )
	Digit4:setAlpha( 0 )
	Digit4:setImage( RegisterImage( "uie_t7_mp_hud_pulse_rnd_nmbr4" ) )
	self:addElement( Digit4 )
	self.Digit4 = Digit4
	
	local Digit3 = LUI.UIImage.new()
	Digit3:setLeftRight( true, false, 0, 96 )
	Digit3:setTopBottom( true, false, 0, 144 )
	Digit3:setAlpha( 0 )
	Digit3:setImage( RegisterImage( "uie_t7_mp_hud_pulse_rnd_nmbr3" ) )
	self:addElement( Digit3 )
	self.Digit3 = Digit3
	
	local Digit2 = LUI.UIImage.new()
	Digit2:setLeftRight( true, false, 0, 96 )
	Digit2:setTopBottom( true, false, 0, 144 )
	Digit2:setAlpha( 0 )
	Digit2:setImage( RegisterImage( "uie_t7_mp_hud_pulse_rnd_nmbr2" ) )
	self:addElement( Digit2 )
	self.Digit2 = Digit2
	
	local Digit1 = LUI.UIImage.new()
	Digit1:setLeftRight( true, false, 0, 96 )
	Digit1:setTopBottom( true, false, 0, 144 )
	Digit1:setAlpha( 0 )
	Digit1:setImage( RegisterImage( "uie_t7_mp_hud_pulse_rnd_nmbr1" ) )
	self:addElement( Digit1 )
	self.Digit1 = Digit1
	
	local Digit0 = LUI.UIImage.new()
	Digit0:setLeftRight( true, false, 0, 96 )
	Digit0:setTopBottom( true, false, 0, 144 )
	Digit0:setImage( RegisterImage( "uie_t7_mp_hud_pulse_rnd_nmbr0" ) )
	self:addElement( Digit0 )
	self.Digit0 = Digit0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		One = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )

				Digit9:completeAnimation()
				self.Digit9:setAlpha( 0 )
				self.clipFinished( Digit9, {} )

				Digit8:completeAnimation()
				self.Digit8:setAlpha( 0 )
				self.clipFinished( Digit8, {} )

				Digit7:completeAnimation()
				self.Digit7:setAlpha( 0 )
				self.clipFinished( Digit7, {} )

				Digit6:completeAnimation()
				self.Digit6:setAlpha( 0 )
				self.clipFinished( Digit6, {} )

				Digit5:completeAnimation()
				self.Digit5:setAlpha( 0 )
				self.clipFinished( Digit5, {} )

				Digit4:completeAnimation()
				self.Digit4:setAlpha( 0 )
				self.clipFinished( Digit4, {} )

				Digit3:completeAnimation()
				self.Digit3:setAlpha( 0 )
				self.clipFinished( Digit3, {} )

				Digit2:completeAnimation()
				self.Digit2:setAlpha( 0 )
				self.clipFinished( Digit2, {} )

				Digit1:completeAnimation()
				self.Digit1:setAlpha( 1 )
				self.clipFinished( Digit1, {} )

				Digit0:completeAnimation()
				self.Digit0:setAlpha( 0 )
				self.clipFinished( Digit0, {} )
			end
		},
		Two = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )

				Digit9:completeAnimation()
				self.Digit9:setAlpha( 0 )
				self.clipFinished( Digit9, {} )

				Digit8:completeAnimation()
				self.Digit8:setAlpha( 0 )
				self.clipFinished( Digit8, {} )

				Digit7:completeAnimation()
				self.Digit7:setAlpha( 0 )
				self.clipFinished( Digit7, {} )

				Digit6:completeAnimation()
				self.Digit6:setAlpha( 0 )
				self.clipFinished( Digit6, {} )

				Digit5:completeAnimation()
				self.Digit5:setAlpha( 0 )
				self.clipFinished( Digit5, {} )

				Digit4:completeAnimation()
				self.Digit4:setAlpha( 0 )
				self.clipFinished( Digit4, {} )

				Digit3:completeAnimation()
				self.Digit3:setAlpha( 0 )
				self.clipFinished( Digit3, {} )

				Digit2:completeAnimation()
				self.Digit2:setAlpha( 1 )
				self.clipFinished( Digit2, {} )

				Digit1:completeAnimation()
				self.Digit1:setAlpha( 0 )
				self.clipFinished( Digit1, {} )

				Digit0:completeAnimation()
				self.Digit0:setAlpha( 0 )
				self.clipFinished( Digit0, {} )
			end
		},
		Three = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )

				Digit9:completeAnimation()
				self.Digit9:setAlpha( 0 )
				self.clipFinished( Digit9, {} )

				Digit8:completeAnimation()
				self.Digit8:setAlpha( 0 )
				self.clipFinished( Digit8, {} )

				Digit7:completeAnimation()
				self.Digit7:setAlpha( 0 )
				self.clipFinished( Digit7, {} )

				Digit6:completeAnimation()
				self.Digit6:setAlpha( 0 )
				self.clipFinished( Digit6, {} )

				Digit5:completeAnimation()
				self.Digit5:setAlpha( 0 )
				self.clipFinished( Digit5, {} )

				Digit4:completeAnimation()
				self.Digit4:setAlpha( 0 )
				self.clipFinished( Digit4, {} )

				Digit3:completeAnimation()
				self.Digit3:setAlpha( 1 )
				self.clipFinished( Digit3, {} )

				Digit2:completeAnimation()
				self.Digit2:setAlpha( 0 )
				self.clipFinished( Digit2, {} )

				Digit1:completeAnimation()
				self.Digit1:setAlpha( 0 )
				self.clipFinished( Digit1, {} )

				Digit0:completeAnimation()
				self.Digit0:setAlpha( 0 )
				self.clipFinished( Digit0, {} )
			end
		},
		Four = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )

				Digit9:completeAnimation()
				self.Digit9:setAlpha( 0 )
				self.clipFinished( Digit9, {} )

				Digit8:completeAnimation()
				self.Digit8:setAlpha( 0 )
				self.clipFinished( Digit8, {} )

				Digit7:completeAnimation()
				self.Digit7:setAlpha( 0 )
				self.clipFinished( Digit7, {} )

				Digit6:completeAnimation()
				self.Digit6:setAlpha( 0 )
				self.clipFinished( Digit6, {} )

				Digit5:completeAnimation()
				self.Digit5:setAlpha( 0 )
				self.clipFinished( Digit5, {} )

				Digit4:completeAnimation()
				self.Digit4:setAlpha( 1 )
				self.clipFinished( Digit4, {} )

				Digit3:completeAnimation()
				self.Digit3:setAlpha( 0 )
				self.clipFinished( Digit3, {} )

				Digit2:completeAnimation()
				self.Digit2:setAlpha( 0 )
				self.clipFinished( Digit2, {} )

				Digit1:completeAnimation()
				self.Digit1:setAlpha( 0 )
				self.clipFinished( Digit1, {} )

				Digit0:completeAnimation()
				self.Digit0:setAlpha( 0 )
				self.clipFinished( Digit0, {} )
			end
		},
		Five = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )

				Digit9:completeAnimation()
				self.Digit9:setAlpha( 0 )
				self.clipFinished( Digit9, {} )

				Digit8:completeAnimation()
				self.Digit8:setAlpha( 0 )
				self.clipFinished( Digit8, {} )

				Digit7:completeAnimation()
				self.Digit7:setAlpha( 0 )
				self.clipFinished( Digit7, {} )

				Digit6:completeAnimation()
				self.Digit6:setAlpha( 0 )
				self.clipFinished( Digit6, {} )

				Digit5:completeAnimation()
				self.Digit5:setAlpha( 1 )
				self.clipFinished( Digit5, {} )

				Digit4:completeAnimation()
				self.Digit4:setAlpha( 0 )
				self.clipFinished( Digit4, {} )

				Digit3:completeAnimation()
				self.Digit3:setAlpha( 0 )
				self.clipFinished( Digit3, {} )

				Digit2:completeAnimation()
				self.Digit2:setAlpha( 0 )
				self.clipFinished( Digit2, {} )

				Digit1:completeAnimation()
				self.Digit1:setAlpha( 0 )
				self.clipFinished( Digit1, {} )

				Digit0:completeAnimation()
				self.Digit0:setAlpha( 0 )
				self.clipFinished( Digit0, {} )
			end
		},
		Six = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )

				Digit9:completeAnimation()
				self.Digit9:setAlpha( 0 )
				self.clipFinished( Digit9, {} )

				Digit8:completeAnimation()
				self.Digit8:setAlpha( 0 )
				self.clipFinished( Digit8, {} )

				Digit7:completeAnimation()
				self.Digit7:setAlpha( 0 )
				self.clipFinished( Digit7, {} )

				Digit6:completeAnimation()
				self.Digit6:setAlpha( 1 )
				self.clipFinished( Digit6, {} )

				Digit5:completeAnimation()
				self.Digit5:setAlpha( 0 )
				self.clipFinished( Digit5, {} )

				Digit4:completeAnimation()
				self.Digit4:setAlpha( 0 )
				self.clipFinished( Digit4, {} )

				Digit3:completeAnimation()
				self.Digit3:setAlpha( 0 )
				self.clipFinished( Digit3, {} )

				Digit2:completeAnimation()
				self.Digit2:setAlpha( 0 )
				self.clipFinished( Digit2, {} )

				Digit1:completeAnimation()
				self.Digit1:setAlpha( 0 )
				self.clipFinished( Digit1, {} )

				Digit0:completeAnimation()
				self.Digit0:setAlpha( 0 )
				self.clipFinished( Digit0, {} )
			end
		},
		Seven = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )

				Digit9:completeAnimation()
				self.Digit9:setAlpha( 0 )
				self.clipFinished( Digit9, {} )

				Digit8:completeAnimation()
				self.Digit8:setAlpha( 0 )
				self.clipFinished( Digit8, {} )

				Digit7:completeAnimation()
				self.Digit7:setAlpha( 1 )
				self.clipFinished( Digit7, {} )

				Digit6:completeAnimation()
				self.Digit6:setAlpha( 0 )
				self.clipFinished( Digit6, {} )

				Digit5:completeAnimation()
				self.Digit5:setAlpha( 0 )
				self.clipFinished( Digit5, {} )

				Digit4:completeAnimation()
				self.Digit4:setAlpha( 0 )
				self.clipFinished( Digit4, {} )

				Digit3:completeAnimation()
				self.Digit3:setAlpha( 0 )
				self.clipFinished( Digit3, {} )

				Digit2:completeAnimation()
				self.Digit2:setAlpha( 0 )
				self.clipFinished( Digit2, {} )

				Digit1:completeAnimation()
				self.Digit1:setAlpha( 0 )
				self.clipFinished( Digit1, {} )

				Digit0:completeAnimation()
				self.Digit0:setAlpha( 0 )
				self.clipFinished( Digit0, {} )
			end
		},
		Eight = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )

				Digit9:completeAnimation()
				self.Digit9:setAlpha( 0 )
				self.clipFinished( Digit9, {} )

				Digit8:completeAnimation()
				self.Digit8:setAlpha( 1 )
				self.clipFinished( Digit8, {} )

				Digit7:completeAnimation()
				self.Digit7:setAlpha( 0 )
				self.clipFinished( Digit7, {} )

				Digit6:completeAnimation()
				self.Digit6:setAlpha( 0 )
				self.clipFinished( Digit6, {} )

				Digit5:completeAnimation()
				self.Digit5:setAlpha( 0 )
				self.clipFinished( Digit5, {} )

				Digit4:completeAnimation()
				self.Digit4:setAlpha( 0 )
				self.clipFinished( Digit4, {} )

				Digit3:completeAnimation()
				self.Digit3:setAlpha( 0 )
				self.clipFinished( Digit3, {} )

				Digit2:completeAnimation()
				self.Digit2:setAlpha( 0 )
				self.clipFinished( Digit2, {} )

				Digit1:completeAnimation()
				self.Digit1:setAlpha( 0 )
				self.clipFinished( Digit1, {} )

				Digit0:completeAnimation()
				self.Digit0:setAlpha( 0 )
				self.clipFinished( Digit0, {} )
			end
		},
		Nine = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )

				Digit9:completeAnimation()
				self.Digit9:setAlpha( 1 )
				self.clipFinished( Digit9, {} )

				Digit8:completeAnimation()
				self.Digit8:setAlpha( 0 )
				self.clipFinished( Digit8, {} )

				Digit7:completeAnimation()
				self.Digit7:setAlpha( 0 )
				self.clipFinished( Digit7, {} )

				Digit6:completeAnimation()
				self.Digit6:setAlpha( 0 )
				self.clipFinished( Digit6, {} )

				Digit5:completeAnimation()
				self.Digit5:setAlpha( 0 )
				self.clipFinished( Digit5, {} )

				Digit4:completeAnimation()
				self.Digit4:setAlpha( 0 )
				self.clipFinished( Digit4, {} )

				Digit3:completeAnimation()
				self.Digit3:setAlpha( 0 )
				self.clipFinished( Digit3, {} )

				Digit2:completeAnimation()
				self.Digit2:setAlpha( 0 )
				self.clipFinished( Digit2, {} )

				Digit1:completeAnimation()
				self.Digit1:setAlpha( 0 )
				self.clipFinished( Digit1, {} )

				Digit0:completeAnimation()
				self.Digit0:setAlpha( 0 )
				self.clipFinished( Digit0, {} )
			end
		},
		Zero = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )

				Digit9:completeAnimation()
				self.Digit9:setAlpha( 0 )
				self.clipFinished( Digit9, {} )

				Digit8:completeAnimation()
				self.Digit8:setAlpha( 0 )
				self.clipFinished( Digit8, {} )

				Digit7:completeAnimation()
				self.Digit7:setAlpha( 0 )
				self.clipFinished( Digit7, {} )

				Digit6:completeAnimation()
				self.Digit6:setAlpha( 0 )
				self.clipFinished( Digit6, {} )

				Digit5:completeAnimation()
				self.Digit5:setAlpha( 0 )
				self.clipFinished( Digit5, {} )

				Digit4:completeAnimation()
				self.Digit4:setAlpha( 0 )
				self.clipFinished( Digit4, {} )

				Digit3:completeAnimation()
				self.Digit3:setAlpha( 0 )
				self.clipFinished( Digit3, {} )

				Digit2:completeAnimation()
				self.Digit2:setAlpha( 0 )
				self.clipFinished( Digit2, {} )

				Digit1:completeAnimation()
				self.Digit1:setAlpha( 0 )
				self.clipFinished( Digit1, {} )

				Digit0:completeAnimation()
				self.Digit0:setAlpha( 1 )
				self.clipFinished( Digit0, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
