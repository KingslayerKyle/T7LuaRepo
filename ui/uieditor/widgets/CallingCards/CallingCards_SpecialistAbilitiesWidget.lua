-- a02e650373c894aa4762122f2866889e
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCards_SpecialistAbilitiesWidget = InheritFrom( LUI.UIElement )
CoD.CallingCards_SpecialistAbilitiesWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_SpecialistAbilitiesWidget )
	self.id = "CallingCards_SpecialistAbilitiesWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	
	local Flipbook = LUI.UIImage.new()
	Flipbook:setLeftRight( true, false, 0, 480 )
	Flipbook:setTopBottom( true, false, 0, 120 )
	Flipbook:setImage( RegisterImage( "uie_t7_callingcard_mp_streetart_master_flipbook" ) )
	Flipbook:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
	Flipbook:setShaderVector( 0, 4, 0, 0, 0 )
	Flipbook:setShaderVector( 1, 6, 0, 0, 0 )
	self:addElement( Flipbook )
	self.Flipbook = Flipbook
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

