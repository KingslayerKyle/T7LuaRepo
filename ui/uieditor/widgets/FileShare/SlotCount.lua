-- 82763bd4aff9c867fc5beb30b130002c
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 60 )
	self:setTopBottom( true, false, 0, 25 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 61 )
	Image0:setTopBottom( true, false, 0, 25 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local SlotCountText0 = CoD.SlotCountText.new( menu, controller )
	SlotCountText0:setLeftRight( true, false, 0, 61 )
	SlotCountText0:setTopBottom( true, false, 0, 25 )
	SlotCountText0.Label0:setRGB( 0, 0, 0 )
	SlotCountText0.Label1:setRGB( 0, 0, 0 )
	SlotCountText0.Label2:setRGB( 0, 0, 0 )
	self:addElement( SlotCountText0 )
	self.SlotCountText0 = SlotCountText0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.SlotCountText0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

