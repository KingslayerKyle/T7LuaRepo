require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShader" )
require( "ui.uieditor.widgets.Safehouse.SafeHouse_ButtonPanel" )

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
	self.anyChildUsesUpdateState = true
	
	local FEButtonPanel = CoD.FE_ButtonPanelShader.new( menu, controller )
	FEButtonPanel:setLeftRight( true, true, 0, 0 )
	FEButtonPanel:setTopBottom( true, true, 0, 0 )
	FEButtonPanel:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2" ) )
	FEButtonPanel:setShaderVector( 0, 0, 20, 0, 0 )
	self:addElement( FEButtonPanel )
	self.FEButtonPanel = FEButtonPanel
	
	local SafeHouseButtonPanel = CoD.SafeHouse_ButtonPanel.new( menu, controller )
	SafeHouseButtonPanel:setLeftRight( true, true, 0, 0 )
	SafeHouseButtonPanel:setTopBottom( true, true, 0, 0 )
	SafeHouseButtonPanel:setAlpha( 0 )
	self:addElement( SafeHouseButtonPanel )
	self.SafeHouseButtonPanel = SafeHouseButtonPanel
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				FEButtonPanel:completeAnimation()
				self.FEButtonPanel:setAlpha( 1 )
				self.clipFinished( FEButtonPanel, {} )
				SafeHouseButtonPanel:completeAnimation()
				self.SafeHouseButtonPanel:setAlpha( 0 )
				self.clipFinished( SafeHouseButtonPanel, {} )
			end
		},
		Transparent = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				FEButtonPanel:completeAnimation()
				self.FEButtonPanel:setAlpha( 0 )
				self.clipFinished( FEButtonPanel, {} )
				SafeHouseButtonPanel:completeAnimation()
				self.SafeHouseButtonPanel:setAlpha( 0 )
				self.clipFinished( SafeHouseButtonPanel, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 1 )
				local FEButtonPanelFrame2 = function ( FEButtonPanel, event )
					if not event.interrupted then
						FEButtonPanel:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					FEButtonPanel:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FEButtonPanel, event )
					else
						FEButtonPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonPanel:completeAnimation()
				self.FEButtonPanel:setAlpha( 0 )
				FEButtonPanelFrame2( FEButtonPanel, {} )
			end
		},
		Safehouse = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				FEButtonPanel:completeAnimation()
				self.FEButtonPanel:setAlpha( 0 )
				self.clipFinished( FEButtonPanel, {} )
				SafeHouseButtonPanel:completeAnimation()
				self.SafeHouseButtonPanel:setAlpha( 0.75 )
				self.clipFinished( SafeHouseButtonPanel, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Transparent",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "hideWorldForStreamer", 1 )
			end
		},
		{
			stateName = "Safehouse",
			condition = function ( menu, element, event )
				return IsCPAndInSafehouse()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "hideWorldForStreamer" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hideWorldForStreamer"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEButtonPanel:close()
		element.SafeHouseButtonPanel:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

