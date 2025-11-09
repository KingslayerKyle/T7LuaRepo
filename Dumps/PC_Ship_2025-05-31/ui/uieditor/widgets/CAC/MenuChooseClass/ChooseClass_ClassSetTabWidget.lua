require( "ui.uieditor.widgets.BumperButtonWithKeyMouse" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ChooseClass_ClassSetTabInternal" )

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:registerEventHandler( "mini_selector_left", function ( element, event )
		if IsClassSetsAvailableForCurrentGameMode() and not DoesPlayerHaveExtraSlotsItem( f1_arg1 ) then
			SetChooseClassMenuFromExtraSlotPromptState( f1_arg2, f1_arg1, f1_arg2, "buttonList", "buttonList" )
			return true
		elseif IsClassSetsAvailableForCurrentGameMode() then
			DecrementClassSetAndUpdateElementDataSource( f1_arg2, f1_arg1, f1_arg2, "buttonList", "buttonList" )
			return true
		else
			
		end
	end )
	f1_arg0:registerEventHandler( "mini_selector_right", function ( element, event )
		if IsClassSetsAvailableForCurrentGameMode() and not DoesPlayerHaveExtraSlotsItem( f1_arg1 ) then
			SetChooseClassMenuToExtraSlotPromptState( f1_arg2, f1_arg1, f1_arg2, "buttonList", "buttonList" )
			return true
		elseif IsClassSetsAvailableForCurrentGameMode() then
			IncrementClassSetAndUpdateElementDataSource( f1_arg2, f1_arg1, f1_arg2, "buttonList", "buttonList" )
			return true
		else
			
		end
	end )
	f1_arg0.RightBumperImage:setHandleMouse( true )
	f1_arg0.RightBumperImage:registerEventHandler( "button_action", function ( element, event )
		element:dispatchEventToParent( {
			name = "mini_selector_right",
			controller = event
		} )
	end )
	f1_arg0.LeftBumperImage:setHandleMouse( true )
	f1_arg0.LeftBumperImage:registerEventHandler( "button_action", function ( element, event )
		element:dispatchEventToParent( {
			name = "mini_selector_left",
			controller = event
		} )
	end )
end

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		
	else
		
	end
end

CoD.ChooseClass_ClassSetTabWidget = InheritFrom( LUI.UIElement )
CoD.ChooseClass_ClassSetTabWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChooseClass_ClassSetTabWidget )
	self.id = "ChooseClass_ClassSetTabWidget"
	self.soundSet = "MultiplayerMain"
	self:setLeftRight( true, false, 0, 289 )
	self:setTopBottom( true, false, 0, 40 )
	self.anyChildUsesUpdateState = true
	
	local LeftBumperImage = CoD.BumperButtonWithKeyMouse.new( menu, controller )
	LeftBumperImage:setLeftRight( true, false, -10.5, 34.5 )
	LeftBumperImage:setTopBottom( false, false, -15, 15 )
	LeftBumperImage:subscribeToGlobalModel( controller, "Controller", "left_shoulder_button_image", function ( model )
		local leftShoulderButtonImage = Engine.GetModelValue( model )
		if leftShoulderButtonImage then
			LeftBumperImage.ControllerImage:setImage( RegisterImage( leftShoulderButtonImage ) )
		end
	end )
	LeftBumperImage:registerEventHandler( "button_action", function ( element, event )
		local f9_local0 = nil
		SendButtonPressToMenuEx( menu, controller, Enum.LUIButton.LUI_KEY_LB )
		if not f9_local0 then
			f9_local0 = element:dispatchEventToChildren( event )
		end
		return f9_local0
	end )
	self:addElement( LeftBumperImage )
	self.LeftBumperImage = LeftBumperImage
	
	local Internal = CoD.ChooseClass_ClassSetTabInternal.new( menu, controller )
	Internal:setLeftRight( false, false, -110, 110 )
	Internal:setTopBottom( true, false, 0, 48 )
	self:addElement( Internal )
	self.Internal = Internal
	
	local RightBumperImage = CoD.BumperButtonWithKeyMouse.new( menu, controller )
	RightBumperImage:setLeftRight( false, true, -34.5, 10.5 )
	RightBumperImage:setTopBottom( false, false, -15, 15 )
	RightBumperImage.KeyMouseImage:setImage( RegisterImage( "uie_bumperright" ) )
	RightBumperImage:subscribeToGlobalModel( controller, "Controller", "right_shoulder_button_image", function ( model )
		local rightShoulderButtonImage = Engine.GetModelValue( model )
		if rightShoulderButtonImage then
			RightBumperImage.ControllerImage:setImage( RegisterImage( rightShoulderButtonImage ) )
		end
	end )
	RightBumperImage:registerEventHandler( "button_action", function ( element, event )
		local f11_local0 = nil
		SendButtonPressToMenuEx( menu, controller, Enum.LUIButton.LUI_KEY_RB )
		if not f11_local0 then
			f11_local0 = element:dispatchEventToChildren( event )
		end
		return f11_local0
	end )
	self:addElement( RightBumperImage )
	self.RightBumperImage = RightBumperImage
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				LeftBumperImage:completeAnimation()
				self.LeftBumperImage:setAlpha( 0 )
				self.clipFinished( LeftBumperImage, {} )
				Internal:completeAnimation()
				self.Internal:setAlpha( 0 )
				self.clipFinished( Internal, {} )
				RightBumperImage:completeAnimation()
				self.RightBumperImage:setAlpha( 0 )
				self.clipFinished( RightBumperImage, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				LeftBumperImage:completeAnimation()
				self.LeftBumperImage:setAlpha( 1 )
				self.clipFinished( LeftBumperImage, {} )
				Internal:completeAnimation()
				self.Internal:setAlpha( 1 )
				self.clipFinished( Internal, {} )
				RightBumperImage:completeAnimation()
				self.RightBumperImage:setAlpha( 1 )
				self.clipFinished( RightBumperImage, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LeftBumperImage:close()
		element.Internal:close()
		element.RightBumperImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

