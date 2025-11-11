require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShader" )
require( "ui.uieditor.widgets.Safehouse.SafeHouse_ButtonPanel" )

CoD.FE_ButtonPanelShaderContainerHighQuality = InheritFrom( LUI.UIElement )
CoD.FE_ButtonPanelShaderContainerHighQuality.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_ButtonPanelShaderContainerHighQuality )
	self.id = "FE_ButtonPanelShaderContainerHighQuality"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 420 )
	self:setTopBottom( 0, 0, 0, 42 )
	self.anyChildUsesUpdateState = true
	
	local FEButtonPanel = CoD.FE_ButtonPanelShader.new( menu, controller )
	FEButtonPanel:setLeftRight( 0, 1, 0, 0 )
	FEButtonPanel:setTopBottom( 0, 1, 0, 0 )
	self:addElement( FEButtonPanel )
	self.FEButtonPanel = FEButtonPanel
	
	local SafeHouseButtonPanel = CoD.SafeHouse_ButtonPanel.new( menu, controller )
	SafeHouseButtonPanel:setLeftRight( 0, 1, 0, 0 )
	SafeHouseButtonPanel:setTopBottom( 0, 1, 0, 0 )
	SafeHouseButtonPanel:setAlpha( 0 )
	self:addElement( SafeHouseButtonPanel )
	self.SafeHouseButtonPanel = SafeHouseButtonPanel
	
	self.resetProperties = function ()
		FEButtonPanel:completeAnimation()
		SafeHouseButtonPanel:completeAnimation()
		FEButtonPanel:setAlpha( 1 )
		SafeHouseButtonPanel:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Transparent = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				FEButtonPanel:completeAnimation()
				self.FEButtonPanel:setAlpha( 0 )
				self.clipFinished( FEButtonPanel, {} )
			end,
			DefaultState = function ()
				self.resetProperties()
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
				self.resetProperties()
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FEButtonPanel:close()
		self.SafeHouseButtonPanel:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

