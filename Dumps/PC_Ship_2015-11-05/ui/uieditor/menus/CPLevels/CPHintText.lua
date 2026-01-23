LUI.createMenu.CPHintText = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CPHintText" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CPHintText.buttonPrompts" )
	local f1_local1 = self
	
	local txtHintText = LUI.UIText.new()
	txtHintText:setLeftRight( true, true, 64, -64 )
	txtHintText:setTopBottom( true, true, 423, -267 )
	txtHintText:setTTF( "fonts/default.ttf" )
	txtHintText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	txtHintText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( txtHintText )
	self.txtHintText = txtHintText
	
	self.txtHintText:linkToElementModel( self, "hint_text_line", true, function ( model )
		local hintTextLine = Engine.GetModelValue( model )
		if hintTextLine then
			txtHintText:setText( Engine.Localize( hintTextLine ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			blinking = function ()
				self:setupElementClipCounter( 1 )
				local f4_local0 = function ( f5_arg0, f5_arg1 )
					local f5_local0 = function ( f6_arg0, f6_arg1 )
						local f6_local0 = function ( f7_arg0, f7_arg1 )
							if not f7_arg1.interrupted then
								f7_arg0:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
							end
							f7_arg0:setAlpha( 1 )
							if f7_arg1.interrupted then
								self.clipFinished( f7_arg0, f7_arg1 )
							else
								f7_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f6_arg1.interrupted then
							f6_local0( f6_arg0, f6_arg1 )
							return 
						else
							f6_arg0:beginAnimation( "keyframe", 399, false, false, CoD.TweenType.Linear )
							f6_arg0:setAlpha( 1 )
							f6_arg0:registerEventHandler( "transition_complete_keyframe", f6_local0 )
						end
					end
					
					if f5_arg1.interrupted then
						f5_local0( f5_arg0, f5_arg1 )
						return 
					else
						f5_arg0:beginAnimation( "keyframe", 480, false, false, CoD.TweenType.Linear )
						f5_arg0:setAlpha( 0.1 )
						f5_arg0:registerEventHandler( "transition_complete_keyframe", f5_local0 )
					end
				end
				
				txtHintText:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				self.txtHintText:setAlpha( 1 )
				txtHintText:registerEventHandler( "transition_complete_keyframe", f4_local0 )
				self.nextClip = "blinking"
			end,
			display_noblink = function ()
				self:setupElementClipCounter( 1 )
				local txtHintTextFrame2 = function ( txtHintText, event )
					if not event.interrupted then
						txtHintText:beginAnimation( "keyframe", 270, false, false, CoD.TweenType.Linear )
					end
					txtHintText:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( txtHintText, event )
					else
						txtHintText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				txtHintText:completeAnimation()
				self.txtHintText:setAlpha( 0 )
				txtHintTextFrame2( txtHintText, {} )
			end,
			fadeout = function ()
				self:setupElementClipCounter( 1 )
				local txtHintTextFrame2 = function ( txtHintText, event )
					if not event.interrupted then
						txtHintText:beginAnimation( "keyframe", 550, false, false, CoD.TweenType.Linear )
					end
					txtHintText:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( txtHintText, event )
					else
						txtHintText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				txtHintText:completeAnimation()
				self.txtHintText:setAlpha( 1 )
				txtHintTextFrame2( txtHintText, {} )
			end
		},
		display_noblink = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			fadeout = function ()
				self:setupElementClipCounter( 1 )
				local txtHintTextFrame2 = function ( txtHintText, event )
					if not event.interrupted then
						txtHintText:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
					end
					txtHintText:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( txtHintText, event )
					else
						txtHintText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				txtHintText:completeAnimation()
				self.txtHintText:setAlpha( 1 )
				txtHintTextFrame2( txtHintText, {} )
			end
		},
		display_blinking = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local txtHintTextFrame2 = function ( txtHintText, event )
					local txtHintTextFrame3 = function ( txtHintText, event )
						if not event.interrupted then
							txtHintText:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
						end
						txtHintText:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( txtHintText, event )
						else
							txtHintText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						txtHintTextFrame3( txtHintText, event )
						return 
					else
						txtHintText:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
						txtHintText:setAlpha( 0 )
						txtHintText:registerEventHandler( "transition_complete_keyframe", txtHintTextFrame3 )
					end
				end
				
				txtHintText:completeAnimation()
				self.txtHintText:setAlpha( 1 )
				txtHintTextFrame2( txtHintText, {} )
			end
		}
	}
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f1_local1
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.txtHintText:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CPHintText.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

