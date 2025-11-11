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
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 1080 )
	
	local MovieSubtitles = LUI.UITightText.new()
	MovieSubtitles:setLeftRight( 0.5, 0.5, -567, 567 )
	MovieSubtitles:setTopBottom( 0, 0, 891, 929 )
	MovieSubtitles:setTTF( "fonts/default.ttf" )
	MovieSubtitles:setupCinematicSubtitles()
	self:addElement( MovieSubtitles )
	self.MovieSubtitles = MovieSubtitles
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

