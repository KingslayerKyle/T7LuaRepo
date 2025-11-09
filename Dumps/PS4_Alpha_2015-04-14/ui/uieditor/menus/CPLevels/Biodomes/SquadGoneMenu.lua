LUI.createMenu.SquadGoneMenu = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "SquadGoneMenu" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	local menu = self
	
	local SquadGoneText = LUI.UIText.new()
	SquadGoneText:setLeftRight( true, true, 390, -390 )
	SquadGoneText:setTopBottom( true, true, 171, -524 )
	SquadGoneText:setRGB( 0.35, 0.35, 1 )
	SquadGoneText:setTTF( "fonts/default.ttf" )
	SquadGoneText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	SquadGoneText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SquadGoneText )
	self.SquadGoneText = SquadGoneText
	
	self.SquadGoneText:linkToElementModel( self, "squad_gone_text", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			SquadGoneText:setText( Engine.Localize( modelValue ) )
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
		self.SquadGoneText:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

