LUI.createMenu.ZodQuestCarryHUD = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ZodQuestCarryHUD" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	local menu = self
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( true, false, 822, 852 )
	TextBox0:setTopBottom( true, false, 129, 154 )
	TextBox0:setRGB( 1, 1, 1 )
	TextBox0:setTTF( "fonts/default.ttf" )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	local TextBox1 = LUI.UIText.new()
	TextBox1:setLeftRight( true, false, 886, 914 )
	TextBox1:setTopBottom( true, false, 129, 154 )
	TextBox1:setRGB( 1, 1, 1 )
	TextBox1:setTTF( "fonts/default.ttf" )
	TextBox1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox1 )
	self.TextBox1 = TextBox1
	
	local TextBox2 = LUI.UIText.new()
	TextBox2:setLeftRight( true, false, 950, 976 )
	TextBox2:setTopBottom( true, false, 129, 154 )
	TextBox2:setRGB( 1, 1, 1 )
	TextBox2:setTTF( "fonts/default.ttf" )
	TextBox2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox2 )
	self.TextBox2 = TextBox2
	
	local TextBox3 = LUI.UIText.new()
	TextBox3:setLeftRight( true, false, 1014, 1040 )
	TextBox3:setTopBottom( true, false, 129, 154 )
	TextBox3:setRGB( 1, 1, 1 )
	TextBox3:setTTF( "fonts/default.ttf" )
	TextBox3:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox3:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox3 )
	self.TextBox3 = TextBox3
	
	self.TextBox0:linkToElementModel( self, "zod_quest_boxer_carry", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TextBox0:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.TextBox1:linkToElementModel( self, "zod_quest_detective_carry", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TextBox1:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.TextBox2:linkToElementModel( self, "zod_quest_femme_carry", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TextBox2:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.TextBox3:linkToElementModel( self, "zod_quest_magician_carry", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TextBox3:setText( Engine.Localize( modelValue ) )
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
		self.TextBox0:close()
		self.TextBox1:close()
		self.TextBox2:close()
		self.TextBox3:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

