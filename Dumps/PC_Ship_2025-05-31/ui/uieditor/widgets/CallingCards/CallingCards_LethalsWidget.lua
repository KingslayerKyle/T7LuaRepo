require( "ui.uieditor.widgets.CallingCards.CallingCards_Lethals_Glow" )

CoD.CallingCards_LethalsWidget = InheritFrom( LUI.UIElement )
CoD.CallingCards_LethalsWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_LethalsWidget )
	self.id = "CallingCards_LethalsWidget"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	self.anyChildUsesUpdateState = true
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( true, false, -21.83, 495.83 )
	BG:setTopBottom( true, false, -31.2, 148.26 )
	BG:setImage( RegisterImage( "uie_t7_callingcards_tacticals_bg" ) )
	self:addElement( BG )
	self.BG = BG
	
	local ember1 = LUI.UIImage.new()
	ember1:setLeftRight( true, false, -69.11, 564.07 )
	ember1:setTopBottom( true, false, -66.2, 153.3 )
	ember1:setImage( RegisterImage( "uie_t7_callingcards_tacticals_ember1" ) )
	ember1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	ember1:setShaderVector( 0, 1, 1, 0, 0 )
	ember1:setShaderVector( 1, 0, -0.09, 0, 0 )
	self:addElement( ember1 )
	self.ember1 = ember1
	
	local CallingCardsLethalsGlow = CoD.CallingCards_Lethals_Glow.new( menu, controller )
	CallingCardsLethalsGlow:setLeftRight( true, false, 43.64, 500.19 )
	CallingCardsLethalsGlow:setTopBottom( true, false, -271.68, 218.86 )
	self:addElement( CallingCardsLethalsGlow )
	self.CallingCardsLethalsGlow = CallingCardsLethalsGlow
	
	local beast = LUI.UIImage.new()
	beast:setLeftRight( true, false, -21.83, 495.83 )
	beast:setTopBottom( true, false, -31.2, 148.26 )
	beast:setImage( RegisterImage( "uie_t7_callingcards_tacticals_monster" ) )
	self:addElement( beast )
	self.beast = beast
	
	local ember2 = LUI.UIImage.new()
	ember2:setLeftRight( true, false, -134.4, 564.07 )
	ember2:setTopBottom( true, false, -46.73, 195.4 )
	ember2:setImage( RegisterImage( "uie_t7_callingcards_tacticals_ember2" ) )
	ember2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	ember2:setShaderVector( 0, 1, 1, 0, 0 )
	ember2:setShaderVector( 1, 0, -0.23, 0, 0 )
	self:addElement( ember2 )
	self.ember2 = ember2
	
	local fire = LUI.UIImage.new()
	fire:setLeftRight( true, false, -7.65, 271.91 )
	fire:setTopBottom( true, false, 58.53, 153.3 )
	fire:setImage( RegisterImage( "uie_t7_callingcards_tacticals_fire" ) )
	fire:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
	fire:setShaderVector( 0, 4, 0, 0, 0 )
	fire:setShaderVector( 1, 3.18, 0, 0, 0 )
	self:addElement( fire )
	self.fire = fire
	
	local jaw = LUI.UIImage.new()
	jaw:setLeftRight( true, false, 189, 315.95 )
	jaw:setTopBottom( true, false, 29.72, 132.95 )
	jaw:setImage( RegisterImage( "uie_t7_callingcards_tacticals_jaw" ) )
	jaw:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
	jaw:setShaderVector( 0, 3, 0, 0, 0 )
	jaw:setShaderVector( 1, 2, 0, 0, 0 )
	self:addElement( jaw )
	self.jaw = jaw
	
	local smoke = LUI.UIImage.new()
	smoke:setLeftRight( true, false, 117.17, 203 )
	smoke:setTopBottom( true, false, -26.41, 85.86 )
	smoke:setAlpha( 0.35 )
	smoke:setImage( RegisterImage( "uie_t7_callingcards_tacticals_nosesmoke" ) )
	smoke:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook_add" ) )
	smoke:setShaderVector( 0, 3, 0, 0, 0 )
	smoke:setShaderVector( 1, 2.04, 0, 0, 0 )
	self:addElement( smoke )
	self.smoke = smoke
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CallingCardsLethalsGlow:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

