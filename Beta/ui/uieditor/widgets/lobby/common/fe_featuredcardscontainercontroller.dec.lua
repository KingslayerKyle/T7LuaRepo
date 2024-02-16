require( "ui.uieditor.widgets.Lobby.Common.FE_FeaturedCardsContainerControllerIndicator" )

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
	
	local RightBumperImage = LUI.UIImage.new()
	RightBumperImage:setLeftRight( true, false, 85.85, 131 )
	RightBumperImage:setTopBottom( true, false, 3, 33 )
	RightBumperImage:setScale( 0.6 )
	RightBumperImage:subscribeToGlobalModel( controller, "Controller", "right_shoulder_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RightBumperImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( RightBumperImage )
	self.RightBumperImage = RightBumperImage
	
	local IndicatorsGrid = LUI.GridLayout.new( menu, controller, false, 0, 0, 2, 0, nil, nil, false, false, 0, 0, false, true )
	IndicatorsGrid:setLeftRight( false, false, -177.65, 20.35 )
	IndicatorsGrid:setTopBottom( true, false, 13, 21 )
	IndicatorsGrid:setDataSource( "FeaturedCards" )
	IndicatorsGrid:setWidgetType( CoD.FE_FeaturedCardsContainerControllerIndicator )
	IndicatorsGrid:setHorizontalCount( 20 )
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
	
	local LeftBumperImage = LUI.UIImage.new()
	LeftBumperImage:setLeftRight( true, false, -157.3, -112.15 )
	LeftBumperImage:setTopBottom( true, false, 3, 33 )
	LeftBumperImage:setScale( 0.6 )
	LeftBumperImage:subscribeToGlobalModel( controller, "Controller", "left_shoulder_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LeftBumperImage:setImage( RegisterImage( modelValue ) )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.IndicatorsGrid:close()
		self.RightBumperImage:close()
		self.LeftBumperImage:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

