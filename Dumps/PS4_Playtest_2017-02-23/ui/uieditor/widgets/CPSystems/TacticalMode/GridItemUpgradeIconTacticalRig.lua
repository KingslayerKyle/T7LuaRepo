CoD.GridItemUpgradeIconTacticalRig = InheritFrom( LUI.UIElement )
CoD.GridItemUpgradeIconTacticalRig.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GridItemUpgradeIconTacticalRig )
	self.id = "GridItemUpgradeIconTacticalRig"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 96 )
	self:setTopBottom( 0, 0, 0, 96 )
	
	local UpgradedIcon = LUI.UIImage.new()
	UpgradedIcon:setLeftRight( 0, 1, 0, 0 )
	UpgradedIcon:setTopBottom( 0, 1, 0, 0 )
	UpgradedIcon:setAlpha( 0 )
	UpgradedIcon:setScale( 0.8 )
	UpgradedIcon:setImage( RegisterImage( "uie_t7_cac_cp_upgrade_icon" ) )
	self:addElement( UpgradedIcon )
	self.UpgradedIcon = UpgradedIcon
	
	local UpgradableIcon = LUI.UIImage.new()
	UpgradableIcon:setLeftRight( 0, 1, 0, 0 )
	UpgradableIcon:setTopBottom( 0, 1, 0, 0 )
	UpgradableIcon:setAlpha( 0 )
	UpgradableIcon:setScale( 0.8 )
	UpgradableIcon:setImage( RegisterImage( "uie_t7_cac_cp_upgrade0_icon" ) )
	self:addElement( UpgradableIcon )
	self.UpgradableIcon = UpgradableIcon
	
	self.resetProperties = function ()
		UpgradableIcon:completeAnimation()
		UpgradedIcon:completeAnimation()
		UpgradableIcon:setAlpha( 0 )
		UpgradableIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
		UpgradedIcon:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Upgradable = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				UpgradableIcon:completeAnimation()
				self.UpgradableIcon:setAlpha( 1 )
				self.clipFinished( UpgradableIcon, {} )
			end
		},
		Upgraded = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				UpgradedIcon:completeAnimation()
				self.UpgradedIcon:setAlpha( 1 )
				self.clipFinished( UpgradedIcon, {} )
				UpgradableIcon:completeAnimation()
				self.UpgradableIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
				self.clipFinished( UpgradableIcon, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

