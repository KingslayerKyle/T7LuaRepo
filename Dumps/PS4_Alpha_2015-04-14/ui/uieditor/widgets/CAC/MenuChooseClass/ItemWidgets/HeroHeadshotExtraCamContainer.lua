local PostLoadFunc = function ( self, controller, menu )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ()
		self.heroHeadshotRender:close()
	end )
end

CoD.HeroHeadshotExtraCamContainer = InheritFrom( LUI.UIElement )
CoD.HeroHeadshotExtraCamContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.HeroHeadshotExtraCamContainer )
	self.id = "HeroHeadshotExtraCamContainer"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 128 )
	self:setTopBottom( true, false, 0, 128 )
	
	local heroHeadshotRender = LUI.UIImage.new()
	heroHeadshotRender:setLeftRight( false, true, -128, 0 )
	heroHeadshotRender:setTopBottom( false, true, -128, 0 )
	heroHeadshotRender:setRGB( 1, 1, 1 )
	heroHeadshotRender:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	heroHeadshotRender:setupCharacterExtraCamHeadshotRender()
	self:addElement( heroHeadshotRender )
	self.heroHeadshotRender = heroHeadshotRender
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

