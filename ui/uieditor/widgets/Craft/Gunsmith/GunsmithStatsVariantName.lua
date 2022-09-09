-- 263d7c529d84f0fc4ae97fe034750d05
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithStatsBranding" )

CoD.GunsmithStatsVariantName = InheritFrom( LUI.UIElement )
CoD.GunsmithStatsVariantName.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.GunsmithStatsVariantName )
	self.id = "GunsmithStatsVariantName"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 147 )
	self:setTopBottom( true, false, 0, 76 )
	self.anyChildUsesUpdateState = true
	
	local variantNameBg = LUI.UIImage.new()
	variantNameBg:setLeftRight( true, true, 0, 0 )
	variantNameBg:setTopBottom( true, true, 0, 0 )
	variantNameBg:setRGB( 0, 0, 0 )
	variantNameBg:setAlpha( 0.6 )
	self:addElement( variantNameBg )
	self.variantNameBg = variantNameBg
	
	local variantName = LUI.UIText.new()
	variantName:setLeftRight( false, true, -264, 0 )
	variantName:setTopBottom( true, false, 32, 56 )
	variantName:setTTF( "fonts/default.ttf" )
	variantName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	variantName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	variantName:linkToElementModel( self, "variantName", true, function ( model )
		local _variantName = Engine.GetModelValue( model )
		if _variantName then
			variantName:setText( _variantName )
		end
	end )
	self:addElement( variantName )
	self.variantName = variantName
	
	local weaponName = LUI.UIText.new()
	weaponName:setLeftRight( false, true, -147, 0 )
	weaponName:setTopBottom( true, false, 57, 74 )
	weaponName:setRGB( ColorSet.GroupName.r, ColorSet.GroupName.g, ColorSet.GroupName.b )
	weaponName:setTTF( "fonts/default.ttf" )
	weaponName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	weaponName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	weaponName:linkToElementModel( self, "weaponIndex", true, function ( model )
		local weaponIndex = Engine.GetModelValue( model )
		if weaponIndex then
			weaponName:setText( Engine.Localize( GetGunsmithItemNameByIndex( weaponIndex ) ) )
		end
	end )
	self:addElement( weaponName )
	self.weaponName = weaponName
	
	local statsBranding = CoD.GunsmithStatsBranding.new( menu, controller )
	statsBranding:setLeftRight( false, true, -147, 0 )
	statsBranding:setTopBottom( true, false, 0, 32 )
	statsBranding:mergeStateConditions( {
		{
			stateName = "Campaign",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualToEnum( element, controller, "GunsmithSnapshot.SessionMode", Enum.eModes.MODE_CAMPAIGN )
			end
		}
	} )
	statsBranding:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "GunsmithSnapshot.SessionMode" ), function ( model )
		menu:updateElementState( statsBranding, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "GunsmithSnapshot.SessionMode"
		} )
	end )
	self:addElement( statsBranding )
	self.statsBranding = statsBranding
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.statsBranding:close()
		element.variantName:close()
		element.weaponName:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
