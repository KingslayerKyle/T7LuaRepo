require( "ui.uieditor.widgets.Heroes.heroCarouselProgressBar" )

CoD.heroLevelWidget = InheritFrom( LUI.UIElement )
CoD.heroLevelWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.heroLevelWidget )
	self.id = "heroLevelWidget"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 204 )
	self:setTopBottom( true, false, 0, 35 )
	
	local heroLevelLabel = LUI.UITightText.new()
	heroLevelLabel:setLeftRight( true, false, 0, 76 )
	heroLevelLabel:setTopBottom( false, true, -35, -15 )
	heroLevelLabel:setRGB( 1, 1, 1 )
	heroLevelLabel:setText( Engine.Localize( "HEROES_HERO_LEVEL" ) )
	heroLevelLabel:setTTF( "fonts/default.ttf" )
	self:addElement( heroLevelLabel )
	self.heroLevelLabel = heroLevelLabel
	
	local heroCarouselProgressBar0 = CoD.heroCarouselProgressBar.new( menu, controller )
	heroCarouselProgressBar0:setLeftRight( true, false, 0, 204 )
	heroCarouselProgressBar0:setTopBottom( false, true, -15, 0 )
	heroCarouselProgressBar0:setRGB( 1, 1, 1 )
	self:addElement( heroCarouselProgressBar0 )
	self.heroCarouselProgressBar0 = heroCarouselProgressBar0
	
	self.close = function ( self )
		self.heroCarouselProgressBar0:close()
		CoD.heroLevelWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

