CoD.CallingCards_loot_Space = InheritFrom( LUI.UIElement )
CoD.CallingCards_loot_Space.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_loot_Space )
	self.id = "CallingCards_loot_Space"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 720 )
	self:setTopBottom( 0, 0, 0, 180 )
	
	local BG2 = LUI.UIImage.new()
	BG2:setLeftRight( 0, 0, 0, 720 )
	BG2:setTopBottom( 0, 0, 0, 180 )
	BG2:setImage( RegisterImage( "uie_t7_loot_callingcard_space_airbrush_master_bg1" ) )
	self:addElement( BG2 )
	self.BG2 = BG2
	
	local BG1 = LUI.UIImage.new()
	BG1:setLeftRight( 0, 0, 0, 720 )
	BG1:setTopBottom( 0, 0, 0, 180 )
	BG1:setImage( RegisterImage( "uie_t7_loot_callingcard_space_airbrush_master_bg2" ) )
	self:addElement( BG1 )
	self.BG1 = BG1
	
	local comet1 = LUI.UIImage.new()
	comet1:setLeftRight( 0, 0, -32, 328 )
	comet1:setTopBottom( 0, 0, 74, 218 )
	comet1:setImage( RegisterImage( "uie_t7_loot_callingcard_space_airbrush_master_comet1" ) )
	self:addElement( comet1 )
	self.comet1 = comet1
	
	local comet2 = LUI.UIImage.new()
	comet2:setLeftRight( 0, 0, 98, 278 )
	comet2:setTopBottom( 0, 0, 45, 135 )
	comet2:setImage( RegisterImage( "uie_t7_loot_callingcard_space_airbrush_master_comet2" ) )
	self:addElement( comet2 )
	self.comet2 = comet2
	
	local comet3 = LUI.UIImage.new()
	comet3:setLeftRight( 0, 0, 220, 400 )
	comet3:setTopBottom( 0, 0, 0, 90 )
	comet3:setImage( RegisterImage( "uie_t7_loot_callingcard_space_airbrush_master_comet3" ) )
	self:addElement( comet3 )
	self.comet3 = comet3
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 0, 407, 471 )
	Image0:setTopBottom( 0, 0, 62, 126 )
	Image0:setImage( RegisterImage( "uie_t7_loot_callingcard_space_airbrush_master_rock1" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( 0, 0, 492, 564 )
	Image1:setTopBottom( 0, 0, 108, 180 )
	Image1:setImage( RegisterImage( "uie_t7_loot_callingcard_space_airbrush_master_rock2" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image10 = LUI.UIImage.new()
	Image10:setLeftRight( 0, 0, 582, 626 )
	Image10:setTopBottom( 0, 0, 72, 116 )
	Image10:setAlpha( 0.81 )
	Image10:setZRot( -175 )
	Image10:setImage( RegisterImage( "uie_t7_loot_callingcard_space_airbrush_master_rock2" ) )
	self:addElement( Image10 )
	self.Image10 = Image10
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( 0, 0, 310, 354 )
	Image2:setTopBottom( 0, 0, 115, 159 )
	Image2:setAlpha( 0.7 )
	Image2:setZRot( -17 )
	Image2:setImage( RegisterImage( "uie_t7_loot_callingcard_space_airbrush_master_rock2" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	self.resetProperties = function ()
		BG1:completeAnimation()
		comet3:completeAnimation()
		comet2:completeAnimation()
		comet1:completeAnimation()
		Image0:completeAnimation()
		Image1:completeAnimation()
		Image10:completeAnimation()
		Image2:completeAnimation()
		BG1:setAlpha( 1 )
		comet3:setLeftRight( 0, 0, 220, 400 )
		comet3:setTopBottom( 0, 0, 0, 90 )
		comet3:setAlpha( 1 )
		comet3:setScale( 1 )
		comet2:setLeftRight( 0, 0, 98, 278 )
		comet2:setTopBottom( 0, 0, 45, 135 )
		comet2:setAlpha( 1 )
		comet1:setLeftRight( 0, 0, -32, 328 )
		comet1:setTopBottom( 0, 0, 74, 218 )
		comet1:setAlpha( 1 )
		comet1:setScale( 1 )
		Image0:setLeftRight( 0, 0, 407, 471 )
		Image0:setTopBottom( 0, 0, 62, 126 )
		Image1:setLeftRight( 0, 0, 492, 564 )
		Image1:setTopBottom( 0, 0, 108, 180 )
		Image10:setLeftRight( 0, 0, 582, 626 )
		Image10:setTopBottom( 0, 0, 72, 116 )
		Image10:setAlpha( 0.81 )
		Image10:setZRot( -175 )
		Image2:setLeftRight( 0, 0, 310, 354 )
		Image2:setTopBottom( 0, 0, 115, 159 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 8 )
				local BG1Frame2 = function ( BG1, event )
					local BG1Frame3 = function ( BG1, event )
						local BG1Frame4 = function ( BG1, event )
							local BG1Frame5 = function ( BG1, event )
								if not event.interrupted then
									BG1:beginAnimation( "keyframe", 1029, false, false, CoD.TweenType.Linear )
								end
								BG1:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( BG1, event )
								else
									BG1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								BG1Frame5( BG1, event )
								return 
							else
								BG1:beginAnimation( "keyframe", 980, false, false, CoD.TweenType.Linear )
								BG1:setAlpha( 0.13 )
								BG1:registerEventHandler( "transition_complete_keyframe", BG1Frame5 )
							end
						end
						
						if event.interrupted then
							BG1Frame4( BG1, event )
							return 
						else
							BG1:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
							BG1:setAlpha( 1 )
							BG1:registerEventHandler( "transition_complete_keyframe", BG1Frame4 )
						end
					end
					
					if event.interrupted then
						BG1Frame3( BG1, event )
						return 
					else
						BG1:beginAnimation( "keyframe", 1009, false, false, CoD.TweenType.Linear )
						BG1:setAlpha( 0 )
						BG1:registerEventHandler( "transition_complete_keyframe", BG1Frame3 )
					end
				end
				
				BG1:completeAnimation()
				self.BG1:setAlpha( 1 )
				BG1Frame2( BG1, {} )
				local comet1Frame2 = function ( comet1, event )
					local comet1Frame3 = function ( comet1, event )
						local comet1Frame4 = function ( comet1, event )
							local comet1Frame5 = function ( comet1, event )
								local comet1Frame6 = function ( comet1, event )
									local comet1Frame7 = function ( comet1, event )
										local comet1Frame8 = function ( comet1, event )
											if not event.interrupted then
												comet1:beginAnimation( "keyframe", 2069, false, false, CoD.TweenType.Linear )
											end
											comet1:setLeftRight( 0, 0, -32, 328 )
											comet1:setTopBottom( 0, 0, 74, 218 )
											comet1:setAlpha( 1 )
											comet1:setScale( 1 )
											if event.interrupted then
												self.clipFinished( comet1, event )
											else
												comet1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											comet1Frame8( comet1, event )
											return 
										else
											comet1:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
											comet1:setAlpha( 1 )
											comet1:setScale( 0.57 )
											comet1:registerEventHandler( "transition_complete_keyframe", comet1Frame8 )
										end
									end
									
									if event.interrupted then
										comet1Frame7( comet1, event )
										return 
									else
										comet1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										comet1:registerEventHandler( "transition_complete_keyframe", comet1Frame7 )
									end
								end
								
								if event.interrupted then
									comet1Frame6( comet1, event )
									return 
								else
									comet1:beginAnimation( "keyframe", 1029, false, false, CoD.TweenType.Linear )
									comet1:setLeftRight( 0, 0, 176, 536 )
									comet1:setTopBottom( 0, 0, 54, 198 )
									comet1:setScale( 0.5 )
									comet1:registerEventHandler( "transition_complete_keyframe", comet1Frame6 )
								end
							end
							
							if event.interrupted then
								comet1Frame5( comet1, event )
								return 
							else
								comet1:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								comet1:setLeftRight( 0, 0, -283, 77 )
								comet1:setTopBottom( 0, 0, 102, 246 )
								comet1:registerEventHandler( "transition_complete_keyframe", comet1Frame5 )
							end
						end
						
						if event.interrupted then
							comet1Frame4( comet1, event )
							return 
						else
							comet1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							comet1:setLeftRight( 0, 0, -239, 121 )
							comet1:setTopBottom( 0, 0, 114.67, 258.67 )
							comet1:setAlpha( 0 )
							comet1:setScale( 0.82 )
							comet1:registerEventHandler( "transition_complete_keyframe", comet1Frame4 )
						end
					end
					
					if event.interrupted then
						comet1Frame3( comet1, event )
						return 
					else
						comet1:beginAnimation( "keyframe", 569, false, false, CoD.TweenType.Linear )
						comet1:setLeftRight( 0, 0, -217, 143 )
						comet1:setTopBottom( 0, 0, 121, 265 )
						comet1:setScale( 0.83 )
						comet1:registerEventHandler( "transition_complete_keyframe", comet1Frame3 )
					end
				end
				
				comet1:completeAnimation()
				self.comet1:setLeftRight( 0, 0, -32, 328 )
				self.comet1:setTopBottom( 0, 0, 74, 218 )
				self.comet1:setAlpha( 1 )
				self.comet1:setScale( 1 )
				comet1Frame2( comet1, {} )
				local comet2Frame2 = function ( comet2, event )
					local comet2Frame3 = function ( comet2, event )
						local comet2Frame4 = function ( comet2, event )
							local comet2Frame5 = function ( comet2, event )
								local comet2Frame6 = function ( comet2, event )
									if not event.interrupted then
										comet2:beginAnimation( "keyframe", 1839, false, false, CoD.TweenType.Linear )
									end
									comet2:setLeftRight( 0, 0, 28, 208 )
									comet2:setTopBottom( 0, 0, 33, 123 )
									comet2:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( comet2, event )
									else
										comet2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									comet2Frame6( comet2, event )
									return 
								else
									comet2:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
									comet2:setLeftRight( 0, 0, 238, 418 )
									comet2:setTopBottom( 0, 0, 73, 163 )
									comet2:setAlpha( 0.12 )
									comet2:registerEventHandler( "transition_complete_keyframe", comet2Frame6 )
								end
							end
							
							if event.interrupted then
								comet2Frame5( comet2, event )
								return 
							else
								comet2:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
								comet2:setLeftRight( 0, 0, 154.52, 334.52 )
								comet2:setTopBottom( 0, 0, 53.96, 143.96 )
								comet2:registerEventHandler( "transition_complete_keyframe", comet2Frame5 )
							end
						end
						
						if event.interrupted then
							comet2Frame4( comet2, event )
							return 
						else
							comet2:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
							comet2:setLeftRight( 0, 0, -57.65, 122.35 )
							comet2:setTopBottom( 0, 0, 5.55, 95.55 )
							comet2:setAlpha( 0 )
							comet2:registerEventHandler( "transition_complete_keyframe", comet2Frame4 )
						end
					end
					
					if event.interrupted then
						comet2Frame3( comet2, event )
						return 
					else
						comet2:beginAnimation( "keyframe", 1259, false, false, CoD.TweenType.Linear )
						comet2:setLeftRight( 0, 0, -82, 98 )
						comet2:setTopBottom( 0, 0, 0, 90 )
						comet2:registerEventHandler( "transition_complete_keyframe", comet2Frame3 )
					end
				end
				
				comet2:completeAnimation()
				self.comet2:setLeftRight( 0, 0, 28, 208 )
				self.comet2:setTopBottom( 0, 0, 33, 123 )
				self.comet2:setAlpha( 1 )
				comet2Frame2( comet2, {} )
				local comet3Frame2 = function ( comet3, event )
					local comet3Frame3 = function ( comet3, event )
						local comet3Frame4 = function ( comet3, event )
							local comet3Frame5 = function ( comet3, event )
								if not event.interrupted then
									comet3:beginAnimation( "keyframe", 1680, false, false, CoD.TweenType.Linear )
								end
								comet3:setLeftRight( 0, 0, 278, 458 )
								comet3:setTopBottom( 0, 0, 17, 107 )
								comet3:setAlpha( 0 )
								comet3:setScale( 0.5 )
								if event.interrupted then
									self.clipFinished( comet3, event )
								else
									comet3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								comet3Frame5( comet3, event )
								return 
							else
								comet3:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
								comet3:setLeftRight( 0, 0, 58.83, 238.83 )
								comet3:setTopBottom( 0, 0, -54.45, 35.55 )
								comet3:setAlpha( 0 )
								comet3:setScale( 0.98 )
								comet3:registerEventHandler( "transition_complete_keyframe", comet3Frame5 )
							end
						end
						
						if event.interrupted then
							comet3Frame4( comet3, event )
							return 
						else
							comet3:beginAnimation( "keyframe", 1019, false, false, CoD.TweenType.Linear )
							comet3:setLeftRight( 0, 0, 51, 231 )
							comet3:setTopBottom( 0, 0, -57, 33 )
							comet3:setScale( 1 )
							comet3:registerEventHandler( "transition_complete_keyframe", comet3Frame4 )
						end
					end
					
					if event.interrupted then
						comet3Frame3( comet3, event )
						return 
					else
						comet3:beginAnimation( "keyframe", 1259, false, false, CoD.TweenType.Linear )
						comet3:setLeftRight( 0, 0, 152.55, 332.55 )
						comet3:setTopBottom( 0, 0, -23.89, 66.11 )
						comet3:setAlpha( 1 )
						comet3:setScale( 0.78 )
						comet3:registerEventHandler( "transition_complete_keyframe", comet3Frame3 )
					end
				end
				
				comet3:completeAnimation()
				self.comet3:setLeftRight( 0, 0, 278, 458 )
				self.comet3:setTopBottom( 0, 0, 17, 107 )
				self.comet3:setAlpha( 0 )
				self.comet3:setScale( 0.5 )
				comet3Frame2( comet3, {} )
				local Image0Frame2 = function ( Image0, event )
					local Image0Frame3 = function ( Image0, event )
						local Image0Frame4 = function ( Image0, event )
							local Image0Frame5 = function ( Image0, event )
								if not event.interrupted then
									Image0:beginAnimation( "keyframe", 629, false, false, CoD.TweenType.Linear )
								end
								Image0:setLeftRight( 0, 0, 407, 471 )
								Image0:setTopBottom( 0, 0, 62, 126 )
								if event.interrupted then
									self.clipFinished( Image0, event )
								else
									Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Image0Frame5( Image0, event )
								return 
							else
								Image0:beginAnimation( "keyframe", 1120, false, false, CoD.TweenType.Linear )
								Image0:setLeftRight( 0, 0, 397, 461 )
								Image0:setTopBottom( 0, 0, 60, 124 )
								Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame5 )
							end
						end
						
						if event.interrupted then
							Image0Frame4( Image0, event )
							return 
						else
							Image0:beginAnimation( "keyframe", 1220, false, false, CoD.TweenType.Linear )
							Image0:setLeftRight( 0, 0, 412, 476 )
							Image0:setTopBottom( 0, 0, 63, 127 )
							Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame4 )
						end
					end
					
					if event.interrupted then
						Image0Frame3( Image0, event )
						return 
					else
						Image0:beginAnimation( "keyframe", 1049, false, false, CoD.TweenType.Linear )
						Image0:setLeftRight( 0, 0, 397, 461 )
						Image0:setTopBottom( 0, 0, 61, 125 )
						Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame3 )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setLeftRight( 0, 0, 407, 471 )
				self.Image0:setTopBottom( 0, 0, 62, 126 )
				Image0Frame2( Image0, {} )
				local Image1Frame2 = function ( Image1, event )
					local Image1Frame3 = function ( Image1, event )
						if not event.interrupted then
							Image1:beginAnimation( "keyframe", 1609, false, false, CoD.TweenType.Linear )
						end
						Image1:setLeftRight( 0, 0, 494, 566 )
						Image1:setTopBottom( 0, 0, 123, 195 )
						if event.interrupted then
							self.clipFinished( Image1, event )
						else
							Image1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Image1Frame3( Image1, event )
						return 
					else
						Image1:beginAnimation( "keyframe", 2410, false, false, CoD.TweenType.Linear )
						Image1:setLeftRight( 0, 0, 540, 612 )
						Image1:setTopBottom( 0, 0, 122, 194 )
						Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame3 )
					end
				end
				
				Image1:completeAnimation()
				self.Image1:setLeftRight( 0, 0, 494, 566 )
				self.Image1:setTopBottom( 0, 0, 123, 195 )
				Image1Frame2( Image1, {} )
				local Image10Frame2 = function ( Image10, event )
					local Image10Frame3 = function ( Image10, event )
						if not event.interrupted then
							Image10:beginAnimation( "keyframe", 2519, false, false, CoD.TweenType.Linear )
						end
						Image10:setLeftRight( 0, 0, 589, 633 )
						Image10:setTopBottom( 0, 0, 72, 116 )
						Image10:setAlpha( 0.81 )
						Image10:setZRot( -175 )
						if event.interrupted then
							self.clipFinished( Image10, event )
						else
							Image10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Image10Frame3( Image10, event )
						return 
					else
						Image10:beginAnimation( "keyframe", 1500, false, false, CoD.TweenType.Linear )
						Image10:setLeftRight( 0, 0, 572, 616 )
						Image10:registerEventHandler( "transition_complete_keyframe", Image10Frame3 )
					end
				end
				
				Image10:completeAnimation()
				self.Image10:setLeftRight( 0, 0, 589, 633 )
				self.Image10:setTopBottom( 0, 0, 72, 116 )
				self.Image10:setAlpha( 0.81 )
				self.Image10:setZRot( -175 )
				Image10Frame2( Image10, {} )
				local Image2Frame2 = function ( Image2, event )
					local Image2Frame3 = function ( Image2, event )
						if not event.interrupted then
							Image2:beginAnimation( "keyframe", 2730, false, false, CoD.TweenType.Linear )
						end
						Image2:setLeftRight( 0, 0, 310, 354 )
						Image2:setTopBottom( 0, 0, 115, 159 )
						if event.interrupted then
							self.clipFinished( Image2, event )
						else
							Image2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Image2Frame3( Image2, event )
						return 
					else
						Image2:beginAnimation( "keyframe", 1289, false, false, CoD.TweenType.Linear )
						Image2:setLeftRight( 0, 0, 338, 382 )
						Image2:registerEventHandler( "transition_complete_keyframe", Image2Frame3 )
					end
				end
				
				Image2:completeAnimation()
				self.Image2:setLeftRight( 0, 0, 310, 354 )
				self.Image2:setTopBottom( 0, 0, 115, 159 )
				Image2Frame2( Image2, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

