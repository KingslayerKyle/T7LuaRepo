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
	self:setLeftRight( 0, 0, 0, 105 )
	self:setTopBottom( 0, 0, 0, 67 )
	self.anyChildUsesUpdateState = true
	
	local FEButtonFocus = LUI.UIImage.new()
	FEButtonFocus:setLeftRight( 0, 1, -76, 14 )
	FEButtonFocus:setTopBottom( 0.5, 0.5, -34, 34 )
	FEButtonFocus:setZoom( 10 )
	FEButtonFocus:setImage( RegisterImage( "uie_t7_menu_frontend_buttonfocusfull" ) )
	FEButtonFocus:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	FEButtonFocus:setShaderVector( 0, 0, 0, 0.38, 0.2 )
	FEButtonFocus:setupNineSliceShader( 90, 30 )
	self:addElement( FEButtonFocus )
	self.FEButtonFocus = FEButtonFocus
	
	local Arrow = LUI.UIImage.new()
	Arrow:setLeftRight( 0, 0, -67, -85 )
	Arrow:setTopBottom( 0, 0, 24, 44 )
	Arrow:setYRot( 180 )
	Arrow:setZoom( 10 )
	Arrow:setImage( RegisterImage( "uie_t7_menu_frontend_buttonfocusarrow" ) )
	Arrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Arrow )
	self.Arrow = Arrow
	
	local TextBox2 = LUI.UITightText.new()
	TextBox2:setLeftRight( 0, 0, 3, 107 )
	TextBox2:setTopBottom( 0, 0, 19, 52 )
	TextBox2:setRGB( 0, 0, 0 )
	TextBox2:setText( Engine.Localize( "MENU_LETS_GO" ) )
	TextBox2:setTTF( "fonts/escom.ttf" )
	TextBox2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	TextBox2:setShaderVector( 0, 0, 0, 0, 0 )
	TextBox2:setShaderVector( 1, 0, 0, 0, 0 )
	TextBox2:setShaderVector( 2, 1, 0, 0, 0 )
	LUI.OverrideFunction_CallOriginalFirst( TextBox2, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 10 )
	end )
	self:addElement( TextBox2 )
	self.TextBox2 = TextBox2
	
	local ButtonIcon0 = CoD.ButtonIcon.new( menu, controller )
	ButtonIcon0:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	ButtonIcon0:setLeftRight( 0, 0, -55, -13 )
	ButtonIcon0:setTopBottom( 0, 0, 13, 55 )
	ButtonIcon0:subscribeToGlobalModel( controller, "Controller", "primary_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ButtonIcon0.buttonImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( ButtonIcon0 )
	self.ButtonIcon0 = ButtonIcon0
	
	local ButtonIcon00 = CoD.ButtonIcon.new( menu, controller )
	ButtonIcon00:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	ButtonIcon00:setLeftRight( 0, 0, -55, -13 )
	ButtonIcon00:setTopBottom( 0, 0, 14, 56 )
	ButtonIcon00:setAlpha( 0.7 )
	ButtonIcon00:subscribeToGlobalModel( controller, "Controller", "primary_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ButtonIcon00.buttonImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( ButtonIcon00 )
	self.ButtonIcon00 = ButtonIcon00
	
	local Glow21 = LUI.UIImage.new()
	Glow21:setLeftRight( 0, 1, -85, 13 )
	Glow21:setTopBottom( 0.5, 0.5, -34, 34 )
	Glow21:setImage( RegisterImage( "uie_t7_cp_hud_enemytarget_glow" ) )
	Glow21:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow21 )
	self.Glow21 = Glow21
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( 0, 1, -56, 0 )
	FocusBarT:setTopBottom( 0.5, 0.5, -28, -34 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZRot( 180 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB0 = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB0:setLeftRight( 0, 1, -56, 0 )
	FocusBarB0:setTopBottom( 0.5, 0.5, 34, 28 )
	FocusBarB0:setAlpha( 0 )
	FocusBarB0:setZoom( 1 )
	self:addElement( FocusBarB0 )
	self.FocusBarB0 = FocusBarB0
	
	self.resetProperties = function ()
		ButtonIcon00:completeAnimation()
		ButtonIcon0:completeAnimation()
		Glow21:completeAnimation()
		Arrow:completeAnimation()
		FocusBarT:completeAnimation()
		FocusBarB0:completeAnimation()
		ButtonIcon00:setAlpha( 0.7 )
		ButtonIcon0:setAlpha( 1 )
		Glow21:setAlpha( 1 )
		Arrow:setLeftRight( 0, 0, -67, -85 )
		Arrow:setTopBottom( 0, 0, 24, 44 )
		Arrow:setAlpha( 1 )
		FocusBarT:setLeftRight( 0, 1, -56, 0 )
		FocusBarT:setTopBottom( 0.5, 0.5, -28, -34 )
		FocusBarT:setAlpha( 0 )
		FocusBarB0:setLeftRight( 0, 1, -56, 0 )
		FocusBarB0:setTopBottom( 0.5, 0.5, 34, 28 )
		FocusBarB0:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		KeyboardAndMouse = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
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
			end,
			Over = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				local ArrowFrame2 = function ( Arrow, event )
					if not event.interrupted then
						Arrow:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					Arrow:setLeftRight( 0, 0, -58, -76 )
					Arrow:setTopBottom( 0, 0, 24, 44 )
					if event.interrupted then
						self.clipFinished( Arrow, event )
					else
						Arrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Arrow:completeAnimation()
				self.Arrow:setLeftRight( 0, 0, -67, -85 )
				self.Arrow:setTopBottom( 0, 0, 24, 44 )
				ArrowFrame2( Arrow, {} )
				ButtonIcon0:completeAnimation()
				self.ButtonIcon0:setAlpha( 0 )
				self.clipFinished( ButtonIcon0, {} )
				ButtonIcon00:completeAnimation()
				self.ButtonIcon00:setAlpha( 0 )
				self.clipFinished( ButtonIcon00, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( 0, 1, 15, -7 )
				self.FocusBarT:setTopBottom( 0.5, 0.5, -19, -25 )
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB0:completeAnimation()
				self.FocusBarB0:setLeftRight( 0, 1, 15, -7 )
				self.FocusBarB0:setTopBottom( 0.5, 0.5, 26, 20 )
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
		local currentEv = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
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

