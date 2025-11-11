require( "ui.uieditor.widgets.CAC.cac_TacticalRigDescription" )
require( "ui.uieditor.widgets.CAC.PurchaseInstructionWidget" )

CoD.TacRigInfoWidget = InheritFrom( LUI.UIElement )
CoD.TacRigInfoWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.TacRigInfoWidget )
	self.id = "TacRigInfoWidget"
	self.soundSet = "CAC_LethalGrenade"
	self:setLeftRight( 0, 0, 0, 1500 )
	self:setTopBottom( 0, 0, 0, 900 )
	
	local UpgradeDesc = LUI.UIText.new()
	UpgradeDesc:setLeftRight( 0, 0, 29, 517 )
	UpgradeDesc:setTopBottom( 0, 0, 74, 108 )
	UpgradeDesc:setText( Engine.Localize( "" ) )
	UpgradeDesc:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	UpgradeDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	UpgradeDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( UpgradeDesc )
	self.UpgradeDesc = UpgradeDesc
	
	local UpdgradeImage = LUI.UIImage.new()
	UpdgradeImage:setLeftRight( 1, 1, -750, -191 )
	UpdgradeImage:setTopBottom( 0, 0, 149, 574 )
	UpdgradeImage:setAlpha( 0.5 )
	self:addElement( UpdgradeImage )
	self.UpdgradeImage = UpdgradeImage
	
	local PurchaseInstructionWidget = CoD.PurchaseInstructionWidget.new( menu, controller )
	PurchaseInstructionWidget:setLeftRight( 1, 1, -891, -25 )
	PurchaseInstructionWidget:setTopBottom( 1, 1, -275, -135 )
	PurchaseInstructionWidget.PurchaseInstruction:setText( Engine.Localize( "" ) )
	self:addElement( PurchaseInstructionWidget )
	self.PurchaseInstructionWidget = PurchaseInstructionWidget
	
	local cacTacticalRigDescription0 = CoD.cac_TacticalRigDescription.new( menu, controller )
	cacTacticalRigDescription0:setLeftRight( 0, 0, 29, 638 )
	cacTacticalRigDescription0:setTopBottom( 0, 0, 6, 60 )
	cacTacticalRigDescription0.UpgradeName0:setText( Engine.Localize( "CYBERCOM_RIG_PLAYER_MOVEMENT_PRO" ) )
	self:addElement( cacTacticalRigDescription0 )
	self.cacTacticalRigDescription0 = cacTacticalRigDescription0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.PurchaseInstructionWidget:close()
		self.cacTacticalRigDescription0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

