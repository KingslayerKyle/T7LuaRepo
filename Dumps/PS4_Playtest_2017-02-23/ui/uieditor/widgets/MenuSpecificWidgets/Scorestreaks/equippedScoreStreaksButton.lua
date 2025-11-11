require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CAC.RestrictedItemWarning" )
require( "ui.uieditor.widgets.onOffImage" )

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
	self:setLeftRight( 0, 0, 0, 157 )
	self:setTopBottom( 0, 0, 0, 144 )
	self.anyChildUsesUpdateState = true
	
	local backing = LUI.UIImage.new()
	backing:setLeftRight( 0, 1, 0, 0 )
	backing:setTopBottom( 0, 1, 0, 0 )
	backing:setAlpha( 0 )
	backing:setZRot( 180 )
	self:addElement( backing )
	self.backing = backing
	
	local image = LUI.UIImage.new()
	image:setLeftRight( 0, 1, 7, -7 )
	image:setTopBottom( 0, 1, -8, -8 )
	image:linkToElementModel( self, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			image:setImage( RegisterImage( AppendString( "_menu", GetItemImageFromIndex( modelValue ) ) ) )
		end
	end )
	self:addElement( image )
	self.image = image
	
	local arrow = CoD.onOffImage.new( menu, controller )
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
	arrow:setLeftRight( 0, 0, -75, -29 )
	arrow:setTopBottom( 0.5, 0.5, -23, 23 )
	arrow:setZRot( 90 )
	arrow.image:setImage( RegisterImage( "uie_t7_hud_minimap_arrow" ) )
	self:addElement( arrow )
	self.arrow = arrow
	
	local cacButtonBoxLrgInactive0 = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	cacButtonBoxLrgInactive0:setLeftRight( 0, 1, -3, 3 )
	cacButtonBoxLrgInactive0:setTopBottom( 0, 1, -3, 1 )
	cacButtonBoxLrgInactive0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( cacButtonBoxLrgInactive0 )
	self.cacButtonBoxLrgInactive0 = cacButtonBoxLrgInactive0
	
	local titleBacking = LUI.UIImage.new()
	titleBacking:setLeftRight( 0, 1, 4, -4 )
	titleBacking:setTopBottom( 1, 1, -30, -6 )
	titleBacking:setRGB( 0, 0, 0 )
	titleBacking:setAlpha( 0.5 )
	self:addElement( titleBacking )
	self.titleBacking = titleBacking
	
	local score = LUI.UITightText.new()
	score:setLeftRight( 0, 0, 9, 91 )
	score:setTopBottom( 1, 1, -31, -3 )
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
	RestrictedItemWarning:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return ItemIsBanned( menu, element, controller )
			end
		}
	} )
	RestrictedItemWarning:linkToElementModel( RestrictedItemWarning, nil, true, function ( model )
		menu:updateElementState( RestrictedItemWarning, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		} )
	end )
	RestrictedItemWarning:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" ), function ( model )
		menu:updateElementState( RestrictedItemWarning, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.Update"
		} )
	end )
	RestrictedItemWarning:setLeftRight( 0, 0, 0, 154 )
	RestrictedItemWarning:setTopBottom( 0, 0, 5, 138 )
	self:addElement( RestrictedItemWarning )
	self.RestrictedItemWarning = RestrictedItemWarning
	
	self.resetProperties = function ()
		score:completeAnimation()
		image:completeAnimation()
		score:setAlpha( 1 )
		image:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Unequipped = {
			DefaultClip = function ()
				self.resetProperties()
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

