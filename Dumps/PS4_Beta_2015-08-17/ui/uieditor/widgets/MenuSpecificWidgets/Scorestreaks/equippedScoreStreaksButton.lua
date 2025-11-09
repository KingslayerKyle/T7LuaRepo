require( "ui.uieditor.widgets.onOffImage" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CAC.RestrictedItemWarning" )

CoD.equippedScoreStreaksButton = InheritFrom( LUI.UIElement )
CoD.equippedScoreStreaksButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.equippedScoreStreaksButton )
	self.id = "equippedScoreStreaksButton"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 105 )
	self:setTopBottom( true, false, 0, 96 )
	self.anyChildUsesUpdateState = true
	
	local backing = LUI.UIImage.new()
	backing:setLeftRight( true, true, 0, 0 )
	backing:setTopBottom( true, true, 0, 0 )
	backing:setAlpha( 0 )
	backing:setZRot( 180 )
	self:addElement( backing )
	self.backing = backing
	
	local image = LUI.UIImage.new()
	image:setLeftRight( true, true, 4.5, -4.5 )
	image:setTopBottom( true, true, -5, -5 )
	image:linkToElementModel( self, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			image:setImage( RegisterImage( AppendString( "_menu", GetItemImageFromIndex( modelValue ) ) ) )
		end
	end )
	self:addElement( image )
	self.image = image
	
	local arrow = CoD.onOffImage.new( menu, controller )
	arrow:setLeftRight( true, false, -50, -19 )
	arrow:setTopBottom( false, false, -15.5, 15.5 )
	arrow:setZRot( 90 )
	arrow.image:setImage( RegisterImage( "uie_t7_hud_minimap_arrow" ) )
	arrow:mergeStateConditions( {
		{
			stateName = "On",
			condition = function ( menu, element, event )
				return IsValidScorestreakIndex( self, controller ) and not IsFirstItem( self )
			end
		}
	} )
	arrow:linkToElementModel( arrow, "itemIndex", true, function ( model )
		menu:updateElementState( arrow, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( arrow )
	self.arrow = arrow
	
	local cacButtonBoxLrgInactive0 = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	cacButtonBoxLrgInactive0:setLeftRight( true, true, -2, 2 )
	cacButtonBoxLrgInactive0:setTopBottom( true, true, -2, 1 )
	cacButtonBoxLrgInactive0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( cacButtonBoxLrgInactive0 )
	self.cacButtonBoxLrgInactive0 = cacButtonBoxLrgInactive0
	
	local titleBacking = LUI.UIImage.new()
	titleBacking:setLeftRight( true, true, 3, -2.5 )
	titleBacking:setTopBottom( false, true, -20, -4 )
	titleBacking:setRGB( 0, 0, 0 )
	titleBacking:setAlpha( 0.5 )
	self:addElement( titleBacking )
	self.titleBacking = titleBacking
	
	local score = LUI.UITightText.new()
	score:setLeftRight( true, false, 6, 61 )
	score:setTopBottom( false, true, -21, -2 )
	score:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	score:linkToElementModel( self, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			score:setText( Engine.Localize( GetScorestreakMomentumFromIndex( modelValue ) ) )
		end
	end )
	self:addElement( score )
	self.score = score
	
	local RestrictedItemWarning = CoD.RestrictedItemWarning.new( menu, controller )
	RestrictedItemWarning:setLeftRight( true, false, 0, 102.5 )
	RestrictedItemWarning:setTopBottom( true, false, 3.24, 91.76 )
	RestrictedItemWarning:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return ItemIsBanned( menu, element, controller )
			end
		}
	} )
	RestrictedItemWarning:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" ), function ( model )
		menu:updateElementState( RestrictedItemWarning, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.Update"
		} )
	end )
	self:addElement( RestrictedItemWarning )
	self.RestrictedItemWarning = RestrictedItemWarning
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				backing:completeAnimation()
				self.backing:setAlpha( 0 )
				self.clipFinished( backing, {} )
				image:completeAnimation()
				self.image:setLeftRight( true, true, 0, 0 )
				self.image:setTopBottom( true, true, 0, 0 )
				self.image:setAlpha( 1 )
				self.clipFinished( image, {} )
				cacButtonBoxLrgInactive0:completeAnimation()
				self.cacButtonBoxLrgInactive0:setAlpha( 1 )
				self.cacButtonBoxLrgInactive0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
				self.clipFinished( cacButtonBoxLrgInactive0, {} )
				score:completeAnimation()
				self.score:setAlpha( 1 )
				self.clipFinished( score, {} )
			end
		},
		Unequipped = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				image:completeAnimation()
				self.image:setAlpha( 0 )
				self.clipFinished( image, {} )
				score:completeAnimation()
				self.score:setAlpha( 0 )
				self.clipFinished( score, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Unequipped",
			condition = function ( menu, element, event )
				return not IsValidScorestreakIndex( self, controller )
			end
		}
	} )
	self:linkToElementModel( self, "itemIndex", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.arrow:close()
		self.cacButtonBoxLrgInactive0:close()
		self.RestrictedItemWarning:close()
		self.image:close()
		self.score:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

