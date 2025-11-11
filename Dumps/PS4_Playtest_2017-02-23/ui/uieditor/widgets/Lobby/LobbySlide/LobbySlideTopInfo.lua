CoD.LobbySlideTopInfo = InheritFrom( LUI.UIElement )
CoD.LobbySlideTopInfo.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 0
	} )
	self:setAlignment( LUI.Alignment.Left )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LobbySlideTopInfo )
	self.id = "LobbySlideTopInfo"
	self.soundSet = "ModeSelection"
	self:setLeftRight( 0, 0, 0, 436 )
	self:setTopBottom( 0, 0, 0, 36 )
	
	local Icon = LUI.UIImage.new()
	Icon:setLeftRight( 0, 0, 0, 24 )
	Icon:setTopBottom( 0, 0, -2, 34 )
	Icon:setRGB( 0.52, 0.84, 0.15 )
	Icon:setImage( RegisterImage( "uie_t7_menu_frontend_iconjoinable" ) )
	Icon:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Icon )
	self.Icon = Icon
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 0, 24, 28 )
	Image0:setTopBottom( 0, 0, -46, 42 )
	Image0:setAlpha( 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Status1 = LUI.UITightText.new()
	Status1:setLeftRight( 0, 0, 28, 96 )
	Status1:setTopBottom( 0, 0, 0, 38 )
	Status1:setRGB( 0.52, 0.84, 0.15 )
	Status1:setText( Engine.Localize( "Joinable" ) )
	Status1:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( Status1 )
	self.Status1 = Status1
	
	local Image10 = LUI.UIImage.new()
	Image10:setLeftRight( 0, 0, 96, 106 )
	Image10:setTopBottom( 0, 0, -46, 42 )
	Image10:setAlpha( 0 )
	self:addElement( Image10 )
	self.Image10 = Image10
	
	local Status2 = LUI.UITightText.new()
	Status2:setLeftRight( 0, 0, 107, 272 )
	Status2:setTopBottom( 0, 0, 0, 38 )
	Status2:setText( Engine.Localize( "In a Game Lobby" ) )
	Status2:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( Status2 )
	self.Status2 = Status2
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( 0, 0, 271, 287 )
	Image1:setTopBottom( 0, 0, -46, 42 )
	Image1:setAlpha( 0 )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

