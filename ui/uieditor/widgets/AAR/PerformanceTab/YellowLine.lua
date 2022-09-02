-- 63742cceb93a136e5d1670899f620818
-- This hash is used for caching, delete to decompile the file again

CoD.YellowLine = InheritFrom( LUI.UIElement )
CoD.YellowLine.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.YellowLine )
	self.id = "YellowLine"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 2 )
	self:setTopBottom( true, false, 0, 124 )
	
	local YellowLine = LUI.UIImage.new()
	YellowLine:setLeftRight( true, false, 0, 2 )
	YellowLine:setTopBottom( true, false, 0, 124 )
	YellowLine:setRGB( ColorSet.PlayerYellow.r, ColorSet.PlayerYellow.g, ColorSet.PlayerYellow.b )
	YellowLine:setAlpha( 0.75 )
	self:addElement( YellowLine )
	self.YellowLine = YellowLine
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

