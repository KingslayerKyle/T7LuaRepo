require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

local SetupPC = function ( self, controller, menu )
	self:setHandleMouse( true )
	self:registerEventHandler( "button_action", function ( self, event )
		if self.m_button then
			CoD.PCUtil.SimulateButtonPress( controller, self.m_button )
		end
		return true
	end )
	self.setButton = function ( element, button )
		self.m_button = button
	end
	
end

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		SetupPC( self, controller, menu )
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
	self:setLeftRight( 0, 0, 0, 202 )
	self:setTopBottom( 0, 0, 0, 60 )
	self.anyChildUsesUpdateState = true
	
	local FEButtonFocus = LUI.UIImage.new()
	FEButtonFocus:setLeftRight( 0, 1, 0, 0 )
	FEButtonFocus:setTopBottom( 0, 1, 0, 0 )
	FEButtonFocus:setZoom( 10 )
	FEButtonFocus:setImage( RegisterImage( "uie_t7_menu_frontend_buttonfocusfull" ) )
	FEButtonFocus:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	FEButtonFocus:setShaderVector( 0, 0, 0, 0.38, 0.2 )
	FEButtonFocus:setupNineSliceShader( 90, 30 )
	self:addElement( FEButtonFocus )
	self.FEButtonFocus = FEButtonFocus
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( 0, 1, 34, -34 )
	FocusBarB:setTopBottom( 1, 1, -9.5, -12.5 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( 0, 1, 34, -34 )
	FocusBarT:setTopBottom( 0, 0, 10.5, 7.5 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZRot( 180 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local Arrow = LUI.UIImage.new()
	Arrow:setLeftRight( 0, 0, 0, -18 )
	Arrow:setTopBottom( 0.5, 0.5, -10.5, 10.5 )
	Arrow:setYRot( 180 )
	Arrow:setZoom( 10 )
	Arrow:setImage( RegisterImage( "uie_t7_menu_frontend_buttonfocusarrow" ) )
	Arrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Arrow )
	self.Arrow = Arrow
	
	local Glow21 = LUI.UIImage.new()
	Glow21:setLeftRight( 0, 1, 0, 0 )
	Glow21:setTopBottom( 0, 1, -4, 4 )
	Glow21:setAlpha( 0 )
	Glow21:setImage( RegisterImage( "uie_t7_cp_hud_enemytarget_glow" ) )
	Glow21:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow21 )
	self.Glow21 = Glow21
	
	local label = LUI.UIText.new()
	label:setLeftRight( 0, 1, 26, -6 )
	label:setTopBottom( 0.5, 0.5, -16.5, 16.5 )
	label:setRGB( 0, 0, 0 )
	label:setText( Engine.Localize( "PLATFORM_YES_CAPS" ) )
	label:setTTF( "fonts/escom.ttf" )
	label:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	label:setShaderVector( 0, 0, 0, 0, 0 )
	label:setShaderVector( 1, 0, 0, 0, 0 )
	label:setShaderVector( 2, 1, 0, 0, 0 )
	label:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	label:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( label )
	self.label = label
	
	local Glow2 = LUI.UIImage.new()
	Glow2:setLeftRight( 0, 1, -72, 104 )
	Glow2:setTopBottom( 0, 0, -37, 87 )
	Glow2:setImage( RegisterImage( "uie_t7_cp_hud_enemytarget_glow" ) )
	Glow2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow2 )
	self.Glow2 = Glow2
	
	self.resetProperties = function ()
		Arrow:completeAnimation()
		Glow2:completeAnimation()
		Glow21:completeAnimation()
		FocusBarB:completeAnimation()
		FocusBarT:completeAnimation()
		Arrow:setLeftRight( 0, 0, 0, -18 )
		Arrow:setTopBottom( 0.5, 0.5, -10.5, 10.5 )
		Glow2:setAlpha( 1 )
		Glow21:setAlpha( 0 )
		FocusBarB:setLeftRight( 0, 1, 34, -34 )
		FocusBarB:setTopBottom( 1, 1, -9.5, -12.5 )
		FocusBarT:setLeftRight( 0, 1, 34, -34 )
		FocusBarT:setTopBottom( 0, 0, 10.5, 7.5 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				Arrow:completeAnimation()
				self.Arrow:setLeftRight( 0, 0, 0, -18 )
				self.Arrow:setTopBottom( 0.5, 0.5, -11, 10 )
				self.clipFinished( Arrow, {} )
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0 )
				self.clipFinished( Glow2, {} )
			end,
			Over = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				Arrow:completeAnimation()
				self.Arrow:setLeftRight( 0, 0, 12, -6 )
				self.Arrow:setTopBottom( 0.5, 0.5, -11, 10 )
				self.clipFinished( Arrow, {} )
				Glow21:completeAnimation()
				self.Glow21:setAlpha( 1 )
				self.clipFinished( Glow21, {} )
			end,
			GainOver = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( 0, 1, 22, -22 )
				self.FocusBarB:setTopBottom( 1, 1, -8, -14 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( 0, 1, 22, -22 )
				self.FocusBarT:setTopBottom( 0, 0, 13, 7 )
				self.clipFinished( FocusBarT, {} )
				local ArrowFrame2 = function ( Arrow, event )
					if not event.interrupted then
						Arrow:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
					end
					Arrow:setLeftRight( 0, 0, 12, -6 )
					Arrow:setTopBottom( 0.5, 0.5, -11, 10 )
					if event.interrupted then
						self.clipFinished( Arrow, event )
					else
						Arrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Arrow:completeAnimation()
				self.Arrow:setLeftRight( 0, 0, 0, -18 )
				self.Arrow:setTopBottom( 0.5, 0.5, -11, 10 )
				ArrowFrame2( Arrow, {} )
				local Glow21Frame2 = function ( Glow21, event )
					if not event.interrupted then
						Glow21:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
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
				local Glow2Frame2 = function ( Glow2, event )
					if not event.interrupted then
						Glow2:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
					end
					Glow2:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Glow2, event )
					else
						Glow2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0 )
				Glow2Frame2( Glow2, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FocusBarB:close()
		self.FocusBarT:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

