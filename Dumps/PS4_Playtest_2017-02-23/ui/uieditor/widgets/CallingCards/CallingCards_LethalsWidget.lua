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
	self:setLeftRight( 0, 0, 0, 720 )
	self:setTopBottom( 0, 0, 0, 180 )
	self.anyChildUsesUpdateState = true
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( 0, 0, -32, 744 )
	BG:setTopBottom( 0, 0, -47, 222 )
	BG:setImage( RegisterImage( "uie_t7_callingcards_tacticals_bg" ) )
	self:addElement( BG )
	self.BG = BG
	
	local ember1 = LUI.UIImage.new()
	ember1:setLeftRight( 0, 0, -104, 846 )
	ember1:setTopBottom( 0, 0, -99, 230 )
	ember1:setImage( RegisterImage( "uie_t7_callingcards_tacticals_ember1" ) )
	ember1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	ember1:setShaderVector( 0, 1, 1, 0, 0 )
	ember1:setShaderVector( 1, 0, -0.09, 0, 0 )
	self:addElement( ember1 )
	self.ember1 = ember1
	
	local CallingCardsLethalsGlow = CoD.CallingCards_Lethals_Glow.new( menu, controller )
	CallingCardsLethalsGlow:setLeftRight( 0, 0, 65, 750 )
	CallingCardsLethalsGlow:setTopBottom( 0, 0, -408, 328 )
	self:addElement( CallingCardsLethalsGlow )
	self.CallingCardsLethalsGlow = CallingCardsLethalsGlow
	
	local beast = LUI.UIImage.new()
	beast:setLeftRight( 0, 0, -32, 744 )
	beast:setTopBottom( 0, 0, -47, 222 )
	beast:setImage( RegisterImage( "uie_t7_callingcards_tacticals_monster" ) )
	self:addElement( beast )
	self.beast = beast
	
	local ember2 = LUI.UIImage.new()
	ember2:setLeftRight( 0, 0, -202, 846 )
	ember2:setTopBottom( 0, 0, -70, 293 )
	ember2:setImage( RegisterImage( "uie_t7_callingcards_tacticals_ember2" ) )
	ember2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	ember2:setShaderVector( 0, 1, 1, 0, 0 )
	ember2:setShaderVector( 1, 0, -0.23, 0, 0 )
	self:addElement( ember2 )
	self.ember2 = ember2
	
	local fire = LUI.UIImage.new()
	fire:setLeftRight( 0, 0, -11, 408 )
	fire:setTopBottom( 0, 0, 88, 230 )
	fire:setImage( RegisterImage( "uie_t7_callingcards_tacticals_fire" ) )
	fire:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
	fire:setShaderVector( 0, 4, 0, 0, 0 )
	fire:setShaderVector( 1, 3.18, 0, 0, 0 )
	self:addElement( fire )
	self.fire = fire
	
	local jaw = LUI.UIImage.new()
	jaw:setLeftRight( 0, 0, 284, 474 )
	jaw:setTopBottom( 0, 0, 45, 200 )
	jaw:setImage( RegisterImage( "uie_t7_callingcards_tacticals_jaw" ) )
	jaw:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
	jaw:setShaderVector( 0, 3, 0, 0, 0 )
	jaw:setShaderVector( 1, 2, 0, 0, 0 )
	self:addElement( jaw )
	self.jaw = jaw
	
	local smoke = LUI.UIImage.new()
	smoke:setLeftRight( 0, 0, 176, 305 )
	smoke:setTopBottom( 0, 0, -39, 129 )
	smoke:setAlpha( 0.35 )
	smoke:setImage( RegisterImage( "uie_t7_callingcards_tacticals_nosesmoke" ) )
	smoke:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook_add" ) )
	smoke:setShaderVector( 0, 3, 0, 0, 0 )
	smoke:setShaderVector( 1, 2.04, 0, 0, 0 )
	self:addElement( smoke )
	self.smoke = smoke
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.CallingCardsLethalsGlow:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

