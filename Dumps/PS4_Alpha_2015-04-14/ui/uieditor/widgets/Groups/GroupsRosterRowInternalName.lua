CoD.GroupsRosterRowInternalName = InheritFrom( LUI.UIElement )
CoD.GroupsRosterRowInternalName.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 2
	} )
	self:setAlignment( LUI.Alignment.Left )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GroupsRosterRowInternalName )
	self.id = "GroupsRosterRowInternalName"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 400 )
	self:setTopBottom( true, false, 0, 25 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( true, false, 0, 46 )
	Label0:setTopBottom( true, false, 0, 20 )
	Label0:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Label0:linkToElementModel( self, "clanTag", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Label0:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	local gamertag = LUI.UIText.new()
	gamertag:setLeftRight( true, false, 48, 388 )
	gamertag:setTopBottom( true, false, 0, 20 )
	gamertag:setRGB( 1, 1, 1 )
	gamertag:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	gamertag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	gamertag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	gamertag:linkToElementModel( self, "gamertag", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			gamertag:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( gamertag )
	self.gamertag = gamertag
	
	self.close = function ( self )
		self.Label0:close()
		self.gamertag:close()
		CoD.GroupsRosterRowInternalName.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

