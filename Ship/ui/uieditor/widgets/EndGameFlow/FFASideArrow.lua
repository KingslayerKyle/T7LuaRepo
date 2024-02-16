-- 8c506ee6e2d1f40ad43a8cd3365af7d1
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.EndGameFlow.FFASideArrowInt" )

CoD.FFASideArrow = InheritFrom( LUI.UIElement )
CoD.FFASideArrow.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.FFASideArrow )
	self.id = "FFASideArrow"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 192 )
	self:setTopBottom( true, false, 0, 144 )
	
	local FFASideArrowInt0 = CoD.FFASideArrowInt.new( menu, controller )
	FFASideArrowInt0:setLeftRight( true, true, 0, 0 )
	FFASideArrowInt0:setTopBottom( true, true, 0, 0 )
	FFASideArrowInt0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2" ) )
	FFASideArrowInt0:setShaderVector( 0, 30, 10, 0, 0 )
	self:addElement( FFASideArrowInt0 )
	self.FFASideArrowInt0 = FFASideArrowInt0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FFASideArrowInt0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
