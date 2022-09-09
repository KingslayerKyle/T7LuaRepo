-- 7481bb93910d5b5a2161c00c8280205d
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 291 )
	self:setTopBottom( true, false, 0, 24 )
	
	local Icon = LUI.UIImage.new()
	Icon:setLeftRight( true, false, 0, 16 )
	Icon:setTopBottom( true, false, -1, 23 )
	Icon:setRGB( 0.52, 0.84, 0.15 )
	Icon:setImage( RegisterImage( "uie_t7_menu_frontend_iconjoinable" ) )
	Icon:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Icon )
	self.Icon = Icon
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 16, 19 )
	Image0:setTopBottom( true, false, -30.5, 28.5 )
	Image0:setAlpha( 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Status1 = LUI.UITightText.new()
	Status1:setLeftRight( true, false, 19, 64 )
	Status1:setTopBottom( true, false, 0, 25 )
	Status1:setRGB( 0.52, 0.84, 0.15 )
	Status1:setText( Engine.Localize( "Joinable" ) )
	Status1:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( Status1 )
	self.Status1 = Status1
	
	local Image10 = LUI.UIImage.new()
	Image10:setLeftRight( true, false, 64, 71 )
	Image10:setTopBottom( true, false, -30.5, 28.5 )
	Image10:setAlpha( 0 )
	self:addElement( Image10 )
	self.Image10 = Image10
	
	local Status2 = LUI.UITightText.new()
	Status2:setLeftRight( true, false, 71, 181 )
	Status2:setTopBottom( true, false, 0, 25 )
	Status2:setText( Engine.Localize( "In a Game Lobby" ) )
	Status2:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( Status2 )
	self.Status2 = Status2
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 181, 191.5 )
	Image1:setTopBottom( true, false, -30.5, 28.5 )
	Image1:setAlpha( 0 )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
