require( "ui.uieditor.widgets.Craft.WeaponBuildKits.WeaponBuildKitsVariantAttachments" )
require( "ui.uieditor.widgets.CAC.cac_WpnLvl" )

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
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local variantAttachments = CoD.WeaponBuildKitsVariantAttachments.new( menu, controller )
	variantAttachments:setLeftRight( false, false, -566.47, 240.87 )
	variantAttachments:setTopBottom( false, true, -181.87, -81.87 )
	variantAttachments:linkToElementModel( self, nil, false, function ( model )
		variantAttachments:setModel( model, controller )
	end )
	self:addElement( variantAttachments )
	self.variantAttachments = variantAttachments
	
	local cacWpnLvl = CoD.cac_WpnLvl.new( menu, controller )
	cacWpnLvl:setLeftRight( true, false, 772.87, 1187.87 )
	cacWpnLvl:setTopBottom( false, true, -131, -91 )
	cacWpnLvl.levelLabel.Label1:setText( Engine.Localize( "MPUI_WEAPON_LEVEL_CAPS" ) )
	cacWpnLvl.levelLabel.Label1:setTTF( "fonts/escom.ttf" )
	cacWpnLvl:linkToElementModel( self, nil, false, function ( model )
		cacWpnLvl:setModel( model, controller )
	end )
	cacWpnLvl:linkToElementModel( self, "weaponIndex", true, function ( model )
		local weaponIndex = Engine.GetModelValue( model )
		if weaponIndex then
			cacWpnLvl.currentLevelBacking:setText( Engine.Localize( GetCurrentWeaponLevel( controller, weaponIndex ) ) )
		end
	end )
	cacWpnLvl:linkToElementModel( self, "weaponIndex", true, function ( model )
		local weaponIndex = Engine.GetModelValue( model )
		if weaponIndex then
			cacWpnLvl.currentLevel:setText( Engine.Localize( GetCurrentWeaponLevel( controller, weaponIndex ) ) )
		end
	end )
	cacWpnLvl:linkToElementModel( self, "weaponIndex", true, function ( model )
		local weaponIndex = Engine.GetModelValue( model )
		if weaponIndex then
			cacWpnLvl.cacWpnLvlMeter0.Meter:setShaderVector( 0, GetCurrentWeaponXP( controller, CoD.GetVectorComponentFromString( weaponIndex, 1 ), CoD.GetVectorComponentFromString( weaponIndex, 2 ), CoD.GetVectorComponentFromString( weaponIndex, 3 ), CoD.GetVectorComponentFromString( weaponIndex, 4 ) ) )
		end
	end )
	cacWpnLvl:linkToElementModel( self, "weaponIndex", true, function ( model )
		local weaponIndex = Engine.GetModelValue( model )
		if weaponIndex then
			cacWpnLvl.cacWpnLvlMeter0.Meter2XP:setShaderVector( 0, GetCurrentWeaponXP( controller, CoD.GetVectorComponentFromString( weaponIndex, 1 ), CoD.GetVectorComponentFromString( weaponIndex, 2 ), CoD.GetVectorComponentFromString( weaponIndex, 3 ), CoD.GetVectorComponentFromString( weaponIndex, 4 ) ) )
		end
	end )
	cacWpnLvl:linkToElementModel( self, "weaponIndex", true, function ( model )
		local weaponIndex = Engine.GetModelValue( model )
		if weaponIndex then
			cacWpnLvl.nextLevel:setText( Engine.Localize( GetNextWeaponLevel( controller, weaponIndex ) ) )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.variantAttachments:close()
		element.cacWpnLvl:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

