require( "ui.uieditor.widgets.BumperButtonWithKeyMouse" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FeaturedCardsContainerControllerIndicator" )

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	if not CoD.isPC then
		return 
	else
		f1_arg0:setForceMouseEventDispatch( true )
	end
end

local PostLoadFunc = function ( self, controller, menu )
	f0_local0( self, controller, menu )
end

local PreLoadFunc = function ( self, controller )
	Engine.CreateModel( Engine.GetGlobalModel(), "liveEventViewer.stream" )
end

CoD.FE_FeaturedCardsContainerController = InheritFrom( LUI.UIElement )
CoD.FE_FeaturedCardsContainerController.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 0
	} )
	self:setAlignment( LUI.Alignment.Right )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_FeaturedCardsContainerController )
	self.id = "FE_FeaturedCardsContainerController"
	self.soundSet = "MultiplayerMain"
	self:setLeftRight( true, false, 0, 131 )
	self:setTopBottom( true, false, 0, 35 )
	self.anyChildUsesUpdateState = true
	
	local RightBumperImage = CoD.BumperButtonWithKeyMouse.new( menu, controller )
	RightBumperImage:setLeftRight( false, true, -46, 0 )
	RightBumperImage:setTopBottom( false, false, -14.5, 15.5 )
	RightBumperImage.KeyMouseImage:setImage( RegisterImage( "uie_bumperright" ) )
	RightBumperImage:subscribeToGlobalModel( controller, "Controller", "right_shoulder_button_image", function ( model )
		local rightShoulderButtonImage = Engine.GetModelValue( model )
		if rightShoulderButtonImage then
			RightBumperImage.ControllerImage:setImage( RegisterImage( rightShoulderButtonImage ) )
		end
	end )
	self:addElement( RightBumperImage )
	self.RightBumperImage = RightBumperImage
	
	local IndicatorsGrid = LUI.GridLayout.new( menu, controller, false, 0, 0, 2, 0, nil, nil, false, false, 0, 0, false, true )
	IndicatorsGrid:setLeftRight( false, true, -244, -46 )
	IndicatorsGrid:setTopBottom( false, false, -3.5, 4.5 )
	IndicatorsGrid:setWidgetType( CoD.FE_FeaturedCardsContainerControllerIndicator )
	IndicatorsGrid:setHorizontalCount( 20 )
	IndicatorsGrid:setDataSource( "FeaturedCardTicks" )
	IndicatorsGrid:subscribeToGlobalModel( controller, "FeaturedCardsRoot", "Update", function ( model )
		UpdateDataSource( self, IndicatorsGrid, controller )
	end )
	IndicatorsGrid:subscribeToGlobalModel( controller, "MarketingRoot", "Updated", function ( model )
		UpdateDataSource( self, IndicatorsGrid, controller )
	end )
	IndicatorsGrid:subscribeToGlobalModel( controller, "AutoeventsCycled", "cycled", function ( model )
		UpdateDataSource( self, IndicatorsGrid, controller )
	end )
	self:addElement( IndicatorsGrid )
	self.IndicatorsGrid = IndicatorsGrid
	
	local LeftBumperImage = CoD.BumperButtonWithKeyMouse.new( menu, controller )
	LeftBumperImage:setLeftRight( false, true, -289, -244 )
	LeftBumperImage:setTopBottom( false, false, -14.5, 15.5 )
	LeftBumperImage:subscribeToGlobalModel( controller, "Controller", "left_shoulder_button_image", function ( model )
		local leftShoulderButtonImage = Engine.GetModelValue( model )
		if leftShoulderButtonImage then
			LeftBumperImage.ControllerImage:setImage( RegisterImage( leftShoulderButtonImage ) )
		end
	end )
	self:addElement( LeftBumperImage )
	self.LeftBumperImage = LeftBumperImage
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				RightBumperImage:completeAnimation()
				self.RightBumperImage:setAlpha( 0 )
				self.clipFinished( RightBumperImage, {} )
				IndicatorsGrid:completeAnimation()
				self.IndicatorsGrid:setAlpha( 0 )
				self.clipFinished( IndicatorsGrid, {} )
				LeftBumperImage:completeAnimation()
				self.LeftBumperImage:setAlpha( 0 )
				self.clipFinished( LeftBumperImage, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				RightBumperImage:completeAnimation()
				self.RightBumperImage:setAlpha( 1 )
				self.clipFinished( RightBumperImage, {} )
				IndicatorsGrid:completeAnimation()
				self.IndicatorsGrid:setAlpha( 1 )
				self.clipFinished( IndicatorsGrid, {} )
				LeftBumperImage:completeAnimation()
				self.LeftBumperImage:setAlpha( 1 )
				self.clipFinished( LeftBumperImage, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return FeaturedWidgetControllerVisible( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "liveEventViewer.stream" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "liveEventViewer.stream"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "autoevents.cycled" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "autoevents.cycled"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.RightBumperImage:close()
		element.IndicatorsGrid:close()
		element.LeftBumperImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

