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
	
	local solidArrow = LUI.UIImage.new()
	solidArrow:setLeftRight( false, false, -16, 16 )
	solidArrow:setTopBottom( false, false, -16, 16 )
	solidArrow:setRGB( 1, 1, 1 )
	solidArrow:setImage( RegisterImage( "uie_t7_hud_minimap_arrow" ) )
	solidArrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( solidArrow )
	self.solidArrow = solidArrow
	
	local outlineArrow = LUI.UIImage.new()
	outlineArrow:setLeftRight( false, false, -16, 16 )
	outlineArrow:setTopBottom( false, false, -16, 16 )
	outlineArrow:setRGB( 1, 1, 1 )
	outlineArrow:setAlpha( 0 )
	outlineArrow:setImage( RegisterImage( "uie_t7_hud_minimap_arrow_line" ) )
	outlineArrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( outlineArrow )
	self.outlineArrow = outlineArrow
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				solidArrow:completeAnimation()
				self.solidArrow:setAlpha( 1 )
				self.clipFinished( solidArrow, {} )
				outlineArrow:completeAnimation()
				self.outlineArrow:setAlpha( 0 )
				self.clipFinished( outlineArrow, {} )
			end
		},
		SolidArrowState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				solidArrow:completeAnimation()
				self.solidArrow:setAlpha( 1 )
				self.clipFinished( solidArrow, {} )
				outlineArrow:completeAnimation()
				self.outlineArrow:setAlpha( 0 )
				self.clipFinished( outlineArrow, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

