CoD.CallingCards_ReturnFire_Stars = InheritFrom( LUI.UIElement )
CoD.CallingCards_ReturnFire_Stars.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CallingCards_ReturnFire_Stars )
	self.id = "CallingCards_ReturnFire_Stars"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 100 )
	self:setTopBottom( true, false, 0, 90 )
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 76.98, 99.59 )
	Image1:setTopBottom( true, false, 46, 67.31 )
	Image1:setImage( RegisterImage( "uie_t7_callingcard_returnfire_star" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, false, 55.98, 78.59 )
	Image2:setTopBottom( true, false, 6, 27.31 )
	Image2:setImage( RegisterImage( "uie_t7_callingcard_returnfire_star" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, false, 62.49, 76.98 )
	Image3:setTopBottom( true, false, 76.71, 90.36 )
	Image3:setImage( RegisterImage( "uie_t7_callingcard_returnfire_star" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( true, false, 29.69, 37.67 )
	Image4:setTopBottom( true, false, 79.78, 87.3 )
	Image4:setImage( RegisterImage( "uie_t7_callingcard_returnfire_star" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local Image5 = LUI.UIImage.new()
	Image5:setLeftRight( true, false, 37.67, 52.16 )
	Image5:setTopBottom( true, false, 0, 13.66 )
	Image5:setImage( RegisterImage( "uie_t7_callingcard_returnfire_star" ) )
	self:addElement( Image5 )
	self.Image5 = Image5
	
	local Image7 = LUI.UIImage.new()
	Image7:setLeftRight( true, false, 0, 7.98 )
	Image7:setTopBottom( true, false, 6.14, 13.66 )
	Image7:setImage( RegisterImage( "uie_t7_callingcard_returnfire_star" ) )
	self:addElement( Image7 )
	self.Image7 = Image7
	
	local Image8 = LUI.UIImage.new()
	Image8:setLeftRight( true, false, 55.79, 70.29 )
	Image8:setTopBottom( true, false, 53.66, 67.31 )
	Image8:setImage( RegisterImage( "uie_t7_callingcard_returnfire_star" ) )
	self:addElement( Image8 )
	self.Image8 = Image8
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				local Image1Frame2 = function ( Image1, event )
					local Image1Frame3 = function ( Image1, event )
						local Image1Frame4 = function ( Image1, event )
							if not event.interrupted then
								Image1:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
							end
							Image1:setLeftRight( true, false, 76.98, 99.59 )
							Image1:setTopBottom( true, false, 46, 67.31 )
							Image1:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( Image1, event )
							else
								Image1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Image1Frame4( Image1, event )
							return 
						else
							Image1:beginAnimation( "keyframe", 489, false, false, CoD.TweenType.Linear )
							Image1:setLeftRight( true, false, 76.98, 99.59 )
							Image1:setTopBottom( true, false, 46, 67.31 )
							Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame4 )
						end
					end
					
					if event.interrupted then
						Image1Frame3( Image1, event )
						return 
					else
						Image1:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
						Image1:setLeftRight( true, false, 3.99, 26.6 )
						Image1:setTopBottom( true, false, 64, 85.31 )
						Image1:setAlpha( 0 )
						Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame3 )
					end
				end
				
				Image1:completeAnimation()
				self.Image1:setLeftRight( true, false, 76.98, 99.59 )
				self.Image1:setTopBottom( true, false, 46, 67.31 )
				self.Image1:setAlpha( 1 )
				Image1Frame2( Image1, {} )
				local Image2Frame2 = function ( Image2, event )
					local Image2Frame3 = function ( Image2, event )
						local Image2Frame4 = function ( Image2, event )
							local Image2Frame5 = function ( Image2, event )
								if not event.interrupted then
									Image2:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
								end
								Image2:setLeftRight( true, false, 55.98, 78.59 )
								Image2:setTopBottom( true, false, 6, 27.31 )
								Image2:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Image2, event )
								else
									Image2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Image2Frame5( Image2, event )
								return 
							else
								Image2:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
								Image2:setLeftRight( true, false, 55.98, 78.59 )
								Image2:setTopBottom( true, false, 6, 27.31 )
								Image2:registerEventHandler( "transition_complete_keyframe", Image2Frame5 )
							end
						end
						
						if event.interrupted then
							Image2Frame4( Image2, event )
							return 
						else
							Image2:beginAnimation( "keyframe", 469, false, false, CoD.TweenType.Linear )
							Image2:setLeftRight( true, false, -26.02, -3.41 )
							Image2:setTopBottom( true, false, -13, 8.31 )
							Image2:setAlpha( 0 )
							Image2:registerEventHandler( "transition_complete_keyframe", Image2Frame4 )
						end
					end
					
					if event.interrupted then
						Image2Frame3( Image2, event )
						return 
					else
						Image2:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
						Image2:setAlpha( 1 )
						Image2:registerEventHandler( "transition_complete_keyframe", Image2Frame3 )
					end
				end
				
				Image2:completeAnimation()
				self.Image2:setLeftRight( true, false, 55.98, 78.59 )
				self.Image2:setTopBottom( true, false, 6, 27.31 )
				self.Image2:setAlpha( 0 )
				Image2Frame2( Image2, {} )
				local Image3Frame2 = function ( Image3, event )
					local Image3Frame3 = function ( Image3, event )
						local Image3Frame4 = function ( Image3, event )
							if not event.interrupted then
								Image3:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
							end
							Image3:setLeftRight( true, false, 62.49, 76.98 )
							Image3:setTopBottom( true, false, 76.71, 90.36 )
							Image3:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( Image3, event )
							else
								Image3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Image3Frame4( Image3, event )
							return 
						else
							Image3:beginAnimation( "keyframe", 390, false, false, CoD.TweenType.Linear )
							Image3:setLeftRight( true, false, 62.49, 76.98 )
							Image3:setTopBottom( true, false, 76.71, 90.36 )
							Image3:registerEventHandler( "transition_complete_keyframe", Image3Frame4 )
						end
					end
					
					if event.interrupted then
						Image3Frame3( Image3, event )
						return 
					else
						Image3:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
						Image3:setLeftRight( true, false, -14.49, 0 )
						Image3:setTopBottom( true, false, 90, 103.66 )
						Image3:setAlpha( 0 )
						Image3:registerEventHandler( "transition_complete_keyframe", Image3Frame3 )
					end
				end
				
				Image3:completeAnimation()
				self.Image3:setLeftRight( true, false, 62.49, 76.98 )
				self.Image3:setTopBottom( true, false, 76.71, 90.36 )
				self.Image3:setAlpha( 1 )
				Image3Frame2( Image3, {} )
				local Image4Frame2 = function ( Image4, event )
					local Image4Frame3 = function ( Image4, event )
						local Image4Frame4 = function ( Image4, event )
							local Image4Frame5 = function ( Image4, event )
								local Image4Frame6 = function ( Image4, event )
									if not event.interrupted then
										Image4:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
									end
									Image4:setLeftRight( true, false, 29.69, 37.67 )
									Image4:setTopBottom( true, false, 79.78, 87.3 )
									Image4:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( Image4, event )
									else
										Image4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									Image4Frame6( Image4, event )
									return 
								else
									Image4:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
									Image4:setLeftRight( true, false, -31.31, -23.33 )
									Image4:setTopBottom( true, false, 90.36, 97.88 )
									Image4:setAlpha( 0.17 )
									Image4:registerEventHandler( "transition_complete_keyframe", Image4Frame6 )
								end
							end
							
							if event.interrupted then
								Image4Frame5( Image4, event )
								return 
							else
								Image4:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
								Image4:setAlpha( 1 )
								Image4:registerEventHandler( "transition_complete_keyframe", Image4Frame5 )
							end
						end
						
						if event.interrupted then
							Image4Frame4( Image4, event )
							return 
						else
							Image4:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
							Image4:registerEventHandler( "transition_complete_keyframe", Image4Frame4 )
						end
					end
					
					if event.interrupted then
						Image4Frame3( Image4, event )
						return 
					else
						Image4:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
						Image4:registerEventHandler( "transition_complete_keyframe", Image4Frame3 )
					end
				end
				
				Image4:completeAnimation()
				self.Image4:setLeftRight( true, false, 29.69, 37.67 )
				self.Image4:setTopBottom( true, false, 79.78, 87.3 )
				self.Image4:setAlpha( 0 )
				Image4Frame2( Image4, {} )
				local Image5Frame2 = function ( Image5, event )
					local Image5Frame3 = function ( Image5, event )
						local Image5Frame4 = function ( Image5, event )
							local Image5Frame5 = function ( Image5, event )
								if not event.interrupted then
									Image5:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
								end
								Image5:setLeftRight( true, false, 37.67, 52.16 )
								Image5:setTopBottom( true, false, 0, 13.66 )
								Image5:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Image5, event )
								else
									Image5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Image5Frame5( Image5, event )
								return 
							else
								Image5:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
								Image5:setLeftRight( true, false, -38.33, -23.84 )
								Image5:setTopBottom( true, false, -13.66, 0 )
								Image5:setAlpha( 0 )
								Image5:registerEventHandler( "transition_complete_keyframe", Image5Frame5 )
							end
						end
						
						if event.interrupted then
							Image5Frame4( Image5, event )
							return 
						else
							Image5:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
							Image5:setAlpha( 1 )
							Image5:registerEventHandler( "transition_complete_keyframe", Image5Frame4 )
						end
					end
					
					if event.interrupted then
						Image5Frame3( Image5, event )
						return 
					else
						Image5:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
						Image5:registerEventHandler( "transition_complete_keyframe", Image5Frame3 )
					end
				end
				
				Image5:completeAnimation()
				self.Image5:setLeftRight( true, false, 37.67, 52.16 )
				self.Image5:setTopBottom( true, false, 0, 13.66 )
				self.Image5:setAlpha( 0 )
				Image5Frame2( Image5, {} )
				local Image7Frame2 = function ( Image7, event )
					local Image7Frame3 = function ( Image7, event )
						local Image7Frame4 = function ( Image7, event )
							local Image7Frame5 = function ( Image7, event )
								if not event.interrupted then
									Image7:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
								end
								Image7:setLeftRight( true, false, 0, 7.98 )
								Image7:setTopBottom( true, false, 6.14, 13.66 )
								Image7:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Image7, event )
								else
									Image7:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Image7Frame5( Image7, event )
								return 
							else
								Image7:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
								Image7:setLeftRight( true, false, -60, -52.02 )
								Image7:setTopBottom( true, false, 6, 13.52 )
								Image7:setAlpha( 0 )
								Image7:registerEventHandler( "transition_complete_keyframe", Image7Frame5 )
							end
						end
						
						if event.interrupted then
							Image7Frame4( Image7, event )
							return 
						else
							Image7:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
							Image7:setAlpha( 1 )
							Image7:registerEventHandler( "transition_complete_keyframe", Image7Frame4 )
						end
					end
					
					if event.interrupted then
						Image7Frame3( Image7, event )
						return 
					else
						Image7:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
						Image7:registerEventHandler( "transition_complete_keyframe", Image7Frame3 )
					end
				end
				
				Image7:completeAnimation()
				self.Image7:setLeftRight( true, false, 0, 7.98 )
				self.Image7:setTopBottom( true, false, 6.14, 13.66 )
				self.Image7:setAlpha( 0 )
				Image7Frame2( Image7, {} )
				local Image8Frame2 = function ( Image8, event )
					local Image8Frame3 = function ( Image8, event )
						local Image8Frame4 = function ( Image8, event )
							local Image8Frame5 = function ( Image8, event )
								if not event.interrupted then
									Image8:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
								end
								Image8:setLeftRight( true, false, 55.79, 70.29 )
								Image8:setTopBottom( true, false, 53.66, 67.31 )
								Image8:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Image8, event )
								else
									Image8:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Image8Frame5( Image8, event )
								return 
							else
								Image8:beginAnimation( "keyframe", 390, false, false, CoD.TweenType.Linear )
								Image8:setLeftRight( true, false, -23.21, -8.71 )
								Image8:setTopBottom( true, false, 58.5, 72.15 )
								Image8:setAlpha( 0 )
								Image8:registerEventHandler( "transition_complete_keyframe", Image8Frame5 )
							end
						end
						
						if event.interrupted then
							Image8Frame4( Image8, event )
							return 
						else
							Image8:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
							Image8:setAlpha( 1 )
							Image8:registerEventHandler( "transition_complete_keyframe", Image8Frame4 )
						end
					end
					
					if event.interrupted then
						Image8Frame3( Image8, event )
						return 
					else
						Image8:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
						Image8:registerEventHandler( "transition_complete_keyframe", Image8Frame3 )
					end
				end
				
				Image8:completeAnimation()
				self.Image8:setLeftRight( true, false, 55.79, 70.29 )
				self.Image8:setTopBottom( true, false, 53.66, 67.31 )
				self.Image8:setAlpha( 0 )
				Image8Frame2( Image8, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

