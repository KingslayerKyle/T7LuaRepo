-- ec728a78edeecd9dc4826fb9f662bfa6
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.SpecialContracts.SpecialContracts_RewardImage" )
require( "ui.uieditor.widgets.BlackMarket.BM_Contracts_timer" )
require( "ui.uieditor.widgets.SpecialContracts.SpecialContracts_StateIndicator" )

CoD.SpecialContracts_Infopane = InheritFrom( LUI.UIElement )
CoD.SpecialContracts_Infopane.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SpecialContracts_Infopane )
	self.id = "SpecialContracts_Infopane"
	self.soundSet = "Blackmarket_extra"
	self:setLeftRight( true, false, 0, 350 )
	self:setTopBottom( true, false, 0, 500 )
	self.anyChildUsesUpdateState = true
	
	local Gradient = LUI.UIImage.new()
	Gradient:setLeftRight( true, true, 3.16, -7.16 )
	Gradient:setTopBottom( true, true, 3.59, -2.59 )
	Gradient:setAlpha( 0.5 )
	Gradient:setImage( RegisterImage( "uie_t7_blackmarket_contracts_blackjack_gradient" ) )
	Gradient:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	Gradient:setShaderVector( 0, 0.06, 0.47, 0, 0 )
	Gradient:setupNineSliceShader( 20, 232 )
	self:addElement( Gradient )
	self.Gradient = Gradient
	
	local Background0 = LUI.UIImage.new()
	Background0:setLeftRight( true, true, 2.16, -6.16 )
	Background0:setTopBottom( true, true, 4, -3 )
	Background0:setImage( RegisterImage( "uie_t7_blackmarket_contracts_bigframe" ) )
	Background0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	Background0:setShaderVector( 0, 0.16, 0.11, 0, 0 )
	Background0:setupNineSliceShader( 56, 56 )
	self:addElement( Background0 )
	self.Background0 = Background0
	
	local frame = LUI.UIImage.new()
	frame:setLeftRight( true, false, 26, 322 )
	frame:setTopBottom( true, false, 254.5, 389 )
	frame:setAlpha( 0.25 )
	frame:setImage( RegisterImage( "uie_t7_blackmarket_contracts_cc_frame_dark" ) )
	frame:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	frame:setShaderVector( 0, 0.19, 0.41, 0, 0 )
	frame:setupNineSliceShader( 55, 55 )
	self:addElement( frame )
	self.frame = frame
	
	local Divider0 = LUI.UIImage.new()
	Divider0:setLeftRight( true, false, 26, 322 )
	Divider0:setTopBottom( true, false, 185.76, 193.75 )
	Divider0:setImage( RegisterImage( "uie_t7_blackmarket_contract_divider" ) )
	Divider0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	Divider0:setShaderVector( 0, 0.03, 0.5, 0, 0 )
	Divider0:setupNineSliceShader( 10, 4 )
	self:addElement( Divider0 )
	self.Divider0 = Divider0
	
	local Reward1 = LUI.UIText.new()
	Reward1:setLeftRight( true, false, 31, 317 )
	Reward1:setTopBottom( true, false, 403, 425 )
	Reward1:setRGB( 0.88, 0.88, 0.88 )
	Reward1:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Reward1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Reward1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Reward1 )
	self.Reward1 = Reward1
	
	local Reward2 = LUI.UIText.new()
	Reward2:setLeftRight( true, false, 31, 317 )
	Reward2:setTopBottom( true, false, 428, 450 )
	Reward2:setRGB( 0.88, 0.88, 0.88 )
	Reward2:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Reward2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Reward2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Reward2 )
	self.Reward2 = Reward2
	
	local Reward3 = LUI.UIText.new()
	Reward3:setLeftRight( true, false, 31, 317 )
	Reward3:setTopBottom( true, false, 453, 475 )
	Reward3:setRGB( 0.88, 0.88, 0.88 )
	Reward3:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Reward3:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Reward3:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Reward3 )
	self.Reward3 = Reward3
	
	local RewardImage = CoD.SpecialContracts_RewardImage.new( menu, controller )
	RewardImage:setLeftRight( true, false, 42, 306 )
	RewardImage:setTopBottom( false, true, -253, -107 )
	RewardImage:setScale( 1.09 )
	RewardImage.ItemImage:setScale( 1.08 )
	RewardImage.CallingCard.CardIconFrame:setScale( 0.55 )
	RewardImage:linkToElementModel( self, nil, false, function ( model )
		RewardImage:setModel( model, controller )
	end )
	RewardImage:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			RewardImage.ItemImage:setImage( RegisterImage( image ) )
		end
	end )
	self:addElement( RewardImage )
	self.RewardImage = RewardImage
	
	local header = LUI.UIImage.new()
	header:setLeftRight( true, true, 3.16, -7.16 )
	header:setTopBottom( true, false, 3.29, 44.06 )
	header:setImage( RegisterImage( "uie_t7_blackmarket_contracts_blackjack" ) )
	self:addElement( header )
	self.header = header
	
	local BMContractstimer = CoD.BM_Contracts_timer.new( menu, controller )
	BMContractstimer:setLeftRight( true, false, 19, 329 )
	BMContractstimer:setTopBottom( true, false, 16.24, 35.28 )
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
	
	local BlackjackContractsDescription = LUI.UIText.new()
	BlackjackContractsDescription:setLeftRight( true, false, 28, 319 )
	BlackjackContractsDescription:setTopBottom( true, false, 62, 84.75 )
	BlackjackContractsDescription:setRGB( 0.88, 0.88, 0.88 )
	BlackjackContractsDescription:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	BlackjackContractsDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	BlackjackContractsDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	BlackjackContractsDescription:linkToElementModel( self, "description", true, function ( model )
		local description = Engine.GetModelValue( model )
		if description then
			BlackjackContractsDescription:setText( Engine.Localize( description ) )
		end
	end )
	self:addElement( BlackjackContractsDescription )
	self.BlackjackContractsDescription = BlackjackContractsDescription
	
	local SideBetTitle = LUI.UIText.new()
	SideBetTitle:setLeftRight( true, false, 26, 311 )
	SideBetTitle:setTopBottom( true, false, 223, 242 )
	SideBetTitle:setRGB( 0.46, 0.8, 0.75 )
	SideBetTitle:setText( Engine.Localize( "MPUI_REWARDS_CAPS" ) )
	SideBetTitle:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	SideBetTitle:setLetterSpacing( -0.5 )
	SideBetTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	SideBetTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SideBetTitle )
	self.SideBetTitle = SideBetTitle
	
	local SpecialContractsStateIndicator = CoD.SpecialContracts_StateIndicator.new( menu, controller )
	SpecialContractsStateIndicator:setLeftRight( true, false, 38, 115 )
	SpecialContractsStateIndicator:setTopBottom( true, false, 151.75, 171.75 )
	SpecialContractsStateIndicator:setScale( 1.2 )
	SpecialContractsStateIndicator:linkToElementModel( self, nil, false, function ( model )
		SpecialContractsStateIndicator:setModel( model, controller )
	end )
	SpecialContractsStateIndicator:mergeStateConditions( {
		{
			stateName = "Cost",
			condition = function ( menu, element, event )
				return not IsSelfModelValueNilOrZero( element, controller, "cost" )
			end
		}
	} )
	SpecialContractsStateIndicator:linkToElementModel( SpecialContractsStateIndicator, "cost", true, function ( model )
		menu:updateElementState( SpecialContractsStateIndicator, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "cost"
		} )
	end )
	self:addElement( SpecialContractsStateIndicator )
	self.SpecialContractsStateIndicator = SpecialContractsStateIndicator
	
	local ContractProgressText = LUI.UIText.new()
	ContractProgressText:setLeftRight( true, false, 28, 319 )
	ContractProgressText:setTopBottom( true, false, 148.75, 173.75 )
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
	
	self.Reward1:linkToElementModel( self, "rewardDescription1", true, function ( model )
		local rewardDescription1 = Engine.GetModelValue( model )
		if rewardDescription1 then
			Reward1:setAlpha( HideIfEmptyString( rewardDescription1 ) )
		end
	end )
	self.Reward1:linkToElementModel( self, "rewardDescription1", true, function ( model )
		local rewardDescription1 = Engine.GetModelValue( model )
		if rewardDescription1 then
			Reward1:setText( Engine.Localize( rewardDescription1 ) )
		end
	end )
	self.Reward2:linkToElementModel( self, "rewardDescription2", true, function ( model )
		local rewardDescription2 = Engine.GetModelValue( model )
		if rewardDescription2 then
			Reward2:setAlpha( HideIfEmptyString( rewardDescription2 ) )
		end
	end )
	self.Reward2:linkToElementModel( self, "rewardDescription2", true, function ( model )
		local rewardDescription2 = Engine.GetModelValue( model )
		if rewardDescription2 then
			Reward2:setText( Engine.Localize( rewardDescription2 ) )
		end
	end )
	self.Reward3:linkToElementModel( self, "rewardDescription3", true, function ( model )
		local rewardDescription3 = Engine.GetModelValue( model )
		if rewardDescription3 then
			Reward3:setAlpha( HideIfEmptyString( rewardDescription3 ) )
		end
	end )
	self.Reward3:linkToElementModel( self, "rewardDescription3", true, function ( model )
		local rewardDescription3 = Engine.GetModelValue( model )
		if rewardDescription3 then
			Reward3:setText( Engine.Localize( rewardDescription3 ) )
		end
	end )
	self.SpecialContractsStateIndicator:linkToElementModel( self, "cost", true, function ( model )
		local cost = Engine.GetModelValue( model )
		if cost then
			SpecialContractsStateIndicator.ContractDesc0:setText( Engine.Localize( cost ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				SpecialContractsStateIndicator:completeAnimation()
				self.SpecialContractsStateIndicator:setAlpha( 1 )
				self.clipFinished( SpecialContractsStateIndicator, {} )
			end
		},
		Complete = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				SpecialContractsStateIndicator:completeAnimation()
				self.SpecialContractsStateIndicator:setAlpha( 0 )
				self.clipFinished( SpecialContractsStateIndicator, {} )
			end
		},
		Active = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				SpecialContractsStateIndicator:completeAnimation()
				self.SpecialContractsStateIndicator:setAlpha( 0 )
				self.clipFinished( SpecialContractsStateIndicator, {} )
			end
		},
		Cost = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				SpecialContractsStateIndicator:completeAnimation()
				self.SpecialContractsStateIndicator:setAlpha( 1 )
				self.clipFinished( SpecialContractsStateIndicator, {} )
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
			stateName = "Cost",
			condition = function ( menu, element, event )
				return not IsSelfModelValueNilOrZero( element, controller, "cost" )
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
	self:linkToElementModel( self, "cost", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "cost"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.RewardImage:close()
		element.BMContractstimer:close()
		element.SpecialContractsStateIndicator:close()
		element.Reward1:close()
		element.Reward2:close()
		element.Reward3:close()
		element.BlackjackContractsDescription:close()
		element.ContractProgressText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

