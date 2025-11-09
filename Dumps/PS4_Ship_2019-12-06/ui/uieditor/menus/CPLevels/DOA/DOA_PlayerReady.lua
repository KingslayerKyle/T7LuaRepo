require( "ui.uieditor.widgets.Footer.fe_LeftContainer_NOTLobby" )

local PreLoadFunc = function ( self, controller )
	Engine.SetUIActive( controller, true )
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	local f2_local0 = f2_arg0.close
	f2_arg0.close = function ( f3_arg0 )
		Engine.SetUIActive( f2_arg1, false )
		f3_arg0:playClip( "Close" )
		f3_arg0:registerEventHandler( "clip_over", f2_local0 )
	end
	
end

LUI.createMenu.DOA_PlayerReady = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "DOA_PlayerReady" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "DOA_PlayerReady.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Fullscreen = LUI.UIImage.new()
	Fullscreen:setLeftRight( true, false, 34, 1314 )
	Fullscreen:setTopBottom( true, false, 0, 720 )
	Fullscreen:setImage( RegisterImage( "uie_default_black_0" ) )
	self:addElement( Fullscreen )
	self.Fullscreen = Fullscreen
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 480, 1200 )
	Image0:setTopBottom( true, false, 36, 684 )
	Image0:setRGB( 0.24, 0.03, 1 )
	Image0:setAlpha( 0.88 )
	Image0:setImage( RegisterImage( "uie_gorilla_head" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local bezel = LUI.UIImage.new()
	bezel:setLeftRight( true, false, 0, 1280 )
	bezel:setTopBottom( true, false, 0, 720 )
	bezel:setImage( RegisterImage( "uie_menu_zom_bezel_overlay" ) )
	self:addElement( bezel )
	self.bezel = bezel
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( true, false, 182, 917 )
	TextBox0:setTopBottom( true, false, 280, 367 )
	TextBox0:setRGB( 0.3, 0.22, 1 )
	TextBox0:setText( Engine.Localize( "DOA_READY" ) )
	TextBox0:setTTF( "fonts/UnitedSansSmCdBd_0.ttf" )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	local feLeftContainerNOTLobby0 = CoD.fe_LeftContainer_NOTLobby.new( self, controller )
	feLeftContainerNOTLobby0:setLeftRight( true, false, 222, 654 )
	feLeftContainerNOTLobby0:setTopBottom( true, false, 636.5, 668.5 )
	self:addElement( feLeftContainerNOTLobby0 )
	self.feLeftContainerNOTLobby0 = feLeftContainerNOTLobby0
	
	local TextBox1 = LUI.UIText.new()
	TextBox1:setLeftRight( true, false, 186, 386 )
	TextBox1:setTopBottom( true, false, 373.54, 509.54 )
	TextBox1:setRGB( 0.51, 0.7, 1 )
	TextBox1:setText( Engine.Localize( "DOA_READY_YOU" ) )
	TextBox1:setTTF( "fonts/UnitedSansSmCdBd_0.ttf" )
	TextBox1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	TextBox1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox1 )
	self.TextBox1 = TextBox1
	
	local TextBox2 = LUI.UIText.new()
	TextBox2:setLeftRight( true, false, 388.83, 1003 )
	TextBox2:setTopBottom( true, false, 407, 500.54 )
	TextBox2:setRGB( 0.3, 0.22, 1 )
	TextBox2:setText( Engine.Localize( "DOA_READY_GET" ) )
	TextBox2:setTTF( "fonts/UnitedSansSmCdBd_0.ttf" )
	TextBox2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox2 )
	self.TextBox2 = TextBox2
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Close = function ()
				self:setupElementClipCounter( 6 )
				local Image0Frame2 = function ( Image0, event )
					if not event.interrupted then
						Image0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Image0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Image0, event )
					else
						Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setAlpha( 0.88 )
				Image0Frame2( Image0, {} )
				local bezelFrame2 = function ( bezel, event )
					if not event.interrupted then
						bezel:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					bezel:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( bezel, event )
					else
						bezel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				bezel:completeAnimation()
				self.bezel:setAlpha( 1 )
				bezelFrame2( bezel, {} )
				local TextBox0Frame2 = function ( TextBox0, event )
					if not event.interrupted then
						TextBox0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					TextBox0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( TextBox0, event )
					else
						TextBox0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TextBox0:completeAnimation()
				self.TextBox0:setAlpha( 1 )
				TextBox0Frame2( TextBox0, {} )
				local feLeftContainerNOTLobby0Frame2 = function ( feLeftContainerNOTLobby0, event )
					if not event.interrupted then
						feLeftContainerNOTLobby0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					feLeftContainerNOTLobby0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( feLeftContainerNOTLobby0, event )
					else
						feLeftContainerNOTLobby0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				feLeftContainerNOTLobby0:completeAnimation()
				self.feLeftContainerNOTLobby0:setAlpha( 1 )
				feLeftContainerNOTLobby0Frame2( feLeftContainerNOTLobby0, {} )
				local TextBox1Frame2 = function ( TextBox1, event )
					if not event.interrupted then
						TextBox1:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					TextBox1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( TextBox1, event )
					else
						TextBox1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TextBox1:completeAnimation()
				self.TextBox1:setAlpha( 1 )
				TextBox1Frame2( TextBox1, {} )
				local TextBox2Frame2 = function ( TextBox2, event )
					if not event.interrupted then
						TextBox2:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					TextBox2:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( TextBox2, event )
					else
						TextBox2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TextBox2:completeAnimation()
				self.TextBox2:setAlpha( 1 )
				TextBox2Frame2( TextBox2, {} )
			end
		}
	}
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "ESCAPE", function ( element, menu, controller, model )
		SendOwnMenuResponse( menu, controller, "MENU_READY" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "DOA_PLAYER_READY" )
		return true
	end, false )
	feLeftContainerNOTLobby0:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.feLeftContainerNOTLobby0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "DOA_PlayerReady.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

