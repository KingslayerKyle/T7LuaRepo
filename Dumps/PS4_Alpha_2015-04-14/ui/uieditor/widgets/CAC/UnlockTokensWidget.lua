require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.CAC.cac_IconTokenStatic" )

CoD.UnlockTokensWidget = InheritFrom( LUI.UIElement )
CoD.UnlockTokensWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.UnlockTokensWidget )
	self.id = "UnlockTokensWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 172 )
	self:setTopBottom( true, false, 0, 45 )
	self.anyChildUsesUpdateState = true
	
	local FETitleNumBrdr0 = CoD.FE_TitleNumBrdr.new( menu, controller )
	FETitleNumBrdr0:setLeftRight( true, true, 0, -2.15 )
	FETitleNumBrdr0:setTopBottom( true, true, -4, -6.7 )
	FETitleNumBrdr0:setRGB( 1, 1, 1 )
	FETitleNumBrdr0:setAlpha( 0.2 )
	self:addElement( FETitleNumBrdr0 )
	self.FETitleNumBrdr0 = FETitleNumBrdr0
	
	local cacIconTokenStatic0 = CoD.cac_IconTokenStatic.new( menu, controller )
	cacIconTokenStatic0:setLeftRight( true, false, 6, 38 )
	cacIconTokenStatic0:setTopBottom( true, false, 2.2, 34.2 )
	cacIconTokenStatic0:setRGB( 1, 1, 1 )
	self:addElement( cacIconTokenStatic0 )
	self.cacIconTokenStatic0 = cacIconTokenStatic0
	
	local Label1 = LUI.UITightText.new()
	Label1:setLeftRight( false, true, -143.7, -14 )
	Label1:setTopBottom( false, false, -12.8, 6.2 )
	Label1:setRGB( 0.58, 0.64, 0.65 )
	Label1:setText( Engine.Localize( "19 UNLOCKS" ) )
	Label1:setTTF( "fonts/Entovo.ttf" )
	Label1:setLetterSpacing( 4.3 )
	self:addElement( Label1 )
	self.Label1 = Label1
	
	self.close = function ( self )
		self.FETitleNumBrdr0:close()
		self.cacIconTokenStatic0:close()
		CoD.UnlockTokensWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

