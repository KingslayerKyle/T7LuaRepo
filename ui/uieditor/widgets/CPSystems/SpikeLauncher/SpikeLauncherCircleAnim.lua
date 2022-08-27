-- 6fdb00758c7a7c061a4c98e35e1245e5
-- This hash is used for caching, delete to decompile the file again

CoD.SpikeLauncherCircleAnim = InheritFrom( LUI.UIElement )
CoD.SpikeLauncherCircleAnim.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SpikeLauncherCircleAnim )
	self.id = "SpikeLauncherCircleAnim"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 248 )
	self:setTopBottom( true, false, 0, 248 )
	
	local Image30 = LUI.UIImage.new()
	Image30:setLeftRight( true, true, 0, 0 )
	Image30:setTopBottom( true, true, 0, 0 )
	Image30:setImage( RegisterImage( "uie_t7_cp_hud_system_spikelauncher_strokecircle" ) )
	Image30:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image30 )
	self.Image30 = Image30
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local Image30Frame2 = function ( Image30, event )
					local Image30Frame3 = function ( Image30, event )
						local Image30Frame4 = function ( Image30, event )
							local Image30Frame5 = function ( Image30, event )
								if not event.interrupted then
									Image30:beginAnimation( "keyframe", 3000, false, false, CoD.TweenType.Linear )
								end
								Image30:setLeftRight( true, true, 0, 0 )
								Image30:setTopBottom( true, true, 0, 0 )
								Image30:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Image30, event )
								else
									Image30:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Image30Frame5( Image30, event )
								return 
							else
								Image30:beginAnimation( "keyframe", 1480, false, false, CoD.TweenType.Linear )
								Image30:setLeftRight( true, true, 0, 0 )
								Image30:setTopBottom( true, true, 0, 0 )
								Image30:setAlpha( 0 )
								Image30:registerEventHandler( "transition_complete_keyframe", Image30Frame5 )
							end
						end
						
						if event.interrupted then
							Image30Frame4( Image30, event )
							return 
						else
							Image30:beginAnimation( "keyframe", 930, false, false, CoD.TweenType.Linear )
							Image30:setLeftRight( true, true, 49.33, -49.33 )
							Image30:setTopBottom( true, true, 49.33, -49.33 )
							Image30:setAlpha( 0.5 )
							Image30:registerEventHandler( "transition_complete_keyframe", Image30Frame4 )
						end
					end
					
					if event.interrupted then
						Image30Frame3( Image30, event )
						return 
					else
						Image30:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Linear )
						Image30:setLeftRight( true, true, 80.33, -80.33 )
						Image30:setTopBottom( true, true, 80.33, -80.33 )
						Image30:setAlpha( 1 )
						Image30:registerEventHandler( "transition_complete_keyframe", Image30Frame3 )
					end
				end
				
				Image30:completeAnimation()
				self.Image30:setLeftRight( true, true, 100, -100 )
				self.Image30:setTopBottom( true, true, 100, -100 )
				self.Image30:setAlpha( 0 )
				Image30Frame2( Image30, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

