-- 7f734764f515f41d55a7cc4acf95add8
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCards_GroundAssault_Eyes = InheritFrom( LUI.UIElement )
CoD.CallingCards_GroundAssault_Eyes.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CallingCards_GroundAssault_Eyes )
	self.id = "CallingCards_GroundAssault_Eyes"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 6 )
	self:setTopBottom( true, false, 0, 76 )
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 1.95, 4.78 )
	Image1:setTopBottom( true, false, 0, 75.93 )
	Image1:setRGB( 1, 0.02, 0 )
	Image1:setZRot( 90 )
	Image1:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 6.18 )
	Image0:setTopBottom( true, false, 34.5, 41.43 )
	Image0:setRGB( 1, 0.02, 0 )
	Image0:setZRot( 80 )
	Image0:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				local Image1Frame2 = function ( Image1, event )
					local Image1Frame3 = function ( Image1, event )
						local Image1Frame4 = function ( Image1, event )
							local Image1Frame5 = function ( Image1, event )
								local Image1Frame6 = function ( Image1, event )
									if not event.interrupted then
										Image1:beginAnimation( "keyframe", 960, false, false, CoD.TweenType.Linear )
									end
									Image1:setAlpha( 0.15 )
									if event.interrupted then
										self.clipFinished( Image1, event )
									else
										Image1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									Image1Frame6( Image1, event )
									return 
								else
									Image1:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
									Image1:setAlpha( 1 )
									Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame6 )
								end
							end
							
							if event.interrupted then
								Image1Frame5( Image1, event )
								return 
							else
								Image1:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
								Image1:setAlpha( 0.3 )
								Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame5 )
							end
						end
						
						if event.interrupted then
							Image1Frame4( Image1, event )
							return 
						else
							Image1:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							Image1:setAlpha( 1 )
							Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame4 )
						end
					end
					
					if event.interrupted then
						Image1Frame3( Image1, event )
						return 
					else
						Image1:beginAnimation( "keyframe", 839, false, false, CoD.TweenType.Linear )
						Image1:setAlpha( 0.3 )
						Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame3 )
					end
				end
				
				Image1:completeAnimation()
				self.Image1:setAlpha( 0.15 )
				Image1Frame2( Image1, {} )
				local Image0Frame2 = function ( Image0, event )
					local Image0Frame3 = function ( Image0, event )
						local Image0Frame4 = function ( Image0, event )
							local Image0Frame5 = function ( Image0, event )
								local Image0Frame6 = function ( Image0, event )
									if not event.interrupted then
										Image0:beginAnimation( "keyframe", 960, false, false, CoD.TweenType.Linear )
									end
									Image0:setAlpha( 0.15 )
									if event.interrupted then
										self.clipFinished( Image0, event )
									else
										Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									Image0Frame6( Image0, event )
									return 
								else
									Image0:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
									Image0:setAlpha( 1 )
									Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame6 )
								end
							end
							
							if event.interrupted then
								Image0Frame5( Image0, event )
								return 
							else
								Image0:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
								Image0:setAlpha( 0.3 )
								Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame5 )
							end
						end
						
						if event.interrupted then
							Image0Frame4( Image0, event )
							return 
						else
							Image0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							Image0:setAlpha( 1 )
							Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame4 )
						end
					end
					
					if event.interrupted then
						Image0Frame3( Image0, event )
						return 
					else
						Image0:beginAnimation( "keyframe", 839, false, false, CoD.TweenType.Linear )
						Image0:setAlpha( 0.3 )
						Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame3 )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setAlpha( 0.15 )
				Image0Frame2( Image0, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

