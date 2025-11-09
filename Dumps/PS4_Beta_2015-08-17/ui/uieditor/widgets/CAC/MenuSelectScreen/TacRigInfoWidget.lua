require( "ui.uieditor.widgets.CAC.PurchaseInstructionWidget" )
require( "ui.uieditor.widgets.CAC.cac_TacticalRigDescription" )

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
	self.anyChildUsesUpdateState = true
	
	local UpgradeDesc = LUI.UIText.new()
	UpgradeDesc:setLeftRight( true, false, 19.22, 344.65 )
	UpgradeDesc:setTopBottom( true, false, 49, 72 )
	UpgradeDesc:setText( Engine.Localize( "" ) )
	UpgradeDesc:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	UpgradeDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	UpgradeDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( UpgradeDesc )
	self.UpgradeDesc = UpgradeDesc
	
	local UpdgradeImage = LUI.UIImage.new()
	UpdgradeImage:setLeftRight( false, true, -500, -127.27 )
	UpdgradeImage:setTopBottom( true, false, 99, 382.5 )
	UpdgradeImage:setAlpha( 0.5 )
	self:addElement( UpdgradeImage )
	self.UpdgradeImage = UpdgradeImage
	
	local PurchaseInstructionWidget = CoD.PurchaseInstructionWidget.new( menu, controller )
	PurchaseInstructionWidget:setLeftRight( false, true, -593.56, -16.5 )
	PurchaseInstructionWidget:setTopBottom( false, true, -183, -90 )
	PurchaseInstructionWidget.PurchaseInstruction:setText( Engine.Localize( "" ) )
	self:addElement( PurchaseInstructionWidget )
	self.PurchaseInstructionWidget = PurchaseInstructionWidget
	
	local cacTacticalRigDescription0 = CoD.cac_TacticalRigDescription.new( menu, controller )
	cacTacticalRigDescription0:setLeftRight( true, false, 19.22, 425.22 )
	cacTacticalRigDescription0:setTopBottom( true, false, 4, 40 )
	cacTacticalRigDescription0.UpgradeName0:setText( Engine.Localize( "CYBERCOM_RIG_PLAYER_MOVEMENT_PRO" ) )
	self:addElement( cacTacticalRigDescription0 )
	self.cacTacticalRigDescription0 = cacTacticalRigDescription0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				UpdgradeImage:completeAnimation()
				self.UpdgradeImage:setAlpha( 0.5 )
				self.clipFinished( UpdgradeImage, {} )
				cacTacticalRigDescription0:completeAnimation()
				self.cacTacticalRigDescription0:setAlpha( 1 )
				self.clipFinished( cacTacticalRigDescription0, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.PurchaseInstructionWidget:close()
		self.cacTacticalRigDescription0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

