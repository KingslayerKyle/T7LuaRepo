CoD.vhud_siegebot_bootupWidget = InheritFrom( LUI.UIElement )
CoD.vhud_siegebot_bootupWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.vhud_siegebot_bootupWidget )
	self.id = "vhud_siegebot_bootupWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 640 )
	self:setTopBottom( true, false, 0, 360 )
	
	local Top1 = LUI.UIImage.new()
	Top1:setLeftRight( true, false, 438, 640 )
	Top1:setTopBottom( true, false, 186.08, 357 )
	Top1:setRGB( 0.8, 0.99, 1 )
	Top1:setAlpha( 0.5 )
	Top1:setImage( RegisterImage( "uie_t7_mp_hud_siegebot_vhud_element_1a" ) )
	Top1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Top1 )
	self.Top1 = Top1
	
	local Top2 = LUI.UIImage.new()
	Top2:setLeftRight( true, false, 342.38, 640 )
	Top2:setTopBottom( true, false, 138.02, 304 )
	Top2:setRGB( 0.8, 0.99, 1 )
	Top2:setAlpha( 0.4 )
	Top2:setImage( RegisterImage( "uie_t7_mp_hud_siegebot_vhud_element_3a" ) )
	Top2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Top2 )
	self.Top2 = Top2
	
	local Top3 = LUI.UIImage.new()
	Top3:setLeftRight( true, false, 208, 640 )
	Top3:setTopBottom( true, false, 43.54, 271.54 )
	Top3:setRGB( 0.8, 0.99, 1 )
	Top3:setAlpha( 0.3 )
	Top3:setImage( RegisterImage( "uie_t7_mp_hud_siegebot_vhud_element_2a" ) )
	Top3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Top3 )
	self.Top3 = Top3
	
	local Top4 = LUI.UIImage.new()
	Top4:setLeftRight( true, false, 146.82, 640 )
	Top4:setTopBottom( true, false, -7.73, 226.73 )
	Top4:setRGB( 0.8, 0.99, 1 )
	Top4:setAlpha( 0.2 )
	Top4:setImage( RegisterImage( "uie_t7_mp_hud_siegebot_vhud_element_4a" ) )
	Top4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Top4 )
	self.Top4 = Top4
	
	local Top5 = LUI.UIImage.new()
	Top5:setLeftRight( true, false, -11, 640 )
	Top5:setTopBottom( true, false, -10, 201.58 )
	Top5:setRGB( 0.8, 0.99, 1 )
	Top5:setAlpha( 0.1 )
	Top5:setImage( RegisterImage( "uie_t7_mp_hud_siegebot_vhud_element_5a" ) )
	Top5:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Top5 )
	self.Top5 = Top5
	
	local Bottom1 = LUI.UIImage.new()
	Bottom1:setLeftRight( true, false, 445.55, 583 )
	Bottom1:setTopBottom( true, false, 276, 360 )
	Bottom1:setRGB( 0.8, 0.99, 1 )
	Bottom1:setAlpha( 0.5 )
	Bottom1:setImage( RegisterImage( "uie_t7_mp_hud_siegebot_vhud_element_1b" ) )
	Bottom1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Bottom1 )
	self.Bottom1 = Bottom1
	
	local Bottom2 = LUI.UIImage.new()
	Bottom2:setLeftRight( true, false, 342.38, 463.69 )
	Bottom2:setTopBottom( true, false, 239, 360 )
	Bottom2:setRGB( 0.8, 0.99, 1 )
	Bottom2:setAlpha( 0.4 )
	Bottom2:setImage( RegisterImage( "uie_t7_mp_hud_siegebot_vhud_element_3b" ) )
	Bottom2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Bottom2 )
	self.Bottom2 = Bottom2
	
	local Bottom3 = LUI.UIImage.new()
	Bottom3:setLeftRight( true, false, 218.36, 373.5 )
	Bottom3:setTopBottom( true, false, 194, 360 )
	Bottom3:setRGB( 0.8, 0.99, 1 )
	Bottom3:setAlpha( 0.3 )
	Bottom3:setImage( RegisterImage( "uie_t7_mp_hud_siegebot_vhud_element_2b" ) )
	Bottom3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Bottom3 )
	self.Bottom3 = Bottom3
	
	local Bottom4 = LUI.UIImage.new()
	Bottom4:setLeftRight( true, false, 138.83, 252 )
	Bottom4:setTopBottom( true, false, 166, 360 )
	Bottom4:setRGB( 0.8, 0.99, 1 )
	Bottom4:setAlpha( 0.2 )
	Bottom4:setImage( RegisterImage( "uie_t7_mp_hud_siegebot_vhud_element_4b" ) )
	Bottom4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Bottom4 )
	self.Bottom4 = Bottom4
	
	local Bottom5 = LUI.UIImage.new()
	Bottom5:setLeftRight( true, false, -9.85, 159.84 )
	Bottom5:setTopBottom( true, false, 109.5, 360 )
	Bottom5:setRGB( 0.8, 0.99, 1 )
	Bottom5:setAlpha( 0.1 )
	Bottom5:setImage( RegisterImage( "uie_t7_mp_hud_siegebot_vhud_element_5b" ) )
	Bottom5:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Bottom5 )
	self.Bottom5 = Bottom5
	
	local Line = LUI.UIImage.new()
	Line:setLeftRight( false, false, 21.19, 177.19 )
	Line:setTopBottom( false, false, 41.01, 53.01 )
	Line:setRGB( 0.8, 0.99, 1 )
	Line:setAlpha( 0.5 )
	Line:setZRot( 20 )
	Line:setImage( RegisterImage( "uie_t7_mp_hud_vehicle_siegebot_linesidelarge" ) )
	Line:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Line )
	self.Line = Line
	
	local Line2 = LUI.UIImage.new()
	Line2:setLeftRight( false, false, 90, 246 )
	Line2:setTopBottom( false, false, -65.5, -53.5 )
	Line2:setRGB( 0.8, 0.99, 1 )
	Line2:setAlpha( 0.5 )
	Line2:setZRot( 20 )
	Line2:setImage( RegisterImage( "uie_t7_mp_hud_vehicle_siegebot_linesidelarge" ) )
	Line2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Line2 )
	self.Line2 = Line2
	
	local Line3 = LUI.UIImage.new()
	Line3:setLeftRight( false, false, -124.58, 31.42 )
	Line3:setTopBottom( false, false, -51.98, -39.98 )
	Line3:setRGB( 0.8, 0.99, 1 )
	Line3:setAlpha( 0.5 )
	Line3:setZRot( 20 )
	Line3:setImage( RegisterImage( "uie_t7_mp_hud_vehicle_siegebot_linesidelarge" ) )
	Line3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Line3 )
	self.Line3 = Line3
	
	local Line4 = LUI.UIImage.new()
	Line4:setLeftRight( false, false, -125.58, -35.58 )
	Line4:setTopBottom( false, false, 103, 115 )
	Line4:setRGB( 0.8, 0.99, 1 )
	Line4:setAlpha( 0.5 )
	Line4:setZRot( 90 )
	Line4:setImage( RegisterImage( "uie_t7_mp_hud_vehicle_siegebot_linesidelarge" ) )
	Line4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Line4 )
	self.Line4 = Line4
	
	local Line30 = LUI.UIImage.new()
	Line30:setLeftRight( false, false, -279.58, -225.17 )
	Line30:setTopBottom( false, false, -96.21, -84.21 )
	Line30:setRGB( 0.8, 0.99, 1 )
	Line30:setAlpha( 0.5 )
	Line30:setZRot( 20 )
	Line30:setImage( RegisterImage( "uie_t7_mp_hud_vehicle_siegebot_linesidelarge" ) )
	Line30:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Line30 )
	self.Line30 = Line30
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( false, false, 121.33, 143.69 )
	Image0:setTopBottom( false, false, 145, 157 )
	Image0:setAlpha( 0.5 )
	Image0:setZRot( 90 )
	Image0:setImage( RegisterImage( "uie_t7_mp_hud_vehicle_siegebot_linesidelarge" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( false, false, 214, 278 )
	Image1:setTopBottom( false, false, 60, 72 )
	Image1:setRGB( 0.8, 0.99, 1 )
	Image1:setAlpha( 0.5 )
	Image1:setZRot( 20 )
	Image1:setImage( RegisterImage( "uie_t7_mp_hud_vehicle_siegebot_linesidelarge" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( false, false, 199, 263 )
	Image2:setTopBottom( false, false, -152.21, -140.21 )
	Image2:setRGB( 0.8, 0.99, 1 )
	Image2:setAlpha( 0.5 )
	Image2:setZRot( 20 )
	Image2:setImage( RegisterImage( "uie_t7_mp_hud_vehicle_siegebot_linesidelarge" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( false, false, -143, -47.58 )
	Image3:setTopBottom( false, false, -152.21, -140.21 )
	Image3:setRGB( 0.8, 0.99, 1 )
	Image3:setAlpha( 0.5 )
	Image3:setZRot( 20 )
	Image3:setImage( RegisterImage( "uie_t7_mp_hud_vehicle_siegebot_linesidelarge" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( false, false, -181.17, -158.81 )
	Image4:setTopBottom( false, false, 40.73, 52.73 )
	Image4:setAlpha( 0.5 )
	Image4:setZRot( 90 )
	Image4:setImage( RegisterImage( "uie_t7_mp_hud_vehicle_siegebot_linesidelarge" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 20 )
				local Top1Frame2 = function ( Top1, event )
					local Top1Frame3 = function ( Top1, event )
						if not event.interrupted then
							Top1:beginAnimation( "keyframe", 420, false, false, CoD.TweenType.Linear )
						end
						Top1:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Top1, event )
						else
							Top1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Top1Frame3( Top1, event )
						return 
					else
						Top1:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						Top1:setAlpha( 0.15 )
						Top1:registerEventHandler( "transition_complete_keyframe", Top1Frame3 )
					end
				end
				
				Top1:completeAnimation()
				self.Top1:setAlpha( 0 )
				Top1Frame2( Top1, {} )
				local Top2Frame2 = function ( Top2, event )
					local Top2Frame3 = function ( Top2, event )
						local Top2Frame4 = function ( Top2, event )
							if not event.interrupted then
								Top2:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
							end
							Top2:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Top2, event )
							else
								Top2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Top2Frame4( Top2, event )
							return 
						else
							Top2:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
							Top2:setAlpha( 0.05 )
							Top2:registerEventHandler( "transition_complete_keyframe", Top2Frame4 )
						end
					end
					
					if event.interrupted then
						Top2Frame3( Top2, event )
						return 
					else
						Top2:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						Top2:registerEventHandler( "transition_complete_keyframe", Top2Frame3 )
					end
				end
				
				Top2:completeAnimation()
				self.Top2:setAlpha( 0 )
				Top2Frame2( Top2, {} )
				local Top3Frame2 = function ( Top3, event )
					local Top3Frame3 = function ( Top3, event )
						local Top3Frame4 = function ( Top3, event )
							if not event.interrupted then
								Top3:beginAnimation( "keyframe", 399, false, false, CoD.TweenType.Linear )
							end
							Top3:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Top3, event )
							else
								Top3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Top3Frame4( Top3, event )
							return 
						else
							Top3:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
							Top3:setAlpha( 0.15 )
							Top3:registerEventHandler( "transition_complete_keyframe", Top3Frame4 )
						end
					end
					
					if event.interrupted then
						Top3Frame3( Top3, event )
						return 
					else
						Top3:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						Top3:registerEventHandler( "transition_complete_keyframe", Top3Frame3 )
					end
				end
				
				Top3:completeAnimation()
				self.Top3:setAlpha( 0 )
				Top3Frame2( Top3, {} )
				local Top4Frame2 = function ( Top4, event )
					local Top4Frame3 = function ( Top4, event )
						local Top4Frame4 = function ( Top4, event )
							if not event.interrupted then
								Top4:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
							end
							Top4:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Top4, event )
							else
								Top4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Top4Frame4( Top4, event )
							return 
						else
							Top4:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							Top4:setAlpha( 0.05 )
							Top4:registerEventHandler( "transition_complete_keyframe", Top4Frame4 )
						end
					end
					
					if event.interrupted then
						Top4Frame3( Top4, event )
						return 
					else
						Top4:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						Top4:registerEventHandler( "transition_complete_keyframe", Top4Frame3 )
					end
				end
				
				Top4:completeAnimation()
				self.Top4:setAlpha( 0 )
				Top4Frame2( Top4, {} )
				local Top5Frame2 = function ( Top5, event )
					local Top5Frame3 = function ( Top5, event )
						local Top5Frame4 = function ( Top5, event )
							if not event.interrupted then
								Top5:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
							end
							Top5:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Top5, event )
							else
								Top5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Top5Frame4( Top5, event )
							return 
						else
							Top5:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							Top5:setAlpha( 0.15 )
							Top5:registerEventHandler( "transition_complete_keyframe", Top5Frame4 )
						end
					end
					
					if event.interrupted then
						Top5Frame3( Top5, event )
						return 
					else
						Top5:beginAnimation( "keyframe", 270, false, false, CoD.TweenType.Linear )
						Top5:registerEventHandler( "transition_complete_keyframe", Top5Frame3 )
					end
				end
				
				Top5:completeAnimation()
				self.Top5:setAlpha( 0 )
				Top5Frame2( Top5, {} )
				local Bottom1Frame2 = function ( Bottom1, event )
					local Bottom1Frame3 = function ( Bottom1, event )
						if not event.interrupted then
							Bottom1:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
						end
						Bottom1:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Bottom1, event )
						else
							Bottom1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Bottom1Frame3( Bottom1, event )
						return 
					else
						Bottom1:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						Bottom1:setAlpha( 0.25 )
						Bottom1:registerEventHandler( "transition_complete_keyframe", Bottom1Frame3 )
					end
				end
				
				Bottom1:completeAnimation()
				self.Bottom1:setAlpha( 0 )
				Bottom1Frame2( Bottom1, {} )
				local Bottom2Frame2 = function ( Bottom2, event )
					local Bottom2Frame3 = function ( Bottom2, event )
						local Bottom2Frame4 = function ( Bottom2, event )
							if not event.interrupted then
								Bottom2:beginAnimation( "keyframe", 419, false, false, CoD.TweenType.Linear )
							end
							Bottom2:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Bottom2, event )
							else
								Bottom2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Bottom2Frame4( Bottom2, event )
							return 
						else
							Bottom2:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
							Bottom2:setAlpha( 0.15 )
							Bottom2:registerEventHandler( "transition_complete_keyframe", Bottom2Frame4 )
						end
					end
					
					if event.interrupted then
						Bottom2Frame3( Bottom2, event )
						return 
					else
						Bottom2:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						Bottom2:registerEventHandler( "transition_complete_keyframe", Bottom2Frame3 )
					end
				end
				
				Bottom2:completeAnimation()
				self.Bottom2:setAlpha( 0 )
				Bottom2Frame2( Bottom2, {} )
				local Bottom3Frame2 = function ( Bottom3, event )
					local Bottom3Frame3 = function ( Bottom3, event )
						local Bottom3Frame4 = function ( Bottom3, event )
							if not event.interrupted then
								Bottom3:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
							end
							Bottom3:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Bottom3, event )
							else
								Bottom3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Bottom3Frame4( Bottom3, event )
							return 
						else
							Bottom3:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
							Bottom3:setAlpha( 0.25 )
							Bottom3:registerEventHandler( "transition_complete_keyframe", Bottom3Frame4 )
						end
					end
					
					if event.interrupted then
						Bottom3Frame3( Bottom3, event )
						return 
					else
						Bottom3:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						Bottom3:registerEventHandler( "transition_complete_keyframe", Bottom3Frame3 )
					end
				end
				
				Bottom3:completeAnimation()
				self.Bottom3:setAlpha( 0 )
				Bottom3Frame2( Bottom3, {} )
				local Bottom4Frame2 = function ( Bottom4, event )
					local Bottom4Frame3 = function ( Bottom4, event )
						local Bottom4Frame4 = function ( Bottom4, event )
							if not event.interrupted then
								Bottom4:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
							end
							Bottom4:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Bottom4, event )
							else
								Bottom4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Bottom4Frame4( Bottom4, event )
							return 
						else
							Bottom4:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							Bottom4:setAlpha( 0.15 )
							Bottom4:registerEventHandler( "transition_complete_keyframe", Bottom4Frame4 )
						end
					end
					
					if event.interrupted then
						Bottom4Frame3( Bottom4, event )
						return 
					else
						Bottom4:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						Bottom4:registerEventHandler( "transition_complete_keyframe", Bottom4Frame3 )
					end
				end
				
				Bottom4:completeAnimation()
				self.Bottom4:setAlpha( 0 )
				Bottom4Frame2( Bottom4, {} )
				local Bottom5Frame2 = function ( Bottom5, event )
					local Bottom5Frame3 = function ( Bottom5, event )
						local Bottom5Frame4 = function ( Bottom5, event )
							if not event.interrupted then
								Bottom5:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
							end
							Bottom5:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Bottom5, event )
							else
								Bottom5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Bottom5Frame4( Bottom5, event )
							return 
						else
							Bottom5:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							Bottom5:setAlpha( 0.25 )
							Bottom5:registerEventHandler( "transition_complete_keyframe", Bottom5Frame4 )
						end
					end
					
					if event.interrupted then
						Bottom5Frame3( Bottom5, event )
						return 
					else
						Bottom5:beginAnimation( "keyframe", 270, false, false, CoD.TweenType.Linear )
						Bottom5:registerEventHandler( "transition_complete_keyframe", Bottom5Frame3 )
					end
				end
				
				Bottom5:completeAnimation()
				self.Bottom5:setAlpha( 0 )
				Bottom5Frame2( Bottom5, {} )
				local LineFrame2 = function ( Line, event )
					local LineFrame3 = function ( Line, event )
						local LineFrame4 = function ( Line, event )
							if not event.interrupted then
								Line:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
							end
							Line:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Line, event )
							else
								Line:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							LineFrame4( Line, event )
							return 
						else
							Line:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Line:setAlpha( 0.5 )
							Line:registerEventHandler( "transition_complete_keyframe", LineFrame4 )
						end
					end
					
					if event.interrupted then
						LineFrame3( Line, event )
						return 
					else
						Line:beginAnimation( "keyframe", 800, false, false, CoD.TweenType.Linear )
						Line:registerEventHandler( "transition_complete_keyframe", LineFrame3 )
					end
				end
				
				Line:completeAnimation()
				self.Line:setAlpha( 0 )
				LineFrame2( Line, {} )
				local Line2Frame2 = function ( Line2, event )
					local Line2Frame3 = function ( Line2, event )
						local Line2Frame4 = function ( Line2, event )
							if not event.interrupted then
								Line2:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
							end
							Line2:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Line2, event )
							else
								Line2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Line2Frame4( Line2, event )
							return 
						else
							Line2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Line2:setAlpha( 0.5 )
							Line2:registerEventHandler( "transition_complete_keyframe", Line2Frame4 )
						end
					end
					
					if event.interrupted then
						Line2Frame3( Line2, event )
						return 
					else
						Line2:beginAnimation( "keyframe", 870, false, false, CoD.TweenType.Linear )
						Line2:registerEventHandler( "transition_complete_keyframe", Line2Frame3 )
					end
				end
				
				Line2:completeAnimation()
				self.Line2:setAlpha( 0 )
				Line2Frame2( Line2, {} )
				local Line3Frame2 = function ( Line3, event )
					local Line3Frame3 = function ( Line3, event )
						local Line3Frame4 = function ( Line3, event )
							if not event.interrupted then
								Line3:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
							end
							Line3:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Line3, event )
							else
								Line3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Line3Frame4( Line3, event )
							return 
						else
							Line3:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Line3:setAlpha( 0.5 )
							Line3:registerEventHandler( "transition_complete_keyframe", Line3Frame4 )
						end
					end
					
					if event.interrupted then
						Line3Frame3( Line3, event )
						return 
					else
						Line3:beginAnimation( "keyframe", 819, false, false, CoD.TweenType.Linear )
						Line3:registerEventHandler( "transition_complete_keyframe", Line3Frame3 )
					end
				end
				
				Line3:completeAnimation()
				self.Line3:setAlpha( 0 )
				Line3Frame2( Line3, {} )
				local Line4Frame2 = function ( Line4, event )
					local Line4Frame3 = function ( Line4, event )
						local Line4Frame4 = function ( Line4, event )
							if not event.interrupted then
								Line4:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
							end
							Line4:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Line4, event )
							else
								Line4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Line4Frame4( Line4, event )
							return 
						else
							Line4:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							Line4:setAlpha( 0.5 )
							Line4:registerEventHandler( "transition_complete_keyframe", Line4Frame4 )
						end
					end
					
					if event.interrupted then
						Line4Frame3( Line4, event )
						return 
					else
						Line4:beginAnimation( "keyframe", 839, false, false, CoD.TweenType.Linear )
						Line4:registerEventHandler( "transition_complete_keyframe", Line4Frame3 )
					end
				end
				
				Line4:completeAnimation()
				self.Line4:setAlpha( 0 )
				Line4Frame2( Line4, {} )
				local Line30Frame2 = function ( Line30, event )
					local Line30Frame3 = function ( Line30, event )
						local Line30Frame4 = function ( Line30, event )
							if not event.interrupted then
								Line30:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
							end
							Line30:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Line30, event )
							else
								Line30:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Line30Frame4( Line30, event )
							return 
						else
							Line30:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Line30:setAlpha( 0.5 )
							Line30:registerEventHandler( "transition_complete_keyframe", Line30Frame4 )
						end
					end
					
					if event.interrupted then
						Line30Frame3( Line30, event )
						return 
					else
						Line30:beginAnimation( "keyframe", 740, false, false, CoD.TweenType.Linear )
						Line30:registerEventHandler( "transition_complete_keyframe", Line30Frame3 )
					end
				end
				
				Line30:completeAnimation()
				self.Line30:setAlpha( 0 )
				Line30Frame2( Line30, {} )
				local Image0Frame2 = function ( Image0, event )
					local Image0Frame3 = function ( Image0, event )
						local Image0Frame4 = function ( Image0, event )
							if not event.interrupted then
								Image0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
							end
							Image0:setAlpha( 0 )
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
							Image0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Image0:setAlpha( 0.5 )
							Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame4 )
						end
					end
					
					if event.interrupted then
						Image0Frame3( Image0, event )
						return 
					else
						Image0:beginAnimation( "keyframe", 759, false, false, CoD.TweenType.Linear )
						Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame3 )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				Image0Frame2( Image0, {} )
				local Image1Frame2 = function ( Image1, event )
					local Image1Frame3 = function ( Image1, event )
						local Image1Frame4 = function ( Image1, event )
							if not event.interrupted then
								Image1:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
							end
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
							Image1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							Image1:setAlpha( 0.5 )
							Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame4 )
						end
					end
					
					if event.interrupted then
						Image1Frame3( Image1, event )
						return 
					else
						Image1:beginAnimation( "keyframe", 959, false, false, CoD.TweenType.Linear )
						Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame3 )
					end
				end
				
				Image1:completeAnimation()
				self.Image1:setAlpha( 0 )
				Image1Frame2( Image1, {} )
				local Image2Frame2 = function ( Image2, event )
					local Image2Frame3 = function ( Image2, event )
						local Image2Frame4 = function ( Image2, event )
							if not event.interrupted then
								Image2:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
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
							Image2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Image2:setAlpha( 0.5 )
							Image2:registerEventHandler( "transition_complete_keyframe", Image2Frame4 )
						end
					end
					
					if event.interrupted then
						Image2Frame3( Image2, event )
						return 
					else
						Image2:beginAnimation( "keyframe", 860, false, false, CoD.TweenType.Linear )
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
								Image3:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
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
							Image3:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Image3:setAlpha( 0.5 )
							Image3:registerEventHandler( "transition_complete_keyframe", Image3Frame4 )
						end
					end
					
					if event.interrupted then
						Image3Frame3( Image3, event )
						return 
					else
						Image3:beginAnimation( "keyframe", 810, false, false, CoD.TweenType.Linear )
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
								Image4:beginAnimation( "keyframe", 130, false, false, CoD.TweenType.Linear )
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
							Image4:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Image4:setAlpha( 0.5 )
							Image4:registerEventHandler( "transition_complete_keyframe", Image4Frame4 )
						end
					end
					
					if event.interrupted then
						Image4Frame3( Image4, event )
						return 
					else
						Image4:beginAnimation( "keyframe", 829, false, false, CoD.TweenType.Linear )
						Image4:registerEventHandler( "transition_complete_keyframe", Image4Frame3 )
					end
				end
				
				Image4:completeAnimation()
				self.Image4:setAlpha( 0 )
				Image4Frame2( Image4, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

