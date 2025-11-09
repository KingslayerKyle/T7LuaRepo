require( "ui.uieditor.widgets.CAC.MenuSelectScreen.CybercoreNameWidget" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.CybercorePurchasePrompt" )

CoD.CybercoreUpgradeModelWidget = InheritFrom( LUI.UIElement )
CoD.CybercoreUpgradeModelWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CybercoreUpgradeModelWidget )
	self.id = "CybercoreUpgradeModelWidget"
	self.soundSet = "CAC_LethalGrenade"
	self:setLeftRight( true, false, 0, 120 )
	self:setTopBottom( true, false, 0, 120 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local imageBacking = LUI.UIImage.new()
	imageBacking:setLeftRight( true, true, 0, 0 )
	imageBacking:setTopBottom( true, true, 0, 0 )
	imageBacking:setRGB( 1, 1, 1 )
	imageBacking:setAlpha( 0.25 )
	imageBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( imageBacking )
	self.imageBacking = imageBacking
	
	local abilityImage = LUI.UIImage.new()
	abilityImage:setLeftRight( true, true, 0, 0 )
	abilityImage:setTopBottom( true, true, 0, 0 )
	abilityImage:setRGB( 1, 1, 1 )
	abilityImage:setAlpha( 0.25 )
	abilityImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	abilityImage:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			abilityImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( abilityImage )
	self.abilityImage = abilityImage
	
	local nameWidget = CoD.CybercoreNameWidget.new( menu, controller )
	nameWidget:setLeftRight( true, true, -20, 20 )
	nameWidget:setTopBottom( true, false, 0, 20 )
	nameWidget:setRGB( 1, 1, 1 )
	nameWidget.nameBacking:setRGB( 0.2, 0.2, 0.2 )
	nameWidget.name:setRGB( 1, 1, 1 )
	nameWidget:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			nameWidget.name:setText( Engine.Localize( modelValue ) )
		end
	end )
	nameWidget:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		PlayClip( self, "Focus", controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return true
	end )
	nameWidget:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		PlayClip( self, "DefaultClip", controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( nameWidget )
	self.nameWidget = nameWidget
	
	local purchasePrompt = CoD.CybercorePurchasePrompt.new( menu, controller )
	purchasePrompt:setLeftRight( true, true, 0, 0 )
	purchasePrompt:setTopBottom( false, true, -20, 0 )
	purchasePrompt:setRGB( 1, 1, 1 )
	purchasePrompt:setAlpha( 0 )
	purchasePrompt.prompt:setText( Engine.Localize( "0" ) )
	self:addElement( purchasePrompt )
	self.purchasePrompt = purchasePrompt
	
	local debugImage = LUI.UIImage.new()
	debugImage:setLeftRight( false, false, -10, 10 )
	debugImage:setTopBottom( false, false, -10, 10 )
	debugImage:setRGB( 1, 1, 1 )
	debugImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( debugImage )
	self.debugImage = debugImage
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				abilityImage:completeAnimation()
				self.abilityImage:setAlpha( 0.25 )
				self.clipFinished( abilityImage, {} )
				nameWidget:completeAnimation()
				nameWidget.nameBacking:completeAnimation()
				nameWidget.name:completeAnimation()
				nameWidget.focusBar:completeAnimation()
				self.nameWidget.nameBacking:setRGB( 0.2, 0.2, 0.2 )
				self.nameWidget.name:setRGB( 1, 1, 1 )
				self.nameWidget.focusBar:setAlpha( 0 )
				self.clipFinished( nameWidget, {} )
				purchasePrompt:completeAnimation()
				self.purchasePrompt:setAlpha( 0 )
				self.clipFinished( purchasePrompt, {} )
				debugImage:completeAnimation()
				self.debugImage:setRGB( 1, 1, 1 )
				self.clipFinished( debugImage, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 3 )
				abilityImage:completeAnimation()
				self.abilityImage:setAlpha( 1 )
				self.clipFinished( abilityImage, {} )
				nameWidget:completeAnimation()
				nameWidget.nameBacking:completeAnimation()
				nameWidget.name:completeAnimation()
				nameWidget.focusBar:completeAnimation()
				self.nameWidget.nameBacking:setRGB( 1, 1, 1 )
				self.nameWidget.name:setRGB( 0, 0, 0 )
				self.nameWidget.focusBar:setAlpha( 1 )
				self.clipFinished( nameWidget, {} )
				purchasePrompt:completeAnimation()
				self.purchasePrompt:setAlpha( 0 )
				self.clipFinished( purchasePrompt, {} )
			end
		},
		Purchasable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				abilityImage:completeAnimation()
				self.abilityImage:setAlpha( 0.05 )
				self.clipFinished( abilityImage, {} )
				nameWidget:completeAnimation()
				nameWidget.nameBacking:completeAnimation()
				nameWidget.name:completeAnimation()
				nameWidget.focusBar:completeAnimation()
				self.nameWidget.nameBacking:setRGB( 0.2, 0.2, 0.2 )
				self.nameWidget.name:setRGB( 1, 1, 1 )
				self.nameWidget.focusBar:setAlpha( 0 )
				self.clipFinished( nameWidget, {} )
				purchasePrompt:completeAnimation()
				purchasePrompt.prompt:completeAnimation()
				self.purchasePrompt:setAlpha( 0 )
				self.purchasePrompt.prompt:setText( Engine.Localize( "Install" ) )
				self.clipFinished( purchasePrompt, {} )
				debugImage:completeAnimation()
				self.debugImage:setRGB( 0, 1, 0 )
				self.clipFinished( debugImage, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 4 )
				abilityImage:completeAnimation()
				self.abilityImage:setAlpha( 0.25 )
				self.clipFinished( abilityImage, {} )
				nameWidget:completeAnimation()
				nameWidget.nameBacking:completeAnimation()
				nameWidget.name:completeAnimation()
				nameWidget.focusBar:completeAnimation()
				self.nameWidget.nameBacking:setRGB( 1, 1, 1 )
				self.nameWidget.name:setRGB( 0, 0, 0 )
				self.nameWidget.focusBar:setAlpha( 1 )
				self.clipFinished( nameWidget, {} )
				purchasePrompt:completeAnimation()
				self.purchasePrompt:setAlpha( 1 )
				self.clipFinished( purchasePrompt, {} )
				debugImage:completeAnimation()
				self.debugImage:setRGB( 0, 1, 0 )
				self.clipFinished( debugImage, {} )
			end
		},
		Upgradable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				abilityImage:completeAnimation()
				self.abilityImage:setAlpha( 0.5 )
				self.clipFinished( abilityImage, {} )
				nameWidget:completeAnimation()
				nameWidget.nameBacking:completeAnimation()
				nameWidget.name:completeAnimation()
				nameWidget.focusBar:completeAnimation()
				self.nameWidget.nameBacking:setRGB( 0.2, 0.2, 0.2 )
				self.nameWidget.name:setRGB( 1, 1, 1 )
				self.nameWidget.focusBar:setAlpha( 0 )
				self.clipFinished( nameWidget, {} )
				purchasePrompt:completeAnimation()
				purchasePrompt.prompt:completeAnimation()
				self.purchasePrompt:setAlpha( 0 )
				self.purchasePrompt.prompt:setText( Engine.Localize( "Upgrade" ) )
				self.clipFinished( purchasePrompt, {} )
				debugImage:completeAnimation()
				self.debugImage:setRGB( 0, 0, 1 )
				self.clipFinished( debugImage, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 4 )
				abilityImage:completeAnimation()
				self.abilityImage:setAlpha( 0.8 )
				self.clipFinished( abilityImage, {} )
				nameWidget:completeAnimation()
				nameWidget.nameBacking:completeAnimation()
				nameWidget.name:completeAnimation()
				nameWidget.focusBar:completeAnimation()
				self.nameWidget.nameBacking:setRGB( 1, 1, 1 )
				self.nameWidget.name:setRGB( 0, 0, 0 )
				self.nameWidget.focusBar:setAlpha( 1 )
				self.clipFinished( nameWidget, {} )
				purchasePrompt:completeAnimation()
				purchasePrompt.prompt:completeAnimation()
				self.purchasePrompt:setAlpha( 1 )
				self.purchasePrompt.prompt:setText( Engine.Localize( "Upgrade" ) )
				self.clipFinished( purchasePrompt, {} )
				debugImage:completeAnimation()
				self.debugImage:setRGB( 0, 0, 1 )
				self.clipFinished( debugImage, {} )
			end
		},
		Upgraded = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				abilityImage:completeAnimation()
				self.abilityImage:setAlpha( 0.5 )
				self.clipFinished( abilityImage, {} )
				nameWidget:completeAnimation()
				nameWidget.nameBacking:completeAnimation()
				nameWidget.name:completeAnimation()
				nameWidget.focusBar:completeAnimation()
				self.nameWidget.nameBacking:setRGB( 0.2, 0.2, 0.2 )
				self.nameWidget.name:setRGB( 1, 1, 1 )
				self.nameWidget.focusBar:setAlpha( 0 )
				self.clipFinished( nameWidget, {} )
				purchasePrompt:completeAnimation()
				purchasePrompt.prompt:completeAnimation()
				self.purchasePrompt:setAlpha( 0 )
				self.purchasePrompt.prompt:setText( Engine.Localize( "0" ) )
				self.clipFinished( purchasePrompt, {} )
				debugImage:completeAnimation()
				self.debugImage:setRGB( 1, 0, 0 )
				self.clipFinished( debugImage, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 4 )
				abilityImage:completeAnimation()
				self.abilityImage:setAlpha( 0.8 )
				self.clipFinished( abilityImage, {} )
				nameWidget:completeAnimation()
				nameWidget.nameBacking:completeAnimation()
				nameWidget.name:completeAnimation()
				nameWidget.focusBar:completeAnimation()
				self.nameWidget.nameBacking:setRGB( 1, 1, 1 )
				self.nameWidget.name:setRGB( 0, 0, 0 )
				self.nameWidget.focusBar:setAlpha( 1 )
				self.clipFinished( nameWidget, {} )
				purchasePrompt:completeAnimation()
				purchasePrompt.prompt:completeAnimation()
				self.purchasePrompt:setAlpha( 0 )
				self.purchasePrompt.prompt:setText( Engine.Localize( "0" ) )
				self.clipFinished( purchasePrompt, {} )
				debugImage:completeAnimation()
				self.debugImage:setRGB( 1, 0, 0 )
				self.clipFinished( debugImage, {} )
			end
		},
		Unavailable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				abilityImage:completeAnimation()
				self.abilityImage:setAlpha( 0.05 )
				self.clipFinished( abilityImage, {} )
				nameWidget:completeAnimation()
				nameWidget.nameBacking:completeAnimation()
				nameWidget.name:completeAnimation()
				nameWidget.focusBar:completeAnimation()
				self.nameWidget.nameBacking:setRGB( 0.2, 0.2, 0.2 )
				self.nameWidget.name:setRGB( 1, 1, 1 )
				self.nameWidget.focusBar:setAlpha( 0 )
				self.clipFinished( nameWidget, {} )
				purchasePrompt:completeAnimation()
				self.purchasePrompt:setAlpha( 0 )
				self.clipFinished( purchasePrompt, {} )
				debugImage:completeAnimation()
				self.debugImage:setRGB( 0, 0, 0 )
				self.clipFinished( debugImage, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 4 )
				abilityImage:completeAnimation()
				self.abilityImage:setAlpha( 0.25 )
				self.clipFinished( abilityImage, {} )
				nameWidget:completeAnimation()
				nameWidget.nameBacking:completeAnimation()
				nameWidget.name:completeAnimation()
				nameWidget.focusBar:completeAnimation()
				self.nameWidget.nameBacking:setRGB( 1, 1, 1 )
				self.nameWidget.name:setRGB( 0, 0, 0 )
				self.nameWidget.focusBar:setAlpha( 1 )
				self.clipFinished( nameWidget, {} )
				purchasePrompt:completeAnimation()
				self.purchasePrompt:setAlpha( 0 )
				self.clipFinished( purchasePrompt, {} )
				debugImage:completeAnimation()
				self.debugImage:setRGB( 0, 0, 0 )
				self.clipFinished( debugImage, {} )
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
	self.close = function ( self )
		self.nameWidget:close()
		self.purchasePrompt:close()
		self.abilityImage:close()
		CoD.CybercoreUpgradeModelWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

