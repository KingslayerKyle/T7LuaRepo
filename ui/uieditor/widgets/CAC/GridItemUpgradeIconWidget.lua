-- 0b35fe8149ccc5e7dbf150ca9dd7565b
-- This hash is used for caching, delete to decompile the file again

CoD.GridItemUpgradeIconWidget = InheritFrom( LUI.UIElement )
CoD.GridItemUpgradeIconWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.GridItemUpgradeIconWidget )
	self.id = "GridItemUpgradeIconWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 18 )
	self:setTopBottom( true, false, 0, 18 )
	
	local UpgradedIcon = LUI.UIImage.new()
	UpgradedIcon:setLeftRight( true, true, 0, 0 )
	UpgradedIcon:setTopBottom( true, true, 0, 0 )
	UpgradedIcon:setAlpha( 0 )
	UpgradedIcon:setImage( RegisterImage( "uie_t7_cac_cp_upgrade_icon" ) )
	self:addElement( UpgradedIcon )
	self.UpgradedIcon = UpgradedIcon
	
	local UpgradableIcon = LUI.UIImage.new()
	UpgradableIcon:setLeftRight( true, true, 0, 0 )
	UpgradableIcon:setTopBottom( true, true, 0, 0 )
	UpgradableIcon:setAlpha( 0 )
	UpgradableIcon:setImage( RegisterImage( "uie_t7_cac_cp_upgrade0_icon" ) )
	self:addElement( UpgradableIcon )
	self.UpgradableIcon = UpgradableIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				UpgradedIcon:completeAnimation()
				self.UpgradedIcon:setAlpha( 0 )
				self.clipFinished( UpgradedIcon, {} )

				UpgradableIcon:completeAnimation()
				self.UpgradableIcon:setAlpha( 0 )
				self.clipFinished( UpgradableIcon, {} )
			end
		},
		Upgradable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				UpgradedIcon:completeAnimation()
				self.UpgradedIcon:setAlpha( 0 )
				self.clipFinished( UpgradedIcon, {} )

				UpgradableIcon:completeAnimation()
				self.UpgradableIcon:setAlpha( 1 )
				self.clipFinished( UpgradableIcon, {} )
			end
		},
		Upgraded = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				UpgradedIcon:completeAnimation()
				self.UpgradedIcon:setAlpha( 1 )
				self.clipFinished( UpgradedIcon, {} )

				UpgradableIcon:completeAnimation()
				self.UpgradableIcon:setAlpha( 0 )
				self.clipFinished( UpgradableIcon, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

