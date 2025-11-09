require( "ui.uieditor.widgets.CAC.CustomClassListScreen.Panes.Wildcards.WildcardPane" )
require( "ui.uieditor.widgets.CAC.CustomClassListScreen.Panes.Weapons.PrimaryWeaponSlot" )
require( "ui.uieditor.widgets.CAC.CustomClassListScreen.Panes.Weapons.PrimaryWeaponAttachments" )
require( "ui.uieditor.widgets.CAC.CustomClassListScreen.Panes.Weapons.SecondaryWeaponSlot" )
require( "ui.uieditor.widgets.CAC.CustomClassListScreen.Panes.Weapons.SecondaryWeaponAttachments" )
require( "ui.uieditor.widgets.CAC.CustomClassListScreen.Panes.Equipment.LethalSlot" )
require( "ui.uieditor.widgets.CAC.CustomClassListScreen.Panes.Equipment.LethalAttachments" )
require( "ui.uieditor.widgets.CAC.CustomClassListScreen.Panes.Equipment.TacticalSlot" )
require( "ui.uieditor.widgets.CAC.CustomClassListScreen.Panes.Equipment.TacticalAttachments" )
require( "ui.uieditor.widgets.CAC.CustomClassListScreen.Panes.Equipment.SpecialGadgetSlot" )
require( "ui.uieditor.widgets.CAC.CustomClassListScreen.Panes.Perks.PerkSlot" )
require( "ui.uieditor.widgets.CAC.CustomClassListScreen.Panes.Perks.PerkBonusSlot" )

CoD.CustomClassLayout = InheritFrom( LUI.UIElement )
CoD.CustomClassLayout.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CustomClassLayout )
	self.id = "CustomClassLayout"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 3717 )
	self:setTopBottom( true, false, 0, 445 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local WildcardPane0 = CoD.WildcardPane.new( menu, controller )
	WildcardPane0:setLeftRight( true, false, 104.5, 212.5 )
	WildcardPane0:setTopBottom( true, false, 0, 433.83 )
	WildcardPane0:setRGB( 1, 1, 1 )
	WildcardPane0:linkToElementModel( self, nil, false, function ( model )
		WildcardPane0:setModel( model, controller )
	end )
	self:addElement( WildcardPane0 )
	self.WildcardPane0 = WildcardPane0
	
	local PrimaryWeaponSlot0 = CoD.PrimaryWeaponSlot.new( menu, controller )
	PrimaryWeaponSlot0:setLeftRight( true, false, 274.5, 948.5 )
	PrimaryWeaponSlot0:setTopBottom( true, false, 0, 304 )
	PrimaryWeaponSlot0:setRGB( 1, 1, 1 )
	PrimaryWeaponSlot0:linkToElementModel( self, "primary", false, function ( model )
		PrimaryWeaponSlot0:setModel( model, controller )
	end )
	PrimaryWeaponSlot0:mergeStateConditions( {
		{
			stateName = "Unequipped",
			condition = function ( menu, element, event )
				return not IsCACSlotEquipped( menu, element, controller )
			end
		}
	} )
	PrimaryWeaponSlot0:linkToElementModel( PrimaryWeaponSlot0, "itemIndex", true, function ( model )
		menu:updateElementState( PrimaryWeaponSlot0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( PrimaryWeaponSlot0 )
	self.PrimaryWeaponSlot0 = PrimaryWeaponSlot0
	
	local PrimaryWeaponAttachments0 = CoD.PrimaryWeaponAttachments.new( menu, controller )
	PrimaryWeaponAttachments0:setLeftRight( true, false, 274.5, 949.5 )
	PrimaryWeaponAttachments0:setTopBottom( true, false, 311, 445 )
	PrimaryWeaponAttachments0:setRGB( 1, 1, 1 )
	PrimaryWeaponAttachments0:linkToElementModel( self, nil, false, function ( model )
		PrimaryWeaponAttachments0:setModel( model, controller )
	end )
	self:addElement( PrimaryWeaponAttachments0 )
	self.PrimaryWeaponAttachments0 = PrimaryWeaponAttachments0
	
	local SecondaryWeaponSlot0 = CoD.SecondaryWeaponSlot.new( menu, controller )
	SecondaryWeaponSlot0:setLeftRight( true, false, 1010.5, 1345.17 )
	SecondaryWeaponSlot0:setTopBottom( true, false, 0, 304 )
	SecondaryWeaponSlot0:setRGB( 1, 1, 1 )
	SecondaryWeaponSlot0:linkToElementModel( self, "secondary", false, function ( model )
		SecondaryWeaponSlot0:setModel( model, controller )
	end )
	SecondaryWeaponSlot0:mergeStateConditions( {
		{
			stateName = "Unequipped",
			condition = function ( menu, element, event )
				return not IsCACSlotEquipped( menu, element, controller )
			end
		}
	} )
	SecondaryWeaponSlot0:linkToElementModel( SecondaryWeaponSlot0, "itemIndex", true, function ( model )
		menu:updateElementState( SecondaryWeaponSlot0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( SecondaryWeaponSlot0 )
	self.SecondaryWeaponSlot0 = SecondaryWeaponSlot0
	
	local SecondaryWeaponAttachments0 = CoD.SecondaryWeaponAttachments.new( menu, controller )
	SecondaryWeaponAttachments0:setLeftRight( true, false, 1010.5, 1345.5 )
	SecondaryWeaponAttachments0:setTopBottom( true, false, 311, 445 )
	SecondaryWeaponAttachments0:setRGB( 1, 1, 1 )
	SecondaryWeaponAttachments0:linkToElementModel( self, nil, false, function ( model )
		SecondaryWeaponAttachments0:setModel( model, controller )
	end )
	self:addElement( SecondaryWeaponAttachments0 )
	self.SecondaryWeaponAttachments0 = SecondaryWeaponAttachments0
	
	local LethalSlot0 = CoD.LethalSlot.new( menu, controller )
	LethalSlot0:setLeftRight( true, false, 1407.17, 1742.17 )
	LethalSlot0:setTopBottom( true, false, 0, 304 )
	LethalSlot0:setRGB( 1, 1, 1 )
	LethalSlot0:linkToElementModel( self, "primarygadget", false, function ( model )
		LethalSlot0:setModel( model, controller )
	end )
	LethalSlot0:mergeStateConditions( {
		{
			stateName = "Unequipped",
			condition = function ( menu, element, event )
				return not IsCACSlotEquipped( menu, element, controller )
			end
		}
	} )
	LethalSlot0:linkToElementModel( LethalSlot0, "itemIndex", true, function ( model )
		menu:updateElementState( LethalSlot0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( LethalSlot0 )
	self.LethalSlot0 = LethalSlot0
	
	local LethalAttachments0 = CoD.LethalAttachments.new( menu, controller )
	LethalAttachments0:setLeftRight( true, false, 1407.17, 1515.17 )
	LethalAttachments0:setTopBottom( true, false, 311, 445 )
	LethalAttachments0:setRGB( 1, 1, 1 )
	LethalAttachments0:linkToElementModel( self, "primarygadgetattachment1", false, function ( model )
		LethalAttachments0:setModel( model, controller )
	end )
	self:addElement( LethalAttachments0 )
	self.LethalAttachments0 = LethalAttachments0
	
	local TacticalSlot0 = CoD.TacticalSlot.new( menu, controller )
	TacticalSlot0:setLeftRight( true, false, 1775.83, 2110.83 )
	TacticalSlot0:setTopBottom( true, false, 0, 304 )
	TacticalSlot0:setRGB( 1, 1, 1 )
	TacticalSlot0:linkToElementModel( self, "secondarygadget", false, function ( model )
		TacticalSlot0:setModel( model, controller )
	end )
	TacticalSlot0:mergeStateConditions( {
		{
			stateName = "Unequipped",
			condition = function ( menu, element, event )
				return not IsCACSlotEquipped( menu, element, controller )
			end
		}
	} )
	TacticalSlot0:linkToElementModel( TacticalSlot0, "itemIndex", true, function ( model )
		menu:updateElementState( TacticalSlot0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( TacticalSlot0 )
	self.TacticalSlot0 = TacticalSlot0
	
	local TacticalAttachments0 = CoD.TacticalAttachments.new( menu, controller )
	TacticalAttachments0:setLeftRight( true, false, 1775.83, 1883.83 )
	TacticalAttachments0:setTopBottom( true, false, 311, 445 )
	TacticalAttachments0:setRGB( 1, 1, 1 )
	TacticalAttachments0:linkToElementModel( self, "secondarygadgetattachment1", false, function ( model )
		TacticalAttachments0:setModel( model, controller )
	end )
	self:addElement( TacticalAttachments0 )
	self.TacticalAttachments0 = TacticalAttachments0
	
	local SpecialGadgetSlot0 = CoD.SpecialGadgetSlot.new( menu, controller )
	SpecialGadgetSlot0:setLeftRight( true, false, 2144.49, 2479.49 )
	SpecialGadgetSlot0:setTopBottom( true, false, 0, 304 )
	SpecialGadgetSlot0:setRGB( 1, 1, 1 )
	SpecialGadgetSlot0:linkToElementModel( self, "specialgadget", false, function ( model )
		SpecialGadgetSlot0:setModel( model, controller )
	end )
	SpecialGadgetSlot0:mergeStateConditions( {
		{
			stateName = "NotInUse",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		},
		{
			stateName = "Unequipped",
			condition = function ( menu, element, event )
				return not IsCACSlotEquipped( menu, element, controller )
			end
		}
	} )
	SpecialGadgetSlot0:linkToElementModel( SpecialGadgetSlot0, "itemIndex", true, function ( model )
		menu:updateElementState( SpecialGadgetSlot0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( SpecialGadgetSlot0 )
	self.SpecialGadgetSlot0 = SpecialGadgetSlot0
	
	local Perk1 = CoD.PerkSlot.new( menu, controller )
	Perk1:setLeftRight( true, false, 2540.84, 2875.84 )
	Perk1:setTopBottom( true, false, 0, 304 )
	Perk1:setRGB( 1, 1, 1 )
	Perk1.CustomClassCategoryHeader0.text:setText( Engine.Localize( "MPUI_PERK1_CAPS" ) )
	Perk1:linkToElementModel( self, "specialty1", false, function ( model )
		Perk1:setModel( model, controller )
	end )
	Perk1:mergeStateConditions( {
		{
			stateName = "Unequipped",
			condition = function ( menu, element, event )
				return not IsCACSlotEquipped( menu, element, controller )
			end
		}
	} )
	Perk1:linkToElementModel( Perk1, "itemIndex", true, function ( model )
		menu:updateElementState( Perk1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( Perk1 )
	self.Perk1 = Perk1
	
	local Perk2 = CoD.PerkSlot.new( menu, controller )
	Perk2:setLeftRight( true, false, 2909.5, 3244.17 )
	Perk2:setTopBottom( true, false, 0, 304 )
	Perk2:setRGB( 1, 1, 1 )
	Perk2.CustomClassCategoryHeader0.text:setText( Engine.Localize( "MPUI_PERK2_CAPS" ) )
	Perk2:linkToElementModel( self, "specialty2", false, function ( model )
		Perk2:setModel( model, controller )
	end )
	Perk2:mergeStateConditions( {
		{
			stateName = "Unequipped",
			condition = function ( menu, element, event )
				return not IsCACSlotEquipped( menu, element, controller )
			end
		}
	} )
	Perk2:linkToElementModel( Perk2, "itemIndex", true, function ( model )
		menu:updateElementState( Perk2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( Perk2 )
	self.Perk2 = Perk2
	
	local Perk3 = CoD.PerkSlot.new( menu, controller )
	Perk3:setLeftRight( true, false, 3277.84, 3612.5 )
	Perk3:setTopBottom( true, false, 0, 304 )
	Perk3:setRGB( 1, 1, 1 )
	Perk3.CustomClassCategoryHeader0.text:setText( Engine.Localize( "MPUI_PERK3_CAPS" ) )
	Perk3:linkToElementModel( self, "specialty3", false, function ( model )
		Perk3:setModel( model, controller )
	end )
	Perk3:mergeStateConditions( {
		{
			stateName = "Unequipped",
			condition = function ( menu, element, event )
				return not IsCACSlotEquipped( menu, element, controller )
			end
		}
	} )
	Perk3:linkToElementModel( Perk3, "itemIndex", true, function ( model )
		menu:updateElementState( Perk3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( Perk3 )
	self.Perk3 = Perk3
	
	local Perk1Bonus = CoD.PerkBonusSlot.new( menu, controller )
	Perk1Bonus:setLeftRight( true, false, 2540.84, 2648.84 )
	Perk1Bonus:setTopBottom( true, false, 311, 445 )
	Perk1Bonus:setRGB( 1, 1, 1 )
	Perk1Bonus:linkToElementModel( self, "specialty4", false, function ( model )
		Perk1Bonus:setModel( model, controller )
	end )
	self:addElement( Perk1Bonus )
	self.Perk1Bonus = Perk1Bonus
	
	local Perk2Bonus = CoD.PerkBonusSlot.new( menu, controller )
	Perk2Bonus:setLeftRight( true, false, 2909.5, 3017.5 )
	Perk2Bonus:setTopBottom( true, false, 311, 445 )
	Perk2Bonus:setRGB( 1, 1, 1 )
	Perk2Bonus:linkToElementModel( self, "specialty5", false, function ( model )
		Perk2Bonus:setModel( model, controller )
	end )
	self:addElement( Perk2Bonus )
	self.Perk2Bonus = Perk2Bonus
	
	local Perk3Bonus = CoD.PerkBonusSlot.new( menu, controller )
	Perk3Bonus:setLeftRight( true, false, 3277.84, 3385.84 )
	Perk3Bonus:setTopBottom( true, false, 311, 445 )
	Perk3Bonus:setRGB( 1, 1, 1 )
	Perk3Bonus:linkToElementModel( self, "specialty6", false, function ( model )
		Perk3Bonus:setModel( model, controller )
	end )
	self:addElement( Perk3Bonus )
	self.Perk3Bonus = Perk3Bonus
	
	WildcardPane0.navigation = {
		right = {
			PrimaryWeaponSlot0,
			PrimaryWeaponAttachments0
		}
	}
	PrimaryWeaponSlot0.navigation = {
		left = WildcardPane0,
		right = SecondaryWeaponSlot0,
		down = PrimaryWeaponAttachments0
	}
	PrimaryWeaponAttachments0.navigation = {
		left = WildcardPane0,
		up = PrimaryWeaponSlot0,
		right = SecondaryWeaponAttachments0
	}
	SecondaryWeaponSlot0.navigation = {
		left = PrimaryWeaponSlot0,
		right = LethalSlot0,
		down = SecondaryWeaponAttachments0
	}
	SecondaryWeaponAttachments0.navigation = {
		left = PrimaryWeaponAttachments0,
		up = SecondaryWeaponSlot0,
		right = LethalAttachments0
	}
	LethalSlot0.navigation = {
		left = SecondaryWeaponSlot0,
		right = TacticalSlot0,
		down = LethalAttachments0
	}
	LethalAttachments0.navigation = {
		left = SecondaryWeaponAttachments0,
		up = LethalSlot0,
		right = TacticalAttachments0
	}
	TacticalSlot0.navigation = {
		left = LethalSlot0,
		right = SpecialGadgetSlot0,
		down = TacticalAttachments0
	}
	TacticalAttachments0.navigation = {
		left = LethalAttachments0,
		up = TacticalSlot0,
		right = Perk1Bonus
	}
	SpecialGadgetSlot0.navigation = {
		left = TacticalSlot0,
		right = Perk1
	}
	Perk1.navigation = {
		left = SpecialGadgetSlot0,
		right = Perk2,
		down = Perk1Bonus
	}
	Perk2.navigation = {
		left = Perk1,
		right = Perk3,
		down = Perk2Bonus
	}
	Perk3.navigation = {
		left = Perk2,
		down = Perk3Bonus
	}
	Perk1Bonus.navigation = {
		left = TacticalAttachments0,
		up = Perk1,
		right = Perk2Bonus
	}
	Perk2Bonus.navigation = {
		left = Perk1Bonus,
		up = Perk2,
		right = Perk3Bonus
	}
	Perk3Bonus.navigation = {
		left = Perk2Bonus,
		up = Perk3
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 15 )
				WildcardPane0:completeAnimation()
				self.WildcardPane0:setAlpha( 1 )
				self.clipFinished( WildcardPane0, {} )
				PrimaryWeaponSlot0:completeAnimation()
				self.PrimaryWeaponSlot0:setAlpha( 1 )
				self.clipFinished( PrimaryWeaponSlot0, {} )
				PrimaryWeaponAttachments0:completeAnimation()
				self.PrimaryWeaponAttachments0:setAlpha( 1 )
				self.clipFinished( PrimaryWeaponAttachments0, {} )
				SecondaryWeaponSlot0:completeAnimation()
				self.SecondaryWeaponSlot0:setAlpha( 1 )
				self.clipFinished( SecondaryWeaponSlot0, {} )
				SecondaryWeaponAttachments0:completeAnimation()
				self.SecondaryWeaponAttachments0:setAlpha( 1 )
				self.clipFinished( SecondaryWeaponAttachments0, {} )
				LethalSlot0:completeAnimation()
				self.LethalSlot0:setAlpha( 1 )
				self.clipFinished( LethalSlot0, {} )
				LethalAttachments0:completeAnimation()
				self.LethalAttachments0:setAlpha( 1 )
				self.clipFinished( LethalAttachments0, {} )
				TacticalSlot0:completeAnimation()
				self.TacticalSlot0:setAlpha( 1 )
				self.clipFinished( TacticalSlot0, {} )
				TacticalAttachments0:completeAnimation()
				self.TacticalAttachments0:setAlpha( 1 )
				self.clipFinished( TacticalAttachments0, {} )
				Perk1:completeAnimation()
				self.Perk1:setAlpha( 1 )
				self.clipFinished( Perk1, {} )
				Perk2:completeAnimation()
				self.Perk2:setAlpha( 1 )
				self.clipFinished( Perk2, {} )
				Perk3:completeAnimation()
				self.Perk3:setAlpha( 1 )
				self.clipFinished( Perk3, {} )
				Perk1Bonus:completeAnimation()
				self.Perk1Bonus:setAlpha( 1 )
				self.clipFinished( Perk1Bonus, {} )
				Perk2Bonus:completeAnimation()
				self.Perk2Bonus:setAlpha( 1 )
				self.clipFinished( Perk2Bonus, {} )
				Perk3Bonus:completeAnimation()
				self.Perk3Bonus:setAlpha( 1 )
				self.clipFinished( Perk3Bonus, {} )
			end
		}
	}
	WildcardPane0.id = "WildcardPane0"
	PrimaryWeaponSlot0.id = "PrimaryWeaponSlot0"
	PrimaryWeaponAttachments0.id = "PrimaryWeaponAttachments0"
	SecondaryWeaponSlot0.id = "SecondaryWeaponSlot0"
	SecondaryWeaponAttachments0.id = "SecondaryWeaponAttachments0"
	LethalSlot0.id = "LethalSlot0"
	LethalAttachments0.id = "LethalAttachments0"
	TacticalSlot0.id = "TacticalSlot0"
	TacticalAttachments0.id = "TacticalAttachments0"
	SpecialGadgetSlot0.id = "SpecialGadgetSlot0"
	Perk1.id = "Perk1"
	Perk2.id = "Perk2"
	Perk3.id = "Perk3"
	Perk1Bonus.id = "Perk1Bonus"
	Perk2Bonus.id = "Perk2Bonus"
	Perk3Bonus.id = "Perk3Bonus"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.PrimaryWeaponSlot0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.WildcardPane0:close()
		self.PrimaryWeaponSlot0:close()
		self.PrimaryWeaponAttachments0:close()
		self.SecondaryWeaponSlot0:close()
		self.SecondaryWeaponAttachments0:close()
		self.LethalSlot0:close()
		self.LethalAttachments0:close()
		self.TacticalSlot0:close()
		self.TacticalAttachments0:close()
		self.SpecialGadgetSlot0:close()
		self.Perk1:close()
		self.Perk2:close()
		self.Perk3:close()
		self.Perk1Bonus:close()
		self.Perk2Bonus:close()
		self.Perk3Bonus:close()
		CoD.CustomClassLayout.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

