CoD.weakpoint_NewRedLine = InheritFrom( LUI.UIElement )
CoD.weakpoint_NewRedLine.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.weakpoint_NewRedLine )
	self.id = "weakpoint_NewRedLine"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 36 )
	self:setTopBottom( true, false, 0, 16 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( false, false, -18, 18 )
	Image0:setTopBottom( false, false, -8, 8 )
	Image0:setImage( RegisterImage( "uie_t7_cp_hud_weakpoint_newredline" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image00 = LUI.UIImage.new()
	Image00:setLeftRight( false, false, -18, 18 )
	Image00:setTopBottom( false, false, -8, 8 )
	Image00:setZoom( 50 )
	Image00:setImage( RegisterImage( "uie_t7_cp_hud_weakpoint_newredlineblur" ) )
	Image00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image00 )
	self.Image00 = Image00
	
	self:mergeStateConditions( {
		{
			stateName = "Close",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "status", Enum.WeakpointWidgetStates.WEAKPOINT_STATE_CLOSE )
			end
		},
		{
			stateName = "Medium",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "status", Enum.WeakpointWidgetStates.WEAKPOINT_STATE_MEDIUM )
			end
		},
		{
			stateName = "Far",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "status", Enum.WeakpointWidgetStates.WEAKPOINT_STATE_FAR )
			end
		},
		{
			stateName = "Obscured",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "status", Enum.WeakpointWidgetStates.WEAKPOINT_STATE_OBSCURED )
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

