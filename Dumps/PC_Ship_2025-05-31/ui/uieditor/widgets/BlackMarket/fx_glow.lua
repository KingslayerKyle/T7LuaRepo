CoD.fx_glow = InheritFrom( LUI.UIElement )
CoD.fx_glow.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.fx_glow )
	self.id = "fx_glow"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 137 )
	self:setTopBottom( true, false, 0, 136 )
	
	local glow0 = LUI.UIImage.new()
	glow0:setLeftRight( false, false, -68.4, 68.4 )
	glow0:setTopBottom( true, false, 0, 136 )
	glow0:setAlpha( 0.4 )
	glow0:setImage( RegisterImage( "uie_t7_blackmarket_crate_whiteglow" ) )
	self:addElement( glow0 )
	self.glow0 = glow0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local glow0Frame2 = function ( glow0, event )
					local glow0Frame3 = function ( glow0, event )
						if not event.interrupted then
							glow0:beginAnimation( "keyframe", 769, false, false, CoD.TweenType.Linear )
						end
						glow0:setAlpha( 0.1 )
						if event.interrupted then
							self.clipFinished( glow0, event )
						else
							glow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						glow0Frame3( glow0, event )
						return 
					else
						glow0:beginAnimation( "keyframe", 759, false, false, CoD.TweenType.Linear )
						glow0:setAlpha( 1 )
						glow0:registerEventHandler( "transition_complete_keyframe", glow0Frame3 )
					end
				end
				
				glow0:completeAnimation()
				self.glow0:setAlpha( 0.1 )
				glow0Frame2( glow0, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

