-- e3284ee9069d17ad47467334dcad6fb9
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 134 )
	self:setTopBottom( true, false, 0, 19 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local WhiteBox = LUI.UIImage.new()
	WhiteBox:setLeftRight( true, true, 0, 3.25 )
	WhiteBox:setTopBottom( true, true, -3.5, 3.5 )
	WhiteBox:setAlpha( 0.23 )
	self:addElement( WhiteBox )
	self.WhiteBox = WhiteBox
	
	local FEListSubHeaderGlow0 = CoD.FE_ListSubHeaderGlow.new( menu, controller )
	FEListSubHeaderGlow0:setLeftRight( true, true, 0, 0 )
	FEListSubHeaderGlow0:setTopBottom( true, true, -3.5, 3.5 )
	self:addElement( FEListSubHeaderGlow0 )
	self.FEListSubHeaderGlow0 = FEListSubHeaderGlow0
	
	self.clipsPerState = {
		Unavailable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Focustemp = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Purchasable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Upgradable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Upgraded = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEListSubHeaderGlow0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

