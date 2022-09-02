-- 1cf10af68ed83595cb7d7a8c4b2d0578
-- This hash is used for caching, delete to decompile the file again

CoD.BM_Contracts_DailyContractsTitle = InheritFrom( LUI.UIElement )
CoD.BM_Contracts_DailyContractsTitle.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BM_Contracts_DailyContractsTitle )
	self.id = "BM_Contracts_DailyContractsTitle"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 232 )
	self:setTopBottom( true, false, 0, 19 )
	
	local ContractName = LUI.UIText.new()
	ContractName:setLeftRight( true, true, 0, LanguageOverrideNumber( "arabic", -12, 0 ) )
	ContractName:setTopBottom( true, false, 0, 19 )
	ContractName:setRGB( 0.46, 0.8, 0.75 )
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
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ContractName:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

