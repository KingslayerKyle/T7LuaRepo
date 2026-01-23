require( "ui.uieditor.widgets.LoadingAnimation.AnimationLoading2" )
require( "ui.uieditor.widgets.LoadingAnimation.AnimationLoadingWidget" )

LUI.createMenu.SpinnerFullscreenBlack = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "SpinnerFullscreenBlack" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "Special_widgets"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "SpinnerFullscreenBlack.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local fullscreenBlack = LUI.UIImage.new()
	fullscreenBlack:setLeftRight( true, false, 0, 1280 )
	fullscreenBlack:setTopBottom( true, false, 0, 720 )
	fullscreenBlack:setRGB( 0, 0, 0 )
	self:addElement( fullscreenBlack )
	self.fullscreenBlack = fullscreenBlack
	
	local AnimationLoading20 = CoD.AnimationLoading2.new( self, controller )
	AnimationLoading20:setLeftRight( false, true, -192, -64 )
	AnimationLoading20:setTopBottom( false, true, -164, -36 )
	AnimationLoading20:setAlpha( 0 )
	AnimationLoading20:setScale( 0.5 )
	self:addElement( AnimationLoading20 )
	self.AnimationLoading20 = AnimationLoading20
	
	local lblMessage = LUI.UIText.new()
	lblMessage:setLeftRight( false, true, -167.5, -88.5 )
	lblMessage:setTopBottom( false, true, -69, -44 )
	lblMessage:setTTF( "fonts/default.ttf" )
	lblMessage:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	lblMessage:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	lblMessage:subscribeToGlobalModel( controller, "SpinnerMessage", "spinnerMessage", function ( model )
		local spinnerMessage = Engine.GetModelValue( model )
		if spinnerMessage then
			lblMessage:setText( Engine.Localize( spinnerMessage ) )
		end
	end )
	self:addElement( lblMessage )
	self.lblMessage = lblMessage
	
	local AnimationLoadingWidget0 = CoD.AnimationLoadingWidget.new( self, controller )
	AnimationLoadingWidget0:setLeftRight( true, false, 1091, 1235 )
	AnimationLoadingWidget0:setTopBottom( true, false, 540, 684 )
	AnimationLoadingWidget0:setScale( 0.65 )
	self:addElement( AnimationLoadingWidget0 )
	self.AnimationLoadingWidget0 = AnimationLoadingWidget0
	
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.AnimationLoading20:close()
		element.AnimationLoadingWidget0:close()
		element.lblMessage:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "SpinnerFullscreenBlack.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

