require( "ui.uieditor.widgets.ButtonIcon" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

local PCSpecific = function ( self, controller )
	self:setHandleMouse( true )
end

local PostLoadFunc = function ( self, controller )
	if CoD.isPC then
		PCSpecific( self, controller )
	end
end

CoD.WelcomeMenu_Button = InheritFrom( LUI.UIElement )
CoD.WelcomeMenu_Button.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WelcomeMenu_Button )
	self.id = "WelcomeMenu_Button"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 135 )
	self:setTopBottom( true, false, 0, 45 )
	self.anyChildUsesUpdateState = true
	
	local FEButtonFocus = LUI.UIImage.new()
	FEButtonFocus:setLeftRight( true, true, 5.93, 0 )
	FEButtonFocus:setTopBottom( false, false, -22.66, 22.66 )
	FEButtonFocus:setZoom( 10 )
	FEButtonFocus:setImage( RegisterImage( "uie_t7_menu_frontend_buttonfocusfull" ) )
	FEButtonFocus:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	FEButtonFocus:setShaderVector( 0, 0.2, 0.5, 0.38, 0.2 )
	FEButtonFocus:setupNineSliceShader( 60, 20 )
	self:addElement( FEButtonFocus )
	self.FEButtonFocus = FEButtonFocus
	
	local Arrow = LUI.UIImage.new()
	Arrow:setLeftRight( true, false, 11.86, 0 )
	Arrow:setTopBottom( true, false, 16, 29.32 )
	Arrow:setYRot( 180 )
	Arrow:setZoom( 10 )
	Arrow:setImage( RegisterImage( "uie_t7_menu_frontend_buttonfocusarrow" ) )
	Arrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Arrow )
	self.Arrow = Arrow
	
	local TextBox2 = LUI.UIText.new()
	TextBox2:setLeftRight( true, false, 56.81, 126.12 )
	TextBox2:setTopBottom( true, false, 12.69, 34.47 )
	TextBox2:setRGB( 0, 0, 0 )
	TextBox2:setText( Engine.Localize( "MENU_LETS_GO" ) )
	TextBox2:setTTF( "fonts/escom.ttf" )
	TextBox2:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	TextBox2:setShaderVector( 0, 0, 0, 0, 0 )
	TextBox2:setShaderVector( 1, 0, 0, 0, 0 )
	TextBox2:setShaderVector( 2, 1, 0, 0, 0 )
	TextBox2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox2 )
	self.TextBox2 = TextBox2
	
	local ButtonIcon0 = CoD.ButtonIcon.new( menu, controller )
	ButtonIcon0:setLeftRight( true, false, 20.07, 48.07 )
	ButtonIcon0:setTopBottom( true, false, 8.66, 36.66 )
	ButtonIcon0:subscribeToGlobalModel( controller, "Controller", "primary_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ButtonIcon0.buttonImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	ButtonIcon0:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( ButtonIcon0 )
	self.ButtonIcon0 = ButtonIcon0
	
	local ButtonIcon00 = CoD.ButtonIcon.new( menu, controller )
	ButtonIcon00:setLeftRight( true, false, 20.07, 48.07 )
	ButtonIcon00:setTopBottom( true, false, 9.58, 37.58 )
	ButtonIcon00:setAlpha( 0.7 )
	ButtonIcon00:subscribeToGlobalModel( controller, "Controller", "primary_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ButtonIcon00.buttonImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	ButtonIcon00:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( ButtonIcon00 )
	self.ButtonIcon00 = ButtonIcon00
	
	local Glow21 = LUI.UIImage.new()
	Glow21:setLeftRight( true, true, 0, 0 )
	Glow21:setTopBottom( false, false, -42.79, 22.5 )
	Glow21:setAlpha( 0 )
	Glow21:setImage( RegisterImage( "uie_t7_cp_hud_enemytarget_glow" ) )
	Glow21:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow21 )
	self.Glow21 = Glow21
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( false, false, -44.5, 44.5 )
	FocusBarT:setTopBottom( false, false, -18.66, -22.66 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZRot( 180 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB0 = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB0:setLeftRight( false, false, -44.5, 44.5 )
	FocusBarB0:setTopBottom( false, false, 22.66, 18.66 )
	FocusBarB0:setAlpha( 0 )
	FocusBarB0:setZoom( 1 )
	self:addElement( FocusBarB0 )
	self.FocusBarB0 = FocusBarB0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				TextBox2:completeAnimation()
				self.TextBox2:setLeftRight( true, false, 56.81, 126.12 )
				self.TextBox2:setTopBottom( true, false, 12.69, 34.47 )
				self.TextBox2:setAlpha( 1 )
				self.clipFinished( TextBox2, {} )
				ButtonIcon0:completeAnimation()
				self.ButtonIcon0:setAlpha( 1 )
				self.clipFinished( ButtonIcon0, {} )
				ButtonIcon00:completeAnimation()
				self.ButtonIcon00:setAlpha( 0.7 )
				self.clipFinished( ButtonIcon00, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB0:completeAnimation()
				self.FocusBarB0:setAlpha( 0 )
				self.clipFinished( FocusBarB0, {} )
			end
		},
		KeyboardAndMouse = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setRGB( 1, 1, 1 )
				self.clipFinished( FEButtonFocus, {} )
				Arrow:completeAnimation()
				self.Arrow:setLeftRight( true, false, 11.86, 0 )
				self.Arrow:setTopBottom( true, false, 16, 29.32 )
				self.clipFinished( Arrow, {} )
				TextBox2:completeAnimation()
				self.TextBox2:setLeftRight( true, false, 40.81, 110.12 )
				self.TextBox2:setTopBottom( true, false, 12.69, 34.47 )
				self.TextBox2:setAlpha( 1 )
				self.clipFinished( TextBox2, {} )
				ButtonIcon0:completeAnimation()
				self.ButtonIcon0:setAlpha( 0 )
				self.clipFinished( ButtonIcon0, {} )
				ButtonIcon00:completeAnimation()
				self.ButtonIcon00:setAlpha( 0 )
				self.clipFinished( ButtonIcon00, {} )
				Glow21:completeAnimation()
				self.Glow21:setLeftRight( true, true, 5.8, 0 )
				self.Glow21:setTopBottom( false, false, -42.79, 44.95 )
				self.Glow21:setAlpha( 0 )
				self.clipFinished( Glow21, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB0:completeAnimation()
				self.FocusBarB0:setAlpha( 0 )
				self.clipFinished( FocusBarB0, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 6 )
				local ArrowFrame2 = function ( Arrow, event )
					if not event.interrupted then
						Arrow:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
					end
					Arrow:setLeftRight( true, false, 20.86, 9 )
					Arrow:setTopBottom( true, false, 16, 29.32 )
					if event.interrupted then
						self.clipFinished( Arrow, event )
					else
						Arrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Arrow:completeAnimation()
				self.Arrow:setLeftRight( true, false, 11.86, 0 )
				self.Arrow:setTopBottom( true, false, 16, 29.32 )
				ArrowFrame2( Arrow, {} )
				TextBox2:completeAnimation()
				self.TextBox2:setLeftRight( true, false, 40.81, 110.12 )
				self.TextBox2:setTopBottom( true, false, 12.69, 34.47 )
				self.TextBox2:setAlpha( 1 )
				self.clipFinished( TextBox2, {} )
				ButtonIcon0:completeAnimation()
				self.ButtonIcon0:setAlpha( 0 )
				self.clipFinished( ButtonIcon0, {} )
				ButtonIcon00:completeAnimation()
				self.ButtonIcon00:setAlpha( 0 )
				self.clipFinished( ButtonIcon00, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( false, false, -53.5, 59.5 )
				self.FocusBarT:setTopBottom( false, false, -12.66, -16.66 )
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB0:completeAnimation()
				self.FocusBarB0:setLeftRight( false, false, -53.5, 59.5 )
				self.FocusBarB0:setTopBottom( false, false, 17.66, 13.66 )
				self.FocusBarB0:setAlpha( 1 )
				self.clipFinished( FocusBarB0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "KeyboardAndMouse",
			condition = function ( menu, element, event )
				local f12_local0 = IsPC()
				if f12_local0 then
					f12_local0 = not IsGamepad( controller )
				end
				return f12_local0
			end
		}
	} )
	if self.m_eventHandlers.input_source_changed then
		local currentEv = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		self:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ButtonIcon0:close()
		self.ButtonIcon00:close()
		self.FocusBarT:close()
		self.FocusBarB0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

