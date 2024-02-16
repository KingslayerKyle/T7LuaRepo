-- e997090bf8823c559f71a9c248fb09e6
-- This hash is used for caching, delete to decompile the file again

CoD.ChargeShot_OuterReticle = InheritFrom( LUI.UIElement )
CoD.ChargeShot_OuterReticle.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ChargeShot_OuterReticle )
	self.id = "ChargeShot_OuterReticle"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 168 )
	self:setTopBottom( true, false, 0, 168 )
	
	local Outer1 = LUI.UIImage.new()
	Outer1:setLeftRight( true, true, 0, 0 )
	Outer1:setTopBottom( true, true, 0, 0 )
	Outer1:setImage( RegisterImage( "uie_chargeshot_outer_ru" ) )
	self:addElement( Outer1 )
	self.Outer1 = Outer1
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
