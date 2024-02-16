require( "ui.uieditor.widgets.CAC.DescriptionBacking_CAC" )
require( "ui.uieditor.widgets.CAC.PurchaseInstructionWidget" )
require( "ui.uieditor.widgets.CAC.cac_CybercoreDescription" )
require( "ui.uieditor.widgets.CAC.cac_CybercoreMainTile" )
require( "ui.uieditor.widgets.CAC.cac_LockBig" )

CoD.CybercoreInfoModelWidget = InheritFrom( LUI.UIElement )
CoD.CybercoreInfoModelWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CybercoreInfoModelWidget )
	self.id = "CybercoreInfoModelWidget"
	self.soundSet = "CAC_LethalGrenade"
	self:setLeftRight( true, false, 0, 641 )
	self:setTopBottom( true, false, 0, 586 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local DescriptionBackingCAC0 = CoD.DescriptionBacking_CAC.new( menu, controller )
	DescriptionBackingCAC0:setLeftRight( true, true, 0, 0 )
	DescriptionBackingCAC0:setTopBottom( true, true, 399, -26 )
	DescriptionBackingCAC0:setAlpha( 0 )
	self:addElement( DescriptionBackingCAC0 )
	self.DescriptionBackingCAC0 = DescriptionBackingCAC0
	
	local nameBacking = LUI.UIImage.new()
	nameBacking:setLeftRight( true, true, 0, 0 )
	nameBacking:setTopBottom( true, false, 284, 346 )
	nameBacking:setRGB( 0.2, 0.2, 0.2 )
	nameBacking:setAlpha( 0 )
	self:addElement( nameBacking )
	self.nameBacking = nameBacking
	
	local Outline = LUI.UIImage.new()
	Outline:setLeftRight( false, false, -141.52, 129.52 )
	Outline:setTopBottom( true, false, 136.48, 406.33 )
	Outline:setAlpha( 0 )
	Outline:setImage( RegisterImage( "uie_cp_outline_upgrade" ) )
	self:addElement( Outline )
	self.Outline = Outline
	
	local purchaseInstruction = CoD.PurchaseInstructionWidget.new( menu, controller )
	purchaseInstruction:setLeftRight( false, false, -10.27, 363.27 )
	purchaseInstruction:setTopBottom( true, false, 458.86, 558.86 )
	purchaseInstruction:setAlpha( 0 )
	purchaseInstruction.PurchaseInstruction:setText( Engine.Localize( "Upgrade for 1 Fabrication Token" ) )
	self:addElement( purchaseInstruction )
	self.purchaseInstruction = purchaseInstruction
	
	local categoryName = LUI.UIText.new()
	categoryName:setLeftRight( true, false, 6, 262 )
	categoryName:setTopBottom( true, false, 14, 33 )
	categoryName:setRGB( 0.97, 0.32, 0.05 )
	categoryName:setText( Engine.Localize( "MENU_CYBERCORE_CAPS" ) )
	categoryName:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	categoryName:setLetterSpacing( 1 )
	categoryName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	categoryName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( categoryName )
	self.categoryName = categoryName
	
	local cacCybercoreDescription0 = CoD.cac_CybercoreDescription.new( menu, controller )
	cacCybercoreDescription0:setLeftRight( true, false, 0, 441 )
	cacCybercoreDescription0:setTopBottom( true, false, 79.08, 105.08 )
	cacCybercoreDescription0:linkToElementModel( self, "desc", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			cacCybercoreDescription0.description:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( cacCybercoreDescription0 )
	self.cacCybercoreDescription0 = cacCybercoreDescription0
	
	local cacCybercoreMainTile0 = CoD.cac_CybercoreMainTile.new( menu, controller )
	cacCybercoreMainTile0:setLeftRight( true, false, 0, 580 )
	cacCybercoreMainTile0:setTopBottom( true, false, 36.08, 72.08 )
	cacCybercoreMainTile0:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			cacCybercoreMainTile0.name:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( cacCybercoreMainTile0 )
	self.cacCybercoreMainTile0 = cacCybercoreMainTile0
	
	local UpgradeIcon = LUI.UIImage.new()
	UpgradeIcon:setLeftRight( true, false, 0, 24 )
	UpgradeIcon:setTopBottom( true, false, 442, 466 )
	UpgradeIcon:setRGB( 0.5, 0.5, 0.5 )
	UpgradeIcon:setImage( RegisterImage( "uie_t7_hud_cac_equipped_16" ) )
	self:addElement( UpgradeIcon )
	self.UpgradeIcon = UpgradeIcon
	
	local UpgradeHeaderText = LUI.UIText.new()
	UpgradeHeaderText:setLeftRight( true, false, 34, 234 )
	UpgradeHeaderText:setTopBottom( true, false, 442, 466 )
	UpgradeHeaderText:setText( Engine.Localize( "Upgrade Module" ) )
	UpgradeHeaderText:setTTF( "fonts/escom.ttf" )
	UpgradeHeaderText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	UpgradeHeaderText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( UpgradeHeaderText )
	self.UpgradeHeaderText = UpgradeHeaderText
	
	local cacCybercoreUpgradeDescription = CoD.cac_CybercoreDescription.new( menu, controller )
	cacCybercoreUpgradeDescription:setLeftRight( true, false, 0, 300 )
	cacCybercoreUpgradeDescription:setTopBottom( true, false, 473, 499 )
	cacCybercoreUpgradeDescription:linkToElementModel( self, "upgdesc", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			cacCybercoreUpgradeDescription.description:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( cacCybercoreUpgradeDescription )
	self.cacCybercoreUpgradeDescription = cacCybercoreUpgradeDescription
	
	local lockedIcon = CoD.cac_LockBig.new( menu, controller )
	lockedIcon:setLeftRight( true, false, 250.51, 346.51 )
	lockedIcon:setTopBottom( true, false, -74, 596 )
	self:addElement( lockedIcon )
	self.lockedIcon = lockedIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				DescriptionBackingCAC0:completeAnimation()
				self.DescriptionBackingCAC0:setAlpha( 0 )
				self.clipFinished( DescriptionBackingCAC0, {} )
				nameBacking:completeAnimation()
				self.nameBacking:setAlpha( 0 )
				self.clipFinished( nameBacking, {} )
				Outline:completeAnimation()
				self.Outline:setLeftRight( false, false, -141.52, 129.52 )
				self.Outline:setTopBottom( true, false, 136.48, 406.33 )
				self.clipFinished( Outline, {} )
				categoryName:completeAnimation()
				self.categoryName:setLeftRight( true, false, 6, 262 )
				self.categoryName:setTopBottom( true, false, 14, 33 )
				self.categoryName:setRGB( 0.97, 0.32, 0.05 )
				self.categoryName:setAlpha( 1 )
				self.categoryName:setText( Engine.Localize( "MENU_CYBERCORE_CAPS" ) )
				self.clipFinished( categoryName, {} )
				UpgradeIcon:completeAnimation()
				self.UpgradeIcon:setRGB( 0.5, 0.5, 0.5 )
				self.clipFinished( UpgradeIcon, {} )
			end
		},
		Unavailable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				UpgradeIcon:completeAnimation()
				self.UpgradeIcon:setRGB( 0.5, 0.5, 0.5 )
				self.clipFinished( UpgradeIcon, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 1 )
				self.clipFinished( lockedIcon, {} )
			end
		},
		Purchasable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				UpgradeIcon:completeAnimation()
				self.UpgradeIcon:setRGB( 0.5, 0.5, 0.5 )
				self.clipFinished( UpgradeIcon, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
			end
		},
		Upgradable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				UpgradeIcon:completeAnimation()
				self.UpgradeIcon:setRGB( 0.5, 0.5, 0.5 )
				self.clipFinished( UpgradeIcon, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
			end
		},
		Upgraded = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				UpgradeIcon:completeAnimation()
				self.UpgradeIcon:setRGB( 0.55, 0.77, 0.25 )
				self.clipFinished( UpgradeIcon, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
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
	DescriptionBackingCAC0.id = "DescriptionBackingCAC0"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.DescriptionBackingCAC0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.DescriptionBackingCAC0:close()
		self.purchaseInstruction:close()
		self.cacCybercoreDescription0:close()
		self.cacCybercoreMainTile0:close()
		self.cacCybercoreUpgradeDescription:close()
		self.lockedIcon:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

