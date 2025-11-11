require( "ui.uieditor.widgets.CharacterCustomization.ChooseCharacterLoadout_ButtonFooter_BackOfCard" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseCharacterLoadout_ButtonFooter_Personalize" )

CoD.ChooseCharacterLoadout_ButtonFooter = InheritFrom( LUI.UIElement )
CoD.ChooseCharacterLoadout_ButtonFooter.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 31
	} )
	self:setAlignment( LUI.Alignment.Right )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChooseCharacterLoadout_ButtonFooter )
	self.id = "ChooseCharacterLoadout_ButtonFooter"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 319 )
	self:setTopBottom( 0, 0, 0, 49 )
	self.anyChildUsesUpdateState = true
	
	local ChooseCharacterLoadoutButtonFooterBackOfCard0 = CoD.ChooseCharacterLoadout_ButtonFooter_BackOfCard.new( menu, controller )
	ChooseCharacterLoadoutButtonFooterBackOfCard0:setLeftRight( 0, 0, 213, 319 )
	ChooseCharacterLoadoutButtonFooterBackOfCard0:setTopBottom( 0, 0, 6, 62 )
	ChooseCharacterLoadoutButtonFooterBackOfCard0:linkToElementModel( self, nil, false, function ( model )
		ChooseCharacterLoadoutButtonFooterBackOfCard0:setModel( model, controller )
	end )
	self:addElement( ChooseCharacterLoadoutButtonFooterBackOfCard0 )
	self.ChooseCharacterLoadoutButtonFooterBackOfCard0 = ChooseCharacterLoadoutButtonFooterBackOfCard0
	
	local ChooseCharacterLoadoutButtonFooterPersonalize0 = CoD.ChooseCharacterLoadout_ButtonFooter_Personalize.new( menu, controller )
	ChooseCharacterLoadoutButtonFooterPersonalize0:setLeftRight( 0, 0, 67.5, 166.5 )
	ChooseCharacterLoadoutButtonFooterPersonalize0:setTopBottom( 0, 0, 6, 62 )
	ChooseCharacterLoadoutButtonFooterPersonalize0:linkToElementModel( self, nil, false, function ( model )
		ChooseCharacterLoadoutButtonFooterPersonalize0:setModel( model, controller )
	end )
	self:addElement( ChooseCharacterLoadoutButtonFooterPersonalize0 )
	self.ChooseCharacterLoadoutButtonFooterPersonalize0 = ChooseCharacterLoadoutButtonFooterPersonalize0
	
	self.resetProperties = function ()
		ChooseCharacterLoadoutButtonFooterPersonalize0:completeAnimation()
		ChooseCharacterLoadoutButtonFooterBackOfCard0:completeAnimation()
		ChooseCharacterLoadoutButtonFooterPersonalize0:setAlpha( 1 )
		ChooseCharacterLoadoutButtonFooterBackOfCard0:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		FirstTimeFlow = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				ChooseCharacterLoadoutButtonFooterBackOfCard0:completeAnimation()
				self.ChooseCharacterLoadoutButtonFooterBackOfCard0:setAlpha( 0 )
				self.clipFinished( ChooseCharacterLoadoutButtonFooterBackOfCard0, {} )
				ChooseCharacterLoadoutButtonFooterPersonalize0:completeAnimation()
				self.ChooseCharacterLoadoutButtonFooterPersonalize0:setAlpha( 0 )
				self.clipFinished( ChooseCharacterLoadoutButtonFooterPersonalize0, {} )
			end
		},
		Arena = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				ChooseCharacterLoadoutButtonFooterBackOfCard0:completeAnimation()
				self.ChooseCharacterLoadoutButtonFooterBackOfCard0:setAlpha( 0 )
				self.clipFinished( ChooseCharacterLoadoutButtonFooterBackOfCard0, {} )
				ChooseCharacterLoadoutButtonFooterPersonalize0:completeAnimation()
				self.ChooseCharacterLoadoutButtonFooterPersonalize0:setAlpha( 0 )
				self.clipFinished( ChooseCharacterLoadoutButtonFooterPersonalize0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "FirstTimeFlow",
			condition = function ( menu, element, event )
				return FirstTimeSetup_IsActive( controller )
			end
		},
		{
			stateName = "Arena",
			condition = function ( menu, element, event )
				return CharacterDraftActive()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "firstTimeFlowState" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "firstTimeFlowState"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.state" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.state"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ChooseCharacterLoadoutButtonFooterBackOfCard0:close()
		self.ChooseCharacterLoadoutButtonFooterPersonalize0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

