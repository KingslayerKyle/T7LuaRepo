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
	LineSide:setRGB( 1, 1, 1 )
	LineSide:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide )
	self.LineSide = LineSide
	
	local LineSide0 = LUI.UIImage.new()
	LineSide0:setLeftRight( true, false, 0.5, 5.5 )
	LineSide0:setTopBottom( true, false, 0, 252 )
	LineSide0:setRGB( 1, 1, 1 )
	LineSide0:setAlpha( 0.8 )
	LineSide0:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide0 )
	self.LineSide0 = LineSide0
	
	local Pixel2 = LUI.UIImage.new()
	Pixel2:setLeftRight( true, false, 16.87, 52.87 )
	Pixel2:setTopBottom( true, false, -35, -31 )
	Pixel2:setRGB( 1, 1, 1 )
	Pixel2:setYRot( -180 )
	Pixel2:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2 )
	self.Pixel2 = Pixel2
	
	local Pixel20 = LUI.UIImage.new()
	Pixel20:setLeftRight( true, false, 16.87, 52.87 )
	Pixel20:setTopBottom( true, false, 804.64, 808.64 )
	Pixel20:setRGB( 1, 1, 1 )
	Pixel20:setYRot( -180 )
	Pixel20:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel20:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel20 )
	self.Pixel20 = Pixel20
	
	local pixelc1 = LUI.UIImage.new()
	pixelc1:setLeftRight( true, false, 0, 16 )
	pixelc1:setTopBottom( true, false, 187, 239 )
	pixelc1:setRGB( 1, 1, 1 )
	pixelc1:setZoom( -5 )
	pixelc1:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc1 )
	self.pixelc1 = pixelc1
	
	local pixelc00 = LUI.UIImage.new()
	pixelc00:setLeftRight( true, false, 0, 16 )
	pixelc00:setTopBottom( true, false, 187, 239 )
	pixelc00:setRGB( 1, 1, 1 )
	pixelc00:setZoom( -5 )
	pixelc00:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc00 )
	self.pixelc00 = pixelc00
	
	local pixelc10 = LUI.UIImage.new()
	pixelc10:setLeftRight( true, false, -66.5, -50.5 )
	pixelc10:setTopBottom( true, false, 323.25, 375.25 )
	pixelc10:setRGB( 1, 1, 1 )
	pixelc10:setZoom( -5 )
	pixelc10:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc10:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc10 )
	self.pixelc10 = pixelc10
	
	local pixelc000 = LUI.UIImage.new()
	pixelc000:setLeftRight( true, false, 0, 16 )
	pixelc000:setTopBottom( true, false, 347, 399 )
	pixelc000:setRGB( 1, 1, 1 )
	pixelc000:setZoom( -5 )
	pixelc000:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc000 )
	self.pixelc000 = pixelc000
	
	local pixelc100 = LUI.UIImage.new()
	pixelc100:setLeftRight( true, false, 13.03, 29.03 )
	pixelc100:setTopBottom( true, false, 508.65, 560.65 )
	pixelc100:setRGB( 1, 1, 1 )
	pixelc100:setZoom( -5 )
	pixelc100:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc100:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc100 )
	self.pixelc100 = pixelc100
	
	local pixelc0000 = LUI.UIImage.new()
	pixelc0000:setLeftRight( true, false, 0, 16 )
	pixelc0000:setTopBottom( true, false, 504, 556 )
	pixelc0000:setRGB( 1, 1, 1 )
	pixelc0000:setZoom( -5 )
	pixelc0000:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc0000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc0000 )
	self.pixelc0000 = pixelc0000
	
	local Pixel200 = LUI.UIImage.new()
	Pixel200:setLeftRight( true, false, 16.87, 52.87 )
	Pixel200:setTopBottom( true, false, 60.75, 64.75 )
	Pixel200:setRGB( 1, 1, 1 )
	Pixel200:setYRot( -180 )
	Pixel200:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel200:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel200 )
	self.Pixel200 = Pixel200
	
	local Pixel2000 = LUI.UIImage.new()
	Pixel2000:setLeftRight( true, false, 16.87, 52.87 )
	Pixel2000:setTopBottom( true, false, 526, 530 )
	Pixel2000:setRGB( 1, 1, 1 )
	Pixel2000:setYRot( -180 )
	Pixel2000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2000 )
	self.Pixel2000 = Pixel2000
	
	local Pixel2001 = LUI.UIImage.new()
	Pixel2001:setLeftRight( true, false, 16.87, 52.87 )
	Pixel2001:setTopBottom( true, false, 436.57, 440.57 )
	Pixel2001:setRGB( 1, 1, 1 )
	Pixel2001:setYRot( -180 )
	Pixel2001:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2001:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2001 )
	self.Pixel2001 = Pixel2001
	
	local Pixel20000 = LUI.UIImage.new()
	Pixel20000:setLeftRight( true, false, 16.87, 52.87 )
	Pixel20000:setTopBottom( true, false, 434, 438 )
	Pixel20000:setRGB( 1, 1, 1 )
	Pixel20000:setYRot( -180 )
	Pixel20000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel20000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel20000 )
	self.Pixel20000 = Pixel20000
	
	local Pixel20010 = LUI.UIImage.new()
	Pixel20010:setLeftRight( true, false, 16.87, 52.87 )
	Pixel20010:setTopBottom( true, false, 304, 308 )
	Pixel20010:setRGB( 1, 1, 1 )
	Pixel20010:setYRot( -180 )
	Pixel20010:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel20010:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel20010 )
	self.Pixel20010 = Pixel20010
	
	local Pixel200000 = LUI.UIImage.new()
	Pixel200000:setLeftRight( true, false, 16.87, 52.87 )
	Pixel200000:setTopBottom( true, false, 275, 279 )
	Pixel200000:setRGB( 1, 1, 1 )
	Pixel200000:setYRot( -180 )
	Pixel200000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel200000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel200000 )
	self.Pixel200000 = Pixel200000
	
	local Pixel201 = LUI.UIImage.new()
	Pixel201:setLeftRight( true, false, 16.87, 52.87 )
	Pixel201:setTopBottom( true, false, 622, 626 )
	Pixel201:setRGB( 1, 1, 1 )
	Pixel201:setYRot( -180 )
	Pixel201:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel201:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel201 )
	self.Pixel201 = Pixel201
	
	local Image10 = LUI.UIImage.new()
	Image10:setLeftRight( true, true, 5.5, 0 )
	Image10:setTopBottom( false, false, -21.22, -17.22 )
	Image10:setRGB( 1, 1, 1 )
	Image10:setAlpha( 0.82 )
	Image10:setImage( RegisterImage( "uie_t7_menu_frontend_titlelinem" ) )
	Image10:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image10 )
	self.Image10 = Image10
	
	local Image100 = LUI.UIImage.new()
	Image100:setLeftRight( true, true, 5.5, 0 )
	Image100:setTopBottom( false, false, 263, 267 )
	Image100:setRGB( 1, 1, 1 )
	Image100:setAlpha( 0.82 )
	Image100:setImage( RegisterImage( "uie_t7_menu_frontend_titlelinem" ) )
	Image100:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image100 )
	self.Image100 = Image100
	
	local Image101 = LUI.UIImage.new()
	Image101:setLeftRight( true, true, 5.5, 0 )
	Image101:setTopBottom( false, false, -55, -51 )
	Image101:setRGB( 1, 1, 1 )
	Image101:setAlpha( 0.82 )
	Image101:setImage( RegisterImage( "uie_t7_menu_frontend_titlelinem" ) )
	Image101:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image101 )
	self.Image101 = Image101
	
	local Image1010 = LUI.UIImage.new()
	Image1010:setLeftRight( true, true, 5.5, 0 )
	Image1010:setTopBottom( false, false, -290.13, -286.13 )
	Image1010:setRGB( 1, 1, 1 )
	Image1010:setAlpha( 0.82 )
	Image1010:setImage( RegisterImage( "uie_t7_menu_frontend_titlelinem" ) )
	Image1010:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1010 )
	self.Image1010 = Image1010
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 21 )
				LineSide:completeAnimation()
				self.LineSide:setLeftRight( true, false, 15.5, 23.5 )
				self.LineSide:setTopBottom( true, false, 0, 670 )
				self.clipFinished( LineSide, {} )
				LineSide0:completeAnimation()
				self.LineSide0:setLeftRight( true, false, 0.5, 5.5 )
				self.LineSide0:setTopBottom( true, false, 0, 252 )
				self.clipFinished( LineSide0, {} )
				Pixel2:completeAnimation()
				self.Pixel2:setLeftRight( true, false, 16.87, 52.87 )
				self.Pixel2:setTopBottom( true, false, 145, 149 )
				self.clipFinished( Pixel2, {} )
				Pixel20:completeAnimation()
				self.Pixel20:setLeftRight( true, false, 16.87, 52.87 )
				self.Pixel20:setTopBottom( true, false, 593, 597 )
				self.clipFinished( Pixel20, {} )
				pixelc1:completeAnimation()
				self.pixelc1:setLeftRight( true, false, 0, 16 )
				self.pixelc1:setTopBottom( true, false, 187, 239 )
				self.clipFinished( pixelc1, {} )
				pixelc00:completeAnimation()
				self.pixelc00:setLeftRight( true, false, 0, 16 )
				self.pixelc00:setTopBottom( true, false, 187, 239 )
				self.clipFinished( pixelc00, {} )
				pixelc10:completeAnimation()
				self.pixelc10:setLeftRight( true, false, 0, 16 )
				self.pixelc10:setTopBottom( true, false, 347, 399 )
				self.clipFinished( pixelc10, {} )
				pixelc000:completeAnimation()
				self.pixelc000:setLeftRight( true, false, 0, 16 )
				self.pixelc000:setTopBottom( true, false, 347, 399 )
				self.clipFinished( pixelc000, {} )
				pixelc100:completeAnimation()
				self.pixelc100:setLeftRight( true, false, 0, 16 )
				self.pixelc100:setTopBottom( true, false, 504, 556 )
				self.clipFinished( pixelc100, {} )
				pixelc0000:completeAnimation()
				self.pixelc0000:setLeftRight( true, false, 0, 16 )
				self.pixelc0000:setTopBottom( true, false, 504, 556 )
				self.clipFinished( pixelc0000, {} )
				Pixel200:completeAnimation()
				self.Pixel200:setLeftRight( true, false, 16.87, 52.87 )
				self.Pixel200:setTopBottom( true, false, 531, 535 )
				self.clipFinished( Pixel200, {} )
				Pixel2000:completeAnimation()
				self.Pixel2000:setLeftRight( true, false, 16.87, 52.87 )
				self.Pixel2000:setTopBottom( true, false, 526, 530 )
				self.clipFinished( Pixel2000, {} )
				Pixel2001:completeAnimation()
				self.Pixel2001:setLeftRight( true, false, 16.87, 52.87 )
				self.Pixel2001:setTopBottom( true, false, 463, 467 )
				self.clipFinished( Pixel2001, {} )
				Pixel20000:completeAnimation()
				self.Pixel20000:setLeftRight( true, false, 16.87, 52.87 )
				self.Pixel20000:setTopBottom( true, false, 434, 438 )
				self.clipFinished( Pixel20000, {} )
				Pixel20010:completeAnimation()
				self.Pixel20010:setLeftRight( true, false, 16.87, 52.87 )
				self.Pixel20010:setTopBottom( true, false, 304, 308 )
				self.clipFinished( Pixel20010, {} )
				Pixel200000:completeAnimation()
				self.Pixel200000:setLeftRight( true, false, 16.87, 52.87 )
				self.Pixel200000:setTopBottom( true, false, 275, 279 )
				self.clipFinished( Pixel200000, {} )
				Pixel201:completeAnimation()
				self.Pixel201:setLeftRight( true, false, 16.87, 52.87 )
				self.Pixel201:setTopBottom( true, false, 622, 626 )
				self.clipFinished( Pixel201, {} )
				Image10:completeAnimation()
				self.Image10:setLeftRight( true, true, 5.5, 0 )
				self.Image10:setTopBottom( false, false, 103, 107 )
				self.clipFinished( Image10, {} )
				Image100:completeAnimation()
				self.Image100:setLeftRight( true, true, 5.5, 0 )
				self.Image100:setTopBottom( false, false, 263, 267 )
				self.clipFinished( Image100, {} )
				Image101:completeAnimation()
				self.Image101:setLeftRight( true, true, 5.5, 0 )
				self.Image101:setTopBottom( false, false, -55, -51 )
				self.clipFinished( Image101, {} )
				Image1010:completeAnimation()
				self.Image1010:setLeftRight( true, true, 5.5, 0 )
				self.Image1010:setTopBottom( false, false, -214, -210 )
				self.clipFinished( Image1010, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 21 )
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
				local LineSide0Frame2 = function ( LineSide0, event )
					if not event.interrupted then
						LineSide0:beginAnimation( "keyframe", 489, false, true, CoD.TweenType.Linear )
					end
					LineSide0:setLeftRight( true, false, 0.5, 5.5 )
					LineSide0:setTopBottom( true, false, 0, 252 )
					if event.interrupted then
						self.clipFinished( LineSide0, event )
					else
						LineSide0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LineSide0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
				LineSide0:setLeftRight( true, false, 0.5, 5.5 )
				LineSide0:setTopBottom( true, false, -25, -10 )
				LineSide0:registerEventHandler( "transition_complete_keyframe", LineSide0Frame2 )
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
						Pixel2:beginAnimation( "keyframe", 639, false, false, CoD.TweenType.Linear )
						Pixel2:registerEventHandler( "transition_complete_keyframe", Pixel2Frame3 )
					end
				end
				
				Pixel2:completeAnimation()
				self.Pixel2:setLeftRight( true, false, 16.87, 52.87 )
				self.Pixel2:setTopBottom( true, false, -35, -31 )
				Pixel2Frame2( Pixel2, {} )
				local Pixel20Frame2 = function ( Pixel20, event )
					local Pixel20Frame3 = function ( Pixel20, event )
						if not event.interrupted then
							Pixel20:beginAnimation( "keyframe", 400, false, true, CoD.TweenType.Back )
						end
						Pixel20:setLeftRight( true, false, 16.87, 52.87 )
						Pixel20:setTopBottom( true, false, 593, 597 )
						if event.interrupted then
							self.clipFinished( Pixel20, event )
						else
							Pixel20:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
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
				Pixel20Frame2( Pixel20, {} )
				local pixelc1Frame2 = function ( pixelc1, event )
					local pixelc1Frame3 = function ( pixelc1, event )
						if not event.interrupted then
							pixelc1:beginAnimation( "keyframe", 400, false, true, CoD.TweenType.Linear )
						end
						pixelc1:setLeftRight( true, false, 0, 16 )
						pixelc1:setTopBottom( true, false, 187, 239 )
						if event.interrupted then
							self.clipFinished( pixelc1, event )
						else
							pixelc1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						pixelc1Frame3( pixelc1, event )
						return 
					else
						pixelc1:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						pixelc1:registerEventHandler( "transition_complete_keyframe", pixelc1Frame3 )
					end
				end
				
				pixelc1:completeAnimation()
				self.pixelc1:setLeftRight( true, false, -70, -54 )
				self.pixelc1:setTopBottom( true, false, 162, 214 )
				pixelc1Frame2( pixelc1, {} )
				local pixelc00Frame2 = function ( pixelc00, event )
					if not event.interrupted then
						pixelc00:beginAnimation( "keyframe", 400, false, true, CoD.TweenType.Linear )
					end
					pixelc00:setLeftRight( true, false, 0, 16 )
					pixelc00:setTopBottom( true, false, 187, 239 )
					if event.interrupted then
						self.clipFinished( pixelc00, event )
					else
						pixelc00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				pixelc00:completeAnimation()
				self.pixelc00:setLeftRight( true, false, -70, -54 )
				self.pixelc00:setTopBottom( true, false, 162, 214 )
				pixelc00Frame2( pixelc00, {} )
				local pixelc10Frame2 = function ( pixelc10, event )
					local pixelc10Frame3 = function ( pixelc10, event )
						if not event.interrupted then
							pixelc10:beginAnimation( "keyframe", 400, false, true, CoD.TweenType.Linear )
						end
						pixelc10:setLeftRight( true, false, 0, 16 )
						pixelc10:setTopBottom( true, false, 347, 399 )
						if event.interrupted then
							self.clipFinished( pixelc10, event )
						else
							pixelc10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						pixelc10Frame3( pixelc10, event )
						return 
					else
						pixelc10:beginAnimation( "keyframe", 579, false, false, CoD.TweenType.Linear )
						pixelc10:registerEventHandler( "transition_complete_keyframe", pixelc10Frame3 )
					end
				end
				
				pixelc10:completeAnimation()
				self.pixelc10:setLeftRight( true, false, -70, -54 )
				self.pixelc10:setTopBottom( true, false, 322, 374 )
				pixelc10Frame2( pixelc10, {} )
				local pixelc000Frame2 = function ( pixelc000, event )
					local pixelc000Frame3 = function ( pixelc000, event )
						if not event.interrupted then
							pixelc000:beginAnimation( "keyframe", 400, false, true, CoD.TweenType.Back )
						end
						pixelc000:setLeftRight( true, false, 0, 16 )
						pixelc000:setTopBottom( true, false, 347, 399 )
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
						pixelc000:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						pixelc000:registerEventHandler( "transition_complete_keyframe", pixelc000Frame3 )
					end
				end
				
				pixelc000:completeAnimation()
				self.pixelc000:setLeftRight( true, false, -70, -54 )
				self.pixelc000:setTopBottom( true, false, 322, 374 )
				pixelc000Frame2( pixelc000, {} )
				local pixelc100Frame2 = function ( pixelc100, event )
					local pixelc100Frame3 = function ( pixelc100, event )
						if not event.interrupted then
							pixelc100:beginAnimation( "keyframe", 400, false, true, CoD.TweenType.Back )
						end
						pixelc100:setLeftRight( true, false, 0, 16 )
						pixelc100:setTopBottom( true, false, 504, 556 )
						if event.interrupted then
							self.clipFinished( pixelc100, event )
						else
							pixelc100:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						pixelc100Frame3( pixelc100, event )
						return 
					else
						pixelc100:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
						pixelc100:registerEventHandler( "transition_complete_keyframe", pixelc100Frame3 )
					end
				end
				
				pixelc100:completeAnimation()
				self.pixelc100:setLeftRight( true, false, -70, -54 )
				self.pixelc100:setTopBottom( true, false, 479, 531 )
				pixelc100Frame2( pixelc100, {} )
				local pixelc0000Frame2 = function ( pixelc0000, event )
					if not event.interrupted then
						pixelc0000:beginAnimation( "keyframe", 400, false, true, CoD.TweenType.Linear )
					end
					pixelc0000:setLeftRight( true, false, 0, 16 )
					pixelc0000:setTopBottom( true, false, 504, 556 )
					if event.interrupted then
						self.clipFinished( pixelc0000, event )
					else
						pixelc0000:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				pixelc0000:completeAnimation()
				self.pixelc0000:setLeftRight( true, false, -115, -99 )
				self.pixelc0000:setTopBottom( true, false, 494, 546 )
				pixelc0000Frame2( pixelc0000, {} )
				local Pixel200Frame2 = function ( Pixel200, event )
					local Pixel200Frame3 = function ( Pixel200, event )
						if not event.interrupted then
							Pixel200:beginAnimation( "keyframe", 400, false, true, CoD.TweenType.Linear )
						end
						Pixel200:setLeftRight( true, false, 16.87, 52.87 )
						Pixel200:setTopBottom( true, false, 531, 535 )
						if event.interrupted then
							self.clipFinished( Pixel200, event )
						else
							Pixel200:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
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
				Pixel200Frame2( Pixel200, {} )
				local Pixel2000Frame2 = function ( Pixel2000, event )
					local Pixel2000Frame3 = function ( Pixel2000, event )
						if not event.interrupted then
							Pixel2000:beginAnimation( "keyframe", 400, false, true, CoD.TweenType.Elastic )
						end
						Pixel2000:setLeftRight( true, false, 16.87, 52.87 )
						Pixel2000:setTopBottom( true, false, 526, 530 )
						if event.interrupted then
							self.clipFinished( Pixel2000, event )
						else
							Pixel2000:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
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
				local Pixel2001Frame2 = function ( Pixel2001, event )
					local Pixel2001Frame3 = function ( Pixel2001, event )
						if not event.interrupted then
							Pixel2001:beginAnimation( "keyframe", 400, false, true, CoD.TweenType.Linear )
						end
						Pixel2001:setLeftRight( true, false, 16.87, 52.87 )
						Pixel2001:setTopBottom( true, false, 463, 467 )
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
						Pixel2001:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
						Pixel2001:registerEventHandler( "transition_complete_keyframe", Pixel2001Frame3 )
					end
				end
				
				Pixel2001:completeAnimation()
				self.Pixel2001:setLeftRight( true, false, 16.87, 52.87 )
				self.Pixel2001:setTopBottom( true, false, -22, -18 )
				Pixel2001Frame2( Pixel2001, {} )
				local Pixel20000Frame2 = function ( Pixel20000, event )
					if not event.interrupted then
						Pixel20000:beginAnimation( "keyframe", 400, false, true, CoD.TweenType.Linear )
					end
					Pixel20000:setLeftRight( true, false, 16.87, 52.87 )
					Pixel20000:setTopBottom( true, false, 434, 438 )
					if event.interrupted then
						self.clipFinished( Pixel20000, event )
					else
						Pixel20000:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Pixel20000:completeAnimation()
				self.Pixel20000:setLeftRight( true, false, 16.87, 52.87 )
				self.Pixel20000:setTopBottom( true, false, -51, -47 )
				Pixel20000Frame2( Pixel20000, {} )
				local Pixel20010Frame2 = function ( Pixel20010, event )
					local Pixel20010Frame3 = function ( Pixel20010, event )
						if not event.interrupted then
							Pixel20010:beginAnimation( "keyframe", 399, false, true, CoD.TweenType.Back )
						end
						Pixel20010:setLeftRight( true, false, 16.87, 52.87 )
						Pixel20010:setTopBottom( true, false, 304, 308 )
						if event.interrupted then
							self.clipFinished( Pixel20010, event )
						else
							Pixel20010:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
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
						if not event.interrupted then
							Pixel200000:beginAnimation( "keyframe", 400, false, true, CoD.TweenType.Linear )
						end
						Pixel200000:setLeftRight( true, false, 16.87, 52.87 )
						Pixel200000:setTopBottom( true, false, 275, 279 )
						if event.interrupted then
							self.clipFinished( Pixel200000, event )
						else
							Pixel200000:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
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
				local Image10Frame2 = function ( Image10, event )
					local Image10Frame3 = function ( Image10, event )
						if not event.interrupted then
							Image10:beginAnimation( "keyframe", 400, false, true, CoD.TweenType.Linear )
						end
						Image10:setLeftRight( true, true, 5.5, 0 )
						Image10:setTopBottom( false, false, 103, 107 )
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
						Image10:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
						Image10:registerEventHandler( "transition_complete_keyframe", Image10Frame3 )
					end
				end
				
				Image10:completeAnimation()
				self.Image10:setLeftRight( true, true, 5.5, 0 )
				self.Image10:setTopBottom( false, false, -352, -348 )
				Image10Frame2( Image10, {} )
				local Image100Frame2 = function ( Image100, event )
					local Image100Frame3 = function ( Image100, event )
						if not event.interrupted then
							Image100:beginAnimation( "keyframe", 400, false, true, CoD.TweenType.Linear )
						end
						Image100:setLeftRight( true, true, 5.5, 0 )
						Image100:setTopBottom( false, false, 263, 267 )
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
				Image100Frame2( Image100, {} )
				local Image101Frame2 = function ( Image101, event )
					local Image101Frame3 = function ( Image101, event )
						if not event.interrupted then
							Image101:beginAnimation( "keyframe", 399, false, true, CoD.TweenType.Linear )
						end
						Image101:setLeftRight( true, true, 5.5, 0 )
						Image101:setTopBottom( false, false, -55, -51 )
						if event.interrupted then
							self.clipFinished( Image101, event )
						else
							Image101:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Image101Frame3( Image101, event )
						return 
					else
						Image101:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						Image101:registerEventHandler( "transition_complete_keyframe", Image101Frame3 )
					end
				end
				
				Image101:completeAnimation()
				self.Image101:setLeftRight( true, true, 5.5, 0 )
				self.Image101:setTopBottom( false, false, -355, -351 )
				Image101Frame2( Image101, {} )
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
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

