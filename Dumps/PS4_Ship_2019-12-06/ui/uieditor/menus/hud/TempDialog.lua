LUI.createMenu.TempDialog = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "TempDialog" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "TempDialog.buttonPrompts" )
	local f1_local1 = self
	
	local DialogLine = LUI.UIText.new()
	DialogLine:setLeftRight( true, false, 188.5, 1091.5 )
	DialogLine:setTopBottom( true, false, 234.36, 264.36 )
	DialogLine:setTTF( "fonts/default.ttf" )
	DialogLine:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	DialogLine:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	self:addElement( DialogLine )
	self.DialogLine = DialogLine
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( true, false, 188.5, 1091.5 )
	Title:setTopBottom( true, false, 181, 211 )
	Title:setTTF( "fonts/default.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	self:addElement( Title )
	self.Title = Title
	
	self.DialogLine:linkToElementModel( self, "dialogText", true, function ( model )
		local dialogText = Engine.GetModelValue( model )
		if dialogText then
			DialogLine:setText( dialogText )
		end
	end )
	self.Title:linkToElementModel( self, "title", true, function ( model )
		local title = Engine.GetModelValue( model )
		if title then
			Title:setText( title )
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
		element.DialogLine:close()
		element.Title:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "TempDialog.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

