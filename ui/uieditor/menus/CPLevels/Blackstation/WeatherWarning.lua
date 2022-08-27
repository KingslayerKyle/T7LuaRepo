-- e34522ef74919f42f37676b5961ead2d
-- This hash is used for caching, delete to decompile the file again

LUI.createMenu.WeatherWarning = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "WeatherWarning" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "WeatherWarning.buttonPrompts" )
	local f1_local1 = self
	
	local weatherWarning = LUI.UIText.new()
	weatherWarning:setLeftRight( true, true, 479, -479 )
	weatherWarning:setTopBottom( true, true, 483, -212 )
	weatherWarning:setRGB( 1, 0, 0 )
	weatherWarning:setText( Engine.Localize( "CP_MI_SING_BLACKSTATION_DNI_WARNING" ) )
	weatherWarning:setTTF( "fonts/default.ttf" )
	weatherWarning:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	weatherWarning:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( weatherWarning )
	self.weatherWarning = weatherWarning
	
	local weatherWarning2 = LUI.UIText.new()
	weatherWarning2:setLeftRight( true, true, 479, -479 )
	weatherWarning2:setTopBottom( true, true, 508, -187 )
	weatherWarning2:setRGB( 1, 0, 0 )
	weatherWarning2:setText( Engine.Localize( "CP_MI_SING_BLACKSTATION_WEATHER_WARNING" ) )
	weatherWarning2:setTTF( "fonts/default.ttf" )
	weatherWarning2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	weatherWarning2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( weatherWarning2 )
	self.weatherWarning2 = weatherWarning2
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local weatherWarning2Frame2 = function ( weatherWarning2, event )
					local weatherWarning2Frame3 = function ( weatherWarning2, event )
						if not event.interrupted then
							weatherWarning2:beginAnimation( "keyframe", 759, false, false, CoD.TweenType.Linear )
						end
						weatherWarning2:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( weatherWarning2, event )
						else
							weatherWarning2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weatherWarning2Frame3( weatherWarning2, event )
						return 
					else
						weatherWarning2:beginAnimation( "keyframe", 740, false, false, CoD.TweenType.Linear )
						weatherWarning2:setAlpha( 0 )
						weatherWarning2:registerEventHandler( "transition_complete_keyframe", weatherWarning2Frame3 )
					end
				end
				
				weatherWarning2:completeAnimation()
				self.weatherWarning2:setAlpha( 1 )
				weatherWarning2Frame2( weatherWarning2, {} )
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
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "WeatherWarning.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

