CoD.CallingCards_SpecialistKilljoysEmber = InheritFrom( LUI.UIElement )
CoD.CallingCards_SpecialistKilljoysEmber.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CallingCards_SpecialistKilljoysEmber )
	self.id = "CallingCards_SpecialistKilljoysEmber"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	
	local ember = LUI.UIImage.new()
	ember:setLeftRight( true, false, 0, 480 )
	ember:setTopBottom( true, false, 0, 120 )
	ember:setImage( RegisterImage( "uie_t7_callingcard_specialistkilljoy_ember" ) )
	ember:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ember )
	self.ember = ember
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, -145, 335 )
	Image0:setTopBottom( true, false, -99, 21 )
	Image0:setImage( RegisterImage( "uie_t7_callingcard_specialistkilljoy_ember" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local emberFrame2 = function ( ember, event )
					local emberFrame3 = function ( ember, event )
						local emberFrame4 = function ( ember, event )
							local emberFrame5 = function ( ember, event )
								local emberFrame6 = function ( ember, event )
									if not event.interrupted then
										ember:beginAnimation( "keyframe", 4029, false, false, CoD.TweenType.Linear )
									end
									ember:setLeftRight( true, false, 0, 480 )
									ember:setTopBottom( true, false, 0, 120 )
									ember:setAlpha( 1 )
									ember:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
									if event.interrupted then
										self.clipFinished( ember, event )
									else
										ember:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									emberFrame6( ember, event )
									return 
								else
									ember:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									ember:setAlpha( 1 )
									ember:registerEventHandler( "transition_complete_keyframe", emberFrame6 )
								end
							end
							
							if event.interrupted then
								emberFrame5( ember, event )
								return 
							else
								ember:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								ember:setLeftRight( true, false, -145, 335 )
								ember:setTopBottom( true, false, -99, 21 )
								ember:registerEventHandler( "transition_complete_keyframe", emberFrame5 )
							end
						end
						
						if event.interrupted then
							emberFrame4( ember, event )
							return 
						else
							ember:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							ember:setLeftRight( true, false, 145, 625 )
							ember:setTopBottom( true, false, 99, 219 )
							ember:setAlpha( 0 )
							ember:registerEventHandler( "transition_complete_keyframe", emberFrame4 )
						end
					end
					
					if event.interrupted then
						emberFrame3( ember, event )
						return 
					else
						ember:beginAnimation( "keyframe", 3960, false, false, CoD.TweenType.Linear )
						ember:setLeftRight( true, false, 143.55, 623.55 )
						ember:setTopBottom( true, false, 98.01, 218.01 )
						ember:registerEventHandler( "transition_complete_keyframe", emberFrame3 )
					end
				end
				
				ember:completeAnimation()
				self.ember:setLeftRight( true, false, 0, 480 )
				self.ember:setTopBottom( true, false, 0, 120 )
				self.ember:setAlpha( 1 )
				self.ember:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
				emberFrame2( ember, {} )
				local Image0Frame2 = function ( Image0, event )
					local Image0Frame3 = function ( Image0, event )
						if not event.interrupted then
							Image0:beginAnimation( "keyframe", 4079, false, false, CoD.TweenType.Linear )
						end
						Image0:setLeftRight( true, false, 148, 628 )
						Image0:setTopBottom( true, false, 109, 229 )
						if event.interrupted then
							self.clipFinished( Image0, event )
						else
							Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Image0Frame3( Image0, event )
						return 
					else
						Image0:beginAnimation( "keyframe", 4000, false, false, CoD.TweenType.Linear )
						Image0:setLeftRight( true, false, 0, 480 )
						Image0:setTopBottom( true, false, 0, 120 )
						Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame3 )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setLeftRight( true, false, -145, 335 )
				self.Image0:setTopBottom( true, false, -99, 21 )
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

