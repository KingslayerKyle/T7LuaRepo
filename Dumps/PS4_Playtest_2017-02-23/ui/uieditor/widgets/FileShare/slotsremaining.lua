require( "ui.uieditor.widgets.FileShare.SlotCount" )

CoD.SlotsRemaining = InheritFrom( LUI.UIElement )
CoD.SlotsRemaining.new = function ( menu, controller )
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
	self:setAlignment( LUI.Alignment.Right )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.SlotsRemaining )
	self.id = "SlotsRemaining"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 426 )
	self:setTopBottom( 0, 0, 0, 66 )
	
	local SlotCount0 = CoD.SlotCount.new( menu, controller )
	SlotCount0:setLeftRight( 0, 0, 334, 426 )
	SlotCount0:setTopBottom( 0, 0, 14, 52 )
	self:addElement( SlotCount0 )
	self.SlotCount0 = SlotCount0
	
	local Label1 = LUI.UITightText.new()
	Label1:setLeftRight( 0, 0, 102, 334 )
	Label1:setTopBottom( 0, 0, 14, 52 )
	Label1:setText( Engine.Localize( "showcase slots available " ) )
	Label1:setTTF( "fonts/default.ttf" )
	self:addElement( Label1 )
	self.Label1 = Label1
	
	local Label2 = LUI.UITightText.new()
	Label2:setLeftRight( 0, 0, 10, 102 )
	Label2:setTopBottom( 0, 0, 14, 52 )
	Label2:setText( Engine.Localize( "Paintjobs " ) )
	Label2:setTTF( "fonts/default.ttf" )
	self:addElement( Label2 )
	self.Label2 = Label2
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.SlotCount0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

