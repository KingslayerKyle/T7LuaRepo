-- b7f374995331af27293519c849604da4
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BlackMarket.BM_CryptokeyCounterIcon" )

CoD.AAR_Contracts_DoubleCryptokeys = InheritFrom( LUI.UIElement )
CoD.AAR_Contracts_DoubleCryptokeys.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.AAR_Contracts_DoubleCryptokeys )
	self.id = "AAR_Contracts_DoubleCryptokeys"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 214 )
	self:setTopBottom( true, false, 0, 88 )
	self.anyChildUsesUpdateState = true
	
	local CryptokeyIcon = CoD.BM_CryptokeyCounterIcon.new( menu, controller )
	CryptokeyIcon:setLeftRight( false, false, 6, 34 )
	CryptokeyIcon:setTopBottom( false, true, -62, -34 )
	self:addElement( CryptokeyIcon )
	self.CryptokeyIcon = CryptokeyIcon
	
	local DoubleCryptokeys = LUI.UIImage.new()
	DoubleCryptokeys:setLeftRight( true, false, -1, 95 )
	DoubleCryptokeys:setTopBottom( false, true, -102, -14 )
	DoubleCryptokeys:setImage( RegisterImage( "uie_t7_bm_contracts_doublecrypto" ) )
	self:addElement( DoubleCryptokeys )
	self.DoubleCryptokeys = DoubleCryptokeys
	
	local redbox = LUI.UIImage.new()
	redbox:setLeftRight( true, false, 106, 130 )
	redbox:setTopBottom( true, false, 29, 53 )
	redbox:setAlpha( 0 )
	redbox:setImage( RegisterImage( "uie_t7_bm_contracts_redbox" ) )
	self:addElement( redbox )
	self.redbox = redbox
	
	local ContractDesc0 = LUI.UIText.new()
	ContractDesc0:setLeftRight( false, false, 39, 67 )
	ContractDesc0:setTopBottom( false, true, -56.76, -36.76 )
	ContractDesc0:setRGB( 0.75, 0.75, 0.75 )
	ContractDesc0:setAlpha( 0 )
	ContractDesc0:setText( DvarLocalizedIntoString( "daily_contract_cryptokey_reward_count", "PERKS_ITEMTEXT" ) )
	ContractDesc0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ContractDesc0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ContractDesc0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ContractDesc0 )
	self.ContractDesc0 = ContractDesc0
	
	local ContractDescREd = LUI.UIText.new()
	ContractDescREd:setLeftRight( false, false, -7, 28 )
	ContractDescREd:setTopBottom( false, true, -57, -37 )
	ContractDescREd:setRGB( 1, 0.19, 0.19 )
	ContractDescREd:setAlpha( 0 )
	ContractDescREd:setText( Engine.Localize( "10" ) )
	ContractDescREd:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ContractDescREd:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ContractDescREd:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ContractDescREd )
	self.ContractDescREd = ContractDescREd
	
	local arrow = LUI.UIImage.new()
	arrow:setLeftRight( true, false, 135, 144 )
	arrow:setTopBottom( true, false, 37, 46 )
	arrow:setAlpha( 0 )
	arrow:setImage( RegisterImage( "uie_t7_bm_contracts_yellow_arrow" ) )
	self:addElement( arrow )
	self.arrow = arrow
	
	local ContractDescPromo = LUI.UIText.new()
	ContractDescPromo:setLeftRight( false, false, 39, 87 )
	ContractDescPromo:setTopBottom( false, true, -57, -37 )
	ContractDescPromo:setRGB( 1, 0.85, 0.33 )
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
				self.CryptokeyIcon:setLeftRight( false, false, 6, 34 )
				self.CryptokeyIcon:setTopBottom( false, true, -62, -34 )
				self.CryptokeyIcon:setAlpha( 1 )
				self.clipFinished( CryptokeyIcon, {} )

				DoubleCryptokeys:completeAnimation()
				self.DoubleCryptokeys:setAlpha( 0 )
				self.clipFinished( DoubleCryptokeys, {} )

				redbox:completeAnimation()
				self.redbox:setAlpha( 0 )
				self.clipFinished( redbox, {} )

				ContractDesc0:completeAnimation()
				self.ContractDesc0:setLeftRight( false, false, 39, 67 )
				self.ContractDesc0:setTopBottom( false, true, -56.76, -36.76 )
				self.ContractDesc0:setAlpha( 1 )
				self.clipFinished( ContractDesc0, {} )

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
				self.CryptokeyIcon:setLeftRight( false, false, 6, 34 )
				self.CryptokeyIcon:setTopBottom( false, true, -62, -34 )
				self.CryptokeyIcon:setAlpha( 1 )
				self.clipFinished( CryptokeyIcon, {} )

				DoubleCryptokeys:completeAnimation()
				self.DoubleCryptokeys:setLeftRight( true, false, -1, 95 )
				self.DoubleCryptokeys:setTopBottom( false, true, -102, -14 )
				self.DoubleCryptokeys:setAlpha( 1 )
				self.clipFinished( DoubleCryptokeys, {} )

				redbox:completeAnimation()
				self.redbox:setLeftRight( true, false, 106, 130 )
				self.redbox:setTopBottom( true, false, 29, 53 )
				self.redbox:setAlpha( 0 )
				self.clipFinished( redbox, {} )

				ContractDesc0:completeAnimation()
				self.ContractDesc0:setLeftRight( false, false, 39, 67 )
				self.ContractDesc0:setTopBottom( false, true, -56.76, -36.76 )
				self.ContractDesc0:setAlpha( 0 )
				self.clipFinished( ContractDesc0, {} )

				ContractDescREd:completeAnimation()
				self.ContractDescREd:setLeftRight( false, false, -7, 28 )
				self.ContractDescREd:setTopBottom( false, true, -57, -37 )
				self.ContractDescREd:setAlpha( 0 )
				self.ContractDescREd:setText( Engine.Localize( "10" ) )
				self.ContractDescREd:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
				self.clipFinished( ContractDescREd, {} )

				arrow:completeAnimation()
				self.arrow:setLeftRight( true, false, 135, 144 )
				self.arrow:setTopBottom( true, false, 37, 46 )
				self.arrow:setAlpha( 0 )
				self.clipFinished( arrow, {} )

				ContractDescPromo:completeAnimation()
				self.ContractDescPromo:setLeftRight( false, false, 39, 87 )
				self.ContractDescPromo:setTopBottom( false, true, -57, -37 )
				self.ContractDescPromo:setAlpha( 1 )
				self.clipFinished( ContractDescPromo, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CryptokeyIcon:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
