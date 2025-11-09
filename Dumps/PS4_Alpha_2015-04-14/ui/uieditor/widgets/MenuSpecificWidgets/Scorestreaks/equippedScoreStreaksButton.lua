require( "ui.uieditor.widgets.onOffImage" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )

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
	self:setLeftRight( true, false, 0, 96 )
	self:setTopBottom( true, false, 0, 96 )
	self.anyChildUsesUpdateState = true
	
	local backing = LUI.UIImage.new()
	backing:setLeftRight( true, true, 0, 0 )
	backing:setTopBottom( true, true, 0, 0 )
	backing:setRGB( 1, 1, 1 )
	backing:setAlpha( 0 )
	backing:setZRot( 180 )
	backing:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( backing )
	self.backing = backing
	
	local image = LUI.UIImage.new()
	image:setLeftRight( true, true, 0, 0 )
	image:setTopBottom( true, true, 0, 0 )
	image:setRGB( 1, 1, 1 )
	image:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	image:linkToElementModel( self, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			image:setImage( RegisterImage( AppendString( GetItemImageFromIndex( modelValue ), "_menu" ) ) )
		end
	end )
	self:addElement( image )
	self.image = image
	
	local arrow = CoD.onOffImage.new( menu, controller )
	arrow:setLeftRight( true, false, -29, -15 )
	arrow:setTopBottom( false, false, -7, 7 )
	arrow:setRGB( 1, 1, 1 )
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
	cacButtonBoxLrgInactive0:setRGB( 1, 1, 1 )
	cacButtonBoxLrgInactive0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( cacButtonBoxLrgInactive0 )
	self.cacButtonBoxLrgInactive0 = cacButtonBoxLrgInactive0
	
	local titleBacking = LUI.UIImage.new()
	titleBacking:setLeftRight( true, true, 2, -2 )
	titleBacking:setTopBottom( false, true, -18, -2 )
	titleBacking:setRGB( 0, 0, 0 )
	titleBacking:setAlpha( 0.5 )
	titleBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( titleBacking )
	self.titleBacking = titleBacking
	
	local score = LUI.UITightText.new()
	score:setLeftRight( true, false, 5, 115 )
	score:setTopBottom( false, true, -18, -2 )
	score:setRGB( 1, 1, 1 )
	score:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	score:linkToElementModel( self, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			score:setText( Engine.Localize( GetScorestreakMomentumFromIndex( modelValue ) ) )
		end
	end )
	self:addElement( score )
	self.score = score
	
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
	self.close = function ( self )
		self.arrow:close()
		self.cacButtonBoxLrgInactive0:close()
		self.image:close()
		self.score:close()
		CoD.equippedScoreStreaksButton.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

