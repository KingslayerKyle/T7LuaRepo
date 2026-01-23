LUI.createMenu.AnchorDeployed = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "AnchorDeployed" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "AnchorDeployed.buttonPrompts" )
	local f1_local1 = self
	
	local AnchorDeployed = LUI.UIText.new()
	AnchorDeployed:setLeftRight( true, true, 503, -503 )
	AnchorDeployed:setTopBottom( true, false, 441, 491 )
	AnchorDeployed:setRGB( 0.95, 1, 0.33 )
	AnchorDeployed:setText( Engine.Localize( "CP_MI_SING_BLACKSTATION_ANCHOR_DEPLOYED" ) )
	AnchorDeployed:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	AnchorDeployed:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	AnchorDeployed:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( AnchorDeployed )
	self.AnchorDeployed = AnchorDeployed
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local f2_local0 = function ( f3_arg0, f3_arg1 )
					local f3_local0 = function ( f4_arg0, f4_arg1 )
						local f4_local0 = function ( f5_arg0, f5_arg1 )
							if not f5_arg1.interrupted then
								f5_arg0:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
							end
							f5_arg0:setAlpha( 0 )
							if f5_arg1.interrupted then
								self.clipFinished( f5_arg0, f5_arg1 )
							else
								f5_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f4_arg1.interrupted then
							f4_local0( f4_arg0, f4_arg1 )
							return 
						else
							f4_arg0:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
							f4_arg0:registerEventHandler( "transition_complete_keyframe", f4_local0 )
						end
					end
					
					if f3_arg1.interrupted then
						f3_local0( f3_arg0, f3_arg1 )
						return 
					else
						f3_arg0:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						f3_arg0:setAlpha( 1 )
						f3_arg0:registerEventHandler( "transition_complete_keyframe", f3_local0 )
					end
				end
				
				AnchorDeployed:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
				self.AnchorDeployed:setAlpha( 0 )
				AnchorDeployed:registerEventHandler( "transition_complete_keyframe", f2_local0 )
				self.nextClip = "DefaultClip"
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
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "AnchorDeployed.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

