require( "ui.uieditor.widgets.CAC.cac_CybercoreDescription" )
require( "ui.uieditor.widgets.CAC.cac_CybercoreMainTile" )
require( "ui.uieditor.widgets.CAC.cac_LockBig" )
require( "ui.uieditor.widgets.CAC.DescriptionBacking_CAC" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.CybercoreUpgradeInfoWidget" )
require( "ui.uieditor.widgets.CAC.PurchaseInstructionWidget" )

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
	self:setLeftRight( 0, 0, 0, 961 )
	self:setTopBottom( 0, 0, 0, 879 )
	self.anyChildUsesUpdateState = true
	
	local DescriptionBackingCAC0 = CoD.DescriptionBacking_CAC.new( menu, controller )
	DescriptionBackingCAC0:setLeftRight( 0, 1, 0, 0 )
	DescriptionBackingCAC0:setTopBottom( 0, 1, 597, -41 )
	DescriptionBackingCAC0:setAlpha( 0 )
	self:addElement( DescriptionBackingCAC0 )
	self.DescriptionBackingCAC0 = DescriptionBackingCAC0
	
	local nameBacking = LUI.UIImage.new()
	nameBacking:setLeftRight( 0, 1, 0, 0 )
	nameBacking:setTopBottom( 0, 0, 426, 519 )
	nameBacking:setRGB( 0.2, 0.2, 0.2 )
	nameBacking:setAlpha( 0 )
	self:addElement( nameBacking )
	self.nameBacking = nameBacking
	
	local Outline = LUI.UIImage.new()
	Outline:setLeftRight( 0.5, 0.5, -212, 195 )
	Outline:setTopBottom( 0, 0, 205, 610 )
	Outline:setAlpha( 0 )
	Outline:setImage( RegisterImage( "uie_cp_outline_upgrade" ) )
	self:addElement( Outline )
	self.Outline = Outline
	
	local purchaseInstruction = CoD.PurchaseInstructionWidget.new( menu, controller )
	purchaseInstruction:setLeftRight( 0, 0, 466, 1026 )
	purchaseInstruction:setTopBottom( 0, 0, 688, 838 )
	purchaseInstruction:setAlpha( 0 )
	purchaseInstruction.PurchaseInstruction:setText( Engine.Localize( "Upgrade for 1 Fabrication Token" ) )
	self:addElement( purchaseInstruction )
	self.purchaseInstruction = purchaseInstruction
	
	local categoryName = LUI.UIText.new()
	categoryName:setLeftRight( 0, 0, 9, 675 )
	categoryName:setTopBottom( 0, 0, 21, 49 )
	categoryName:setRGB( 0.97, 0.32, 0.05 )
	categoryName:setText( Engine.Localize( "MENU_CYBERCORE_CAPS" ) )
	categoryName:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	categoryName:setLetterSpacing( 1 )
	categoryName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	categoryName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( categoryName )
	self.categoryName = categoryName
	
	local cacCybercoreDescription0 = CoD.cac_CybercoreDescription.new( menu, controller )
	cacCybercoreDescription0:setLeftRight( 0, 0, 0, 675 )
	cacCybercoreDescription0:setTopBottom( 0, 0, 118.5, 157.5 )
	cacCybercoreDescription0:linkToElementModel( self, "desc", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			cacCybercoreDescription0.description:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( cacCybercoreDescription0 )
	self.cacCybercoreDescription0 = cacCybercoreDescription0
	
	local cacCybercoreMainTile0 = CoD.cac_CybercoreMainTile.new( menu, controller )
	cacCybercoreMainTile0:setLeftRight( 0, 0, 0, 675 )
	cacCybercoreMainTile0:setTopBottom( 0, 0, 54, 108 )
	cacCybercoreMainTile0:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			cacCybercoreMainTile0.name:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( cacCybercoreMainTile0 )
	self.cacCybercoreMainTile0 = cacCybercoreMainTile0
	
	local lockedIcon = CoD.cac_LockBig.new( menu, controller )
	lockedIcon:mergeStateConditions( {
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return not IsCybercoreAbilityAvailable( element, controller )
			end
		},
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				local f5_local0
				if not IsInPermanentUnlockMenu( controller ) then
					f5_local0 = IsCybercoreAbilityPurchasable( element, controller )
				else
					f5_local0 = false
				end
				return f5_local0
			end
		}
	} )
	lockedIcon:setLeftRight( 0.5, 0.5, -105, 39 )
	lockedIcon:setTopBottom( 0, 0, -110.5, 894.5 )
	lockedIcon:setAlpha( 0 )
	lockedIcon:linkToElementModel( self, nil, false, function ( model )
		lockedIcon:setModel( model, controller )
	end )
	self:addElement( lockedIcon )
	self.lockedIcon = lockedIcon
	
	local CybercoreUpgradeInfoWidget0 = CoD.CybercoreUpgradeInfoWidget.new( menu, controller )
	CybercoreUpgradeInfoWidget0:setLeftRight( 0, 0, 0, 702 )
	CybercoreUpgradeInfoWidget0:setTopBottom( 0, 0, 663, 809 )
	CybercoreUpgradeInfoWidget0:linkToElementModel( self, nil, false, function ( model )
		CybercoreUpgradeInfoWidget0:setModel( model, controller )
	end )
	self:addElement( CybercoreUpgradeInfoWidget0 )
	self.CybercoreUpgradeInfoWidget0 = CybercoreUpgradeInfoWidget0
	
	self.resetProperties = function ()
		categoryName:completeAnimation()
		lockedIcon:completeAnimation()
		categoryName:setLeftRight( 0, 0, 9, 675 )
		categoryName:setTopBottom( 0, 0, 21, 49 )
		lockedIcon:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				categoryName:completeAnimation()
				self.categoryName:setLeftRight( 0, 0, 9, 393 )
				self.categoryName:setTopBottom( 0, 0, 21, 49 )
				self.clipFinished( categoryName, {} )
			end
		},
		Unavailable = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 1 )
				self.clipFinished( lockedIcon, {} )
			end
		},
		Purchasable = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 1 )
				self.clipFinished( lockedIcon, {} )
			end
		},
		Upgradable = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Upgraded = {
			DefaultClip = function ()
				self.resetProperties()
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
	self:linkToElementModel( self, "baseItemIndex", true, function ( model )
		local element = self
		UpdateShownCybercoreXmodel( self, controller )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.DescriptionBackingCAC0:close()
		self.purchaseInstruction:close()
		self.cacCybercoreDescription0:close()
		self.cacCybercoreMainTile0:close()
		self.lockedIcon:close()
		self.CybercoreUpgradeInfoWidget0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

