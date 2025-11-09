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
		local clanTag = Engine.GetModelValue( model )
		if clanTag then
			Label0:setText( Engine.Localize( clanTag ) )
		end
	end )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	local gamertag = LUI.UIText.new()
	gamertag:setLeftRight( true, false, 48, 388 )
	gamertag:setTopBottom( true, false, 0, 20 )
	gamertag:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	gamertag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	gamertag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	gamertag:linkToElementModel( self, "gamertag", true, function ( model )
		local _gamertag = Engine.GetModelValue( model )
		if _gamertag then
			gamertag:setText( Engine.Localize( _gamertag ) )
		end
	end )
	self:addElement( gamertag )
	self.gamertag = gamertag
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Label0:close()
		element.gamertag:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

