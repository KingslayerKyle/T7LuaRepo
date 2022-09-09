-- 1661937b033f95751f2777313fb0b7d1
-- This hash is used for caching, delete to decompile the file again

CoD.WaypointArrowWidget = InheritFrom( LUI.UIElement )
CoD.WaypointArrowWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.WaypointArrowWidget )
	self.id = "WaypointArrowWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 32 )
	self:setTopBottom( true, false, 0, 32 )
	
	local outlineArrow = LUI.UIImage.new()
	outlineArrow:setLeftRight( false, false, -13, 13 )
	outlineArrow:setTopBottom( false, false, -13, 13 )
	outlineArrow:setRGB( 0, 0, 0 )
	outlineArrow:setAlpha( 0 )
	outlineArrow:setImage( RegisterImage( "uie_t7_hud_waypoints_arrow_new" ) )
	self:addElement( outlineArrow )
	self.outlineArrow = outlineArrow
	
	local solidArrow = LUI.UIImage.new()
	solidArrow:setLeftRight( false, false, -9, 9 )
	solidArrow:setTopBottom( false, false, -9, 9 )
	solidArrow:setImage( RegisterImage( "uie_t7_hud_waypoints_arrow_new" ) )
	self:addElement( solidArrow )
	self.solidArrow = solidArrow
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				outlineArrow:completeAnimation()
				self.outlineArrow:setAlpha( 0 )
				self.clipFinished( outlineArrow, {} )

				solidArrow:completeAnimation()
				self.solidArrow:setAlpha( 1 )
				self.clipFinished( solidArrow, {} )
			end
		},
		SolidArrowState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				outlineArrow:completeAnimation()
				self.outlineArrow:setAlpha( 0 )
				self.clipFinished( outlineArrow, {} )

				solidArrow:completeAnimation()
				self.solidArrow:setAlpha( 1 )
				self.clipFinished( solidArrow, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
