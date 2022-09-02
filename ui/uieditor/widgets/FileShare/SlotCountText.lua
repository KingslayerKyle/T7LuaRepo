-- ebbfe1ed5c55147cfccc78493b3dcc5a
-- This hash is used for caching, delete to decompile the file again

CoD.SlotCountText = InheritFrom( LUI.UIElement )
CoD.SlotCountText.new = function ( menu, controller )
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
	self:setAlignment( LUI.Alignment.Center )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.SlotCountText )
	self.id = "SlotCountText"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 60 )
	self:setTopBottom( true, false, 0, 25 )
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( true, false, 3, 27 )
	Label0:setTopBottom( true, false, 0, 25 )
	Label0:setText( Engine.Localize( "888" ) )
	Label0:setTTF( "fonts/default.ttf" )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	local Label1 = LUI.UITightText.new()
	Label1:setLeftRight( true, false, 27, 33 )
	Label1:setTopBottom( true, false, 0, 25 )
	Label1:setText( Engine.Localize( "/" ) )
	Label1:setTTF( "fonts/default.ttf" )
	self:addElement( Label1 )
	self.Label1 = Label1
	
	local Label2 = LUI.UITightText.new()
	Label2:setLeftRight( true, false, 33, 57 )
	Label2:setTopBottom( true, false, 0, 25 )
	Label2:setText( Engine.Localize( "999" ) )
	Label2:setTTF( "fonts/default.ttf" )
	self:addElement( Label2 )
	self.Label2 = Label2
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

