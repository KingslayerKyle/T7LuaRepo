-- d9369aaad9cd52094954d21daef308da
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.ZM_FX.ZmFx_Spark1Img" )

CoD.ZmFx_Spark1 = InheritFrom( LUI.UIElement )
CoD.ZmFx_Spark1.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ZmFx_Spark1 )
	self.id = "ZmFx_Spark1"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 112 )
	self:setTopBottom( true, false, 0, 168 )
	
	local ZmFxSpark1Img = CoD.ZmFx_Spark1Img.new( menu, controller )
	ZmFxSpark1Img:setLeftRight( true, true, 0, 0 )
	ZmFxSpark1Img:setTopBottom( true, true, 0, 0 )
	ZmFxSpark1Img.Image00:setShaderVector( 0, 10, 2, 0, 0 )
	ZmFxSpark1Img.Image00:setShaderVector( 1, 30, 0, 0, 0 )
	self:addElement( ZmFxSpark1Img )
	self.ZmFxSpark1Img = ZmFxSpark1Img
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ZmFxSpark1Img:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

