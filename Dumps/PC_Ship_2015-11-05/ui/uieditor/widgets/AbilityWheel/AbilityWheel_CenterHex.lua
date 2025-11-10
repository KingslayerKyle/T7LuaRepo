CoD.AbilityWheel_CenterHex = InheritFrom( LUI.UIElement )
CoD.AbilityWheel_CenterHex.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AbilityWheel_CenterHex )
	self.id = "AbilityWheel_CenterHex"
	self.soundSet = "AbilityWheel"
	self:setLeftRight( true, false, 0, 288 )
	self:setTopBottom( true, false, 0, 328 )
	
	local HexCenter0 = LUI.UIImage.new()
	HexCenter0:setLeftRight( false, false, -144, 144 )
	HexCenter0:setTopBottom( false, false, -164, 164 )
	HexCenter0:setAlpha( RandomAddPercent( -60, 0.99 ) )
	HexCenter0:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_hexcenter" ) )
	HexCenter0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( HexCenter0 )
	self.HexCenter0 = HexCenter0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local HexCenter0Frame2 = function ( HexCenter0, event )
					if not event.interrupted then
						HexCenter0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
					end
					HexCenter0:setAlpha( RandomAddPercent( -60, 0.99 ) )
					if event.interrupted then
						self.clipFinished( HexCenter0, event )
					else
						HexCenter0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HexCenter0:completeAnimation()
				self.HexCenter0:setAlpha( RandomAddPercent( -60, 1 ) )
				HexCenter0Frame2( HexCenter0, {} )
			end,
			Close = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

