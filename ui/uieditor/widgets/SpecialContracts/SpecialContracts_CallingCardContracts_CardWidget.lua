-- c7f53d9f0752b9e14dbf3deae56d04d9
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CallingCards.CallingCards_FrameWidget" )
require( "ui.uieditor.widgets.BlackMarket.BM_Contracts_ActiveArrow" )

CoD.SpecialContracts_CallingCardContracts_CardWidget = InheritFrom( LUI.UIElement )
CoD.SpecialContracts_CallingCardContracts_CardWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SpecialContracts_CallingCardContracts_CardWidget )
	self.id = "SpecialContracts_CallingCardContracts_CardWidget"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 240 )
	self:setTopBottom( true, false, 0, 84 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local frame = LUI.UIImage.new()
	frame:setLeftRight( true, false, -4, 244 )
	frame:setTopBottom( true, false, -4, 87 )
	frame:setImage( RegisterImage( "uie_t7_blackmarket_contracts_cc_frame" ) )
	frame:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	frame:setShaderVector( 0, 0.18, 0.49, 0, 0 )
	frame:setupNineSliceShader( 45, 45 )
	self:addElement( frame )
	self.frame = frame
	
	local text = LUI.UIText.new()
	text:setLeftRight( true, false, 4, 236 )
	text:setTopBottom( true, false, 63, 82 )
	text:setAlpha( 0.85 )
	text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	text:setLetterSpacing( 0.5 )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	text:linkToElementModel( self, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			text:setText( Engine.Localize( name ) )
		end
	end )
	self:addElement( text )
	self.text = text
	
	local CardIcon = CoD.CallingCards_FrameWidget.new( menu, controller )
	CardIcon:setLeftRight( true, false, -120, 360 )
	CardIcon:setTopBottom( true, false, -30, 90 )
	CardIcon.CardIconFrame:setScale( 0.5 )
	CardIcon:linkToElementModel( self, nil, false, function ( model )
		CardIcon:setModel( model, controller )
	end )
	self:addElement( CardIcon )
	self.CardIcon = CardIcon
	
	local black = LUI.UIImage.new()
	black:setLeftRight( true, false, -1, 241 )
	black:setTopBottom( true, false, 30, 33 )
	black:setRGB( 0, 0, 0 )
	black:setAlpha( 0 )
	self:addElement( black )
	self.black = black
	
	local Lock = LUI.UIImage.new()
	Lock:setLeftRight( true, false, 104, 136 )
	Lock:setTopBottom( true, false, 15.72, 47.72 )
	Lock:setAlpha( 0 )
	Lock:setImage( RegisterImage( "uie_t7_blackmarket_contract_callingcard_lock" ) )
	self:addElement( Lock )
	self.Lock = Lock
	
	local NineSliceShaderHover = LUI.UIImage.new()
	NineSliceShaderHover:setLeftRight( true, true, -11, 11.16 )
	NineSliceShaderHover:setTopBottom( true, true, -17, 10 )
	NineSliceShaderHover:setImage( RegisterImage( "uie_t7_blackmarket_contracts_cc_frame_hover" ) )
	NineSliceShaderHover:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	NineSliceShaderHover:setShaderVector( 0, 0.18, 0.43, 0, 0 )
	NineSliceShaderHover:setupNineSliceShader( 48, 48 )
	self:addElement( NineSliceShaderHover )
	self.NineSliceShaderHover = NineSliceShaderHover
	
	local upperglow = LUI.UIImage.new()
	upperglow:setLeftRight( false, false, -126.13, 122.13 )
	upperglow:setTopBottom( true, false, -23.77, 23.28 )
	upperglow:setImage( RegisterImage( "uie_t7_bm_contracts_hover_upperglow" ) )
	self:addElement( upperglow )
	self.upperglow = upperglow
	
	local lowerglow = LUI.UIImage.new()
	lowerglow:setLeftRight( false, false, -100, 84 )
	lowerglow:setTopBottom( false, true, 0, 40 )
	lowerglow:setImage( RegisterImage( "uie_t7_bm_contracts_hover_lowerglow" ) )
	self:addElement( lowerglow )
	self.lowerglow = lowerglow
	
	local ActiveArrow = CoD.BM_Contracts_ActiveArrow.new( menu, controller )
	ActiveArrow:setLeftRight( true, false, -7.13, 67.5 )
	ActiveArrow:setTopBottom( true, false, -4, 24 )
	ActiveArrow.left:setImage( RegisterImage( "uie_t7_bm_contracts_active_ribbon_left" ) )
	ActiveArrow.center:setImage( RegisterImage( "uie_t7_bm_contracts_active_ribbon_center" ) )
	ActiveArrow.right:setImage( RegisterImage( "uie_t7_bm_contracts_active_ribbon_right" ) )
	ActiveArrow.Text:setText( Engine.Localize( "MPUI_ACTIVE_CAPS" ) )
	self:addElement( ActiveArrow )
	self.ActiveArrow = ActiveArrow
	
	local black0 = LUI.UIImage.new()
	black0:setLeftRight( true, false, -0.92, 241.08 )
	black0:setTopBottom( true, false, 30.72, 33.72 )
	black0:setRGB( 0, 0, 0 )
	black0:setAlpha( 0 )
	self:addElement( black0 )
	self.black0 = black0
	
	local Lock0 = LUI.UIImage.new()
	Lock0:setLeftRight( true, false, 104.08, 136.08 )
	Lock0:setTopBottom( true, false, 16.44, 48.44 )
	Lock0:setAlpha( 0 )
	Lock0:setImage( RegisterImage( "uie_t7_blackmarket_contract_callingcard_lock" ) )
	self:addElement( Lock0 )
	self.Lock0 = Lock0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				CardIcon:completeAnimation()
				self.CardIcon:setAlpha( 1 )
				self.clipFinished( CardIcon, {} )
				NineSliceShaderHover:completeAnimation()
				self.NineSliceShaderHover:setAlpha( 0 )
				self.clipFinished( NineSliceShaderHover, {} )
				upperglow:completeAnimation()
				self.upperglow:setAlpha( 0 )
				self.clipFinished( upperglow, {} )
				lowerglow:completeAnimation()
				self.lowerglow:setAlpha( 0 )
				self.clipFinished( lowerglow, {} )
				ActiveArrow:completeAnimation()
				self.ActiveArrow:setAlpha( 0 )
				self.clipFinished( ActiveArrow, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 6 )
				CardIcon:completeAnimation()
				self.CardIcon:setAlpha( 1 )
				self.clipFinished( CardIcon, {} )
				black:completeAnimation()
				self.black:setAlpha( 0 )
				self.clipFinished( black, {} )
				Lock:completeAnimation()
				self.Lock:setAlpha( 0 )
				self.clipFinished( Lock, {} )
				local NineSliceShaderHoverFrame2 = function ( NineSliceShaderHover, event )
					local NineSliceShaderHoverFrame3 = function ( NineSliceShaderHover, event )
						if not event.interrupted then
							NineSliceShaderHover:beginAnimation( "keyframe", 799, false, false, CoD.TweenType.Linear )
						end
						NineSliceShaderHover:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( NineSliceShaderHover, event )
						else
							NineSliceShaderHover:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						NineSliceShaderHoverFrame3( NineSliceShaderHover, event )
						return 
					else
						NineSliceShaderHover:beginAnimation( "keyframe", 740, false, false, CoD.TweenType.Linear )
						NineSliceShaderHover:setAlpha( 0.8 )
						NineSliceShaderHover:registerEventHandler( "transition_complete_keyframe", NineSliceShaderHoverFrame3 )
					end
				end
				
				NineSliceShaderHover:completeAnimation()
				self.NineSliceShaderHover:setAlpha( 1 )
				NineSliceShaderHoverFrame2( NineSliceShaderHover, {} )
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
			end
		},
		Complete = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				CardIcon:completeAnimation()
				self.CardIcon:setAlpha( 1 )
				self.clipFinished( CardIcon, {} )
				black:completeAnimation()
				self.black:setAlpha( 0 )
				self.clipFinished( black, {} )
				Lock:completeAnimation()
				self.Lock:setAlpha( 0 )
				self.clipFinished( Lock, {} )
				NineSliceShaderHover:completeAnimation()
				self.NineSliceShaderHover:setAlpha( 1 )
				self.clipFinished( NineSliceShaderHover, {} )
				upperglow:completeAnimation()
				self.upperglow:setAlpha( 0 )
				self.clipFinished( upperglow, {} )
				lowerglow:completeAnimation()
				self.lowerglow:setAlpha( 0 )
				self.clipFinished( lowerglow, {} )
				ActiveArrow:completeAnimation()
				self.ActiveArrow:setLeftRight( true, false, -6.13, 68.5 )
				self.ActiveArrow:setTopBottom( true, false, -5, 23 )
				self.ActiveArrow:setAlpha( 0 )
				self.clipFinished( ActiveArrow, {} )
				black0:completeAnimation()
				self.black0:setAlpha( 0 )
				self.clipFinished( black0, {} )
				Lock0:completeAnimation()
				self.Lock0:setAlpha( 0 )
				self.clipFinished( Lock0, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 5 )
				CardIcon:completeAnimation()
				self.CardIcon:setAlpha( 1 )
				self.clipFinished( CardIcon, {} )
				local NineSliceShaderHoverFrame2 = function ( NineSliceShaderHover, event )
					local NineSliceShaderHoverFrame3 = function ( NineSliceShaderHover, event )
						if not event.interrupted then
							NineSliceShaderHover:beginAnimation( "keyframe", 799, false, false, CoD.TweenType.Linear )
						end
						NineSliceShaderHover:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( NineSliceShaderHover, event )
						else
							NineSliceShaderHover:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						NineSliceShaderHoverFrame3( NineSliceShaderHover, event )
						return 
					else
						NineSliceShaderHover:beginAnimation( "keyframe", 740, false, false, CoD.TweenType.Linear )
						NineSliceShaderHover:setAlpha( 0.8 )
						NineSliceShaderHover:registerEventHandler( "transition_complete_keyframe", NineSliceShaderHoverFrame3 )
					end
				end
				
				NineSliceShaderHover:completeAnimation()
				self.NineSliceShaderHover:setAlpha( 1 )
				NineSliceShaderHoverFrame2( NineSliceShaderHover, {} )
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
				ActiveArrow:completeAnimation()
				self.ActiveArrow:setAlpha( 0 )
				self.clipFinished( ActiveArrow, {} )
			end
		},
		Active = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				CardIcon:completeAnimation()
				self.CardIcon:setAlpha( 0.2 )
				self.clipFinished( CardIcon, {} )
				black:completeAnimation()
				self.black:setAlpha( 0 )
				self.clipFinished( black, {} )
				Lock:completeAnimation()
				self.Lock:setAlpha( 0 )
				self.clipFinished( Lock, {} )
				NineSliceShaderHover:completeAnimation()
				self.NineSliceShaderHover:setAlpha( 0 )
				self.clipFinished( NineSliceShaderHover, {} )
				upperglow:completeAnimation()
				self.upperglow:setAlpha( 0 )
				self.clipFinished( upperglow, {} )
				lowerglow:completeAnimation()
				self.lowerglow:setAlpha( 0 )
				self.clipFinished( lowerglow, {} )
				ActiveArrow:completeAnimation()
				self.ActiveArrow:setAlpha( 1 )
				self.clipFinished( ActiveArrow, {} )
				black0:completeAnimation()
				self.black0:setAlpha( 1 )
				self.clipFinished( black0, {} )
				Lock0:completeAnimation()
				self.Lock0:setAlpha( 1 )
				self.clipFinished( Lock0, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 6 )
				CardIcon:completeAnimation()
				self.CardIcon:setAlpha( 0.2 )
				self.clipFinished( CardIcon, {} )
				local NineSliceShaderHoverFrame2 = function ( NineSliceShaderHover, event )
					local NineSliceShaderHoverFrame3 = function ( NineSliceShaderHover, event )
						if not event.interrupted then
							NineSliceShaderHover:beginAnimation( "keyframe", 799, false, false, CoD.TweenType.Linear )
						end
						NineSliceShaderHover:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( NineSliceShaderHover, event )
						else
							NineSliceShaderHover:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						NineSliceShaderHoverFrame3( NineSliceShaderHover, event )
						return 
					else
						NineSliceShaderHover:beginAnimation( "keyframe", 740, false, false, CoD.TweenType.Linear )
						NineSliceShaderHover:setAlpha( 0.8 )
						NineSliceShaderHover:registerEventHandler( "transition_complete_keyframe", NineSliceShaderHoverFrame3 )
					end
				end
				
				NineSliceShaderHover:completeAnimation()
				self.NineSliceShaderHover:setAlpha( 1 )
				NineSliceShaderHoverFrame2( NineSliceShaderHover, {} )
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
				black0:completeAnimation()
				self.black0:setAlpha( 1 )
				self.clipFinished( black0, {} )
				Lock0:completeAnimation()
				self.Lock0:setAlpha( 1 )
				self.clipFinished( Lock0, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				CardIcon:completeAnimation()
				self.CardIcon:setAlpha( 0.2 )
				self.clipFinished( CardIcon, {} )
				NineSliceShaderHover:completeAnimation()
				self.NineSliceShaderHover:setAlpha( 0 )
				self.clipFinished( NineSliceShaderHover, {} )
				upperglow:completeAnimation()
				self.upperglow:setAlpha( 0 )
				self.clipFinished( upperglow, {} )
				lowerglow:completeAnimation()
				self.lowerglow:setAlpha( 0 )
				self.clipFinished( lowerglow, {} )
				ActiveArrow:completeAnimation()
				self.ActiveArrow:setAlpha( 0 )
				self.clipFinished( ActiveArrow, {} )
				black0:completeAnimation()
				self.black0:setAlpha( 1 )
				self.clipFinished( black0, {} )
				Lock0:completeAnimation()
				self.Lock0:setAlpha( 1 )
				self.clipFinished( Lock0, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 9 )
				CardIcon:completeAnimation()
				self.CardIcon:setAlpha( 0.2 )
				self.clipFinished( CardIcon, {} )
				black:completeAnimation()
				self.black:setAlpha( 0 )
				self.clipFinished( black, {} )
				Lock:completeAnimation()
				self.Lock:setAlpha( 0 )
				self.clipFinished( Lock, {} )
				local NineSliceShaderHoverFrame2 = function ( NineSliceShaderHover, event )
					local NineSliceShaderHoverFrame3 = function ( NineSliceShaderHover, event )
						if not event.interrupted then
							NineSliceShaderHover:beginAnimation( "keyframe", 799, false, false, CoD.TweenType.Linear )
						end
						NineSliceShaderHover:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( NineSliceShaderHover, event )
						else
							NineSliceShaderHover:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						NineSliceShaderHoverFrame3( NineSliceShaderHover, event )
						return 
					else
						NineSliceShaderHover:beginAnimation( "keyframe", 740, false, false, CoD.TweenType.Linear )
						NineSliceShaderHover:setAlpha( 0.8 )
						NineSliceShaderHover:registerEventHandler( "transition_complete_keyframe", NineSliceShaderHoverFrame3 )
					end
				end
				
				NineSliceShaderHover:completeAnimation()
				self.NineSliceShaderHover:setAlpha( 1 )
				NineSliceShaderHoverFrame2( NineSliceShaderHover, {} )
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
				ActiveArrow:completeAnimation()
				self.ActiveArrow:setAlpha( 0 )
				self.clipFinished( ActiveArrow, {} )
				black0:completeAnimation()
				self.black0:setAlpha( 1 )
				self.clipFinished( black0, {} )
				Lock0:completeAnimation()
				self.Lock0:setAlpha( 1 )
				self.clipFinished( Lock0, {} )
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
		element.CardIcon:close()
		element.ActiveArrow:close()
		element.text:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

