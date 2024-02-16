-- 043f488a3a70eedf184ea2cd5d64fb6d
-- This hash is used for caching, delete to decompile the file again

CoD.CenterReticle = InheritFrom( LUI.UIElement )
CoD.CenterReticle.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CenterReticle )
	self.id = "CenterReticle"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 1094 )
	self:setTopBottom( true, false, 0, 495 )
	
	local LeftOutside = LUI.UIImage.new()
	LeftOutside:setLeftRight( true, false, 0, 120 )
	LeftOutside:setTopBottom( false, false, -240, 240 )
	LeftOutside:setImage( RegisterImage( "uie_t7_hud_blackcell_leftoutside" ) )
	self:addElement( LeftOutside )
	self.LeftOutside = LeftOutside
	
	local LeftInside = LUI.UIImage.new()
	LeftInside:setLeftRight( false, false, -427, -91 )
	LeftInside:setTopBottom( false, false, -96, 96 )
	LeftInside:setImage( RegisterImage( "uie_t7_hud_blackcell_left_inside" ) )
	self:addElement( LeftInside )
	self.LeftInside = LeftInside
	
	local RightInside = LUI.UIImage.new()
	RightInside:setLeftRight( false, false, 90, 426 )
	RightInside:setTopBottom( false, false, -96, 96 )
	RightInside:setImage( RegisterImage( "uie_t7_hud_blackcell_right_inside" ) )
	self:addElement( RightInside )
	self.RightInside = RightInside
	
	local RightOutside0 = LUI.UIImage.new()
	RightOutside0:setLeftRight( false, true, -120, 0 )
	RightOutside0:setTopBottom( false, false, -240, 240 )
	RightOutside0:setImage( RegisterImage( "uie_t7_hud_blackcell_rightoutside" ) )
	self:addElement( RightOutside0 )
	self.RightOutside0 = RightOutside0
	
	local Center = LUI.UIImage.new()
	Center:setLeftRight( false, false, -90, 90 )
	Center:setTopBottom( false, false, -6, 6 )
	Center:setImage( RegisterImage( "uie_t7_hud_blackcell_center" ) )
	self:addElement( Center )
	self.Center = Center
	
	local centerBottom = LUI.UIImage.new()
	centerBottom:setLeftRight( false, false, -6, 6 )
	centerBottom:setTopBottom( false, false, -1.5, 118.5 )
	centerBottom:setRGB( 0.64, 1, 0.81 )
	centerBottom:setImage( RegisterImage( "uie_t7_hud_blackcell_centerbottom" ) )
	self:addElement( centerBottom )
	self.centerBottom = centerBottom
	
	local Top = LUI.UIImage.new()
	Top:setLeftRight( false, false, -72, 72 )
	Top:setTopBottom( false, false, -236.5, -128.5 )
	Top:setImage( RegisterImage( "uie_t7_hud_blackcell_topinside" ) )
	self:addElement( Top )
	self.Top = Top
	
	local Bottom = LUI.UIImage.new()
	Bottom:setLeftRight( false, false, -72, 72 )
	Bottom:setTopBottom( false, false, 118.5, 226.5 )
	Bottom:setImage( RegisterImage( "uie_t7_blackcell_bothinside" ) )
	self:addElement( Bottom )
	self.Bottom = Bottom
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				LeftInside:completeAnimation()
				self.LeftInside:setRGB( 1, 1, 1 )
				self.clipFinished( LeftInside, {} )

				RightInside:completeAnimation()
				self.RightInside:setRGB( 1, 1, 1 )
				self.clipFinished( RightInside, {} )

				Center:completeAnimation()
				self.Center:setRGB( 1, 1, 1 )
				self.clipFinished( Center, {} )

				centerBottom:completeAnimation()
				self.centerBottom:setRGB( 0.64, 1, 0.81 )
				self.clipFinished( centerBottom, {} )

				Top:completeAnimation()
				self.Top:setRGB( 1, 1, 1 )
				self.clipFinished( Top, {} )

				Bottom:completeAnimation()
				self.Bottom:setRGB( 1, 1, 1 )
				self.clipFinished( Bottom, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				LeftInside:completeAnimation()
				self.LeftInside:setRGB( 1, 0.15, 0.15 )
				self.clipFinished( LeftInside, {} )

				RightInside:completeAnimation()
				self.RightInside:setRGB( 1, 0.15, 0.15 )
				self.clipFinished( RightInside, {} )

				Center:completeAnimation()
				self.Center:setRGB( 1, 0.15, 0.15 )
				self.clipFinished( Center, {} )

				centerBottom:completeAnimation()
				self.centerBottom:setRGB( 1, 0.15, 0.15 )
				self.clipFinished( centerBottom, {} )

				Top:completeAnimation()
				self.Top:setRGB( 1, 0.15, 0.15 )
				self.clipFinished( Top, {} )

				Bottom:completeAnimation()
				self.Bottom:setRGB( 1, 0.15, 0.15 )
				self.clipFinished( Bottom, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
