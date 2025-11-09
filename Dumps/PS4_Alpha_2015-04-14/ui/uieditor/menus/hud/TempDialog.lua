LUI.createMenu.TempDialog = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "TempDialog" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	local menu = self
	
	local DialogLine = LUI.UIText.new()
	DialogLine:setLeftRight( true, true, 188.5, -188.5 )
	DialogLine:setTopBottom( true, true, 234.36, -459.64 )
	DialogLine:setRGB( 1, 1, 1 )
	DialogLine:setTTF( "fonts/default.ttf" )
	DialogLine:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	DialogLine:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( DialogLine )
	self.DialogLine = DialogLine
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( true, true, 598.5, -599.5 )
	Label0:setTopBottom( true, true, 192.9, -502.1 )
	Label0:setRGB( 1, 1, 1 )
	Label0:setText( Engine.Localize( "TEMP VO" ) )
	Label0:setTTF( "fonts/default.ttf" )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	self.DialogLine:linkToElementModel( self, "dialogText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			DialogLine:setText( modelValue )
		end
	end )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = menu
	} )
	self.close = function ( self )
		self.DialogLine:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

