-- abbe797a3e9ff3daa127013ad63c3ad4
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CallingCards.CallingCards_FrameWidget" )
require( "ui.uieditor.widgets.BlackMarket.BM_GoldBarMed" )
require( "ui.uieditor.widgets.BlackMarket.BM_Contracts_timer" )

CoD.SpecialContracts_CallingCardContracts_Profiler = InheritFrom( LUI.UIElement )
CoD.SpecialContracts_CallingCardContracts_Profiler.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.SpecialContracts_CallingCardContracts_Profiler )
	self.id = "SpecialContracts_CallingCardContracts_Profiler"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 350 )
	self:setTopBottom( true, false, 0, 482 )
	self.anyChildUsesUpdateState = true
	
	local Gradient = LUI.UIImage.new()
	Gradient:setLeftRight( true, true, 3.16, -7.16 )
	Gradient:setTopBottom( true, true, 3.59, -2.59 )
	Gradient:setAlpha( 0.5 )
	Gradient:setImage( RegisterImage( "uie_t7_blackmarket_contracts_blackjack_gradient" ) )
	Gradient:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	Gradient:setShaderVector( 0, 0.06, 0.49, 0, 0 )
	Gradient:setupNineSliceShader( 20, 232 )
	self:addElement( Gradient )
	self.Gradient = Gradient
	
	local Background0 = LUI.UIImage.new()
	Background0:setLeftRight( true, true, 2.16, -6.16 )
	Background0:setTopBottom( true, true, 4, -3 )
	Background0:setImage( RegisterImage( "uie_t7_blackmarket_contracts_bigframe" ) )
	Background0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	Background0:setShaderVector( 0, 0.16, 0.12, 0, 0 )
	Background0:setupNineSliceShader( 56, 56 )
	self:addElement( Background0 )
	self.Background0 = Background0
	
	local bgImage = LUI.UIImage.new()
	bgImage:setLeftRight( true, true, 3, -2 )
	bgImage:setTopBottom( true, false, 3, 89 )
	bgImage:setRGB( 0.11, 0.11, 0.11 )
	bgImage:setAlpha( 0 )
	self:addElement( bgImage )
	self.bgImage = bgImage
	
	local SelectedCardIcon = CoD.CallingCards_FrameWidget.new( menu, controller )
	SelectedCardIcon:setLeftRight( true, false, -67, 413 )
	SelectedCardIcon:setTopBottom( true, false, 22.76, 142.76 )
	SelectedCardIcon:setAlpha( 0.2 )
	SelectedCardIcon.CardIconFrame:setScale( 0.69 )
	SelectedCardIcon:linkToElementModel( self, nil, false, function ( model )
		SelectedCardIcon:setModel( model, controller )
	end )
	self:addElement( SelectedCardIcon )
	self.SelectedCardIcon = SelectedCardIcon
	
	local BMGoldBarMed = CoD.BM_GoldBarMed.new( menu, controller )
	BMGoldBarMed:setLeftRight( true, false, 3, 348 )
	BMGoldBarMed:setTopBottom( true, false, 32.5, 62.4 )
	BMGoldBarMed:setAlpha( 0 )
	self:addElement( BMGoldBarMed )
	self.BMGoldBarMed = BMGoldBarMed
	
	local blackMarketBrandIcon = LUI.UIImage.new()
	blackMarketBrandIcon:setLeftRight( false, false, -20.75, 47.75 )
	blackMarketBrandIcon:setTopBottom( true, false, 48.51, 117.01 )
	blackMarketBrandIcon:setAlpha( 0 )
	blackMarketBrandIcon:setImage( RegisterImage( "uie_t7_icon_blackmarket_encryptedicon_large" ) )
	self:addElement( blackMarketBrandIcon )
	self.blackMarketBrandIcon = blackMarketBrandIcon
	
	local EmblemSubtitle = LUI.UIText.new()
	EmblemSubtitle:setLeftRight( true, false, 25, 310 )
	EmblemSubtitle:setTopBottom( true, false, 132.76, 154.76 )
	EmblemSubtitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	EmblemSubtitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	EmblemSubtitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	EmblemSubtitle:linkToElementModel( self, "description", true, function ( model )
		local description = Engine.GetModelValue( model )
		if description then
			EmblemSubtitle:setText( Engine.Localize( description ) )
		end
	end )
	self:addElement( EmblemSubtitle )
	self.EmblemSubtitle = EmblemSubtitle
	
	local Reward1 = LUI.UIText.new()
	Reward1:setLeftRight( true, false, 29, 311 )
	Reward1:setTopBottom( true, false, 318.5, 340.5 )
	Reward1:setTTF( "fonts/default.ttf" )
	Reward1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Reward1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Reward1:linkToElementModel( self, "rewardDescription1", true, function ( model )
		local rewardDescription1 = Engine.GetModelValue( model )
		if rewardDescription1 then
			Reward1:setAlpha( HideIfEmptyString( rewardDescription1 ) )
		end
	end )
	Reward1:linkToElementModel( self, "rewardDescription1", true, function ( model )
		local rewardDescription1 = Engine.GetModelValue( model )
		if rewardDescription1 then
			Reward1:setText( Engine.Localize( rewardDescription1 ) )
		end
	end )
	self:addElement( Reward1 )
	self.Reward1 = Reward1
	
	local Reward2 = LUI.UIText.new()
	Reward2:setLeftRight( true, true, 29, -39 )
	Reward2:setTopBottom( true, false, 344.5, 366.5 )
	Reward2:setTTF( "fonts/default.ttf" )
	Reward2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Reward2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Reward2:linkToElementModel( self, "rewardDescription2", true, function ( model )
		local rewardDescription2 = Engine.GetModelValue( model )
		if rewardDescription2 then
			Reward2:setAlpha( HideIfEmptyString( rewardDescription2 ) )
		end
	end )
	Reward2:linkToElementModel( self, "rewardDescription2", true, function ( model )
		local rewardDescription2 = Engine.GetModelValue( model )
		if rewardDescription2 then
			Reward2:setText( Engine.Localize( rewardDescription2 ) )
		end
	end )
	self:addElement( Reward2 )
	self.Reward2 = Reward2
	
	local Reward3 = LUI.UIText.new()
	Reward3:setLeftRight( true, false, 29, 311 )
	Reward3:setTopBottom( true, false, 370.5, 392.5 )
	Reward3:setTTF( "fonts/default.ttf" )
	Reward3:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Reward3:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Reward3:linkToElementModel( self, "rewardDescription3", true, function ( model )
		local rewardDescription3 = Engine.GetModelValue( model )
		if rewardDescription3 then
			Reward3:setAlpha( HideIfEmptyString( rewardDescription3 ) )
		end
	end )
	Reward3:linkToElementModel( self, "rewardDescription3", true, function ( model )
		local rewardDescription3 = Engine.GetModelValue( model )
		if rewardDescription3 then
			Reward3:setText( Engine.Localize( rewardDescription3 ) )
		end
	end )
	self:addElement( Reward3 )
	self.Reward3 = Reward3
	
	local Divider0 = LUI.UIImage.new()
	Divider0:setLeftRight( true, false, 21, 325 )
	Divider0:setTopBottom( true, false, 236.5, 244.49 )
	Divider0:setImage( RegisterImage( "uie_t7_blackmarket_contract_divider" ) )
	Divider0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	Divider0:setShaderVector( 0, 0.03, 0.5, 0, 0 )
	Divider0:setupNineSliceShader( 10, 4 )
	self:addElement( Divider0 )
	self.Divider0 = Divider0
	
	local header = LUI.UIImage.new()
	header:setLeftRight( true, false, 3, 342 )
	header:setTopBottom( true, false, 3.29, 44.06 )
	header:setImage( RegisterImage( "uie_t7_blackmarket_contracts_blackjack" ) )
	self:addElement( header )
	self.header = header
	
	local BMContractstimer = CoD.BM_Contracts_timer.new( menu, controller )
	BMContractstimer:setLeftRight( true, false, 19, 330 )
	BMContractstimer:setTopBottom( true, false, 15.24, 34.28 )
	BMContractstimer.Timer:setText( Engine.Localize( "" ) )
	BMContractstimer:linkToElementModel( self, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			BMContractstimer.Weekly:setText( LocalizeToUpperString( name ) )
		end
	end )
	BMContractstimer:mergeStateConditions( {
		{
			stateName = "HideTimer",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( BMContractstimer )
	self.BMContractstimer = BMContractstimer
	
	local black = LUI.UIImage.new()
	black:setLeftRight( true, false, 8, 339.5 )
	black:setTopBottom( true, false, 79.76, 82.76 )
	black:setRGB( 0, 0, 0 )
	self:addElement( black )
	self.black = black
	
	local Lock = LUI.UIImage.new()
	Lock:setLeftRight( true, false, 162, 194 )
	Lock:setTopBottom( true, false, 65.26, 97.26 )
	Lock:setScale( 1.2 )
	Lock:setImage( RegisterImage( "uie_t7_blackmarket_contract_callingcard_lock" ) )
	self:addElement( Lock )
	self.Lock = Lock
	
	local Reward = LUI.UIText.new()
	Reward:setLeftRight( true, false, 26, 311 )
	Reward:setTopBottom( true, false, 291, 310 )
	Reward:setRGB( 0.46, 0.8, 0.75 )
	Reward:setText( Engine.Localize( "MPUI_REWARDS_CAPS" ) )
	Reward:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	Reward:setLetterSpacing( -0.5 )
	Reward:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Reward:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Reward )
	self.Reward = Reward
	
	local ContractProgressText = LUI.UIText.new()
	ContractProgressText:setLeftRight( true, false, 25, 310 )
	ContractProgressText:setTopBottom( true, false, 199.75, 224.75 )
	ContractProgressText:setRGB( 0.94, 0.94, 0.94 )
	ContractProgressText:setTTF( "fonts/escom.ttf" )
	ContractProgressText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ContractProgressText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	ContractProgressText:linkToElementModel( self, "groupProgress", true, function ( model )
		local groupProgress = Engine.GetModelValue( model )
		if groupProgress then
			ContractProgressText:setAlpha( HideIfEmptyString( groupProgress ) )
		end
	end )
	ContractProgressText:linkToElementModel( self, "groupProgress", true, function ( model )
		local groupProgress = Engine.GetModelValue( model )
		if groupProgress then
			ContractProgressText:setText( Engine.Localize( groupProgress ) )
		end
	end )
	self:addElement( ContractProgressText )
	self.ContractProgressText = ContractProgressText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				SelectedCardIcon:completeAnimation()
				self.SelectedCardIcon:setAlpha( 1 )
				self.clipFinished( SelectedCardIcon, {} )

				BMGoldBarMed:completeAnimation()
				self.BMGoldBarMed:setAlpha( 0 )
				self.clipFinished( BMGoldBarMed, {} )

				blackMarketBrandIcon:completeAnimation()
				self.blackMarketBrandIcon:setAlpha( 0 )
				self.clipFinished( blackMarketBrandIcon, {} )

				black:completeAnimation()
				self.black:setAlpha( 0 )
				self.clipFinished( black, {} )

				Lock:completeAnimation()
				self.Lock:setAlpha( 0 )
				self.clipFinished( Lock, {} )
			end
		},
		Complete = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				SelectedCardIcon:completeAnimation()
				self.SelectedCardIcon:setAlpha( 1 )
				self.clipFinished( SelectedCardIcon, {} )

				BMGoldBarMed:completeAnimation()
				self.BMGoldBarMed:setAlpha( 0 )
				self.clipFinished( BMGoldBarMed, {} )

				blackMarketBrandIcon:completeAnimation()
				self.blackMarketBrandIcon:setAlpha( 0 )
				self.clipFinished( blackMarketBrandIcon, {} )

				black:completeAnimation()
				self.black:setAlpha( 0 )
				self.clipFinished( black, {} )

				Lock:completeAnimation()
				self.Lock:setAlpha( 0 )
				self.clipFinished( Lock, {} )
			end
		},
		Active = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				SelectedCardIcon:completeAnimation()
				self.SelectedCardIcon:setLeftRight( true, false, -67, 413 )
				self.SelectedCardIcon:setTopBottom( true, false, 22.76, 142.76 )
				self.SelectedCardIcon:setAlpha( 0.2 )
				self.clipFinished( SelectedCardIcon, {} )

				BMGoldBarMed:completeAnimation()
				self.BMGoldBarMed:setAlpha( 0 )
				self.clipFinished( BMGoldBarMed, {} )

				blackMarketBrandIcon:completeAnimation()
				self.blackMarketBrandIcon:setAlpha( 0 )
				self.clipFinished( blackMarketBrandIcon, {} )

				black:completeAnimation()
				self.black:setAlpha( 1 )
				self.clipFinished( black, {} )

				Lock:completeAnimation()
				self.Lock:setAlpha( 1 )
				self.clipFinished( Lock, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				SelectedCardIcon:completeAnimation()
				self.SelectedCardIcon:setAlpha( 0.2 )
				self.clipFinished( SelectedCardIcon, {} )

				BMGoldBarMed:completeAnimation()
				self.BMGoldBarMed:setAlpha( 0 )
				self.clipFinished( BMGoldBarMed, {} )

				blackMarketBrandIcon:completeAnimation()
				self.blackMarketBrandIcon:setAlpha( 0 )
				self.clipFinished( blackMarketBrandIcon, {} )

				black:completeAnimation()
				self.black:setAlpha( 1 )
				self.clipFinished( black, {} )

				Lock:completeAnimation()
				self.Lock:setAlpha( 1 )
				self.clipFinished( Lock, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Complete",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isComplete" )
			end
		},
		{
			stateName = "Active",
			condition = function ( menu, element, event )
				return IsSpecialContractActive( self, element, controller )
			end
		},
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return not IsSelfModelValueTrue( element, controller, "isComplete" )
			end
		}
	} )
	self:linkToElementModel( self, "isComplete", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isComplete"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.SelectedCardIcon:close()
		element.BMGoldBarMed:close()
		element.BMContractstimer:close()
		element.EmblemSubtitle:close()
		element.Reward1:close()
		element.Reward2:close()
		element.Reward3:close()
		element.ContractProgressText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
