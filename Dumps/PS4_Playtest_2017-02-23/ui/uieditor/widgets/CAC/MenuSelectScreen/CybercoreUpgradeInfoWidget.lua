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
	self:setLeftRight( 0, 0, 0, 661 )
	self:setTopBottom( 0, 0, 0, 109 )
	
	local CACvarientTitlePanel0 = CoD.CAC_varientTitlePanel.new( menu, controller )
	CACvarientTitlePanel0:setLeftRight( 0, 1, 0, 0 )
	CACvarientTitlePanel0:setTopBottom( 0, 1, 0, 0 )
	CACvarientTitlePanel0:setAlpha( 0.6 )
	LUI.OverrideFunction_CallOriginalFirst( CACvarientTitlePanel0, "setText", function ( element, text )
		ScaleWidgetToLabelWrappedLeftAlign( self, element, 0, 0 )
	end )
	self:addElement( CACvarientTitlePanel0 )
	self.CACvarientTitlePanel0 = CACvarientTitlePanel0
	
	local UpgradeTitle = LUI.UIText.new()
	UpgradeTitle:setLeftRight( 0, 0, 67, 661 )
	UpgradeTitle:setTopBottom( 0, 0, 7, 58 )
	UpgradeTitle:setScale( LanguageOverrideNumber( "japanese", 0.85, 1 ) )
	UpgradeTitle:setText( Engine.Localize( "MENU_UPGRADE_MODULE" ) )
	UpgradeTitle:setTTF( "fonts/default.ttf" )
	UpgradeTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	UpgradeTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( UpgradeTitle )
	self.UpgradeTitle = UpgradeTitle
	
	local UpgradeIcon = LUI.UIImage.new()
	UpgradeIcon:setLeftRight( 0, 0, 6, 57 )
	UpgradeIcon:setTopBottom( 0, 0, 7, 58 )
	UpgradeIcon:setImage( RegisterImage( "uie_t7_cac_cp_upgrade0_icon" ) )
	self:addElement( UpgradeIcon )
	self.UpgradeIcon = UpgradeIcon
	
	local UpgradeText = LUI.UIText.new()
	UpgradeText:setLeftRight( 0, 0, 6, 662 )
	UpgradeText:setTopBottom( 0, 0, 64, 97 )
	UpgradeText:setScale( LanguageOverrideNumber( "japanese", 0.75, 1 ) )
	UpgradeText:setTTF( "fonts/default.ttf" )
	UpgradeText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	UpgradeText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	UpgradeText:linkToElementModel( self, "upgdesc", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			UpgradeText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( UpgradeText )
	self.UpgradeText = UpgradeText
	
	local UpgradedIcon = LUI.UIImage.new()
	UpgradedIcon:setLeftRight( 0, 0, 6, 57 )
	UpgradedIcon:setTopBottom( 0, 0, 7, 58 )
	UpgradedIcon:setAlpha( 0 )
	UpgradedIcon:setImage( RegisterImage( "uie_t7_cac_cp_upgrade_icon" ) )
	self:addElement( UpgradedIcon )
	self.UpgradedIcon = UpgradedIcon
	
	self.resetProperties = function ()
		UpgradeTitle:completeAnimation()
		UpgradeIcon:completeAnimation()
		UpgradeText:completeAnimation()
		UpgradedIcon:completeAnimation()
		UpgradeTitle:setAlpha( 1 )
		UpgradeTitle:setText( Engine.Localize( "MENU_UPGRADE_MODULE" ) )
		UpgradeIcon:setAlpha( 1 )
		UpgradeText:setAlpha( 1 )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.CACvarientTitlePanel0:close()
		self.UpgradeText:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

