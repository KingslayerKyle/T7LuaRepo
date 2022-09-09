-- 735403d3a6c245751e71600749dacf8b
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	self.anyChildUsesUpdateState = true
	
	local fire = LUI.UIImage.new()
	fire:setLeftRight( true, false, 0, 480 )
	fire:setTopBottom( true, false, 0, 120 )
	fire:setImage( RegisterImage( "uie_t7_callingcard_specialistkilljoy_bg_flipbook" ) )
	fire:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
	fire:setShaderVector( 0, 3, 0, 0, 0 )
	fire:setShaderVector( 1, 6, 0, 0, 0 )
	self:addElement( fire )
	self.fire = fire
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, false, 0, 480 )
	bg:setTopBottom( true, false, 0, 120 )
	bg:setImage( RegisterImage( "uie_t7_callingcard_specialistkilljoy_bg" ) )
	self:addElement( bg )
	self.bg = bg
	
	local smoke = LUI.UIImage.new()
	smoke:setLeftRight( true, false, 0, 480 )
	smoke:setTopBottom( true, false, 0, 81 )
	smoke:setAlpha( 0.85 )
	smoke:setImage( RegisterImage( "uie_t7_callingcard_specialistkilljoy_smoke" ) )
	smoke:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	smoke:setShaderVector( 0, 1, 1, 0, 0 )
	smoke:setShaderVector( 1, -0.15, 0, 0, 0 )
	self:addElement( smoke )
	self.smoke = smoke
	
	local man = LUI.UIImage.new()
	man:setLeftRight( true, false, 0, 480 )
	man:setTopBottom( true, false, 0, 120 )
	man:setImage( RegisterImage( "uie_t7_callingcard_specialistkilljoy_man" ) )
	self:addElement( man )
	self.man = man
	
	local CallingCardsSpecialistKilljoysEmber = CoD.CallingCards_SpecialistKilljoysEmber.new( menu, controller )
	CallingCardsSpecialistKilljoysEmber:setLeftRight( true, false, 0, 480 )
	CallingCardsSpecialistKilljoysEmber:setTopBottom( true, false, 0, 120 )
	self:addElement( CallingCardsSpecialistKilljoysEmber )
	self.CallingCardsSpecialistKilljoysEmber = CallingCardsSpecialistKilljoysEmber
	
	local CallingCardsSpecialistKilljoysEyes = CoD.CallingCards_SpecialistKilljoysEyes.new( menu, controller )
	CallingCardsSpecialistKilljoysEyes:setLeftRight( true, false, 342, 426 )
	CallingCardsSpecialistKilljoysEyes:setTopBottom( true, false, 34, 70 )
	self:addElement( CallingCardsSpecialistKilljoysEyes )
	self.CallingCardsSpecialistKilljoysEyes = CallingCardsSpecialistKilljoysEyes
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				CallingCardsSpecialistKilljoysEmber:completeAnimation()
				self.CallingCardsSpecialistKilljoysEmber:setAlpha( 1 )
				self.clipFinished( CallingCardsSpecialistKilljoysEmber, {} )

				CallingCardsSpecialistKilljoysEyes:completeAnimation()
				self.CallingCardsSpecialistKilljoysEyes:setAlpha( 1 )
				self.clipFinished( CallingCardsSpecialistKilljoysEyes, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CallingCardsSpecialistKilljoysEmber:close()
		element.CallingCardsSpecialistKilljoysEyes:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
