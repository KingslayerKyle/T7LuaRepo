LUI.createMenu.BulletTimeReticule = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "BulletTimeReticule" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	local menu = self
	
	local Reticule = LUI.UIImage.new()
	Reticule:setLeftRight( true, true, 28, -28 )
	Reticule:setTopBottom( true, true, -2, 2 )
	Reticule:setRGB( 1, 0, 0 )
	Reticule:setAlpha( 0.6 )
	Reticule:setImage( RegisterImage( "uie_img_t7_cp_hud_deadsys_piplarge" ) )
	Reticule:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Reticule )
	self.Reticule = Reticule
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			SquadStartFadeIn = function ()
				self:setupElementClipCounter( 1 )
				local ReticuleFrame2 = function ( Reticule, event )
					if not event.interrupted then
						Reticule:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
					end
					Reticule:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( Reticule, event )
					else
						Reticule:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Reticule:completeAnimation()
				self.Reticule:setAlpha( 0 )
				ReticuleFrame2( Reticule, {} )
			end
		}
	}
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

