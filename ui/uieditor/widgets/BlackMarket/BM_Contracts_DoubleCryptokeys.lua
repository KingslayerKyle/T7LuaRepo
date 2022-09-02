-- 160fc489ed74f594723a1a045321ee39
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BlackMarket.BM_CryptokeyCounterIcon" )

CoD.BM_Contracts_DoubleCryptokeys = InheritFrom( LUI.UIElement )
CoD.BM_Contracts_DoubleCryptokeys.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BM_Contracts_DoubleCryptokeys )
	self.id = "BM_Contracts_DoubleCryptokeys"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 214 )
	self:setTopBottom( true, false, 0, 88 )
	self.anyChildUsesUpdateState = true
	
	local CryptokeyIcon = CoD.BM_CryptokeyCounterIcon.new( menu, controller )
	CryptokeyIcon:setLeftRight( false, false, -20, 8 )
	CryptokeyIcon:setTopBottom( false, true, -55, -27 )
	self:addElement( CryptokeyIcon )
	self.CryptokeyIcon = CryptokeyIcon
	
	local DoubleCryptokeys = LUI.UIImage.new()
	DoubleCryptokeys:setLeftRight( true, false, -1, 95 )
	DoubleCryptokeys:setTopBottom( true, false, 0, 88 )
	DoubleCryptokeys:setAlpha( 0 )
	DoubleCryptokeys:setImage( RegisterImage( "uie_t7_bm_contracts_doublecrypto" ) )
	self:addElement( DoubleCryptokeys )
	self.DoubleCryptokeys = DoubleCryptokeys
	
	local redbox = LUI.UIImage.new()
	redbox:setLeftRight( true, false, 102, 126 )
	redbox:setTopBottom( true, false, 36, 60 )
	redbox:setAlpha( 0 )
	redbox:setImage( RegisterImage( "uie_t7_bm_contracts_redbox" ) )
	self:addElement( redbox )
	self.redbox = redbox
	
	local ContractDesc = LUI.UIText.new()
	ContractDesc:setLeftRight( false, false, 18, 66 )
	ContractDesc:setTopBottom( false, true, -49.76, -29.76 )
	ContractDesc:setRGB( 0.46, 0.8, 0.75 )
	ContractDesc:setText( DvarLocalizedIntoString( "daily_contract_cryptokey_reward_count", "PERKS_ITEMTEXT" ) )
	ContractDesc:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ContractDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ContractDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ContractDesc )
	self.ContractDesc = ContractDesc
	
	local ContractDescREd = LUI.UIText.new()
	ContractDescREd:setLeftRight( false, false, 18, 66 )
	ContractDescREd:setTopBottom( false, true, -50, -30 )
	ContractDescREd:setRGB( 1, 0.19, 0.19 )
	ContractDescREd:setAlpha( 0 )
	ContractDescREd:setText( Engine.Localize( "PERKS_ITEMTEXT" ) )
	ContractDescREd:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ContractDescREd:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ContractDescREd:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ContractDescREd )
	self.ContractDescREd = ContractDescREd
	
	local arrow = LUI.UIImage.new()
	arrow:setLeftRight( true, false, 131, 140 )
	arrow:setTopBottom( true, false, 44, 53 )
	arrow:setAlpha( 0 )
	arrow:setImage( RegisterImage( "uie_t7_bm_contracts_yellow_arrow" ) )
	self:addElement( arrow )
	self.arrow = arrow
	
	local ContractDescPromo = LUI.UIText.new()
	ContractDescPromo:setLeftRight( false, false, 30, 78 )
	ContractDescPromo:setTopBottom( false, true, -50, -30 )
	ContractDescPromo:setRGB( 1, 0.85, 0.33 )
	ContractDescPromo:setAlpha( 0 )
	ContractDescPromo:setText( DvarLocalizedIntoString( "daily_contract_cryptokey_reward_count", "PERKS_ITEMTEXT" ) )
	ContractDescPromo:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ContractDescPromo:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ContractDescPromo:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ContractDescPromo )
	self.ContractDescPromo = ContractDescPromo
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				CryptokeyIcon:completeAnimation()
				self.CryptokeyIcon:setLeftRight( false, false, -15, 13 )
				self.CryptokeyIcon:setTopBottom( false, true, -55, -27 )
				self.clipFinished( CryptokeyIcon, {} )

				DoubleCryptokeys:completeAnimation()
				self.DoubleCryptokeys:setAlpha( 0 )
				self.clipFinished( DoubleCryptokeys, {} )

				redbox:completeAnimation()
				self.redbox:setAlpha( 0 )
				self.clipFinished( redbox, {} )

				ContractDesc:completeAnimation()
				self.ContractDesc:setLeftRight( false, false, 18, 66 )
				self.ContractDesc:setTopBottom( false, true, -49.76, -29.76 )
				self.ContractDesc:setAlpha( 1 )
				self.clipFinished( ContractDesc, {} )

				ContractDescREd:completeAnimation()
				self.ContractDescREd:setAlpha( 0 )
				self.clipFinished( ContractDescREd, {} )

				arrow:completeAnimation()
				self.arrow:setAlpha( 0 )
				self.clipFinished( arrow, {} )

				ContractDescPromo:completeAnimation()
				self.ContractDescPromo:setAlpha( 0 )
				self.clipFinished( ContractDescPromo, {} )
			end
		},
		DoubleCryptoKeys = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				CryptokeyIcon:completeAnimation()
				self.CryptokeyIcon:setLeftRight( false, false, -15, 13 )
				self.CryptokeyIcon:setTopBottom( false, true, -55, -27 )
				self.CryptokeyIcon:setAlpha( 1 )
				self.clipFinished( CryptokeyIcon, {} )

				DoubleCryptokeys:completeAnimation()
				self.DoubleCryptokeys:setAlpha( 1 )
				self.clipFinished( DoubleCryptokeys, {} )

				redbox:completeAnimation()
				self.redbox:setLeftRight( true, false, 108, 132 )
				self.redbox:setTopBottom( true, false, 36, 60 )
				self.redbox:setAlpha( 0 )
				self.clipFinished( redbox, {} )

				ContractDesc:completeAnimation()
				self.ContractDesc:setLeftRight( false, false, 18, 66 )
				self.ContractDesc:setTopBottom( false, true, -49.76, -29.76 )
				self.ContractDesc:setAlpha( 0 )
				self.ContractDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
				self.clipFinished( ContractDesc, {} )

				ContractDescREd:completeAnimation()
				self.ContractDescREd:setLeftRight( false, false, -5, 31 )
				self.ContractDescREd:setTopBottom( false, true, -50, -30 )
				self.ContractDescREd:setAlpha( 0 )
				self.ContractDescREd:setText( Engine.Localize( "10" ) )
				self.ContractDescREd:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
				self.clipFinished( ContractDescREd, {} )

				arrow:completeAnimation()
				self.arrow:setLeftRight( true, false, 135, 144 )
				self.arrow:setTopBottom( true, false, 44, 53 )
				self.arrow:setAlpha( 0 )
				self.clipFinished( arrow, {} )

				ContractDescPromo:completeAnimation()
				self.ContractDescPromo:setLeftRight( false, false, 18, 66 )
				self.ContractDescPromo:setTopBottom( false, true, -51, -31 )
				self.ContractDescPromo:setAlpha( 1 )
				self.clipFinished( ContractDescPromo, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "DoubleCryptoKeys",
			condition = function ( menu, element, event )
				return IsDoubleDailyContract( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "autoevents.cycled" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "autoevents.cycled"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CryptokeyIcon:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

