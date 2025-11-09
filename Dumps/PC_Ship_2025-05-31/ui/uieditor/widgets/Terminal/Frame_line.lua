CoD.Frame_line = InheritFrom( LUI.UIElement )
CoD.Frame_line.new = function ( menu, controller )
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
	self:setClass( CoD.Frame_line )
	self.id = "Frame_line"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 180 )
	self:setTopBottom( true, false, 0, 12 )
	
	local line11 = LUI.UIImage.new()
	line11:setLeftRight( true, false, 0, 12 )
	line11:setTopBottom( true, true, 0, 0 )
	line11:setImage( RegisterImage( "uie_t7_menu_cp_datavault_frame_leftend" ) )
	self:addElement( line11 )
	self.line11 = line11
	
	local line1 = LUI.UIImage.new()
	line1:setLeftRight( true, true, 12, -12 )
	line1:setTopBottom( true, true, 0, 0 )
	line1:setImage( RegisterImage( "uie_t7_menu_cp_datavault_frame_center" ) )
	self:addElement( line1 )
	self.line1 = line1
	
	local line10 = LUI.UIImage.new()
	line10:setLeftRight( false, true, -12, 0 )
	line10:setTopBottom( true, true, 0, 0 )
	line10:setImage( RegisterImage( "uie_t7_menu_cp_datavault_frame_rightend" ) )
	self:addElement( line10 )
	self.line10 = line10
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

