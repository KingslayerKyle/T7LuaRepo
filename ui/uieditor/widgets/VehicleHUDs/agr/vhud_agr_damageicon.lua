-- 2acf6c6ec23f3e9c206c5ec7416175dc
-- This hash is used for caching, delete to decompile the file again

CoD.vhud_agr_damageicon = InheritFrom( LUI.UIElement )
CoD.vhud_agr_damageicon.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.vhud_agr_damageicon )
	self.id = "vhud_agr_damageicon"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 95 )
	self:setTopBottom( true, false, 0, 79 )
	
	local Line0 = LUI.UIImage.new()
	Line0:setLeftRight( false, false, -47.5, 47.86 )
	Line0:setTopBottom( false, false, -39.5, 39.97 )
	Line0:setRGB( 0.49, 1, 0.74 )
	Line0:setAlpha( 0.2 )
	Line0:setZoom( -50 )
	Line0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_agr_damageiconlinergb" ) )
	Line0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Line0 )
	self.Line0 = Line0
	
	local Red = LUI.UIImage.new()
	Red:setLeftRight( false, false, -47.5, 47.86 )
	Red:setTopBottom( false, false, -39.5, 39.97 )
	Red:setAlpha( 0.8 )
	Red:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_agr_damageiconred" ) )
	Red:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	Red:setShaderVector( 1, 0, 0, 0, 0 )
	Red:setShaderVector( 2, 1, 0, 0, 0 )
	Red:setShaderVector( 3, 0, 0, 0, 0 )
	Red:linkToElementModel( self, "damage", true, function ( model )
		local damage = Engine.GetModelValue( model )
		if damage then
			Red:setShaderVector( 0, CoD.GetVectorComponentFromString( damage, 1 ), CoD.GetVectorComponentFromString( damage, 2 ), CoD.GetVectorComponentFromString( damage, 3 ), CoD.GetVectorComponentFromString( damage, 4 ) )
		end
	end )
	self:addElement( Red )
	self.Red = Red
	
	local Line = LUI.UIImage.new()
	Line:setLeftRight( false, false, -47.5, 47.86 )
	Line:setTopBottom( false, false, -39.5, 39.97 )
	Line:setRGB( 0.49, 1, 0.74 )
	Line:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_agr_damageiconlinergb" ) )
	Line:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Line )
	self.Line = Line
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Red:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

