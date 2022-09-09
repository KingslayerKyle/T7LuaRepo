-- 327d5a48726ed8ac395d2a2c58f1aa2d
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCards_GameModeHeroicsWidget = InheritFrom( LUI.UIElement )
CoD.CallingCards_GameModeHeroicsWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_GameModeHeroicsWidget )
	self.id = "CallingCards_GameModeHeroicsWidget"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	
	local Flipbook = LUI.UIImage.new()
	Flipbook:setLeftRight( true, false, 0, 480 )
	Flipbook:setTopBottom( true, false, 0, 120 )
	Flipbook:setImage( RegisterImage( "uie_t7_callingcards_gamemodeheroics_flipbook" ) )
	Flipbook:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
	Flipbook:setShaderVector( 0, 5, 0, 0, 0 )
	Flipbook:setShaderVector( 1, 7, 0, 0, 0 )
	self:addElement( Flipbook )
	self.Flipbook = Flipbook
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
