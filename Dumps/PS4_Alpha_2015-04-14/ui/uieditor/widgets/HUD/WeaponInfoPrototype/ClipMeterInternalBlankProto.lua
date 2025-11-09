CoD.ClipMeterInternalBlankProto = InheritFrom( LUI.UIElement )
CoD.ClipMeterInternalBlankProto.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ClipMeterInternalBlankProto )
	self.id = "ClipMeterInternalBlankProto"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 102 )
	self:setTopBottom( true, false, 0, 4 )
	
	local ClipMeter = LUI.UIImage.new()
	ClipMeter:setLeftRight( true, true, 0, 0 )
	ClipMeter:setTopBottom( true, true, 0, 0 )
	ClipMeter:setRGB( 1, 1, 1 )
	ClipMeter:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( ClipMeter )
	self.ClipMeter = ClipMeter
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

