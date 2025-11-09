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
	self:setLeftRight( true, false, 0, 284 )
	self:setTopBottom( true, false, 0, 44 )
	
	local SlotCount0 = CoD.SlotCount.new( menu, controller )
	SlotCount0:setLeftRight( true, false, 223, 284 )
	SlotCount0:setTopBottom( true, false, 9.5, 34.5 )
	self:addElement( SlotCount0 )
	self.SlotCount0 = SlotCount0
	
	local Label1 = LUI.UITightText.new()
	Label1:setLeftRight( true, false, 68, 223 )
	Label1:setTopBottom( true, false, 9.5, 34.5 )
	Label1:setText( Engine.Localize( "showcase slots available " ) )
	Label1:setTTF( "fonts/default.ttf" )
	self:addElement( Label1 )
	self.Label1 = Label1
	
	local Label2 = LUI.UITightText.new()
	Label2:setLeftRight( true, false, 7, 68 )
	Label2:setTopBottom( true, false, 9.5, 34.5 )
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

