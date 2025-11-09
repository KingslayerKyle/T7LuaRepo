CoD.cac_ElemsSideListCustomClass = InheritFrom( LUI.UIElement )
CoD.cac_ElemsSideListCustomClass.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.cac_ElemsSideListCustomClass )
	self.id = "cac_ElemsSideListCustomClass"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 398 )
	self:setTopBottom( true, false, 0, 670 )
	
	local LineSide = LUI.UIImage.new()
	LineSide:setLeftRight( true, false, 15.5, 23.5 )
	LineSide:setTopBottom( true, false, -13.68, 297.92 )
	LineSide:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide )
	self.LineSide = LineSide
	
	local LineSide0 = LUI.UIImage.new()
	LineSide0:setLeftRight( true, false, 0.5, 5.5 )
	LineSide0:setTopBottom( true, false, 0, 252 )
	LineSide0:setAlpha( 0.8 )
	LineSide0:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide0 )
	self.LineSide0 = LineSide0
	
	local Pixel2 = LUI.UIImage.new()
	Pixel2:setLeftRight( true, false, 16.87, 52.87 )
	Pixel2:setTopBottom( true, false, -35, -31 )
	Pixel2:setYRot( -180 )
	Pixel2:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2 )
	self.Pixel2 = Pixel2
	
	local Pixel20 = LUI.UIImage.new()
	Pixel20:setLeftRight( true, false, 16.87, 52.87 )
	Pixel20:setTopBottom( true, false, 804.64, 808.64 )
	Pixel20:setYRot( -180 )
	Pixel20:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel20:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel20 )
	self.Pixel20 = Pixel20
	
	local Pixel200 = LUI.UIImage.new()
	Pixel200:setLeftRight( true, false, 16.87, 52.87 )
	Pixel200:setTopBottom( true, false, 146.75, 150.75 )
	Pixel200:setYRot( -180 )
	Pixel200:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel200:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel200 )
	self.Pixel200 = Pixel200
	
	local Pixel2000 = LUI.UIImage.new()
	Pixel2000:setLeftRight( true, false, 16.87, 52.87 )
	Pixel2000:setTopBottom( true, false, 465, 469 )
	Pixel2000:setYRot( -180 )
	Pixel2000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2000 )
	self.Pixel2000 = Pixel2000
	
	local Pixel20010 = LUI.UIImage.new()
	Pixel20010:setLeftRight( true, false, 16.87, 52.87 )
	Pixel20010:setTopBottom( true, false, 308, 312 )
	Pixel20010:setYRot( -180 )
	Pixel20010:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel20010:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel20010 )
	self.Pixel20010 = Pixel20010
	
	local Pixel200000 = LUI.UIImage.new()
	Pixel200000:setLeftRight( true, false, 16.87, 52.87 )
	Pixel200000:setTopBottom( true, false, 279, 283 )
	Pixel200000:setAlpha( 0 )
	Pixel200000:setYRot( -180 )
	Pixel200000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel200000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel200000 )
	self.Pixel200000 = Pixel200000
	
	local Pixel201 = LUI.UIImage.new()
	Pixel201:setLeftRight( true, false, 16.87, 52.87 )
	Pixel201:setTopBottom( true, false, 622, 626 )
	Pixel201:setYRot( -180 )
	Pixel201:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel201:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel201 )
	self.Pixel201 = Pixel201
	
	local Image100 = LUI.UIImage.new()
	Image100:setLeftRight( true, true, 5.5, 0 )
	Image100:setTopBottom( false, false, 261, 265 )
	Image100:setAlpha( 0.82 )
	Image100:setImage( RegisterImage( "uie_t7_menu_frontend_titlelinem" ) )
	Image100:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image100 )
	self.Image100 = Image100
	
	local Image1010 = LUI.UIImage.new()
	Image1010:setLeftRight( true, true, 5.5, 0 )
	Image1010:setTopBottom( false, false, -290.13, -286.13 )
	Image1010:setAlpha( 0 )
	Image1010:setImage( RegisterImage( "uie_t7_menu_frontend_titlelinem" ) )
	Image1010:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1010 )
	self.Image1010 = Image1010
	
	local Pixel2001 = LUI.UIImage.new()
	Pixel2001:setLeftRight( true, false, 16.87, 52.87 )
	Pixel2001:setTopBottom( true, false, -37.25, -33.25 )
	Pixel2001:setYRot( -180 )
	Pixel2001:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2001:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2001 )
	self.Pixel2001 = Pixel2001
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				LineSide:completeAnimation()
				self.LineSide:setAlpha( 0 )
				self.clipFinished( LineSide, {} )
				Pixel20:completeAnimation()
				self.Pixel20:setLeftRight( true, false, 16.87, 52.87 )
				self.Pixel20:setTopBottom( true, false, 597, 601 )
				self.Pixel20:setAlpha( 1 )
				self.clipFinished( Pixel20, {} )
				Pixel200:completeAnimation()
				self.Pixel200:setAlpha( 1 )
				self.clipFinished( Pixel200, {} )
				Pixel20010:completeAnimation()
				self.Pixel20010:setAlpha( 1 )
				self.clipFinished( Pixel20010, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 12 )
				local LineSideFrame2 = function ( LineSide, event )
					local LineSideFrame3 = function ( LineSide, event )
						if not event.interrupted then
							LineSide:beginAnimation( "keyframe", 529, false, true, CoD.TweenType.Linear )
						end
						LineSide:setLeftRight( true, false, 15.5, 23.5 )
						LineSide:setTopBottom( true, false, 0, 670 )
						if event.interrupted then
							self.clipFinished( LineSide, event )
						else
							LineSide:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LineSideFrame3( LineSide, event )
						return 
					else
						LineSide:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
						LineSide:registerEventHandler( "transition_complete_keyframe", LineSideFrame3 )
					end
				end
				
				LineSide:completeAnimation()
				self.LineSide:setLeftRight( true, false, 15.5, 23.5 )
				self.LineSide:setTopBottom( true, false, -25, -10 )
				LineSideFrame2( LineSide, {} )
				local f3_local1 = function ( f6_arg0, f6_arg1 )
					if not f6_arg1.interrupted then
						f6_arg0:beginAnimation( "keyframe", 489, false, true, CoD.TweenType.Linear )
					end
					f6_arg0:setLeftRight( true, false, 0.5, 5.5 )
					f6_arg0:setTopBottom( true, false, 0, 252 )
					if f6_arg1.interrupted then
						self.clipFinished( f6_arg0, f6_arg1 )
					else
						f6_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LineSide0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
				LineSide0:setLeftRight( true, false, 0.5, 5.5 )
				LineSide0:setTopBottom( true, false, -25, -10 )
				LineSide0:registerEventHandler( "transition_complete_keyframe", f3_local1 )
				local Pixel2Frame2 = function ( Pixel2, event )
					local Pixel2Frame3 = function ( Pixel2, event )
						if not event.interrupted then
							Pixel2:beginAnimation( "keyframe", 399, false, true, CoD.TweenType.Linear )
						end
						Pixel2:setLeftRight( true, false, 16.87, 52.87 )
						Pixel2:setTopBottom( true, false, 145, 149 )
						if event.interrupted then
							self.clipFinished( Pixel2, event )
						else
							Pixel2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Pixel2Frame3( Pixel2, event )
						return 
					else
						Pixel2:beginAnimation( "keyframe", 620, false, false, CoD.TweenType.Linear )
						Pixel2:registerEventHandler( "transition_complete_keyframe", Pixel2Frame3 )
					end
				end
				
				Pixel2:completeAnimation()
				self.Pixel2:setLeftRight( true, false, 16.87, 52.87 )
				self.Pixel2:setTopBottom( true, false, -35, -31 )
				Pixel2Frame2( Pixel2, {} )
				local Pixel20Frame2 = function ( Pixel20, event )
					local Pixel20Frame3 = function ( Pixel20, event )
						local Pixel20Frame4 = function ( Pixel20, event )
							local Pixel20Frame5 = function ( Pixel20, event )
								local Pixel20Frame6 = function ( Pixel20, event )
									if not event.interrupted then
										Pixel20:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
									end
									Pixel20:setLeftRight( true, false, 16.87, 52.87 )
									Pixel20:setTopBottom( true, false, 598, 602 )
									Pixel20:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( Pixel20, event )
									else
										Pixel20:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									Pixel20Frame6( Pixel20, event )
									return 
								else
									Pixel20:beginAnimation( "keyframe", 169, false, false, CoD.TweenType.Linear )
									Pixel20:setTopBottom( true, false, 598, 602 )
									Pixel20:registerEventHandler( "transition_complete_keyframe", Pixel20Frame6 )
								end
							end
							
							if event.interrupted then
								Pixel20Frame5( Pixel20, event )
								return 
							else
								Pixel20:beginAnimation( "keyframe", 40, false, true, CoD.TweenType.Back )
								Pixel20:setTopBottom( true, false, 593, 597 )
								Pixel20:registerEventHandler( "transition_complete_keyframe", Pixel20Frame5 )
							end
						end
						
						if event.interrupted then
							Pixel20Frame4( Pixel20, event )
							return 
						else
							Pixel20:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
							Pixel20:setTopBottom( true, false, 598.18, 602.18 )
							Pixel20:registerEventHandler( "transition_complete_keyframe", Pixel20Frame4 )
						end
					end
					
					if event.interrupted then
						Pixel20Frame3( Pixel20, event )
						return 
					else
						Pixel20:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
						Pixel20:registerEventHandler( "transition_complete_keyframe", Pixel20Frame3 )
					end
				end
				
				Pixel20:completeAnimation()
				self.Pixel20:setLeftRight( true, false, 16.87, 52.87 )
				self.Pixel20:setTopBottom( true, false, -42, -38 )
				self.Pixel20:setAlpha( 0 )
				Pixel20Frame2( Pixel20, {} )
				local Pixel200Frame2 = function ( Pixel200, event )
					local Pixel200Frame3 = function ( Pixel200, event )
						local Pixel200Frame4 = function ( Pixel200, event )
							if not event.interrupted then
								Pixel200:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
							end
							Pixel200:setLeftRight( true, false, 16.87, 52.87 )
							Pixel200:setTopBottom( true, false, 531, 535 )
							Pixel200:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Pixel200, event )
							else
								Pixel200:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Pixel200Frame4( Pixel200, event )
							return 
						else
							Pixel200:beginAnimation( "keyframe", 400, false, true, CoD.TweenType.Linear )
							Pixel200:setTopBottom( true, false, 531, 535 )
							Pixel200:registerEventHandler( "transition_complete_keyframe", Pixel200Frame4 )
						end
					end
					
					if event.interrupted then
						Pixel200Frame3( Pixel200, event )
						return 
					else
						Pixel200:beginAnimation( "keyframe", 529, false, false, CoD.TweenType.Linear )
						Pixel200:registerEventHandler( "transition_complete_keyframe", Pixel200Frame3 )
					end
				end
				
				Pixel200:completeAnimation()
				self.Pixel200:setLeftRight( true, false, 16.87, 52.87 )
				self.Pixel200:setTopBottom( true, false, -39, -35 )
				self.Pixel200:setAlpha( 0 )
				Pixel200Frame2( Pixel200, {} )
				local Pixel2000Frame2 = function ( Pixel2000, event )
					local Pixel2000Frame3 = function ( Pixel2000, event )
						local Pixel2000Frame4 = function ( Pixel2000, event )
							if not event.interrupted then
								Pixel2000:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
							end
							Pixel2000:setLeftRight( true, false, 16.87, 52.87 )
							Pixel2000:setTopBottom( true, false, 465, 469 )
							if event.interrupted then
								self.clipFinished( Pixel2000, event )
							else
								Pixel2000:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Pixel2000Frame4( Pixel2000, event )
							return 
						else
							Pixel2000:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
							Pixel2000:setTopBottom( true, false, 526, 530 )
							Pixel2000:registerEventHandler( "transition_complete_keyframe", Pixel2000Frame4 )
						end
					end
					
					if event.interrupted then
						Pixel2000Frame3( Pixel2000, event )
						return 
					else
						Pixel2000:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						Pixel2000:registerEventHandler( "transition_complete_keyframe", Pixel2000Frame3 )
					end
				end
				
				Pixel2000:completeAnimation()
				self.Pixel2000:setLeftRight( true, false, 16.87, 52.87 )
				self.Pixel2000:setTopBottom( true, false, -44, -40 )
				Pixel2000Frame2( Pixel2000, {} )
				local Pixel20010Frame2 = function ( Pixel20010, event )
					local Pixel20010Frame3 = function ( Pixel20010, event )
						local Pixel20010Frame4 = function ( Pixel20010, event )
							if not event.interrupted then
								Pixel20010:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
							end
							Pixel20010:setLeftRight( true, false, 16.87, 52.87 )
							Pixel20010:setTopBottom( true, false, 308, 312 )
							if event.interrupted then
								self.clipFinished( Pixel20010, event )
							else
								Pixel20010:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Pixel20010Frame4( Pixel20010, event )
							return 
						else
							Pixel20010:beginAnimation( "keyframe", 399, false, true, CoD.TweenType.Back )
							Pixel20010:setTopBottom( true, false, 304, 308 )
							Pixel20010:registerEventHandler( "transition_complete_keyframe", Pixel20010Frame4 )
						end
					end
					
					if event.interrupted then
						Pixel20010Frame3( Pixel20010, event )
						return 
					else
						Pixel20010:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						Pixel20010:registerEventHandler( "transition_complete_keyframe", Pixel20010Frame3 )
					end
				end
				
				Pixel20010:completeAnimation()
				self.Pixel20010:setLeftRight( true, false, 16.87, 52.87 )
				self.Pixel20010:setTopBottom( true, false, -16, -12 )
				Pixel20010Frame2( Pixel20010, {} )
				local Pixel200000Frame2 = function ( Pixel200000, event )
					local Pixel200000Frame3 = function ( Pixel200000, event )
						local Pixel200000Frame4 = function ( Pixel200000, event )
							local Pixel200000Frame5 = function ( Pixel200000, event )
								if not event.interrupted then
									Pixel200000:beginAnimation( "keyframe", 1110, false, false, CoD.TweenType.Linear )
								end
								Pixel200000:setLeftRight( true, false, 16.87, 52.87 )
								Pixel200000:setTopBottom( true, false, 278, 282 )
								Pixel200000:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Pixel200000, event )
								else
									Pixel200000:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Pixel200000Frame5( Pixel200000, event )
								return 
							else
								Pixel200000:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
								Pixel200000:setTopBottom( true, false, 278, 282 )
								Pixel200000:registerEventHandler( "transition_complete_keyframe", Pixel200000Frame5 )
							end
						end
						
						if event.interrupted then
							Pixel200000Frame4( Pixel200000, event )
							return 
						else
							Pixel200000:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
							Pixel200000:setTopBottom( true, false, 275, 279 )
							Pixel200000:registerEventHandler( "transition_complete_keyframe", Pixel200000Frame4 )
						end
					end
					
					if event.interrupted then
						Pixel200000Frame3( Pixel200000, event )
						return 
					else
						Pixel200000:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						Pixel200000:registerEventHandler( "transition_complete_keyframe", Pixel200000Frame3 )
					end
				end
				
				Pixel200000:completeAnimation()
				self.Pixel200000:setLeftRight( true, false, 16.87, 52.87 )
				self.Pixel200000:setTopBottom( true, false, -45, -41 )
				self.Pixel200000:setAlpha( 0 )
				Pixel200000Frame2( Pixel200000, {} )
				local Pixel201Frame2 = function ( Pixel201, event )
					local Pixel201Frame3 = function ( Pixel201, event )
						if not event.interrupted then
							Pixel201:beginAnimation( "keyframe", 400, false, true, CoD.TweenType.Back )
						end
						Pixel201:setLeftRight( true, false, 16.87, 52.87 )
						Pixel201:setTopBottom( true, false, 622, 626 )
						if event.interrupted then
							self.clipFinished( Pixel201, event )
						else
							Pixel201:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Pixel201Frame3( Pixel201, event )
						return 
					else
						Pixel201:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						Pixel201:registerEventHandler( "transition_complete_keyframe", Pixel201Frame3 )
					end
				end
				
				Pixel201:completeAnimation()
				self.Pixel201:setLeftRight( true, false, 16.87, 52.87 )
				self.Pixel201:setTopBottom( true, false, -43, -39 )
				Pixel201Frame2( Pixel201, {} )
				local Image100Frame2 = function ( Image100, event )
					local Image100Frame3 = function ( Image100, event )
						if not event.interrupted then
							Image100:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
						end
						Image100:setLeftRight( true, true, 5.5, 0 )
						Image100:setTopBottom( false, false, 264, 268 )
						Image100:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Image100, event )
						else
							Image100:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Image100Frame3( Image100, event )
						return 
					else
						Image100:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						Image100:registerEventHandler( "transition_complete_keyframe", Image100Frame3 )
					end
				end
				
				Image100:completeAnimation()
				self.Image100:setLeftRight( true, true, 5.5, 0 )
				self.Image100:setTopBottom( false, false, -352, -348 )
				self.Image100:setAlpha( 0 )
				Image100Frame2( Image100, {} )
				local Image1010Frame2 = function ( Image1010, event )
					local Image1010Frame3 = function ( Image1010, event )
						if not event.interrupted then
							Image1010:beginAnimation( "keyframe", 400, false, true, CoD.TweenType.Linear )
						end
						Image1010:setLeftRight( true, true, 5.5, 0 )
						Image1010:setTopBottom( false, false, -214, -210 )
						if event.interrupted then
							self.clipFinished( Image1010, event )
						else
							Image1010:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Image1010Frame3( Image1010, event )
						return 
					else
						Image1010:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
						Image1010:registerEventHandler( "transition_complete_keyframe", Image1010Frame3 )
					end
				end
				
				Image1010:completeAnimation()
				self.Image1010:setLeftRight( true, true, 5.5, 0 )
				self.Image1010:setTopBottom( false, false, -359, -355 )
				Image1010Frame2( Image1010, {} )
				local Pixel2001Frame2 = function ( Pixel2001, event )
					local Pixel2001Frame3 = function ( Pixel2001, event )
						if not event.interrupted then
							Pixel2001:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						end
						Pixel2001:setLeftRight( true, false, 16.87, 52.87 )
						Pixel2001:setTopBottom( true, false, 52.75, 56.75 )
						Pixel2001:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Pixel2001, event )
						else
							Pixel2001:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Pixel2001Frame3( Pixel2001, event )
						return 
					else
						Pixel2001:beginAnimation( "keyframe", 810, true, true, CoD.TweenType.Linear )
						Pixel2001:setTopBottom( true, false, 52.75, 56.75 )
						Pixel2001:registerEventHandler( "transition_complete_keyframe", Pixel2001Frame3 )
					end
				end
				
				Pixel2001:completeAnimation()
				self.Pixel2001:setLeftRight( true, false, 16.87, 52.87 )
				self.Pixel2001:setTopBottom( true, false, -54.25, -50.25 )
				self.Pixel2001:setAlpha( 1 )
				Pixel2001Frame2( Pixel2001, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

