CoD.AnimationLoading2 = InheritFrom( LUI.UIElement )
CoD.AnimationLoading2.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AnimationLoading2 )
	self.id = "AnimationLoading2"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 128 )
	self:setTopBottom( true, false, 0, 128 )
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 0, 128 )
	Image1:setTopBottom( true, false, 0, 128 )
	Image1:setRGB( 1, 0.47, 0.01 )
	Image1:setAlpha( 0.08 )
	Image1:setImage( RegisterImage( "uie_storyboard-01" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, false, 0, 128 )
	Image2:setTopBottom( true, false, 0, 128 )
	Image2:setRGB( 1, 0.4, 0 )
	Image2:setAlpha( 0.09 )
	Image2:setImage( RegisterImage( "uie_storyboard-02" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, false, 0, 128 )
	Image3:setTopBottom( true, false, 0, 128 )
	Image3:setRGB( 1, 0.4, 0 )
	Image3:setAlpha( 0.08 )
	Image3:setImage( RegisterImage( "uie_storyboard-03" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( true, false, 0, 128 )
	Image4:setTopBottom( true, false, 0, 128 )
	Image4:setRGB( 1, 0.4, 0 )
	Image4:setAlpha( 0.11 )
	Image4:setImage( RegisterImage( "uie_storyboard-04" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local Image5 = LUI.UIImage.new()
	Image5:setLeftRight( true, false, 0, 128 )
	Image5:setTopBottom( true, false, 0, 128 )
	Image5:setRGB( 1, 0.4, 0 )
	Image5:setAlpha( 0.12 )
	Image5:setImage( RegisterImage( "uie_storyboard-05" ) )
	self:addElement( Image5 )
	self.Image5 = Image5
	
	local Image6 = LUI.UIImage.new()
	Image6:setLeftRight( true, false, 0, 128 )
	Image6:setTopBottom( true, false, 0, 128 )
	Image6:setRGB( 1, 0.4, 0 )
	Image6:setAlpha( 0.14 )
	Image6:setImage( RegisterImage( "uie_storyboard-06" ) )
	self:addElement( Image6 )
	self.Image6 = Image6
	
	local Image7 = LUI.UIImage.new()
	Image7:setLeftRight( true, false, 0, 128 )
	Image7:setTopBottom( true, false, 0, 128 )
	Image7:setRGB( 1, 0.4, 0 )
	Image7:setAlpha( 0.17 )
	Image7:setImage( RegisterImage( "uie_storyboard-07" ) )
	self:addElement( Image7 )
	self.Image7 = Image7
	
	local Image8 = LUI.UIImage.new()
	Image8:setLeftRight( true, false, 0, 128 )
	Image8:setTopBottom( true, false, 0, 128 )
	Image8:setRGB( 1, 0.4, 0 )
	Image8:setAlpha( 0.22 )
	Image8:setImage( RegisterImage( "uie_storyboard-08" ) )
	self:addElement( Image8 )
	self.Image8 = Image8
	
	local Image9 = LUI.UIImage.new()
	Image9:setLeftRight( true, false, 0, 128 )
	Image9:setTopBottom( true, false, 0, 128 )
	Image9:setRGB( 1, 0.47, 0.01 )
	Image9:setImage( RegisterImage( "uie_storyboard-09" ) )
	self:addElement( Image9 )
	self.Image9 = Image9
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				local Image1Frame2 = function ( Image1, event )
					local Image1Frame3 = function ( Image1, event )
						local Image1Frame4 = function ( Image1, event )
							if not event.interrupted then
								Image1:beginAnimation( "keyframe", 1040, false, false, CoD.TweenType.Linear )
							end
							Image1:setRGB( 1, 0.47, 0.01 )
							Image1:setAlpha( 0 )
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
							Image1:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
							Image1:setRGB( 1, 0.47, 0.01 )
							Image1:setAlpha( 1 )
							Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame4 )
						end
					end
					
					if event.interrupted then
						Image1Frame3( Image1, event )
						return 
					else
						Image1:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame3 )
					end
				end
				
				Image1:completeAnimation()
				self.Image1:setRGB( 1, 1, 1 )
				self.Image1:setAlpha( 0 )
				Image1Frame2( Image1, {} )
				local Image2Frame2 = function ( Image2, event )
					local Image2Frame3 = function ( Image2, event )
						local Image2Frame4 = function ( Image2, event )
							if not event.interrupted then
								Image2:beginAnimation( "keyframe", 920, false, false, CoD.TweenType.Linear )
							end
							Image2:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Image2, event )
							else
								Image2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Image2Frame4( Image2, event )
							return 
						else
							Image2:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
							Image2:setAlpha( 1 )
							Image2:registerEventHandler( "transition_complete_keyframe", Image2Frame4 )
						end
					end
					
					if event.interrupted then
						Image2Frame3( Image2, event )
						return 
					else
						Image2:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						Image2:registerEventHandler( "transition_complete_keyframe", Image2Frame3 )
					end
				end
				
				Image2:completeAnimation()
				self.Image2:setAlpha( 0 )
				Image2Frame2( Image2, {} )
				local Image3Frame2 = function ( Image3, event )
					local Image3Frame3 = function ( Image3, event )
						local Image3Frame4 = function ( Image3, event )
							if not event.interrupted then
								Image3:beginAnimation( "keyframe", 850, false, false, CoD.TweenType.Linear )
							end
							Image3:setAlpha( 0 )
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
							Image3:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
							Image3:setAlpha( 0.88 )
							Image3:registerEventHandler( "transition_complete_keyframe", Image3Frame4 )
						end
					end
					
					if event.interrupted then
						Image3Frame3( Image3, event )
						return 
					else
						Image3:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
						Image3:registerEventHandler( "transition_complete_keyframe", Image3Frame3 )
					end
				end
				
				Image3:completeAnimation()
				self.Image3:setAlpha( 0 )
				Image3Frame2( Image3, {} )
				local Image4Frame2 = function ( Image4, event )
					local Image4Frame3 = function ( Image4, event )
						local Image4Frame4 = function ( Image4, event )
							if not event.interrupted then
								Image4:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
							end
							Image4:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Image4, event )
							else
								Image4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Image4Frame4( Image4, event )
							return 
						else
							Image4:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
							Image4:setAlpha( 1 )
							Image4:registerEventHandler( "transition_complete_keyframe", Image4Frame4 )
						end
					end
					
					if event.interrupted then
						Image4Frame3( Image4, event )
						return 
					else
						Image4:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
						Image4:registerEventHandler( "transition_complete_keyframe", Image4Frame3 )
					end
				end
				
				Image4:completeAnimation()
				self.Image4:setAlpha( 0 )
				Image4Frame2( Image4, {} )
				local Image5Frame2 = function ( Image5, event )
					local Image5Frame3 = function ( Image5, event )
						local Image5Frame4 = function ( Image5, event )
							if not event.interrupted then
								Image5:beginAnimation( "keyframe", 650, false, false, CoD.TweenType.Linear )
							end
							Image5:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Image5, event )
							else
								Image5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Image5Frame4( Image5, event )
							return 
						else
							Image5:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
							Image5:setAlpha( 1 )
							Image5:registerEventHandler( "transition_complete_keyframe", Image5Frame4 )
						end
					end
					
					if event.interrupted then
						Image5Frame3( Image5, event )
						return 
					else
						Image5:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
						Image5:registerEventHandler( "transition_complete_keyframe", Image5Frame3 )
					end
				end
				
				Image5:completeAnimation()
				self.Image5:setAlpha( 0 )
				Image5Frame2( Image5, {} )
				local Image6Frame2 = function ( Image6, event )
					local Image6Frame3 = function ( Image6, event )
						local Image6Frame4 = function ( Image6, event )
							if not event.interrupted then
								Image6:beginAnimation( "keyframe", 560, false, false, CoD.TweenType.Linear )
							end
							Image6:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Image6, event )
							else
								Image6:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Image6Frame4( Image6, event )
							return 
						else
							Image6:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
							Image6:setAlpha( 1 )
							Image6:registerEventHandler( "transition_complete_keyframe", Image6Frame4 )
						end
					end
					
					if event.interrupted then
						Image6Frame3( Image6, event )
						return 
					else
						Image6:beginAnimation( "keyframe", 540, false, false, CoD.TweenType.Linear )
						Image6:registerEventHandler( "transition_complete_keyframe", Image6Frame3 )
					end
				end
				
				Image6:completeAnimation()
				self.Image6:setAlpha( 0 )
				Image6Frame2( Image6, {} )
				local Image7Frame2 = function ( Image7, event )
					local Image7Frame3 = function ( Image7, event )
						local Image7Frame4 = function ( Image7, event )
							if not event.interrupted then
								Image7:beginAnimation( "keyframe", 470, false, false, CoD.TweenType.Linear )
							end
							Image7:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Image7, event )
							else
								Image7:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Image7Frame4( Image7, event )
							return 
						else
							Image7:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
							Image7:setAlpha( 1 )
							Image7:registerEventHandler( "transition_complete_keyframe", Image7Frame4 )
						end
					end
					
					if event.interrupted then
						Image7Frame3( Image7, event )
						return 
					else
						Image7:beginAnimation( "keyframe", 629, false, false, CoD.TweenType.Linear )
						Image7:registerEventHandler( "transition_complete_keyframe", Image7Frame3 )
					end
				end
				
				Image7:completeAnimation()
				self.Image7:setAlpha( 0 )
				Image7Frame2( Image7, {} )
				local Image8Frame2 = function ( Image8, event )
					local Image8Frame3 = function ( Image8, event )
						local Image8Frame4 = function ( Image8, event )
							if not event.interrupted then
								Image8:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
							end
							Image8:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Image8, event )
							else
								Image8:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Image8Frame4( Image8, event )
							return 
						else
							Image8:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
							Image8:setAlpha( 1 )
							Image8:registerEventHandler( "transition_complete_keyframe", Image8Frame4 )
						end
					end
					
					if event.interrupted then
						Image8Frame3( Image8, event )
						return 
					else
						Image8:beginAnimation( "keyframe", 720, false, false, CoD.TweenType.Linear )
						Image8:registerEventHandler( "transition_complete_keyframe", Image8Frame3 )
					end
				end
				
				Image8:completeAnimation()
				self.Image8:setAlpha( 0 )
				Image8Frame2( Image8, {} )
				local Image9Frame2 = function ( Image9, event )
					local Image9Frame3 = function ( Image9, event )
						local Image9Frame4 = function ( Image9, event )
							local Image9Frame5 = function ( Image9, event )
								local Image9Frame6 = function ( Image9, event )
									if not event.interrupted then
										Image9:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
									end
									Image9:setRGB( 1, 0.47, 0.01 )
									Image9:setAlpha( 1 )
									Image9:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
									if event.interrupted then
										self.clipFinished( Image9, event )
									else
										Image9:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									Image9Frame6( Image9, event )
									return 
								else
									Image9:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
									Image9:setAlpha( 1 )
									Image9:registerEventHandler( "transition_complete_keyframe", Image9Frame6 )
								end
							end
							
							if event.interrupted then
								Image9Frame5( Image9, event )
								return 
							else
								Image9:beginAnimation( "keyframe", 620, false, false, CoD.TweenType.Linear )
								Image9:registerEventHandler( "transition_complete_keyframe", Image9Frame5 )
							end
						end
						
						if event.interrupted then
							Image9Frame4( Image9, event )
							return 
						else
							Image9:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
							Image9:setAlpha( 0 )
							Image9:registerEventHandler( "transition_complete_keyframe", Image9Frame4 )
						end
					end
					
					if event.interrupted then
						Image9Frame3( Image9, event )
						return 
					else
						Image9:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						Image9:setAlpha( 0.92 )
						Image9:registerEventHandler( "transition_complete_keyframe", Image9Frame3 )
					end
				end
				
				Image9:completeAnimation()
				self.Image9:setRGB( 1, 0.47, 0.01 )
				self.Image9:setAlpha( 1 )
				self.Image9:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				Image9Frame2( Image9, {} )
				self.nextClip = "DefaultClip"
			end,
			Logo = function ()
				self:setupElementClipCounter( 1 )
				Image9:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
				Image9:setRGB( 1, 1, 1 )
				Image9:setAlpha( 0 )
				Image9:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				Image9:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
			end,
			Reverse = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

