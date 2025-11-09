CoD.VoipImage = {}
CoD.VoipImage.new = function ( defaultAnimationState, clientNum )
	local self = LUI.UIImage.new( defaultAnimationState )
	self:setupVoipImage( clientNum )
	return self
end

