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
	self:setLeftRight( 0, 0, 0, 361 )
	self:setTopBottom( 0, 0, 0, 109 )
	
	local UpgradeTitle = LUI.UITightText.new()
	UpgradeTitle:setLeftRight( 0, 0, 62, 362 )
	UpgradeTitle:setTopBottom( 0, 0, 0, 51 )
	UpgradeTitle:setScale( LanguageOverrideNumber( "japanese", 0.7, 1 ) )
	UpgradeTitle:setText( Engine.Localize( "MENU_UPGRADE_MODULE" ) )
	UpgradeTitle:setTTF( "fonts/default.ttf" )
	self:addElement( UpgradeTitle )
	self.UpgradeTitle = UpgradeTitle
	
	local UpgradeIcon = LUI.UIImage.new()
	UpgradeIcon:setLeftRight( 0, 0, 0, 51 )
	UpgradeIcon:setTopBottom( 0, 0, 0, 51 )
	UpgradeIcon:setImage( RegisterImage( "uie_t7_cac_cp_upgrade0_icon" ) )
	self:addElement( UpgradeIcon )
	self.UpgradeIcon = UpgradeIcon
	
	local UpgradeText = LUI.UITightText.new()
	UpgradeText:setLeftRight( 0, 0, 0, 362 )
	UpgradeText:setTopBottom( 0, 0, 57, 90 )
	UpgradeText:setTTF( "fonts/default.ttf" )
	UpgradeText:linkToElementModel( self, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			UpgradeText:setText( GetItemUpgradeInfoString( controller, modelValue ) )
		end
	end )
	self:addElement( UpgradeText )
	self.UpgradeText = UpgradeText
	
	local UpgradedIcon = LUI.UIImage.new()
	UpgradedIcon:setLeftRight( 0, 0, 0, 51 )
	UpgradedIcon:setTopBottom( 0, 0, 0, 51 )
	UpgradedIcon:setAlpha( 0 )
	UpgradedIcon:setImage( RegisterImage( "uie_t7_cac_cp_upgrade_icon" ) )
	self:addElement( UpgradedIcon )
	self.UpgradedIcon = UpgradedIcon
	
	self.resetProperties = function ()
		UpgradeIcon:completeAnimation()
		UpgradeText:completeAnimation()
		UpgradeTitle:completeAnimation()
		UpgradedIcon:completeAnimation()
		UpgradeIcon:setAlpha( 1 )
		UpgradeText:setAlpha( 1 )
		UpgradeTitle:setAlpha( 1 )
		UpgradeTitle:setText( Engine.Localize( "MENU_UPGRADE_MODULE" ) )
		UpgradedIcon:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				UpgradeTitle:completeAnimation()
				self.UpgradeTitle:setAlpha( 0 )
				self.clipFinished( UpgradeTitle, {} )
				UpgradeIcon:completeAnimation()
				self.UpgradeIcon:setAlpha( 0 )
				self.clipFinished( UpgradeIcon, {} )
				UpgradeText:completeAnimation()
				self.UpgradeText:setAlpha( 0 )
				self.clipFinished( UpgradeText, {} )
			end
		},
		Upgraded = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				UpgradeTitle:completeAnimation()
				self.UpgradeTitle:setText( Engine.Localize( "MENU_UPGRADED" ) )
				self.clipFinished( UpgradeTitle, {} )
				UpgradeIcon:completeAnimation()
				self.UpgradeIcon:setAlpha( 0 )
				self.clipFinished( UpgradeIcon, {} )
				UpgradedIcon:completeAnimation()
				self.UpgradedIcon:setAlpha( 1 )
				self.clipFinished( UpgradedIcon, {} )
			end
		},
		Upgradable = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Purchasable = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				UpgradeTitle:completeAnimation()
				self.UpgradeTitle:setAlpha( 0.25 )
				self.clipFinished( UpgradeTitle, {} )
				UpgradeIcon:completeAnimation()
				self.UpgradeIcon:setAlpha( 0.25 )
				self.clipFinished( UpgradeIcon, {} )
				UpgradeText:completeAnimation()
				self.UpgradeText:setAlpha( 0.25 )
				self.clipFinished( UpgradeText, {} )
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
				local f10_local0
				if not IsCACItemLocked( menu, element, controller ) then
					f10_local0 = not IsCACItemPurchased( element, controller )
				else
					f10_local0 = false
				end
				return f10_local0
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.UpgradeText:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

