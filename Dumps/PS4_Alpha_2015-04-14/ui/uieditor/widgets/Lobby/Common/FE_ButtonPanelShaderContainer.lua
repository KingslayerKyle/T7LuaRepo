require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShader" )

CoD.FE_ButtonPanelShaderContainer = InheritFrom( LUI.UIElement )
CoD.FE_ButtonPanelShaderContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_ButtonPanelShaderContainer )
	self.id = "FE_ButtonPanelShaderContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 280 )
	self:setTopBottom( true, false, 0, 28 )
	
	local FEButtonPanel = CoD.FE_ButtonPanelShader.new( menu, controller )
	FEButtonPanel:setLeftRight( true, true, 0, 0 )
	FEButtonPanel:setTopBottom( true, true, 0, 0 )
	FEButtonPanel:setRGB( 1, 1, 1 )
	FEButtonPanel:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2" ) )
	FEButtonPanel:setShaderVector( 0, 24.98, 25, 0, 0 )
	self:addElement( FEButtonPanel )
	self.FEButtonPanel = FEButtonPanel
	
	self:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsDisabled( element, controller )
			end
		}
	} )
	self:linkToElementModel( self, "disabled", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		} )
	end )
	self.close = function ( self )
		self.FEButtonPanel:close()
		CoD.FE_ButtonPanelShaderContainer.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

