CoD.weakpoint_NewRedLineV = InheritFrom( LUI.UIElement )
CoD.weakpoint_NewRedLineV.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.weakpoint_NewRedLineV )
	self.id = "weakpoint_NewRedLineV"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 8 )
	self:setTopBottom( true, false, 0, 200 )
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( false, false, -4, 4 )
	Image1:setTopBottom( false, false, -839.33, 839.33 )
	Image1:setImage( RegisterImage( "uie_t7_cp_hud_weakpoint_newreddash" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	Image1:setShaderVector( 0, 1, 250, 0, 0 )
	Image1:setShaderVector( 1, 0, -7, 0, 0 )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	self:mergeStateConditions( {
		{
			stateName = "Close",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "status", Enum.WeakpointWidgetStates.WEAKPOINT_STATE_CLOSE )
			end
		},
		{
			stateName = "Medium",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "status", Enum.WeakpointWidgetStates.WEAKPOINT_STATE_MEDIUM )
			end
		},
		{
			stateName = "Far",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "status", Enum.WeakpointWidgetStates.WEAKPOINT_STATE_FAR )
			end
		},
		{
			stateName = "Obscured",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "status", Enum.WeakpointWidgetStates.WEAKPOINT_STATE_OBSCURED )
			end
		}
	} )
	self:linkToElementModel( self, "status", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "status"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

