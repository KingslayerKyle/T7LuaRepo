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
	Position:setRGB( 0.64, 0.64, 0.64 )
	Position:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Position:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Position:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Position:linkToElementModel( self, "position", true, function ( model )
		local position = Engine.GetModelValue( model )
		if position then
			Position:setText( Engine.Localize( position ) )
		end
	end )
	self:addElement( Position )
	self.Position = Position
	
	local Rank = LUI.UIText.new()
	Rank:setLeftRight( true, false, 95, 117 )
	Rank:setTopBottom( true, false, 4.5, 20.5 )
	Rank:setRGB( 0.64, 0.64, 0.64 )
	Rank:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Rank:linkToElementModel( self, "rank", true, function ( model )
		local rank = Engine.GetModelValue( model )
		if rank then
			Rank:setText( Engine.Localize( rank ) )
		end
	end )
	self:addElement( Rank )
	self.Rank = Rank
	
	local Name = LUI.UIText.new()
	Name:setLeftRight( true, false, 138, 308 )
	Name:setTopBottom( true, false, 4.5, 20.5 )
	Name:setRGB( 0.64, 0.64, 0.64 )
	Name:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Name:linkToElementModel( self, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			Name:setText( Engine.Localize( name ) )
		end
	end )
	self:addElement( Name )
	self.Name = Name
	
	local Column0 = LUI.UIText.new()
	Column0:setLeftRight( true, false, 305, 422 )
	Column0:setTopBottom( true, false, 4.5, 20.5 )
	Column0:setRGB( 0.64, 0.64, 0.64 )
	Column0:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Column0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Column0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Column0:linkToElementModel( self, "column0", true, function ( model )
		local column0 = Engine.GetModelValue( model )
		if column0 then
			Column0:setText( Engine.Localize( column0 ) )
		end
	end )
	self:addElement( Column0 )
	self.Column0 = Column0
	
	local Column1 = LUI.UIText.new()
	Column1:setLeftRight( true, false, 390, 511 )
	Column1:setTopBottom( true, false, 4.5, 20.5 )
	Column1:setRGB( 0.64, 0.64, 0.64 )
	Column1:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Column1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Column1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Column1:linkToElementModel( self, "column1", true, function ( model )
		local column1 = Engine.GetModelValue( model )
		if column1 then
			Column1:setText( Engine.Localize( column1 ) )
		end
	end )
	self:addElement( Column1 )
	self.Column1 = Column1
	
	local Column2 = LUI.UIText.new()
	Column2:setLeftRight( true, false, 492, 599 )
	Column2:setTopBottom( true, false, 4.5, 20.5 )
	Column2:setRGB( 0.64, 0.64, 0.64 )
	Column2:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Column2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Column2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Column2:linkToElementModel( self, "column2", true, function ( model )
		local column2 = Engine.GetModelValue( model )
		if column2 then
			Column2:setText( Engine.Localize( column2 ) )
		end
	end )
	self:addElement( Column2 )
	self.Column2 = Column2
	
	local Column3 = LUI.UIText.new()
	Column3:setLeftRight( true, false, 582, 687 )
	Column3:setTopBottom( true, false, 4.5, 20.5 )
	Column3:setRGB( 0.64, 0.64, 0.64 )
	Column3:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Column3:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Column3:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Column3:linkToElementModel( self, "column3", true, function ( model )
		local column3 = Engine.GetModelValue( model )
		if column3 then
			Column3:setText( Engine.Localize( column3 ) )
		end
	end )
	self:addElement( Column3 )
	self.Column3 = Column3
	
	local Column4 = LUI.UIText.new()
	Column4:setLeftRight( true, false, 674, 774 )
	Column4:setTopBottom( true, false, 4.5, 20.5 )
	Column4:setRGB( 0.64, 0.64, 0.64 )
	Column4:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Column4:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Column4:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Column4:linkToElementModel( self, "column4", true, function ( model )
		local column4 = Engine.GetModelValue( model )
		if column4 then
			Column4:setText( Engine.Localize( column4 ) )
		end
	end )
	self:addElement( Column4 )
	self.Column4 = Column4
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Rank:completeAnimation()
				self.Rank:setAlpha( 1 )
				self.clipFinished( Rank, {} )
				Name:completeAnimation()
				self.Name:setLeftRight( true, false, 138, 308 )
				self.Name:setTopBottom( true, false, 4.5, 20.5 )
				self.clipFinished( Name, {} )
			end
		},
		Freerun = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Rank:completeAnimation()
				self.Rank:setAlpha( 0 )
				self.clipFinished( Rank, {} )
				Name:completeAnimation()
				self.Name:setLeftRight( true, false, 95, 308 )
				self.Name:setTopBottom( true, false, 4.5, 20.5 )
				self.clipFinished( Name, {} )
			end
		},
		DefaultStateArabic = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				Position:completeAnimation()
				self.Position:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
				self.clipFinished( Position, {} )
				Rank:completeAnimation()
				self.Rank:setAlpha( 1 )
				self.Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
				self.clipFinished( Rank, {} )
				Name:completeAnimation()
				self.Name:setLeftRight( true, false, 138, 308 )
				self.Name:setTopBottom( true, false, 4.5, 20.5 )
				self.Name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
				self.clipFinished( Name, {} )
			end
		},
		FreerunArabic = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				Position:completeAnimation()
				self.Position:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
				self.clipFinished( Position, {} )
				Rank:completeAnimation()
				self.Rank:setAlpha( 0 )
				self.clipFinished( Rank, {} )
				Name:completeAnimation()
				self.Name:setLeftRight( true, false, 95, 308 )
				self.Name:setTopBottom( true, false, 4.5, 20.5 )
				self.Name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
				self.clipFinished( Name, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Freerun",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "DefaultStateArabic",
			condition = function ( menu, element, event )
				return IsCurrentLanguageArabic()
			end
		},
		{
			stateName = "FreerunArabic",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Position:close()
		element.Rank:close()
		element.Name:close()
		element.Column0:close()
		element.Column1:close()
		element.Column2:close()
		element.Column3:close()
		element.Column4:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

