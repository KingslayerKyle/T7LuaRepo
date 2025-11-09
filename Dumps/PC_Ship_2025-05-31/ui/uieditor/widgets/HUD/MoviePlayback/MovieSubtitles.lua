CoD.MovieSubtitles = InheritFrom( LUI.UIElement )
CoD.MovieSubtitles.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.MovieSubtitles )
	self.id = "MovieSubtitles"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	
	local MovieSubtitles = LUI.UITightText.new()
	MovieSubtitles:setLeftRight( false, false, -378, 378 )
	MovieSubtitles:setTopBottom( true, false, 594.2, 619.2 )
	MovieSubtitles:setTTF( "fonts/default.ttf" )
	MovieSubtitles:setupCinematicSubtitles()
	self:addElement( MovieSubtitles )
	self.MovieSubtitles = MovieSubtitles
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

