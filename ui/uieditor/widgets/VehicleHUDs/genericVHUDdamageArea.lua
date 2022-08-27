-- 9479378bf10f204d02780a06b613cc00
-- This hash is used for caching, delete to decompile the file again

CoD.genericVHUDdamageArea = InheritFrom( LUI.UIElement )
CoD.genericVHUDdamageArea.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.genericVHUDdamageArea )
	self.id = "genericVHUDdamageArea"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 100 )
	self:setTopBottom( true, false, 0, 100 )
	
	local lineBack = LUI.UIImage.new()
	lineBack:setLeftRight( true, true, 0, 0 )
	lineBack:setTopBottom( true, true, 0, 0 )
	lineBack:setRGB( 0.6, 0.82, 0.91 )
	lineBack:setAlpha( 0.3 )
	lineBack:setZoom( -20 )
	lineBack:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_raps_damageiconlinergb" ) )
	lineBack:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( lineBack )
	self.lineBack = lineBack
	
	local fill = LUI.UIImage.new()
	fill:setLeftRight( true, true, 0, 0 )
	fill:setTopBottom( true, true, 0, 0 )
	fill:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_raps_damageiconred" ) )
	fill:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
	fill:setShaderVector( 0, 0, 1, 0, 0 )
	fill:setShaderVector( 1, 0, 0, 0, 0 )
	fill:setShaderVector( 3, 0, 0, 0, 0 )
	fill:linkToElementModel( self, "damage", true, function ( model )
		local damage = Engine.GetModelValue( model )
		if damage then
			fill:setShaderVector( 2, SubtractVectorComponentFrom( 1, 1, SetVectorComponent( 2, 1, CoD.GetVectorComponentFromString( damage, 1 ), CoD.GetVectorComponentFromString( damage, 2 ), CoD.GetVectorComponentFromString( damage, 3 ), CoD.GetVectorComponentFromString( damage, 4 ) ) ) )
		end
	end )
	self:addElement( fill )
	self.fill = fill
	
	local lineFront = LUI.UIImage.new()
	lineFront:setLeftRight( true, true, 0, 0 )
	lineFront:setTopBottom( true, true, 0, 0 )
	lineFront:setRGB( 0.6, 0.82, 0.91 )
	lineFront:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_raps_damageiconlinergb" ) )
	lineFront:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( lineFront )
	self.lineFront = lineFront
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.fill:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

