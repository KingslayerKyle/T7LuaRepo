require( "ui.uieditor.widgets.BumperButtonWithKeyMouse" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ChooseClass_ClassSetTabInternal" )

CoD.ChooseClass_ClassSetTabWidget = InheritFrom( LUI.UIElement )
CoD.ChooseClass_ClassSetTabWidget.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 0
	} )
	self:setAlignment( LUI.Alignment.Center )
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
	LeftBumperImage:setLeftRight( true, false, 0, 45 )
	LeftBumperImage:setTopBottom( false, false, -15, 15 )
	LeftBumperImage:subscribeToGlobalModel( controller, "Controller", "left_shoulder_button_image", function ( model )
		local leftShoulderButtonImage = Engine.GetModelValue( model )
		if leftShoulderButtonImage then
			LeftBumperImage.ControllerImage:setImage( RegisterImage( leftShoulderButtonImage ) )
		end
	end )
	self:addElement( LeftBumperImage )
	self.LeftBumperImage = LeftBumperImage
	
	local Internal = CoD.ChooseClass_ClassSetTabInternal.new( menu, controller )
	Internal:setLeftRight( false, false, -99.5, 98.5 )
	Internal:setTopBottom( true, false, 0, 48 )
	self:addElement( Internal )
	self.Internal = Internal
	
	local RightBumperImage = CoD.BumperButtonWithKeyMouse.new( menu, controller )
	RightBumperImage:setLeftRight( false, true, -46, 0 )
	RightBumperImage:setTopBottom( false, false, -15, 15 )
	RightBumperImage.KeyMouseImage:setImage( RegisterImage( "uie_bumperright" ) )
	RightBumperImage:subscribeToGlobalModel( controller, "Controller", "right_shoulder_button_image", function ( model )
		local rightShoulderButtonImage = Engine.GetModelValue( model )
		if rightShoulderButtonImage then
			RightBumperImage.ControllerImage:setImage( RegisterImage( rightShoulderButtonImage ) )
		end
	end )
	self:addElement( RightBumperImage )
	self.RightBumperImage = RightBumperImage
	
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

