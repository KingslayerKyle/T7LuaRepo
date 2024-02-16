-- a506b1d800239818bc61fa244ac97229
-- This hash is used for caching, delete to decompile the file again

CoD.vhud_CenterCircleHorizon = InheritFrom( LUI.UIElement )
CoD.vhud_CenterCircleHorizon.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.vhud_CenterCircleHorizon )
	self.id = "vhud_CenterCircleHorizon"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 89 )
	self:setTopBottom( true, false, 0, 89 )
	
	local CenterCircleHorizon = LUI.UIImage.new()
	CenterCircleHorizon:setLeftRight( true, false, 0, 89 )
	CenterCircleHorizon:setTopBottom( true, false, 0, 89 )
	CenterCircleHorizon:setAlpha( 0.1 )
	CenterCircleHorizon:setZoom( -40 )
	CenterCircleHorizon:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_dart_reticlecentercircle" ) )
	self:addElement( CenterCircleHorizon )
	self.CenterCircleHorizon = CenterCircleHorizon
	
	local CenterCircleHorizon0 = LUI.UIImage.new()
	CenterCircleHorizon0:setLeftRight( true, false, 0, 89 )
	CenterCircleHorizon0:setTopBottom( true, false, 0, 89 )
	CenterCircleHorizon0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_dart_reticlecentercircle" ) )
	CenterCircleHorizon0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CenterCircleHorizon0 )
	self.CenterCircleHorizon0 = CenterCircleHorizon0
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
