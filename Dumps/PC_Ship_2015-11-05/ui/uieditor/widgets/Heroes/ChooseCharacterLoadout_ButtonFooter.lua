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
	self:setLeftRight( true, false, 0, 213 )
	self:setTopBottom( true, false, 0, 33 )
	self.anyChildUsesUpdateState = true
	
	local ChooseCharacterLoadoutButtonFooterBackOfCard0 = CoD.ChooseCharacterLoadout_ButtonFooter_BackOfCard.new( menu, controller )
	ChooseCharacterLoadoutButtonFooterBackOfCard0:setLeftRight( true, false, 142, 213 )
	ChooseCharacterLoadoutButtonFooterBackOfCard0:setTopBottom( true, false, 4, 41 )
	self:addElement( ChooseCharacterLoadoutButtonFooterBackOfCard0 )
	self.ChooseCharacterLoadoutButtonFooterBackOfCard0 = ChooseCharacterLoadoutButtonFooterBackOfCard0
	
	local ChooseCharacterLoadoutButtonFooterPersonalize0 = CoD.ChooseCharacterLoadout_ButtonFooter_Personalize.new( menu, controller )
	ChooseCharacterLoadoutButtonFooterPersonalize0:setLeftRight( true, false, 45, 111 )
	ChooseCharacterLoadoutButtonFooterPersonalize0:setTopBottom( true, false, 4, 41 )
	ChooseCharacterLoadoutButtonFooterPersonalize0:linkToElementModel( self, nil, false, function ( model )
		ChooseCharacterLoadoutButtonFooterPersonalize0:setModel( model, controller )
	end )
	self:addElement( ChooseCharacterLoadoutButtonFooterPersonalize0 )
	self.ChooseCharacterLoadoutButtonFooterPersonalize0 = ChooseCharacterLoadoutButtonFooterPersonalize0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				ChooseCharacterLoadoutButtonFooterBackOfCard0:completeAnimation()
				self.ChooseCharacterLoadoutButtonFooterBackOfCard0:setAlpha( 1 )
				self.clipFinished( ChooseCharacterLoadoutButtonFooterBackOfCard0, {} )
				ChooseCharacterLoadoutButtonFooterPersonalize0:completeAnimation()
				self.ChooseCharacterLoadoutButtonFooterPersonalize0:setAlpha( 1 )
				self.clipFinished( ChooseCharacterLoadoutButtonFooterPersonalize0, {} )
			end
		},
		FirstTimeFlow = {
			DefaultClip = function ()
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ChooseCharacterLoadoutButtonFooterBackOfCard0:close()
		element.ChooseCharacterLoadoutButtonFooterPersonalize0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

