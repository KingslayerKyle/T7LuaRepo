-- 9522e1f69ea7be0d3f141ddf3ef920fb
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.MenuChooseClass.SpecialtyPerksWidget" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.LethalEquipmentWidget" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.TacticalEquipmentWidget" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.TacticalRigWidget" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.WildcardWidgetNew" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.CategoryHeader" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.SecondaryWeaponWidget" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.SecondaryWeaponAttachmentsWidget" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.PrimaryWeaponWidget" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.PrimaryWeaponAttachmentsWidget" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	if Dvar.ui_execdemo_cp:get() then
		f1_arg0.Wildcards:close()
		f1_arg0.WildcardHeader:close()
	end
	if CoD.isPC then
		f1_arg0:setUseStencil( false )
	end
end

CoD.chooseClassWidget = InheritFrom( LUI.UIElement )
CoD.chooseClassWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.chooseClassWidget )
	self.id = "chooseClassWidget"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 500 )
	self:setTopBottom( true, false, 0, 624 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local weaponAttachmentSpacer = LUI.UIImage.new()
	weaponAttachmentSpacer:setLeftRight( false, false, -41.5, -25.5 )
	weaponAttachmentSpacer:setTopBottom( true, true, 56, -81 )
	weaponAttachmentSpacer:setRGB( 0.8, 0.24, 0.24 )
	weaponAttachmentSpacer:setAlpha( 0 )
	self:addElement( weaponAttachmentSpacer )
	self.weaponAttachmentSpacer = weaponAttachmentSpacer
	
	local secondaryEquipmentSpacer = LUI.UIImage.new()
	secondaryEquipmentSpacer:setLeftRight( true, true, 0, 0 )
	secondaryEquipmentSpacer:setTopBottom( true, false, 339, 364 )
	secondaryEquipmentSpacer:setRGB( 0.8, 0.24, 0.24 )
	secondaryEquipmentSpacer:setAlpha( 0 )
	self:addElement( secondaryEquipmentSpacer )
	self.secondaryEquipmentSpacer = secondaryEquipmentSpacer
	
	local bottomSpacer = LUI.UIImage.new()
	bottomSpacer:setLeftRight( true, true, 0, 0 )
	bottomSpacer:setTopBottom( false, true, -81.5, -45.5 )
	bottomSpacer:setRGB( 0.8, 0.24, 0.24 )
	bottomSpacer:setAlpha( 0 )
	self:addElement( bottomSpacer )
	self.bottomSpacer = bottomSpacer
	
	local primarySecondarySpacer = LUI.UIImage.new()
	primarySecondarySpacer:setLeftRight( true, true, 0, 0 )
	primarySecondarySpacer:setTopBottom( true, false, 185, 210 )
	primarySecondarySpacer:setRGB( 0.8, 0.24, 0.24 )
	primarySecondarySpacer:setAlpha( 0 )
	self:addElement( primarySecondarySpacer )
	self.primarySecondarySpacer = primarySecondarySpacer
	
	local topSpacer = LUI.UIImage.new()
	topSpacer:setLeftRight( true, true, 0, 0 )
	topSpacer:setTopBottom( true, false, 0, 56 )
	topSpacer:setRGB( 0.8, 0.24, 0.24 )
	topSpacer:setAlpha( 0 )
	self:addElement( topSpacer )
	self.topSpacer = topSpacer
	
	local SpecialtyPerks = CoD.SpecialtyPerksWidget.new( menu, controller )
	SpecialtyPerks:setLeftRight( false, false, -25.5, 170.5 )
	SpecialtyPerks:setTopBottom( true, false, 358, 503 )
	SpecialtyPerks:linkToElementModel( self, nil, false, function ( model )
		SpecialtyPerks:setModel( model, controller )
	end )
	SpecialtyPerks:linkToElementModel( self, "specialty4", false, function ( model )
		SpecialtyPerks.perk1.perkPlus:setModel( model, controller )
	end )
	SpecialtyPerks:linkToElementModel( self, "specialty1", false, function ( model )
		SpecialtyPerks.perk1.perk:setModel( model, controller )
	end )
	SpecialtyPerks:linkToElementModel( self, "specialty5", false, function ( model )
		SpecialtyPerks.perk2.perkPlus:setModel( model, controller )
	end )
	SpecialtyPerks:linkToElementModel( self, "specialty2", false, function ( model )
		SpecialtyPerks.perk2.perk:setModel( model, controller )
	end )
	SpecialtyPerks:linkToElementModel( self, "specialty6", false, function ( model )
		SpecialtyPerks.perk3.perkPlus:setModel( model, controller )
	end )
	SpecialtyPerks:linkToElementModel( self, "specialty3", false, function ( model )
		SpecialtyPerks.perk3.perk:setModel( model, controller )
	end )
	self:addElement( SpecialtyPerks )
	self.SpecialtyPerks = SpecialtyPerks
	
	local LethalEquipment = CoD.LethalEquipmentWidget.new( menu, controller )
	LethalEquipment:setLeftRight( false, false, -170.5, -108.5 )
	LethalEquipment:setTopBottom( true, false, 358, 503 )
	LethalEquipment:linkToElementModel( self, "primarygadget", false, function ( model )
		LethalEquipment:setModel( model, controller )
	end )
	LethalEquipment:linkToElementModel( self, "primarygadgetattachment1", false, function ( model )
		LethalEquipment.Equipment2:setModel( model, controller )
	end )
	LethalEquipment:linkToElementModel( self, "primarygadget", false, function ( model )
		LethalEquipment.Equipment1:setModel( model, controller )
	end )
	self:addElement( LethalEquipment )
	self.LethalEquipment = LethalEquipment
	
	local TacticalEquipment = CoD.TacticalEquipmentWidget.new( menu, controller )
	TacticalEquipment:setLeftRight( false, false, -103.5, -41.5 )
	TacticalEquipment:setTopBottom( true, false, 358, 503 )
	TacticalEquipment:linkToElementModel( self, "secondarygadget", false, function ( model )
		TacticalEquipment:setModel( model, controller )
	end )
	TacticalEquipment:linkToElementModel( self, "secondarygadgetattachment1", false, function ( model )
		TacticalEquipment.Equipment2:setModel( model, controller )
	end )
	TacticalEquipment:linkToElementModel( self, "secondarygadget", false, function ( model )
		TacticalEquipment.Equipment1:setModel( model, controller )
	end )
	self:addElement( TacticalEquipment )
	self.TacticalEquipment = TacticalEquipment
	
	local TacticalRig = CoD.TacticalRigWidget.new( menu, controller )
	TacticalRig:setLeftRight( false, false, -25.5, 36.5 )
	TacticalRig:setTopBottom( true, false, 358, 503 )
	TacticalRig:setAlpha( 0 )
	TacticalRig:linkToElementModel( self, nil, false, function ( model )
		TacticalRig:setModel( model, controller )
	end )
	TacticalRig:linkToElementModel( self, "cybercom_tacrig2", false, function ( model )
		TacticalRig.TacRig2:setModel( model, controller )
	end )
	TacticalRig:linkToElementModel( self, "cybercom_tacrig1", false, function ( model )
		TacticalRig.TacRig1:setModel( model, controller )
	end )
	TacticalRig:linkToElementModel( self, "cybercom_tacrig1.name", true, function ( model )
		local cybercomTacrig1Name = Engine.GetModelValue( model )
		if cybercomTacrig1Name then
			TacticalRig.rig1Name:setText( Engine.Localize( cybercomTacrig1Name ) )
		end
	end )
	TacticalRig:linkToElementModel( self, "cybercom_tacrig2.name", true, function ( model )
		local cybercomTacrig2Name = Engine.GetModelValue( model )
		if cybercomTacrig2Name then
			TacticalRig.rig2Name:setText( Engine.Localize( cybercomTacrig2Name ) )
		end
	end )
	self:addElement( TacticalRig )
	self.TacticalRig = TacticalRig
	
	local Wildcards = CoD.WildcardWidgetNew.new( menu, controller )
	Wildcards:setLeftRight( false, false, -225, 225 )
	Wildcards:setTopBottom( true, false, 527, 685 )
	Wildcards:linkToElementModel( self, "bonuscard2", false, function ( model )
		Wildcards.wildcard2:setModel( model, controller )
	end )
	Wildcards:linkToElementModel( self, "bonuscard3", false, function ( model )
		Wildcards.wildcard3:setModel( model, controller )
	end )
	Wildcards:linkToElementModel( self, "bonuscard1", false, function ( model )
		Wildcards.wildcard1:setModel( model, controller )
	end )
	self:addElement( Wildcards )
	self.Wildcards = Wildcards
	
	local WildcardHeader = CoD.CategoryHeader.new( menu, controller )
	WildcardHeader:setLeftRight( false, false, -170.5, -99.5 )
	WildcardHeader:setTopBottom( true, false, 513, 532 )
	WildcardHeader:setRGB( 0.83, 0.83, 0.86 )
	WildcardHeader.header:setText( Engine.Localize( "MENU_WILDCARDS_CAPS" ) )
	WildcardHeader:mergeStateConditions( {
		{
			stateName = "BreadcrumbVisible",
			condition = function ( menu, element, event )
				return IsCACSpecificLoadoutSlotNew( element, controller, "bonuscard1" )
			end
		}
	} )
	self:addElement( WildcardHeader )
	self.WildcardHeader = WildcardHeader
	
	local SecondaryWeapon = CoD.SecondaryWeaponWidget.new( menu, controller )
	SecondaryWeapon:setLeftRight( false, false, -170.5, -41.5 )
	SecondaryWeapon:setTopBottom( true, false, 199, 344 )
	SecondaryWeapon:linkToElementModel( self, "secondary", false, function ( model )
		SecondaryWeapon:setModel( model, controller )
	end )
	self:addElement( SecondaryWeapon )
	self.SecondaryWeapon = SecondaryWeapon
	
	local SecondaryWeaponAttachment = CoD.SecondaryWeaponAttachmentsWidget.new( menu, controller )
	SecondaryWeaponAttachment:setLeftRight( false, false, -25.5, 170.5 )
	SecondaryWeaponAttachment:setTopBottom( true, false, 215, 344 )
	SecondaryWeaponAttachment:linkToElementModel( self, "secondaryattachment3", false, function ( model )
		SecondaryWeaponAttachment.attachment2:setModel( model, controller )
	end )
	SecondaryWeaponAttachment:linkToElementModel( self, "secondaryattachment2", false, function ( model )
		SecondaryWeaponAttachment.attachment1:setModel( model, controller )
	end )
	SecondaryWeaponAttachment:linkToElementModel( self, "secondaryattachment1", false, function ( model )
		SecondaryWeaponAttachment.optic:setModel( model, controller )
	end )
	self:addElement( SecondaryWeaponAttachment )
	self.SecondaryWeaponAttachment = SecondaryWeaponAttachment
	
	local PrimaryWeapon = CoD.PrimaryWeaponWidget.new( menu, controller )
	PrimaryWeapon:setLeftRight( false, false, -170.5, -41.5 )
	PrimaryWeapon:setTopBottom( true, false, 40, 185 )
	PrimaryWeapon:linkToElementModel( self, "primary", false, function ( model )
		PrimaryWeapon:setModel( model, controller )
	end )
	self:addElement( PrimaryWeapon )
	self.PrimaryWeapon = PrimaryWeapon
	
	local PrimaryWeaponAttachment = CoD.PrimaryWeaponAttachmentsWidget.new( menu, controller )
	PrimaryWeaponAttachment:setLeftRight( false, false, -25.5, 170.5 )
	PrimaryWeaponAttachment:setTopBottom( true, false, 56, 185 )
	PrimaryWeaponAttachment:linkToElementModel( self, "primaryattachment6", false, function ( model )
		PrimaryWeaponAttachment.attachment5:setModel( model, controller )
	end )
	PrimaryWeaponAttachment:linkToElementModel( self, "primaryattachment5", false, function ( model )
		PrimaryWeaponAttachment.attachment4:setModel( model, controller )
	end )
	PrimaryWeaponAttachment:linkToElementModel( self, "primaryattachment4", false, function ( model )
		PrimaryWeaponAttachment.attachment3:setModel( model, controller )
	end )
	PrimaryWeaponAttachment:linkToElementModel( self, "primaryattachment3", false, function ( model )
		PrimaryWeaponAttachment.attachment2:setModel( model, controller )
	end )
	PrimaryWeaponAttachment:linkToElementModel( self, "primaryattachment2", false, function ( model )
		PrimaryWeaponAttachment.attachment1:setModel( model, controller )
	end )
	PrimaryWeaponAttachment:linkToElementModel( self, "primaryattachment1", false, function ( model )
		PrimaryWeaponAttachment.optic:setModel( model, controller )
	end )
	self:addElement( PrimaryWeaponAttachment )
	self.PrimaryWeaponAttachment = PrimaryWeaponAttachment
	
	SpecialtyPerks.navigation = {
		left = TacticalEquipment,
		up = SecondaryWeaponAttachment,
		down = Wildcards
	}
	LethalEquipment.navigation = {
		up = SecondaryWeapon,
		right = TacticalEquipment,
		down = Wildcards
	}
	TacticalEquipment.navigation = {
		left = LethalEquipment,
		up = SecondaryWeapon,
		right = {
			SpecialtyPerks,
			TacticalRig
		},
		down = Wildcards
	}
	TacticalRig.navigation = {
		left = TacticalEquipment,
		up = SecondaryWeaponAttachment,
		down = Wildcards
	}
	Wildcards.navigation = {
		up = {
			LethalEquipment,
			TacticalEquipment,
			SpecialtyPerks,
			TacticalRig
		}
	}
	SecondaryWeapon.navigation = {
		up = PrimaryWeapon,
		right = SecondaryWeaponAttachment,
		down = {
			LethalEquipment,
			TacticalEquipment
		}
	}
	SecondaryWeaponAttachment.navigation = {
		left = SecondaryWeapon,
		up = PrimaryWeaponAttachment,
		down = {
			SpecialtyPerks,
			TacticalRig
		}
	}
	PrimaryWeapon.navigation = {
		right = PrimaryWeaponAttachment,
		down = SecondaryWeapon
	}
	PrimaryWeaponAttachment.navigation = {
		left = PrimaryWeapon,
		down = SecondaryWeaponAttachment
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				primarySecondarySpacer:completeAnimation()
				self.primarySecondarySpacer:setAlpha( 0 )
				self.clipFinished( primarySecondarySpacer, {} )
				SpecialtyPerks:completeAnimation()
				self.SpecialtyPerks:setLeftRight( false, false, -25.5, 170.5 )
				self.SpecialtyPerks:setTopBottom( true, false, 358, 503 )
				self.SpecialtyPerks:setAlpha( 1 )
				self.clipFinished( SpecialtyPerks, {} )
				LethalEquipment:completeAnimation()
				self.LethalEquipment:setLeftRight( false, false, -170.5, -108.5 )
				self.LethalEquipment:setTopBottom( true, false, 358, 503 )
				self.clipFinished( LethalEquipment, {} )
				TacticalEquipment:completeAnimation()
				self.TacticalEquipment:setLeftRight( false, false, -103.5, -41.5 )
				self.TacticalEquipment:setTopBottom( true, false, 358, 503 )
				self.clipFinished( TacticalEquipment, {} )
				TacticalRig:completeAnimation()
				self.TacticalRig:setLeftRight( false, false, -25.5, 36.5 )
				self.TacticalRig:setTopBottom( true, false, 358, 503 )
				self.TacticalRig:setAlpha( 0 )
				self.clipFinished( TacticalRig, {} )
				Wildcards:completeAnimation()
				self.Wildcards:setLeftRight( false, false, -225, 225 )
				self.Wildcards:setTopBottom( true, false, 527, 685 )
				self.clipFinished( Wildcards, {} )
				WildcardHeader:completeAnimation()
				self.WildcardHeader:setAlpha( 1 )
				self.clipFinished( WildcardHeader, {} )
			end,
			Wildcards = function ()
				self:setupElementClipCounter( 4 )
				secondaryEquipmentSpacer:completeAnimation()
				self.secondaryEquipmentSpacer:setAlpha( 0 )
				self.clipFinished( secondaryEquipmentSpacer, {} )
				primarySecondarySpacer:completeAnimation()
				self.primarySecondarySpacer:setAlpha( 0 )
				self.clipFinished( primarySecondarySpacer, {} )
				local WildcardsFrame2 = function ( Wildcards, event )
					if not event.interrupted then
						Wildcards:beginAnimation( "keyframe", 250, true, true, CoD.TweenType.Back )
					end
					Wildcards:setLeftRight( false, false, -116, 116 )
					Wildcards:setTopBottom( true, false, 470.5, 628.5 )
					if event.interrupted then
						self.clipFinished( Wildcards, event )
					else
						Wildcards:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Wildcards:completeAnimation()
				self.Wildcards:setLeftRight( false, false, -225, 225 )
				self.Wildcards:setTopBottom( true, false, 527, 685 )
				WildcardsFrame2( Wildcards, {} )
				local WildcardHeaderFrame2 = function ( WildcardHeader, event )
					if not event.interrupted then
						WildcardHeader:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					WildcardHeader:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( WildcardHeader, event )
					else
						WildcardHeader:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				WildcardHeader:completeAnimation()
				self.WildcardHeader:setAlpha( 1 )
				WildcardHeaderFrame2( WildcardHeader, {} )
			end,
			WildcardDefault = function ()
				self:setupElementClipCounter( 1 )
				Wildcards:completeAnimation()
				self.Wildcards:setAlpha( 1 )
				self.clipFinished( Wildcards, {} )
			end
		},
		Wildcards = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				primarySecondarySpacer:completeAnimation()
				self.primarySecondarySpacer:setAlpha( 0 )
				self.clipFinished( primarySecondarySpacer, {} )
				SpecialtyPerks:completeAnimation()
				self.SpecialtyPerks:setLeftRight( false, false, -25.5, 170.5 )
				self.SpecialtyPerks:setTopBottom( true, false, 358, 420.5 )
				self.clipFinished( SpecialtyPerks, {} )
				LethalEquipment:completeAnimation()
				self.LethalEquipment:setLeftRight( false, false, -170.5, -108.5 )
				self.LethalEquipment:setTopBottom( true, false, 358, 420.5 )
				self.clipFinished( LethalEquipment, {} )
				TacticalEquipment:completeAnimation()
				self.TacticalEquipment:setLeftRight( false, false, -103.5, -41.5 )
				self.TacticalEquipment:setTopBottom( true, false, 358, 420.5 )
				self.clipFinished( TacticalEquipment, {} )
				TacticalRig:completeAnimation()
				self.TacticalRig:setLeftRight( false, false, -25.5, 36.5 )
				self.TacticalRig:setTopBottom( true, false, 358, 420.5 )
				self.clipFinished( TacticalRig, {} )
				Wildcards:completeAnimation()
				self.Wildcards:setLeftRight( false, false, -225, 225 )
				self.Wildcards:setTopBottom( true, false, 470.5, 628.5 )
				self.clipFinished( Wildcards, {} )
				WildcardHeader:completeAnimation()
				self.WildcardHeader:setAlpha( 0 )
				self.clipFinished( WildcardHeader, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 6 )
				SpecialtyPerks:completeAnimation()
				self.SpecialtyPerks:setLeftRight( false, false, -25.5, 170.5 )
				self.SpecialtyPerks:setTopBottom( true, false, 358, 420.5 )
				self.clipFinished( SpecialtyPerks, {} )
				LethalEquipment:completeAnimation()
				self.LethalEquipment:setLeftRight( false, false, -170.5, -108.5 )
				self.LethalEquipment:setTopBottom( true, false, 358, 420.5 )
				self.clipFinished( LethalEquipment, {} )
				TacticalEquipment:completeAnimation()
				self.TacticalEquipment:setLeftRight( false, false, -103.5, -41.5 )
				self.TacticalEquipment:setTopBottom( true, false, 358, 420.5 )
				self.clipFinished( TacticalEquipment, {} )
				TacticalRig:completeAnimation()
				self.TacticalRig:setLeftRight( false, false, -25.5, 36.5 )
				self.TacticalRig:setTopBottom( true, false, 358, 420.5 )
				self.clipFinished( TacticalRig, {} )
				local WildcardsFrame2 = function ( Wildcards, event )
					if not event.interrupted then
						Wildcards:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					Wildcards:setLeftRight( false, false, -225, 225 )
					Wildcards:setTopBottom( true, false, 527, 685 )
					if event.interrupted then
						self.clipFinished( Wildcards, event )
					else
						Wildcards:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Wildcards:completeAnimation()
				self.Wildcards:setLeftRight( false, false, -225, 225 )
				self.Wildcards:setTopBottom( true, false, 470.5, 628.5 )
				WildcardsFrame2( Wildcards, {} )
				local f42_local1 = function ( f44_arg0, f44_arg1 )
					if not f44_arg1.interrupted then
						f44_arg0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
					end
					f44_arg0:setAlpha( 1 )
					if f44_arg1.interrupted then
						self.clipFinished( f44_arg0, f44_arg1 )
					else
						f44_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				WildcardHeader:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				WildcardHeader:setAlpha( 0 )
				WildcardHeader:registerEventHandler( "transition_complete_keyframe", f42_local1 )
			end,
			Campaign = function ()
				self:setupElementClipCounter( 7 )
				primarySecondarySpacer:completeAnimation()
				self.primarySecondarySpacer:setAlpha( 0 )
				self.clipFinished( primarySecondarySpacer, {} )
				SpecialtyPerks:completeAnimation()
				self.SpecialtyPerks:setLeftRight( false, false, -25.5, 170.5 )
				self.SpecialtyPerks:setTopBottom( true, false, 358, 420.5 )
				self.clipFinished( SpecialtyPerks, {} )
				LethalEquipment:completeAnimation()
				self.LethalEquipment:setLeftRight( false, false, -170.5, -108.5 )
				self.LethalEquipment:setTopBottom( true, false, 358, 420.5 )
				self.clipFinished( LethalEquipment, {} )
				TacticalEquipment:completeAnimation()
				self.TacticalEquipment:setLeftRight( false, false, -103.5, -41.5 )
				self.TacticalEquipment:setTopBottom( true, false, 358, 420.5 )
				self.clipFinished( TacticalEquipment, {} )
				TacticalRig:completeAnimation()
				self.TacticalRig:setLeftRight( false, false, -25.5, 36.5 )
				self.TacticalRig:setTopBottom( true, false, 358, 420.5 )
				self.clipFinished( TacticalRig, {} )
				local WildcardsFrame2 = function ( Wildcards, event )
					if not event.interrupted then
						Wildcards:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					Wildcards:setLeftRight( false, false, -225, 225 )
					Wildcards:setTopBottom( true, false, 527, 685 )
					if event.interrupted then
						self.clipFinished( Wildcards, event )
					else
						Wildcards:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Wildcards:completeAnimation()
				self.Wildcards:setLeftRight( false, false, -225, 225 )
				self.Wildcards:setTopBottom( true, false, 470.5, 628.5 )
				WildcardsFrame2( Wildcards, {} )
				local f45_local1 = function ( f47_arg0, f47_arg1 )
					if not f47_arg1.interrupted then
						f47_arg0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
					end
					f47_arg0:setAlpha( 1 )
					if f47_arg1.interrupted then
						self.clipFinished( f47_arg0, f47_arg1 )
					else
						f47_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				WildcardHeader:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				WildcardHeader:setAlpha( 0 )
				WildcardHeader:registerEventHandler( "transition_complete_keyframe", f45_local1 )
			end
		},
		Campaign = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				SpecialtyPerks:completeAnimation()
				self.SpecialtyPerks:setAlpha( 0 )
				self.clipFinished( SpecialtyPerks, {} )
				LethalEquipment:completeAnimation()
				self.LethalEquipment:setLeftRight( false, false, -170.5, -108.5 )
				self.LethalEquipment:setTopBottom( true, false, 358, 503 )
				self.clipFinished( LethalEquipment, {} )
				TacticalEquipment:completeAnimation()
				self.TacticalEquipment:setLeftRight( false, false, -103.5, -41.5 )
				self.TacticalEquipment:setTopBottom( true, false, 358, 503 )
				self.clipFinished( TacticalEquipment, {} )
				TacticalRig:completeAnimation()
				self.TacticalRig:setLeftRight( false, false, -25.5, 36.5 )
				self.TacticalRig:setTopBottom( true, false, 358, 503 )
				self.TacticalRig:setAlpha( 1 )
				self.clipFinished( TacticalRig, {} )
				Wildcards:completeAnimation()
				self.Wildcards:setLeftRight( false, false, -225, 225 )
				self.Wildcards:setTopBottom( true, false, 527, 685 )
				self.clipFinished( Wildcards, {} )
				WildcardHeader:completeAnimation()
				self.WildcardHeader:setAlpha( 1 )
				self.clipFinished( WildcardHeader, {} )
			end,
			Wildcards = function ()
				self:setupElementClipCounter( 2 )
				local WildcardsFrame2 = function ( Wildcards, event )
					if not event.interrupted then
						Wildcards:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					Wildcards:setLeftRight( false, false, -116, 116 )
					Wildcards:setTopBottom( true, false, 470.5, 628.5 )
					if event.interrupted then
						self.clipFinished( Wildcards, event )
					else
						Wildcards:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Wildcards:completeAnimation()
				self.Wildcards:setLeftRight( false, false, -225, 225 )
				self.Wildcards:setTopBottom( true, false, 527, 685 )
				WildcardsFrame2( Wildcards, {} )
				local WildcardHeaderFrame2 = function ( WildcardHeader, event )
					if not event.interrupted then
						WildcardHeader:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					WildcardHeader:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( WildcardHeader, event )
					else
						WildcardHeader:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				WildcardHeader:completeAnimation()
				self.WildcardHeader:setAlpha( 1 )
				WildcardHeaderFrame2( WildcardHeader, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Wildcards",
			condition = function ( menu, element, event )
				return IsElementInState( element, "Wildcards" )
			end
		},
		{
			stateName = "Campaign",
			condition = function ( menu, element, event )
				return IsCampaign()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	SpecialtyPerks.id = "SpecialtyPerks"
	LethalEquipment.id = "LethalEquipment"
	TacticalEquipment.id = "TacticalEquipment"
	TacticalRig.id = "TacticalRig"
	Wildcards.id = "Wildcards"
	SecondaryWeapon.id = "SecondaryWeapon"
	SecondaryWeaponAttachment.id = "SecondaryWeaponAttachment"
	PrimaryWeapon.id = "PrimaryWeapon"
	PrimaryWeaponAttachment.id = "PrimaryWeaponAttachment"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.PrimaryWeaponAttachment:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.SpecialtyPerks:close()
		element.LethalEquipment:close()
		element.TacticalEquipment:close()
		element.TacticalRig:close()
		element.Wildcards:close()
		element.WildcardHeader:close()
		element.SecondaryWeapon:close()
		element.SecondaryWeaponAttachment:close()
		element.PrimaryWeapon:close()
		element.PrimaryWeaponAttachment:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

