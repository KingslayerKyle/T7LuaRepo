CoD.bleedout_mainring = InheritFrom( LUI.UIElement )
CoD.bleedout_mainring.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.bleedout_mainring )
	self.id = "bleedout_mainring"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 144 )
	self:setTopBottom( true, false, 0, 144 )
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( false, false, -72, 72 )
	Image1:setTopBottom( false, false, -72, 72 )
	Image1:setRGB( 1, 1, 1 )
	Image1:setAlpha( 0.5 )
	Image1:setImage( RegisterImage( "uie_t7_hud_cp_bleeding_out_mainring" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
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

