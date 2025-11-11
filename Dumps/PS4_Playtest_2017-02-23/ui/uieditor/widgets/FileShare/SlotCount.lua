require( "ui.uieditor.widgets.Fileshare.SlotCountText" )

CoD.SlotCount = InheritFrom( LUI.UIElement )
CoD.SlotCount.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.SlotCount )
	self.id = "SlotCount"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 90 )
	self:setTopBottom( 0, 0, 0, 37 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 0, 0, 92 )
	Image0:setTopBottom( 0, 0, 0, 38 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local SlotCountText0 = CoD.SlotCountText.new( menu, controller )
	SlotCountText0:setLeftRight( 0, 0, 0, 92 )
	SlotCountText0:setTopBottom( 0, 0, 0, 38 )
	SlotCountText0.Label0:setRGB( 0, 0, 0 )
	SlotCountText0.Label1:setRGB( 0, 0, 0 )
	SlotCountText0.Label2:setRGB( 0, 0, 0 )
	self:addElement( SlotCountText0 )
	self.SlotCountText0 = SlotCountText0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.SlotCountText0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

