CoD.tabsBar = InheritFrom( LUI.UIElement )
CoD.tabsBar.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 69
	} )
	self:setAlignment( LUI.Alignment.Left )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.tabsBar )
	self.id = "tabsBar"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1046 )
	self:setTopBottom( true, false, 0, 30 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 32 )
	Image0:setTopBottom( true, false, -4, 28 )
	Image0:setRGB( 1, 1, 1 )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	Image0:subscribeToGlobalModel( controller, "Controller", "left_shoulder_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Image0:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( true, false, 101, 160 )
	Label0:setTopBottom( true, false, 1.5, 26.5 )
	Label0:setRGB( 0.97, 0.72, 0.26 )
	Label0:setText( Engine.Localize( "MENU_FRIENDS_CAPS" ) )
	Label0:setTTF( "fonts/default.ttf" )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	local Label1 = LUI.UITightText.new()
	Label1:setLeftRight( true, false, 229, 383 )
	Label1:setTopBottom( true, false, 0, 28 )
	Label1:setRGB( 1, 1, 1 )
	Label1:setText( Engine.Localize( "MENU_TAB_LEAGUE_FRIENDS_CAPS" ) )
	Label1:setTTF( "fonts/default.ttf" )
	self:addElement( Label1 )
	self.Label1 = Label1
	
	local Label2 = LUI.UITightText.new()
	Label2:setLeftRight( true, false, 452, 533 )
	Label2:setTopBottom( true, false, 0, 28 )
	Label2:setRGB( 1, 1, 1 )
	Label2:setText( Engine.Localize( "MENU_FACEBOOK_CAPS" ) )
	Label2:setTTF( "fonts/default.ttf" )
	self:addElement( Label2 )
	self.Label2 = Label2
	
	local Label3 = LUI.UITightText.new()
	Label3:setLeftRight( true, false, 602, 736 )
	Label3:setTopBottom( true, false, 0, 28 )
	Label3:setRGB( 1, 1, 1 )
	Label3:setText( Engine.Localize( "MENU_TAB_PLAYERS_CAPS" ) )
	Label3:setTTF( "fonts/default.ttf" )
	self:addElement( Label3 )
	self.Label3 = Label3
	
	local Label4 = LUI.UITightText.new()
	Label4:setLeftRight( true, false, 805, 936 )
	Label4:setTopBottom( true, false, 0, 28 )
	Label4:setRGB( 1, 1, 1 )
	Label4:setText( Engine.Localize( "MENU_TAB_XBOXLIVE_PARTY" ) )
	Label4:setTTF( "fonts/default.ttf" )
	self:addElement( Label4 )
	self.Label4 = Label4
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 1005, 1037 )
	Image1:setTopBottom( true, false, -4, 28 )
	Image1:setRGB( 1, 1, 1 )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	Image1:subscribeToGlobalModel( controller, "Controller", "right_shoulder_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Image1:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	self.close = function ( self )
		self.Image0:close()
		self.Image1:close()
		CoD.tabsBar.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

