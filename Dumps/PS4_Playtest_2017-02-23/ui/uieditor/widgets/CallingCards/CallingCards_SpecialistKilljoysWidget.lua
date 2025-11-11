require( "ui.uieditor.widgets.CallingCards.CallingCards_SpecialistKilljoysEmber" )
require( "ui.uieditor.widgets.CallingCards.CallingCards_SpecialistKilljoysEyes" )

CoD.CallingCards_SpecialistKilljoysWidget = InheritFrom( LUI.UIElement )
CoD.CallingCards_SpecialistKilljoysWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_SpecialistKilljoysWidget )
	self.id = "CallingCards_SpecialistKilljoysWidget"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 720 )
	self:setTopBottom( 0, 0, 0, 180 )
	self.anyChildUsesUpdateState = true
	
	local fire = LUI.UIImage.new()
	fire:setLeftRight( 0, 0, 0, 720 )
	fire:setTopBottom( 0, 0, 0, 180 )
	fire:setImage( RegisterImage( "uie_t7_callingcard_specialistkilljoy_bg_flipbook" ) )
	fire:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
	fire:setShaderVector( 0, 3, 0, 0, 0 )
	fire:setShaderVector( 1, 6, 0, 0, 0 )
	self:addElement( fire )
	self.fire = fire
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( 0, 0, 0, 720 )
	bg:setTopBottom( 0, 0, 0, 180 )
	bg:setImage( RegisterImage( "uie_t7_callingcard_specialistkilljoy_bg" ) )
	self:addElement( bg )
	self.bg = bg
	
	local smoke = LUI.UIImage.new()
	smoke:setLeftRight( 0, 0, 0, 720 )
	smoke:setTopBottom( 0, 0, 0, 122 )
	smoke:setAlpha( 0.85 )
	smoke:setImage( RegisterImage( "uie_t7_callingcard_specialistkilljoy_smoke" ) )
	smoke:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	smoke:setShaderVector( 0, 1, 1, 0, 0 )
	smoke:setShaderVector( 1, -0.15, 0, 0, 0 )
	self:addElement( smoke )
	self.smoke = smoke
	
	local man = LUI.UIImage.new()
	man:setLeftRight( 0, 0, 0, 720 )
	man:setTopBottom( 0, 0, 0, 180 )
	man:setImage( RegisterImage( "uie_t7_callingcard_specialistkilljoy_man" ) )
	self:addElement( man )
	self.man = man
	
	local CallingCardsSpecialistKilljoysEmber = CoD.CallingCards_SpecialistKilljoysEmber.new( menu, controller )
	CallingCardsSpecialistKilljoysEmber:setLeftRight( 0, 0, 0, 720 )
	CallingCardsSpecialistKilljoysEmber:setTopBottom( 0, 0, 0, 180 )
	self:addElement( CallingCardsSpecialistKilljoysEmber )
	self.CallingCardsSpecialistKilljoysEmber = CallingCardsSpecialistKilljoysEmber
	
	local CallingCardsSpecialistKilljoysEyes = CoD.CallingCards_SpecialistKilljoysEyes.new( menu, controller )
	CallingCardsSpecialistKilljoysEyes:setLeftRight( 0, 0, 513, 639 )
	CallingCardsSpecialistKilljoysEyes:setTopBottom( 0, 0, 51, 105 )
	self:addElement( CallingCardsSpecialistKilljoysEyes )
	self.CallingCardsSpecialistKilljoysEyes = CallingCardsSpecialistKilljoysEyes
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.CallingCardsSpecialistKilljoysEmber:close()
		self.CallingCardsSpecialistKilljoysEyes:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

