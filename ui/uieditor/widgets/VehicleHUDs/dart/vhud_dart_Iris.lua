-- 6d0110bc5fb8312c61c7b4200494e77f
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_IrisOutterDigi" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_IrisInnerContainer" )
require( "ui.uieditor.widgets.VehicleHUDs.dart.vhud_dart_IrisOuterThinInternal" )

CoD.vhud_dart_Iris = InheritFrom( LUI.UIElement )
CoD.vhud_dart_Iris.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.vhud_dart_Iris )
	self.id = "vhud_dart_Iris"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local OutterDigi0 = CoD.VehicleGround_IrisOutterDigi.new( menu, controller )
	OutterDigi0:setLeftRight( true, true, 0, 0 )
	OutterDigi0:setTopBottom( true, true, 0, 0 )
	OutterDigi0:setAlpha( 0 )
	self:addElement( OutterDigi0 )
	self.OutterDigi0 = OutterDigi0
	
	local IrisOutterEdge = LUI.UIImage.new()
	IrisOutterEdge:setLeftRight( true, false, 0, 272 )
	IrisOutterEdge:setTopBottom( true, true, 0, 0 )
	IrisOutterEdge:setAlpha( 0.5 )
	IrisOutterEdge:setZoom( 71 )
	IrisOutterEdge:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_irisoutteredge" ) )
	IrisOutterEdge:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( IrisOutterEdge )
	self.IrisOutterEdge = IrisOutterEdge
	
	local IrisOutterEdgeR = LUI.UIImage.new()
	IrisOutterEdgeR:setLeftRight( false, true, -272, 0 )
	IrisOutterEdgeR:setTopBottom( true, true, 0, 0 )
	IrisOutterEdgeR:setAlpha( 0.5 )
	IrisOutterEdgeR:setYRot( -180 )
	IrisOutterEdgeR:setZoom( 69 )
	IrisOutterEdgeR:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_irisoutteredge" ) )
	IrisOutterEdgeR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( IrisOutterEdgeR )
	self.IrisOutterEdgeR = IrisOutterEdgeR
	
	local InnerContainer0 = CoD.VehicleGround_IrisInnerContainer.new( menu, controller )
	InnerContainer0:setLeftRight( true, true, 0, 0 )
	InnerContainer0:setTopBottom( true, true, 0, 0 )
	InnerContainer0:setAlpha( 0.6 )
	InnerContainer0:setZRot( -17 )
	InnerContainer0:setZoom( 273 )
	self:addElement( InnerContainer0 )
	self.InnerContainer0 = InnerContainer0
	
	local vhuddartIrisOuterThinInternal = CoD.vhud_dart_IrisOuterThinInternal.new( menu, controller )
	vhuddartIrisOuterThinInternal:setLeftRight( true, true, -90, 90 )
	vhuddartIrisOuterThinInternal:setTopBottom( true, true, -130, 130 )
	self:addElement( vhuddartIrisOuterThinInternal )
	self.vhuddartIrisOuterThinInternal = vhuddartIrisOuterThinInternal
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.OutterDigi0:close()
		element.InnerContainer0:close()
		element.vhuddartIrisOuterThinInternal:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

