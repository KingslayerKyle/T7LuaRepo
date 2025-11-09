CoD.TacticalModeEnemyInfoWidget = InheritFrom( LUI.UIElement )
CoD.TacticalModeEnemyInfoWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.TacticalModeEnemyInfoWidget )
	self.id = "TacticalModeEnemyInfoWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 118 )
	self:setTopBottom( true, false, 0, 18 )
	
	local damageBackground = LUI.UIImage.new()
	damageBackground:setLeftRight( true, true, 3, -3 )
	damageBackground:setTopBottom( true, true, 3, -3 )
	damageBackground:setRGB( 0.4, 0.4, 0.4 )
	damageBackground:setAlpha( 0.6 )
	damageBackground:setImage( RegisterImage( "uie_t7_cp_hud_tacmode_health2row" ) )
	damageBackground:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( damageBackground )
	self.damageBackground = damageBackground
	
	local damageForeground = LUI.UIImage.new()
	damageForeground:setLeftRight( true, true, 3, -3 )
	damageForeground:setTopBottom( true, true, 3, -3 )
	damageForeground:setRGB( 1, 1, 1 )
	damageForeground:setAlpha( 0.9 )
	damageForeground:setImage( RegisterImage( "uie_t7_cp_hud_tacmode_health2row" ) )
	damageForeground:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	damageForeground:setShaderVector( 1, 0, 19, 0, 0 )
	damageForeground:setShaderVector( 2, 1, 0, 0, 0 )
	damageForeground:setShaderVector( 3, 0, 0, 0, 0 )
	damageForeground:linkToElementModel( self, "health", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			damageForeground:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	self:addElement( damageForeground )
	self.damageForeground = damageForeground
	
	self.close = function ( self )
		self.damageForeground:close()
		CoD.TacticalModeEnemyInfoWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

