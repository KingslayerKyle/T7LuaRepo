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
	self:setLeftRight( true, false, 0, 128 )
	self:setTopBottom( true, false, 0, 90 )
	
	local face = LUI.UIImage.new()
	face:setLeftRight( true, true, 0, 0 )
	face:setTopBottom( true, false, 18, 90 )
	face:linkToElementModel( self, "contactIcon", true, function ( model )
		local contactIcon = Engine.GetModelValue( model )
		if contactIcon then
			face:setImage( RegisterImage( contactIcon ) )
		end
	end )
	self:addElement( face )
	self.face = face
	
	local Border10 = CoD.Border.new( menu, controller )
	Border10:setLeftRight( true, true, -1, 1 )
	Border10:setTopBottom( true, false, 18.38, 89.5 )
	Border10:setRGB( 0.82, 0.98, 1 )
	self:addElement( Border10 )
	self.Border10 = Border10
	
	local contact = LUI.UIText.new()
	contact:setLeftRight( true, true, 0, 0 )
	contact:setTopBottom( true, false, 0, 18 )
	contact:setRGB( 0.82, 0.98, 1 )
	contact:setTTF( "fonts/default.ttf" )
	contact:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	contact:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	contact:linkToElementModel( self, "contactName", true, function ( model )
		local contactName = Engine.GetModelValue( model )
		if contactName then
			contact:setText( contactName )
		end
	end )
	self:addElement( contact )
	self.contact = contact
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Border10:close()
		element.face:close()
		element.contact:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

