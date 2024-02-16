CoD.LeaderboardHeader = InheritFrom( LUI.UIElement )
CoD.LeaderboardHeader.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LeaderboardHeader )
	self.id = "LeaderboardHeader"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 780 )
	self:setTopBottom( true, false, 0, 24 )
	
	local Position = LUI.UIText.new()
	Position:setLeftRight( true, false, 6, 99 )
	Position:setTopBottom( true, false, 4.5, 20.5 )
	Position:setRGB( 0.5, 0.51, 0.52 )
	Position:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Position:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Position:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Position:linkToElementModel( self, "position", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Position:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Position )
	self.Position = Position
	
	local Rank = LUI.UIText.new()
	Rank:setLeftRight( true, false, 95, 117 )
	Rank:setTopBottom( true, false, 4.5, 20.5 )
	Rank:setRGB( 0.5, 0.51, 0.52 )
	Rank:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Rank:linkToElementModel( self, "rank", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Rank:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Rank )
	self.Rank = Rank
	
	local Name = LUI.UIText.new()
	Name:setLeftRight( true, false, 138, 308 )
	Name:setTopBottom( true, false, 4.5, 20.5 )
	Name:setRGB( 0.5, 0.51, 0.52 )
	Name:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Name:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Name:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Name )
	self.Name = Name
	
	local Column0 = LUI.UIText.new()
	Column0:setLeftRight( true, false, 305, 422 )
	Column0:setTopBottom( true, false, 4.5, 20.5 )
	Column0:setRGB( 0.5, 0.51, 0.52 )
	Column0:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Column0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	Column0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Column0:linkToElementModel( self, "column0", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Column0:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Column0 )
	self.Column0 = Column0
	
	local Column1 = LUI.UIText.new()
	Column1:setLeftRight( true, false, 390, 511 )
	Column1:setTopBottom( true, false, 4.5, 20.5 )
	Column1:setRGB( 0.5, 0.51, 0.52 )
	Column1:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Column1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	Column1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Column1:linkToElementModel( self, "column1", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Column1:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Column1 )
	self.Column1 = Column1
	
	local Column2 = LUI.UIText.new()
	Column2:setLeftRight( true, false, 492, 599 )
	Column2:setTopBottom( true, false, 4.5, 20.5 )
	Column2:setRGB( 0.5, 0.51, 0.52 )
	Column2:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Column2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	Column2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Column2:linkToElementModel( self, "column2", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Column2:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Column2 )
	self.Column2 = Column2
	
	local Column3 = LUI.UIText.new()
	Column3:setLeftRight( true, false, 582, 687 )
	Column3:setTopBottom( true, false, 4.5, 20.5 )
	Column3:setRGB( 0.5, 0.51, 0.52 )
	Column3:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Column3:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	Column3:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Column3:linkToElementModel( self, "column3", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Column3:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Column3 )
	self.Column3 = Column3
	
	local Column4 = LUI.UIText.new()
	Column4:setLeftRight( true, false, 674, 774 )
	Column4:setTopBottom( true, false, 4.5, 20.5 )
	Column4:setRGB( 0.5, 0.51, 0.52 )
	Column4:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Column4:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	Column4:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Column4:linkToElementModel( self, "column4", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Column4:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Column4 )
	self.Column4 = Column4
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Position:close()
		self.Rank:close()
		self.Name:close()
		self.Column0:close()
		self.Column1:close()
		self.Column2:close()
		self.Column3:close()
		self.Column4:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

