-- 9e9be0d29df725bbcf8525f6216c33d8
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 780 )
	self:setTopBottom( true, false, 0, 24 )
	self.anyChildUsesUpdateState = true
	
	local Position = LUI.UIText.new()
	Position:setLeftRight( true, false, 5, 89 )
	Position:setTopBottom( true, false, 2.5, 22.5 )
	Position:setRGB( 0.64, 0.64, 0.64 )
	Position:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
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
	Rank:setLeftRight( true, false, 89, 137 )
	Rank:setTopBottom( true, false, 2.5, 22.5 )
	Rank:setRGB( 0.64, 0.64, 0.64 )
	Rank:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
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
	Name:setTopBottom( true, false, 3.5, 23.5 )
	Name:setRGB( 0.64, 0.64, 0.64 )
	Name:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
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
	
	local Column0 = CoD.LeaderboardHeader_ColumnText.new( menu, controller )
	Column0:setLeftRight( true, false, 308, 401.5 )
	Column0:setTopBottom( true, false, 2.5, 22.5 )
	Column0:subscribeToGlobalModel( controller, "LeaderboardHeader", "column0", function ( model )
		local column0 = Engine.GetModelValue( model )
		if column0 then
			Column0.ColumnText:setText( Engine.Localize( column0 ) )
		end
	end )
	self:addElement( Column0 )
	self.Column0 = Column0
	
	local Column1 = CoD.LeaderboardHeader_ColumnText.new( menu, controller )
	Column1:setLeftRight( true, false, 401.5, 495 )
	Column1:setTopBottom( true, false, 2.5, 22.5 )
	Column1:subscribeToGlobalModel( controller, "LeaderboardHeader", "column1", function ( model )
		local column1 = Engine.GetModelValue( model )
		if column1 then
			Column1.ColumnText:setText( Engine.Localize( column1 ) )
		end
	end )
	self:addElement( Column1 )
	self.Column1 = Column1
	
	local Column2 = CoD.LeaderboardHeader_ColumnText.new( menu, controller )
	Column2:setLeftRight( true, false, 495, 588.5 )
	Column2:setTopBottom( true, false, 2.5, 22.5 )
	Column2:subscribeToGlobalModel( controller, "LeaderboardHeader", "column2", function ( model )
		local column2 = Engine.GetModelValue( model )
		if column2 then
			Column2.ColumnText:setText( Engine.Localize( column2 ) )
		end
	end )
	self:addElement( Column2 )
	self.Column2 = Column2
	
	local Column3 = CoD.LeaderboardHeader_ColumnText.new( menu, controller )
	Column3:setLeftRight( true, false, 588.5, 682 )
	Column3:setTopBottom( true, false, 2.5, 22.5 )
	Column3:subscribeToGlobalModel( controller, "LeaderboardHeader", "column3", function ( model )
		local column3 = Engine.GetModelValue( model )
		if column3 then
			Column3.ColumnText:setText( Engine.Localize( column3 ) )
		end
	end )
	self:addElement( Column3 )
	self.Column3 = Column3
	
	local Column4 = CoD.LeaderboardHeader_ColumnText.new( menu, controller )
	Column4:setLeftRight( true, false, 682, 775 )
	Column4:setTopBottom( true, false, 2.5, 22.5 )
	Column4:subscribeToGlobalModel( controller, "LeaderboardHeader", "column4", function ( model )
		local column4 = Engine.GetModelValue( model )
		if column4 then
			Column4.ColumnText:setText( Engine.Localize( column4 ) )
		end
	end )
	self:addElement( Column4 )
	self.Column4 = Column4
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				Rank:completeAnimation()
				self.Rank:setAlpha( 1 )
				self.clipFinished( Rank, {} )
			end
		},
		Freerun = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				Rank:completeAnimation()
				self.Rank:setAlpha( 0 )
				self.clipFinished( Rank, {} )
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
				self.Name:setTopBottom( true, false, 2.5, 22.5 )
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
				self.Name:setTopBottom( true, false, 3.5, 23.5 )
				self.Name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
				self.clipFinished( Name, {} )
			end
		},
		DOA = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				Rank:completeAnimation()
				self.Rank:setAlpha( 0 )
				self.clipFinished( Rank, {} )

				Name:completeAnimation()
				self.Name:setLeftRight( true, false, 95, 308 )
				self.Name:setTopBottom( true, false, 2.5, 22.5 )
				self.clipFinished( Name, {} )
			end
		},
		DOAArabic = {
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
				self.Name:setTopBottom( true, false, 2.5, 22.5 )
				self.Name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
				self.clipFinished( Name, {} )
			end
		},
		Rankless = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				Rank:completeAnimation()
				self.Rank:setAlpha( 0 )
				self.clipFinished( Rank, {} )

				Name:completeAnimation()
				self.Name:setLeftRight( true, false, 95, 308 )
				self.Name:setTopBottom( true, false, 2.5, 22.5 )
				self.clipFinished( Name, {} )
			end
		},
		RanklessArabic = {
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
				self.Name:setTopBottom( true, false, 2.5, 22.5 )
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
		},
		{
			stateName = "Rankless",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "RanklessArabic",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Column0:close()
		element.Column1:close()
		element.Column2:close()
		element.Column3:close()
		element.Column4:close()
		element.Position:close()
		element.Rank:close()
		element.Name:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

