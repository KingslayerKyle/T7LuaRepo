-- 689de333f6f826ac2e82b248b0289c5f
-- This hash is used for caching, delete to decompile the file again

CoD.Frame_lineVertical = InheritFrom( LUI.UIElement )
CoD.Frame_lineVertical.new = function ( menu, controller )
	local self = LUI.UIVerticalList.new( {
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
	self:setAlignment( LUI.Alignment.Top )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Frame_lineVertical )
	self.id = "Frame_lineVertical"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 12 )
	self:setTopBottom( true, false, 0, 132 )
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, true, 0, 0 )
	Image1:setTopBottom( true, false, 0, 12 )
	Image1:setImage( RegisterImage( "uie_t7_menu_cp_datavault_frame_verticalendtop" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, true, 0, 0 )
	Image0:setTopBottom( true, true, 12, -12 )
	Image0:setImage( RegisterImage( "uie_t7_menu_cp_datavault_frame_verticalcenter" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local VerticalLine = LUI.UIImage.new()
	VerticalLine:setLeftRight( true, true, 0, 0 )
	VerticalLine:setTopBottom( false, true, -12, 0 )
	VerticalLine:setImage( RegisterImage( "uie_t7_menu_cp_datavault_frame_vertical_end" ) )
	self:addElement( VerticalLine )
	self.VerticalLine = VerticalLine
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

