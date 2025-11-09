require( "ui.uieditor.widgets.Lobby.Common.FE_ListSubHeaderPanelShader" )

CoD.FE_ListSubHeaderPanelShaderContainer = InheritFrom( LUI.UIElement )
CoD.FE_ListSubHeaderPanelShaderContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_ListSubHeaderPanelShaderContainer )
	self.id = "FE_ListSubHeaderPanelShaderContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 32 )
	self:setTopBottom( true, false, 0, 30 )
	
	local FEListSubHeaderPanelShader0 = CoD.FE_ListSubHeaderPanelShader.new( menu, controller )
	FEListSubHeaderPanelShader0:setLeftRight( true, true, 0, 0 )
	FEListSubHeaderPanelShader0:setTopBottom( true, true, 0, 0 )
	FEListSubHeaderPanelShader0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2" ) )
	FEListSubHeaderPanelShader0:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( FEListSubHeaderPanelShader0 )
	self.FEListSubHeaderPanelShader0 = FEListSubHeaderPanelShader0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FEListSubHeaderPanelShader0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

