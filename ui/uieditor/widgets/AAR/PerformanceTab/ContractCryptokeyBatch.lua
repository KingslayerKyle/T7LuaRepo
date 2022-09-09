-- 55c0493c491442a7d6e44c1c62ea7e06
-- This hash is used for caching, delete to decompile the file again

CoD.ContractCryptokeyBatch = InheritFrom( LUI.UIElement )
CoD.ContractCryptokeyBatch.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ContractCryptokeyBatch )
	self.id = "ContractCryptokeyBatch"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 274 )
	self:setTopBottom( true, false, 0, 48 )
	
	local ContractRewardFrame = LUI.UIImage.new()
	ContractRewardFrame:setLeftRight( true, false, 0, 274 )
	ContractRewardFrame:setTopBottom( true, false, 0, 48.26 )
	ContractRewardFrame:setImage( RegisterImage( "uie_t7_blackmarket_contracts_character_contactsnotactive_hover" ) )
	ContractRewardFrame:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	ContractRewardFrame:setShaderVector( 0, 0.15, 0.41, 0, 0 )
	ContractRewardFrame:setupNineSliceShader( 40, 20 )
	self:addElement( ContractRewardFrame )
	self.ContractRewardFrame = ContractRewardFrame
	
	local DailyContractBatchKeys = LUI.UIText.new()
	DailyContractBatchKeys:setLeftRight( true, false, 44.14, 104.83 )
	DailyContractBatchKeys:setTopBottom( false, false, -14.13, 13.87 )
	DailyContractBatchKeys:setText( GetDvarValue( "daily_contract_cryptokey_reward_count", "0" ) )
	DailyContractBatchKeys:setTTF( "fonts/escom.ttf" )
	DailyContractBatchKeys:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	DailyContractBatchKeys:setShaderVector( 0, 0.05, 0, 0, 0 )
	DailyContractBatchKeys:setShaderVector( 1, 0.05, 0, 0, 0 )
	DailyContractBatchKeys:setShaderVector( 2, 1, 0, 0, 0 )
	DailyContractBatchKeys:setLetterSpacing( 2 )
	DailyContractBatchKeys:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	DailyContractBatchKeys:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	self:addElement( DailyContractBatchKeys )
	self.DailyContractBatchKeys = DailyContractBatchKeys
	
	local WeeklyContractBatchKeys = LUI.UIText.new()
	WeeklyContractBatchKeys:setLeftRight( true, false, 44.14, 104.83 )
	WeeklyContractBatchKeys:setTopBottom( false, false, -14.13, 13.87 )
	WeeklyContractBatchKeys:setAlpha( 0 )
	WeeklyContractBatchKeys:setText( GetDvarValue( "weekly_contract_cryptokey_reward_count", "0" ) )
	WeeklyContractBatchKeys:setTTF( "fonts/escom.ttf" )
	WeeklyContractBatchKeys:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	WeeklyContractBatchKeys:setShaderVector( 0, 0.05, 0, 0, 0 )
	WeeklyContractBatchKeys:setShaderVector( 1, 0.05, 0, 0, 0 )
	WeeklyContractBatchKeys:setShaderVector( 2, 1, 0, 0, 0 )
	WeeklyContractBatchKeys:setLetterSpacing( 2 )
	WeeklyContractBatchKeys:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	WeeklyContractBatchKeys:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	self:addElement( WeeklyContractBatchKeys )
	self.WeeklyContractBatchKeys = WeeklyContractBatchKeys
	
	local ContractCyptokeyIcon = LUI.UIImage.new()
	ContractCyptokeyIcon:setLeftRight( true, false, 10.94, 40.24 )
	ContractCyptokeyIcon:setTopBottom( false, false, -13, 14.87 )
	ContractCyptokeyIcon:setImage( RegisterImage( "uie_t7_icon_blackmarket_cryptokey" ) )
	self:addElement( ContractCyptokeyIcon )
	self.ContractCyptokeyIcon = ContractCyptokeyIcon
	
	local ContractRewardText = LUI.UIText.new()
	ContractRewardText:setLeftRight( true, false, 75.5, 265.5 )
	ContractRewardText:setTopBottom( false, false, -8.13, 9.87 )
	ContractRewardText:setRGB( 0.98, 0.78, 0.23 )
	ContractRewardText:setText( Engine.Localize( "CONTRACT_REWARD" ) )
	ContractRewardText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ContractRewardText:setLetterSpacing( 3.5 )
	ContractRewardText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ContractRewardText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	self:addElement( ContractRewardText )
	self.ContractRewardText = ContractRewardText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				DailyContractBatchKeys:completeAnimation()
				self.DailyContractBatchKeys:setAlpha( 1 )
				self.clipFinished( DailyContractBatchKeys, {} )

				WeeklyContractBatchKeys:completeAnimation()
				self.WeeklyContractBatchKeys:setAlpha( 0 )
				self.clipFinished( WeeklyContractBatchKeys, {} )

				ContractRewardText:completeAnimation()
				self.ContractRewardText:setText( Engine.Localize( "CONTRACT_REWARD" ) )
				self.clipFinished( ContractRewardText, {} )
			end
		},
		DailyContract = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				DailyContractBatchKeys:completeAnimation()
				self.DailyContractBatchKeys:setAlpha( 1 )
				self.clipFinished( DailyContractBatchKeys, {} )

				WeeklyContractBatchKeys:completeAnimation()
				self.WeeklyContractBatchKeys:setAlpha( 0 )
				self.clipFinished( WeeklyContractBatchKeys, {} )

				ContractRewardText:completeAnimation()
				self.ContractRewardText:setText( Engine.Localize( "CONTRACT_DAILY_REWARD_CAPS" ) )
				self.clipFinished( ContractRewardText, {} )
			end
		},
		WeeklyContract = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				DailyContractBatchKeys:completeAnimation()
				self.DailyContractBatchKeys:setAlpha( 0 )
				self.clipFinished( DailyContractBatchKeys, {} )

				WeeklyContractBatchKeys:completeAnimation()
				self.WeeklyContractBatchKeys:setAlpha( 1 )
				self.clipFinished( WeeklyContractBatchKeys, {} )

				ContractRewardText:completeAnimation()
				self.ContractRewardText:setText( Engine.Localize( "CONTRACT_WEEKLY_REWARD_CAPS" ) )
				self.clipFinished( ContractRewardText, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "DailyContract",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "WeeklyContract",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
