-- f3eab29a654bbf1feaf67772273ef2f1
-- This hash is used for caching, delete to decompile the file again

LUI.createMenu.LocationAndTime = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "LocationAndTime" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "LocationAndTime.buttonPrompts" )
	local f1_local1 = self
	
	local txtCyberComLine1Shadow = LUI.UIText.new()
	txtCyberComLine1Shadow:setLeftRight( true, true, 65, -63 )
	txtCyberComLine1Shadow:setTopBottom( true, false, 472, 506 )
	txtCyberComLine1Shadow:setRGB( 0.29, 0.29, 0.29 )
	txtCyberComLine1Shadow:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	txtCyberComLine1Shadow:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	txtCyberComLine1Shadow:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( txtCyberComLine1Shadow )
	self.txtCyberComLine1Shadow = txtCyberComLine1Shadow
	
	local txtCyberComLine1 = LUI.UIText.new()
	txtCyberComLine1:setLeftRight( true, true, 64, -64 )
	txtCyberComLine1:setTopBottom( true, false, 471, 505 )
	txtCyberComLine1:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	txtCyberComLine1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	txtCyberComLine1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( txtCyberComLine1 )
	self.txtCyberComLine1 = txtCyberComLine1
	
	local txtCyberComLine10Shadow = LUI.UIText.new()
	txtCyberComLine10Shadow:setLeftRight( true, true, 65, -63 )
	txtCyberComLine10Shadow:setTopBottom( true, false, 505, 535 )
	txtCyberComLine10Shadow:setRGB( 0.27, 0.27, 0.27 )
	txtCyberComLine10Shadow:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	txtCyberComLine10Shadow:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	txtCyberComLine10Shadow:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( txtCyberComLine10Shadow )
	self.txtCyberComLine10Shadow = txtCyberComLine10Shadow
	
	local txtCyberComLine10 = LUI.UIText.new()
	txtCyberComLine10:setLeftRight( true, true, 64, -64 )
	txtCyberComLine10:setTopBottom( true, false, 504, 534 )
	txtCyberComLine10:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	txtCyberComLine10:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	txtCyberComLine10:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( txtCyberComLine10 )
	self.txtCyberComLine10 = txtCyberComLine10
	
	self.txtCyberComLine1Shadow:linkToElementModel( self, "loctime_location", true, function ( model )
		local loctimeLocation = Engine.GetModelValue( model )
		if loctimeLocation then
			txtCyberComLine1Shadow:setText( Engine.Localize( loctimeLocation ) )
		end
	end )
	self.txtCyberComLine1:linkToElementModel( self, "loctime_location", true, function ( model )
		local loctimeLocation = Engine.GetModelValue( model )
		if loctimeLocation then
			txtCyberComLine1:setText( Engine.Localize( loctimeLocation ) )
		end
	end )
	self.txtCyberComLine10Shadow:linkToElementModel( self, "loctime_date", true, function ( model )
		local loctimeDate = Engine.GetModelValue( model )
		if loctimeDate then
			txtCyberComLine10Shadow:setText( Engine.Localize( loctimeDate ) )
		end
	end )
	self.txtCyberComLine10:linkToElementModel( self, "loctime_date", true, function ( model )
		local loctimeDate = Engine.GetModelValue( model )
		if loctimeDate then
			txtCyberComLine10:setText( Engine.Localize( loctimeDate ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
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
				local f6_local1 = function ( f8_arg0, f8_arg1 )
					if not f8_arg1.interrupted then
						f8_arg0:beginAnimation( "keyframe", 999, false, false, CoD.TweenType.Linear )
					end
					f8_arg0:setAlpha( 1 )
					if f8_arg1.interrupted then
						self.clipFinished( f8_arg0, f8_arg1 )
					else
						f8_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				txtCyberComLine10:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
				txtCyberComLine10:setAlpha( 0 )
				txtCyberComLine10:registerEventHandler( "transition_complete_keyframe", f6_local1 )
			end,
			fadeout = function ()
				self:setupElementClipCounter( 2 )
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
				local f9_local1 = function ( f11_arg0, f11_arg1 )
					if not f11_arg1.interrupted then
						f11_arg0:beginAnimation( "keyframe", 999, false, false, CoD.TweenType.Linear )
					end
					f11_arg0:setAlpha( 0 )
					if f11_arg1.interrupted then
						self.clipFinished( f11_arg0, f11_arg1 )
					else
						f11_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				txtCyberComLine10:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
				txtCyberComLine10:setAlpha( 1 )
				txtCyberComLine10:registerEventHandler( "transition_complete_keyframe", f9_local1 )
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
		element.txtCyberComLine1Shadow:close()
		element.txtCyberComLine1:close()
		element.txtCyberComLine10Shadow:close()
		element.txtCyberComLine10:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "LocationAndTime.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

