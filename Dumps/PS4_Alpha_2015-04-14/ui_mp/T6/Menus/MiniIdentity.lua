CoD.MiniIdentity = {}
CoD.MiniIdentity.New = function ( controller, defaultAnimState, xuid, useServer )
	local miniIdentity = LUI.UIElement.new( defaultAnimState )
	miniIdentity:setFont( CoD.fonts.Default )
	miniIdentity:setupMiniIdentity( xuid, useServer )
	miniIdentity:setFont( CoD.fonts.ExtraSmall )
	return miniIdentity
end

CoD.MiniIdentity.GetMiniIdentity = function ( controller, xuid )
	local backingContainer = LUI.UIElement.new()
	return backingContainer
end

