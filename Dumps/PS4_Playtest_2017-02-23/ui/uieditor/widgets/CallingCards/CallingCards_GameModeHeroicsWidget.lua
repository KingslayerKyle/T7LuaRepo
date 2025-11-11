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
	self:setLeftRight( 0, 0, 0, 720 )
	self:setTopBottom( 0, 0, 0, 180 )
	
	local Flipbook = LUI.UIImage.new()
	Flipbook:setLeftRight( 0, 0, 0, 720 )
	Flipbook:setTopBottom( 0, 0, 0, 180 )
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

