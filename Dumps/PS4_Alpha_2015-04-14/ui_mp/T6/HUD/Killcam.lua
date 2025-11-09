local KillcamBarHeight = 120
local KillcamR = 1
local KillcamG = 0
local KillcamB = 0
local KillcamA = 0.2
local KillcamTextA = 0.75
local KillcamTitleFontName = "Morris"
local FinalKillcamR = 0
local FinalKillcamG = 0
local FinalKillcamB = 0
local FinalKillcamA = 0.2
LUI.createMenu.Killcam = function ( controller )
	local self = CoD.Menu.NewFromState( "Killcam" )
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	local topContainer = LUI.UIElement.new()
	topContainer:setLeftRight( true, true, 0, 0 )
	topContainer:setTopBottom( true, false, 0, KillcamBarHeight )
	self:addElement( topContainer )
	local topImage = LUI.UIImage.new()
	topImage:setLeftRight( true, true, 0, 0 )
	topImage:setTopBottom( true, true, 0, 0 )
	topContainer:addElement( topImage )
	local bottomContainer = LUI.UIElement.new()
	bottomContainer:setLeftRight( true, true, 0, 0 )
	bottomContainer:setTopBottom( false, true, -KillcamBarHeight, 0 )
	self:addElement( bottomContainer )
	local bottomImage = LUI.UIImage.new()
	bottomImage:setLeftRight( true, true, 0, 0 )
	bottomImage:setTopBottom( true, true, 0, 0 )
	bottomContainer:addElement( bottomImage )
	local killcamTitle = LUI.UIText.new()
	killcamTitle:setLeftRight( true, true, 0, 0 )
	killcamTitle:setTopBottom( false, true, -CoD.textSize[KillcamTitleFontName], 0 )
	killcamTitle:setFont( CoD.fonts[KillcamTitleFontName] )
	killcamTitle:setAlpha( KillcamTextA )
	topContainer:addElement( killcamTitle )
	self.isFinalKillcam = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_FINAL_KILLCAM )
	self.isRoundEndKillcam = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM )
	local isNemesisKillcam = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_NEMESIS_KILLCAM )
	if self.isFinalKillcam or self.isRoundEndKillcam then
		topImage:setRGB( FinalKillcamR, FinalKillcamG, FinalKillcamB )
		topImage:setAlpha( FinalKillcamA )
		bottomImage:setRGB( FinalKillcamR, FinalKillcamG, FinalKillcamB )
		bottomImage:setAlpha( FinalKillcamA )
		if self.isFinalKillcam then
			killcamTitle:setText( Engine.Localize( "MP_FINAL_KILLCAM_CAPS" ) )
		else
			killcamTitle:setText( Engine.Localize( "MP_ROUND_END_KILLCAM" ) )
		end
	else
		topImage:setRGB( KillcamR, KillcamG, KillcamB )
		topImage:setAlpha( KillcamA )
		bottomImage:setRGB( KillcamR, KillcamG, KillcamB )
		bottomImage:setAlpha( KillcamA )
		if isNemesisKillcam then
			killcamTitle:setText( Engine.Localize( "MP_NEMESIS_KILLCAM_CAPS" ) )
		else
			killcamTitle:setText( Engine.Localize( "MP_KILLCAM_CAPS" ) )
		end
	end
	return self
end

