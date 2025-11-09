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
	self:setLeftRight( true, false, 0, 1000 )
	self:setTopBottom( true, false, 0, 600 )
	
	local UpgradeName = LUI.UITightText.new()
	UpgradeName:setLeftRight( true, false, 0, 0 )
	UpgradeName:setTopBottom( true, false, 0, 48 )
	UpgradeName:setRGB( 1, 1, 1 )
	UpgradeName:setText( Engine.Localize( "" ) )
	UpgradeName:setTTF( "fonts/escom.ttf" )
	self:addElement( UpgradeName )
	self.UpgradeName = UpgradeName
	
	local UpgradeDesc = LUI.UIText.new()
	UpgradeDesc:setLeftRight( true, false, 0, 325.44 )
	UpgradeDesc:setTopBottom( true, false, 48, 68 )
	UpgradeDesc:setRGB( 1, 1, 1 )
	UpgradeDesc:setText( Engine.Localize( "" ) )
	UpgradeDesc:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	UpgradeDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	UpgradeDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( UpgradeDesc )
	self.UpgradeDesc = UpgradeDesc
	
	local UpdgradeImage = LUI.UIImage.new()
	UpdgradeImage:setLeftRight( false, true, -593.56, -98.56 )
	UpdgradeImage:setTopBottom( true, false, 73, 449.5 )
	UpdgradeImage:setRGB( 1, 1, 1 )
	UpdgradeImage:setAlpha( 0.25 )
	UpdgradeImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( UpdgradeImage )
	self.UpdgradeImage = UpdgradeImage
	
	local PurchaseInstructionWidget = CoD.PurchaseInstructionWidget.new( menu, controller )
	PurchaseInstructionWidget:setLeftRight( false, true, -593.56, -16.5 )
	PurchaseInstructionWidget:setTopBottom( false, true, -112, -19 )
	PurchaseInstructionWidget:setRGB( 1, 1, 1 )
	PurchaseInstructionWidget.PurchaseInstruction:setText( Engine.Localize( "" ) )
	self:addElement( PurchaseInstructionWidget )
	self.PurchaseInstructionWidget = PurchaseInstructionWidget
	
	self.close = function ( self )
		self.PurchaseInstructionWidget:close()
		CoD.TacRigInfoWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

