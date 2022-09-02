-- 9a095cbb91dbefb5ba7c1a4f817c635e
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.CAC_varientTitlePanel" )

CoD.CybercoreUpgradeInfoWidget = InheritFrom( LUI.UIElement )
CoD.CybercoreUpgradeInfoWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CybercoreUpgradeInfoWidget )
	self.id = "CybercoreUpgradeInfoWidget"
	self.soundSet = "CAC_LethalGrenade"
	self:setLeftRight( true, false, 0, 441 )
	self:setTopBottom( true, false, 0, 73 )
	
	local CACvarientTitlePanel0 = CoD.CAC_varientTitlePanel.new( menu, controller )
	CACvarientTitlePanel0:setLeftRight( true, true, 0, 0 )
	CACvarientTitlePanel0:setTopBottom( true, true, 0, 0 )
	CACvarientTitlePanel0:setAlpha( 0.6 )

	LUI.OverrideFunction_CallOriginalFirst( CACvarientTitlePanel0, "setText", function ( element, controller )
		ScaleWidgetToLabelWrappedLeftAlign( self, element, 0, 0 )
	end )
	self:addElement( CACvarientTitlePanel0 )
	self.CACvarientTitlePanel0 = CACvarientTitlePanel0
	
	local UpgradeTitle = LUI.UIText.new()
	UpgradeTitle:setLeftRight( true, false, 45, 441 )
	UpgradeTitle:setTopBottom( true, false, 4.5, 38.5 )
	UpgradeTitle:setScale( LanguageOverrideNumber( "japanese", 0.85, 1 ) )
	UpgradeTitle:setText( Engine.Localize( "MENU_UPGRADE_MODULE" ) )
	UpgradeTitle:setTTF( "fonts/default.ttf" )
	UpgradeTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	UpgradeTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( UpgradeTitle )
	self.UpgradeTitle = UpgradeTitle
	
	local UpgradeIcon = LUI.UIImage.new()
	UpgradeIcon:setLeftRight( true, false, 4, 38 )
	UpgradeIcon:setTopBottom( true, false, 4.5, 38.5 )
	UpgradeIcon:setImage( RegisterImage( "uie_t7_cac_cp_upgrade0_icon" ) )
	self:addElement( UpgradeIcon )
	self.UpgradeIcon = UpgradeIcon
	
	local UpgradeText = LUI.UIText.new()
	UpgradeText:setLeftRight( true, false, 4, 441 )
	UpgradeText:setTopBottom( true, false, 42.5, 64.5 )
	UpgradeText:setScale( LanguageOverrideNumber( "japanese", 0.75, 1 ) )
	UpgradeText:setTTF( "fonts/default.ttf" )
	UpgradeText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	UpgradeText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	UpgradeText:linkToElementModel( self, "upgdesc", true, function ( model )
		local upgdesc = Engine.GetModelValue( model )
		if upgdesc then
			UpgradeText:setText( Engine.Localize( upgdesc ) )
		end
	end )
	self:addElement( UpgradeText )
	self.UpgradeText = UpgradeText
	
	local UpgradedIcon = LUI.UIImage.new()
	UpgradedIcon:setLeftRight( true, false, 4, 38 )
	UpgradedIcon:setTopBottom( true, false, 4.5, 38.5 )
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
				return IsCybercoreAbilityUpgraded( element, controller )
			end
		},
		{
			stateName = "Upgradable",
			condition = function ( menu, element, event )
				return IsCybercoreAbilityUpgradable( element, controller )
			end
		},
		{
			stateName = "Purchasable",
			condition = function ( menu, element, event )
				return IsCybercoreAbilityPurchasable( element, controller )
			end
		}
	} )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CACvarientTitlePanel0:close()
		element.UpgradeText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

