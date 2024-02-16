-- a288636c12d5e94258fc5736c9743bdf
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.ZM_FX.ZmFx_Spark1Img" )

CoD.ZmFx_Spark2Ext = InheritFrom( LUI.UIElement )
CoD.ZmFx_Spark2Ext.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ZmFx_Spark2Ext )
	self.id = "ZmFx_Spark2Ext"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 112 )
	self:setTopBottom( true, false, 0, 168 )
	
	local ZmFxSpark1Img0 = CoD.ZmFx_Spark1Img.new( menu, controller )
	ZmFxSpark1Img0:setLeftRight( true, true, 15, -6 )
	ZmFxSpark1Img0:setTopBottom( true, true, 22.83, -8.67 )
	ZmFxSpark1Img0:setRGB( 0.66, 0.25, 0 )
	ZmFxSpark1Img0:setAlpha( 0.55 )
	ZmFxSpark1Img0.Image00:setShaderVector( 0, 10, 2, 0, 0 )
	ZmFxSpark1Img0.Image00:setShaderVector( 1, 12.59, 0, 0, 0 )
	self:addElement( ZmFxSpark1Img0 )
	self.ZmFxSpark1Img0 = ZmFxSpark1Img0
	
	local ZmFxSpark1Img1 = CoD.ZmFx_Spark1Img.new( menu, controller )
	ZmFxSpark1Img1:setLeftRight( true, true, 0, 0 )
	ZmFxSpark1Img1:setTopBottom( true, true, 0, 0 )
	ZmFxSpark1Img1.Image00:setShaderVector( 0, 10, 2, 0, 0 )
	ZmFxSpark1Img1.Image00:setShaderVector( 1, 30, 0, 0, 0 )
	self:addElement( ZmFxSpark1Img1 )
	self.ZmFxSpark1Img1 = ZmFxSpark1Img1
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ZmFxSpark1Img0:close()
		element.ZmFxSpark1Img1:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
