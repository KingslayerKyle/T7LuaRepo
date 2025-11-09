require( "ui.uieditor.widgets.Lobby.Common.FE_TitleLine" )

CoD.MidLine = InheritFrom( LUI.UIElement )
CoD.MidLine.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MidLine )
	self.id = "MidLine"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 301 )
	self:setTopBottom( true, false, 0, 4 )
	
	local FETitleLineL = CoD.FE_TitleLine.new( menu, controller )
	FETitleLineL:setLeftRight( true, true, 0, 0 )
	FETitleLineL:setTopBottom( false, false, -2, 2 )
	FETitleLineL:setRGB( 1, 1, 1 )
	FETitleLineL.Image00:setAlpha( 1 )
	FETitleLineL.Image10:setAlpha( 1 )
	FETitleLineL.Image20:setAlpha( 1 )
	FETitleLineL.Image000:setAlpha( 1 )
	FETitleLineL.Image100:setAlpha( 1 )
	FETitleLineL.Image200:setAlpha( 1 )
	self:addElement( FETitleLineL )
	self.FETitleLineL = FETitleLineL
	
	local FETitleLineL0 = CoD.FE_TitleLine.new( menu, controller )
	FETitleLineL0:setLeftRight( true, true, 0, 0 )
	FETitleLineL0:setTopBottom( false, false, -2, 2 )
	FETitleLineL0:setRGB( 1, 1, 1 )
	FETitleLineL0.Image00:setAlpha( 1 )
	FETitleLineL0.Image10:setAlpha( 1 )
	FETitleLineL0.Image20:setAlpha( 1 )
	FETitleLineL0.Image000:setAlpha( 1 )
	FETitleLineL0.Image100:setAlpha( 1 )
	FETitleLineL0.Image200:setAlpha( 1 )
	self:addElement( FETitleLineL0 )
	self.FETitleLineL0 = FETitleLineL0
	
	self.close = function ( self )
		self.FETitleLineL:close()
		self.FETitleLineL0:close()
		CoD.MidLine.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

