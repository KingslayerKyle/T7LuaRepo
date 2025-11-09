require( "ui.uieditor.widgets.CallingCards.CallingCards_FrameWidget" )
require( "ui.uieditor.widgets.BlackMarket.BM_Contracts_PercentCompleteWidget" )

CoD.SpecialContracts_CallingCardContracts_MasterCardWidget = InheritFrom( LUI.UIElement )
CoD.SpecialContracts_CallingCardContracts_MasterCardWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SpecialContracts_CallingCardContracts_MasterCardWidget )
	self.id = "SpecialContracts_CallingCardContracts_MasterCardWidget"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 754 )
	self:setTopBottom( true, false, 0, 98 )
	self.anyChildUsesUpdateState = true
	
	local Gradient = LUI.UIImage.new()
	Gradient:setLeftRight( true, true, 1.91, -1.91 )
	Gradient:setTopBottom( true, true, 2.58, -3.58 )
	Gradient:setAlpha( 0.5 )
	Gradient:setImage( RegisterImage( "uie_t7_blackmarket_contracts_special_gradient" ) )
	Gradient:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	Gradient:setShaderVector( 0, 0.02, 0.5, 0, 0 )
	Gradient:setupNineSliceShader( 18, 46 )
	self:addElement( Gradient )
	self.Gradient = Gradient
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, true, 1.91, -1.91 )
	Background:setTopBottom( true, true, 0.97, -2.58 )
	Background:setImage( RegisterImage( "uie_t7_blackmarket_contracts_bigframe" ) )
	Background:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	Background:setShaderVector( 0, 0.06, 0.49, 0, 0 )
	Background:setupNineSliceShader( 46, 46 )
	self:addElement( Background )
	self.Background = Background
	
	local MasterCallingCardIcon = CoD.CallingCards_FrameWidget.new( menu, controller )
	MasterCallingCardIcon:setLeftRight( false, true, -172, -172 )
	MasterCallingCardIcon:setTopBottom( true, false, 48.5, 48.5 )
	MasterCallingCardIcon:setScale( 0.98 )
	MasterCallingCardIcon.CardIconFrame:setScale( 0.68 )
	MasterCallingCardIcon:linkToElementModel( self, nil, false, function ( model )
		MasterCallingCardIcon:setModel( model, controller )
	end )
	self:addElement( MasterCallingCardIcon )
	self.MasterCallingCardIcon = MasterCallingCardIcon
	
	local black = LUI.UIImage.new()
	black:setLeftRight( false, true, -330.58, -13.25 )
	black:setTopBottom( true, false, 46.25, 49.25 )
	black:setRGB( 0, 0, 0 )
	self:addElement( black )
	self.black = black
	
	local Lock = LUI.UIImage.new()
	Lock:setLeftRight( false, true, -182.58, -150.58 )
	Lock:setTopBottom( true, false, 31.97, 63.97 )
	Lock:setImage( RegisterImage( "uie_t7_blackmarket_contract_callingcard_lock" ) )
	self:addElement( Lock )
	self.Lock = Lock
	
	local BackgroundCompleted = LUI.UIImage.new()
	BackgroundCompleted:setLeftRight( true, true, 1.91, -1.91 )
	BackgroundCompleted:setTopBottom( true, true, 0.97, -2.58 )
	BackgroundCompleted:setAlpha( 0 )
	BackgroundCompleted:setImage( RegisterImage( "uie_t7_blackmarket_contracts_bigframe_completed" ) )
	BackgroundCompleted:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	BackgroundCompleted:setShaderVector( 0, 0.07, 0.59, 0, 0 )
	BackgroundCompleted:setupNineSliceShader( 56, 56 )
	self:addElement( BackgroundCompleted )
	self.BackgroundCompleted = BackgroundCompleted
	
	local SpecialContractPercentCompleteWidget = CoD.BM_Contracts_PercentCompleteWidget.new( menu, controller )
	SpecialContractPercentCompleteWidget:setLeftRight( true, false, 20.5, 110.5 )
	SpecialContractPercentCompleteWidget:setTopBottom( true, false, 2.97, 92.97 )
	SpecialContractPercentCompleteWidget:linkToElementModel( self, nil, false, function ( model )
		SpecialContractPercentCompleteWidget:setModel( model, controller )
	end )
	SpecialContractPercentCompleteWidget:linkToElementModel( self, "percentComplete", true, function ( model )
		local percentComplete = Engine.GetModelValue( model )
		if percentComplete then
			SpecialContractPercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, percentComplete ) )
		end
	end )
	SpecialContractPercentCompleteWidget:linkToElementModel( self, "percentComplete", true, function ( model )
		local percentComplete = Engine.GetModelValue( model )
		if percentComplete then
			SpecialContractPercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( percentComplete, 1 ), CoD.GetVectorComponentFromString( percentComplete, 2 ), CoD.GetVectorComponentFromString( percentComplete, 3 ), CoD.GetVectorComponentFromString( percentComplete, 4 ) )
		end
	end )
	SpecialContractPercentCompleteWidget:linkToElementModel( self, "fractionText", true, function ( model )
		local fractionText = Engine.GetModelValue( model )
		if fractionText then
			SpecialContractPercentCompleteWidget.percentText:setText( Engine.Localize( fractionText ) )
		end
	end )
	SpecialContractPercentCompleteWidget:mergeStateConditions( {
		{
			stateName = "Complete",
			condition = function ( menu, element, event )
				return not IsSelfModelValueTrue( element, controller, "isLocked" )
			end
		}
	} )
	SpecialContractPercentCompleteWidget:linkToElementModel( SpecialContractPercentCompleteWidget, "isLocked", true, function ( model )
		menu:updateElementState( SpecialContractPercentCompleteWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isLocked"
		} )
	end )
	self:addElement( SpecialContractPercentCompleteWidget )
	self.SpecialContractPercentCompleteWidget = SpecialContractPercentCompleteWidget
	
	local SpecialContractName = LUI.UIText.new()
	SpecialContractName:setLeftRight( true, false, 115.51, 407.01 )
	SpecialContractName:setTopBottom( true, false, 25, 43.5 )
	SpecialContractName:setRGB( 0.46, 0.8, 0.75 )
	SpecialContractName:setText( Engine.Localize( "CONTRACT_MASTERY_CARD_TITLE" ) )
	SpecialContractName:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	SpecialContractName:setLetterSpacing( -0.5 )
	SpecialContractName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	SpecialContractName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SpecialContractName )
	self.SpecialContractName = SpecialContractName
	
	local SpecialContractDesc = LUI.UIText.new()
	SpecialContractDesc:setLeftRight( true, false, 115.51, 407.01 )
	SpecialContractDesc:setTopBottom( true, false, 44, 62 )
	SpecialContractDesc:setRGB( 0.88, 0.88, 0.88 )
	SpecialContractDesc:setText( Engine.Localize( "CONTRACT_MASTERY_CARD_DESC" ) )
	SpecialContractDesc:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	SpecialContractDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	SpecialContractDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SpecialContractDesc )
	self.SpecialContractDesc = SpecialContractDesc
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				MasterCallingCardIcon:completeAnimation()
				self.MasterCallingCardIcon:setAlpha( 1 )
				self.clipFinished( MasterCallingCardIcon, {} )
				black:completeAnimation()
				self.black:setAlpha( 0 )
				self.clipFinished( black, {} )
				Lock:completeAnimation()
				self.Lock:setAlpha( 0 )
				self.clipFinished( Lock, {} )
				SpecialContractDesc:completeAnimation()
				self.SpecialContractDesc:setText( Engine.Localize( "CONTRACT_MASTERY_CARD_COMPLETE" ) )
				self.clipFinished( SpecialContractDesc, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				MasterCallingCardIcon:completeAnimation()
				self.MasterCallingCardIcon:setAlpha( 0.3 )
				self.clipFinished( MasterCallingCardIcon, {} )
				black:completeAnimation()
				self.black:setAlpha( 1 )
				self.clipFinished( black, {} )
				Lock:completeAnimation()
				self.Lock:setAlpha( 1 )
				self.clipFinished( Lock, {} )
				SpecialContractDesc:completeAnimation()
				self.SpecialContractDesc:setText( Engine.Localize( "CONTRACT_MASTERY_CARD_DESC" ) )
				self.clipFinished( SpecialContractDesc, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isLocked" )
			end
		}
	} )
	self:linkToElementModel( self, "isLocked", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isLocked"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.MasterCallingCardIcon:close()
		element.SpecialContractPercentCompleteWidget:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

