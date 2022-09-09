-- 2caf44963b99f4506ae56cd4394d802f
-- This hash is used for caching, delete to decompile the file again

CoD.FE_Menu_LeftGraphics = InheritFrom( LUI.UIElement )
CoD.FE_Menu_LeftGraphics.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.FE_Menu_LeftGraphics )
	self.id = "FE_Menu_LeftGraphics"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 52 )
	self:setTopBottom( true, false, 0, 617 )
	
	local Pixel200 = LUI.UIImage.new()
	Pixel200:setLeftRight( true, false, 9, 45 )
	Pixel200:setTopBottom( true, false, 565, 569 )
	Pixel200:setYRot( -180 )
	Pixel200:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel200:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel200 )
	self.Pixel200 = Pixel200
	
	local Pixel2001 = LUI.UIImage.new()
	Pixel2001:setLeftRight( true, false, 9, 45 )
	Pixel2001:setTopBottom( true, false, 44, 48 )
	Pixel2001:setYRot( -180 )
	Pixel2001:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2001:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2001 )
	self.Pixel2001 = Pixel2001
	
	local LineSide = LUI.UIImage.new()
	LineSide:setLeftRight( true, false, 33, 35 )
	LineSide:setTopBottom( true, false, 32, 583 )
	LineSide:setZRot( 180 )
	LineSide:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide )
	self.LineSide = LineSide
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				local f2_local0 = function ( f3_arg0, f3_arg1 )
					if not f3_arg1.interrupted then
						f3_arg0:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
					end
					f3_arg0:setLeftRight( true, false, 9, 45 )
					f3_arg0:setTopBottom( true, false, 565, 569 )
					f3_arg0:setAlpha( 1 )
					if f3_arg1.interrupted then
						self.clipFinished( f3_arg0, f3_arg1 )
					else
						f3_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Pixel200:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
				Pixel200:setLeftRight( true, false, 9, 45 )
				Pixel200:setTopBottom( true, false, -45, -41 )
				Pixel200:setAlpha( 0 )
				Pixel200:registerEventHandler( "transition_complete_keyframe", f2_local0 )
				local f2_local1 = function ( f4_arg0, f4_arg1 )
					if not f4_arg1.interrupted then
						f4_arg0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
					end
					f4_arg0:setLeftRight( true, false, 9, 45 )
					f4_arg0:setTopBottom( true, false, 44, 48 )
					f4_arg0:setAlpha( 1 )
					if f4_arg1.interrupted then
						self.clipFinished( f4_arg0, f4_arg1 )
					else
						f4_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Pixel2001:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
				Pixel2001:setLeftRight( true, false, 9, 45 )
				Pixel2001:setTopBottom( true, false, -36, -32 )
				Pixel2001:setAlpha( 0 )
				Pixel2001:registerEventHandler( "transition_complete_keyframe", f2_local1 )
				local f2_local2 = function ( f5_arg0, f5_arg1 )
					if not f5_arg1.interrupted then
						f5_arg0:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
					end
					f5_arg0:setLeftRight( true, false, 33, 35 )
					f5_arg0:setTopBottom( true, false, 32, 583 )
					f5_arg0:setAlpha( 1 )
					if f5_arg1.interrupted then
						self.clipFinished( f5_arg0, f5_arg1 )
					else
						f5_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LineSide:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
				LineSide:setLeftRight( true, false, 33, 35 )
				LineSide:setTopBottom( true, false, 32, 36 )
				LineSide:setAlpha( 1 )
				LineSide:registerEventHandler( "transition_complete_keyframe", f2_local2 )
			end,
			Intro = function ()
				self:setupElementClipCounter( 3 )

				local f6_local0 = function ( f7_arg0, f7_arg1 )
					if not f7_arg1.interrupted then
						f7_arg0:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
					end
					f7_arg0:setLeftRight( true, false, 9, 45 )
					f7_arg0:setTopBottom( true, false, 565, 569 )
					f7_arg0:setAlpha( 1 )
					if f7_arg1.interrupted then
						self.clipFinished( f7_arg0, f7_arg1 )
					else
						f7_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Pixel200:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
				Pixel200:setLeftRight( true, false, 9, 45 )
				Pixel200:setTopBottom( true, false, -45, -41 )
				Pixel200:setAlpha( 0 )
				Pixel200:registerEventHandler( "transition_complete_keyframe", f6_local0 )
				local Pixel2001Frame2 = function ( Pixel2001, event )
					if not event.interrupted then
						Pixel2001:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
					end
					Pixel2001:setLeftRight( true, false, 9, 45 )
					Pixel2001:setTopBottom( true, false, 44, 48 )
					Pixel2001:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Pixel2001, event )
					else
						Pixel2001:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Pixel2001:completeAnimation()
				self.Pixel2001:setLeftRight( true, false, 9, 45 )
				self.Pixel2001:setTopBottom( true, false, -36, -32 )
				self.Pixel2001:setAlpha( 0 )
				Pixel2001Frame2( Pixel2001, {} )
				local f6_local2 = function ( f9_arg0, f9_arg1 )
					if not f9_arg1.interrupted then
						f9_arg0:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
					end
					f9_arg0:setLeftRight( true, false, 33, 35 )
					f9_arg0:setTopBottom( true, false, 32, 583 )
					f9_arg0:setAlpha( 1 )
					if f9_arg1.interrupted then
						self.clipFinished( f9_arg0, f9_arg1 )
					else
						f9_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LineSide:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
				LineSide:setLeftRight( true, false, 33, 35 )
				LineSide:setTopBottom( true, false, 32, 36 )
				LineSide:setAlpha( 1 )
				LineSide:registerEventHandler( "transition_complete_keyframe", f6_local2 )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
