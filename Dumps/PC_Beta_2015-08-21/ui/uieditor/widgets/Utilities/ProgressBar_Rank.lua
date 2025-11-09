require( "ui.uieditor.widgets.Border" )

CoD.ProgressBar_Rank = InheritFrom( LUI.UIElement )
CoD.ProgressBar_Rank.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ProgressBar_Rank )
	self.id = "ProgressBar_Rank"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 572 )
	self:setTopBottom( true, false, 0, 65 )
	
	local curRank = LUI.UIText.new()
	curRank:setLeftRight( true, false, 5, 43 )
	curRank:setTopBottom( false, true, -30, -5 )
	curRank:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	curRank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	curRank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	curRank:subscribeToGlobalModel( controller, "XPProgressionBar", "currentRank", function ( model )
		local currentRank = Engine.GetModelValue( model )
		if currentRank then
			curRank:setText( Engine.Localize( currentRank ) )
		end
	end )
	self:addElement( curRank )
	self.curRank = curRank
	
	local curRankImg = LUI.UIImage.new()
	curRankImg:setLeftRight( true, false, 37, 65 )
	curRankImg:setTopBottom( false, true, -30, -5 )
	curRankImg:subscribeToGlobalModel( controller, "XPProgressionBar", "currentRankIcon", function ( model )
		local currentRankIcon = Engine.GetModelValue( model )
		if currentRankIcon then
			curRankImg:setImage( RegisterImage( currentRankIcon ) )
		end
	end )
	self:addElement( curRankImg )
	self.curRankImg = curRankImg
	
	local progress = LUI.UIImage.new()
	progress:setLeftRight( true, true, 77.5, -79.5 )
	progress:setTopBottom( false, true, -30, -5 )
	progress:setRGB( 1, 0.35, 0 )
	progress:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	progress:setShaderVector( 1, 0, 0, 0, 0 )
	progress:setShaderVector( 2, 1, 0, 0, 0 )
	progress:setShaderVector( 3, 0, 0, 0, 0 )
	progress:subscribeToGlobalModel( controller, "XPProgressionBar", "progress", function ( model )
		local _progress = Engine.GetModelValue( model )
		if _progress then
			progress:setShaderVector( 0, CoD.GetVectorComponentFromString( _progress, 1 ), CoD.GetVectorComponentFromString( _progress, 2 ), CoD.GetVectorComponentFromString( _progress, 3 ), CoD.GetVectorComponentFromString( _progress, 4 ) )
		end
	end )
	self:addElement( progress )
	self.progress = progress
	
	local progressBorder = CoD.Border.new( menu, controller )
	progressBorder:setLeftRight( true, true, 77.5, -79.5 )
	progressBorder:setTopBottom( false, true, -30, -5 )
	self:addElement( progressBorder )
	self.progressBorder = progressBorder
	
	local nextRank = LUI.UIText.new()
	nextRank:setLeftRight( false, true, -73, -39 )
	nextRank:setTopBottom( false, true, -30, -5 )
	nextRank:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	nextRank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	nextRank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	nextRank:subscribeToGlobalModel( controller, "XPProgressionBar", "nextRank", function ( model )
		local _nextRank = Engine.GetModelValue( model )
		if _nextRank then
			nextRank:setText( Engine.Localize( _nextRank ) )
		end
	end )
	self:addElement( nextRank )
	self.nextRank = nextRank
	
	local nextRankImage = LUI.UIImage.new()
	nextRankImage:setLeftRight( false, true, -43, -15 )
	nextRankImage:setTopBottom( false, true, -30, -5 )
	nextRankImage:subscribeToGlobalModel( controller, "XPProgressionBar", "nextRankIcon", function ( model )
		local nextRankIcon = Engine.GetModelValue( model )
		if nextRankIcon then
			nextRankImage:setImage( RegisterImage( nextRankIcon ) )
		end
	end )
	self:addElement( nextRankImage )
	self.nextRankImage = nextRankImage
	
	local nextRankDesc = LUI.UIText.new()
	nextRankDesc:setLeftRight( false, true, -73, -9 )
	nextRankDesc:setTopBottom( true, false, 14.5, 34.5 )
	nextRankDesc:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	nextRankDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	nextRankDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	nextRankDesc:subscribeToGlobalModel( controller, "XPProgressionBar", "xpToNextRank", function ( model )
		local xpToNextRank = Engine.GetModelValue( model )
		if xpToNextRank then
			nextRankDesc:setText( Engine.Localize( xpToNextRank ) )
		end
	end )
	self:addElement( nextRankDesc )
	self.nextRankDesc = nextRankDesc
	
	local progressBorder0 = CoD.Border.new( menu, controller )
	progressBorder0:setLeftRight( false, true, -73, -9 )
	progressBorder0:setTopBottom( false, true, -30, -5 )
	self:addElement( progressBorder0 )
	self.progressBorder0 = progressBorder0
	
	local progressBorder01 = CoD.Border.new( menu, controller )
	progressBorder01:setLeftRight( true, false, 6, 71 )
	progressBorder01:setTopBottom( false, true, -30, -5 )
	self:addElement( progressBorder01 )
	self.progressBorder01 = progressBorder01
	
	local NextLevel = LUI.UIText.new()
	NextLevel:setLeftRight( false, true, -316.5, -79.5 )
	NextLevel:setTopBottom( true, false, 14.5, 34.5 )
	NextLevel:setText( Engine.Localize( AppendToLocalizedString( ":", "MENU_NEXT_LEVEL" ) ) )
	NextLevel:setTTF( "fonts/default.ttf" )
	NextLevel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	NextLevel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( NextLevel )
	self.NextLevel = NextLevel
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.progressBorder:close()
		element.progressBorder0:close()
		element.progressBorder01:close()
		element.curRank:close()
		element.curRankImg:close()
		element.progress:close()
		element.nextRank:close()
		element.nextRankImage:close()
		element.nextRankDesc:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

