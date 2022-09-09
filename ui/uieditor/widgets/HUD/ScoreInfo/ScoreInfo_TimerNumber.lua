-- 9368c43005f2fb5398b54a8a69477772
-- This hash is used for caching, delete to decompile the file again

CoD.ScoreInfo_TimerNumber = InheritFrom( LUI.UIElement )
CoD.ScoreInfo_TimerNumber.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ScoreInfo_TimerNumber )
	self.id = "ScoreInfo_TimerNumber"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 83 )
	self:setTopBottom( true, false, 0, 18 )
	
	local GameTimer00 = LUI.UITightText.new()
	GameTimer00:setLeftRight( false, false, -41.5, 41.5 )
	GameTimer00:setTopBottom( false, false, -9, 9 )
	GameTimer00:setTTF( "fonts/escom.ttf" )
	GameTimer00:setLetterSpacing( 0.5 )
	GameTimer00:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	GameTimer00:subscribeToGlobalModel( controller, "GameScore", "gameTimeEnd", function ( model )
		if Engine.GetModelValue( model ) then
			GameTimer00:setupGameTimer()
		end
	end )
	self:addElement( GameTimer00 )
	self.GameTimer00 = GameTimer00
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GameTimer00:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
