-- 481b24cbaf2b92caf13eeb850664faa8
-- This hash is used for caching, delete to decompile the file again

CoD.AbilityWheel_IconHex = InheritFrom( LUI.UIElement )
CoD.AbilityWheel_IconHex.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.AbilityWheel_IconHex )
	self.id = "AbilityWheel_IconHex"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 82 )
	self:setTopBottom( true, false, 0, 95 )
	
	local IconHex0 = LUI.UIImage.new()
	IconHex0:setLeftRight( true, true, 0, 0.33 )
	IconHex0:setTopBottom( true, true, 0, 0 )
	IconHex0:setAlpha( RandomAddPercent( -10, 1 ) )
	IconHex0:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_iconhex" ) )
	self:addElement( IconHex0 )
	self.IconHex0 = IconHex0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local IconHex0Frame2 = function ( IconHex0, event )
					if not event.interrupted then
						IconHex0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
					end
					IconHex0:setAlpha( RandomAddPercent( -10, 1 ) )
					if event.interrupted then
						self.clipFinished( IconHex0, event )
					else
						IconHex0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				IconHex0:completeAnimation()
				self.IconHex0:setAlpha( RandomAddPercent( -10, 1 ) )
				IconHex0Frame2( IconHex0, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
