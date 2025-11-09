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
	
	local Pixel200 = LUI.UIImage.new()
	Pixel200:setLeftRight( true, false, 26.87, 62.87 )
	Pixel200:setTopBottom( true, false, 655.75, 659.75 )
	Pixel200:setYRot( -180 )
	Pixel200:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel200:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel200 )
	self.Pixel200 = Pixel200
	
	local Pixel2001 = LUI.UIImage.new()
	Pixel2001:setLeftRight( true, false, 26.87, 62.87 )
	Pixel2001:setTopBottom( true, false, 132.75, 136.75 )
	Pixel2001:setYRot( -180 )
	Pixel2001:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2001:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2001 )
	self.Pixel2001 = Pixel2001
	
	local LineSide = LUI.UIImage.new()
	LineSide:setLeftRight( true, false, 51, 53 )
	LineSide:setTopBottom( true, false, 123, 674 )
	LineSide:setZRot( 180 )
	LineSide:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide )
	self.LineSide = LineSide
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Intro = function ()
				self:setupElementClipCounter( 3 )
				local Pixel200Frame2 = function ( Pixel200, event )
					local Pixel200Frame3 = function ( Pixel200, event )
						local Pixel200Frame4 = function ( Pixel200, event )
							if not event.interrupted then
								Pixel200:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
							end
							Pixel200:setLeftRight( true, false, 26.87, 62.87 )
							Pixel200:setTopBottom( true, false, 655.75, 659.75 )
							Pixel200:setAlpha( 1 )
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
							Pixel200:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
							Pixel200:setTopBottom( true, false, 360.1, 364.1 )
							Pixel200:setAlpha( 1 )
							Pixel200:registerEventHandler( "transition_complete_keyframe", Pixel200Frame4 )
						end
					end
					
					if event.interrupted then
						Pixel200Frame3( Pixel200, event )
						return 
					else
						Pixel200:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
						Pixel200:setAlpha( 0.55 )
						Pixel200:registerEventHandler( "transition_complete_keyframe", Pixel200Frame3 )
					end
				end
				
				Pixel200:completeAnimation()
				self.Pixel200:setLeftRight( true, false, 26.87, 62.87 )
				self.Pixel200:setTopBottom( true, false, -49.25, -45.25 )
				self.Pixel200:setAlpha( 0 )
				Pixel200Frame2( Pixel200, {} )
				local Pixel2001Frame2 = function ( Pixel2001, event )
					local Pixel2001Frame3 = function ( Pixel2001, event )
						if not event.interrupted then
							Pixel2001:beginAnimation( "keyframe", 229, false, false, CoD.TweenType.Linear )
						end
						Pixel2001:setLeftRight( true, false, 26.87, 62.87 )
						Pixel2001:setTopBottom( true, false, 132.75, 136.75 )
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
						Pixel2001:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						Pixel2001:setTopBottom( true, false, 132.75, 136.75 )
						Pixel2001:setAlpha( 0.45 )
						Pixel2001:registerEventHandler( "transition_complete_keyframe", Pixel2001Frame3 )
					end
				end
				
				Pixel2001:completeAnimation()
				self.Pixel2001:setLeftRight( true, false, 26.87, 62.87 )
				self.Pixel2001:setTopBottom( true, false, -42.25, -38.25 )
				self.Pixel2001:setAlpha( 0 )
				Pixel2001Frame2( Pixel2001, {} )
				local f3_local2 = function ( f9_arg0, f9_arg1 )
					if not f9_arg1.interrupted then
						f9_arg0:beginAnimation( "keyframe", 339, false, false, CoD.TweenType.Linear )
					end
					f9_arg0:setLeftRight( true, false, 51, 53 )
					f9_arg0:setTopBottom( true, false, 123, 674 )
					f9_arg0:setAlpha( 1 )
					if f9_arg1.interrupted then
						self.clipFinished( f9_arg0, f9_arg1 )
					else
						f9_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LineSide:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
				LineSide:setLeftRight( true, false, 51, 53 )
				LineSide:setTopBottom( true, false, 123, 127 )
				LineSide:setAlpha( 1 )
				LineSide:registerEventHandler( "transition_complete_keyframe", f3_local2 )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

