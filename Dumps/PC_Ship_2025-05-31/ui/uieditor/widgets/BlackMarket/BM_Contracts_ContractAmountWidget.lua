CoD.BM_Contracts_ContractAmountWidget = InheritFrom( LUI.UIElement )
CoD.BM_Contracts_ContractAmountWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BM_Contracts_ContractAmountWidget )
	self.id = "BM_Contracts_ContractAmountWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 196 )
	self:setTopBottom( true, false, 0, 80 )
	
	local ContractBacking0 = LUI.UIImage.new()
	ContractBacking0:setLeftRight( true, true, 0, 0 )
	ContractBacking0:setTopBottom( true, true, 3, 0 )
	ContractBacking0:setRGB( 0.46, 0.8, 0.75 )
	ContractBacking0:setAlpha( 0 )
	ContractBacking0:setImage( RegisterImage( "uie_t7_blackmarket_contract_blackjack_bg" ) )
	ContractBacking0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	ContractBacking0:setShaderVector( 0, 0.15, 0.5, 0, 0 )
	ContractBacking0:setupNineSliceShader( 30, 30 )
	self:addElement( ContractBacking0 )
	self.ContractBacking0 = ContractBacking0
	
	local ContractBacking = LUI.UIImage.new()
	ContractBacking:setLeftRight( true, true, 0, 0 )
	ContractBacking:setTopBottom( true, true, 3, 0 )
	ContractBacking:setImage( RegisterImage( "uie_t7_blackmarket_contract_blackjack_bg" ) )
	ContractBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	ContractBacking:setShaderVector( 0, 0.15, 0.5, 0, 0 )
	ContractBacking:setupNineSliceShader( 30, 30 )
	self:addElement( ContractBacking )
	self.ContractBacking = ContractBacking
	
	local Numberbacker = LUI.UIImage.new()
	Numberbacker:setLeftRight( false, true, -94.25, -38.25 )
	Numberbacker:setTopBottom( false, false, -30.5, 33.5 )
	Numberbacker:setAlpha( 0.5 )
	Numberbacker:setImage( RegisterImage( "uie_t7_blackmarket_contract_numberbacking" ) )
	self:addElement( Numberbacker )
	self.Numberbacker = Numberbacker
	
	local GoldContracts = LUI.UIImage.new()
	GoldContracts:setLeftRight( true, false, 33, 113 )
	GoldContracts:setTopBottom( false, false, -39, 41 )
	GoldContracts:setImage( RegisterImage( "uie_t7_blackmarket_contracts_blackjack_green" ) )
	self:addElement( GoldContracts )
	self.GoldContracts = GoldContracts
	
	local SilverContracts = LUI.UIImage.new()
	SilverContracts:setLeftRight( true, false, 33, 113 )
	SilverContracts:setTopBottom( false, false, -39, 41 )
	SilverContracts:setAlpha( 0 )
	SilverContracts:setImage( RegisterImage( "uie_t7_blackmarket_contracts_blackjack_max" ) )
	self:addElement( SilverContracts )
	self.SilverContracts = SilverContracts
	
	local ContractCounter = LUI.UIText.new()
	ContractCounter:setLeftRight( false, true, -100.75, -34.75 )
	ContractCounter:setTopBottom( false, false, -20, 25 )
	ContractCounter:setRGB( 0.93, 0.69, 0.35 )
	ContractCounter:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	ContractCounter:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ContractCounter:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	ContractCounter:subscribeToGlobalModel( controller, "StorageGlobal", "stats_mp", function ( model )
		local statsMp = Engine.GetModelValue( model )
		if statsMp then
			ContractCounter:setText( Engine.Localize( StorageLookup( controller, "blackjack_contract_count", statsMp ) ) )
		end
	end )
	self:addElement( ContractCounter )
	self.ContractCounter = ContractCounter
	
	local TextBoxMax = LUI.UIText.new()
	TextBoxMax:setLeftRight( false, true, -103.75, -30.75 )
	TextBoxMax:setTopBottom( false, false, 8.5, 27.5 )
	TextBoxMax:setRGB( 0.61, 0.1, 0.1 )
	TextBoxMax:setAlpha( 0 )
	TextBoxMax:setText( Engine.Localize( "MENU_MAX" ) )
	TextBoxMax:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	TextBoxMax:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBoxMax:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBoxMax )
	self.TextBoxMax = TextBoxMax
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				Numberbacker:completeAnimation()
				self.Numberbacker:setAlpha( 1 )
				self.clipFinished( Numberbacker, {} )
				GoldContracts:completeAnimation()
				self.GoldContracts:setAlpha( 1 )
				self.clipFinished( GoldContracts, {} )
				SilverContracts:completeAnimation()
				self.SilverContracts:setAlpha( 0 )
				self.clipFinished( SilverContracts, {} )
				ContractCounter:completeAnimation()
				self.ContractCounter:setLeftRight( false, true, -100.75, -34.75 )
				self.ContractCounter:setTopBottom( false, false, -20, 25 )
				self.ContractCounter:setRGB( 0.93, 0.69, 0.35 )
				self.ContractCounter:setAlpha( 1 )
				self.clipFinished( ContractCounter, {} )
				TextBoxMax:completeAnimation()
				self.TextBoxMax:setLeftRight( false, true, -103.75, -30.75 )
				self.TextBoxMax:setTopBottom( false, false, 8.5, 27.5 )
				self.TextBoxMax:setAlpha( 0 )
				self.clipFinished( TextBoxMax, {} )
			end
		},
		Max = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				Numberbacker:completeAnimation()
				self.Numberbacker:setAlpha( 1 )
				self.clipFinished( Numberbacker, {} )
				GoldContracts:completeAnimation()
				self.GoldContracts:setAlpha( 1 )
				self.clipFinished( GoldContracts, {} )
				SilverContracts:completeAnimation()
				self.SilverContracts:setAlpha( 0 )
				self.clipFinished( SilverContracts, {} )
				ContractCounter:completeAnimation()
				self.ContractCounter:setLeftRight( false, true, -99.75, -33.75 )
				self.ContractCounter:setTopBottom( false, false, -27, 18 )
				self.ContractCounter:setRGB( 0.93, 0.69, 0.35 )
				self.ContractCounter:setAlpha( 1 )
				self.clipFinished( ContractCounter, {} )
				TextBoxMax:completeAnimation()
				self.TextBoxMax:setLeftRight( false, true, -102.75, -29.75 )
				self.TextBoxMax:setTopBottom( false, false, 7.5, 26.5 )
				self.TextBoxMax:setAlpha( 1 )
				self.TextBoxMax:setText( Engine.Localize( "MPUI_MAX_CAPS" ) )
				self.clipFinished( TextBoxMax, {} )
			end
		},
		None = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				Numberbacker:completeAnimation()
				self.Numberbacker:setAlpha( 1 )
				self.clipFinished( Numberbacker, {} )
				GoldContracts:completeAnimation()
				self.GoldContracts:setAlpha( 0 )
				self.clipFinished( GoldContracts, {} )
				SilverContracts:completeAnimation()
				self.SilverContracts:setAlpha( 1 )
				self.clipFinished( SilverContracts, {} )
				ContractCounter:completeAnimation()
				self.ContractCounter:setLeftRight( false, true, -100.75, -34.75 )
				self.ContractCounter:setTopBottom( false, false, -20, 25 )
				self.ContractCounter:setRGB( 0.4, 0.4, 0.4 )
				self.clipFinished( ContractCounter, {} )
				TextBoxMax:completeAnimation()
				self.TextBoxMax:setLeftRight( false, true, -103.75, -30.75 )
				self.TextBoxMax:setTopBottom( false, false, 8.5, 27.5 )
				self.TextBoxMax:setAlpha( 0 )
				self.clipFinished( TextBoxMax, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Max",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "None",
			condition = function ( menu, element, event )
				return IsStorageValueEqualTo( controller, "stats_mp", "blackjack_contract_count", 0 )
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ContractCounter:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

