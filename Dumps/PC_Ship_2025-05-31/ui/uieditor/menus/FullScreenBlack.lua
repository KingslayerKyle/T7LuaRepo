require( "ui.uieditor.widgets.HUD.InGameTalkersWidget" )

local f0_local0 = function ( f1_arg0 )
	if f1_arg0.red and f1_arg0.green and f1_arg0.blue then
		f1_arg0.Fullscreen:setRGB( f1_arg0.red, f1_arg0.green, f1_arg0.blue )
	end
end

local PostLoadFunc = function ( f2_arg0 )
	local f2_local0 = f2_arg0:getModel( Engine.GetPrimaryController(), "fadeOverTime" )
	local f2_local1 = f2_arg0:getModel( Engine.GetPrimaryController(), "red" )
	local f2_local2 = f2_arg0:getModel( Engine.GetPrimaryController(), "green" )
	local f2_local3 = f2_arg0:getModel( Engine.GetPrimaryController(), "blue" )
	if f2_local1 then
		f2_arg0:subscribeToModel( f2_local1, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				f2_arg0.red = modelValue
				f0_local0( f2_arg0 )
			end
		end )
	end
	if f2_local2 then
		f2_arg0:subscribeToModel( f2_local2, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				f2_arg0.green = modelValue
				f0_local0( f2_arg0 )
			end
		end )
	end
	if f2_local3 then
		f2_arg0:subscribeToModel( f2_local3, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				f2_arg0.blue = modelValue
				f0_local0( f2_arg0 )
			end
		end )
	end
	if f2_local0 then
		f2_arg0:subscribeToModel( f2_local0, function ( model )
			local modelValue = Engine.GetModelValue( model )
			local f6_local1 = f2_arg0:getModel( Engine.GetPrimaryController(), "startAlpha" )
			local f6_local2 = f2_arg0:getModel( Engine.GetPrimaryController(), "endAlpha" )
			local f6_local3 = 0
			local f6_local4 = 0
			if f6_local1 then
				f6_local3 = Engine.GetModelValue( f6_local1 )
			end
			if f6_local2 then
				f6_local4 = Engine.GetModelValue( f6_local2 )
			end
			if modelValue then
				if f6_local4 == 0 then
					if f6_local3 == 0 or modelValue == 0 then
						CoD.Menu.RemoveFromCurrMenuNameList( f2_arg0.menuName )
					else
						f2_arg0.Fullscreen:registerEventHandler( "clip_over", function ( element, event )
							element.Fullscreen:registerEventHandler( "clip_over", CoD.NullFunction )
							CoD.Menu.RemoveFromCurrMenuNameList( element.menuName )
						end )
					end
				else
					CoD.Menu.AddToCurrMenuNameList( f2_arg0.menuName )
				end
				if f6_local3 >= 0 then
					f2_arg0.Fullscreen:setAlpha( f6_local3 )
				end
				f2_arg0.Fullscreen:beginAnimation( "fadeOverTime", modelValue )
				f2_arg0.Fullscreen:setAlpha( f6_local4 )
			end
		end )
	end
	if not f2_local1 and not f2_local2 and not f2_local3 and not f2_local0 then
		f2_arg0.red = 0
		f2_arg0.green = 0
		f2_arg0.blue = 0
		f0_local0( f2_arg0 )
		f2_arg0.failSafeCloseTimer = LUI.UITimer.newElementTimer( 2000, true, function ( f8_arg0 )
			f2_arg0:close()
		end )
		f2_arg0:addElement( f2_arg0.failSafeCloseTimer )
		LUI.OverrideFunction_CallOriginalSecond( f2_arg0, "close", function ( element )
			if element.failSafeCloseTimer then
				element.failSafeCloseTimer:close()
			end
		end )
	end
end

LUI.createMenu.FullScreenBlack = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "FullScreenBlack" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "none"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "FullScreenBlack.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Fullscreen = LUI.UIImage.new()
	Fullscreen:setLeftRight( true, true, 0, 0 )
	Fullscreen:setTopBottom( true, true, 0, 0 )
	self:addElement( Fullscreen )
	self.Fullscreen = Fullscreen
	
	local InGameTalkersWidget = CoD.InGameTalkersWidget.new( self, controller )
	InGameTalkersWidget:setLeftRight( true, false, 64, 254 )
	InGameTalkersWidget:setTopBottom( true, false, 36, 123 )
	InGameTalkersWidget:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return not IsMultiplayer()
			end
		}
	} )
	InGameTalkersWidget:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		self:updateElementState( InGameTalkersWidget, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	self:addElement( InGameTalkersWidget )
	self.InGameTalkersWidget = InGameTalkersWidget
	
	self.Fullscreen:linkToElementModel( self, "color", true, function ( model )
		local color = Engine.GetModelValue( model )
		if color then
			Fullscreen:setRGB( color )
		end
	end )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.InGameTalkersWidget:close()
		element.Fullscreen:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "FullScreenBlack.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

