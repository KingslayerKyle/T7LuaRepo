CoD.scorestreaks_ElementSide = InheritFrom( LUI.UIElement )
CoD.scorestreaks_ElementSide.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.scorestreaks_ElementSide )
	self.id = "scorestreaks_ElementSide"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 54 )
	self:setTopBottom( 0, 0, 0, 772 )
	
	local pixelLR0 = LUI.UIImage.new()
	pixelLR0:setLeftRight( 0, 0, 0, 54 )
	pixelLR0:setTopBottom( 0.5, 0.5, -445, -440 )
	pixelLR0:setYRot( -180 )
	pixelLR0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelLR0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( pixelLR0 )
	self.pixelLR0 = pixelLR0
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 0, 0, 54 )
	Image0:setTopBottom( 0.5, 0.5, -441, -436 )
	Image0:setYRot( -180 )
	Image0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( 0, 0, 0, 54 )
	Image1:setTopBottom( 0.5, 0.5, -437, -432 )
	Image1:setYRot( -180 )
	Image1:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( 0, 0, 0, 54 )
	Image2:setTopBottom( 0.5, 0.5, -433, -428 )
	Image2:setYRot( -180 )
	Image2:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( 0, 0, 0, 54 )
	Image3:setTopBottom( 0.5, 0.5, -428, -423 )
	Image3:setYRot( -180 )
	Image3:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local pixelc00 = LUI.UIImage.new()
	pixelc00:setLeftRight( 0, 0, -98, -74 )
	pixelc00:setTopBottom( 0, 0, -9, 69 )
	pixelc00:setZoom( -5 )
	pixelc00:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc00 )
	self.pixelc00 = pixelc00
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( 0, 0, -134, -110 )
	Image4:setTopBottom( 0, 0, 255, 333 )
	Image4:setZoom( -5 )
	Image4:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local Image5 = LUI.UIImage.new()
	Image5:setLeftRight( 0, 0, -116, -92 )
	Image5:setTopBottom( 0, 0, 432, 510 )
	Image5:setZoom( -5 )
	Image5:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	Image5:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image5 )
	self.Image5 = Image5
	
	local Image6 = LUI.UIImage.new()
	Image6:setLeftRight( 0, 0, -128, -104 )
	Image6:setTopBottom( 0, 0, 632, 710 )
	Image6:setZoom( -5 )
	Image6:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	Image6:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image6 )
	self.Image6 = Image6
	
	local LineSide = LUI.UIImage.new()
	LineSide:setLeftRight( 0, 0, 0, 12 )
	LineSide:setTopBottom( 0, 0, -60, -38 )
	LineSide:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide )
	self.LineSide = LineSide
	
	local LineSide0 = LUI.UIImage.new()
	LineSide0:setLeftRight( 0, 0, -25, -17 )
	LineSide0:setTopBottom( 0, 0, -59, -37 )
	LineSide0:setAlpha( 0.8 )
	LineSide0:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide0 )
	self.LineSide0 = LineSide0
	
	local pixelc000 = LUI.UIImage.new()
	pixelc000:setLeftRight( 0, 0, -116, -92 )
	pixelc000:setTopBottom( 0, 0, 19, 97 )
	pixelc000:setZoom( -5 )
	pixelc000:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc000 )
	self.pixelc000 = pixelc000
	
	local Image40 = LUI.UIImage.new()
	Image40:setLeftRight( 0, 0, -116, -92 )
	Image40:setTopBottom( 0, 0, 207, 285 )
	Image40:setZoom( -5 )
	Image40:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	Image40:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image40 )
	self.Image40 = Image40
	
	local Image50 = LUI.UIImage.new()
	Image50:setLeftRight( 0, 0, -116, -92 )
	Image50:setTopBottom( 0, 0, 386, 464 )
	Image50:setZoom( -5 )
	Image50:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	Image50:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image50 )
	self.Image50 = Image50
	
	local Image60 = LUI.UIImage.new()
	Image60:setLeftRight( 0, 0, -116, -92 )
	Image60:setTopBottom( 0, 0, 581, 659 )
	Image60:setZoom( -5 )
	Image60:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	Image60:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image60 )
	self.Image60 = Image60
	
	self.resetProperties = function ()
		LineSide0:completeAnimation()
		LineSide:completeAnimation()
		Image6:completeAnimation()
		Image5:completeAnimation()
		Image4:completeAnimation()
		pixelc00:completeAnimation()
		Image3:completeAnimation()
		Image2:completeAnimation()
		Image1:completeAnimation()
		Image0:completeAnimation()
		pixelLR0:completeAnimation()
		Image60:completeAnimation()
		Image50:completeAnimation()
		Image40:completeAnimation()
		pixelc000:completeAnimation()
		LineSide0:setLeftRight( 0, 0, -25, -17 )
		LineSide0:setTopBottom( 0, 0, -59, -37 )
		LineSide:setLeftRight( 0, 0, 0, 12 )
		LineSide:setTopBottom( 0, 0, -60, -38 )
		Image6:setLeftRight( 0, 0, -128, -104 )
		Image6:setTopBottom( 0, 0, 632, 710 )
		Image5:setLeftRight( 0, 0, -116, -92 )
		Image5:setTopBottom( 0, 0, 432, 510 )
		Image4:setLeftRight( 0, 0, -134, -110 )
		Image4:setTopBottom( 0, 0, 255, 333 )
		pixelc00:setLeftRight( 0, 0, -98, -74 )
		pixelc00:setTopBottom( 0, 0, -9, 69 )
		Image3:setLeftRight( 0, 0, 0, 54 )
		Image3:setTopBottom( 0.5, 0.5, -428, -423 )
		Image2:setLeftRight( 0, 0, 0, 54 )
		Image2:setTopBottom( 0.5, 0.5, -433, -428 )
		Image1:setLeftRight( 0, 0, 0, 54 )
		Image1:setTopBottom( 0.5, 0.5, -437, -432 )
		Image0:setLeftRight( 0, 0, 0, 54 )
		Image0:setTopBottom( 0.5, 0.5, -441, -436 )
		pixelLR0:setLeftRight( 0, 0, 0, 54 )
		pixelLR0:setTopBottom( 0.5, 0.5, -445, -440 )
		Image60:setLeftRight( 0, 0, -116, -92 )
		Image60:setTopBottom( 0, 0, 581, 659 )
		Image50:setLeftRight( 0, 0, -116, -92 )
		Image50:setTopBottom( 0, 0, 386, 464 )
		Image40:setLeftRight( 0, 0, -116, -92 )
		Image40:setTopBottom( 0, 0, 207, 285 )
		pixelc000:setLeftRight( 0, 0, -116, -92 )
		pixelc000:setTopBottom( 0, 0, 19, 97 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 15 )
				pixelLR0:completeAnimation()
				self.pixelLR0:setLeftRight( 0, 0, 0, 54 )
				self.pixelLR0:setTopBottom( 0.5, 0.5, -386, -381 )
				self.clipFinished( pixelLR0, {} )
				Image0:completeAnimation()
				self.Image0:setLeftRight( 0, 0, 0, 54 )
				self.Image0:setTopBottom( 0.5, 0.5, -198, -193 )
				self.clipFinished( Image0, {} )
				Image1:completeAnimation()
				self.Image1:setLeftRight( 0, 0, 0, 54 )
				self.Image1:setTopBottom( 0.5, 0.5, -3, 2 )
				self.clipFinished( Image1, {} )
				Image2:completeAnimation()
				self.Image2:setLeftRight( 0, 0, 0, 54 )
				self.Image2:setTopBottom( 0.5, 0.5, 192, 197 )
				self.clipFinished( Image2, {} )
				Image3:completeAnimation()
				self.Image3:setLeftRight( 0, 0, 0, 54 )
				self.Image3:setTopBottom( 0.5, 0.5, 381, 386 )
				self.clipFinished( Image3, {} )
				pixelc00:completeAnimation()
				self.pixelc00:setLeftRight( 0, 0, -21, 3 )
				self.pixelc00:setTopBottom( 0, 0, 59, 137 )
				self.clipFinished( pixelc00, {} )
				Image4:completeAnimation()
				self.Image4:setLeftRight( 0, 0, -21, 3 )
				self.Image4:setTopBottom( 0, 0, 246, 324 )
				self.clipFinished( Image4, {} )
				Image5:completeAnimation()
				self.Image5:setLeftRight( 0, 0, -21, 3 )
				self.Image5:setTopBottom( 0, 0, 443, 521 )
				self.clipFinished( Image5, {} )
				Image6:completeAnimation()
				self.Image6:setLeftRight( 0, 0, -21, 3 )
				self.Image6:setTopBottom( 0, 0, 635, 713 )
				self.clipFinished( Image6, {} )
				LineSide:completeAnimation()
				self.LineSide:setLeftRight( 0, 0, 0, 12 )
				self.LineSide:setTopBottom( 0, 0, 0, 772 )
				self.clipFinished( LineSide, {} )
				LineSide0:completeAnimation()
				self.LineSide0:setLeftRight( 0, 0, -24, -16 )
				self.LineSide0:setTopBottom( 0, 0, 0, 378 )
				self.clipFinished( LineSide0, {} )
				pixelc000:completeAnimation()
				self.pixelc000:setLeftRight( 0, 0, -21, 3 )
				self.pixelc000:setTopBottom( 0, 0, 59, 137 )
				self.clipFinished( pixelc000, {} )
				Image40:completeAnimation()
				self.Image40:setLeftRight( 0, 0, -21, 3 )
				self.Image40:setTopBottom( 0, 0, 246, 324 )
				self.clipFinished( Image40, {} )
				Image50:completeAnimation()
				self.Image50:setLeftRight( 0, 0, -21, 3 )
				self.Image50:setTopBottom( 0, 0, 443, 521 )
				self.clipFinished( Image50, {} )
				Image60:completeAnimation()
				self.Image60:setLeftRight( 0, 0, -21, 3 )
				self.Image60:setTopBottom( 0, 0, 635, 713 )
				self.clipFinished( Image60, {} )
			end,
			Intro = function ()
				self.resetProperties()
				self:setupElementClipCounter( 15 )
				local pixelLR0Frame2 = function ( pixelLR0, event )
					local pixelLR0Frame3 = function ( pixelLR0, event )
						if not event.interrupted then
							pixelLR0:beginAnimation( "keyframe", 700, false, false, CoD.TweenType.Linear )
						end
						pixelLR0:setLeftRight( 0, 0, 0, 54 )
						pixelLR0:setTopBottom( 0.5, 0.5, -386, -381 )
						if event.interrupted then
							self.clipFinished( pixelLR0, event )
						else
							pixelLR0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						pixelLR0Frame3( pixelLR0, event )
						return 
					else
						pixelLR0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						pixelLR0:registerEventHandler( "transition_complete_keyframe", pixelLR0Frame3 )
					end
				end
				
				pixelLR0:completeAnimation()
				self.pixelLR0:setLeftRight( 0, 0, 0, 54 )
				self.pixelLR0:setTopBottom( 0.5, 0.5, -445, -440 )
				pixelLR0Frame2( pixelLR0, {} )
				local Image0Frame2 = function ( Image0, event )
					local Image0Frame3 = function ( Image0, event )
						local Image0Frame4 = function ( Image0, event )
							if not event.interrupted then
								Image0:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
							end
							Image0:setLeftRight( 0, 0, 0, 54 )
							Image0:setTopBottom( 0.5, 0.5, -200.5, -196.5 )
							if event.interrupted then
								self.clipFinished( Image0, event )
							else
								Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Image0Frame4( Image0, event )
							return 
						else
							Image0:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
							Image0:setTopBottom( 0.5, 0.5, -46, -41 )
							Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame4 )
						end
					end
					
					if event.interrupted then
						Image0Frame3( Image0, event )
						return 
					else
						Image0:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame3 )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setLeftRight( 0, 0, 0, 54 )
				self.Image0:setTopBottom( 0.5, 0.5, -441, -436 )
				Image0Frame2( Image0, {} )
				local Image1Frame2 = function ( Image1, event )
					local Image1Frame3 = function ( Image1, event )
						local Image1Frame4 = function ( Image1, event )
							local Image1Frame5 = function ( Image1, event )
								if not event.interrupted then
									Image1:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
								end
								Image1:setLeftRight( 0, 0, 0, 54 )
								Image1:setTopBottom( 0.5, 0.5, -8, -3 )
								if event.interrupted then
									self.clipFinished( Image1, event )
								else
									Image1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Image1Frame5( Image1, event )
								return 
							else
								Image1:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
								Image1:setTopBottom( 0.5, 0.5, -3, 2 )
								Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame5 )
							end
						end
						
						if event.interrupted then
							Image1Frame4( Image1, event )
							return 
						else
							Image1:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
							Image1:setTopBottom( 0.5, 0.5, 110, 115 )
							Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame4 )
						end
					end
					
					if event.interrupted then
						Image1Frame3( Image1, event )
						return 
					else
						Image1:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
						Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame3 )
					end
				end
				
				Image1:completeAnimation()
				self.Image1:setLeftRight( 0, 0, 0, 54 )
				self.Image1:setTopBottom( 0.5, 0.5, -437, -432 )
				Image1Frame2( Image1, {} )
				local Image2Frame2 = function ( Image2, event )
					local Image2Frame3 = function ( Image2, event )
						local Image2Frame4 = function ( Image2, event )
							local Image2Frame5 = function ( Image2, event )
								if not event.interrupted then
									Image2:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
								end
								Image2:setLeftRight( 0, 0, 0, 54 )
								Image2:setTopBottom( 0.5, 0.5, 184, 189 )
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
								Image2:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
								Image2:setTopBottom( 0.5, 0.5, 192, 197 )
								Image2:registerEventHandler( "transition_complete_keyframe", Image2Frame5 )
							end
						end
						
						if event.interrupted then
							Image2Frame4( Image2, event )
							return 
						else
							Image2:beginAnimation( "keyframe", 350, false, false, CoD.TweenType.Linear )
							Image2:setTopBottom( 0.5, 0.5, 297, 302 )
							Image2:registerEventHandler( "transition_complete_keyframe", Image2Frame4 )
						end
					end
					
					if event.interrupted then
						Image2Frame3( Image2, event )
						return 
					else
						Image2:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Linear )
						Image2:registerEventHandler( "transition_complete_keyframe", Image2Frame3 )
					end
				end
				
				Image2:completeAnimation()
				self.Image2:setLeftRight( 0, 0, 0, 54 )
				self.Image2:setTopBottom( 0.5, 0.5, -433, -428 )
				Image2Frame2( Image2, {} )
				local Image3Frame2 = function ( Image3, event )
					local Image3Frame3 = function ( Image3, event )
						local Image3Frame4 = function ( Image3, event )
							if not event.interrupted then
								Image3:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
							end
							Image3:setLeftRight( 0, 0, 0, 54 )
							Image3:setTopBottom( 0.5, 0.5, 381, 386 )
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
							Image3:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
							Image3:setTopBottom( 0.5, 0.5, 436, 441 )
							Image3:registerEventHandler( "transition_complete_keyframe", Image3Frame4 )
						end
					end
					
					if event.interrupted then
						Image3Frame3( Image3, event )
						return 
					else
						Image3:beginAnimation( "keyframe", 620, false, false, CoD.TweenType.Linear )
						Image3:registerEventHandler( "transition_complete_keyframe", Image3Frame3 )
					end
				end
				
				Image3:completeAnimation()
				self.Image3:setLeftRight( 0, 0, 0, 54 )
				self.Image3:setTopBottom( 0.5, 0.5, -428, -423 )
				Image3Frame2( Image3, {} )
				local pixelc00Frame2 = function ( pixelc00, event )
					local pixelc00Frame3 = function ( pixelc00, event )
						if not event.interrupted then
							pixelc00:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
						end
						pixelc00:setLeftRight( 0, 0, -21, 3 )
						pixelc00:setTopBottom( 0, 0, 59, 137 )
						if event.interrupted then
							self.clipFinished( pixelc00, event )
						else
							pixelc00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						pixelc00Frame3( pixelc00, event )
						return 
					else
						pixelc00:beginAnimation( "keyframe", 800, false, false, CoD.TweenType.Linear )
						pixelc00:registerEventHandler( "transition_complete_keyframe", pixelc00Frame3 )
					end
				end
				
				pixelc00:completeAnimation()
				self.pixelc00:setLeftRight( 0, 0, -98, -74 )
				self.pixelc00:setTopBottom( 0, 0, -9, 69 )
				pixelc00Frame2( pixelc00, {} )
				local Image4Frame2 = function ( Image4, event )
					local Image4Frame3 = function ( Image4, event )
						if not event.interrupted then
							Image4:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
						end
						Image4:setLeftRight( 0, 0, -21, 3 )
						Image4:setTopBottom( 0, 0, 246, 324 )
						if event.interrupted then
							self.clipFinished( Image4, event )
						else
							Image4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Image4Frame3( Image4, event )
						return 
					else
						Image4:beginAnimation( "keyframe", 720, false, false, CoD.TweenType.Linear )
						Image4:registerEventHandler( "transition_complete_keyframe", Image4Frame3 )
					end
				end
				
				Image4:completeAnimation()
				self.Image4:setLeftRight( 0, 0, -134, -110 )
				self.Image4:setTopBottom( 0, 0, 255, 333 )
				Image4Frame2( Image4, {} )
				local Image5Frame2 = function ( Image5, event )
					local Image5Frame3 = function ( Image5, event )
						if not event.interrupted then
							Image5:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
						end
						Image5:setLeftRight( 0, 0, -21, 3 )
						Image5:setTopBottom( 0, 0, 443, 521 )
						if event.interrupted then
							self.clipFinished( Image5, event )
						else
							Image5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Image5Frame3( Image5, event )
						return 
					else
						Image5:beginAnimation( "keyframe", 620, false, false, CoD.TweenType.Linear )
						Image5:registerEventHandler( "transition_complete_keyframe", Image5Frame3 )
					end
				end
				
				Image5:completeAnimation()
				self.Image5:setLeftRight( 0, 0, -116, -92 )
				self.Image5:setTopBottom( 0, 0, 432, 510 )
				Image5Frame2( Image5, {} )
				local Image6Frame2 = function ( Image6, event )
					local Image6Frame3 = function ( Image6, event )
						if not event.interrupted then
							Image6:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
						end
						Image6:setLeftRight( 0, 0, -21, 3 )
						Image6:setTopBottom( 0, 0, 635, 713 )
						if event.interrupted then
							self.clipFinished( Image6, event )
						else
							Image6:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Image6Frame3( Image6, event )
						return 
					else
						Image6:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
						Image6:registerEventHandler( "transition_complete_keyframe", Image6Frame3 )
					end
				end
				
				Image6:completeAnimation()
				self.Image6:setLeftRight( 0, 0, -128, -104 )
				self.Image6:setTopBottom( 0, 0, 632, 710 )
				Image6Frame2( Image6, {} )
				local LineSideFrame2 = function ( LineSide, event )
					local LineSideFrame3 = function ( LineSide, event )
						local LineSideFrame4 = function ( LineSide, event )
							if not event.interrupted then
								LineSide:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
							end
							LineSide:setLeftRight( 0, 0, 0, 12 )
							LineSide:setTopBottom( 0, 0, 0, 772 )
							if event.interrupted then
								self.clipFinished( LineSide, event )
							else
								LineSide:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							LineSideFrame4( LineSide, event )
							return 
						else
							LineSide:beginAnimation( "keyframe", 429, false, false, CoD.TweenType.Linear )
							LineSide:setTopBottom( 0, 0, 0, 772 )
							LineSide:registerEventHandler( "transition_complete_keyframe", LineSideFrame4 )
						end
					end
					
					if event.interrupted then
						LineSideFrame3( LineSide, event )
						return 
					else
						LineSide:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
						LineSide:registerEventHandler( "transition_complete_keyframe", LineSideFrame3 )
					end
				end
				
				LineSide:completeAnimation()
				self.LineSide:setLeftRight( 0, 0, 0, 12 )
				self.LineSide:setTopBottom( 0, 0, -60, -38 )
				LineSideFrame2( LineSide, {} )
				local LineSide0Frame2 = function ( LineSide0, event )
					local LineSide0Frame3 = function ( LineSide0, event )
						local LineSide0Frame4 = function ( LineSide0, event )
							if not event.interrupted then
								LineSide0:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
							end
							LineSide0:setLeftRight( 0, 0, -24, -16 )
							LineSide0:setTopBottom( 0, 0, 0, 378 )
							if event.interrupted then
								self.clipFinished( LineSide0, event )
							else
								LineSide0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							LineSide0Frame4( LineSide0, event )
							return 
						else
							LineSide0:beginAnimation( "keyframe", 599, false, false, CoD.TweenType.Linear )
							LineSide0:setLeftRight( 0, 0, -24, -16 )
							LineSide0:setTopBottom( 0, 0, 0, 378 )
							LineSide0:registerEventHandler( "transition_complete_keyframe", LineSide0Frame4 )
						end
					end
					
					if event.interrupted then
						LineSide0Frame3( LineSide0, event )
						return 
					else
						LineSide0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						LineSide0:registerEventHandler( "transition_complete_keyframe", LineSide0Frame3 )
					end
				end
				
				LineSide0:completeAnimation()
				self.LineSide0:setLeftRight( 0, 0, -25, -17 )
				self.LineSide0:setTopBottom( 0, 0, -59, -37 )
				LineSide0Frame2( LineSide0, {} )
				local pixelc000Frame2 = function ( pixelc000, event )
					local pixelc000Frame3 = function ( pixelc000, event )
						if not event.interrupted then
							pixelc000:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
						end
						pixelc000:setLeftRight( 0, 0, -21, 3 )
						pixelc000:setTopBottom( 0, 0, 59, 137 )
						if event.interrupted then
							self.clipFinished( pixelc000, event )
						else
							pixelc000:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						pixelc000Frame3( pixelc000, event )
						return 
					else
						pixelc000:beginAnimation( "keyframe", 759, false, false, CoD.TweenType.Linear )
						pixelc000:registerEventHandler( "transition_complete_keyframe", pixelc000Frame3 )
					end
				end
				
				pixelc000:completeAnimation()
				self.pixelc000:setLeftRight( 0, 0, -116, -92 )
				self.pixelc000:setTopBottom( 0, 0, 19, 97 )
				pixelc000Frame2( pixelc000, {} )
				local Image40Frame2 = function ( Image40, event )
					local Image40Frame3 = function ( Image40, event )
						if not event.interrupted then
							Image40:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
						end
						Image40:setLeftRight( 0, 0, -21, 3 )
						Image40:setTopBottom( 0, 0, 246, 324 )
						if event.interrupted then
							self.clipFinished( Image40, event )
						else
							Image40:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Image40Frame3( Image40, event )
						return 
					else
						Image40:beginAnimation( "keyframe", 839, false, false, CoD.TweenType.Linear )
						Image40:registerEventHandler( "transition_complete_keyframe", Image40Frame3 )
					end
				end
				
				Image40:completeAnimation()
				self.Image40:setLeftRight( 0, 0, -116, -92 )
				self.Image40:setTopBottom( 0, 0, 207, 285 )
				Image40Frame2( Image40, {} )
				local Image50Frame2 = function ( Image50, event )
					local Image50Frame3 = function ( Image50, event )
						if not event.interrupted then
							Image50:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						end
						Image50:setLeftRight( 0, 0, -21, 3 )
						Image50:setTopBottom( 0, 0, 443, 521 )
						if event.interrupted then
							self.clipFinished( Image50, event )
						else
							Image50:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Image50Frame3( Image50, event )
						return 
					else
						Image50:beginAnimation( "keyframe", 740, false, false, CoD.TweenType.Linear )
						Image50:registerEventHandler( "transition_complete_keyframe", Image50Frame3 )
					end
				end
				
				Image50:completeAnimation()
				self.Image50:setLeftRight( 0, 0, -116, -92 )
				self.Image50:setTopBottom( 0, 0, 386, 464 )
				Image50Frame2( Image50, {} )
				local Image60Frame2 = function ( Image60, event )
					local Image60Frame3 = function ( Image60, event )
						if not event.interrupted then
							Image60:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
						end
						Image60:setLeftRight( 0, 0, -21, 3 )
						Image60:setTopBottom( 0, 0, 635, 713 )
						if event.interrupted then
							self.clipFinished( Image60, event )
						else
							Image60:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Image60Frame3( Image60, event )
						return 
					else
						Image60:beginAnimation( "keyframe", 680, false, false, CoD.TweenType.Linear )
						Image60:registerEventHandler( "transition_complete_keyframe", Image60Frame3 )
					end
				end
				
				Image60:completeAnimation()
				self.Image60:setLeftRight( 0, 0, -116, -92 )
				self.Image60:setTopBottom( 0, 0, 581, 659 )
				Image60Frame2( Image60, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

