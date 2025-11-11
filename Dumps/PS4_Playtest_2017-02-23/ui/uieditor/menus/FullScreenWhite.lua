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
					CoD.Menu.RemoveFromCurrMenuNameList( self.menuName )
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

LUI.createMenu.FullScreenWhite = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "FullScreenWhite" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "none"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "FullScreenWhite.buttonPrompts" )
	local menu = self
	
	local Fullscreen = LUI.UIImage.new()
	Fullscreen:setLeftRight( 0, 0, 0, 1920 )
	Fullscreen:setTopBottom( 0, 0, 0, 1080 )
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
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "FullScreenWhite.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

