LUI.createMenu.zod_ritual_succeeded = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "zod_ritual_succeeded" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( true, false, 271.5, 1008.5 )
	TextBox0:setTopBottom( true, false, 332.5, 387.5 )
	TextBox0:setRGB( 1, 1, 1 )
	TextBox0:setText( Engine.Localize( "ZM_ZOD_DEFEND_AREA_SUCCEEDED" ) )
	TextBox0:setTTF( "fonts/GatewayA2.ttf" )
	TextBox0:setAlignment( LUI.Alignment.Center )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Ascent = function ()
				self.TextBox0:CloseAnimationQueue()
				self.TextBox0:animationQueue( {
					{
						time = 0,
						funct = function ( TextBox0, time )
							TextBox0:beginAnimation( "keyframe", time, false, false, CoD.TweenType.Linear )
							self.TextBox0:setLeftRight( true, false, 271.5, 1008.5 )
							self.TextBox0:setTopBottom( true, false, 332.5, 387.5 )
							self.TextBox0:setAlpha( 1 )
						end
					},
					{
						time = 2000,
						funct = function ( TextBox0, time )
							TextBox0:beginAnimation( "keyframe", time, false, false, CoD.TweenType.Linear )
							TextBox0:setLeftRight( true, false, 271.5, 1008.5 )
							TextBox0:setTopBottom( true, false, 54, 109 )
							TextBox0:setAlpha( 0 )
						end
					},
					{
						time = 0,
						funct = function ( TextBox0, time, event )
							self:childClipFinished()
						end
					}
				}, 1000, false )
				self:setupElementClipCounter( 1 )
			end
		}
	}
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		controller = controller
	} )
	if PostLoadFunc then
		PostLoadFunc( self )
	end
	return self
end

