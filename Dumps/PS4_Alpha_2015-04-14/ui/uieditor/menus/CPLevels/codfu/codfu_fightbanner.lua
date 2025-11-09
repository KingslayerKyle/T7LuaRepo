LUI.createMenu.codfu_fightbanner = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "codfu_fightbanner" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	local menu = self
	
	local Fight = LUI.UIText.new()
	Fight:setLeftRight( true, false, 458, 822 )
	Fight:setTopBottom( true, false, 320, 400 )
	Fight:setRGB( 1, 1, 1 )
	Fight:setText( Engine.Localize( "MENU_FIGHT" ) )
	Fight:setTTF( "fonts/GatewayA2.ttf" )
	Fight:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Fight:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	self:addElement( Fight )
	self.Fight = Fight
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			ShowFightBanner = function ()
				self:setupElementClipCounter( 1 )
				local FightFrame2 = function ( Fight, event )
					if not event.interrupted then
						Fight:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					Fight:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Fight, event )
					else
						Fight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Fight:completeAnimation()
				self.Fight:setAlpha( 0 )
				FightFrame2( Fight, {} )
			end,
			HideFightBanner = function ()
				self:setupElementClipCounter( 1 )
				local FightFrame2 = function ( Fight, event )
					if not event.interrupted then
						Fight:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					Fight:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Fight, event )
					else
						Fight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Fight:completeAnimation()
				self.Fight:setAlpha( 1 )
				FightFrame2( Fight, {} )
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

