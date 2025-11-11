require( "ui.uieditor.widgets.Border" )

CoD.ChooseCharacterLoadout_CardBack_ContactListEntry = InheritFrom( LUI.UIElement )
CoD.ChooseCharacterLoadout_CardBack_ContactListEntry.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChooseCharacterLoadout_CardBack_ContactListEntry )
	self.id = "ChooseCharacterLoadout_CardBack_ContactListEntry"
	self.soundSet = "none"
	self:setLeftRight( 0, 0, 0, 192 )
	self:setTopBottom( 0, 0, 0, 135 )
	
	local face = LUI.UIImage.new()
	face:setLeftRight( 0, 1, 0, 0 )
	face:setTopBottom( 0, 0, 27, 135 )
	face:linkToElementModel( self, "contactIcon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			face:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( face )
	self.face = face
	
	local Border10 = CoD.Border.new( menu, controller )
	Border10:setLeftRight( 0, 1, -2, 2 )
	Border10:setTopBottom( 0, 0, 27, 134 )
	Border10:setRGB( 0.82, 0.98, 1 )
	self:addElement( Border10 )
	self.Border10 = Border10
	
	local contact = LUI.UIText.new()
	contact:setLeftRight( 0, 1, 0, 0 )
	contact:setTopBottom( 0, 0, 0, 27 )
	contact:setRGB( 0.82, 0.98, 1 )
	contact:setTTF( "fonts/default.ttf" )
	contact:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	contact:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	contact:linkToElementModel( self, "contactName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			contact:setText( modelValue )
		end
	end )
	self:addElement( contact )
	self.contact = contact
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Border10:close()
		self.face:close()
		self.contact:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

