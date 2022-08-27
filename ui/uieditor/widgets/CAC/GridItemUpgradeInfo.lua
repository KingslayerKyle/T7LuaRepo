-- 71bd1daacd0ef249ce14d04e5d78b192
-- This hash is used for caching, delete to decompile the file again

CoD.GridItemUpgradeInfo = InheritFrom( LUI.UIElement )
CoD.GridItemUpgradeInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GridItemUpgradeInfo )
	self.id = "GridItemUpgradeInfo"
	self.soundSet = "CAC_LethalGrenade"
	self:setLeftRight( true, false, 0, 241 )
	self:setTopBottom( true, false, 0, 73 )
	
	local UpgradeTitle = LUI.UITightText.new()
	UpgradeTitle:setLeftRight( true, false, 41.15, 241.15 )
	UpgradeTitle:setTopBottom( true, false, 0, 34 )
	UpgradeTitle:setText( Engine.Localize( "MENU_UPGRADE_MODULE" ) )
	UpgradeTitle:setTTF( "fonts/default.ttf" )
	self:addElement( UpgradeTitle )
	self.UpgradeTitle = UpgradeTitle
	
	local UpgradeIcon = LUI.UIImage.new()
	UpgradeIcon:setLeftRight( true, false, 0, 34 )
	UpgradeIcon:setTopBottom( true, false, 0, 34 )
	UpgradeIcon:setImage( RegisterImage( "uie_t7_cac_cp_upgrade0_icon" ) )
	self:addElement( UpgradeIcon )
	self.UpgradeIcon = UpgradeIcon
	
	local UpgradeText = LUI.UITightText.new()
	UpgradeText:setLeftRight( true, false, 0, 241 )
	UpgradeText:setTopBottom( true, false, 38, 60 )
	UpgradeText:setTTF( "fonts/default.ttf" )
	UpgradeText:linkToElementModel( self, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			UpgradeText:setText( Engine.Localize( GetItemUpgradeInfoString( controller, itemIndex ) ) )
		end
	end )
	self:addElement( UpgradeText )
	self.UpgradeText = UpgradeText
	
	local UpgradedIcon = LUI.UIImage.new()
	UpgradedIcon:setLeftRight( true, false, 0, 34 )
	UpgradedIcon:setTopBottom( true, false, 0, 34 )
	UpgradedIcon:setAlpha( 0 )
	UpgradedIcon:setImage( RegisterImage( "uie_t7_cac_cp_upgrade_icon" ) )
	self:addElement( UpgradedIcon )
	self.UpgradedIcon = UpgradedIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				UpgradeTitle:completeAnimation()
				self.UpgradeTitle:setAlpha( 0 )
				self.clipFinished( UpgradeTitle, {} )
				UpgradeIcon:completeAnimation()
				self.UpgradeIcon:setAlpha( 0 )
				self.clipFinished( UpgradeIcon, {} )
				UpgradeText:completeAnimation()
				self.UpgradeText:setAlpha( 0 )
				self.clipFinished( UpgradeText, {} )
				UpgradedIcon:completeAnimation()
				self.UpgradedIcon:setAlpha( 0 )
				self.clipFinished( UpgradedIcon, {} )
			end
		},
		Upgraded = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				UpgradeTitle:completeAnimation()
				self.UpgradeTitle:setAlpha( 1 )
				self.UpgradeTitle:setText( Engine.Localize( "MENU_UPGRADED" ) )
				self.clipFinished( UpgradeTitle, {} )
				UpgradeIcon:completeAnimation()
				self.UpgradeIcon:setAlpha( 0 )
				self.clipFinished( UpgradeIcon, {} )
				UpgradeText:completeAnimation()
				self.UpgradeText:setAlpha( 1 )
				self.clipFinished( UpgradeText, {} )
				UpgradedIcon:completeAnimation()
				self.UpgradedIcon:setAlpha( 1 )
				self.clipFinished( UpgradedIcon, {} )
			end
		},
		Upgradable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				UpgradeTitle:completeAnimation()
				self.UpgradeTitle:setAlpha( 1 )
				self.UpgradeTitle:setText( Engine.Localize( "MENU_UPGRADE_MODULE" ) )
				self.clipFinished( UpgradeTitle, {} )
				UpgradeIcon:completeAnimation()
				self.UpgradeIcon:setAlpha( 1 )
				self.clipFinished( UpgradeIcon, {} )
				UpgradeText:completeAnimation()
				self.UpgradeText:setAlpha( 1 )
				self.clipFinished( UpgradeText, {} )
				UpgradedIcon:completeAnimation()
				self.UpgradedIcon:setAlpha( 0 )
				self.clipFinished( UpgradedIcon, {} )
			end
		},
		Purchasable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				UpgradeTitle:completeAnimation()
				self.UpgradeTitle:setAlpha( 0.25 )
				self.UpgradeTitle:setText( Engine.Localize( "MENU_UPGRADE_MODULE" ) )
				self.clipFinished( UpgradeTitle, {} )
				UpgradeIcon:completeAnimation()
				self.UpgradeIcon:setAlpha( 0.25 )
				self.clipFinished( UpgradeIcon, {} )
				UpgradeText:completeAnimation()
				self.UpgradeText:setAlpha( 0.25 )
				self.clipFinished( UpgradeText, {} )
				UpgradedIcon:completeAnimation()
				self.UpgradedIcon:setAlpha( 0 )
				self.clipFinished( UpgradedIcon, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Upgraded",
			condition = function ( menu, element, event )
				return IsCACItemUpgraded( menu, element, controller )
			end
		},
		{
			stateName = "Upgradable",
			condition = function ( menu, element, event )
				return IsCACItemUpgradable( menu, element, controller )
			end
		},
		{
			stateName = "Purchasable",
			condition = function ( menu, element, event )
				local f9_local0
				if not IsCACItemLocked( menu, element, controller ) then
					f9_local0 = not IsCACItemPurchased( element, controller )
				else
					f9_local0 = false
				end
				return f9_local0
			end
		}
	} )
	self:linkToElementModel( self, "itemIndex", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.UpgradeText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

