CoD.bleedout_cross = InheritFrom( LUI.UIElement )
CoD.bleedout_cross.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.bleedout_cross )
	self.id = "bleedout_cross"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 144 )
	self:setTopBottom( true, false, 0, 144 )
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( false, false, -72, 72 )
	Image1:setTopBottom( false, false, -72, 72 )
	Image1:setRGB( 0.73, 0.89, 0.93 )
	Image1:setZoom( -10 )
	Image1:setImage( RegisterImage( "uie_t7_hud_cp_bleeding_out_crossrgb" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( false, false, -72, 72 )
	Image0:setTopBottom( false, false, -72, 72 )
	Image0:setRGB( 0.73, 0.89, 0.93 )
	Image0:setImage( RegisterImage( "uie_t7_hud_cp_bleeding_out_cross" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	self:mergeStateConditions( {
		{
			stateName = "BleedingOut",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "bleedingOut" ) and IsSelfModelValueGreaterThan( element, controller, "clockPercent", 0.3 )
			end
		},
		{
			stateName = "BleedingOut_Low",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "bleedingOut" )
			end
		},
		{
			stateName = "Reviving",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "beingRevived" )
			end
		}
	} )
	self:linkToElementModel( self, "bleedingOut", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "bleedingOut"
		} )
	end )
	self:linkToElementModel( self, "clockPercent", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "clockPercent"
		} )
	end )
	self:linkToElementModel( self, "beingRevived", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "beingRevived"
		} )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

