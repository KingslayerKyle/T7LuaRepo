-- b33a5c48d38c55a2097e3787ecec4172
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.MenuSelectScreen.TacRigInfoWidget" )
require( "ui.uieditor.widgets.CAC.UnlockTokensWidget" )
require( "ui.uieditor.widgets.CAC.cac_3dTitleIntermediary" )

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
	TacRigInfoWidget.UpgradeDesc:setText( Engine.Localize( "" ) )
	TacRigInfoWidget.PurchaseInstructionWidget.PurchaseInstruction:setText( Engine.Localize( "" ) )
	TacRigInfoWidget.cacTacticalRigDescription0.UpgradeName0:setText( Engine.Localize( "CYBERCOM_RIG_PLAYER_MOVEMENT_PRO" ) )
	self:addElement( TacRigInfoWidget )
	self.TacRigInfoWidget = TacRigInfoWidget
	
	local UnlockTokensWidget = CoD.UnlockTokensWidget.new( menu, controller )
	UnlockTokensWidget:setLeftRight( true, false, 961.5, 1171.5 )
	UnlockTokensWidget:setTopBottom( true, false, 39.5, 73.5 )
	UnlockTokensWidget.tokenLabel:setTTF( "fonts/escom.ttf" )
	self:addElement( UnlockTokensWidget )
	self.UnlockTokensWidget = UnlockTokensWidget
	
	local UpgradeTitle = LUI.UITightText.new()
	UpgradeTitle:setLeftRight( true, false, 351, 1087 )
	UpgradeTitle:setTopBottom( true, false, -210, -162 )
	UpgradeTitle:setText( Engine.Localize( "" ) )
	UpgradeTitle:setTTF( "fonts/escom.ttf" )
	self:addElement( UpgradeTitle )
	self.UpgradeTitle = UpgradeTitle
	
	local cac3dTitleIntermediary = CoD.cac_3dTitleIntermediary.new( menu, controller )
	cac3dTitleIntermediary:setLeftRight( true, false, 24, 736 )
	cac3dTitleIntermediary:setTopBottom( true, false, 0.5, 146.5 )
	cac3dTitleIntermediary.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "CPUI_PLAYER_MOVEMENT_UPGRADES" ) )
	self:addElement( cac3dTitleIntermediary )
	self.cac3dTitleIntermediary = cac3dTitleIntermediary
	
	local UpgradeTitle0 = LUI.UITightText.new()
	UpgradeTitle0:setLeftRight( true, false, 0, 736 )
	UpgradeTitle0:setTopBottom( true, false, -81, -35 )
	UpgradeTitle0:setText( Engine.Localize( "" ) )
	UpgradeTitle0:setTTF( "fonts/escom.ttf" )
	self:addElement( UpgradeTitle0 )
	self.UpgradeTitle0 = UpgradeTitle0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				cac3dTitleIntermediary:completeAnimation()
				self.cac3dTitleIntermediary:setAlpha( 1 )
				self.clipFinished( cac3dTitleIntermediary, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.TacRigInfoWidget:close()
		element.UnlockTokensWidget:close()
		element.cac3dTitleIntermediary:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

