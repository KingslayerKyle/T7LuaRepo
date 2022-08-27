-- 0ce7ef22db8adba4a174bf58c7cc4f63
-- This hash is used for caching, delete to decompile the file again

CoD.OnePxLine = InheritFrom( LUI.UIElement )
CoD.OnePxLine.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 0
	} )
	self:setAlignment( LUI.Alignment.Left )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.OnePxLine )
	self.id = "OnePxLine"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 132 )
	self:setTopBottom( true, false, 0, 12 )
	
	local Left = LUI.UIImage.new()
	Left:setLeftRight( true, false, 0, 12 )
	Left:setTopBottom( true, true, 0, 0 )
	Left:setImage( RegisterImage( "uie_t7_menu_cp_datavault_1pxlineleft" ) )
	self:addElement( Left )
	self.Left = Left
	
	local Center = LUI.UIImage.new()
	Center:setLeftRight( true, true, 12, -12 )
	Center:setTopBottom( true, true, 0, 0 )
	Center:setImage( RegisterImage( "uie_t7_menu_cp_datavault_1pxlinecenter" ) )
	self:addElement( Center )
	self.Center = Center
	
	local right = LUI.UIImage.new()
	right:setLeftRight( false, true, -12, 0 )
	right:setTopBottom( true, true, 0, 0 )
	right:setImage( RegisterImage( "uie_t7_menu_cp_datavault_1pxlineright" ) )
	self:addElement( right )
	self.right = right
	
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

