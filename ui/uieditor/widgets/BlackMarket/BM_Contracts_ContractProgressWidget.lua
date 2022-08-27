-- 31d770d8e86cc0d6c8441cc132f78fc6
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BlackMarket.BM_Contracts_PercentCompleteWidget" )
require( "ui.uieditor.widgets.BlackMarket.BM_Contracts_DailyContractsTitle" )

CoD.BM_Contracts_ContractProgressWidget = InheritFrom( LUI.UIElement )
CoD.BM_Contracts_ContractProgressWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BM_Contracts_ContractProgressWidget )
	self.id = "BM_Contracts_ContractProgressWidget"
	self.soundSet = "Blackmarket_extra"
	self:setLeftRight( true, false, 0, 232 )
	self:setTopBottom( true, false, 0, 300 )
	self.anyChildUsesUpdateState = true
	
	local ContractPercentCompleteWidget = CoD.BM_Contracts_PercentCompleteWidget.new( menu, controller )
	ContractPercentCompleteWidget:setLeftRight( false, false, -72, 72 )
	ContractPercentCompleteWidget:setTopBottom( true, false, 29, 173 )
	ContractPercentCompleteWidget:setScale( 0.85 )
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
	
	local ContractDesc = LUI.UIText.new()
	ContractDesc:setLeftRight( false, false, -104, 104 )
	ContractDesc:setTopBottom( true, false, 188, 206 )
	ContractDesc:setRGB( 0.88, 0.88, 0.88 )
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
	
	local BMContractsDailyContractsTitle = CoD.BM_Contracts_DailyContractsTitle.new( menu, controller )
	BMContractsDailyContractsTitle:setLeftRight( true, false, 0, 232 )
	BMContractsDailyContractsTitle:setTopBottom( true, false, 169, 188 )
	BMContractsDailyContractsTitle:linkToElementModel( self, "title", true, function ( model )
		local title = Engine.GetModelValue( model )
		if title then
			BMContractsDailyContractsTitle.ContractName:setText( LocalizeToUpperString( title ) )
		end
	end )
	self:addElement( BMContractsDailyContractsTitle )
	self.BMContractsDailyContractsTitle = BMContractsDailyContractsTitle
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ContractPercentCompleteWidget:close()
		element.BMContractsDailyContractsTitle:close()
		element.ContractDesc:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

