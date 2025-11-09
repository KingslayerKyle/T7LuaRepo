CoD.ChallengeGridButton = {}
CoD.ChallengeGridButton.new = function ( controller, index, challengeName, imageID, isEmblem )
	local self = CoD.ContentGridButton.new( index )
	CoD.ContentGridButton.SetupButtonText( self, challengeName )
	CoD.ChallengeGridButton.SetupButtonImages( self, imageID, isEmblem )
	self.gainFocusSFX = "cac_grid_nav"
	return self
end

CoD.ChallengeGridButton.AddImage = function ( self, width, height, topOffset )
	if self.itemImage then
		self.itemImage:close()
	end
	self.itemImage = LUI.UIImage.new()
	self.itemImage:setLeftRight( false, false, -width / 2, width / 2 )
	self.itemImage:setTopBottom( true, false, topOffset, topOffset + height )
	self:addElement( self.itemImage )
end

CoD.ChallengeGridButton.SetupButtonImages = function ( self, imageID, isEmblem )
	local imageTopOffset = 5
	local bottomTitleHeight = CoD.ContentGridButton.TitleHeight + 4
	local imageWidth = 50
	local imageHeight = 50
	if not isEmblem then
		imageTopOffset = 6
		imageHeight = 48
		imageWidth = imageHeight * 4
	end
	CoD.ChallengeGridButton.AddImage( self, imageWidth, imageHeight, imageTopOffset )
	if isEmblem then
		self.itemImage:setupDrawEmblemById( imageID )
	else
		self.itemImage:setupDrawBackgroundById( imageID )
	end
	self.itemImage:setPriority( -70 )
	CoD.ContentGridButton.SetupButtonImages( self, CoD.GrenadeGridButton.glowBackColor, CoD.GrenadeGridButton.glowFrontColor )
end

