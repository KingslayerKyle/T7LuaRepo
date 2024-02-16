-- 5850c8558ee487ef3029a3057552974c
-- This hash is used for caching, delete to decompile the file again

LUI.createMenu.CyberComTutorial = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CyberComTutorial" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CyberComTutorial.buttonPrompts" )
	local f1_local1 = self
	
	local txtCyberComLine10 = LUI.UIText.new()
	txtCyberComLine10:setLeftRight( true, true, 64, -64 )
	txtCyberComLine10:setTopBottom( true, false, 232, 257 )
	txtCyberComLine10:setTTF( "fonts/default.ttf" )
	txtCyberComLine10:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	txtCyberComLine10:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( txtCyberComLine10 )
	self.txtCyberComLine10 = txtCyberComLine10
	
	local txtCyberComLine1 = LUI.UIText.new()
	txtCyberComLine1:setLeftRight( true, true, 64, -64 )
	txtCyberComLine1:setTopBottom( true, false, 197, 222 )
	txtCyberComLine1:setTTF( "fonts/default.ttf" )
	txtCyberComLine1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	txtCyberComLine1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( txtCyberComLine1 )
	self.txtCyberComLine1 = txtCyberComLine1
	
	self.txtCyberComLine10:linkToElementModel( self, "tutorial_line_2", true, function ( model )
		local tutorialLine_2 = Engine.GetModelValue( model )
		if tutorialLine_2 then
			txtCyberComLine10:setText( Engine.Localize( tutorialLine_2 ) )
		end
	end )
	self.txtCyberComLine1:linkToElementModel( self, "tutorial_line_1", true, function ( model )
		local tutorialLine_1 = Engine.GetModelValue( model )
		if tutorialLine_1 then
			txtCyberComLine1:setText( Engine.Localize( tutorialLine_1 ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local f4_local0 = function ( f5_arg0, f5_arg1 )
					if not f5_arg1.interrupted then
						f5_arg0:beginAnimation( "keyframe", 999, false, false, CoD.TweenType.Linear )
					end
					f5_arg0:setAlpha( 1 )
					if f5_arg1.interrupted then
						self.clipFinished( f5_arg0, f5_arg1 )
					else
						f5_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				txtCyberComLine10:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
				txtCyberComLine10:setAlpha( 0 )
				txtCyberComLine10:registerEventHandler( "transition_complete_keyframe", f4_local0 )
				local txtCyberComLine1Frame2 = function ( txtCyberComLine1, event )
					if not event.interrupted then
						txtCyberComLine1:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					txtCyberComLine1:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( txtCyberComLine1, event )
					else
						txtCyberComLine1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				txtCyberComLine1:completeAnimation()
				self.txtCyberComLine1:setAlpha( 0 )
				txtCyberComLine1Frame2( txtCyberComLine1, {} )
			end,
			fadeout = function ()
				self:setupElementClipCounter( 2 )
				local f7_local0 = function ( f8_arg0, f8_arg1 )
					if not f8_arg1.interrupted then
						f8_arg0:beginAnimation( "keyframe", 999, false, false, CoD.TweenType.Linear )
					end
					f8_arg0:setAlpha( 0 )
					if f8_arg1.interrupted then
						self.clipFinished( f8_arg0, f8_arg1 )
					else
						f8_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				txtCyberComLine10:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
				txtCyberComLine10:setAlpha( 1 )
				txtCyberComLine10:registerEventHandler( "transition_complete_keyframe", f7_local0 )
				local txtCyberComLine1Frame2 = function ( txtCyberComLine1, event )
					if not event.interrupted then
						txtCyberComLine1:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					txtCyberComLine1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( txtCyberComLine1, event )
					else
						txtCyberComLine1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				txtCyberComLine1:completeAnimation()
				self.txtCyberComLine1:setAlpha( 1 )
				txtCyberComLine1Frame2( txtCyberComLine1, {} )
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
		element.txtCyberComLine10:close()
		element.txtCyberComLine1:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CyberComTutorial.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

