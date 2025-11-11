require( "ui.uieditor.widgets.BumperButtonWithKeyMouse" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FeaturedCardsContainerControllerIndicator" )

local MouseKeyboardHookUp = function ( self, controller, menu )
	if not CoD.isPC then
		return 
	else
		self:setForceMouseEventDispatch( true )
	end
end

local PostLoadFunc = function ( self, controller, menu )
	MouseKeyboardHookUp( self, controller, menu )
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
	self:setLeftRight( 0, 0, 0, 196 )
	self:setTopBottom( 0, 0, 0, 52 )
	self.anyChildUsesUpdateState = true
	
	local RightBumperImage = CoD.BumperButtonWithKeyMouse.new( menu, controller )
	RightBumperImage:setLeftRight( 1, 1, -69, 0 )
	RightBumperImage:setTopBottom( 0.5, 0.5, -21.5, 23.5 )
	RightBumperImage.KeyMouseImage:setImage( RegisterImage( "uie_bumperright" ) )
	RightBumperImage:subscribeToGlobalModel( controller, "Controller", "right_shoulder_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RightBumperImage.ControllerImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( RightBumperImage )
	self.RightBumperImage = RightBumperImage
	
	local IndicatorsGrid = LUI.GridLayout.new( menu, controller, false, 0, 0, 2, 0, nil, nil, false, false, 0, 0, false, false )
	IndicatorsGrid:setLeftRight( 1, 1, -357, -79 )
	IndicatorsGrid:setTopBottom( 0.5, 0.5, -5, 7 )
	IndicatorsGrid:setWidgetType( CoD.FE_FeaturedCardsContainerControllerIndicator )
	IndicatorsGrid:setHorizontalCount( 20 )
	IndicatorsGrid:setDataSource( "FeaturedCardTicks" )
	IndicatorsGrid:subscribeToGlobalModel( controller, "FeaturedCardsRoot", "Update", function ( model )
		local element = IndicatorsGrid
		UpdateDataSource( self, element, controller )
	end )
	IndicatorsGrid:subscribeToGlobalModel( controller, "MarketingRoot", "Updated", function ( model )
		local element = IndicatorsGrid
		UpdateDataSource( self, element, controller )
	end )
	self:addElement( IndicatorsGrid )
	self.IndicatorsGrid = IndicatorsGrid
	
	local LeftBumperImage = CoD.BumperButtonWithKeyMouse.new( menu, controller )
	LeftBumperImage:setLeftRight( 1, 1, -434, -366 )
	LeftBumperImage:setTopBottom( 0.5, 0.5, -21.5, 23.5 )
	LeftBumperImage:subscribeToGlobalModel( controller, "Controller", "left_shoulder_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LeftBumperImage.ControllerImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( LeftBumperImage )
	self.LeftBumperImage = LeftBumperImage
	
	self.resetProperties = function ()
		IndicatorsGrid:completeAnimation()
		LeftBumperImage:completeAnimation()
		RightBumperImage:completeAnimation()
		IndicatorsGrid:setAlpha( 1 )
		LeftBumperImage:setAlpha( 1 )
		RightBumperImage:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
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
				self.resetProperties()
				self:setupElementClipCounter( 0 )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.RightBumperImage:close()
		self.IndicatorsGrid:close()
		self.LeftBumperImage:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

