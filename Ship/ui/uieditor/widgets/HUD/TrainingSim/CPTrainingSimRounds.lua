-- 3ef6b91b1d7f18e181d1c38a8da29621
-- This hash is used for caching, delete to decompile the file again

CoD.CPTrainingSimRounds = InheritFrom( LUI.UIElement )
CoD.CPTrainingSimRounds.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CPTrainingSimRounds )
	self.id = "CPTrainingSimRounds"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 75 )
	self:setTopBottom( true, false, 0, 25 )
	
	local maxRounds = LUI.UIText.new()
	maxRounds:setLeftRight( true, false, 42.05, 75 )
	maxRounds:setTopBottom( true, false, 0, 25 )
	maxRounds:setText( Engine.Localize( "16" ) )
	maxRounds:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	maxRounds:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	maxRounds:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( maxRounds )
	self.maxRounds = maxRounds
	
	local slash = LUI.UIText.new()
	slash:setLeftRight( true, false, 34, 42.05 )
	slash:setTopBottom( true, false, 0, 25 )
	slash:setText( Engine.Localize( "/" ) )
	slash:setTTF( "fonts/default.ttf" )
	slash:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	slash:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( slash )
	self.slash = slash
	
	local currentRound = LUI.UIText.new()
	currentRound:setLeftRight( true, false, 0, 34 )
	currentRound:setTopBottom( true, false, 0, 25 )
	currentRound:setText( Engine.Localize( "0" ) )
	currentRound:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	currentRound:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	currentRound:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( currentRound )
	self.currentRound = currentRound
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
