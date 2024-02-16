-- ecf220f4d78a923ab9ff9637b8866fbe
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.DescriptionBacking_CAC" )
require( "ui.uieditor.widgets.CAC.PurchaseInstructionWidget" )
require( "ui.uieditor.widgets.CAC.cac_CybercoreDescription" )
require( "ui.uieditor.widgets.CAC.cac_CybercoreMainTile" )
require( "ui.uieditor.widgets.CAC.cac_LockBig" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.CybercoreUpgradeInfoWidget" )

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
	DescriptionBackingCAC0:setTopBottom( true, true, 397.86, -27.14 )
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
	purchaseInstruction:setLeftRight( true, false, 310.23, 683.77 )
	purchaseInstruction:setTopBottom( true, false, 458.86, 558.86 )
	purchaseInstruction:setAlpha( 0 )
	purchaseInstruction.PurchaseInstruction:setText( Engine.Localize( "Upgrade for 1 Fabrication Token" ) )
	self:addElement( purchaseInstruction )
	self.purchaseInstruction = purchaseInstruction
	
	local categoryName = LUI.UIText.new()
	categoryName:setLeftRight( true, false, 6, 450.02 )
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
	cacCybercoreDescription0:setLeftRight( true, false, 0, 450.02 )
	cacCybercoreDescription0:setTopBottom( true, false, 79.08, 105.08 )
	cacCybercoreDescription0:linkToElementModel( self, "desc", true, function ( model )
		local desc = Engine.GetModelValue( model )
		if desc then
			cacCybercoreDescription0.description:setText( Engine.Localize( desc ) )
		end
	end )
	self:addElement( cacCybercoreDescription0 )
	self.cacCybercoreDescription0 = cacCybercoreDescription0
	
	local cacCybercoreMainTile0 = CoD.cac_CybercoreMainTile.new( menu, controller )
	cacCybercoreMainTile0:setLeftRight( true, false, 0, 450.02 )
	cacCybercoreMainTile0:setTopBottom( true, false, 36.08, 72.08 )
	cacCybercoreMainTile0:linkToElementModel( self, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			cacCybercoreMainTile0.name:setText( Engine.Localize( name ) )
		end
	end )
	self:addElement( cacCybercoreMainTile0 )
	self.cacCybercoreMainTile0 = cacCybercoreMainTile0
	
	local lockedIcon = CoD.cac_LockBig.new( menu, controller )
	lockedIcon:setLeftRight( false, false, -69.99, 26.01 )
	lockedIcon:setTopBottom( true, false, -74, 596 )
	lockedIcon:setAlpha( 0 )
	lockedIcon:linkToElementModel( self, nil, false, function ( model )
		lockedIcon:setModel( model, controller )
	end )
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
				local f6_local0
				if not IsInPermanentUnlockMenu( controller ) then
					f6_local0 = IsCybercoreAbilityPurchasable( element, controller )
				else
					f6_local0 = false
				end
				return f6_local0
			end
		}
	} )
	self:addElement( lockedIcon )
	self.lockedIcon = lockedIcon
	
	local CybercoreUpgradeInfoWidget0 = CoD.CybercoreUpgradeInfoWidget.new( menu, controller )
	CybercoreUpgradeInfoWidget0:setLeftRight( true, false, 0, 468 )
	CybercoreUpgradeInfoWidget0:setTopBottom( true, false, 442.36, 539.36 )
	CybercoreUpgradeInfoWidget0:linkToElementModel( self, nil, false, function ( model )
		CybercoreUpgradeInfoWidget0:setModel( model, controller )
	end )
	self:addElement( CybercoreUpgradeInfoWidget0 )
	self.CybercoreUpgradeInfoWidget0 = CybercoreUpgradeInfoWidget0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

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
			end
		},
		Unavailable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 1 )
				self.clipFinished( lockedIcon, {} )
			end
		},
		Purchasable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 1 )
				self.clipFinished( lockedIcon, {} )
			end
		},
		Upgradable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
			end
		},
		Upgraded = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

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
	self:linkToElementModel( self, "baseItemIndex", true, function ( model )
		local f17_local0 = self
		UpdateShownCybercoreXmodel( self, controller )
	end )
	DescriptionBackingCAC0.id = "DescriptionBackingCAC0"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.DescriptionBackingCAC0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.DescriptionBackingCAC0:close()
		element.purchaseInstruction:close()
		element.cacCybercoreDescription0:close()
		element.cacCybercoreMainTile0:close()
		element.lockedIcon:close()
		element.CybercoreUpgradeInfoWidget0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
