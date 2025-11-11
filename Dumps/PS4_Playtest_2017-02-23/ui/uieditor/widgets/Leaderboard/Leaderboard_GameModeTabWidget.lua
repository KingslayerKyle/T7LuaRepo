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
	self:setLeftRight( 0, 0, 0, 495 )
	self:setTopBottom( 0, 0, 0, 60 )
	self.anyChildUsesUpdateState = true
	
	local RightBumperImage = CoD.BumperButtonWithKeyMouse.new( menu, controller )
	RightBumperImage:setLeftRight( 1, 1, -69, 0 )
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
	
	local Internal = CoD.Leaderboard_GameModeTabInternal.new( menu, controller )
	Internal:setLeftRight( 0.5, 0.5, -165, 165 )
	Internal:setTopBottom( 0, 0, 0, 72 )
	self:addElement( Internal )
	self.Internal = Internal
	
	local LeftBumperImage = CoD.BumperButtonWithKeyMouse.new( menu, controller )
	LeftBumperImage:setLeftRight( 0, 0, 0, 68 )
	LeftBumperImage:setTopBottom( 0.5, 0.5, -22.5, 22.5 )
	LeftBumperImage:subscribeToGlobalModel( controller, "Controller", "left_shoulder_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LeftBumperImage.ControllerImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( LeftBumperImage )
	self.LeftBumperImage = LeftBumperImage
	
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
				self:setupElementClipCounter( 0 )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self.resetProperties()
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.RightBumperImage:close()
		self.Internal:close()
		self.LeftBumperImage:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

