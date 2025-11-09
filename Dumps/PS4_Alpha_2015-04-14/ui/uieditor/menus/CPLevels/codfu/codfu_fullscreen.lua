LUI.createMenu.codfu_fullscreen = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "codfu_fullscreen" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "HUD"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	local menu = self
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 1280 )
	Image0:setTopBottom( true, false, 0, 720 )
	Image0:setRGB( 1, 1, 1 )
	Image0:setAlpha( 0 )
	Image0:setImage( RegisterImage( "uie_menu_zom_bezel_overlay" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Image0:completeAnimation()
				self.Image0:setAlpha( 1 )
				self.clipFinished( Image0, {} )
			end
		}
	}
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		LockInput( self, controller, false )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = menu
	} )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

