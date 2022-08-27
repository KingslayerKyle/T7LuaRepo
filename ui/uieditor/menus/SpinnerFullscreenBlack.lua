-- 38306f44699c3bb170b142d9faccc303
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.LoadingAnimation.AnimationLoading2" )
require( "ui.uieditor.widgets.FileShare.FileshareSpinner" )

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
	local f1_local1 = self
	self.anyChildUsesUpdateState = true
	
	local fullscreenBlack = LUI.UIImage.new()
	fullscreenBlack:setLeftRight( true, false, 0, 1280 )
	fullscreenBlack:setTopBottom( true, false, 0, 720 )
	fullscreenBlack:setRGB( 0, 0, 0 )
	self:addElement( fullscreenBlack )
	self.fullscreenBlack = fullscreenBlack
	
	local AnimationLoading20 = CoD.AnimationLoading2.new( f1_local1, controller )
	AnimationLoading20:setLeftRight( false, true, -192, -64 )
	AnimationLoading20:setTopBottom( false, true, -164, -36 )
	AnimationLoading20:setAlpha( 0 )
	AnimationLoading20:setScale( 0.5 )
	self:addElement( AnimationLoading20 )
	self.AnimationLoading20 = AnimationLoading20
	
	local lblMessage = LUI.UIText.new()
	lblMessage:setLeftRight( false, true, -255.5, -176.5 )
	lblMessage:setTopBottom( false, true, -74, -49 )
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
	
	local FileshareSpinner0 = CoD.FileshareSpinner.new( f1_local1, controller )
	FileshareSpinner0:setLeftRight( true, false, 1120, 1184 )
	FileshareSpinner0:setTopBottom( true, false, 588, 652 )
	FileshareSpinner0:setScale( 1.2 )
	self:addElement( FileshareSpinner0 )
	self.FileshareSpinner0 = FileshareSpinner0
	
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f1_local1
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.AnimationLoading20:close()
		element.FileshareSpinner0:close()
		element.lblMessage:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "SpinnerFullscreenBlack.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

