require( "ui.uieditor.widgets.CAC.cac_3dTitleIntermediary" )
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
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 1080 )
	self.anyChildUsesUpdateState = true
	
	local TacRigInfoWidget = CoD.TacRigInfoWidget.new( menu, controller )
	TacRigInfoWidget:setLeftRight( 0, 0, 636, 1824 )
	TacRigInfoWidget:setTopBottom( 0, 0, 186, 1026 )
	TacRigInfoWidget.UpgradeDesc:setText( Engine.Localize( "" ) )
	TacRigInfoWidget.PurchaseInstructionWidget.PurchaseInstruction:setText( Engine.Localize( "" ) )
	TacRigInfoWidget.cacTacticalRigDescription0.UpgradeName0:setText( Engine.Localize( "CYBERCOM_RIG_PLAYER_MOVEMENT_PRO" ) )
	self:addElement( TacRigInfoWidget )
	self.TacRigInfoWidget = TacRigInfoWidget
	
	local UnlockTokensWidget = CoD.UnlockTokensWidget.new( menu, controller )
	UnlockTokensWidget:setLeftRight( 0, 0, 1442, 1757 )
	UnlockTokensWidget:setTopBottom( 0, 0, 59, 110 )
	UnlockTokensWidget.tokenLabel:setTTF( "fonts/escom.ttf" )
	self:addElement( UnlockTokensWidget )
	self.UnlockTokensWidget = UnlockTokensWidget
	
	local UpgradeTitle = LUI.UITightText.new()
	UpgradeTitle:setLeftRight( 0, 0, 526, 1630 )
	UpgradeTitle:setTopBottom( 0, 0, -315, -243 )
	UpgradeTitle:setText( Engine.Localize( "" ) )
	UpgradeTitle:setTTF( "fonts/escom.ttf" )
	self:addElement( UpgradeTitle )
	self.UpgradeTitle = UpgradeTitle
	
	local cac3dTitleIntermediary = CoD.cac_3dTitleIntermediary.new( menu, controller )
	cac3dTitleIntermediary:setLeftRight( 0, 0, 36, 1104 )
	cac3dTitleIntermediary:setTopBottom( 0, 0, 0.5, 219.5 )
	cac3dTitleIntermediary.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "CPUI_PLAYER_MOVEMENT_UPGRADES" ) )
	self:addElement( cac3dTitleIntermediary )
	self.cac3dTitleIntermediary = cac3dTitleIntermediary
	
	local UpgradeTitle0 = LUI.UITightText.new()
	UpgradeTitle0:setLeftRight( 0, 0, 0, 1104 )
	UpgradeTitle0:setTopBottom( 0, 0, -121, -52 )
	UpgradeTitle0:setText( Engine.Localize( "" ) )
	UpgradeTitle0:setTTF( "fonts/escom.ttf" )
	self:addElement( UpgradeTitle0 )
	self.UpgradeTitle0 = UpgradeTitle0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.TacRigInfoWidget:close()
		self.UnlockTokensWidget:close()
		self.cac3dTitleIntermediary:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

