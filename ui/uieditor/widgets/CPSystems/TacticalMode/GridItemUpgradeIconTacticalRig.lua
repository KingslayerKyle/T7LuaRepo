-- 46fa240ab010375f2c7b1142ced59448
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 64 )
	self:setTopBottom( true, false, 0, 64 )
	
	local UpgradedIcon = LUI.UIImage.new()
	UpgradedIcon:setLeftRight( true, true, 0, 0 )
	UpgradedIcon:setTopBottom( true, true, 0, 0 )
	UpgradedIcon:setAlpha( 0 )
	UpgradedIcon:setScale( 0.8 )
	UpgradedIcon:setImage( RegisterImage( "uie_t7_cac_cp_upgrade_icon" ) )
	self:addElement( UpgradedIcon )
	self.UpgradedIcon = UpgradedIcon
	
	local UpgradableIcon = LUI.UIImage.new()
	UpgradableIcon:setLeftRight( true, true, 0, 0 )
	UpgradableIcon:setTopBottom( true, true, 0, 0 )
	UpgradableIcon:setAlpha( 0 )
	UpgradableIcon:setScale( 0.8 )
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

