-- 896e6484751333945f3f227a7e14b37a
-- This hash is used for caching, delete to decompile the file again

CoD.ArmDeviceWidgetInternal = InheritFrom( LUI.UIElement )
CoD.ArmDeviceWidgetInternal.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ArmDeviceWidgetInternal )
	self.id = "ArmDeviceWidgetInternal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 270 )
	self:setTopBottom( true, false, 0, 126 )
	
	local TestImage = LUI.UIImage.new()
	TestImage:setLeftRight( true, true, 0, 0 )
	TestImage:setTopBottom( true, true, -15.69, 15.69 )
	TestImage:setAlpha( 0 )
	TestImage:setImage( RegisterImage( "uie_t7_hud_mp_armdevice_activatebutton" ) )
	TestImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TestImage )
	self.TestImage = TestImage
	
	local HolographOverlay = LUI.UIImage.new()
	HolographOverlay:setLeftRight( true, true, 7.33, -7.33 )
	HolographOverlay:setTopBottom( true, true, -26.68, 26.68 )
	HolographOverlay:setAlpha( 0 )
	HolographOverlay:setImage( RegisterImage( "uie_t7_hud_mp_armdevicebutton1" ) )
	HolographOverlay:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( HolographOverlay )
	self.HolographOverlay = HolographOverlay
	
	local HolographOverlay0 = LUI.UIImage.new()
	HolographOverlay0:setLeftRight( true, true, 7.33, -7.33 )
	HolographOverlay0:setTopBottom( true, true, -26.68, 26.68 )
	HolographOverlay0:setAlpha( 0 )
	HolographOverlay0:setImage( RegisterImage( "uie_t7_hud_mp_armdevicebutton1" ) )
	HolographOverlay0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( HolographOverlay0 )
	self.HolographOverlay0 = HolographOverlay0
	
	local HolographOverlay00 = LUI.UIImage.new()
	HolographOverlay00:setLeftRight( true, true, 21.33, -29.33 )
	HolographOverlay00:setTopBottom( true, true, -17.68, -6.32 )
	HolographOverlay00:setAlpha( 0 )
	HolographOverlay00:setImage( RegisterImage( "uie_t7_hud_mp_armdevicebutton1" ) )
	HolographOverlay00:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	HolographOverlay00:setShaderVector( 0, 0.97, 1.07, 0, 0 )
	HolographOverlay00:setShaderVector( 1, 50, 0, 0, 0 )
	self:addElement( HolographOverlay00 )
	self.HolographOverlay00 = HolographOverlay00
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				TestImage:completeAnimation()
				self.TestImage:setAlpha( 0 )
				self.clipFinished( TestImage, {} )

				HolographOverlay:completeAnimation()
				self.HolographOverlay:setAlpha( 0 )
				self.clipFinished( HolographOverlay, {} )

				HolographOverlay0:completeAnimation()
				self.HolographOverlay0:setAlpha( 0 )
				self.clipFinished( HolographOverlay0, {} )

				HolographOverlay00:completeAnimation()
				self.HolographOverlay00:setAlpha( 0 )
				self.clipFinished( HolographOverlay00, {} )
			end,
			Activate = function ()
				self:setupElementClipCounter( 3 )

				local HolographOverlayFrame2 = function ( HolographOverlay, event )
					local HolographOverlayFrame3 = function ( HolographOverlay, event )
						local HolographOverlayFrame4 = function ( HolographOverlay, event )
							local HolographOverlayFrame5 = function ( HolographOverlay, event )
								local HolographOverlayFrame6 = function ( HolographOverlay, event )
									local HolographOverlayFrame7 = function ( HolographOverlay, event )
										if not event.interrupted then
											HolographOverlay:beginAnimation( "keyframe", 2069, false, false, CoD.TweenType.Linear )
										end
										HolographOverlay:setAlpha( 0.7 )
										HolographOverlay:setScale( 1 )
										if event.interrupted then
											self.clipFinished( HolographOverlay, event )
										else
											HolographOverlay:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										HolographOverlayFrame7( HolographOverlay, event )
										return 
									else
										HolographOverlay:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										HolographOverlay:setAlpha( 0.7 )
										HolographOverlay:registerEventHandler( "transition_complete_keyframe", HolographOverlayFrame7 )
									end
								end
								
								if event.interrupted then
									HolographOverlayFrame6( HolographOverlay, event )
									return 
								else
									HolographOverlay:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									HolographOverlay:setAlpha( 0 )
									HolographOverlay:registerEventHandler( "transition_complete_keyframe", HolographOverlayFrame6 )
								end
							end
							
							if event.interrupted then
								HolographOverlayFrame5( HolographOverlay, event )
								return 
							else
								HolographOverlay:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
								HolographOverlay:setAlpha( 0.5 )
								HolographOverlay:registerEventHandler( "transition_complete_keyframe", HolographOverlayFrame5 )
							end
						end
						
						if event.interrupted then
							HolographOverlayFrame4( HolographOverlay, event )
							return 
						else
							HolographOverlay:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							HolographOverlay:setAlpha( 0 )
							HolographOverlay:registerEventHandler( "transition_complete_keyframe", HolographOverlayFrame4 )
						end
					end
					
					if event.interrupted then
						HolographOverlayFrame3( HolographOverlay, event )
						return 
					else
						HolographOverlay:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						HolographOverlay:setAlpha( 0.5 )
						HolographOverlay:setScale( 1 )
						HolographOverlay:registerEventHandler( "transition_complete_keyframe", HolographOverlayFrame3 )
					end
				end
				
				HolographOverlay:completeAnimation()
				self.HolographOverlay:setAlpha( 0 )
				self.HolographOverlay:setScale( 0.1 )
				HolographOverlayFrame2( HolographOverlay, {} )
				local HolographOverlay0Frame2 = function ( HolographOverlay0, event )
					local HolographOverlay0Frame3 = function ( HolographOverlay0, event )
						local HolographOverlay0Frame4 = function ( HolographOverlay0, event )
							local HolographOverlay0Frame5 = function ( HolographOverlay0, event )
								local HolographOverlay0Frame6 = function ( HolographOverlay0, event )
									local HolographOverlay0Frame7 = function ( HolographOverlay0, event )
										if not event.interrupted then
											HolographOverlay0:beginAnimation( "keyframe", 2069, false, false, CoD.TweenType.Linear )
										end
										HolographOverlay0:setAlpha( 0.31 )
										HolographOverlay0:setScale( 1 )
										if event.interrupted then
											self.clipFinished( HolographOverlay0, event )
										else
											HolographOverlay0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										HolographOverlay0Frame7( HolographOverlay0, event )
										return 
									else
										HolographOverlay0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										HolographOverlay0:setAlpha( 0.31 )
										HolographOverlay0:registerEventHandler( "transition_complete_keyframe", HolographOverlay0Frame7 )
									end
								end
								
								if event.interrupted then
									HolographOverlay0Frame6( HolographOverlay0, event )
									return 
								else
									HolographOverlay0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									HolographOverlay0:setAlpha( 0 )
									HolographOverlay0:registerEventHandler( "transition_complete_keyframe", HolographOverlay0Frame6 )
								end
							end
							
							if event.interrupted then
								HolographOverlay0Frame5( HolographOverlay0, event )
								return 
							else
								HolographOverlay0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
								HolographOverlay0:setAlpha( 0.5 )
								HolographOverlay0:registerEventHandler( "transition_complete_keyframe", HolographOverlay0Frame5 )
							end
						end
						
						if event.interrupted then
							HolographOverlay0Frame4( HolographOverlay0, event )
							return 
						else
							HolographOverlay0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							HolographOverlay0:setAlpha( 0 )
							HolographOverlay0:registerEventHandler( "transition_complete_keyframe", HolographOverlay0Frame4 )
						end
					end
					
					if event.interrupted then
						HolographOverlay0Frame3( HolographOverlay0, event )
						return 
					else
						HolographOverlay0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						HolographOverlay0:setAlpha( 0.3 )
						HolographOverlay0:setScale( 1 )
						HolographOverlay0:registerEventHandler( "transition_complete_keyframe", HolographOverlay0Frame3 )
					end
				end
				
				HolographOverlay0:completeAnimation()
				self.HolographOverlay0:setAlpha( 0 )
				self.HolographOverlay0:setScale( 0.1 )
				HolographOverlay0Frame2( HolographOverlay0, {} )
				local HolographOverlay00Frame2 = function ( HolographOverlay00, event )
					local HolographOverlay00Frame3 = function ( HolographOverlay00, event )
						local HolographOverlay00Frame4 = function ( HolographOverlay00, event )
							local HolographOverlay00Frame5 = function ( HolographOverlay00, event )
								if not event.interrupted then
									HolographOverlay00:beginAnimation( "keyframe", 2049, false, false, CoD.TweenType.Linear )
								end
								HolographOverlay00:setLeftRight( true, true, 21.33, -29.33 )
								HolographOverlay00:setTopBottom( true, true, -33.68, 29 )
								HolographOverlay00:setAlpha( 0.15 )
								if event.interrupted then
									self.clipFinished( HolographOverlay00, event )
								else
									HolographOverlay00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								HolographOverlay00Frame5( HolographOverlay00, event )
								return 
							else
								HolographOverlay00:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								HolographOverlay00:registerEventHandler( "transition_complete_keyframe", HolographOverlay00Frame5 )
							end
						end
						
						if event.interrupted then
							HolographOverlay00Frame4( HolographOverlay00, event )
							return 
						else
							HolographOverlay00:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							HolographOverlay00:setAlpha( 0.15 )
							HolographOverlay00:registerEventHandler( "transition_complete_keyframe", HolographOverlay00Frame4 )
						end
					end
					
					if event.interrupted then
						HolographOverlay00Frame3( HolographOverlay00, event )
						return 
					else
						HolographOverlay00:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						HolographOverlay00:registerEventHandler( "transition_complete_keyframe", HolographOverlay00Frame3 )
					end
				end
				
				HolographOverlay00:completeAnimation()
				self.HolographOverlay00:setLeftRight( true, true, 21.33, -29.33 )
				self.HolographOverlay00:setTopBottom( true, true, -33.68, 29 )
				self.HolographOverlay00:setAlpha( 0 )
				HolographOverlay00Frame2( HolographOverlay00, {} )
			end,
			Deactivate = function ()
				self:setupElementClipCounter( 3 )

				local HolographOverlayFrame2 = function ( HolographOverlay, event )
					local HolographOverlayFrame3 = function ( HolographOverlay, event )
						if not event.interrupted then
							HolographOverlay:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
						end
						HolographOverlay:setAlpha( 0 )
						HolographOverlay:setScale( 0.1 )
						if event.interrupted then
							self.clipFinished( HolographOverlay, event )
						else
							HolographOverlay:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						HolographOverlayFrame3( HolographOverlay, event )
						return 
					else
						HolographOverlay:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						HolographOverlay:setAlpha( 0.5 )
						HolographOverlay:registerEventHandler( "transition_complete_keyframe", HolographOverlayFrame3 )
					end
				end
				
				HolographOverlay:completeAnimation()
				self.HolographOverlay:setAlpha( 0.7 )
				self.HolographOverlay:setScale( 1 )
				HolographOverlayFrame2( HolographOverlay, {} )
				local HolographOverlay0Frame2 = function ( HolographOverlay0, event )
					local HolographOverlay0Frame3 = function ( HolographOverlay0, event )
						if not event.interrupted then
							HolographOverlay0:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
						end
						HolographOverlay0:setAlpha( 0 )
						HolographOverlay0:setScale( 0.1 )
						if event.interrupted then
							self.clipFinished( HolographOverlay0, event )
						else
							HolographOverlay0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						HolographOverlay0Frame3( HolographOverlay0, event )
						return 
					else
						HolographOverlay0:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						HolographOverlay0:setAlpha( 0.2 )
						HolographOverlay0:registerEventHandler( "transition_complete_keyframe", HolographOverlay0Frame3 )
					end
				end
				
				HolographOverlay0:completeAnimation()
				self.HolographOverlay0:setAlpha( 0.31 )
				self.HolographOverlay0:setScale( 1 )
				HolographOverlay0Frame2( HolographOverlay0, {} )
				local HolographOverlay00Frame2 = function ( HolographOverlay00, event )
					local HolographOverlay00Frame3 = function ( HolographOverlay00, event )
						if not event.interrupted then
							HolographOverlay00:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
						end
						HolographOverlay00:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( HolographOverlay00, event )
						else
							HolographOverlay00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						HolographOverlay00Frame3( HolographOverlay00, event )
						return 
					else
						HolographOverlay00:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						HolographOverlay00:registerEventHandler( "transition_complete_keyframe", HolographOverlay00Frame3 )
					end
				end
				
				HolographOverlay00:completeAnimation()
				self.HolographOverlay00:setAlpha( 0.15 )
				HolographOverlay00Frame2( HolographOverlay00, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
