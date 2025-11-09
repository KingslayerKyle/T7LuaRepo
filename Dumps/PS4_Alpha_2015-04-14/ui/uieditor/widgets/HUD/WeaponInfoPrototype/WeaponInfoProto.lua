require( "ui.uieditor.widgets.HUD.WeaponInfoPrototype.EquipmentInfoProto" )
require( "ui.uieditor.widgets.HUD.WeaponInfoPrototype.ClipInfoProto" )
require( "ui.uieditor.widgets.HUD.WeaponInfoPrototype.HeroWeaponContainerProto" )
require( "ui.uieditor.widgets.HUD.WeaponInfoPrototype.FireRateProto" )

local ClassSelected = function ( self, event )
	if self.currentWeapon ~= event.weaponDisplayName or self.currentAttachment1 ~= event.attachment1DisplayName or self.currentAttachment2 ~= event.attachment2DisplayName or self.currentAttachment3 ~= event.attachment3DisplayName or self.currentAttachment4 ~= event.attachment4DisplayName or self.currentAttachment5 ~= event.attachment5DisplayName or self.currentAttachment6 ~= event.attachment6DisplayName then
		self.FireRate.AttachmentInfo:UpdateAttachments( event )
		self.FireRate:UpdateAttachmentInfo( event )
		self.currentWeapon = event.weaponDisplayName
		self.currentAttachment1 = event.attachment1DisplayName
		self.currentAttachment2 = event.attachment2DisplayName
		self.currentAttachment3 = event.attachment3DisplayName
		self.currentAttachment4 = event.attachment4DisplayName
		self.currentAttachment5 = event.attachment5DisplayName
		self.currentAttachment6 = event.attachment6DisplayName
	end
	if event.attachment1DisplayName ~= nil then
		self.FireRate:setState( "DefaultState" )
	else
		self.FireRate:setState( "NoAttachments" )
	end
end

local PostLoadFunc = function ( self )
	self:registerEventHandler( "hud_update_weapon_select", ClassSelected )
end

CoD.WeaponInfoProto = InheritFrom( LUI.UIElement )
CoD.WeaponInfoProto.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WeaponInfoProto )
	self.id = "WeaponInfoProto"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 398 )
	self:setTopBottom( true, false, 0, 124 )
	self.anyChildUsesUpdateState = true
	
	local EquipmentInfo = CoD.EquipmentInfoProto.new( menu, controller )
	EquipmentInfo:setLeftRight( false, true, -239.75, -89.75 )
	EquipmentInfo:setTopBottom( false, true, -188.74, -88.74 )
	EquipmentInfo:setRGB( 1, 1, 1 )
	self:addElement( EquipmentInfo )
	self.EquipmentInfo = EquipmentInfo
	
	local Clip = CoD.ClipInfoProto.new( menu, controller )
	Clip:setLeftRight( false, false, -9.88, 122 )
	Clip:setTopBottom( false, true, -143.64, -47.64 )
	Clip:setRGB( 1, 1, 1 )
	Clip:mergeStateConditions( {
		{
			stateName = "HeroWeapon",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	Clip:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.weapon" ), function ( model )
		menu:updateElementState( Clip, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.weapon"
		} )
	end )
	Clip:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.clipMaxAmmo" ), function ( model )
		menu:updateElementState( Clip, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.clipMaxAmmo"
		} )
	end )
	self:addElement( Clip )
	self.Clip = Clip
	
	local heroWeaponContainer = CoD.HeroWeaponContainerProto.new( menu, controller )
	heroWeaponContainer:setLeftRight( false, true, -90.75, -15.49 )
	heroWeaponContainer:setTopBottom( false, true, -112.5, -10.5 )
	heroWeaponContainer:setRGB( 1, 1, 1 )
	self:addElement( heroWeaponContainer )
	self.heroWeaponContainer = heroWeaponContainer
	
	local FireRate = CoD.FireRateProto.new( menu, controller )
	FireRate:setLeftRight( false, true, -297.5, -93.5 )
	FireRate:setTopBottom( false, true, -46, -28 )
	FireRate:setRGB( 1, 1, 1 )
	self:addElement( FireRate )
	self.FireRate = FireRate
	
	self.close = function ( self )
		self.EquipmentInfo:close()
		self.Clip:close()
		self.heroWeaponContainer:close()
		self.FireRate:close()
		CoD.WeaponInfoProto.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

