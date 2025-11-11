require( "ui.uieditor.widgets.Lobby.Common.FE_ListSubHeaderGlow" )

CoD.SystemOverloardHeader = InheritFrom( LUI.UIElement )
CoD.SystemOverloardHeader.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SystemOverloardHeader )
	self.id = "SystemOverloardHeader"
	self.soundSet = "CAC_LethalGrenade"
	self:setLeftRight( 0, 0, 0, 201 )
	self:setTopBottom( 0, 0, 0, 28 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local WhiteBox = LUI.UIImage.new()
	WhiteBox:setLeftRight( 0, 1, 0, 4 )
	WhiteBox:setTopBottom( 0, 1, -5, 5 )
	WhiteBox:setAlpha( 0.23 )
	self:addElement( WhiteBox )
	self.WhiteBox = WhiteBox
	
	local FEListSubHeaderGlow0 = CoD.FE_ListSubHeaderGlow.new( menu, controller )
	FEListSubHeaderGlow0:setLeftRight( 0, 1, 0, 0 )
	FEListSubHeaderGlow0:setTopBottom( 0, 1, -5, 5 )
	self:addElement( FEListSubHeaderGlow0 )
	self.FEListSubHeaderGlow0 = FEListSubHeaderGlow0
	
	self:mergeStateConditions( {
		{
			stateName = "Unavailable",
			condition = function ( menu, element, event )
				return not IsCybercoreAbilityAvailable( element, controller )
			end
		},
		{
			stateName = "Purchasable",
			condition = function ( menu, element, event )
				return IsCybercoreAbilityPurchasable( element, controller )
			end
		},
		{
			stateName = "Upgradable",
			condition = function ( menu, element, event )
				return IsCybercoreAbilityUpgradable( element, controller )
			end
		},
		{
			stateName = "Upgraded",
			condition = function ( menu, element, event )
				return IsCybercoreAbilityUpgraded( element, controller )
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FEListSubHeaderGlow0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

