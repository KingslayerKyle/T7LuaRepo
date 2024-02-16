-- ddf35c7d53f049e50609fdd8d2d798ed
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CallingCards.Clover.CallingCard_Clover_Rainbow" )
require( "ui.uieditor.widgets.HUD.ZM_FX.ZmFx_Spark2Ext" )

CoD.CallingCard_Clover_4 = InheritFrom( LUI.UIElement )
CoD.CallingCard_Clover_4.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.CallingCard_Clover_4 )
	self.id = "CallingCard_Clover_4"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	self.anyChildUsesUpdateState = true
	
	local TileBG = LUI.UIImage.new()
	TileBG:setLeftRight( true, true, 480, -480 )
	TileBG:setTopBottom( true, true, 0, 0 )
	TileBG:setImage( RegisterImage( "uie_t7_callingcard_mp_clover_bg_2" ) )
	TileBG:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	TileBG:setShaderVector( 0, -1, 1, 0, 0 )
	TileBG:setShaderVector( 1, 1.5, 0, 0, 0 )
	self:addElement( TileBG )
	self.TileBG = TileBG
	
	local TileRainbow = CoD.CallingCard_Clover_Rainbow.new( menu, controller )
	TileRainbow:setLeftRight( true, false, -652.56, 390.44 )
	TileRainbow:setTopBottom( true, false, -7, 133 )
	TileRainbow:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TileRainbow )
	self.TileRainbow = TileRainbow
	
	local FxSparkPink = CoD.ZmFx_Spark2Ext.new( menu, controller )
	FxSparkPink:setLeftRight( true, false, 286.44, 358.44 )
	FxSparkPink:setTopBottom( true, false, 34.5, 142.5 )
	FxSparkPink:setRGB( 1, 0.55, 0.99 )
	FxSparkPink:setXRot( 50 )
	FxSparkPink:setYRot( 180 )
	FxSparkPink:setZRot( -90 )
	FxSparkPink:setScale( 1.3 )
	FxSparkPink:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( FxSparkPink )
	self.FxSparkPink = FxSparkPink
	
	local FxSparkLarge = CoD.ZmFx_Spark2Ext.new( menu, controller )
	FxSparkLarge:setLeftRight( true, false, 192.43, 264.44 )
	FxSparkLarge:setTopBottom( true, false, 12, 120 )
	FxSparkLarge:setRGB( 1, 0.96, 0 )
	FxSparkLarge:setAlpha( 0.6 )
	FxSparkLarge:setXRot( -55 )
	FxSparkLarge:setYRot( 180 )
	FxSparkLarge:setZRot( -80 )
	FxSparkLarge:setScale( 3 )
	FxSparkLarge:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( FxSparkLarge )
	self.FxSparkLarge = FxSparkLarge
	
	local FxSparkRed = CoD.ZmFx_Spark2Ext.new( menu, controller )
	FxSparkRed:setLeftRight( true, false, 273.44, 345.44 )
	FxSparkRed:setTopBottom( true, false, -27.5, 80.5 )
	FxSparkRed:setRGB( 1, 0, 0.05 )
	FxSparkRed:setXRot( -70 )
	FxSparkRed:setYRot( 180 )
	FxSparkRed:setZRot( -60 )
	FxSparkRed:setScale( 2 )
	FxSparkRed:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( FxSparkRed )
	self.FxSparkRed = FxSparkRed
	
	local Clover4 = LUI.UIImage.new()
	Clover4:setLeftRight( true, false, 0, 480 )
	Clover4:setTopBottom( true, false, 0, 120 )
	Clover4:setImage( RegisterImage( "uie_t7_callingcard_mp_clover4_rainbow_anim" ) )
	Clover4:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
	Clover4:setShaderVector( 0, 1, 8, 0, 0 )
	Clover4:setShaderVector( 1, 18, 0, 0, 0 )
	self:addElement( Clover4 )
	self.Clover4 = Clover4
	
	local Flipbook = LUI.UIImage.new()
	Flipbook:setLeftRight( true, false, 300.44, 450.44 )
	Flipbook:setTopBottom( true, false, -5, 182 )
	Flipbook:setImage( RegisterImage( "uie_t7_callingcard_mp_clover_flipbook" ) )
	Flipbook:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
	Flipbook:setShaderVector( 0, 6, 3, 0, 0 )
	Flipbook:setShaderVector( 1, 30, 0, 0, 0 )
	self:addElement( Flipbook )
	self.Flipbook = Flipbook
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.TileRainbow:close()
		element.FxSparkPink:close()
		element.FxSparkLarge:close()
		element.FxSparkRed:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
