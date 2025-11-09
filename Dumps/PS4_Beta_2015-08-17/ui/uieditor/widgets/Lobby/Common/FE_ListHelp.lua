require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_LabelBodyA" )

CoD.FE_ListHelp = InheritFrom( LUI.UIElement )
CoD.FE_ListHelp.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_ListHelp )
	self.id = "FE_ListHelp"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 280 )
	self:setTopBottom( true, false, 0, 32 )
	self.anyChildUsesUpdateState = true
	
	local FEButtonPanelShaderContainer = CoD.FE_ButtonPanelShaderContainer.new( menu, controller )
	FEButtonPanelShaderContainer:setLeftRight( true, true, 0, 0 )
	FEButtonPanelShaderContainer:setTopBottom( false, false, -14, 14 )
	FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( FEButtonPanelShaderContainer )
	self.FEButtonPanelShaderContainer = FEButtonPanelShaderContainer
	
	local FELabelBodyA0 = CoD.FE_LabelBodyA.new( menu, controller )
	FELabelBodyA0:setLeftRight( true, false, 12, 466 )
	FELabelBodyA0:setTopBottom( true, false, 6.92, 23.92 )
	FELabelBodyA0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	FELabelBodyA0:setShaderVector( 0, 0.05, 0, 0, 0 )
	FELabelBodyA0:setShaderVector( 1, 0, 0, 0, 0 )
	FELabelBodyA0:setShaderVector( 2, 0, 0, 0, 0 )
	FELabelBodyA0:setShaderVector( 3, 0, 0, 0, 0 )
	FELabelBodyA0:setShaderVector( 4, 0, 0, 0, 0 )
	FELabelBodyA0.TextBox0:setRGB( 0.7, 0.81, 0.8 )
	FELabelBodyA0.TextBox0:setText( Engine.Localize( "MPUI_PLAYER_MATCH_DESC" ) )
	FELabelBodyA0.TextBox0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( FELabelBodyA0 )
	self.FELabelBodyA0 = FELabelBodyA0
	
	local ContextualHelp = LUI.UIText.new()
	ContextualHelp:setLeftRight( true, false, 113.46, 291.32 )
	ContextualHelp:setTopBottom( true, false, 608, 623.65 )
	ContextualHelp:setRGB( 0.74, 0.81, 0.87 )
	ContextualHelp:setYRot( 25 )
	ContextualHelp:setText( Engine.Localize( "MPUI_PLAYER_MATCH_DESC" ) )
	ContextualHelp:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	ContextualHelp:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	ContextualHelp:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( ContextualHelp, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 0 )
	end )
	self:addElement( ContextualHelp )
	self.ContextualHelp = ContextualHelp
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
				self.FEButtonPanelShaderContainer:setZoom( 0 )
				self.clipFinished( FEButtonPanelShaderContainer, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FEButtonPanelShaderContainer:close()
		self.FELabelBodyA0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

