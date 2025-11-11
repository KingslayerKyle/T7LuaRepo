require( "ui.uieditor.widgets.BumperButtonWithKeyMouse" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ChooseClass_ClassSetTabInternal" )

local PCSpecific = function ( self, controller, menu )
	self:registerEventHandler( "mini_selector_left", function ( self, event )
		if IsClassSetsAvailableForCurrentGameMode() and not DoesPlayerHaveExtraSlotsItem( controller ) then
			SetChooseClassMenuFromExtraSlotPromptState( menu, controller, menu, "buttonList", "buttonList" )
			return true
		elseif IsClassSetsAvailableForCurrentGameMode() then
			DecrementClassSetAndUpdateElementDataSource( menu, controller, menu, "buttonList", "buttonList" )
			return true
		else
			
		end
	end )
	self:registerEventHandler( "mini_selector_right", function ( self, event )
		if IsClassSetsAvailableForCurrentGameMode() and not DoesPlayerHaveExtraSlotsItem( controller ) then
			SetChooseClassMenuToExtraSlotPromptState( menu, controller, menu, "buttonList", "buttonList" )
			return true
		elseif IsClassSetsAvailableForCurrentGameMode() then
			IncrementClassSetAndUpdateElementDataSource( menu, controller, menu, "buttonList", "buttonList" )
			return true
		else
			
		end
	end )
	self.RightBumperImage:setHandleMouse( true )
	self.RightBumperImage:registerEventHandler( "button_action", function ( self, controller )
		self:dispatchEventToParent( {
			name = "mini_selector_right",
			controller = controller
		} )
	end )
	self.LeftBumperImage:setHandleMouse( true )
	self.LeftBumperImage:registerEventHandler( "button_action", function ( self, controller )
		self:dispatchEventToParent( {
			name = "mini_selector_left",
			controller = controller
		} )
	end )
end

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		PCSpecific( self, controller, menu )
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
	self:setLeftRight( 0, 0, 0, 433 )
	self:setTopBottom( 0, 0, 0, 60 )
	self.anyChildUsesUpdateState = true
	
	local LeftBumperImage = CoD.BumperButtonWithKeyMouse.new( menu, controller )
	LeftBumperImage:setLeftRight( 0, 0, -16, 52 )
	LeftBumperImage:setTopBottom( 0.5, 0.5, -22.5, 22.5 )
	LeftBumperImage:subscribeToGlobalModel( controller, "Controller", "left_shoulder_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LeftBumperImage.ControllerImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( LeftBumperImage )
	self.LeftBumperImage = LeftBumperImage
	
	local Internal = CoD.ChooseClass_ClassSetTabInternal.new( menu, controller )
	Internal:setLeftRight( 0.5, 0.5, -165, 165 )
	Internal:setTopBottom( 0, 0, 0, 72 )
	self:addElement( Internal )
	self.Internal = Internal
	
	local RightBumperImage = CoD.BumperButtonWithKeyMouse.new( menu, controller )
	RightBumperImage:setLeftRight( 1, 1, -52, 16 )
	RightBumperImage:setTopBottom( 0.5, 0.5, -22.5, 22.5 )
	RightBumperImage.KeyMouseImage:setImage( RegisterImage( "uie_bumperright" ) )
	RightBumperImage:subscribeToGlobalModel( controller, "Controller", "right_shoulder_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RightBumperImage.ControllerImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( RightBumperImage )
	self.RightBumperImage = RightBumperImage
	
	self.resetProperties = function ()
		LeftBumperImage:completeAnimation()
		Internal:completeAnimation()
		RightBumperImage:completeAnimation()
		LeftBumperImage:setAlpha( 1 )
		Internal:setAlpha( 1 )
		RightBumperImage:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
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
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LeftBumperImage:close()
		self.Internal:close()
		self.RightBumperImage:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

