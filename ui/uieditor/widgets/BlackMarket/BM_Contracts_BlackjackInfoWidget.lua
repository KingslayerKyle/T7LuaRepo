-- 606c714b444fff4c497befb3acf2a687
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BlackMarket.BM_Contracts_ContractAmountWidget" )
require( "ui.uieditor.widgets.BlackMarket.BM_Contracts_BJ_ActivatedWidget" )
require( "ui.uieditor.widgets.BlackMarket.BM_Contracts_CC_Widget" )
require( "ui.uieditor.widgets.BlackMarket.BM_Contracts_BJ_ReadyWidget" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )

	LUI.OverrideFunction_CallOriginalFirst( f1_arg0, "setState", function ( element, controller )
		DataSources.SideBetCurrentChallenge.getModel( f1_arg1 )
	end )
end

CoD.BM_Contracts_BlackjackInfoWidget = InheritFrom( LUI.UIElement )
CoD.BM_Contracts_BlackjackInfoWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BM_Contracts_BlackjackInfoWidget )
	self.id = "BM_Contracts_BlackjackInfoWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 417 )
	self:setTopBottom( true, false, 0, 518 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local Gradient = LUI.UIImage.new()
	Gradient:setLeftRight( true, false, 3.16, 410.84 )
	Gradient:setTopBottom( true, false, 3.59, 516.41 )
	Gradient:setAlpha( 0.5 )
	Gradient:setImage( RegisterImage( "uie_t7_blackmarket_contracts_blackjack_gradient" ) )
	Gradient:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	Gradient:setShaderVector( 0, 0.05, 0.45, 0, 0 )
	Gradient:setupNineSliceShader( 20, 232 )
	self:addElement( Gradient )
	self.Gradient = Gradient
	
	local BlackjackIconOff = LUI.UIImage.new()
	BlackjackIconOff:setLeftRight( false, true, -417, -9.16 )
	BlackjackIconOff:setTopBottom( false, true, -486, -6.19 )
	BlackjackIconOff:setAlpha( 0 )
	BlackjackIconOff:setImage( RegisterImage( "uie_t7_blackmarket_contracts_blackjack_off" ) )
	self:addElement( BlackjackIconOff )
	self.BlackjackIconOff = BlackjackIconOff
	
	local BlackjackIconOn = LUI.UIImage.new()
	BlackjackIconOn:setLeftRight( false, true, -417, -9.16 )
	BlackjackIconOn:setTopBottom( false, true, -486, -6.19 )
	BlackjackIconOn:setImage( RegisterImage( "uie_t7_blackmarket_contracts_blackjack_completed" ) )
	self:addElement( BlackjackIconOn )
	self.BlackjackIconOn = BlackjackIconOn
	
	local header = LUI.UIImage.new()
	header:setLeftRight( true, false, 3.16, 410.22 )
	header:setTopBottom( true, false, 3.29, 44.06 )
	header:setImage( RegisterImage( "uie_t7_blackmarket_contracts_blackjack" ) )
	self:addElement( header )
	self.header = header
	
	local BackgroundCompleted = LUI.UIImage.new()
	BackgroundCompleted:setLeftRight( true, true, 2.16, -6.16 )
	BackgroundCompleted:setTopBottom( true, true, 4, -3 )
	BackgroundCompleted:setAlpha( 0 )
	BackgroundCompleted:setImage( RegisterImage( "uie_t7_blackmarket_contracts_bigframe_completed" ) )
	BackgroundCompleted:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	BackgroundCompleted:setShaderVector( 0, 0.14, 0.11, 0, 0 )
	BackgroundCompleted:setupNineSliceShader( 56, 56 )
	self:addElement( BackgroundCompleted )
	self.BackgroundCompleted = BackgroundCompleted
	
	local Background0 = LUI.UIImage.new()
	Background0:setLeftRight( true, true, 2.16, -6.16 )
	Background0:setTopBottom( true, true, 4, -3 )
	Background0:setImage( RegisterImage( "uie_t7_blackmarket_contracts_bigframe" ) )
	Background0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	Background0:setShaderVector( 0, 0.14, 0.11, 0, 0 )
	Background0:setupNineSliceShader( 56, 56 )
	self:addElement( Background0 )
	self.Background0 = Background0
	
	local Divider0 = LUI.UIImage.new()
	Divider0:setLeftRight( true, false, 19.75, 259.75 )
	Divider0:setTopBottom( true, false, 260.5, 268.49 )
	Divider0:setImage( RegisterImage( "uie_t7_blackmarket_contract_divider" ) )
	Divider0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	Divider0:setShaderVector( 0, 0.04, 0.5, 0, 0 )
	Divider0:setupNineSliceShader( 10, 4 )
	self:addElement( Divider0 )
	self.Divider0 = Divider0
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( true, false, 18.5, 266 )
	Title:setTopBottom( true, false, 14.56, 33.56 )
	Title:setRGB( 0.94, 0.89, 0.59 )
	Title:setText( Engine.Localize( "MPUI_BM_CONTRACT_BLACKJACK" ) )
	Title:setTTF( "fonts/escom.ttf" )
	Title:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	Title:setShaderVector( 0, 0.03, 0, 0, 0 )
	Title:setShaderVector( 1, 0.06, 0, 0, 0 )
	Title:setShaderVector( 2, 1, 0, 0, 0 )
	Title:setLetterSpacing( 1.8 )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Title )
	self.Title = Title
	
	local ContractLabel = LUI.UIText.new()
	ContractLabel:setLeftRight( true, false, 25, LanguageOverrideNumber( "arabic", 225, 292.5 ) )
	ContractLabel:setTopBottom( true, false, 55.06, 75.06 )
	ContractLabel:setRGB( 0.46, 0.8, 0.75 )
	ContractLabel:setText( Engine.Localize( "FEATURE_CONTRACTS_CAPS" ) )
	ContractLabel:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	ContractLabel:setLetterSpacing( -0.5 )
	ContractLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ContractLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ContractLabel )
	self.ContractLabel = ContractLabel
	
	local BlackjackContractsDescription = LUI.UIText.new()
	BlackjackContractsDescription:setLeftRight( true, false, 26.25, 224.75 )
	BlackjackContractsDescription:setTopBottom( true, false, 151.19, 169.19 )
	BlackjackContractsDescription:setRGB( 0.88, 0.88, 0.88 )
	BlackjackContractsDescription:setText( Engine.Localize( "MPUI_BM_CONTRACT_BLACKJACK_CONTRACTS_DESC" ) )
	BlackjackContractsDescription:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	BlackjackContractsDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	BlackjackContractsDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( BlackjackContractsDescription )
	self.BlackjackContractsDescription = BlackjackContractsDescription
	
	local SideBetTitle = LUI.UIText.new()
	SideBetTitle:setLeftRight( true, false, 20.25, 267.75 )
	SideBetTitle:setTopBottom( true, false, 280.5, 299.5 )
	SideBetTitle:setRGB( 0.46, 0.8, 0.75 )
	SideBetTitle:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	SideBetTitle:setLetterSpacing( -0.5 )
	SideBetTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	SideBetTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	SideBetTitle:subscribeToGlobalModel( controller, "SideBetCurrentChallenge", "title", function ( model )
		local title = Engine.GetModelValue( model )
		if title then
			SideBetTitle:setText( ConvertToUpperString( title ) )
		end
	end )
	self:addElement( SideBetTitle )
	self.SideBetTitle = SideBetTitle
	
	local BMContractsContractAmountWidget = CoD.BM_Contracts_ContractAmountWidget.new( menu, controller )
	BMContractsContractAmountWidget:setLeftRight( true, false, 22.5, 218.5 )
	BMContractsContractAmountWidget:setTopBottom( true, false, 69.19, 149.19 )
	self:addElement( BMContractsContractAmountWidget )
	self.BMContractsContractAmountWidget = BMContractsContractAmountWidget
	
	local BMContractsBJActivatedWidget = CoD.BM_Contracts_BJ_ActivatedWidget.new( menu, controller )
	BMContractsBJActivatedWidget:setLeftRight( true, false, 7.75, 271.75 )
	BMContractsBJActivatedWidget:setTopBottom( true, false, 223.5, 247.5 )
	BMContractsBJActivatedWidget.BMContractsBJTextWidget.Activated:setText( Engine.Localize( "MENU_ACTIVATED_CAPS" ) )
	BMContractsBJActivatedWidget:subscribeToGlobalModel( controller, "SideBetCurrentChallenge", "timeSeconds", function ( model )
		local timeSeconds = Engine.GetModelValue( model )
		if timeSeconds then
			BMContractsBJActivatedWidget.BMContractsBJTextWidget.TimeRemaining0:setText( LocalizeIntoString( "MPUI_BM_CONTRACTS_TIME_REMAINING", SecondsAsTime( timeSeconds ) ) )
		end
	end )
	self:addElement( BMContractsBJActivatedWidget )
	self.BMContractsBJActivatedWidget = BMContractsBJActivatedWidget
	
	local BMContractsCCWidget = CoD.BM_Contracts_CC_Widget.new( menu, controller )
	BMContractsCCWidget:setLeftRight( true, false, -33, 317 )
	BMContractsCCWidget:setTopBottom( true, false, 290.73, 495.73 )
	BMContractsCCWidget:subscribeToGlobalModel( controller, "SideBetCurrentChallenge", nil, function ( model )
		BMContractsCCWidget:setModel( model, controller )
	end )
	BMContractsCCWidget:subscribeToGlobalModel( controller, "SideBetCurrentChallenge", "setCount", function ( model )
		local setCount = Engine.GetModelValue( model )
		if setCount then
			BMContractsCCWidget.text:setText( Engine.Localize( setCount ) )
		end
	end )
	self:addElement( BMContractsCCWidget )
	self.BMContractsCCWidget = BMContractsCCWidget
	
	local NineSliceShaderImage = LUI.UIImage.new()
	NineSliceShaderImage:setLeftRight( true, true, -4, 0 )
	NineSliceShaderImage:setTopBottom( true, true, -2.54, 4 )
	NineSliceShaderImage:setImage( RegisterImage( "uie_t7_bm_contracts_hover_9slice" ) )
	NineSliceShaderImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	NineSliceShaderImage:setShaderVector( 0, 0.11, 0.09, 0, 0 )
	NineSliceShaderImage:setupNineSliceShader( 48, 48 )
	self:addElement( NineSliceShaderImage )
	self.NineSliceShaderImage = NineSliceShaderImage
	
	local upperglow = LUI.UIImage.new()
	upperglow:setLeftRight( false, false, -126.13, 122.13 )
	upperglow:setTopBottom( true, false, -15.77, 32.28 )
	upperglow:setImage( RegisterImage( "uie_t7_bm_contracts_hover_upperglow" ) )
	self:addElement( upperglow )
	self.upperglow = upperglow
	
	local lowerglow = LUI.UIImage.new()
	lowerglow:setLeftRight( false, false, -99, 85 )
	lowerglow:setTopBottom( false, true, -6.75, 33.25 )
	lowerglow:setImage( RegisterImage( "uie_t7_bm_contracts_hover_lowerglow" ) )
	self:addElement( lowerglow )
	self.lowerglow = lowerglow
	
	local BMContractsBJReadyWidget = CoD.BM_Contracts_BJ_ReadyWidget.new( menu, controller )
	BMContractsBJReadyWidget:setLeftRight( true, false, 7.75, 201.75 )
	BMContractsBJReadyWidget:setTopBottom( true, false, 223.5, 247.5 )
	BMContractsBJReadyWidget:setAlpha( 0 )
	BMContractsBJReadyWidget.Activated:setText( LocalizeToUpperString( "MPUI_BM_CONTRACT_BLACKJACK_READY_DESC" ) )
	self:addElement( BMContractsBJReadyWidget )
	self.BMContractsBJReadyWidget = BMContractsBJReadyWidget
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )

				BlackjackIconOff:completeAnimation()
				self.BlackjackIconOff:setAlpha( 1 )
				self.clipFinished( BlackjackIconOff, {} )

				BlackjackIconOn:completeAnimation()
				self.BlackjackIconOn:setAlpha( 0 )
				self.clipFinished( BlackjackIconOn, {} )

				BackgroundCompleted:completeAnimation()
				self.BackgroundCompleted:setAlpha( 0 )
				self.clipFinished( BackgroundCompleted, {} )

				Background0:completeAnimation()
				self.Background0:setAlpha( 1 )
				self.clipFinished( Background0, {} )

				Divider0:completeAnimation()
				self.Divider0:setAlpha( 0 )
				self.clipFinished( Divider0, {} )

				SideBetTitle:completeAnimation()
				self.SideBetTitle:setAlpha( 0 )
				self.clipFinished( SideBetTitle, {} )

				BMContractsBJActivatedWidget:completeAnimation()
				self.BMContractsBJActivatedWidget:setAlpha( 0 )
				self.clipFinished( BMContractsBJActivatedWidget, {} )

				BMContractsCCWidget:completeAnimation()
				self.BMContractsCCWidget:setAlpha( 0 )
				self.clipFinished( BMContractsCCWidget, {} )

				NineSliceShaderImage:completeAnimation()
				self.NineSliceShaderImage:setAlpha( 0 )
				self.clipFinished( NineSliceShaderImage, {} )

				upperglow:completeAnimation()
				self.upperglow:setAlpha( 0 )
				self.clipFinished( upperglow, {} )

				lowerglow:completeAnimation()
				self.lowerglow:setAlpha( 0 )
				self.clipFinished( lowerglow, {} )

				BMContractsBJReadyWidget:completeAnimation()
				self.BMContractsBJReadyWidget:setAlpha( 1 )
				self.clipFinished( BMContractsBJReadyWidget, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 12 )

				BlackjackIconOff:completeAnimation()
				self.BlackjackIconOff:setAlpha( 1 )
				self.clipFinished( BlackjackIconOff, {} )

				BlackjackIconOn:completeAnimation()
				self.BlackjackIconOn:setAlpha( 0 )
				self.clipFinished( BlackjackIconOn, {} )

				BackgroundCompleted:completeAnimation()
				self.BackgroundCompleted:setAlpha( 0 )
				self.clipFinished( BackgroundCompleted, {} )

				Background0:completeAnimation()
				self.Background0:setAlpha( 1 )
				self.clipFinished( Background0, {} )

				Divider0:completeAnimation()
				self.Divider0:setAlpha( 0 )
				self.clipFinished( Divider0, {} )

				SideBetTitle:completeAnimation()
				self.SideBetTitle:setAlpha( 0 )
				self.clipFinished( SideBetTitle, {} )

				BMContractsBJActivatedWidget:completeAnimation()
				self.BMContractsBJActivatedWidget:setAlpha( 0 )
				self.clipFinished( BMContractsBJActivatedWidget, {} )

				BMContractsCCWidget:completeAnimation()
				self.BMContractsCCWidget:setAlpha( 0 )
				self.clipFinished( BMContractsCCWidget, {} )
				local NineSliceShaderImageFrame2 = function ( NineSliceShaderImage, event )
					local NineSliceShaderImageFrame3 = function ( NineSliceShaderImage, event )
						if not event.interrupted then
							NineSliceShaderImage:beginAnimation( "keyframe", 799, false, false, CoD.TweenType.Linear )
						end
						NineSliceShaderImage:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( NineSliceShaderImage, event )
						else
							NineSliceShaderImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						NineSliceShaderImageFrame3( NineSliceShaderImage, event )
						return 
					else
						NineSliceShaderImage:beginAnimation( "keyframe", 740, false, false, CoD.TweenType.Linear )
						NineSliceShaderImage:setAlpha( 0.8 )
						NineSliceShaderImage:registerEventHandler( "transition_complete_keyframe", NineSliceShaderImageFrame3 )
					end
				end
				
				NineSliceShaderImage:completeAnimation()
				self.NineSliceShaderImage:setAlpha( 1 )
				NineSliceShaderImageFrame2( NineSliceShaderImage, {} )
				local upperglowFrame2 = function ( upperglow, event )
					local upperglowFrame3 = function ( upperglow, event )
						if not event.interrupted then
							upperglow:beginAnimation( "keyframe", 799, false, false, CoD.TweenType.Linear )
						end
						upperglow:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( upperglow, event )
						else
							upperglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						upperglowFrame3( upperglow, event )
						return 
					else
						upperglow:beginAnimation( "keyframe", 740, false, false, CoD.TweenType.Linear )
						upperglow:setAlpha( 0.5 )
						upperglow:registerEventHandler( "transition_complete_keyframe", upperglowFrame3 )
					end
				end
				
				upperglow:completeAnimation()
				self.upperglow:setAlpha( 1 )
				upperglowFrame2( upperglow, {} )
				local lowerglowFrame2 = function ( lowerglow, event )
					local lowerglowFrame3 = function ( lowerglow, event )
						if not event.interrupted then
							lowerglow:beginAnimation( "keyframe", 799, false, false, CoD.TweenType.Linear )
						end
						lowerglow:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( lowerglow, event )
						else
							lowerglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						lowerglowFrame3( lowerglow, event )
						return 
					else
						lowerglow:beginAnimation( "keyframe", 740, false, false, CoD.TweenType.Linear )
						lowerglow:setAlpha( 0.5 )
						lowerglow:registerEventHandler( "transition_complete_keyframe", lowerglowFrame3 )
					end
				end
				
				lowerglow:completeAnimation()
				self.lowerglow:setAlpha( 1 )
				lowerglowFrame2( lowerglow, {} )

				BMContractsBJReadyWidget:completeAnimation()
				self.BMContractsBJReadyWidget:setAlpha( 1 )
				self.clipFinished( BMContractsBJReadyWidget, {} )

				self.nextClip = "Focus"
			end
		},
		Activated = {
			DefaultClip = function ()
				self:setupElementClipCounter( 15 )

				BlackjackIconOff:completeAnimation()
				self.BlackjackIconOff:setAlpha( 0 )
				self.clipFinished( BlackjackIconOff, {} )

				BlackjackIconOn:completeAnimation()
				self.BlackjackIconOn:setAlpha( 1 )
				self.clipFinished( BlackjackIconOn, {} )

				header:completeAnimation()
				self.header:setAlpha( 1 )
				self.clipFinished( header, {} )

				BackgroundCompleted:completeAnimation()
				self.BackgroundCompleted:setAlpha( 0 )
				self.clipFinished( BackgroundCompleted, {} )

				Background0:completeAnimation()
				self.Background0:setAlpha( 1 )
				self.clipFinished( Background0, {} )

				Divider0:completeAnimation()
				self.Divider0:setAlpha( 1 )
				self.clipFinished( Divider0, {} )

				BlackjackContractsDescription:completeAnimation()
				self.BlackjackContractsDescription:setAlpha( 1 )
				self.clipFinished( BlackjackContractsDescription, {} )

				SideBetTitle:completeAnimation()
				self.SideBetTitle:setAlpha( 1 )
				self.clipFinished( SideBetTitle, {} )

				BMContractsContractAmountWidget:completeAnimation()
				self.BMContractsContractAmountWidget:setAlpha( 1 )
				self.clipFinished( BMContractsContractAmountWidget, {} )

				BMContractsBJActivatedWidget:completeAnimation()
				self.BMContractsBJActivatedWidget:setAlpha( 1 )
				self.clipFinished( BMContractsBJActivatedWidget, {} )

				BMContractsCCWidget:completeAnimation()
				self.BMContractsCCWidget:setAlpha( 1 )
				self.clipFinished( BMContractsCCWidget, {} )

				NineSliceShaderImage:completeAnimation()
				self.NineSliceShaderImage:setAlpha( 0 )
				self.clipFinished( NineSliceShaderImage, {} )

				upperglow:completeAnimation()
				self.upperglow:setAlpha( 0 )
				self.clipFinished( upperglow, {} )

				lowerglow:completeAnimation()
				self.lowerglow:setAlpha( 0 )
				self.clipFinished( lowerglow, {} )

				BMContractsBJReadyWidget:completeAnimation()
				self.BMContractsBJReadyWidget:setAlpha( 0 )
				self.clipFinished( BMContractsBJReadyWidget, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 15 )

				BlackjackIconOff:completeAnimation()
				self.BlackjackIconOff:setAlpha( 0 )
				self.clipFinished( BlackjackIconOff, {} )

				BlackjackIconOn:completeAnimation()
				self.BlackjackIconOn:setAlpha( 1 )
				self.clipFinished( BlackjackIconOn, {} )

				header:completeAnimation()
				self.header:setAlpha( 1 )
				self.clipFinished( header, {} )

				BackgroundCompleted:completeAnimation()
				self.BackgroundCompleted:setAlpha( 0 )
				self.clipFinished( BackgroundCompleted, {} )

				Background0:completeAnimation()
				self.Background0:setAlpha( 1 )
				self.clipFinished( Background0, {} )

				Divider0:completeAnimation()
				self.Divider0:setAlpha( 1 )
				self.clipFinished( Divider0, {} )

				BlackjackContractsDescription:completeAnimation()
				self.BlackjackContractsDescription:setAlpha( 1 )
				self.clipFinished( BlackjackContractsDescription, {} )

				SideBetTitle:completeAnimation()
				self.SideBetTitle:setAlpha( 1 )
				self.clipFinished( SideBetTitle, {} )

				BMContractsContractAmountWidget:completeAnimation()
				self.BMContractsContractAmountWidget:setAlpha( 1 )
				self.clipFinished( BMContractsContractAmountWidget, {} )

				BMContractsBJActivatedWidget:completeAnimation()
				self.BMContractsBJActivatedWidget:setAlpha( 1 )
				self.clipFinished( BMContractsBJActivatedWidget, {} )

				BMContractsCCWidget:completeAnimation()
				self.BMContractsCCWidget:setAlpha( 1 )
				self.clipFinished( BMContractsCCWidget, {} )
				local NineSliceShaderImageFrame2 = function ( NineSliceShaderImage, event )
					local NineSliceShaderImageFrame3 = function ( NineSliceShaderImage, event )
						if not event.interrupted then
							NineSliceShaderImage:beginAnimation( "keyframe", 799, false, false, CoD.TweenType.Linear )
						end
						NineSliceShaderImage:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( NineSliceShaderImage, event )
						else
							NineSliceShaderImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						NineSliceShaderImageFrame3( NineSliceShaderImage, event )
						return 
					else
						NineSliceShaderImage:beginAnimation( "keyframe", 740, false, false, CoD.TweenType.Linear )
						NineSliceShaderImage:setAlpha( 0.8 )
						NineSliceShaderImage:registerEventHandler( "transition_complete_keyframe", NineSliceShaderImageFrame3 )
					end
				end
				
				NineSliceShaderImage:completeAnimation()
				self.NineSliceShaderImage:setAlpha( 1 )
				NineSliceShaderImageFrame2( NineSliceShaderImage, {} )
				local upperglowFrame2 = function ( upperglow, event )
					local upperglowFrame3 = function ( upperglow, event )
						if not event.interrupted then
							upperglow:beginAnimation( "keyframe", 799, false, false, CoD.TweenType.Linear )
						end
						upperglow:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( upperglow, event )
						else
							upperglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						upperglowFrame3( upperglow, event )
						return 
					else
						upperglow:beginAnimation( "keyframe", 740, false, false, CoD.TweenType.Linear )
						upperglow:setAlpha( 0.5 )
						upperglow:registerEventHandler( "transition_complete_keyframe", upperglowFrame3 )
					end
				end
				
				upperglow:completeAnimation()
				self.upperglow:setAlpha( 1 )
				upperglowFrame2( upperglow, {} )
				local lowerglowFrame2 = function ( lowerglow, event )
					local lowerglowFrame3 = function ( lowerglow, event )
						if not event.interrupted then
							lowerglow:beginAnimation( "keyframe", 799, false, false, CoD.TweenType.Linear )
						end
						lowerglow:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( lowerglow, event )
						else
							lowerglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						lowerglowFrame3( lowerglow, event )
						return 
					else
						lowerglow:beginAnimation( "keyframe", 740, false, false, CoD.TweenType.Linear )
						lowerglow:setAlpha( 0.5 )
						lowerglow:registerEventHandler( "transition_complete_keyframe", lowerglowFrame3 )
					end
				end
				
				lowerglow:completeAnimation()
				self.lowerglow:setAlpha( 1 )
				lowerglowFrame2( lowerglow, {} )

				BMContractsBJReadyWidget:completeAnimation()
				self.BMContractsBJReadyWidget:setAlpha( 0 )
				self.clipFinished( BMContractsBJReadyWidget, {} )

				self.nextClip = "Focus"
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Activated",
			condition = function ( menu, element, event )
				return IsBlackjackContractActive( controller )
			end
		}
	} )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BMContractsContractAmountWidget:close()
		element.BMContractsBJActivatedWidget:close()
		element.BMContractsCCWidget:close()
		element.BMContractsBJReadyWidget:close()
		element.SideBetTitle:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

