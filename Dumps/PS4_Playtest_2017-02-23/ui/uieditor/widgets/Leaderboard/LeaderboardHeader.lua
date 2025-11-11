require( "ui.uieditor.widgets.Leaderboard.LeaderboardHeader_ColumnText" )

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
	self:setLeftRight( 0, 0, 0, 1170 )
	self:setTopBottom( 0, 0, 0, 36 )
	self.anyChildUsesUpdateState = true
	
	local Position = LUI.UIText.new()
	Position:setLeftRight( 0, 0, 9, 149 )
	Position:setTopBottom( 0, 0, 7, 31 )
	Position:setRGB( 0.64, 0.64, 0.64 )
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
	Rank:setLeftRight( 0, 0, 143, 176 )
	Rank:setTopBottom( 0, 0, 7, 31 )
	Rank:setRGB( 0.64, 0.64, 0.64 )
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
	Name:setLeftRight( 0, 0, 207, 462 )
	Name:setTopBottom( 0, 0, 7, 31 )
	Name:setRGB( 0.64, 0.64, 0.64 )
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
	
	local Column0 = CoD.LeaderboardHeader_ColumnText.new( menu, controller )
	Column0:setLeftRight( 0, 0, 462, 602 )
	Column0:setTopBottom( 0, 0, 7, 31 )
	Column0:subscribeToGlobalModel( controller, "LeaderboardHeader", "column0", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Column0.ColumnText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Column0 )
	self.Column0 = Column0
	
	local Column1 = CoD.LeaderboardHeader_ColumnText.new( menu, controller )
	Column1:setLeftRight( 0, 0, 602, 742 )
	Column1:setTopBottom( 0, 0, 7, 31 )
	Column1:subscribeToGlobalModel( controller, "LeaderboardHeader", "column1", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Column1.ColumnText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Column1 )
	self.Column1 = Column1
	
	local Column2 = CoD.LeaderboardHeader_ColumnText.new( menu, controller )
	Column2:setLeftRight( 0, 0, 743, 883 )
	Column2:setTopBottom( 0, 0, 7, 31 )
	Column2:subscribeToGlobalModel( controller, "LeaderboardHeader", "column2", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Column2.ColumnText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Column2 )
	self.Column2 = Column2
	
	local Column3 = CoD.LeaderboardHeader_ColumnText.new( menu, controller )
	Column3:setLeftRight( 0, 0, 883, 1023 )
	Column3:setTopBottom( 0, 0, 7, 31 )
	Column3:subscribeToGlobalModel( controller, "LeaderboardHeader", "column3", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Column3.ColumnText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Column3 )
	self.Column3 = Column3
	
	local Column4 = CoD.LeaderboardHeader_ColumnText.new( menu, controller )
	Column4:setLeftRight( 0, 0, 1023, 1163 )
	Column4:setTopBottom( 0, 0, 7, 31 )
	Column4:subscribeToGlobalModel( controller, "LeaderboardHeader", "column4", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Column4.ColumnText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Column4 )
	self.Column4 = Column4
	
	self.resetProperties = function ()
		Rank:completeAnimation()
		Name:completeAnimation()
		Position:completeAnimation()
		Rank:setAlpha( 1 )
		Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
		Name:setLeftRight( 0, 0, 207, 462 )
		Name:setTopBottom( 0, 0, 7, 31 )
		Name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
		Position:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Freerun = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				Rank:completeAnimation()
				self.Rank:setAlpha( 0 )
				self.clipFinished( Rank, {} )
				Name:completeAnimation()
				self.Name:setLeftRight( 0, 0, 142.5, 462.5 )
				self.Name:setTopBottom( 0, 0, 7, 31 )
				self.clipFinished( Name, {} )
			end
		},
		DefaultStateArabic = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				Position:completeAnimation()
				self.Position:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
				self.clipFinished( Position, {} )
				Rank:completeAnimation()
				self.Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
				self.clipFinished( Rank, {} )
				Name:completeAnimation()
				self.Name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
				self.clipFinished( Name, {} )
			end
		},
		FreerunArabic = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				Position:completeAnimation()
				self.Position:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
				self.clipFinished( Position, {} )
				Rank:completeAnimation()
				self.Rank:setAlpha( 0 )
				self.clipFinished( Rank, {} )
				Name:completeAnimation()
				self.Name:setLeftRight( 0, 0, 142.5, 462.5 )
				self.Name:setTopBottom( 0, 0, 7, 31 )
				self.Name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
				self.clipFinished( Name, {} )
			end
		},
		DOA = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				Rank:completeAnimation()
				self.Rank:setAlpha( 0 )
				self.clipFinished( Rank, {} )
				Name:completeAnimation()
				self.Name:setLeftRight( 0, 0, 142.5, 462.5 )
				self.Name:setTopBottom( 0, 0, 7, 31 )
				self.clipFinished( Name, {} )
			end
		},
		DOAArabic = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				Position:completeAnimation()
				self.Position:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
				self.clipFinished( Position, {} )
				Rank:completeAnimation()
				self.Rank:setAlpha( 0 )
				self.clipFinished( Rank, {} )
				Name:completeAnimation()
				self.Name:setLeftRight( 0, 0, 142.5, 462.5 )
				self.Name:setTopBottom( 0, 0, 7, 31 )
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
		},
		{
			stateName = "DOA",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "DOAArabic",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Column0:close()
		self.Column1:close()
		self.Column2:close()
		self.Column3:close()
		self.Column4:close()
		self.Position:close()
		self.Rank:close()
		self.Name:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

