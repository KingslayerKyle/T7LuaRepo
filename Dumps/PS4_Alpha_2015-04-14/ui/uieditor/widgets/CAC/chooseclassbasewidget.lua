require( "ui.uieditor.widgets.CAC.ChooseClassGridScreen.PrimaryWeapon.PrimaryWeaponSlotWidget" )
require( "ui.uieditor.widgets.CAC.ChooseClassGridScreen.SecondaryWeapon.SecondaryWeaponSlotWidget" )
require( "ui.uieditor.widgets.CAC.ChooseClassGridScreen.PrimaryWeapon.PrimaryWeaponSlotAttachments" )
require( "ui.uieditor.widgets.CAC.ChooseClassGridScreen.SecondaryWeapon.SecondaryWeaponSlotAttachments" )
require( "ui.uieditor.widgets.CAC.ChooseClassGridScreen.Perk.PerkSlotWidget" )
require( "ui.uieditor.widgets.CAC.ChooseClassGridScreen.Wildcard.WildcardSlotWidget" )
require( "ui.uieditor.widgets.CAC.ChooseClassGridScreen.TacticalGrenade.TacticalGrenadeSlotWidget" )
require( "ui.uieditor.widgets.CAC.ChooseClassGridScreen.LethalGrenade.LethalGrenadeSlotWidget" )
require( "ui.uieditor.widgets.CAC.ChooseClassGridScreen.LethalGrenade.LethalGrenadeModSlotWidget" )
require( "ui.uieditor.widgets.CAC.ChooseClassGridScreen.TacticalGrenade.TacticalGrenadeModSlotWidget" )
require( "ui.uieditor.widgets.CAC.ClassAllocation" )

CoD.chooseClassBaseWidget = InheritFrom( LUI.UIElement )
CoD.chooseClassBaseWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.chooseClassBaseWidget )
	self.id = "chooseClassBaseWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 890 )
	self:setTopBottom( true, false, 0, 584 )
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background:setRGB( 0.82, 0.83, 0.83 )
	background:setAlpha( 0 )
	background:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( background )
	self.background = background
	
	local customClassName = LUI.UITightText.new()
	customClassName:setLeftRight( true, false, 15, 280 )
	customClassName:setTopBottom( true, false, 15, 63 )
	customClassName:setRGB( 0.5, 0.51, 0.52 )
	customClassName:setTTF( "fonts/default.ttf" )
	customClassName:linkToElementModel( self, "customClassName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			customClassName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( customClassName )
	self.customClassName = customClassName
	
	local PrimaryWeaponSlotWidget0 = CoD.PrimaryWeaponSlotWidget.new( menu, controller )
	PrimaryWeaponSlotWidget0:setLeftRight( true, false, 5, 490 )
	PrimaryWeaponSlotWidget0:setTopBottom( true, false, 65, 193 )
	PrimaryWeaponSlotWidget0:setRGB( 1, 1, 1 )
	PrimaryWeaponSlotWidget0:linkToElementModel( self, "primary", false, function ( model )
		PrimaryWeaponSlotWidget0:setModel( model, controller )
	end )
	PrimaryWeaponSlotWidget0:mergeStateConditions( {
		{
			stateName = "Unequipped",
			condition = function ( menu, element, event )
				return not IsCACSlotEquipped( menu, element, controller )
			end
		}
	} )
	PrimaryWeaponSlotWidget0:linkToElementModel( PrimaryWeaponSlotWidget0, "itemIndex", true, function ( model )
		menu:updateElementState( PrimaryWeaponSlotWidget0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( PrimaryWeaponSlotWidget0 )
	self.PrimaryWeaponSlotWidget0 = PrimaryWeaponSlotWidget0
	
	local SecondaryWeaponSlotWidget0 = CoD.SecondaryWeaponSlotWidget.new( menu, controller )
	SecondaryWeaponSlotWidget0:setLeftRight( true, false, 515, 885 )
	SecondaryWeaponSlotWidget0:setTopBottom( true, false, 65, 193 )
	SecondaryWeaponSlotWidget0:setRGB( 1, 1, 1 )
	SecondaryWeaponSlotWidget0:linkToElementModel( self, "secondary", false, function ( model )
		SecondaryWeaponSlotWidget0:setModel( model, controller )
	end )
	SecondaryWeaponSlotWidget0:mergeStateConditions( {
		{
			stateName = "Unequipped",
			condition = function ( menu, element, event )
				return not IsCACSlotEquipped( menu, element, controller )
			end
		}
	} )
	SecondaryWeaponSlotWidget0:linkToElementModel( SecondaryWeaponSlotWidget0, "itemIndex", true, function ( model )
		menu:updateElementState( SecondaryWeaponSlotWidget0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( SecondaryWeaponSlotWidget0 )
	self.SecondaryWeaponSlotWidget0 = SecondaryWeaponSlotWidget0
	
	local PrimaryWeaponSlotAttachments0 = CoD.PrimaryWeaponSlotAttachments.new( menu, controller )
	PrimaryWeaponSlotAttachments0:setLeftRight( true, false, 5, 490 )
	PrimaryWeaponSlotAttachments0:setTopBottom( true, false, 196, 256 )
	PrimaryWeaponSlotAttachments0:setRGB( 1, 1, 1 )
	PrimaryWeaponSlotAttachments0:linkToElementModel( self, "primaryattachment1", false, function ( model )
		PrimaryWeaponSlotAttachments0.PrimaryWeaponSlotOptic:setModel( model, controller )
	end )
	PrimaryWeaponSlotAttachments0:linkToElementModel( self, "primaryattachment2", false, function ( model )
		PrimaryWeaponSlotAttachments0.PrimaryWeaponSlotAttachmentItem0:setModel( model, controller )
	end )
	PrimaryWeaponSlotAttachments0:linkToElementModel( self, "primaryattachment3", false, function ( model )
		PrimaryWeaponSlotAttachments0.PrimaryWeaponSlotAttachmentItem1:setModel( model, controller )
	end )
	PrimaryWeaponSlotAttachments0:linkToElementModel( self, "primaryattachment4", false, function ( model )
		PrimaryWeaponSlotAttachments0.PrimaryWeaponSlotAttachmentItem2:setModel( model, controller )
	end )
	PrimaryWeaponSlotAttachments0:linkToElementModel( self, "primaryattachment5", false, function ( model )
		PrimaryWeaponSlotAttachments0.PrimaryWeaponSlotAttachmentItem3:setModel( model, controller )
	end )
	PrimaryWeaponSlotAttachments0:linkToElementModel( self, "primaryattachment6", false, function ( model )
		PrimaryWeaponSlotAttachments0.PrimaryWeaponSlotAttachmentItem4:setModel( model, controller )
	end )
	self:addElement( PrimaryWeaponSlotAttachments0 )
	self.PrimaryWeaponSlotAttachments0 = PrimaryWeaponSlotAttachments0
	
	local SecondaryWeaponSlotAttachments0 = CoD.SecondaryWeaponSlotAttachments.new( menu, controller )
	SecondaryWeaponSlotAttachments0:setLeftRight( true, false, 515, 885 )
	SecondaryWeaponSlotAttachments0:setTopBottom( true, false, 196, 256 )
	SecondaryWeaponSlotAttachments0:setRGB( 1, 1, 1 )
	SecondaryWeaponSlotAttachments0:linkToElementModel( self, "secondaryattachment1", false, function ( model )
		SecondaryWeaponSlotAttachments0.SecondaryWeaponSlotOptic:setModel( model, controller )
	end )
	SecondaryWeaponSlotAttachments0:linkToElementModel( self, "secondaryattachment2", false, function ( model )
		SecondaryWeaponSlotAttachments0.SecondaryWeaponSlotAttachmentItem0:setModel( model, controller )
	end )
	SecondaryWeaponSlotAttachments0:linkToElementModel( self, "secondaryattachment3", false, function ( model )
		SecondaryWeaponSlotAttachments0.SecondaryWeaponSlotAttachmentItem1:setModel( model, controller )
	end )
	self:addElement( SecondaryWeaponSlotAttachments0 )
	self.SecondaryWeaponSlotAttachments0 = SecondaryWeaponSlotAttachments0
	
	local PerkSlotWidget0 = CoD.PerkSlotWidget.new( menu, controller )
	PerkSlotWidget0:setLeftRight( true, false, 515, 632 )
	PerkSlotWidget0:setTopBottom( true, false, 263, 471 )
	PerkSlotWidget0:setRGB( 1, 1, 1 )
	PerkSlotWidget0.perkHeaderLabel:setText( Engine.Localize( "MPUI_PERK_1_CAPS" ) )
	PerkSlotWidget0:linkToElementModel( self, "specialty1", false, function ( model )
		PerkSlotWidget0.PerkSlotItemWidget0:setModel( model, controller )
	end )
	PerkSlotWidget0:linkToElementModel( self, "specialty4", false, function ( model )
		PerkSlotWidget0.PerkSlotItemWidget1:setModel( model, controller )
	end )
	self:addElement( PerkSlotWidget0 )
	self.PerkSlotWidget0 = PerkSlotWidget0
	
	local PerkSlotWidget1 = CoD.PerkSlotWidget.new( menu, controller )
	PerkSlotWidget1:setLeftRight( true, false, 641, 759 )
	PerkSlotWidget1:setTopBottom( true, false, 263, 471 )
	PerkSlotWidget1:setRGB( 1, 1, 1 )
	PerkSlotWidget1.perkHeaderLabel:setText( Engine.Localize( "MPUI_PERK_2_CAPS" ) )
	PerkSlotWidget1:linkToElementModel( self, "specialty2", false, function ( model )
		PerkSlotWidget1.PerkSlotItemWidget0:setModel( model, controller )
	end )
	PerkSlotWidget1:linkToElementModel( self, "specialty5", false, function ( model )
		PerkSlotWidget1.PerkSlotItemWidget1:setModel( model, controller )
	end )
	self:addElement( PerkSlotWidget1 )
	self.PerkSlotWidget1 = PerkSlotWidget1
	
	local PerkSlotWidget2 = CoD.PerkSlotWidget.new( menu, controller )
	PerkSlotWidget2:setLeftRight( true, false, 767, 885 )
	PerkSlotWidget2:setTopBottom( true, false, 263, 471 )
	PerkSlotWidget2:setRGB( 1, 1, 1 )
	PerkSlotWidget2.perkHeaderLabel:setText( Engine.Localize( "MPUI_PERK_3_CAPS" ) )
	PerkSlotWidget2:linkToElementModel( self, "specialty3", false, function ( model )
		PerkSlotWidget2.PerkSlotItemWidget0:setModel( model, controller )
	end )
	PerkSlotWidget2:linkToElementModel( self, "specialty6", false, function ( model )
		PerkSlotWidget2.PerkSlotItemWidget1:setModel( model, controller )
	end )
	self:addElement( PerkSlotWidget2 )
	self.PerkSlotWidget2 = PerkSlotWidget2
	
	local WildcardSlotWidget0 = CoD.WildcardSlotWidget.new( menu, controller )
	WildcardSlotWidget0:setLeftRight( true, false, 5, 885 )
	WildcardSlotWidget0:setTopBottom( true, false, 471, 564 )
	WildcardSlotWidget0:setRGB( 1, 1, 1 )
	WildcardSlotWidget0:linkToElementModel( self, "bonuscard1", false, function ( model )
		WildcardSlotWidget0.wildcardCard1:setModel( model, controller )
	end )
	WildcardSlotWidget0:linkToElementModel( self, "bonuscard2", false, function ( model )
		WildcardSlotWidget0.wildcardCard2:setModel( model, controller )
	end )
	WildcardSlotWidget0:linkToElementModel( self, "bonuscard3", false, function ( model )
		WildcardSlotWidget0.wildcardCard3:setModel( model, controller )
	end )
	self:addElement( WildcardSlotWidget0 )
	self.WildcardSlotWidget0 = WildcardSlotWidget0
	
	local TacticalGrenadeSlotWidget0 = CoD.TacticalGrenadeSlotWidget.new( menu, controller )
	TacticalGrenadeSlotWidget0:setLeftRight( true, false, 5, 241 )
	TacticalGrenadeSlotWidget0:setTopBottom( true, false, 263, 379 )
	TacticalGrenadeSlotWidget0:setRGB( 1, 1, 1 )
	TacticalGrenadeSlotWidget0:linkToElementModel( self, "secondarygadget", false, function ( model )
		TacticalGrenadeSlotWidget0:setModel( model, controller )
	end )
	TacticalGrenadeSlotWidget0:mergeStateConditions( {
		{
			stateName = "Unequipped",
			condition = function ( menu, element, event )
				return not IsCACSlotEquipped( menu, element, controller )
			end
		}
	} )
	TacticalGrenadeSlotWidget0:linkToElementModel( TacticalGrenadeSlotWidget0, "itemIndex", true, function ( model )
		menu:updateElementState( TacticalGrenadeSlotWidget0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( TacticalGrenadeSlotWidget0 )
	self.TacticalGrenadeSlotWidget0 = TacticalGrenadeSlotWidget0
	
	local LethalGrenadeSlotWidget0 = CoD.LethalGrenadeSlotWidget.new( menu, controller )
	LethalGrenadeSlotWidget0:setLeftRight( true, false, 254, 490 )
	LethalGrenadeSlotWidget0:setTopBottom( true, false, 263, 379 )
	LethalGrenadeSlotWidget0:setRGB( 1, 1, 1 )
	LethalGrenadeSlotWidget0:linkToElementModel( self, "primarygadget", false, function ( model )
		LethalGrenadeSlotWidget0:setModel( model, controller )
	end )
	LethalGrenadeSlotWidget0:mergeStateConditions( {
		{
			stateName = "Unequipped",
			condition = function ( menu, element, event )
				return not IsCACSlotEquipped( menu, element, controller )
			end
		}
	} )
	LethalGrenadeSlotWidget0:linkToElementModel( LethalGrenadeSlotWidget0, "itemIndex", true, function ( model )
		menu:updateElementState( LethalGrenadeSlotWidget0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( LethalGrenadeSlotWidget0 )
	self.LethalGrenadeSlotWidget0 = LethalGrenadeSlotWidget0
	
	local LethalGrenadeModSlotWidget0 = CoD.LethalGrenadeModSlotWidget.new( menu, controller )
	LethalGrenadeModSlotWidget0:setLeftRight( true, false, 254, 490 )
	LethalGrenadeModSlotWidget0:setTopBottom( true, false, 382, 471 )
	LethalGrenadeModSlotWidget0:setRGB( 1, 1, 1 )
	LethalGrenadeModSlotWidget0:linkToElementModel( self, "primarygadget", false, function ( model )
		LethalGrenadeModSlotWidget0:setModel( model, controller )
	end )
	self:addElement( LethalGrenadeModSlotWidget0 )
	self.LethalGrenadeModSlotWidget0 = LethalGrenadeModSlotWidget0
	
	local TacticalGrenadeModSlotWidget0 = CoD.TacticalGrenadeModSlotWidget.new( menu, controller )
	TacticalGrenadeModSlotWidget0:setLeftRight( true, false, 5, 241 )
	TacticalGrenadeModSlotWidget0:setTopBottom( true, false, 382, 471 )
	TacticalGrenadeModSlotWidget0:setRGB( 1, 1, 1 )
	TacticalGrenadeModSlotWidget0:linkToElementModel( self, "secondarygadget", false, function ( model )
		TacticalGrenadeModSlotWidget0:setModel( model, controller )
	end )
	self:addElement( TacticalGrenadeModSlotWidget0 )
	self.TacticalGrenadeModSlotWidget0 = TacticalGrenadeModSlotWidget0
	
	local ClassAllocation0 = CoD.ClassAllocation.new( menu, controller )
	ClassAllocation0:setLeftRight( true, false, 450, 885 )
	ClassAllocation0:setTopBottom( true, false, 26, 61 )
	ClassAllocation0:setRGB( 1, 1, 1 )
	ClassAllocation0:linkToElementModel( self, nil, false, function ( model )
		ClassAllocation0:setModel( model, controller )
	end )
	self:addElement( ClassAllocation0 )
	self.ClassAllocation0 = ClassAllocation0
	
	self.close = function ( self )
		self.PrimaryWeaponSlotWidget0:close()
		self.SecondaryWeaponSlotWidget0:close()
		self.PrimaryWeaponSlotAttachments0:close()
		self.SecondaryWeaponSlotAttachments0:close()
		self.PerkSlotWidget0:close()
		self.PerkSlotWidget1:close()
		self.PerkSlotWidget2:close()
		self.WildcardSlotWidget0:close()
		self.TacticalGrenadeSlotWidget0:close()
		self.LethalGrenadeSlotWidget0:close()
		self.LethalGrenadeModSlotWidget0:close()
		self.TacticalGrenadeModSlotWidget0:close()
		self.ClassAllocation0:close()
		self.customClassName:close()
		CoD.chooseClassBaseWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

