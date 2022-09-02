-- 38854f55bbc50bbe4a3089c7d2f89e53
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.AAR.ContractsTab.AAR_Contracts_PercentCompleteWidget" )

CoD.AAR_Contracts_ContractProgressWidget = InheritFrom( LUI.UIElement )
CoD.AAR_Contracts_ContractProgressWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.AAR_Contracts_ContractProgressWidget )
	self.id = "AAR_Contracts_ContractProgressWidget"
	self.soundSet = "Blackmarket_extra"
	self:setLeftRight( true, false, 0, 273 )
	self:setTopBottom( true, false, 0, 250 )
	self.anyChildUsesUpdateState = true
	
	local ContractPercentCompleteWidget = CoD.AAR_Contracts_PercentCompleteWidget.new( menu, controller )
	ContractPercentCompleteWidget:setLeftRight( false, false, -63, 61 )
	ContractPercentCompleteWidget:setTopBottom( true, false, 16, 140 )
	ContractPercentCompleteWidget:setScale( 0.9 )
	ContractPercentCompleteWidget:linkToElementModel( self, "index", true, function ( model )
		local index = Engine.GetModelValue( model )
		if index then
			ContractPercentCompleteWidget:setAlpha( HideIfNumEqualTo( 0, index ) )
		end
	end )
	ContractPercentCompleteWidget:linkToElementModel( self, nil, false, function ( model )
		ContractPercentCompleteWidget:setModel( model, controller )
	end )
	ContractPercentCompleteWidget:linkToElementModel( self, "percentComplete", true, function ( model )
		local percentComplete = Engine.GetModelValue( model )
		if percentComplete then
			ContractPercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( percentComplete, 1 ), CoD.GetVectorComponentFromString( percentComplete, 2 ), CoD.GetVectorComponentFromString( percentComplete, 3 ), CoD.GetVectorComponentFromString( percentComplete, 4 ) )
		end
	end )
	ContractPercentCompleteWidget:linkToElementModel( self, "fractionText", true, function ( model )
		local fractionText = Engine.GetModelValue( model )
		if fractionText then
			ContractPercentCompleteWidget.percentText:setText( Engine.Localize( fractionText ) )
		end
	end )
	ContractPercentCompleteWidget:mergeStateConditions( {
		{
			stateName = "Complete",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isComplete" )
			end
		}
	} )
	ContractPercentCompleteWidget:linkToElementModel( ContractPercentCompleteWidget, "isComplete", true, function ( model )
		menu:updateElementState( ContractPercentCompleteWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isComplete"
		} )
	end )
	self:addElement( ContractPercentCompleteWidget )
	self.ContractPercentCompleteWidget = ContractPercentCompleteWidget
	
	local ContractName = LUI.UIText.new()
	ContractName:setLeftRight( true, true, 0, 0 )
	ContractName:setTopBottom( true, false, 145, 165 )
	ContractName:setRGB( 0.94, 0.89, 0.59 )
	ContractName:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	ContractName:setLetterSpacing( -0.5 )
	ContractName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ContractName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	ContractName:linkToElementModel( self, "title", true, function ( model )
		local title = Engine.GetModelValue( model )
		if title then
			ContractName:setText( LocalizeToUpperString( title ) )
		end
	end )
	self:addElement( ContractName )
	self.ContractName = ContractName
	
	local ContractDesc = LUI.UIText.new()
	ContractDesc:setLeftRight( false, false, -125, 125 )
	ContractDesc:setTopBottom( true, false, 165, 185 )
	ContractDesc:setRGB( 0.8, 0.8, 0.8 )
	ContractDesc:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ContractDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ContractDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	ContractDesc:linkToElementModel( self, "description", true, function ( model )
		local description = Engine.GetModelValue( model )
		if description then
			ContractDesc:setText( Engine.Localize( description ) )
		end
	end )
	self:addElement( ContractDesc )
	self.ContractDesc = ContractDesc
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ContractPercentCompleteWidget:close()
		element.ContractName:close()
		element.ContractDesc:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

