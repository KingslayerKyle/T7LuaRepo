-- 40d8b654be2d419edeb04981cd652329
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BumperButtonWithKeyMouse" )
require( "ui.uieditor.widgets.Leaderboard.Leaderboard_GameModeTabInternal" )

CoD.Leaderboard_GameModeTabWidget = InheritFrom( LUI.UIElement )
CoD.Leaderboard_GameModeTabWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Leaderboard_GameModeTabWidget )
	self.id = "Leaderboard_GameModeTabWidget"
	self.soundSet = "MultiplayerMain"
	self:setLeftRight( true, false, 0, 330 )
	self:setTopBottom( true, false, 0, 40 )
	self.anyChildUsesUpdateState = true
	
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
	RightBumperImage:registerEventHandler( "button_action", function ( element, event )
		local f3_local0 = nil
		SendButtonPressToMenuEx( menu, controller, Enum.LUIButton.LUI_KEY_RB )
		if not f3_local0 then
			f3_local0 = element:dispatchEventToChildren( event )
		end
		return f3_local0
	end )
	self:addElement( RightBumperImage )
	self.RightBumperImage = RightBumperImage
	
	local Internal = CoD.Leaderboard_GameModeTabInternal.new( menu, controller )
	Internal:setLeftRight( false, false, -110, 110 )
	Internal:setTopBottom( true, false, 0, 48 )
	self:addElement( Internal )
	self.Internal = Internal
	
	local LeftBumperImage = CoD.BumperButtonWithKeyMouse.new( menu, controller )
	LeftBumperImage:setLeftRight( true, false, 0, 45 )
	LeftBumperImage:setTopBottom( false, false, -15, 15 )
	LeftBumperImage:subscribeToGlobalModel( controller, "Controller", "left_shoulder_button_image", function ( model )
		local leftShoulderButtonImage = Engine.GetModelValue( model )
		if leftShoulderButtonImage then
			LeftBumperImage.ControllerImage:setImage( RegisterImage( leftShoulderButtonImage ) )
		end
	end )
	LeftBumperImage:registerEventHandler( "button_action", function ( element, event )
		local f5_local0 = nil
		SendButtonPressToMenuEx( menu, controller, Enum.LUIButton.LUI_KEY_LB )
		if not f5_local0 then
			f5_local0 = element:dispatchEventToChildren( event )
		end
		return f5_local0
	end )
	self:addElement( LeftBumperImage )
	self.LeftBumperImage = LeftBumperImage
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				RightBumperImage:completeAnimation()
				self.RightBumperImage:setAlpha( 1 )
				self.clipFinished( RightBumperImage, {} )

				Internal:completeAnimation()
				self.Internal:setAlpha( 1 )
				self.clipFinished( Internal, {} )

				LeftBumperImage:completeAnimation()
				self.LeftBumperImage:setAlpha( 1 )
				self.clipFinished( LeftBumperImage, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				RightBumperImage:completeAnimation()
				self.RightBumperImage:setAlpha( 0 )
				self.clipFinished( RightBumperImage, {} )

				Internal:completeAnimation()
				self.Internal:setAlpha( 0 )
				self.clipFinished( Internal, {} )

				LeftBumperImage:completeAnimation()
				self.LeftBumperImage:setAlpha( 0 )
				self.clipFinished( LeftBumperImage, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.RightBumperImage:close()
		element.Internal:close()
		element.LeftBumperImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
