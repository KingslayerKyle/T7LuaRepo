-- 72a0f94100f4bdd4e05701624ca58e62
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.FaceButtonWithKeyMouse" )
require( "ui.uieditor.widgets.PC.ChooseCharacter.ChooseCharacter_CardClickButton" )

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:setForceMouseEventDispatch( true )
end

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		f0_local0( self, controller, menu )
	end
end

CoD.FaceButtonThatHidesWithLabel = InheritFrom( LUI.UIElement )
CoD.FaceButtonThatHidesWithLabel.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FaceButtonThatHidesWithLabel )
	self.id = "FaceButtonThatHidesWithLabel"
	self.soundSet = "Special_widgets"
	self:setLeftRight( true, false, 0, 200 )
	self:setTopBottom( true, false, 0, 20 )
	self.anyChildUsesUpdateState = true
	
	local ButtonLabel = LUI.UITightText.new()
	ButtonLabel:setLeftRight( true, false, 23.76, 200 )
	ButtonLabel:setTopBottom( true, false, 0, 20 )
	ButtonLabel:setText( Engine.Localize( "MENU_NEW" ) )
	ButtonLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ButtonLabel:setLetterSpacing( 0.5 )
	LUI.OverrideFunction_CallOriginalFirst( ButtonLabel, "setText", function ( element, controller )
		UpdateSelfState( self, controller )
	end )
	self:addElement( ButtonLabel )
	self.ButtonLabel = ButtonLabel
	
	local ButtonImage = CoD.FaceButtonWithKeyMouse.new( menu, controller )
	ButtonImage:setLeftRight( true, false, 0, 20 )
	ButtonImage:setTopBottom( true, false, 0, 20 )
	ButtonImage:subscribeToGlobalModel( controller, "Controller", "alt1_button_image", function ( model )
		local alt1ButtonImage = Engine.GetModelValue( model )
		if alt1ButtonImage then
			ButtonImage.ControllerImage:setImage( RegisterImage( alt1ButtonImage ) )
		end
	end )
	self:addElement( ButtonImage )
	self.ButtonImage = ButtonImage
	
	local f3_local3 = nil
	if IsPC() then
		f3_local3 = CoD.ChooseCharacter_CardClickButton.new( menu, controller )
	else
		f3_local3 = LUI.UIElement.createFake()
	end
	f3_local3:setLeftRight( true, true, 0, 0 )
	f3_local3:setTopBottom( true, false, -2.5, 22.5 )
	f3_local3:setAlpha( 0 )
	f3_local3.label:setText( Engine.Localize( "MENU_NEW" ) )
	f3_local3.keyshortcut:setText( Engine.Localize( "" ) )
	if IsPC() then
		self:addElement( f3_local3 )
	end
	self.clickButton = f3_local3
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				ButtonLabel:completeAnimation()
				self.ButtonLabel:setLeftRight( true, false, 23.76, 200 )
				self.ButtonLabel:setTopBottom( true, false, 0, 20 )
				self.ButtonLabel:setAlpha( 1 )
				self.clipFinished( ButtonLabel, {} )
				ButtonImage:completeAnimation()
				self.ButtonImage:setAlpha( 1 )
				self.clipFinished( ButtonImage, {} )
				f3_local3:completeAnimation()
				self.clickButton:setAlpha( 0 )
				self.clipFinished( f3_local3, {} )
			end
		},
		HideButtonAndText = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				ButtonLabel:completeAnimation()
				self.ButtonLabel:setAlpha( 0 )
				self.clipFinished( ButtonLabel, {} )
				ButtonImage:completeAnimation()
				self.ButtonImage:setAlpha( 0 )
				self.clipFinished( ButtonImage, {} )
				f3_local3:completeAnimation()
				self.clickButton:setAlpha( 0 )
				self.clipFinished( f3_local3, {} )
			end
		},
		HideButton = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				ButtonLabel:completeAnimation()
				self.ButtonLabel:setAlpha( 0 )
				self.clipFinished( ButtonLabel, {} )
				ButtonImage:completeAnimation()
				self.ButtonImage:setAlpha( 0 )
				self.clipFinished( ButtonImage, {} )
				f3_local3:completeAnimation()
				self.clickButton:setAlpha( 1 )
				self.clipFinished( f3_local3, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "HideButtonAndText",
			condition = function ( menu, element, event )
				return not ElementHasText( self, "ButtonLabel" )
			end
		},
		{
			stateName = "HideButton",
			condition = function ( menu, element, event )
				return not IsGamepad( controller )
			end
		}
	} )
	if self.m_eventHandlers.input_source_changed then
		local f3_local4 = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return f3_local4( element, event )
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
		element.ButtonImage:close()
		element.clickButton:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

