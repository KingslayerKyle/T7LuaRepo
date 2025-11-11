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
	self:setLeftRight( 0, 0, 0, 78 )
	self:setTopBottom( 0, 0, 0, 925 )
	
	local Pixel200 = LUI.UIImage.new()
	Pixel200:setLeftRight( 0, 0, 13, 67 )
	Pixel200:setTopBottom( 0, 0, 847, 853 )
	Pixel200:setYRot( -180 )
	Pixel200:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel200:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel200 )
	self.Pixel200 = Pixel200
	
	local Pixel2001 = LUI.UIImage.new()
	Pixel2001:setLeftRight( 0, 0, 13, 67 )
	Pixel2001:setTopBottom( 0, 0, 66, 72 )
	Pixel2001:setYRot( -180 )
	Pixel2001:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2001:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2001 )
	self.Pixel2001 = Pixel2001
	
	local LineSide = LUI.UIImage.new()
	LineSide:setLeftRight( 0, 0, 50, 53 )
	LineSide:setTopBottom( 0, 0, 48, 874 )
	LineSide:setZRot( 180 )
	LineSide:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide )
	self.LineSide = LineSide
	
	self.resetProperties = function ()
		Pixel2001:completeAnimation()
		Pixel200:completeAnimation()
		LineSide:completeAnimation()
		Pixel2001:setLeftRight( 0, 0, 13, 67 )
		Pixel2001:setTopBottom( 0, 0, 66, 72 )
		Pixel2001:setAlpha( 1 )
		Pixel200:setLeftRight( 0, 0, 13, 67 )
		Pixel200:setTopBottom( 0, 0, 847, 853 )
		Pixel200:setAlpha( 1 )
		LineSide:setLeftRight( 0, 0, 50, 53 )
		LineSide:setTopBottom( 0, 0, 48, 874 )
		LineSide:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				local Pixel200Frame2 = function ( Pixel200, event )
					if not event.interrupted then
						Pixel200:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
					end
					Pixel200:setLeftRight( 0, 0, 13, 67 )
					Pixel200:setTopBottom( 0, 0, 847, 853 )
					Pixel200:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Pixel200, event )
					else
						Pixel200:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Pixel200:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
				Pixel200:setLeftRight( 0, 0, 13, 67 )
				Pixel200:setTopBottom( 0, 0, -67, -61 )
				Pixel200:setAlpha( 0 )
				Pixel200:registerEventHandler( "transition_complete_keyframe", Pixel200Frame2 )
				local Pixel2001Frame2 = function ( Pixel2001, event )
					if not event.interrupted then
						Pixel2001:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
					end
					Pixel2001:setLeftRight( 0, 0, 13, 67 )
					Pixel2001:setTopBottom( 0, 0, 66, 72 )
					Pixel2001:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Pixel2001, event )
					else
						Pixel2001:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Pixel2001:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
				self.Pixel2001:setLeftRight( 0, 0, 13, 67 )
				self.Pixel2001:setTopBottom( 0, 0, -54, -48 )
				self.Pixel2001:setAlpha( 0 )
				Pixel2001:registerEventHandler( "transition_complete_keyframe", Pixel2001Frame2 )
				local LineSideFrame2 = function ( LineSide, event )
					if not event.interrupted then
						LineSide:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
					end
					LineSide:setLeftRight( 0, 0, 50, 53 )
					LineSide:setTopBottom( 0, 0, 48, 874 )
					LineSide:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LineSide, event )
					else
						LineSide:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LineSide:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
				LineSide:setLeftRight( 0, 0, 50, 53 )
				LineSide:setTopBottom( 0, 0, 48, 54 )
				LineSide:setAlpha( 1 )
				LineSide:registerEventHandler( "transition_complete_keyframe", LineSideFrame2 )
			end,
			Intro = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				local Pixel200Frame2 = function ( Pixel200, event )
					if not event.interrupted then
						Pixel200:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
					end
					Pixel200:setLeftRight( 0, 0, 13, 67 )
					Pixel200:setTopBottom( 0, 0, 847, 853 )
					Pixel200:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Pixel200, event )
					else
						Pixel200:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Pixel200:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
				Pixel200:setLeftRight( 0, 0, 13, 67 )
				Pixel200:setTopBottom( 0, 0, -67, -61 )
				Pixel200:setAlpha( 0 )
				Pixel200:registerEventHandler( "transition_complete_keyframe", Pixel200Frame2 )
				local Pixel2001Frame2 = function ( Pixel2001, event )
					if not event.interrupted then
						Pixel2001:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
					end
					Pixel2001:setLeftRight( 0, 0, 13, 67 )
					Pixel2001:setTopBottom( 0, 0, 66, 72 )
					Pixel2001:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Pixel2001, event )
					else
						Pixel2001:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Pixel2001:completeAnimation()
				self.Pixel2001:setLeftRight( 0, 0, 13, 67 )
				self.Pixel2001:setTopBottom( 0, 0, -54, -48 )
				self.Pixel2001:setAlpha( 0 )
				Pixel2001Frame2( Pixel2001, {} )
				local LineSideFrame2 = function ( LineSide, event )
					if not event.interrupted then
						LineSide:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
					end
					LineSide:setLeftRight( 0, 0, 50, 53 )
					LineSide:setTopBottom( 0, 0, 48, 874 )
					LineSide:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LineSide, event )
					else
						LineSide:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LineSide:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
				LineSide:setLeftRight( 0, 0, 50, 53 )
				LineSide:setTopBottom( 0, 0, 48, 54 )
				LineSide:setAlpha( 1 )
				LineSide:registerEventHandler( "transition_complete_keyframe", LineSideFrame2 )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

