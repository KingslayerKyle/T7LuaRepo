require( "ui.uieditor.widgets.HUD.MPHintTextContainer" )

LUI.createMenu.MPHintText = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "MPHintText" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "MPHintText.buttonPrompts" )
	local f1_local1 = self
	
	local MPHintTextContainer = CoD.MPHintTextContainer.new( f1_local1, controller )
	MPHintTextContainer:setLeftRight( false, false, -576, 576 )
	MPHintTextContainer:setTopBottom( false, true, -181, -155 )
	self:addElement( MPHintTextContainer )
	self.MPHintTextContainer = MPHintTextContainer
	
	self.MPHintTextContainer:linkToElementModel( self, "hint_text_line", true, function ( model )
		local hintTextLine = Engine.GetModelValue( model )
		if hintTextLine then
			MPHintTextContainer.txtHintText0:setText( Engine.Localize( hintTextLine ) )
		end
	end )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f1_local1
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.MPHintTextContainer:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "MPHintText.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

