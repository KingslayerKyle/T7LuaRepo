require( "ui.uieditor.widgets.CAC.MenuSelectScreen.TacRigInfoWidget" )
require( "ui.uieditor.widgets.CAC.UnlockTokensWidget" )

CoD.TacRigUpgradeWidget = InheritFrom( LUI.UIElement )
CoD.TacRigUpgradeWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.TacRigUpgradeWidget )
	self.id = "TacRigUpgradeWidget"
	self.soundSet = "CAC_LethalGrenade"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local TacRigInfoWidget = CoD.TacRigInfoWidget.new( menu, controller )
	TacRigInfoWidget:setLeftRight( true, false, 424, 1216 )
	TacRigInfoWidget:setTopBottom( true, false, 124, 684 )
	TacRigInfoWidget:setRGB( 1, 1, 1 )
	TacRigInfoWidget.UpgradeName:setText( Engine.Localize( "" ) )
	TacRigInfoWidget.UpgradeDesc:setText( Engine.Localize( "" ) )
	TacRigInfoWidget.PurchaseInstructionWidget.PurchaseInstruction:setText( Engine.Localize( "" ) )
	self:addElement( TacRigInfoWidget )
	self.TacRigInfoWidget = TacRigInfoWidget
	
	local UnlockTokensWidget = CoD.UnlockTokensWidget.new( menu, controller )
	UnlockTokensWidget:setLeftRight( true, false, 961.5, 1171.5 )
	UnlockTokensWidget:setTopBottom( true, false, 39.5, 73.5 )
	UnlockTokensWidget:setRGB( 1, 1, 1 )
	UnlockTokensWidget.Label1:setRGB( 0.58, 0.64, 0.65 )
	UnlockTokensWidget.Label1:setText( Engine.Localize( "19 UNLOCKS" ) )
	UnlockTokensWidget.Label1:setTTF( "fonts/Entovo.ttf" )
	self:addElement( UnlockTokensWidget )
	self.UnlockTokensWidget = UnlockTokensWidget
	
	local UpgradeTitle = LUI.UITightText.new()
	UpgradeTitle:setLeftRight( true, false, 64, 800 )
	UpgradeTitle:setTopBottom( true, false, 36, 84 )
	UpgradeTitle:setRGB( 1, 1, 1 )
	UpgradeTitle:setText( Engine.Localize( "" ) )
	UpgradeTitle:setTTF( "fonts/escom.ttf" )
	self:addElement( UpgradeTitle )
	self.UpgradeTitle = UpgradeTitle
	
	self.close = function ( self )
		self.TacRigInfoWidget:close()
		self.UnlockTokensWidget:close()
		CoD.TacRigUpgradeWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

