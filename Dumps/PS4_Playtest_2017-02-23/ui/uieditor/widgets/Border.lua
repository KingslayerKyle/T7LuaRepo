require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )

CoD.Border = InheritFrom( LUI.UIElement )
CoD.Border.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Border )
	self.id = "Border"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 540 )
	self:setTopBottom( 0, 0, 0, 37 )
	
	local FETitleNumBrdr00 = CoD.FE_TitleNumBrdr.new( menu, controller )
	FETitleNumBrdr00:setLeftRight( 0, 1, 2, 0 )
	FETitleNumBrdr00:setTopBottom( 0, 1, 0, 0 )
	self:addElement( FETitleNumBrdr00 )
	self.FETitleNumBrdr00 = FETitleNumBrdr00
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FETitleNumBrdr00:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

