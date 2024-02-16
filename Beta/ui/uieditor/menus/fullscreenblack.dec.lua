local PostLoadFunc = function ( self )
	local fadeOverTimeModel = self:getModel( Engine.GetPrimaryController(), "fadeOverTime" )
	if fadeOverTimeModel then
		self:subscribeToModel( fadeOverTimeModel, function ( model )
			local modelValue = Engine.GetModelValue( model )
			local startAlphaModel = self:getModel( Engine.GetPrimaryController(), "startAlpha" )
			local endAlphaModel = self:getModel( Engine.GetPrimaryController(), "endAlpha" )
			local startAlpha = 0
			local endAlpha = 0
			if startAlphaModel then
				startAlpha = Engine.GetModelValue( startAlphaModel )
			end
			if endAlphaModel then
				endAlpha = Engine.GetModelValue( endAlphaModel )
			end
			if modelValue then
				if endAlpha == 0 then
					if startAlpha == 0 or modelValue == 0 then
						CoD.Menu.RemoveFromCurrMenuNameList( self.menuName )
					else
						self.Fullscreen:registerEventHandler( "clip_over", function ( self, event )
							self.Fullscreen:registerEventHandler( "clip_over", CoD.NullFunction )
							CoD.Menu.RemoveFromCurrMenuNameList( self.menuName )
						end )
					end
				else
					CoD.Menu.AddToCurrMenuNameList( self.menuName )
				end
				if startAlpha >= 0 then
					self.Fullscreen:setAlpha( startAlpha )
				end
				self.Fullscreen:beginAnimation( "fadeOverTime", modelValue )
				self.Fullscreen:setAlpha( endAlpha )
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
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "FullScreenBlack.buttonPrompts" )
	local menu = self
	
	local Fullscreen = LUI.UIImage.new()
	Fullscreen:setLeftRight( true, false, 0, 1280 )
	Fullscreen:setTopBottom( true, false, 0, 720 )
	Fullscreen:setImage( RegisterImage( "uie_default_black_0" ) )
	self:addElement( Fullscreen )
	self.Fullscreen = Fullscreen
	
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = menu
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "FullScreenBlack.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

