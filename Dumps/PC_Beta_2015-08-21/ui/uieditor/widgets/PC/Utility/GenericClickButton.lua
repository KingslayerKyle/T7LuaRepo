require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:setHandleMouse( true )
	f1_arg0:registerEventHandler( "button_action", function ( element, event )
		if element.m_button then
			local f2_local0 = Engine.GetModel( Engine.GetModelForController( f1_arg1 ), "ButtonBits." .. element.m_button )
			if f2_local0 then
				Engine.SetModelValue( f2_local0, Enum.LUIButtonFlags.FLAG_DOWN )
			end
		end
	end )
	f1_arg0.setButton = function ( f3_arg0, f3_arg1 )
		f1_arg0.m_button = f3_arg1
	end
	
end

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		f0_local0( self, controller, menu )
	end
end

CoD.GenericClickButton = InheritFrom( LUI.UIElement )
CoD.GenericClickButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GenericClickButton )
	self.id = "GenericClickButton"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 135 )
	self:setTopBottom( true, false, 0, 40 )
	self.anyChildUsesUpdateState = true
	
	local FEButtonFocus = LUI.UIImage.new()
	FEButtonFocus:setLeftRight( true, true, 0, 0 )
	FEButtonFocus:setTopBottom( true, true, 0, 0 )
	FEButtonFocus:setZoom( 10 )
	FEButtonFocus:setImage( RegisterImage( "uie_t7_menu_frontend_buttonfocusfull" ) )
	FEButtonFocus:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	FEButtonFocus:setShaderVector( 0, 0.2, 0.5, 0.38, 0.2 )
	FEButtonFocus:setupNineSliceShader( 60, 20 )
	self:addElement( FEButtonFocus )
	self.FEButtonFocus = FEButtonFocus
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, 23, -23 )
	FocusBarB:setTopBottom( false, true, -6.11, -8.11 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, 23, -23 )
	FocusBarT:setTopBottom( true, false, 7.11, 5.11 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZRot( 180 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local Arrow = LUI.UIImage.new()
	Arrow:setLeftRight( true, false, 0, -11.86 )
	Arrow:setTopBottom( false, false, -7, 7 )
	Arrow:setYRot( 180 )
	Arrow:setZoom( 10 )
	Arrow:setImage( RegisterImage( "uie_t7_menu_frontend_buttonfocusarrow" ) )
	Arrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Arrow )
	self.Arrow = Arrow
	
	local Glow21 = LUI.UIImage.new()
	Glow21:setLeftRight( true, true, 0, 0 )
	Glow21:setTopBottom( true, true, -2.5, 2.5 )
	Glow21:setAlpha( 0 )
	Glow21:setImage( RegisterImage( "uie_t7_cp_hud_enemytarget_glow" ) )
	Glow21:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow21 )
	self.Glow21 = Glow21
	
	local label = LUI.UIText.new()
	label:setLeftRight( true, true, 17, -3.69 )
	label:setTopBottom( false, false, -10.89, 10.89 )
	label:setRGB( 0, 0, 0 )
	label:setText( Engine.Localize( "PLATFORM_YES_CAPS" ) )
	label:setTTF( "fonts/escom.ttf" )
	label:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	label:setShaderVector( 0, 0, 0, 0, 0 )
	label:setShaderVector( 1, 0, 0, 0, 0 )
	label:setShaderVector( 2, 1, 0, 0, 0 )
	label:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	label:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( label )
	self.label = label
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				Arrow:completeAnimation()
				self.Arrow:setLeftRight( true, false, 0, -11.86 )
				self.Arrow:setTopBottom( false, false, -7, 7 )
				self.clipFinished( Arrow, {} )
				Glow21:completeAnimation()
				self.Glow21:setAlpha( 0 )
				self.clipFinished( Glow21, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 4 )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0.5 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0.5 )
				self.clipFinished( FocusBarT, {} )
				Arrow:completeAnimation()
				self.Arrow:setLeftRight( true, false, 8, -3.86 )
				self.Arrow:setTopBottom( false, false, -7, 7 )
				self.clipFinished( Arrow, {} )
				Glow21:completeAnimation()
				self.Glow21:setAlpha( 1 )
				self.clipFinished( Glow21, {} )
			end,
			GainOver = function ()
				self:setupElementClipCounter( 4 )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					if not event.interrupted then
						FocusBarB:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					FocusBarB:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarB, event )
					else
						FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					FocusBarT:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				FocusBarTFrame2( FocusBarT, {} )
				local ArrowFrame2 = function ( Arrow, event )
					if not event.interrupted then
						Arrow:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Arrow:setLeftRight( true, false, 8, -3.86 )
					Arrow:setTopBottom( false, false, -7, 7 )
					if event.interrupted then
						self.clipFinished( Arrow, event )
					else
						Arrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Arrow:completeAnimation()
				self.Arrow:setLeftRight( true, false, 0, -11.86 )
				self.Arrow:setTopBottom( false, false, -7, 7 )
				ArrowFrame2( Arrow, {} )
				local Glow21Frame2 = function ( Glow21, event )
					if not event.interrupted then
						Glow21:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					Glow21:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Glow21, event )
					else
						Glow21:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow21:completeAnimation()
				self.Glow21:setAlpha( 0 )
				Glow21Frame2( Glow21, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FocusBarB:close()
		element.FocusBarT:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

