require( "ui.uieditor.widgets.HUD.InGameTalkersWidget" )

local UpdateColor = function ( self )
	if self.red and self.green and self.blue then
		self.Fullscreen:setRGB( self.red, self.green, self.blue )
	end
end

local PostLoadFunc = function ( self )
	local fadeOverTimeModel = self:getModel( Engine.GetPrimaryController(), "fadeOverTime" )
	local redModel = self:getModel( Engine.GetPrimaryController(), "red" )
	local greenModel = self:getModel( Engine.GetPrimaryController(), "green" )
	local blueModel = self:getModel( Engine.GetPrimaryController(), "blue" )
	if redModel then
		self:subscribeToModel( redModel, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				self.red = modelValue
				UpdateColor( self )
			end
		end )
	end
	if greenModel then
		self:subscribeToModel( greenModel, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				self.green = modelValue
				UpdateColor( self )
			end
		end )
	end
	if blueModel then
		self:subscribeToModel( blueModel, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				self.blue = modelValue
				UpdateColor( self )
			end
		end )
	end
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
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "FullScreenBlack.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Fullscreen = LUI.UIImage.new()
	Fullscreen:setLeftRight( 0, 1, 0, 0 )
	Fullscreen:setTopBottom( 0, 1, 0, 0 )
	self:addElement( Fullscreen )
	self.Fullscreen = Fullscreen
	
	local InGameTalkersWidget = CoD.InGameTalkersWidget.new( self, controller )
	InGameTalkersWidget:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return not IsMultiplayer()
			end
		}
	} )
	InGameTalkersWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), function ( model )
		self:updateElementState( InGameTalkersWidget, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE
		} )
	end )
	InGameTalkersWidget:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		self:updateElementState( InGameTalkersWidget, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	InGameTalkersWidget:setLeftRight( 0, 0, 95.5, 380.5 )
	InGameTalkersWidget:setTopBottom( 0, 0, 54, 184 )
	self:addElement( InGameTalkersWidget )
	self.InGameTalkersWidget = InGameTalkersWidget
	
	self.Fullscreen:linkToElementModel( self, "color", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Fullscreen:setRGB( modelValue )
		end
	end )
	InGameTalkersWidget.id = "InGameTalkersWidget"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.InGameTalkersWidget:close()
		self.Fullscreen:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "FullScreenBlack.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

