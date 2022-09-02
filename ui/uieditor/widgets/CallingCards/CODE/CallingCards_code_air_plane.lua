-- 2138ad0ef34eac14a1babf279514a3b8
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCards_code_air_plane = InheritFrom( LUI.UIElement )
CoD.CallingCards_code_air_plane.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CallingCards_code_air_plane )
	self.id = "CallingCards_code_air_plane"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	
	local clouds = LUI.UIImage.new()
	clouds:setLeftRight( true, false, 0, 480 )
	clouds:setTopBottom( true, false, 0, 120 )
	clouds:setImage( RegisterImage( "uie_t7_callingcards_air_plane" ) )
	self:addElement( clouds )
	self.clouds = clouds
	
	local propeller = LUI.UIImage.new()
	propeller:setLeftRight( true, false, 439, 480 )
	propeller:setTopBottom( true, false, -22, 142 )
	propeller:setImage( RegisterImage( "uie_t7_callingcards_air_propellerflip" ) )
	propeller:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
	propeller:setShaderVector( 0, 2, 0, 0, 0 )
	propeller:setShaderVector( 1, 6.57, 0, 0, 0 )
	self:addElement( propeller )
	self.propeller = propeller
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

