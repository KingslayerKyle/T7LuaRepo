require( "ui.uieditor.widgets.CAC.MenuChooseClassold.PrimaryWeaponModelWidget_old" )
require( "ui.uieditor.widgets.CAC.MenuChooseClassold.SecondaryWeaponModelWidget_old" )
require( "ui.uieditor.widgets.CAC.MenuChooseClassold.PrimaryWeaponAttachmentsWidget_old" )
require( "ui.uieditor.widgets.CAC.MenuChooseClassold.SecondaryWeaponAttachmentsWidget_old" )
require( "ui.uieditor.widgets.CAC.MenuChooseClassold.LethalEquipmentWidget_old" )
require( "ui.uieditor.widgets.CAC.MenuChooseClassold.TacticalEquipmentWidget_old" )
require( "ui.uieditor.widgets.CAC.MenuChooseClassold.SpecialGadgetWidget_old" )
require( "ui.uieditor.widgets.CAC.MenuChooseClassold.SpecialtyPerksWidget_old" )
require( "ui.uieditor.widgets.CAC.MenuChooseClassold.CybercomWidget_old" )
require( "ui.uieditor.widgets.CAC.MenuChooseClassold.WildcardWidget_old" )
require( "ui.uieditor.widgets.CAC.MenuChooseClassold.ChooseClassSymbols_old" )

CoD.chooseClassWidget_old = InheritFrom( LUI.UIElement )
CoD.chooseClassWidget_old.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.chooseClassWidget_old )
	self.id = "chooseClassWidget_old"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 821 )
	self:setTopBottom( true, false, 0, 543 )
	self.anyChildUsesUpdateState = true
	
	local primaryWeapon = CoD.PrimaryWeaponModelWidget_old.new( menu, controller )
	primaryWeapon:setLeftRight( false, true, -739, -218 )
	primaryWeapon:setTopBottom( true, false, -9, 178.5 )
	primaryWeapon:setRGB( 1, 1, 1 )
	primaryWeapon:linkToElementModel( self, "primary", false, function ( model )
		primaryWeapon:setModel( model, controller )
	end )
	primaryWeapon:mergeStateConditions( {
		{
			stateName = "NotVisible",
			condition = function ( menu, element, event )
				return not IsCACSlotEquipped( menu, element, controller )
			end
		}
	} )
	primaryWeapon:linkToElementModel( primaryWeapon, "itemIndex", true, function ( model )
		menu:updateElementState( primaryWeapon, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( primaryWeapon )
	self.primaryWeapon = primaryWeapon
	
	local secondaryWeapon = CoD.SecondaryWeaponModelWidget_old.new( menu, controller )
	secondaryWeapon:setLeftRight( false, true, -739, -218 )
	secondaryWeapon:setTopBottom( true, false, 181.5, 321.5 )
	secondaryWeapon:setRGB( 1, 1, 1 )
	secondaryWeapon:linkToElementModel( self, "secondary", false, function ( model )
		secondaryWeapon:setModel( model, controller )
	end )
	secondaryWeapon:mergeStateConditions( {
		{
			stateName = "NotVisible",
			condition = function ( menu, element, event )
				return not IsCACSlotEquipped( menu, element, controller )
			end
		}
	} )
	secondaryWeapon:linkToElementModel( secondaryWeapon, "itemIndex", true, function ( model )
		menu:updateElementState( secondaryWeapon, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( secondaryWeapon )
	self.secondaryWeapon = secondaryWeapon
	
	local primaryAttachments = CoD.PrimaryWeaponAttachmentsWidget_old.new( menu, controller )
	primaryAttachments:setLeftRight( false, true, -739, -291 )
	primaryAttachments:setTopBottom( true, false, 107.5, 177.5 )
	primaryAttachments:setRGB( 1, 1, 1 )
	primaryAttachments:linkToElementModel( self, "primary.custprimaryweaponattachment1", false, function ( model )
		primaryAttachments.optic:setModel( model, controller )
	end )
	primaryAttachments:linkToElementModel( self, "primary.custprimaryweaponattachment2", false, function ( model )
		primaryAttachments.attachment1:setModel( model, controller )
	end )
	primaryAttachments:linkToElementModel( self, "primary.custprimaryweaponattachment3", false, function ( model )
		primaryAttachments.attachment2:setModel( model, controller )
	end )
	primaryAttachments:linkToElementModel( self, "primary.custprimaryweaponattachment4", false, function ( model )
		primaryAttachments.attachment3:setModel( model, controller )
	end )
	primaryAttachments:linkToElementModel( self, "primary.custprimaryweaponattachment5", false, function ( model )
		primaryAttachments.attachment4:setModel( model, controller )
	end )
	primaryAttachments:linkToElementModel( self, "primary.custprimaryweaponattachment6", false, function ( model )
		primaryAttachments.attachment5:setModel( model, controller )
	end )
	self:addElement( primaryAttachments )
	self.primaryAttachments = primaryAttachments
	
	local secondaryAttachments = CoD.SecondaryWeaponAttachmentsWidget_old.new( menu, controller )
	secondaryAttachments:setLeftRight( false, true, -738, -529 )
	secondaryAttachments:setTopBottom( true, false, 251.5, 321.5 )
	secondaryAttachments:setRGB( 1, 1, 1 )
	secondaryAttachments:linkToElementModel( self, "secondary.custsecondaryweaponattachment1", false, function ( model )
		secondaryAttachments.optic:setModel( model, controller )
	end )
	secondaryAttachments:linkToElementModel( self, "secondary.custsecondaryweaponattachment2", false, function ( model )
		secondaryAttachments.attachment1:setModel( model, controller )
	end )
	secondaryAttachments:linkToElementModel( self, "secondary.custsecondaryweaponattachment3", false, function ( model )
		secondaryAttachments.attachment2:setModel( model, controller )
	end )
	self:addElement( secondaryAttachments )
	self.secondaryAttachments = secondaryAttachments
	
	local lethalEquipment = CoD.LethalEquipmentWidget_old.new( menu, controller )
	lethalEquipment:setLeftRight( false, true, -739, -569 )
	lethalEquipment:setTopBottom( true, false, 324.5, 432 )
	lethalEquipment:setRGB( 1, 1, 1 )
	lethalEquipment:linkToElementModel( self, "primarygadget", false, function ( model )
		lethalEquipment:setModel( model, controller )
	end )
	lethalEquipment:mergeStateConditions( {
		{
			stateName = "TakeTwo",
			condition = function ( menu, element, event )
				return IsCACTakeTwoPrimaryGadgetAttachmentEquipped( menu )
			end
		},
		{
			stateName = "NotVisible",
			condition = function ( menu, element, event )
				return not IsCACSlotEquipped( menu, element, controller )
			end
		}
	} )
	if lethalEquipment.m_eventHandlers.update_class then
		local currentEv = lethalEquipment.m_eventHandlers.update_class
		lethalEquipment:registerEventHandler( "update_class", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		lethalEquipment:registerEventHandler( "update_class", LUI.UIElement.updateState )
	end
	lethalEquipment:linkToElementModel( lethalEquipment, "itemIndex", true, function ( model )
		menu:updateElementState( lethalEquipment, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( lethalEquipment )
	self.lethalEquipment = lethalEquipment
	
	local currentEv = CoD.TacticalEquipmentWidget_old.new( menu, controller )
	currentEv:setLeftRight( false, true, -563, -393 )
	currentEv:setTopBottom( true, false, 325, 432 )
	currentEv:setRGB( 1, 1, 1 )
	currentEv:linkToElementModel( self, "secondarygadget", false, function ( model )
		currentEv:setModel( model, controller )
	end )
	currentEv:mergeStateConditions( {
		{
			stateName = "TakeTwo",
			condition = function ( menu, element, event )
				return IsCACTakeTwoSecondaryGadgetAttachmentEquipped( menu )
			end
		},
		{
			stateName = "NotVisible",
			condition = function ( menu, element, event )
				return not IsCACSlotEquipped( menu, element, controller )
			end
		}
	} )
	if currentEv.m_eventHandlers.update_class then
		local currentEv = currentEv.m_eventHandlers.update_class
		currentEv:registerEventHandler( "update_class", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		currentEv:registerEventHandler( "update_class", LUI.UIElement.updateState )
	end
	currentEv:linkToElementModel( currentEv, "itemIndex", true, function ( model )
		menu:updateElementState( currentEv, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( currentEv )
	self.tacticalEquipment = currentEv
	
	local currentEv = CoD.SpecialGadgetWidget_old.new( menu, controller )
	currentEv:setLeftRight( false, true, -388, -218 )
	currentEv:setTopBottom( true, false, 325, 432 )
	currentEv:setRGB( 1, 1, 1 )
	currentEv:linkToElementModel( self, "specialgadget", false, function ( model )
		currentEv:setModel( model, controller )
	end )
	currentEv:mergeStateConditions( {
		{
			stateName = "NotInUse",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		},
		{
			stateName = "NotVisible",
			condition = function ( menu, element, event )
				return not IsCACSlotEquipped( menu, element, controller )
			end
		}
	} )
	currentEv:linkToElementModel( currentEv, "itemIndex", true, function ( model )
		menu:updateElementState( currentEv, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( currentEv )
	self.specialGadget = currentEv
	
	local specialtyPerks = CoD.SpecialtyPerksWidget_old.new( menu, controller )
	specialtyPerks:setLeftRight( false, true, -739, -218 )
	specialtyPerks:setTopBottom( true, false, 435, 543 )
	specialtyPerks:setRGB( 1, 1, 1 )
	specialtyPerks:linkToElementModel( self, "specialty1", false, function ( model )
		specialtyPerks.perks1.perk:setModel( model, controller )
	end )
	specialtyPerks:linkToElementModel( self, "specialty4", false, function ( model )
		specialtyPerks.perks1.perkPlus:setModel( model, controller )
	end )
	specialtyPerks:linkToElementModel( self, "specialty2", false, function ( model )
		specialtyPerks.perks2.perk:setModel( model, controller )
	end )
	specialtyPerks:linkToElementModel( self, "specialty5", false, function ( model )
		specialtyPerks.perks2.perkPlus:setModel( model, controller )
	end )
	specialtyPerks:linkToElementModel( self, "specialty3", false, function ( model )
		specialtyPerks.perks3.perk:setModel( model, controller )
	end )
	specialtyPerks:linkToElementModel( self, "specialty6", false, function ( model )
		specialtyPerks.perks3.perkPlus:setModel( model, controller )
	end )
	specialtyPerks:mergeStateConditions( {
		{
			stateName = "NotVisible",
			condition = function ( menu, element, event )
				return not IsCACAnyPerkEquipped( menu )
			end
		}
	} )
	if specialtyPerks.m_eventHandlers.update_class then
		local currentEv = specialtyPerks.m_eventHandlers.update_class
		specialtyPerks:registerEventHandler( "update_class", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		specialtyPerks:registerEventHandler( "update_class", LUI.UIElement.updateState )
	end
	self:addElement( specialtyPerks )
	self.specialtyPerks = specialtyPerks
	
	local currentEv = CoD.CybercomWidget_old.new( menu, controller )
	currentEv:setLeftRight( true, false, 83, 603 )
	currentEv:setTopBottom( true, false, 435, 543 )
	currentEv:setRGB( 1, 1, 1 )
	currentEv:setAlpha( 0 )
	self:addElement( currentEv )
	self.cybercomAbilities = currentEv
	
	local wildcards = CoD.WildcardWidget_old.new( menu, controller )
	wildcards:setLeftRight( true, false, 608, 745.5 )
	wildcards:setTopBottom( false, true, -552, 0 )
	wildcards:setRGB( 1, 1, 1 )
	wildcards:linkToElementModel( self, "bonuscard1", false, function ( model )
		wildcards.wildcard1:setModel( model, controller )
	end )
	wildcards:linkToElementModel( self, "bonuscard2", false, function ( model )
		wildcards.wildcard2:setModel( model, controller )
	end )
	wildcards:linkToElementModel( self, "bonuscard3", false, function ( model )
		wildcards.wildcard3:setModel( model, controller )
	end )
	wildcards:mergeStateConditions( {
		{
			stateName = "NotVisible",
			condition = function ( menu, element, event )
				return not IsCACAnyWildcardEquipped( menu )
			end
		}
	} )
	if wildcards.m_eventHandlers.update_class then
		local currentEv = wildcards.m_eventHandlers.update_class
		wildcards:registerEventHandler( "update_class", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		wildcards:registerEventHandler( "update_class", LUI.UIElement.updateState )
	end
	self:addElement( wildcards )
	self.wildcards = wildcards
	
	local currentEv = CoD.ChooseClassSymbols_old.new( menu, controller )
	currentEv:setLeftRight( true, false, 1.66, 830.17 )
	currentEv:setTopBottom( true, false, -15, 548.5 )
	currentEv:setRGB( 1, 1, 1 )
	currentEv:setAlpha( 0 )
	self:addElement( currentEv )
	self.ChooseClassSymbols0 = currentEv
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				specialtyPerks:completeAnimation()
				self.specialtyPerks:setAlpha( 1 )
				self.clipFinished( specialtyPerks, {} )
				currentEv:completeAnimation()
				self.cybercomAbilities:setAlpha( 0 )
				self.clipFinished( currentEv, {} )
			end
		},
		CPLoadout = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				specialtyPerks:completeAnimation()
				self.specialtyPerks:setAlpha( 0 )
				self.clipFinished( specialtyPerks, {} )
				currentEv:completeAnimation()
				self.cybercomAbilities:setAlpha( 1 )
				self.clipFinished( currentEv, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "CPLoadout",
			condition = function ( menu, element, event )
				return IsCampaign()
			end
		}
	} )
	self.close = function ( self )
		self.primaryWeapon:close()
		self.secondaryWeapon:close()
		self.primaryAttachments:close()
		self.secondaryAttachments:close()
		self.lethalEquipment:close()
		self.tacticalEquipment:close()
		self.specialGadget:close()
		self.specialtyPerks:close()
		self.cybercomAbilities:close()
		self.wildcards:close()
		self.ChooseClassSymbols0:close()
		CoD.chooseClassWidget_old.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

