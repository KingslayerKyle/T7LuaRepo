-- f1b3e30219f2289241b8039dd813402e
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.SpecialContracts.SpecialContracts_RewardImage" )
require( "ui.uieditor.widgets.SpecialContracts.SpecialContracts_StateIndicator" )
require( "ui.uieditor.widgets.BlackMarket.BM_Contracts_ActiveArrow" )
require( "ui.uieditor.widgets.SpecialContracts.SpecialContracts_Timer" )

CoD.SpecialContracts_SelectionButton = InheritFrom( LUI.UIElement )
CoD.SpecialContracts_SelectionButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.SpecialContracts_SelectionButton )
	self.id = "SpecialContracts_SelectionButton"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 250 )
	self:setTopBottom( true, false, 0, 162 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local Background0 = LUI.UIImage.new()
	Background0:setLeftRight( true, true, -0.68, -1 )
	Background0:setTopBottom( true, true, -1, 0 )
	Background0:setImage( RegisterImage( "uie_t7_blackmarket_contracts_bigframe" ) )
	Background0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	Background0:setShaderVector( 0, 0.22, 0.34, 0, 0 )
	Background0:setupNineSliceShader( 56, 56 )
	self:addElement( Background0 )
	self.Background0 = Background0
	
	local RewardImage = CoD.SpecialContracts_RewardImage.new( menu, controller )
	RewardImage:setLeftRight( false, false, -94, 94 )
	RewardImage:setTopBottom( false, false, -52, 52 )
	RewardImage:setScale( 1.2 )
	RewardImage:linkToElementModel( self, nil, false, function ( model )
		RewardImage:setModel( model, controller )
	end )
	self:addElement( RewardImage )
	self.RewardImage = RewardImage
	
	local NineSliceShaderImage = LUI.UIImage.new()
	NineSliceShaderImage:setLeftRight( true, true, -7, 6 )
	NineSliceShaderImage:setTopBottom( true, true, -7, 7 )
	NineSliceShaderImage:setAlpha( 0 )
	NineSliceShaderImage:setImage( RegisterImage( "uie_t7_bm_contracts_hover_9slice" ) )
	NineSliceShaderImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	NineSliceShaderImage:setShaderVector( 0, 0.18, 0.27, 0, 0 )
	NineSliceShaderImage:setupNineSliceShader( 48, 48 )
	self:addElement( NineSliceShaderImage )
	self.NineSliceShaderImage = NineSliceShaderImage
	
	local upperglow = LUI.UIImage.new()
	upperglow:setLeftRight( false, false, -126.13, 122.13 )
	upperglow:setTopBottom( true, false, -19.77, 28.28 )
	upperglow:setAlpha( 0 )
	upperglow:setImage( RegisterImage( "uie_t7_bm_contracts_hover_upperglow" ) )
	self:addElement( upperglow )
	self.upperglow = upperglow
	
	local lowerglow = LUI.UIImage.new()
	lowerglow:setLeftRight( false, false, -99, 85 )
	lowerglow:setTopBottom( false, true, -2.75, 37.25 )
	lowerglow:setAlpha( 0 )
	lowerglow:setImage( RegisterImage( "uie_t7_bm_contracts_hover_lowerglow" ) )
	self:addElement( lowerglow )
	self.lowerglow = lowerglow
	
	local name = LUI.UITightText.new()
	name:setLeftRight( true, false, 14.5, 217.5 )
	name:setTopBottom( true, false, 135, 151 )
	name:setRGB( 0.46, 0.8, 0.75 )
	name:setTTF( "fonts/escom.ttf" )
	name:linkToElementModel( self, "name", true, function ( model )
		local _name = Engine.GetModelValue( model )
		if _name then
			name:setText( LocalizeToUpperString( _name ) )
		end
	end )
	self:addElement( name )
	self.name = name
	
	local SpecialContractsStateIndicator = CoD.SpecialContracts_StateIndicator.new( menu, controller )
	SpecialContractsStateIndicator:setLeftRight( true, false, 8.5, 88.5 )
	SpecialContractsStateIndicator:setTopBottom( true, false, 11.16, 31.16 )
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
	
	local Complted = LUI.UIImage.new()
	Complted:setLeftRight( true, false, 203.5, 251.5 )
	Complted:setTopBottom( true, false, 3.25, 35.25 )
	Complted:setImage( RegisterImage( "uie_t7_bm_contracts_completed_ribbon" ) )
	self:addElement( Complted )
	self.Complted = Complted
	
	local ActiveArrow = CoD.BM_Contracts_ActiveArrow.new( menu, controller )
	ActiveArrow:setLeftRight( true, false, -3.13, 71.5 )
	ActiveArrow:setTopBottom( true, false, 3.25, 31.25 )
	ActiveArrow.left:setImage( RegisterImage( "uie_t7_bm_contracts_active_ribbon_left" ) )
	ActiveArrow.center:setImage( RegisterImage( "uie_t7_bm_contracts_active_ribbon_center" ) )
	ActiveArrow.right:setImage( RegisterImage( "uie_t7_bm_contracts_active_ribbon_right" ) )
	ActiveArrow.Text:setText( Engine.Localize( "MPUI_ACTIVE_CAPS" ) )
	self:addElement( ActiveArrow )
	self.ActiveArrow = ActiveArrow
	
	local Timer = CoD.SpecialContracts_Timer.new( menu, controller )
	Timer:setLeftRight( true, false, 15.5, 234.5 )
	Timer:setTopBottom( true, false, 9.25, 25.25 )
	Timer:subscribeToGlobalModel( controller, "AutoeventsBribeTimer", "autoevent_timer_trifecta_promo", function ( model )
		local autoeventTimerTrifectaPromo = Engine.GetModelValue( model )
		if autoeventTimerTrifectaPromo then
			Timer.TriplePlayTimer:setText( LocalizeIntoString( "MPUI_BM_PROMO_EXPIRES", autoeventTimerTrifectaPromo ) )
		end
	end )
	Timer:subscribeToGlobalModel( controller, "AutoeventsBribeTimer", "autoevent_timer_grandslam", function ( model )
		local autoeventTimerGrandslam = Engine.GetModelValue( model )
		if autoeventTimerGrandslam then
			Timer.GrandSlamTimer:setText( LocalizeIntoString( "MPUI_BM_PROMO_EXPIRES", autoeventTimerGrandslam ) )
		end
	end )
	Timer:linkToElementModel( self, nil, false, function ( model )
		Timer:setModel( model, controller )
	end )
	Timer:mergeStateConditions( {
		{
			stateName = "TriplePlay",
			condition = function ( menu, element, event )
				return IsSpecialContractTimerActive( self, element, controller ) and IsSelfModelValueEqualTo( element, controller, "category", "trifecta" )
			end
		},
		{
			stateName = "GrandSlam",
			condition = function ( menu, element, event )
				return IsSpecialContractTimerActive( self, element, controller ) and IsSelfModelValueEqualTo( element, controller, "category", "grand_slam" )
			end
		}
	} )
	Timer:linkToElementModel( Timer, "category", true, function ( model )
		menu:updateElementState( Timer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "category"
		} )
	end )
	self:addElement( Timer )
	self.Timer = Timer
	
	self.RewardImage:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			RewardImage.ItemImage:setImage( RegisterImage( image ) )
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
				self:setupElementClipCounter( 4 )

				NineSliceShaderImage:completeAnimation()
				self.NineSliceShaderImage:setAlpha( 0 )
				self.clipFinished( NineSliceShaderImage, {} )

				SpecialContractsStateIndicator:completeAnimation()
				self.SpecialContractsStateIndicator:setAlpha( 1 )
				self.clipFinished( SpecialContractsStateIndicator, {} )

				Complted:completeAnimation()
				self.Complted:setAlpha( 0 )
				self.clipFinished( Complted, {} )

				ActiveArrow:completeAnimation()
				self.ActiveArrow:setAlpha( 0 )
				self.clipFinished( ActiveArrow, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 3 )

				local NineSliceShaderImageFrame2 = function ( NineSliceShaderImage, event )
					if not event.interrupted then
						NineSliceShaderImage:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					NineSliceShaderImage:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( NineSliceShaderImage, event )
					else
						NineSliceShaderImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				NineSliceShaderImage:completeAnimation()
				self.NineSliceShaderImage:setAlpha( 0 )
				NineSliceShaderImageFrame2( NineSliceShaderImage, {} )
				local upperglowFrame2 = function ( upperglow, event )
					if not event.interrupted then
						upperglow:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					upperglow:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( upperglow, event )
					else
						upperglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				upperglow:completeAnimation()
				self.upperglow:setAlpha( 0 )
				upperglowFrame2( upperglow, {} )
				local lowerglowFrame2 = function ( lowerglow, event )
					if not event.interrupted then
						lowerglow:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lowerglow:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( lowerglow, event )
					else
						lowerglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lowerglow:completeAnimation()
				self.lowerglow:setAlpha( 0 )
				lowerglowFrame2( lowerglow, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 3 )

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
						upperglow:setAlpha( 0.48 )
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
						lowerglow:setAlpha( 0.48 )
						lowerglow:registerEventHandler( "transition_complete_keyframe", lowerglowFrame3 )
					end
				end
				
				lowerglow:completeAnimation()
				self.lowerglow:setAlpha( 1 )
				lowerglowFrame2( lowerglow, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 3 )

				local NineSliceShaderImageFrame2 = function ( NineSliceShaderImage, event )
					if not event.interrupted then
						NineSliceShaderImage:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					NineSliceShaderImage:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( NineSliceShaderImage, event )
					else
						NineSliceShaderImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				NineSliceShaderImage:completeAnimation()
				self.NineSliceShaderImage:setAlpha( 1 )
				NineSliceShaderImageFrame2( NineSliceShaderImage, {} )
				local upperglowFrame2 = function ( upperglow, event )
					if not event.interrupted then
						upperglow:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					upperglow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( upperglow, event )
					else
						upperglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				upperglow:completeAnimation()
				self.upperglow:setAlpha( 1 )
				upperglowFrame2( upperglow, {} )
				local lowerglowFrame2 = function ( lowerglow, event )
					if not event.interrupted then
						lowerglow:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lowerglow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( lowerglow, event )
					else
						lowerglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lowerglow:completeAnimation()
				self.lowerglow:setAlpha( 1 )
				lowerglowFrame2( lowerglow, {} )
			end
		},
		AllComplete = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				NineSliceShaderImage:completeAnimation()
				self.NineSliceShaderImage:setAlpha( 0 )
				self.clipFinished( NineSliceShaderImage, {} )

				SpecialContractsStateIndicator:completeAnimation()
				self.SpecialContractsStateIndicator:setAlpha( 0 )
				self.clipFinished( SpecialContractsStateIndicator, {} )

				Complted:completeAnimation()
				self.Complted:setAlpha( 1 )
				self.clipFinished( Complted, {} )

				ActiveArrow:completeAnimation()
				self.ActiveArrow:setAlpha( 0 )
				self.clipFinished( ActiveArrow, {} )

				Timer:completeAnimation()
				self.Timer:setAlpha( 0 )
				self.clipFinished( Timer, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 3 )

				local NineSliceShaderImageFrame2 = function ( NineSliceShaderImage, event )
					if not event.interrupted then
						NineSliceShaderImage:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					NineSliceShaderImage:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( NineSliceShaderImage, event )
					else
						NineSliceShaderImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				NineSliceShaderImage:completeAnimation()
				self.NineSliceShaderImage:setAlpha( 0 )
				NineSliceShaderImageFrame2( NineSliceShaderImage, {} )
				local upperglowFrame2 = function ( upperglow, event )
					if not event.interrupted then
						upperglow:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					upperglow:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( upperglow, event )
					else
						upperglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				upperglow:completeAnimation()
				self.upperglow:setAlpha( 0 )
				upperglowFrame2( upperglow, {} )
				local lowerglowFrame2 = function ( lowerglow, event )
					if not event.interrupted then
						lowerglow:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lowerglow:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( lowerglow, event )
					else
						lowerglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lowerglow:completeAnimation()
				self.lowerglow:setAlpha( 0 )
				lowerglowFrame2( lowerglow, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 3 )

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
						upperglow:setAlpha( 0.48 )
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
						lowerglow:setAlpha( 0.48 )
						lowerglow:registerEventHandler( "transition_complete_keyframe", lowerglowFrame3 )
					end
				end
				
				lowerglow:completeAnimation()
				self.lowerglow:setAlpha( 1 )
				lowerglowFrame2( lowerglow, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 3 )

				local NineSliceShaderImageFrame2 = function ( NineSliceShaderImage, event )
					if not event.interrupted then
						NineSliceShaderImage:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					NineSliceShaderImage:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( NineSliceShaderImage, event )
					else
						NineSliceShaderImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				NineSliceShaderImage:completeAnimation()
				self.NineSliceShaderImage:setAlpha( 1 )
				NineSliceShaderImageFrame2( NineSliceShaderImage, {} )
				local upperglowFrame2 = function ( upperglow, event )
					if not event.interrupted then
						upperglow:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					upperglow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( upperglow, event )
					else
						upperglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				upperglow:completeAnimation()
				self.upperglow:setAlpha( 1 )
				upperglowFrame2( upperglow, {} )
				local lowerglowFrame2 = function ( lowerglow, event )
					if not event.interrupted then
						lowerglow:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lowerglow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( lowerglow, event )
					else
						lowerglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lowerglow:completeAnimation()
				self.lowerglow:setAlpha( 1 )
				lowerglowFrame2( lowerglow, {} )
			end
		},
		Complete = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				NineSliceShaderImage:completeAnimation()
				self.NineSliceShaderImage:setAlpha( 0 )
				self.clipFinished( NineSliceShaderImage, {} )

				SpecialContractsStateIndicator:completeAnimation()
				self.SpecialContractsStateIndicator:setAlpha( 0 )
				self.clipFinished( SpecialContractsStateIndicator, {} )

				Complted:completeAnimation()
				self.Complted:setAlpha( 1 )
				self.clipFinished( Complted, {} )

				ActiveArrow:completeAnimation()
				self.ActiveArrow:setAlpha( 0 )
				self.clipFinished( ActiveArrow, {} )

				Timer:completeAnimation()
				self.Timer:setAlpha( 0 )
				self.clipFinished( Timer, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 3 )

				local NineSliceShaderImageFrame2 = function ( NineSliceShaderImage, event )
					if not event.interrupted then
						NineSliceShaderImage:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					NineSliceShaderImage:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( NineSliceShaderImage, event )
					else
						NineSliceShaderImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				NineSliceShaderImage:completeAnimation()
				self.NineSliceShaderImage:setAlpha( 0 )
				NineSliceShaderImageFrame2( NineSliceShaderImage, {} )
				local upperglowFrame2 = function ( upperglow, event )
					if not event.interrupted then
						upperglow:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					upperglow:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( upperglow, event )
					else
						upperglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				upperglow:completeAnimation()
				self.upperglow:setAlpha( 0 )
				upperglowFrame2( upperglow, {} )
				local lowerglowFrame2 = function ( lowerglow, event )
					if not event.interrupted then
						lowerglow:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lowerglow:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( lowerglow, event )
					else
						lowerglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lowerglow:completeAnimation()
				self.lowerglow:setAlpha( 0 )
				lowerglowFrame2( lowerglow, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 3 )

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
						upperglow:setAlpha( 0.48 )
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
						lowerglow:setAlpha( 0.48 )
						lowerglow:registerEventHandler( "transition_complete_keyframe", lowerglowFrame3 )
					end
				end
				
				lowerglow:completeAnimation()
				self.lowerglow:setAlpha( 1 )
				lowerglowFrame2( lowerglow, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 3 )

				local NineSliceShaderImageFrame2 = function ( NineSliceShaderImage, event )
					if not event.interrupted then
						NineSliceShaderImage:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					NineSliceShaderImage:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( NineSliceShaderImage, event )
					else
						NineSliceShaderImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				NineSliceShaderImage:completeAnimation()
				self.NineSliceShaderImage:setAlpha( 1 )
				NineSliceShaderImageFrame2( NineSliceShaderImage, {} )
				local upperglowFrame2 = function ( upperglow, event )
					if not event.interrupted then
						upperglow:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					upperglow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( upperglow, event )
					else
						upperglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				upperglow:completeAnimation()
				self.upperglow:setAlpha( 1 )
				upperglowFrame2( upperglow, {} )
				local lowerglowFrame2 = function ( lowerglow, event )
					if not event.interrupted then
						lowerglow:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lowerglow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( lowerglow, event )
					else
						lowerglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lowerglow:completeAnimation()
				self.lowerglow:setAlpha( 1 )
				lowerglowFrame2( lowerglow, {} )
			end
		},
		Active = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				NineSliceShaderImage:completeAnimation()
				self.NineSliceShaderImage:setAlpha( 0 )
				self.clipFinished( NineSliceShaderImage, {} )

				SpecialContractsStateIndicator:completeAnimation()
				self.SpecialContractsStateIndicator:setAlpha( 0 )
				self.clipFinished( SpecialContractsStateIndicator, {} )

				Complted:completeAnimation()
				self.Complted:setAlpha( 0 )
				self.clipFinished( Complted, {} )

				ActiveArrow:completeAnimation()
				self.ActiveArrow:setAlpha( 1 )
				self.clipFinished( ActiveArrow, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 3 )

				local NineSliceShaderImageFrame2 = function ( NineSliceShaderImage, event )
					if not event.interrupted then
						NineSliceShaderImage:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					NineSliceShaderImage:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( NineSliceShaderImage, event )
					else
						NineSliceShaderImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				NineSliceShaderImage:completeAnimation()
				self.NineSliceShaderImage:setAlpha( 0 )
				NineSliceShaderImageFrame2( NineSliceShaderImage, {} )
				local upperglowFrame2 = function ( upperglow, event )
					if not event.interrupted then
						upperglow:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					upperglow:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( upperglow, event )
					else
						upperglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				upperglow:completeAnimation()
				self.upperglow:setAlpha( 0 )
				upperglowFrame2( upperglow, {} )
				local lowerglowFrame2 = function ( lowerglow, event )
					if not event.interrupted then
						lowerglow:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lowerglow:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( lowerglow, event )
					else
						lowerglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lowerglow:completeAnimation()
				self.lowerglow:setAlpha( 0 )
				lowerglowFrame2( lowerglow, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 3 )

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
						upperglow:setAlpha( 0.48 )
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
						lowerglow:setAlpha( 0.48 )
						lowerglow:registerEventHandler( "transition_complete_keyframe", lowerglowFrame3 )
					end
				end
				
				lowerglow:completeAnimation()
				self.lowerglow:setAlpha( 1 )
				lowerglowFrame2( lowerglow, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 3 )

				local NineSliceShaderImageFrame2 = function ( NineSliceShaderImage, event )
					if not event.interrupted then
						NineSliceShaderImage:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					NineSliceShaderImage:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( NineSliceShaderImage, event )
					else
						NineSliceShaderImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				NineSliceShaderImage:completeAnimation()
				self.NineSliceShaderImage:setAlpha( 1 )
				NineSliceShaderImageFrame2( NineSliceShaderImage, {} )
				local upperglowFrame2 = function ( upperglow, event )
					if not event.interrupted then
						upperglow:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					upperglow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( upperglow, event )
					else
						upperglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				upperglow:completeAnimation()
				self.upperglow:setAlpha( 1 )
				upperglowFrame2( upperglow, {} )
				local lowerglowFrame2 = function ( lowerglow, event )
					if not event.interrupted then
						lowerglow:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lowerglow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( lowerglow, event )
					else
						lowerglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lowerglow:completeAnimation()
				self.lowerglow:setAlpha( 1 )
				lowerglowFrame2( lowerglow, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "AllComplete",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
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
		element.RewardImage:close()
		element.SpecialContractsStateIndicator:close()
		element.ActiveArrow:close()
		element.Timer:close()
		element.name:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
