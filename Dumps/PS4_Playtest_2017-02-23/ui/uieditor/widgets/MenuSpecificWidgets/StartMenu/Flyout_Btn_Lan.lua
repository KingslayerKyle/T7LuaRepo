CoD.Flyout_Btn_Lan = InheritFrom( LUI.UIElement )
CoD.Flyout_Btn_Lan.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Flyout_Btn_Lan )
	self.id = "Flyout_Btn_Lan"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 72 )
	self:setTopBottom( 0, 0, 0, 72 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local idle = LUI.UIImage.new()
	idle:setLeftRight( 0, 0, -19, 91 )
	idle:setTopBottom( 0, 0, -19, 91 )
	idle:setImage( RegisterImage( "uie_menu_button_lan_idle" ) )
	self:addElement( idle )
	self.idle = idle
	
	local focus = LUI.UIImage.new()
	focus:setLeftRight( 0, 0, -19, 91 )
	focus:setTopBottom( 0, 0, -19, 91 )
	focus:setAlpha( 0 )
	focus:setImage( RegisterImage( "uie_menu_button_lan_focus" ) )
	self:addElement( focus )
	self.focus = focus
	
	local Lan = LUI.UITightText.new()
	Lan:setLeftRight( 0, 0, 88, 116 )
	Lan:setTopBottom( 0, 0, 22, 49 )
	Lan:setText( Engine.Localize( "JOIN LAN GAME" ) )
	Lan:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( Lan )
	self.Lan = Lan
	
	self.resetProperties = function ()
		Lan:completeAnimation()
		idle:completeAnimation()
		focus:completeAnimation()
		Lan:setAlpha( 1 )
		idle:setAlpha( 1 )
		focus:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Lan:completeAnimation()
				self.Lan:setAlpha( 0 )
				self.clipFinished( Lan, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				local idleFrame2 = function ( idle, event )
					if not event.interrupted then
						idle:beginAnimation( "keyframe", 519, false, true, CoD.TweenType.Linear )
					end
					idle:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( idle, event )
					else
						idle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				idle:completeAnimation()
				self.idle:setAlpha( 1 )
				idleFrame2( idle, {} )
				local focusFrame2 = function ( focus, event )
					if not event.interrupted then
						focus:beginAnimation( "keyframe", 519, true, false, CoD.TweenType.Bounce )
					end
					focus:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( focus, event )
					else
						focus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				focus:completeAnimation()
				self.focus:setAlpha( 0 )
				focusFrame2( focus, {} )
				local LanFrame2 = function ( Lan, event )
					if not event.interrupted then
						Lan:beginAnimation( "keyframe", 519, true, false, CoD.TweenType.Bounce )
					end
					Lan:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Lan, event )
					else
						Lan:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Lan:completeAnimation()
				self.Lan:setAlpha( 0 )
				LanFrame2( Lan, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

