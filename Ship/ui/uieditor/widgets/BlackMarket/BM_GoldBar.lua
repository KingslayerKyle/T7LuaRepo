-- 0af9c9bb9daa939686bad751b689bedf
-- This hash is used for caching, delete to decompile the file again

CoD.BM_GoldBar = InheritFrom( LUI.UIElement )
CoD.BM_GoldBar.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BM_GoldBar )
	self.id = "BM_GoldBar"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 190 )
	self:setTopBottom( true, false, 0, 20 )
	
	local Left = LUI.UIImage.new()
	Left:setLeftRight( true, false, 0, 84 )
	Left:setTopBottom( true, true, -8, 8 )
	Left:setImage( RegisterImage( "uie_t7_blackmarket_brandgoldbar_left" ) )
	self:addElement( Left )
	self.Left = Left
	
	local Right = LUI.UIImage.new()
	Right:setLeftRight( false, true, -84, 0 )
	Right:setTopBottom( true, true, -8, 8 )
	Right:setImage( RegisterImage( "uie_t7_blackmarket_brandgoldbar_right" ) )
	self:addElement( Right )
	self.Right = Right
	
	local Center = LUI.UIImage.new()
	Center:setLeftRight( true, true, 84, -84 )
	Center:setTopBottom( false, false, -18, 18 )
	Center:setImage( RegisterImage( "uie_t7_blackmarket_brandgoldbar_middle" ) )
	self:addElement( Center )
	self.Center = Center
	
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
