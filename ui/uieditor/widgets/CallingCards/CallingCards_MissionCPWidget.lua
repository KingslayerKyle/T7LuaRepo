-- 29ee74f0ab742144828116e269e25425
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCards_MissionCPWidget = InheritFrom( LUI.UIElement )
CoD.CallingCards_MissionCPWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CallingCards_MissionCPWidget )
	self.id = "CallingCards_MissionCPWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	
	local flipbook = LUI.UIImage.new()
	flipbook:setLeftRight( true, false, 0, 480 )
	flipbook:setTopBottom( true, false, 0, 120 )
	flipbook:setImage( RegisterImage( "uie_t7_callingcards_missionscp_flipbook" ) )
	flipbook:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
	flipbook:setShaderVector( 0, 5, 0, 0, 0 )
	flipbook:setShaderVector( 1, 6.39, 0, 0, 0 )
	self:addElement( flipbook )
	self.flipbook = flipbook
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

