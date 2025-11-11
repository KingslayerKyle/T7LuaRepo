require( "ui.uieditor.widgets.CAC.cac_WpnLvl" )
require( "ui.uieditor.widgets.Craft.WeaponBuildKits.WeaponBuildKitsVariantAttachments" )

CoD.WeaponBuildKitsVariantAttachmentList = InheritFrom( LUI.UIElement )
CoD.WeaponBuildKitsVariantAttachmentList.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WeaponBuildKitsVariantAttachmentList )
	self.id = "WeaponBuildKitsVariantAttachmentList"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 1080 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local variantAttachments = CoD.WeaponBuildKitsVariantAttachments.new( menu, controller )
	variantAttachments:setLeftRight( 0.5, 0.5, -850, 361 )
	variantAttachments:setTopBottom( 1, 1, -273, -123 )
	variantAttachments:linkToElementModel( self, nil, false, function ( model )
		variantAttachments:setModel( model, controller )
	end )
	self:addElement( variantAttachments )
	self.variantAttachments = variantAttachments
	
	local cacWpnLvl = CoD.cac_WpnLvl.new( menu, controller )
	cacWpnLvl:setLeftRight( 0, 0, 1160, 1782 )
	cacWpnLvl:setTopBottom( 1, 1, -196, -136 )
	cacWpnLvl.levelLabel.Label1:setText( Engine.Localize( "MPUI_WEAPON_LEVEL_CAPS" ) )
	cacWpnLvl.levelLabel.Label1:setTTF( "fonts/escom.ttf" )
	cacWpnLvl:linkToElementModel( self, nil, false, function ( model )
		cacWpnLvl:setModel( model, controller )
	end )
	cacWpnLvl:linkToElementModel( self, "weaponIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			cacWpnLvl.currentLevelBacking:setText( Engine.Localize( GetCurrentWeaponLevel( controller, modelValue ) ) )
		end
	end )
	cacWpnLvl:linkToElementModel( self, "weaponIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			cacWpnLvl.currentLevel:setText( Engine.Localize( GetCurrentWeaponLevel( controller, modelValue ) ) )
		end
	end )
	cacWpnLvl:linkToElementModel( self, "weaponIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			cacWpnLvl.cacWpnLvlMeter0.Meter:setShaderVector( 0, GetCurrentWeaponXP( controller, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) ) )
		end
	end )
	cacWpnLvl:linkToElementModel( self, "weaponIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			cacWpnLvl.cacWpnLvlMeter0.Meter2XP:setShaderVector( 0, GetCurrentWeaponXP( controller, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) ) )
		end
	end )
	cacWpnLvl:linkToElementModel( self, "weaponIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			cacWpnLvl.nextLevel:setText( Engine.Localize( GetNextWeaponLevel( controller, modelValue ) ) )
		end
	end )
	self:addElement( cacWpnLvl )
	self.cacWpnLvl = cacWpnLvl
	
	variantAttachments.id = "variantAttachments"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.variantAttachments:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.variantAttachments:close()
		self.cacWpnLvl:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

