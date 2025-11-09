require( "ui.uieditor.widgets.BlackMarket.BM_Contracts_PercentCompleteWidget" )
require( "ui.uieditor.widgets.SpecialContracts.SpecialContracts_RewardImage" )
require( "ui.uieditor.widgets.BlackMarket.BM_CompleteRibbon" )

CoD.BM_Contracts_SpecialContractWidget = InheritFrom( LUI.UIElement )
CoD.BM_Contracts_SpecialContractWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BM_Contracts_SpecialContractWidget )
	self.id = "BM_Contracts_SpecialContractWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 720 )
	self:setTopBottom( true, false, 0, 180 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local Gradient = LUI.UIImage.new()
	Gradient:setLeftRight( true, false, 2.32, 718.5 )
	Gradient:setTopBottom( true, true, 3.17, -3 )
	Gradient:setAlpha( 0.5 )
	Gradient:setImage( RegisterImage( "uie_t7_blackmarket_contracts_special_gradient" ) )
	Gradient:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	Gradient:setShaderVector( 0, 0.03, 0.35, 0, 0 )
	Gradient:setupNineSliceShader( 18, 60 )
	self:addElement( Gradient )
	self.Gradient = Gradient
	
	local header = LUI.UIImage.new()
	header:setLeftRight( true, false, 1, 721 )
	header:setTopBottom( true, false, 1.56, 41.56 )
	header:setImage( RegisterImage( "uie_t7_blackmarket_contracts_special" ) )
	self:addElement( header )
	self.header = header
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, true, 2.32, -1.5 )
	Background:setTopBottom( true, true, 2.11, -2 )
	Background:setImage( RegisterImage( "uie_t7_blackmarket_contracts_bigframe" ) )
	Background:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	Background:setShaderVector( 0, 0.08, 0.32, 0, 0 )
	Background:setupNineSliceShader( 56, 56 )
	self:addElement( Background )
	self.Background = Background
	
	local BackgroundCompleted = LUI.UIImage.new()
	BackgroundCompleted:setLeftRight( true, true, 2.32, -1.5 )
	BackgroundCompleted:setTopBottom( true, true, 1.56, -2 )
	BackgroundCompleted:setAlpha( 0 )
	BackgroundCompleted:setImage( RegisterImage( "uie_t7_blackmarket_contracts_bigframe_completed" ) )
	BackgroundCompleted:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	BackgroundCompleted:setShaderVector( 0, 0.08, 0.32, 0, 0 )
	BackgroundCompleted:setupNineSliceShader( 56, 56 )
	self:addElement( BackgroundCompleted )
	self.BackgroundCompleted = BackgroundCompleted
	
	local DividerVertical = LUI.UIImage.new()
	DividerVertical:setLeftRight( true, false, 403.5, 504.5 )
	DividerVertical:setTopBottom( true, false, 100.56, 108.55 )
	DividerVertical:setZRot( 90 )
	DividerVertical:setImage( RegisterImage( "uie_t7_blackmarket_contract_divider" ) )
	DividerVertical:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	DividerVertical:setShaderVector( 0, 0.1, 0.5, 0, 0 )
	DividerVertical:setupNineSliceShader( 10, 4 )
	self:addElement( DividerVertical )
	self.DividerVertical = DividerVertical
	
	local DividerHorizontal = LUI.UIImage.new()
	DividerHorizontal:setLeftRight( true, false, 107.5, 311 )
	DividerHorizontal:setTopBottom( true, false, 107.25, 115.24 )
	DividerHorizontal:setAlpha( 0 )
	DividerHorizontal:setImage( RegisterImage( "uie_t7_blackmarket_contract_divider" ) )
	DividerHorizontal:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	DividerHorizontal:setShaderVector( 0, 0.05, 0.5, 0, 0 )
	DividerHorizontal:setupNineSliceShader( 10, 4 )
	self:addElement( DividerHorizontal )
	self.DividerHorizontal = DividerHorizontal
	
	local SpecialContractPercentCompleteWidget = CoD.BM_Contracts_PercentCompleteWidget.new( menu, controller )
	SpecialContractPercentCompleteWidget:setLeftRight( true, false, 35.5, 125.5 )
	SpecialContractPercentCompleteWidget:setTopBottom( true, false, 58.56, 148.56 )
	SpecialContractPercentCompleteWidget:setScale( 1.2 )
	SpecialContractPercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, 0.5, 0, 0, 0 )
	SpecialContractPercentCompleteWidget.percentText:setText( Engine.Localize( "888/888" ) )
	SpecialContractPercentCompleteWidget:subscribeToGlobalModel( controller, "CurrentSpecialContract", nil, function ( model )
		SpecialContractPercentCompleteWidget:setModel( model, controller )
	end )
	SpecialContractPercentCompleteWidget:mergeStateConditions( {
		{
			stateName = "Complete",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isComplete" )
			end
		}
	} )
	SpecialContractPercentCompleteWidget:linkToElementModel( SpecialContractPercentCompleteWidget, "isComplete", true, function ( model )
		menu:updateElementState( SpecialContractPercentCompleteWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isComplete"
		} )
	end )
	self:addElement( SpecialContractPercentCompleteWidget )
	self.SpecialContractPercentCompleteWidget = SpecialContractPercentCompleteWidget
	
	local SpecialContractName = LUI.UIText.new()
	SpecialContractName:setLeftRight( true, false, 143.25, 445 )
	SpecialContractName:setTopBottom( true, false, 75.06, 94.06 )
	SpecialContractName:setRGB( 0.46, 0.8, 0.75 )
	SpecialContractName:setText( LocalizeToUpperString( "MPUI_CONTRACTS_SPECIAL_TITLE_CAPS" ) )
	SpecialContractName:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	SpecialContractName:setLetterSpacing( -0.5 )
	SpecialContractName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	SpecialContractName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SpecialContractName )
	self.SpecialContractName = SpecialContractName
	
	local SpecialContractDesc = LUI.UIText.new()
	SpecialContractDesc:setLeftRight( true, false, 143.25, 445 )
	SpecialContractDesc:setTopBottom( true, false, 94.06, 112.06 )
	SpecialContractDesc:setRGB( 0.88, 0.88, 0.88 )
	SpecialContractDesc:setText( "" )
	SpecialContractDesc:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	SpecialContractDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	SpecialContractDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SpecialContractDesc )
	self.SpecialContractDesc = SpecialContractDesc
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( true, false, 19.5, 311 )
	Title:setTopBottom( true, false, 12.06, 31.06 )
	Title:setRGB( 0.94, 0.89, 0.59 )
	Title:setText( Engine.Localize( "MPUI_BM_CONTRACT_SPECIAL" ) )
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
	
	local upperglow = LUI.UIImage.new()
	upperglow:setLeftRight( false, false, -126.13, 122.13 )
	upperglow:setTopBottom( true, false, -17.77, 30.28 )
	upperglow:setAlpha( 0 )
	upperglow:setImage( RegisterImage( "uie_t7_bm_contracts_hover_upperglow" ) )
	self:addElement( upperglow )
	self.upperglow = upperglow
	
	local lowerglow = LUI.UIImage.new()
	lowerglow:setLeftRight( false, false, -99, 85 )
	lowerglow:setTopBottom( false, true, -6.75, 33.25 )
	lowerglow:setAlpha( 0 )
	lowerglow:setImage( RegisterImage( "uie_t7_bm_contracts_hover_lowerglow" ) )
	self:addElement( lowerglow )
	self.lowerglow = lowerglow
	
	local RewardImage = CoD.SpecialContracts_RewardImage.new( menu, controller )
	RewardImage:setLeftRight( true, false, 489.04, 677.04 )
	RewardImage:setTopBottom( true, false, 52.25, 156.25 )
	RewardImage.CallingCard.CardIconFrame:setScale( 0.49 )
	RewardImage:subscribeToGlobalModel( controller, "CurrentSpecialContract", nil, function ( model )
		RewardImage:setModel( model, controller )
	end )
	RewardImage:subscribeToGlobalModel( controller, "CurrentSpecialContract", "image", function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			RewardImage.ItemImage:setImage( RegisterImage( image ) )
		end
	end )
	self:addElement( RewardImage )
	self.RewardImage = RewardImage
	
	local NineSliceShaderImage = LUI.UIImage.new()
	NineSliceShaderImage:setLeftRight( true, true, -5, 5 )
	NineSliceShaderImage:setTopBottom( true, true, -4.54, 4 )
	NineSliceShaderImage:setImage( RegisterImage( "uie_t7_bm_contracts_hover_9slice" ) )
	NineSliceShaderImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	NineSliceShaderImage:setShaderVector( 0, 0.07, 0.25, 0, 0 )
	NineSliceShaderImage:setupNineSliceShader( 48, 48 )
	self:addElement( NineSliceShaderImage )
	self.NineSliceShaderImage = NineSliceShaderImage
	
	local CompletedIcon = LUI.UIImage.new()
	CompletedIcon:setLeftRight( false, true, -48, 1 )
	CompletedIcon:setTopBottom( true, false, 5, 37 )
	CompletedIcon:setImage( RegisterImage( "uie_t7_bm_contracts_completed_ribbon" ) )
	self:addElement( CompletedIcon )
	self.CompletedIcon = CompletedIcon
	
	local BMCompleteRibbon = CoD.BM_CompleteRibbon.new( menu, controller )
	BMCompleteRibbon:setLeftRight( false, true, -145.46, -40.46 )
	BMCompleteRibbon:setTopBottom( true, false, 8.5, 32.5 )
	BMCompleteRibbon.Text:setText( Engine.Localize( "MPUI_BM_CONTRACTS_AVAILABLE" ) )
	self:addElement( BMCompleteRibbon )
	self.BMCompleteRibbon = BMCompleteRibbon
	
	local BMCompleteRibbon0 = CoD.BM_CompleteRibbon.new( menu, controller )
	BMCompleteRibbon0:setLeftRight( false, true, -505.13, -400.12 )
	BMCompleteRibbon0:setTopBottom( true, false, 8.5, 32.5 )
	BMCompleteRibbon0:setAlpha( 0 )
	BMCompleteRibbon0.Text:setText( Engine.Localize( "MPUI_BM_CONTRACTS_AVAILABLE" ) )
	self:addElement( BMCompleteRibbon0 )
	self.BMCompleteRibbon0 = BMCompleteRibbon0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 15 )
				header:completeAnimation()
				self.header:setAlpha( 0.5 )
				self.clipFinished( header, {} )
				Background:completeAnimation()
				self.Background:setLeftRight( true, true, 2.32, -1.5 )
				self.Background:setTopBottom( true, true, 2.11, -2 )
				self.Background:setAlpha( 1 )
				self.clipFinished( Background, {} )
				BackgroundCompleted:completeAnimation()
				self.BackgroundCompleted:setLeftRight( true, true, 2.32, -1.5 )
				self.BackgroundCompleted:setTopBottom( true, true, 1.56, -2 )
				self.BackgroundCompleted:setAlpha( 0 )
				self.BackgroundCompleted:setImage( RegisterImage( "uie_t7_blackmarket_contracts_bigframe_completed" ) )
				self.clipFinished( BackgroundCompleted, {} )
				DividerVertical:completeAnimation()
				self.DividerVertical:setAlpha( 1 )
				self.clipFinished( DividerVertical, {} )
				DividerHorizontal:completeAnimation()
				self.DividerHorizontal:setAlpha( 0 )
				self.clipFinished( DividerHorizontal, {} )
				SpecialContractName:completeAnimation()
				self.SpecialContractName:setAlpha( 1 )
				self.clipFinished( SpecialContractName, {} )
				SpecialContractDesc:completeAnimation()
				self.SpecialContractDesc:setAlpha( 1 )
				self.clipFinished( SpecialContractDesc, {} )
				Title:completeAnimation()
				self.Title:setAlpha( 1 )
				self.clipFinished( Title, {} )
				upperglow:completeAnimation()
				self.upperglow:setLeftRight( false, false, -126.13, 122.13 )
				self.upperglow:setTopBottom( true, false, -17.77, 30.28 )
				self.upperglow:setAlpha( 0 )
				self.clipFinished( upperglow, {} )
				lowerglow:completeAnimation()
				self.lowerglow:setLeftRight( false, false, -99, 85 )
				self.lowerglow:setTopBottom( false, true, -6.75, 33.25 )
				self.lowerglow:setAlpha( 0 )
				self.clipFinished( lowerglow, {} )
				RewardImage:completeAnimation()
				RewardImage.ItemImage:completeAnimation()
				RewardImage.CallingCard.CardIconFrame:completeAnimation()
				self.RewardImage:setLeftRight( true, false, 489.04, 677.04 )
				self.RewardImage:setTopBottom( true, false, 52.25, 156.25 )
				self.RewardImage:setAlpha( 1 )
				self.RewardImage.ItemImage:setScale( 1 )
				self.RewardImage.CallingCard.CardIconFrame:setScale( 0.49 )
				self.clipFinished( RewardImage, {} )
				NineSliceShaderImage:completeAnimation()
				self.NineSliceShaderImage:setLeftRight( true, true, -5, 5 )
				self.NineSliceShaderImage:setTopBottom( true, true, -4.54, 4 )
				self.NineSliceShaderImage:setAlpha( 0 )
				self.clipFinished( NineSliceShaderImage, {} )
				CompletedIcon:completeAnimation()
				self.CompletedIcon:setAlpha( 0 )
				self.clipFinished( CompletedIcon, {} )
				BMCompleteRibbon:completeAnimation()
				self.BMCompleteRibbon:setAlpha( 0 )
				self.clipFinished( BMCompleteRibbon, {} )
				BMCompleteRibbon0:completeAnimation()
				self.BMCompleteRibbon0:setAlpha( 0 )
				self.clipFinished( BMCompleteRibbon0, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 10 )
				header:completeAnimation()
				self.header:setAlpha( 0.5 )
				self.clipFinished( header, {} )
				Background:completeAnimation()
				self.Background:setLeftRight( true, true, 2.32, -1.5 )
				self.Background:setTopBottom( true, true, 2.11, -2 )
				self.Background:setAlpha( 1 )
				self.clipFinished( Background, {} )
				BackgroundCompleted:completeAnimation()
				self.BackgroundCompleted:setAlpha( 0 )
				self.clipFinished( BackgroundCompleted, {} )
				DividerVertical:completeAnimation()
				self.DividerVertical:setAlpha( 1 )
				self.clipFinished( DividerVertical, {} )
				DividerHorizontal:completeAnimation()
				self.DividerHorizontal:setAlpha( 0 )
				self.clipFinished( DividerHorizontal, {} )
				local upperglowFrame2 = function ( upperglow, event )
					local upperglowFrame3 = function ( upperglow, event )
						if not event.interrupted then
							upperglow:beginAnimation( "keyframe", 830, false, false, CoD.TweenType.Linear )
						end
						upperglow:setLeftRight( false, false, -126.13, 122.13 )
						upperglow:setTopBottom( true, false, -17.77, 30.28 )
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
				self.upperglow:setLeftRight( false, false, -126.13, 122.13 )
				self.upperglow:setTopBottom( true, false, -17.77, 30.28 )
				self.upperglow:setAlpha( 1 )
				upperglowFrame2( upperglow, {} )
				local lowerglowFrame2 = function ( lowerglow, event )
					local lowerglowFrame3 = function ( lowerglow, event )
						if not event.interrupted then
							lowerglow:beginAnimation( "keyframe", 830, false, false, CoD.TweenType.Linear )
						end
						lowerglow:setLeftRight( false, false, -99, 85 )
						lowerglow:setTopBottom( false, true, -6.75, 33.25 )
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
				self.lowerglow:setLeftRight( false, false, -99, 85 )
				self.lowerglow:setTopBottom( false, true, -6.75, 33.25 )
				self.lowerglow:setAlpha( 1 )
				lowerglowFrame2( lowerglow, {} )
				local NineSliceShaderImageFrame2 = function ( NineSliceShaderImage, event )
					local NineSliceShaderImageFrame3 = function ( NineSliceShaderImage, event )
						if not event.interrupted then
							NineSliceShaderImage:beginAnimation( "keyframe", 830, false, false, CoD.TweenType.Linear )
						end
						NineSliceShaderImage:setLeftRight( true, true, -5, 5 )
						NineSliceShaderImage:setTopBottom( true, true, -4.54, 4 )
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
				self.NineSliceShaderImage:setLeftRight( true, true, -5, 5 )
				self.NineSliceShaderImage:setTopBottom( true, true, -4.54, 4 )
				self.NineSliceShaderImage:setAlpha( 1 )
				NineSliceShaderImageFrame2( NineSliceShaderImage, {} )
				CompletedIcon:completeAnimation()
				self.CompletedIcon:setAlpha( 0 )
				self.clipFinished( CompletedIcon, {} )
				BMCompleteRibbon:completeAnimation()
				self.BMCompleteRibbon:setAlpha( 0 )
				self.clipFinished( BMCompleteRibbon, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 8 )
				header:completeAnimation()
				self.header:setAlpha( 0.5 )
				self.clipFinished( header, {} )
				Background:completeAnimation()
				self.Background:setLeftRight( true, true, 2.32, -1.5 )
				self.Background:setTopBottom( true, true, 2.11, -2 )
				self.Background:setAlpha( 1 )
				self.clipFinished( Background, {} )
				BackgroundCompleted:completeAnimation()
				self.BackgroundCompleted:setAlpha( 0 )
				self.clipFinished( BackgroundCompleted, {} )
				DividerVertical:completeAnimation()
				self.DividerVertical:setAlpha( 1 )
				self.clipFinished( DividerVertical, {} )
				DividerHorizontal:completeAnimation()
				self.DividerHorizontal:setAlpha( 0 )
				self.clipFinished( DividerHorizontal, {} )
				local upperglowFrame2 = function ( upperglow, event )
					if not event.interrupted then
						upperglow:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					upperglow:setLeftRight( false, false, -126.13, 122.13 )
					upperglow:setTopBottom( true, false, -17.77, 30.28 )
					upperglow:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( upperglow, event )
					else
						upperglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				upperglow:completeAnimation()
				self.upperglow:setLeftRight( false, false, -126.13, 122.13 )
				self.upperglow:setTopBottom( true, false, -17.77, 30.28 )
				self.upperglow:setAlpha( 0 )
				upperglowFrame2( upperglow, {} )
				local lowerglowFrame2 = function ( lowerglow, event )
					if not event.interrupted then
						lowerglow:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lowerglow:setLeftRight( false, false, -99, 85 )
					lowerglow:setTopBottom( false, true, -6.75, 33.25 )
					lowerglow:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( lowerglow, event )
					else
						lowerglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lowerglow:completeAnimation()
				self.lowerglow:setLeftRight( false, false, -99, 85 )
				self.lowerglow:setTopBottom( false, true, -6.75, 33.25 )
				self.lowerglow:setAlpha( 0 )
				lowerglowFrame2( lowerglow, {} )
				local NineSliceShaderImageFrame2 = function ( NineSliceShaderImage, event )
					if not event.interrupted then
						NineSliceShaderImage:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					NineSliceShaderImage:setLeftRight( true, true, -5, 5 )
					NineSliceShaderImage:setTopBottom( true, true, -4.54, 4 )
					NineSliceShaderImage:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( NineSliceShaderImage, event )
					else
						NineSliceShaderImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				NineSliceShaderImage:completeAnimation()
				self.NineSliceShaderImage:setLeftRight( true, true, -5, 5 )
				self.NineSliceShaderImage:setTopBottom( true, true, -4.54, 4 )
				self.NineSliceShaderImage:setAlpha( 0 )
				NineSliceShaderImageFrame2( NineSliceShaderImage, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 8 )
				header:completeAnimation()
				self.header:setAlpha( 0.5 )
				self.clipFinished( header, {} )
				Background:completeAnimation()
				self.Background:setLeftRight( true, true, 2.32, -1.5 )
				self.Background:setTopBottom( true, true, 2.11, -2 )
				self.Background:setAlpha( 1 )
				self.clipFinished( Background, {} )
				BackgroundCompleted:completeAnimation()
				self.BackgroundCompleted:setAlpha( 0 )
				self.clipFinished( BackgroundCompleted, {} )
				DividerVertical:completeAnimation()
				self.DividerVertical:setAlpha( 1 )
				self.clipFinished( DividerVertical, {} )
				DividerHorizontal:completeAnimation()
				self.DividerHorizontal:setAlpha( 0 )
				self.clipFinished( DividerHorizontal, {} )
				local upperglowFrame2 = function ( upperglow, event )
					if not event.interrupted then
						upperglow:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					upperglow:setLeftRight( false, false, -126.13, 122.13 )
					upperglow:setTopBottom( true, false, -17.77, 30.28 )
					upperglow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( upperglow, event )
					else
						upperglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				upperglow:completeAnimation()
				self.upperglow:setLeftRight( false, false, -126.13, 122.13 )
				self.upperglow:setTopBottom( true, false, -17.77, 30.28 )
				self.upperglow:setAlpha( 1 )
				upperglowFrame2( upperglow, {} )
				local lowerglowFrame2 = function ( lowerglow, event )
					if not event.interrupted then
						lowerglow:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lowerglow:setLeftRight( false, false, -99, 85 )
					lowerglow:setTopBottom( false, true, -6.75, 33.25 )
					lowerglow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( lowerglow, event )
					else
						lowerglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lowerglow:completeAnimation()
				self.lowerglow:setLeftRight( false, false, -99, 85 )
				self.lowerglow:setTopBottom( false, true, -6.75, 33.25 )
				self.lowerglow:setAlpha( 1 )
				lowerglowFrame2( lowerglow, {} )
				local NineSliceShaderImageFrame2 = function ( NineSliceShaderImage, event )
					if not event.interrupted then
						NineSliceShaderImage:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					NineSliceShaderImage:setLeftRight( true, true, -5, 5 )
					NineSliceShaderImage:setTopBottom( true, true, -4.54, 4 )
					NineSliceShaderImage:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( NineSliceShaderImage, event )
					else
						NineSliceShaderImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				NineSliceShaderImage:completeAnimation()
				self.NineSliceShaderImage:setLeftRight( true, true, -5, 5 )
				self.NineSliceShaderImage:setTopBottom( true, true, -4.54, 4 )
				self.NineSliceShaderImage:setAlpha( 1 )
				NineSliceShaderImageFrame2( NineSliceShaderImage, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 16 )
				header:completeAnimation()
				self.header:setAlpha( 0 )
				self.clipFinished( header, {} )
				Background:completeAnimation()
				self.Background:setAlpha( 0 )
				self.clipFinished( Background, {} )
				BackgroundCompleted:completeAnimation()
				self.BackgroundCompleted:setAlpha( 0 )
				self.clipFinished( BackgroundCompleted, {} )
				DividerVertical:completeAnimation()
				self.DividerVertical:setAlpha( 0 )
				self.clipFinished( DividerVertical, {} )
				DividerHorizontal:completeAnimation()
				self.DividerHorizontal:setAlpha( 0 )
				self.clipFinished( DividerHorizontal, {} )
				SpecialContractPercentCompleteWidget:completeAnimation()
				self.SpecialContractPercentCompleteWidget:setAlpha( 0 )
				self.clipFinished( SpecialContractPercentCompleteWidget, {} )
				SpecialContractName:completeAnimation()
				self.SpecialContractName:setAlpha( 0 )
				self.clipFinished( SpecialContractName, {} )
				SpecialContractDesc:completeAnimation()
				self.SpecialContractDesc:setAlpha( 0 )
				self.clipFinished( SpecialContractDesc, {} )
				Title:completeAnimation()
				self.Title:setAlpha( 0 )
				self.clipFinished( Title, {} )
				upperglow:completeAnimation()
				self.upperglow:setAlpha( 0 )
				self.clipFinished( upperglow, {} )
				lowerglow:completeAnimation()
				self.lowerglow:setAlpha( 0 )
				self.clipFinished( lowerglow, {} )
				RewardImage:completeAnimation()
				self.RewardImage:setAlpha( 0 )
				self.clipFinished( RewardImage, {} )
				NineSliceShaderImage:completeAnimation()
				self.NineSliceShaderImage:setAlpha( 0 )
				self.clipFinished( NineSliceShaderImage, {} )
				CompletedIcon:completeAnimation()
				self.CompletedIcon:setAlpha( 0 )
				self.clipFinished( CompletedIcon, {} )
				BMCompleteRibbon:completeAnimation()
				self.BMCompleteRibbon:setAlpha( 0 )
				self.clipFinished( BMCompleteRibbon, {} )
				BMCompleteRibbon0:completeAnimation()
				self.BMCompleteRibbon0:setAlpha( 0 )
				self.clipFinished( BMCompleteRibbon0, {} )
			end
		},
		Short = {
			DefaultClip = function ()
				self:setupElementClipCounter( 17 )
				Gradient:completeAnimation()
				self.Gradient:setLeftRight( true, false, 2.32, 358.5 )
				self.Gradient:setTopBottom( true, true, 3.17, -3 )
				self.clipFinished( Gradient, {} )
				header:completeAnimation()
				self.header:setLeftRight( true, false, 1, 359 )
				self.header:setTopBottom( true, false, 1.56, 41.56 )
				self.header:setAlpha( 1 )
				self.clipFinished( header, {} )
				Background:completeAnimation()
				self.Background:setLeftRight( true, true, 2.32, -361.5 )
				self.Background:setTopBottom( true, true, 2.11, -2 )
				self.clipFinished( Background, {} )
				BackgroundCompleted:completeAnimation()
				self.BackgroundCompleted:setLeftRight( true, true, 2.32, -1.5 )
				self.BackgroundCompleted:setTopBottom( true, true, 1.56, -2 )
				self.BackgroundCompleted:setAlpha( 0 )
				self.BackgroundCompleted:setImage( RegisterImage( "uie_t7_blackmarket_contracts_bigframe_completed" ) )
				self.clipFinished( BackgroundCompleted, {} )
				DividerVertical:completeAnimation()
				self.DividerVertical:setAlpha( 0 )
				self.clipFinished( DividerVertical, {} )
				DividerHorizontal:completeAnimation()
				self.DividerHorizontal:setLeftRight( true, false, 73.5, 297 )
				self.DividerHorizontal:setTopBottom( true, false, 132.07, 140.06 )
				self.DividerHorizontal:setAlpha( 1 )
				self.clipFinished( DividerHorizontal, {} )
				SpecialContractPercentCompleteWidget:completeAnimation()
				self.SpecialContractPercentCompleteWidget:setLeftRight( true, false, 8.88, 98.88 )
				self.SpecialContractPercentCompleteWidget:setTopBottom( true, false, 41.56, 131.56 )
				self.SpecialContractPercentCompleteWidget:setScale( 0.9 )
				self.clipFinished( SpecialContractPercentCompleteWidget, {} )
				SpecialContractName:completeAnimation()
				self.SpecialContractName:setLeftRight( true, false, 102.25, 343.75 )
				self.SpecialContractName:setTopBottom( true, false, 59.05, 77.55 )
				self.SpecialContractName:setAlpha( 1 )
				self.clipFinished( SpecialContractName, {} )
				SpecialContractDesc:completeAnimation()
				self.SpecialContractDesc:setLeftRight( true, false, 102.25, 343.75 )
				self.SpecialContractDesc:setTopBottom( true, false, 78.05, 96.05 )
				self.SpecialContractDesc:setAlpha( 1 )
				self.clipFinished( SpecialContractDesc, {} )
				Title:completeAnimation()
				self.Title:setLeftRight( true, false, 19.5, 335 )
				self.Title:setTopBottom( true, false, 12.06, 31.06 )
				self.Title:setAlpha( 1 )
				self.clipFinished( Title, {} )
				upperglow:completeAnimation()
				self.upperglow:setLeftRight( false, false, -306.13, -57.88 )
				self.upperglow:setTopBottom( true, false, -17.77, 30.28 )
				self.upperglow:setAlpha( 0 )
				self.clipFinished( upperglow, {} )
				lowerglow:completeAnimation()
				self.lowerglow:setLeftRight( false, false, -279, -95 )
				self.lowerglow:setTopBottom( false, true, -6.75, 33.25 )
				self.lowerglow:setAlpha( 0 )
				self.clipFinished( lowerglow, {} )
				RewardImage:completeAnimation()
				RewardImage.ItemImage:completeAnimation()
				RewardImage.CallingCard.CardIconFrame:completeAnimation()
				self.RewardImage:setLeftRight( true, false, 118.65, 251.85 )
				self.RewardImage:setTopBottom( true, false, 137.07, 210.74 )
				self.RewardImage:setAlpha( 1 )
				self.RewardImage.ItemImage:setScale( 0.71 )
				self.RewardImage.CallingCard.CardIconFrame:setScale( 0.42 )
				self.clipFinished( RewardImage, {} )
				NineSliceShaderImage:completeAnimation()
				self.NineSliceShaderImage:setLeftRight( true, true, -5, -354 )
				self.NineSliceShaderImage:setTopBottom( true, true, -4.54, 4 )
				self.NineSliceShaderImage:setAlpha( 0 )
				self.clipFinished( NineSliceShaderImage, {} )
				CompletedIcon:completeAnimation()
				self.CompletedIcon:setAlpha( 0 )
				self.clipFinished( CompletedIcon, {} )
				BMCompleteRibbon:completeAnimation()
				self.BMCompleteRibbon:setAlpha( 0 )
				self.clipFinished( BMCompleteRibbon, {} )
				BMCompleteRibbon0:completeAnimation()
				self.BMCompleteRibbon0:setAlpha( 0 )
				self.clipFinished( BMCompleteRibbon0, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 15 )
				Gradient:completeAnimation()
				self.Gradient:setLeftRight( true, false, 2.32, 358.5 )
				self.Gradient:setTopBottom( true, true, 3.17, -3 )
				self.clipFinished( Gradient, {} )
				header:completeAnimation()
				self.header:setLeftRight( true, false, 1, 359 )
				self.header:setTopBottom( true, false, 1.56, 41.56 )
				self.header:setAlpha( 1 )
				self.clipFinished( header, {} )
				Background:completeAnimation()
				self.Background:setLeftRight( true, false, 2.32, 358.5 )
				self.Background:setTopBottom( true, true, 2.11, -2 )
				self.clipFinished( Background, {} )
				BackgroundCompleted:completeAnimation()
				self.BackgroundCompleted:setLeftRight( true, true, 2.32, -1.5 )
				self.BackgroundCompleted:setTopBottom( true, true, 1.56, -2 )
				self.BackgroundCompleted:setAlpha( 0 )
				self.BackgroundCompleted:setImage( RegisterImage( "uie_t7_blackmarket_contracts_bigframe_completed" ) )
				self.clipFinished( BackgroundCompleted, {} )
				DividerVertical:completeAnimation()
				self.DividerVertical:setAlpha( 0 )
				self.clipFinished( DividerVertical, {} )
				DividerHorizontal:completeAnimation()
				self.DividerHorizontal:setLeftRight( true, false, 73.5, 297 )
				self.DividerHorizontal:setTopBottom( true, false, 132.07, 140.06 )
				self.DividerHorizontal:setAlpha( 1 )
				self.clipFinished( DividerHorizontal, {} )
				SpecialContractPercentCompleteWidget:completeAnimation()
				self.SpecialContractPercentCompleteWidget:setLeftRight( true, false, 8.88, 98.88 )
				self.SpecialContractPercentCompleteWidget:setTopBottom( true, false, 41.56, 131.56 )
				self.SpecialContractPercentCompleteWidget:setScale( 0.9 )
				self.clipFinished( SpecialContractPercentCompleteWidget, {} )
				SpecialContractName:completeAnimation()
				self.SpecialContractName:setLeftRight( true, false, 102.25, 343.75 )
				self.SpecialContractName:setTopBottom( true, false, 59.05, 77.55 )
				self.SpecialContractName:setAlpha( 1 )
				self.clipFinished( SpecialContractName, {} )
				SpecialContractDesc:completeAnimation()
				self.SpecialContractDesc:setLeftRight( true, false, 102.25, 343.75 )
				self.SpecialContractDesc:setTopBottom( true, false, 78.05, 96.05 )
				self.SpecialContractDesc:setAlpha( 1 )
				self.clipFinished( SpecialContractDesc, {} )
				Title:completeAnimation()
				self.Title:setAlpha( 1 )
				self.clipFinished( Title, {} )
				local upperglowFrame2 = function ( upperglow, event )
					local upperglowFrame3 = function ( upperglow, event )
						if not event.interrupted then
							upperglow:beginAnimation( "keyframe", 799, false, false, CoD.TweenType.Linear )
						end
						upperglow:setLeftRight( false, false, -306.13, -57.88 )
						upperglow:setTopBottom( true, false, -17.77, 30.28 )
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
				self.upperglow:setLeftRight( false, false, -306.13, -57.88 )
				self.upperglow:setTopBottom( true, false, -17.77, 30.28 )
				self.upperglow:setAlpha( 1 )
				upperglowFrame2( upperglow, {} )
				local lowerglowFrame2 = function ( lowerglow, event )
					local lowerglowFrame3 = function ( lowerglow, event )
						if not event.interrupted then
							lowerglow:beginAnimation( "keyframe", 799, false, false, CoD.TweenType.Linear )
						end
						lowerglow:setLeftRight( false, false, -279, -95 )
						lowerglow:setTopBottom( false, true, -6.75, 33.25 )
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
				self.lowerglow:setLeftRight( false, false, -279, -95 )
				self.lowerglow:setTopBottom( false, true, -6.75, 33.25 )
				self.lowerglow:setAlpha( 1 )
				lowerglowFrame2( lowerglow, {} )
				local NineSliceShaderImageFrame2 = function ( NineSliceShaderImage, event )
					local NineSliceShaderImageFrame3 = function ( NineSliceShaderImage, event )
						if not event.interrupted then
							NineSliceShaderImage:beginAnimation( "keyframe", 799, false, false, CoD.TweenType.Linear )
						end
						NineSliceShaderImage:setLeftRight( true, true, -5, -354 )
						NineSliceShaderImage:setTopBottom( true, true, -4.54, 4 )
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
						NineSliceShaderImage:registerEventHandler( "transition_complete_keyframe", NineSliceShaderImageFrame3 )
					end
				end
				
				NineSliceShaderImage:completeAnimation()
				self.NineSliceShaderImage:setLeftRight( true, true, -5, -354 )
				self.NineSliceShaderImage:setTopBottom( true, true, -4.54, 4 )
				self.NineSliceShaderImage:setAlpha( 0.8 )
				NineSliceShaderImageFrame2( NineSliceShaderImage, {} )
				CompletedIcon:completeAnimation()
				self.CompletedIcon:setAlpha( 0 )
				self.clipFinished( CompletedIcon, {} )
				BMCompleteRibbon0:completeAnimation()
				self.BMCompleteRibbon0:setAlpha( 0 )
				self.clipFinished( BMCompleteRibbon0, {} )
				self.nextClip = "Focus"
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 14 )
				Gradient:completeAnimation()
				self.Gradient:setLeftRight( true, false, 2.32, 358.5 )
				self.Gradient:setTopBottom( true, true, 3.17, -3 )
				self.clipFinished( Gradient, {} )
				header:completeAnimation()
				self.header:setLeftRight( true, false, 1, 359 )
				self.header:setTopBottom( true, false, 1.56, 41.56 )
				self.header:setAlpha( 1 )
				self.clipFinished( header, {} )
				Background:completeAnimation()
				self.Background:setLeftRight( true, false, 2.32, 358.5 )
				self.Background:setTopBottom( true, true, 2.11, -2 )
				self.clipFinished( Background, {} )
				BackgroundCompleted:completeAnimation()
				self.BackgroundCompleted:setLeftRight( true, true, 2.32, -1.5 )
				self.BackgroundCompleted:setTopBottom( true, true, 1.56, -2 )
				self.BackgroundCompleted:setAlpha( 0 )
				self.BackgroundCompleted:setImage( RegisterImage( "uie_t7_blackmarket_contracts_bigframe_completed" ) )
				self.clipFinished( BackgroundCompleted, {} )
				DividerVertical:completeAnimation()
				self.DividerVertical:setAlpha( 0 )
				self.clipFinished( DividerVertical, {} )
				DividerHorizontal:completeAnimation()
				self.DividerHorizontal:setLeftRight( true, false, 73.5, 297 )
				self.DividerHorizontal:setTopBottom( true, false, 132.07, 140.06 )
				self.DividerHorizontal:setAlpha( 1 )
				self.clipFinished( DividerHorizontal, {} )
				SpecialContractPercentCompleteWidget:completeAnimation()
				self.SpecialContractPercentCompleteWidget:setLeftRight( true, false, 8.88, 98.88 )
				self.SpecialContractPercentCompleteWidget:setTopBottom( true, false, 41.56, 131.56 )
				self.SpecialContractPercentCompleteWidget:setScale( 0.9 )
				self.clipFinished( SpecialContractPercentCompleteWidget, {} )
				SpecialContractName:completeAnimation()
				self.SpecialContractName:setLeftRight( true, false, 102.25, 343.75 )
				self.SpecialContractName:setTopBottom( true, false, 59.05, 77.55 )
				self.SpecialContractName:setAlpha( 1 )
				self.clipFinished( SpecialContractName, {} )
				SpecialContractDesc:completeAnimation()
				self.SpecialContractDesc:setLeftRight( true, false, 102.25, 343.75 )
				self.SpecialContractDesc:setTopBottom( true, false, 78.05, 96.05 )
				self.SpecialContractDesc:setAlpha( 1 )
				self.clipFinished( SpecialContractDesc, {} )
				Title:completeAnimation()
				self.Title:setAlpha( 1 )
				self.clipFinished( Title, {} )
				local upperglowFrame2 = function ( upperglow, event )
					if not event.interrupted then
						upperglow:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					upperglow:setLeftRight( false, false, -306.13, -57.88 )
					upperglow:setTopBottom( true, false, -17.77, 30.28 )
					upperglow:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( upperglow, event )
					else
						upperglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				upperglow:completeAnimation()
				self.upperglow:setLeftRight( false, false, -306.13, -57.88 )
				self.upperglow:setTopBottom( true, false, -17.77, 30.28 )
				self.upperglow:setAlpha( 0 )
				upperglowFrame2( upperglow, {} )
				local lowerglowFrame2 = function ( lowerglow, event )
					if not event.interrupted then
						lowerglow:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lowerglow:setLeftRight( false, false, -279, -95 )
					lowerglow:setTopBottom( false, true, -6.75, 33.25 )
					lowerglow:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( lowerglow, event )
					else
						lowerglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lowerglow:completeAnimation()
				self.lowerglow:setLeftRight( false, false, -279, -95 )
				self.lowerglow:setTopBottom( false, true, -6.75, 33.25 )
				self.lowerglow:setAlpha( 0 )
				lowerglowFrame2( lowerglow, {} )
				local NineSliceShaderImageFrame2 = function ( NineSliceShaderImage, event )
					if not event.interrupted then
						NineSliceShaderImage:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					NineSliceShaderImage:setLeftRight( true, true, -5, -354 )
					NineSliceShaderImage:setTopBottom( true, true, -4.54, 4 )
					NineSliceShaderImage:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( NineSliceShaderImage, event )
					else
						NineSliceShaderImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				NineSliceShaderImage:completeAnimation()
				self.NineSliceShaderImage:setLeftRight( true, true, -5, -354 )
				self.NineSliceShaderImage:setTopBottom( true, true, -4.54, 4 )
				self.NineSliceShaderImage:setAlpha( 0 )
				NineSliceShaderImageFrame2( NineSliceShaderImage, {} )
				BMCompleteRibbon0:completeAnimation()
				self.BMCompleteRibbon0:setAlpha( 0 )
				self.clipFinished( BMCompleteRibbon0, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 14 )
				Gradient:completeAnimation()
				self.Gradient:setLeftRight( true, false, 2.32, 358.5 )
				self.Gradient:setTopBottom( true, true, 3.17, -3 )
				self.clipFinished( Gradient, {} )
				header:completeAnimation()
				self.header:setLeftRight( true, false, 1, 359 )
				self.header:setTopBottom( true, false, 1.56, 41.56 )
				self.header:setAlpha( 1 )
				self.clipFinished( header, {} )
				Background:completeAnimation()
				self.Background:setLeftRight( true, false, 2.32, 358.5 )
				self.Background:setTopBottom( true, true, 2.11, -2 )
				self.clipFinished( Background, {} )
				BackgroundCompleted:completeAnimation()
				self.BackgroundCompleted:setLeftRight( true, true, 2.32, -1.5 )
				self.BackgroundCompleted:setTopBottom( true, true, 1.56, -2 )
				self.BackgroundCompleted:setAlpha( 0 )
				self.BackgroundCompleted:setImage( RegisterImage( "uie_t7_blackmarket_contracts_bigframe_completed" ) )
				self.clipFinished( BackgroundCompleted, {} )
				DividerVertical:completeAnimation()
				self.DividerVertical:setAlpha( 0 )
				self.clipFinished( DividerVertical, {} )
				DividerHorizontal:completeAnimation()
				self.DividerHorizontal:setLeftRight( true, false, 73.5, 297 )
				self.DividerHorizontal:setTopBottom( true, false, 132.07, 140.06 )
				self.DividerHorizontal:setAlpha( 1 )
				self.clipFinished( DividerHorizontal, {} )
				SpecialContractPercentCompleteWidget:completeAnimation()
				self.SpecialContractPercentCompleteWidget:setLeftRight( true, false, 8.88, 98.88 )
				self.SpecialContractPercentCompleteWidget:setTopBottom( true, false, 41.56, 131.56 )
				self.SpecialContractPercentCompleteWidget:setScale( 0.9 )
				self.clipFinished( SpecialContractPercentCompleteWidget, {} )
				SpecialContractName:completeAnimation()
				self.SpecialContractName:setLeftRight( true, false, 102.25, 343.75 )
				self.SpecialContractName:setTopBottom( true, false, 59.05, 77.55 )
				self.SpecialContractName:setAlpha( 1 )
				self.clipFinished( SpecialContractName, {} )
				SpecialContractDesc:completeAnimation()
				self.SpecialContractDesc:setLeftRight( true, false, 102.25, 343.75 )
				self.SpecialContractDesc:setTopBottom( true, false, 78.05, 96.05 )
				self.SpecialContractDesc:setAlpha( 1 )
				self.clipFinished( SpecialContractDesc, {} )
				Title:completeAnimation()
				self.Title:setAlpha( 1 )
				self.clipFinished( Title, {} )
				local upperglowFrame2 = function ( upperglow, event )
					if not event.interrupted then
						upperglow:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					upperglow:setLeftRight( false, false, -306.13, -57.88 )
					upperglow:setTopBottom( true, false, -17.77, 30.28 )
					upperglow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( upperglow, event )
					else
						upperglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				upperglow:completeAnimation()
				self.upperglow:setLeftRight( false, false, -306.13, -57.88 )
				self.upperglow:setTopBottom( true, false, -17.77, 30.28 )
				self.upperglow:setAlpha( 1 )
				upperglowFrame2( upperglow, {} )
				local lowerglowFrame2 = function ( lowerglow, event )
					if not event.interrupted then
						lowerglow:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lowerglow:setLeftRight( false, false, -279, -95 )
					lowerglow:setTopBottom( false, true, -6.75, 33.25 )
					lowerglow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( lowerglow, event )
					else
						lowerglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lowerglow:completeAnimation()
				self.lowerglow:setLeftRight( false, false, -279, -95 )
				self.lowerglow:setTopBottom( false, true, -6.75, 33.25 )
				self.lowerglow:setAlpha( 1 )
				lowerglowFrame2( lowerglow, {} )
				local NineSliceShaderImageFrame2 = function ( NineSliceShaderImage, event )
					if not event.interrupted then
						NineSliceShaderImage:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					NineSliceShaderImage:setLeftRight( true, true, -5, -354 )
					NineSliceShaderImage:setTopBottom( true, true, -4.54, 4 )
					NineSliceShaderImage:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( NineSliceShaderImage, event )
					else
						NineSliceShaderImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				NineSliceShaderImage:completeAnimation()
				self.NineSliceShaderImage:setLeftRight( true, true, -5, -354 )
				self.NineSliceShaderImage:setTopBottom( true, true, -4.54, 4 )
				self.NineSliceShaderImage:setAlpha( 1 )
				NineSliceShaderImageFrame2( NineSliceShaderImage, {} )
				BMCompleteRibbon0:completeAnimation()
				self.BMCompleteRibbon0:setAlpha( 0 )
				self.clipFinished( BMCompleteRibbon0, {} )
			end
		},
		Completed = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				header:completeAnimation()
				self.header:setAlpha( 0.5 )
				self.clipFinished( header, {} )
				Background:completeAnimation()
				self.Background:setLeftRight( true, false, 2.32, 718.5 )
				self.Background:setTopBottom( true, true, 2.11, -2 )
				self.Background:setAlpha( 1 )
				self.clipFinished( Background, {} )
				BackgroundCompleted:completeAnimation()
				self.BackgroundCompleted:setAlpha( 0 )
				self.clipFinished( BackgroundCompleted, {} )
				DividerVertical:completeAnimation()
				self.DividerVertical:setAlpha( 1 )
				self.clipFinished( DividerVertical, {} )
				DividerHorizontal:completeAnimation()
				self.DividerHorizontal:setAlpha( 0 )
				self.clipFinished( DividerHorizontal, {} )
				Title:completeAnimation()
				self.Title:setLeftRight( true, false, 19.5, 415.25 )
				self.Title:setTopBottom( true, false, 12.06, 31.06 )
				self.clipFinished( Title, {} )
				upperglow:completeAnimation()
				self.upperglow:setLeftRight( false, false, -126.13, 122.13 )
				self.upperglow:setTopBottom( true, false, -17.77, 30.28 )
				self.upperglow:setAlpha( 0 )
				self.clipFinished( upperglow, {} )
				lowerglow:completeAnimation()
				self.lowerglow:setLeftRight( false, false, -99, 85 )
				self.lowerglow:setTopBottom( false, true, -6.75, 33.25 )
				self.lowerglow:setAlpha( 0 )
				self.clipFinished( lowerglow, {} )
				RewardImage:completeAnimation()
				RewardImage.ItemImage:completeAnimation()
				RewardImage.CallingCard.CardIconFrame:completeAnimation()
				self.RewardImage:setLeftRight( true, false, 489.04, 677.04 )
				self.RewardImage:setTopBottom( true, false, 52.25, 156.25 )
				self.RewardImage:setAlpha( 1 )
				self.RewardImage.ItemImage:setScale( 1 )
				self.RewardImage.CallingCard.CardIconFrame:setScale( 0.49 )
				self.clipFinished( RewardImage, {} )
				NineSliceShaderImage:completeAnimation()
				self.NineSliceShaderImage:setLeftRight( true, true, -5, 5 )
				self.NineSliceShaderImage:setTopBottom( true, true, -4.54, 4 )
				self.NineSliceShaderImage:setAlpha( 0 )
				self.clipFinished( NineSliceShaderImage, {} )
				CompletedIcon:completeAnimation()
				self.CompletedIcon:setAlpha( 1 )
				self.clipFinished( CompletedIcon, {} )
				BMCompleteRibbon:completeAnimation()
				self.BMCompleteRibbon:setAlpha( 1 )
				self.clipFinished( BMCompleteRibbon, {} )
				BMCompleteRibbon0:completeAnimation()
				self.BMCompleteRibbon0:setAlpha( 0 )
				self.clipFinished( BMCompleteRibbon0, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 8 )
				header:completeAnimation()
				self.header:setAlpha( 0.5 )
				self.clipFinished( header, {} )
				Background:completeAnimation()
				self.Background:setLeftRight( true, true, 2.32, -1.5 )
				self.Background:setTopBottom( true, true, 2.11, -2 )
				self.Background:setAlpha( 1 )
				self.clipFinished( Background, {} )
				BackgroundCompleted:completeAnimation()
				self.BackgroundCompleted:setAlpha( 0 )
				self.clipFinished( BackgroundCompleted, {} )
				DividerVertical:completeAnimation()
				self.DividerVertical:setAlpha( 1 )
				self.clipFinished( DividerVertical, {} )
				DividerHorizontal:completeAnimation()
				self.DividerHorizontal:setAlpha( 0 )
				self.clipFinished( DividerHorizontal, {} )
				local upperglowFrame2 = function ( upperglow, event )
					local upperglowFrame3 = function ( upperglow, event )
						if not event.interrupted then
							upperglow:beginAnimation( "keyframe", 830, false, false, CoD.TweenType.Linear )
						end
						upperglow:setLeftRight( false, false, -126.13, 122.13 )
						upperglow:setTopBottom( true, false, -17.77, 30.28 )
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
				self.upperglow:setLeftRight( false, false, -126.13, 122.13 )
				self.upperglow:setTopBottom( true, false, -17.77, 30.28 )
				self.upperglow:setAlpha( 1 )
				upperglowFrame2( upperglow, {} )
				local lowerglowFrame2 = function ( lowerglow, event )
					local lowerglowFrame3 = function ( lowerglow, event )
						if not event.interrupted then
							lowerglow:beginAnimation( "keyframe", 830, false, false, CoD.TweenType.Linear )
						end
						lowerglow:setLeftRight( false, false, -99, 85 )
						lowerglow:setTopBottom( false, true, -6.75, 33.25 )
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
				self.lowerglow:setLeftRight( false, false, -99, 85 )
				self.lowerglow:setTopBottom( false, true, -6.75, 33.25 )
				self.lowerglow:setAlpha( 1 )
				lowerglowFrame2( lowerglow, {} )
				local NineSliceShaderImageFrame2 = function ( NineSliceShaderImage, event )
					local NineSliceShaderImageFrame3 = function ( NineSliceShaderImage, event )
						if not event.interrupted then
							NineSliceShaderImage:beginAnimation( "keyframe", 830, false, false, CoD.TweenType.Linear )
						end
						NineSliceShaderImage:setLeftRight( true, true, -5, 5 )
						NineSliceShaderImage:setTopBottom( true, true, -4.54, 4 )
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
				self.NineSliceShaderImage:setLeftRight( true, true, -5, 5 )
				self.NineSliceShaderImage:setTopBottom( true, true, -4.54, 4 )
				self.NineSliceShaderImage:setAlpha( 1 )
				NineSliceShaderImageFrame2( NineSliceShaderImage, {} )
				self.nextClip = "Focus"
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 8 )
				header:completeAnimation()
				self.header:setAlpha( 0.5 )
				self.clipFinished( header, {} )
				Background:completeAnimation()
				self.Background:setLeftRight( true, true, 2.32, -1.5 )
				self.Background:setTopBottom( true, true, 2.11, -2 )
				self.Background:setAlpha( 1 )
				self.clipFinished( Background, {} )
				BackgroundCompleted:completeAnimation()
				self.BackgroundCompleted:setAlpha( 0 )
				self.clipFinished( BackgroundCompleted, {} )
				DividerVertical:completeAnimation()
				self.DividerVertical:setAlpha( 1 )
				self.clipFinished( DividerVertical, {} )
				DividerHorizontal:completeAnimation()
				self.DividerHorizontal:setAlpha( 0 )
				self.clipFinished( DividerHorizontal, {} )
				local upperglowFrame2 = function ( upperglow, event )
					if not event.interrupted then
						upperglow:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					upperglow:setLeftRight( false, false, -126.13, 122.13 )
					upperglow:setTopBottom( true, false, -17.77, 30.28 )
					upperglow:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( upperglow, event )
					else
						upperglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				upperglow:completeAnimation()
				self.upperglow:setLeftRight( false, false, -126.13, 122.13 )
				self.upperglow:setTopBottom( true, false, -17.77, 30.28 )
				self.upperglow:setAlpha( 0 )
				upperglowFrame2( upperglow, {} )
				local lowerglowFrame2 = function ( lowerglow, event )
					if not event.interrupted then
						lowerglow:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lowerglow:setLeftRight( false, false, -99, 85 )
					lowerglow:setTopBottom( false, true, -6.75, 33.25 )
					lowerglow:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( lowerglow, event )
					else
						lowerglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lowerglow:completeAnimation()
				self.lowerglow:setLeftRight( false, false, -99, 85 )
				self.lowerglow:setTopBottom( false, true, -6.75, 33.25 )
				self.lowerglow:setAlpha( 0 )
				lowerglowFrame2( lowerglow, {} )
				local NineSliceShaderImageFrame2 = function ( NineSliceShaderImage, event )
					if not event.interrupted then
						NineSliceShaderImage:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					NineSliceShaderImage:setLeftRight( true, true, -5, 5 )
					NineSliceShaderImage:setTopBottom( true, true, -4.54, 4 )
					NineSliceShaderImage:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( NineSliceShaderImage, event )
					else
						NineSliceShaderImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				NineSliceShaderImage:completeAnimation()
				self.NineSliceShaderImage:setLeftRight( true, true, -5, 5 )
				self.NineSliceShaderImage:setTopBottom( true, true, -4.54, 4 )
				self.NineSliceShaderImage:setAlpha( 0 )
				NineSliceShaderImageFrame2( NineSliceShaderImage, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 8 )
				header:completeAnimation()
				self.header:setAlpha( 0.5 )
				self.clipFinished( header, {} )
				Background:completeAnimation()
				self.Background:setLeftRight( true, true, 2.32, -1.5 )
				self.Background:setTopBottom( true, true, 2.11, -2 )
				self.Background:setAlpha( 1 )
				self.clipFinished( Background, {} )
				BackgroundCompleted:completeAnimation()
				self.BackgroundCompleted:setAlpha( 0 )
				self.clipFinished( BackgroundCompleted, {} )
				DividerVertical:completeAnimation()
				self.DividerVertical:setAlpha( 1 )
				self.clipFinished( DividerVertical, {} )
				DividerHorizontal:completeAnimation()
				self.DividerHorizontal:setAlpha( 0 )
				self.clipFinished( DividerHorizontal, {} )
				local upperglowFrame2 = function ( upperglow, event )
					if not event.interrupted then
						upperglow:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					upperglow:setLeftRight( false, false, -126.13, 122.13 )
					upperglow:setTopBottom( true, false, -17.77, 30.28 )
					upperglow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( upperglow, event )
					else
						upperglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				upperglow:completeAnimation()
				self.upperglow:setLeftRight( false, false, -126.13, 122.13 )
				self.upperglow:setTopBottom( true, false, -17.77, 30.28 )
				self.upperglow:setAlpha( 1 )
				upperglowFrame2( upperglow, {} )
				local lowerglowFrame2 = function ( lowerglow, event )
					if not event.interrupted then
						lowerglow:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lowerglow:setLeftRight( false, false, -99, 85 )
					lowerglow:setTopBottom( false, true, -6.75, 33.25 )
					lowerglow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( lowerglow, event )
					else
						lowerglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lowerglow:completeAnimation()
				self.lowerglow:setLeftRight( false, false, -99, 85 )
				self.lowerglow:setTopBottom( false, true, -6.75, 33.25 )
				self.lowerglow:setAlpha( 1 )
				lowerglowFrame2( lowerglow, {} )
				local NineSliceShaderImageFrame2 = function ( NineSliceShaderImage, event )
					if not event.interrupted then
						NineSliceShaderImage:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					NineSliceShaderImage:setLeftRight( true, true, -5, 5 )
					NineSliceShaderImage:setTopBottom( true, true, -4.54, 4 )
					NineSliceShaderImage:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( NineSliceShaderImage, event )
					else
						NineSliceShaderImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				NineSliceShaderImage:completeAnimation()
				self.NineSliceShaderImage:setLeftRight( true, true, -5, 5 )
				self.NineSliceShaderImage:setTopBottom( true, true, -4.54, 4 )
				self.NineSliceShaderImage:setAlpha( 1 )
				NineSliceShaderImageFrame2( NineSliceShaderImage, {} )
			end
		},
		CompletedShort = {
			DefaultClip = function ()
				self:setupElementClipCounter( 17 )
				Gradient:completeAnimation()
				self.Gradient:setLeftRight( true, false, 2.32, 358.5 )
				self.Gradient:setTopBottom( true, true, 3.17, -3 )
				self.clipFinished( Gradient, {} )
				header:completeAnimation()
				self.header:setLeftRight( true, false, 1, 359 )
				self.header:setTopBottom( true, false, 1.56, 41.56 )
				self.header:setAlpha( 1 )
				self.clipFinished( header, {} )
				Background:completeAnimation()
				self.Background:setLeftRight( true, false, 2.32, 358.5 )
				self.Background:setTopBottom( true, true, 2.11, -2 )
				self.Background:setAlpha( 1 )
				self.clipFinished( Background, {} )
				BackgroundCompleted:completeAnimation()
				self.BackgroundCompleted:setLeftRight( true, true, 2.32, -1.5 )
				self.BackgroundCompleted:setTopBottom( true, true, 1.56, -2 )
				self.BackgroundCompleted:setAlpha( 0 )
				self.BackgroundCompleted:setImage( RegisterImage( "uie_t7_blackmarket_contracts_bigframe_completed" ) )
				self.clipFinished( BackgroundCompleted, {} )
				DividerVertical:completeAnimation()
				self.DividerVertical:setAlpha( 0 )
				self.clipFinished( DividerVertical, {} )
				DividerHorizontal:completeAnimation()
				self.DividerHorizontal:setLeftRight( true, false, 73.5, 297 )
				self.DividerHorizontal:setTopBottom( true, false, 132.07, 140.06 )
				self.DividerHorizontal:setAlpha( 1 )
				self.clipFinished( DividerHorizontal, {} )
				SpecialContractPercentCompleteWidget:completeAnimation()
				self.SpecialContractPercentCompleteWidget:setLeftRight( true, false, 8.88, 98.88 )
				self.SpecialContractPercentCompleteWidget:setTopBottom( true, false, 41.56, 131.56 )
				self.SpecialContractPercentCompleteWidget:setScale( 0.9 )
				self.clipFinished( SpecialContractPercentCompleteWidget, {} )
				SpecialContractName:completeAnimation()
				self.SpecialContractName:setLeftRight( true, false, 102.25, 343.75 )
				self.SpecialContractName:setTopBottom( true, false, 59.05, 77.55 )
				self.SpecialContractName:setAlpha( 1 )
				self.clipFinished( SpecialContractName, {} )
				SpecialContractDesc:completeAnimation()
				self.SpecialContractDesc:setLeftRight( true, false, 102.25, 343.75 )
				self.SpecialContractDesc:setTopBottom( true, false, 78.05, 96.05 )
				self.SpecialContractDesc:setAlpha( 1 )
				self.clipFinished( SpecialContractDesc, {} )
				Title:completeAnimation()
				self.Title:setLeftRight( true, false, 19.5, 197 )
				self.Title:setTopBottom( true, false, 12.06, 31.06 )
				self.Title:setAlpha( 1 )
				self.clipFinished( Title, {} )
				upperglow:completeAnimation()
				self.upperglow:setLeftRight( false, false, -306.13, -57.88 )
				self.upperglow:setTopBottom( true, false, -17.77, 30.28 )
				self.upperglow:setAlpha( 0 )
				self.clipFinished( upperglow, {} )
				lowerglow:completeAnimation()
				self.lowerglow:setLeftRight( false, false, -279, -95 )
				self.lowerglow:setTopBottom( false, true, -6.75, 33.25 )
				self.lowerglow:setAlpha( 0 )
				self.clipFinished( lowerglow, {} )
				RewardImage:completeAnimation()
				RewardImage.ItemImage:completeAnimation()
				RewardImage.CallingCard.CardIconFrame:completeAnimation()
				self.RewardImage:setLeftRight( true, false, 118.65, 251.85 )
				self.RewardImage:setTopBottom( true, false, 137.07, 210.74 )
				self.RewardImage:setAlpha( 1 )
				self.RewardImage.ItemImage:setScale( 0.71 )
				self.RewardImage.CallingCard.CardIconFrame:setScale( 0.42 )
				self.clipFinished( RewardImage, {} )
				NineSliceShaderImage:completeAnimation()
				self.NineSliceShaderImage:setLeftRight( true, true, -5, -354 )
				self.NineSliceShaderImage:setTopBottom( true, true, -4.54, 4 )
				self.NineSliceShaderImage:setAlpha( 0 )
				self.clipFinished( NineSliceShaderImage, {} )
				CompletedIcon:completeAnimation()
				self.CompletedIcon:setLeftRight( false, true, -407.75, -358.75 )
				self.CompletedIcon:setTopBottom( true, false, 5.56, 37.56 )
				self.CompletedIcon:setAlpha( 1 )
				self.clipFinished( CompletedIcon, {} )
				BMCompleteRibbon:completeAnimation()
				self.BMCompleteRibbon:setAlpha( 0 )
				self.clipFinished( BMCompleteRibbon, {} )
				BMCompleteRibbon0:completeAnimation()
				self.BMCompleteRibbon0:setAlpha( 1 )
				self.clipFinished( BMCompleteRibbon0, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 13 )
				Gradient:completeAnimation()
				self.Gradient:setLeftRight( true, false, 2.32, 358.5 )
				self.Gradient:setTopBottom( true, true, 3.17, -3 )
				self.clipFinished( Gradient, {} )
				header:completeAnimation()
				self.header:setLeftRight( true, false, 1, 359 )
				self.header:setTopBottom( true, false, 1.56, 41.56 )
				self.header:setAlpha( 1 )
				self.clipFinished( header, {} )
				Background:completeAnimation()
				self.Background:setLeftRight( true, true, 2.32, -361.5 )
				self.Background:setTopBottom( true, true, 2.11, -2 )
				self.Background:setAlpha( 1 )
				self.clipFinished( Background, {} )
				BackgroundCompleted:completeAnimation()
				self.BackgroundCompleted:setLeftRight( true, true, 2.32, -1.5 )
				self.BackgroundCompleted:setTopBottom( true, true, 1.56, -2 )
				self.BackgroundCompleted:setAlpha( 0 )
				self.BackgroundCompleted:setImage( RegisterImage( "uie_t7_blackmarket_contracts_bigframe_completed" ) )
				self.clipFinished( BackgroundCompleted, {} )
				DividerVertical:completeAnimation()
				self.DividerVertical:setAlpha( 0 )
				self.clipFinished( DividerVertical, {} )
				DividerHorizontal:completeAnimation()
				self.DividerHorizontal:setLeftRight( true, false, 73.5, 297 )
				self.DividerHorizontal:setTopBottom( true, false, 132.07, 140.06 )
				self.DividerHorizontal:setAlpha( 1 )
				self.clipFinished( DividerHorizontal, {} )
				SpecialContractPercentCompleteWidget:completeAnimation()
				self.SpecialContractPercentCompleteWidget:setLeftRight( true, false, 8.88, 98.88 )
				self.SpecialContractPercentCompleteWidget:setTopBottom( true, false, 41.56, 131.56 )
				self.SpecialContractPercentCompleteWidget:setScale( 0.9 )
				self.clipFinished( SpecialContractPercentCompleteWidget, {} )
				SpecialContractName:completeAnimation()
				self.SpecialContractName:setLeftRight( true, false, 102.25, 343.75 )
				self.SpecialContractName:setTopBottom( true, false, 59.05, 77.55 )
				self.SpecialContractName:setAlpha( 1 )
				self.clipFinished( SpecialContractName, {} )
				SpecialContractDesc:completeAnimation()
				self.SpecialContractDesc:setLeftRight( true, false, 102.25, 343.75 )
				self.SpecialContractDesc:setTopBottom( true, false, 78.05, 96.05 )
				self.SpecialContractDesc:setAlpha( 1 )
				self.clipFinished( SpecialContractDesc, {} )
				Title:completeAnimation()
				self.Title:setAlpha( 1 )
				self.clipFinished( Title, {} )
				local upperglowFrame2 = function ( upperglow, event )
					local upperglowFrame3 = function ( upperglow, event )
						if not event.interrupted then
							upperglow:beginAnimation( "keyframe", 799, false, false, CoD.TweenType.Linear )
						end
						upperglow:setLeftRight( false, false, -306.13, -57.88 )
						upperglow:setTopBottom( true, false, -17.77, 30.28 )
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
				self.upperglow:setLeftRight( false, false, -306.13, -57.88 )
				self.upperglow:setTopBottom( true, false, -17.77, 30.28 )
				self.upperglow:setAlpha( 1 )
				upperglowFrame2( upperglow, {} )
				local lowerglowFrame2 = function ( lowerglow, event )
					local lowerglowFrame3 = function ( lowerglow, event )
						if not event.interrupted then
							lowerglow:beginAnimation( "keyframe", 799, false, false, CoD.TweenType.Linear )
						end
						lowerglow:setLeftRight( false, false, -279, -95 )
						lowerglow:setTopBottom( false, true, -6.75, 33.25 )
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
				self.lowerglow:setLeftRight( false, false, -279, -95 )
				self.lowerglow:setTopBottom( false, true, -6.75, 33.25 )
				self.lowerglow:setAlpha( 1 )
				lowerglowFrame2( lowerglow, {} )
				local NineSliceShaderImageFrame2 = function ( NineSliceShaderImage, event )
					local NineSliceShaderImageFrame3 = function ( NineSliceShaderImage, event )
						if not event.interrupted then
							NineSliceShaderImage:beginAnimation( "keyframe", 799, false, false, CoD.TweenType.Linear )
						end
						NineSliceShaderImage:setLeftRight( true, true, -5, -354 )
						NineSliceShaderImage:setTopBottom( true, true, -4.54, 4 )
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
				self.NineSliceShaderImage:setLeftRight( true, true, -5, -354 )
				self.NineSliceShaderImage:setTopBottom( true, true, -4.54, 4 )
				self.NineSliceShaderImage:setAlpha( 1 )
				NineSliceShaderImageFrame2( NineSliceShaderImage, {} )
				self.nextClip = "Focus"
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 13 )
				Gradient:completeAnimation()
				self.Gradient:setLeftRight( true, false, 2.32, 358.5 )
				self.Gradient:setTopBottom( true, true, 3.17, -3 )
				self.clipFinished( Gradient, {} )
				header:completeAnimation()
				self.header:setLeftRight( true, false, 1, 359 )
				self.header:setTopBottom( true, false, 1.56, 41.56 )
				self.header:setAlpha( 1 )
				self.clipFinished( header, {} )
				Background:completeAnimation()
				self.Background:setLeftRight( true, true, 2.32, -361.5 )
				self.Background:setTopBottom( true, true, 2.11, -2 )
				self.Background:setAlpha( 1 )
				self.clipFinished( Background, {} )
				BackgroundCompleted:completeAnimation()
				self.BackgroundCompleted:setLeftRight( true, true, 2.32, -1.5 )
				self.BackgroundCompleted:setTopBottom( true, true, 1.56, -2 )
				self.BackgroundCompleted:setAlpha( 0 )
				self.BackgroundCompleted:setImage( RegisterImage( "uie_t7_blackmarket_contracts_bigframe_completed" ) )
				self.clipFinished( BackgroundCompleted, {} )
				DividerVertical:completeAnimation()
				self.DividerVertical:setAlpha( 0 )
				self.clipFinished( DividerVertical, {} )
				DividerHorizontal:completeAnimation()
				self.DividerHorizontal:setLeftRight( true, false, 73.5, 297 )
				self.DividerHorizontal:setTopBottom( true, false, 132.07, 140.06 )
				self.DividerHorizontal:setAlpha( 1 )
				self.clipFinished( DividerHorizontal, {} )
				SpecialContractPercentCompleteWidget:completeAnimation()
				self.SpecialContractPercentCompleteWidget:setLeftRight( true, false, 8.88, 98.88 )
				self.SpecialContractPercentCompleteWidget:setTopBottom( true, false, 41.56, 131.56 )
				self.SpecialContractPercentCompleteWidget:setScale( 0.9 )
				self.clipFinished( SpecialContractPercentCompleteWidget, {} )
				SpecialContractName:completeAnimation()
				self.SpecialContractName:setLeftRight( true, false, 102.25, 343.75 )
				self.SpecialContractName:setTopBottom( true, false, 59.05, 77.55 )
				self.SpecialContractName:setAlpha( 1 )
				self.clipFinished( SpecialContractName, {} )
				SpecialContractDesc:completeAnimation()
				self.SpecialContractDesc:setLeftRight( true, false, 102.25, 343.75 )
				self.SpecialContractDesc:setTopBottom( true, false, 78.05, 96.05 )
				self.SpecialContractDesc:setAlpha( 1 )
				self.clipFinished( SpecialContractDesc, {} )
				Title:completeAnimation()
				self.Title:setAlpha( 1 )
				self.clipFinished( Title, {} )
				local upperglowFrame2 = function ( upperglow, event )
					if not event.interrupted then
						upperglow:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					upperglow:setLeftRight( false, false, -306.13, -57.88 )
					upperglow:setTopBottom( true, false, -17.77, 30.28 )
					upperglow:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( upperglow, event )
					else
						upperglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				upperglow:completeAnimation()
				self.upperglow:setLeftRight( false, false, -306.13, -57.88 )
				self.upperglow:setTopBottom( true, false, -17.77, 30.28 )
				self.upperglow:setAlpha( 0 )
				upperglowFrame2( upperglow, {} )
				local lowerglowFrame2 = function ( lowerglow, event )
					if not event.interrupted then
						lowerglow:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lowerglow:setLeftRight( false, false, -279, -95 )
					lowerglow:setTopBottom( false, true, -6.75, 33.25 )
					lowerglow:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( lowerglow, event )
					else
						lowerglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lowerglow:completeAnimation()
				self.lowerglow:setLeftRight( false, false, -279, -95 )
				self.lowerglow:setTopBottom( false, true, -6.75, 33.25 )
				self.lowerglow:setAlpha( 0 )
				lowerglowFrame2( lowerglow, {} )
				local NineSliceShaderImageFrame2 = function ( NineSliceShaderImage, event )
					if not event.interrupted then
						NineSliceShaderImage:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					NineSliceShaderImage:setLeftRight( true, true, -5, -354 )
					NineSliceShaderImage:setTopBottom( true, true, -4.54, 4 )
					NineSliceShaderImage:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( NineSliceShaderImage, event )
					else
						NineSliceShaderImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				NineSliceShaderImage:completeAnimation()
				self.NineSliceShaderImage:setLeftRight( true, true, -5, -354 )
				self.NineSliceShaderImage:setTopBottom( true, true, -4.54, 4 )
				self.NineSliceShaderImage:setAlpha( 0 )
				NineSliceShaderImageFrame2( NineSliceShaderImage, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 13 )
				Gradient:completeAnimation()
				self.Gradient:setLeftRight( true, false, 2.32, 358.5 )
				self.Gradient:setTopBottom( true, true, 3.17, -3 )
				self.clipFinished( Gradient, {} )
				header:completeAnimation()
				self.header:setLeftRight( true, false, 1, 359 )
				self.header:setTopBottom( true, false, 1.56, 41.56 )
				self.header:setAlpha( 1 )
				self.clipFinished( header, {} )
				Background:completeAnimation()
				self.Background:setLeftRight( true, true, 2.32, -361.5 )
				self.Background:setTopBottom( true, true, 2.11, -2 )
				self.Background:setAlpha( 1 )
				self.clipFinished( Background, {} )
				BackgroundCompleted:completeAnimation()
				self.BackgroundCompleted:setLeftRight( true, true, 2.32, -1.5 )
				self.BackgroundCompleted:setTopBottom( true, true, 1.56, -2 )
				self.BackgroundCompleted:setAlpha( 0 )
				self.BackgroundCompleted:setImage( RegisterImage( "uie_t7_blackmarket_contracts_bigframe_completed" ) )
				self.clipFinished( BackgroundCompleted, {} )
				DividerVertical:completeAnimation()
				self.DividerVertical:setAlpha( 0 )
				self.clipFinished( DividerVertical, {} )
				DividerHorizontal:completeAnimation()
				self.DividerHorizontal:setLeftRight( true, false, 73.5, 297 )
				self.DividerHorizontal:setTopBottom( true, false, 132.07, 140.06 )
				self.DividerHorizontal:setAlpha( 1 )
				self.clipFinished( DividerHorizontal, {} )
				SpecialContractPercentCompleteWidget:completeAnimation()
				self.SpecialContractPercentCompleteWidget:setLeftRight( true, false, 8.88, 98.88 )
				self.SpecialContractPercentCompleteWidget:setTopBottom( true, false, 41.56, 131.56 )
				self.SpecialContractPercentCompleteWidget:setScale( 0.9 )
				self.clipFinished( SpecialContractPercentCompleteWidget, {} )
				SpecialContractName:completeAnimation()
				self.SpecialContractName:setLeftRight( true, false, 102.25, 343.75 )
				self.SpecialContractName:setTopBottom( true, false, 59.05, 77.55 )
				self.SpecialContractName:setAlpha( 1 )
				self.clipFinished( SpecialContractName, {} )
				SpecialContractDesc:completeAnimation()
				self.SpecialContractDesc:setLeftRight( true, false, 102.25, 343.75 )
				self.SpecialContractDesc:setTopBottom( true, false, 78.05, 96.05 )
				self.SpecialContractDesc:setAlpha( 1 )
				self.clipFinished( SpecialContractDesc, {} )
				Title:completeAnimation()
				self.Title:setAlpha( 1 )
				self.clipFinished( Title, {} )
				local upperglowFrame2 = function ( upperglow, event )
					if not event.interrupted then
						upperglow:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					upperglow:setLeftRight( false, false, -306.13, -57.88 )
					upperglow:setTopBottom( true, false, -17.77, 30.28 )
					upperglow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( upperglow, event )
					else
						upperglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				upperglow:completeAnimation()
				self.upperglow:setLeftRight( false, false, -306.13, -57.88 )
				self.upperglow:setTopBottom( true, false, -17.77, 30.28 )
				self.upperglow:setAlpha( 0 )
				upperglowFrame2( upperglow, {} )
				local lowerglowFrame2 = function ( lowerglow, event )
					if not event.interrupted then
						lowerglow:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lowerglow:setLeftRight( false, false, -279, -95 )
					lowerglow:setTopBottom( false, true, -6.75, 33.25 )
					lowerglow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( lowerglow, event )
					else
						lowerglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lowerglow:completeAnimation()
				self.lowerglow:setLeftRight( false, false, -279, -95 )
				self.lowerglow:setTopBottom( false, true, -6.75, 33.25 )
				self.lowerglow:setAlpha( 0 )
				lowerglowFrame2( lowerglow, {} )
				local NineSliceShaderImageFrame2 = function ( NineSliceShaderImage, event )
					if not event.interrupted then
						NineSliceShaderImage:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					NineSliceShaderImage:setLeftRight( true, true, -5, -354 )
					NineSliceShaderImage:setTopBottom( true, true, -4.54, 4 )
					NineSliceShaderImage:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( NineSliceShaderImage, event )
					else
						NineSliceShaderImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				NineSliceShaderImage:completeAnimation()
				self.NineSliceShaderImage:setLeftRight( true, true, -5, -354 )
				self.NineSliceShaderImage:setTopBottom( true, true, -4.54, 4 )
				self.NineSliceShaderImage:setAlpha( 0 )
				NineSliceShaderImageFrame2( NineSliceShaderImage, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.SpecialContractPercentCompleteWidget:close()
		element.RewardImage:close()
		element.BMCompleteRibbon:close()
		element.BMCompleteRibbon0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

