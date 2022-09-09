-- faaa37c7369d1e47496a4972de4c3e4d
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShader_ExposedValues" )

CoD.FE_ButtonPanelShaderContainer_ExposedValues = InheritFrom( LUI.UIElement )
CoD.FE_ButtonPanelShaderContainer_ExposedValues.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.FE_ButtonPanelShaderContainer_ExposedValues )
	self.id = "FE_ButtonPanelShaderContainer_ExposedValues"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 280 )
	self:setTopBottom( true, false, 0, 28 )
	
	local FEButtonPanel = CoD.FE_ButtonPanelShader_ExposedValues.new( menu, controller )
	FEButtonPanel:setLeftRight( true, true, 0, 0 )
	FEButtonPanel:setTopBottom( true, true, 0, 0 )
	FEButtonPanel:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2" ) )
	FEButtonPanel:setShaderVector( 0, 24.98, 25, 0, 0 )
	FEButtonPanel.Full:setShaderVector( 0, 0.33, 0.33, 0, 0 )
	FEButtonPanel.Full:setShaderVector( 1, 10, 10, 0, 0 )
	FEButtonPanel.Full:setupNineSliceShader( 10, 10 )
	self:addElement( FEButtonPanel )
	self.FEButtonPanel = FEButtonPanel
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				FEButtonPanel:completeAnimation()
				self.FEButtonPanel:setAlpha( 1 )
				self.clipFinished( FEButtonPanel, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				FEButtonPanel:completeAnimation()
				self.FEButtonPanel:setAlpha( 0 )
				self.clipFinished( FEButtonPanel, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEButtonPanel:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
