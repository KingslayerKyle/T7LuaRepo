-- ca708f45c732c15f441e278956c6845f
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.ButtonIcon" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

local f0_local0 = function ( f1_arg0, f1_arg1 )
	f1_arg0:setHandleMouse( true )
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	if CoD.isPC then
		f0_local0( f2_arg0, f2_arg1 )
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
	self:setLeftRight( true, false, 0, 70 )
	self:setTopBottom( true, false, 0, 45 )
	self.anyChildUsesUpdateState = true
	
	local FEButtonFocus = LUI.UIImage.new()
	FEButtonFocus:setLeftRight( true, true, -50.88, 9 )
	FEButtonFocus:setTopBottom( false, false, -22.66, 22.66 )
	FEButtonFocus:setZoom( 10 )
	FEButtonFocus:setImage( RegisterImage( "uie_t7_menu_frontend_buttonfocusfull" ) )
	FEButtonFocus:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	FEButtonFocus:setShaderVector( 0, 0.46, 0.44, 0.38, 0.2 )
	FEButtonFocus:setupNineSliceShader( 60, 20 )
	self:addElement( FEButtonFocus )
	self.FEButtonFocus = FEButtonFocus
	
	local Arrow = LUI.UIImage.new()
	Arrow:setLeftRight( true, false, -44.95, -56.81 )
	Arrow:setTopBottom( true, false, 16, 29.32 )
	Arrow:setYRot( 180 )
	Arrow:setZoom( 10 )
	Arrow:setImage( RegisterImage( "uie_t7_menu_frontend_buttonfocusarrow" ) )
	Arrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Arrow )
	self.Arrow = Arrow
	
	local TextBox2 = LUI.UITightText.new()
	TextBox2:setLeftRight( true, false, 2, 71.31 )
	TextBox2:setTopBottom( true, false, 12.69, 34.47 )
	TextBox2:setRGB( 0, 0, 0 )
	TextBox2:setText( Engine.Localize( "MENU_LETS_GO" ) )
	TextBox2:setTTF( "fonts/escom.ttf" )
	TextBox2:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	TextBox2:setShaderVector( 0, 0, 0, 0, 0 )
	TextBox2:setShaderVector( 1, 0, 0, 0, 0 )
	TextBox2:setShaderVector( 2, 1, 0, 0, 0 )
	LUI.OverrideFunction_CallOriginalFirst( TextBox2, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 10 )
	end )
	self:addElement( TextBox2 )
	self.TextBox2 = TextBox2
	
	local ButtonIcon0 = CoD.ButtonIcon.new( menu, controller )
	ButtonIcon0:setLeftRight( true, false, -36.74, -8.74 )
	ButtonIcon0:setTopBottom( true, false, 8.66, 36.66 )
	ButtonIcon0:subscribeToGlobalModel( controller, "Controller", "primary_button_image", function ( model )
		local primaryButtonImage = Engine.GetModelValue( model )
		if primaryButtonImage then
			ButtonIcon0.buttonImage:setImage( RegisterImage( primaryButtonImage ) )
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
	ButtonIcon00:setLeftRight( true, false, -36.74, -8.74 )
	ButtonIcon00:setTopBottom( true, false, 9.58, 37.58 )
	ButtonIcon00:setAlpha( 0.7 )
	ButtonIcon00:subscribeToGlobalModel( controller, "Controller", "primary_button_image", function ( model )
		local primaryButtonImage = Engine.GetModelValue( model )
		if primaryButtonImage then
			ButtonIcon00.buttonImage:setImage( RegisterImage( primaryButtonImage ) )
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
	Glow21:setLeftRight( true, true, -56.81, 9 )
	Glow21:setTopBottom( false, false, -22.66, 22.5 )
	Glow21:setImage( RegisterImage( "uie_t7_cp_hud_enemytarget_glow" ) )
	Glow21:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow21 )
	self.Glow21 = Glow21
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, -37.31, 0 )
	FocusBarT:setTopBottom( false, false, -18.66, -22.66 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZRot( 180 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB0 = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB0:setLeftRight( true, true, -37.31, 0 )
	FocusBarB0:setTopBottom( false, false, 22.66, 18.66 )
	FocusBarB0:setAlpha( 0 )
	FocusBarB0:setZoom( 1 )
	self:addElement( FocusBarB0 )
	self.FocusBarB0 = FocusBarB0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
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
				self:setupElementClipCounter( 7 )
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setRGB( 1, 1, 1 )
				self.clipFinished( FEButtonFocus, {} )
				Arrow:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
				Arrow:setAlpha( 1 )
				Arrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				ButtonIcon0:completeAnimation()
				self.ButtonIcon0:setAlpha( 0 )
				self.clipFinished( ButtonIcon0, {} )
				ButtonIcon00:completeAnimation()
				self.ButtonIcon00:setAlpha( 0 )
				self.clipFinished( ButtonIcon00, {} )
				Glow21:completeAnimation()
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
						Arrow:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					Arrow:setLeftRight( true, false, -38.95, -50.81 )
					Arrow:setTopBottom( true, false, 16, 29.32 )
					if event.interrupted then
						self.clipFinished( Arrow, event )
					else
						Arrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Arrow:completeAnimation()
				self.Arrow:setLeftRight( true, false, -44.95, -56.81 )
				self.Arrow:setTopBottom( true, false, 16, 29.32 )
				ArrowFrame2( Arrow, {} )
				ButtonIcon0:completeAnimation()
				self.ButtonIcon0:setAlpha( 0 )
				self.clipFinished( ButtonIcon0, {} )
				ButtonIcon00:completeAnimation()
				self.ButtonIcon00:setAlpha( 0 )
				self.clipFinished( ButtonIcon00, {} )
				Glow21:completeAnimation()
				self.Glow21:setAlpha( 1 )
				self.clipFinished( Glow21, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, true, 10.5, -4.5 )
				self.FocusBarT:setTopBottom( false, false, -12.66, -16.66 )
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB0:completeAnimation()
				self.FocusBarB0:setLeftRight( true, true, 10.5, -4.5 )
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
				return IsPC() and not IsGamepad( controller )
			end
		}
	} )
	if self.m_eventHandlers.input_source_changed then
		local f3_local9 = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return f3_local9( element, event )
		end )
	else
		self:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ButtonIcon0:close()
		element.ButtonIcon00:close()
		element.FocusBarT:close()
		element.FocusBarB0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

