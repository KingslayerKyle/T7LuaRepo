require( "ui.uieditor.widgets.Border" )
require( "ui.uieditor.widgets.Heroes.heroCarouselLoadoutItemImage" )

CoD.heroCarouselLoadoutItem = InheritFrom( LUI.UIElement )
CoD.heroCarouselLoadoutItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.heroCarouselLoadoutItem )
	self.id = "heroCarouselLoadoutItem"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 110 )
	self:setTopBottom( true, false, 0, 110 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local border = CoD.Border.new( menu, controller )
	border:setLeftRight( true, true, 0, 0 )
	border:setTopBottom( true, true, 0, 0 )
	border:setRGB( 1, 1, 1 )
	self:addElement( border )
	self.border = border
	
	local emphasisBorder = CoD.Border.new( menu, controller )
	emphasisBorder:setLeftRight( true, true, 2, -2 )
	emphasisBorder:setTopBottom( true, true, 2, -2 )
	emphasisBorder:setRGB( 1, 1, 1 )
	emphasisBorder:setAlpha( 0 )
	self:addElement( emphasisBorder )
	self.emphasisBorder = emphasisBorder
	
	local loadoutName = LUI.UIText.new()
	loadoutName:setLeftRight( true, true, 0, 0 )
	loadoutName:setTopBottom( true, false, 87, 107 )
	loadoutName:setRGB( 1, 1, 1 )
	loadoutName:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	loadoutName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	loadoutName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	loadoutName:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			loadoutName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( loadoutName )
	self.loadoutName = loadoutName
	
	local heroCarouselLoadoutItemImage0 = CoD.heroCarouselLoadoutItemImage.new( menu, controller )
	heroCarouselLoadoutItemImage0:setLeftRight( false, false, -40, 40 )
	heroCarouselLoadoutItemImage0:setTopBottom( true, false, 5, 85 )
	heroCarouselLoadoutItemImage0:setRGB( 1, 1, 1 )
	heroCarouselLoadoutItemImage0:linkToElementModel( self, nil, false, function ( model )
		heroCarouselLoadoutItemImage0:setModel( model, controller )
	end )
	heroCarouselLoadoutItemImage0:mergeStateConditions( {
		{
			stateName = "UsingWeapon",
			condition = function ( menu, element, event )
				return HeroUsingWeapon( self, controller )
			end
		}
	} )
	heroCarouselLoadoutItemImage0:linkToElementModel( heroCarouselLoadoutItemImage0, nil, true, function ( model )
		menu:updateElementState( heroCarouselLoadoutItemImage0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		} )
	end )
	self:addElement( heroCarouselLoadoutItemImage0 )
	self.heroCarouselLoadoutItemImage0 = heroCarouselLoadoutItemImage0
	
	local lock = LUI.UIImage.new()
	lock:setLeftRight( false, false, -32, 32 )
	lock:setTopBottom( false, false, -42, 22 )
	lock:setRGB( 1, 1, 1 )
	lock:setAlpha( 0 )
	lock:setImage( RegisterImage( "uie_t7_hud_cac_lock_64" ) )
	lock:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( lock )
	self.lock = lock
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				border:completeAnimation()
				self.border:setRGB( 1, 1, 1 )
				self.clipFinished( border, {} )
				emphasisBorder:completeAnimation()
				self.emphasisBorder:setRGB( 1, 1, 1 )
				self.emphasisBorder:setAlpha( 0 )
				self.clipFinished( emphasisBorder, {} )
				heroCarouselLoadoutItemImage0:completeAnimation()
				self.heroCarouselLoadoutItemImage0:setAlpha( 1 )
				self.clipFinished( heroCarouselLoadoutItemImage0, {} )
				lock:completeAnimation()
				self.lock:setAlpha( 0 )
				self.clipFinished( lock, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 4 )
				border:completeAnimation()
				self.border:setRGB( 1, 0.41, 0 )
				self.clipFinished( border, {} )
				emphasisBorder:completeAnimation()
				self.emphasisBorder:setRGB( 1, 0.41, 0 )
				self.emphasisBorder:setAlpha( 1 )
				self.clipFinished( emphasisBorder, {} )
				heroCarouselLoadoutItemImage0:completeAnimation()
				self.heroCarouselLoadoutItemImage0:setAlpha( 1 )
				self.clipFinished( heroCarouselLoadoutItemImage0, {} )
				lock:completeAnimation()
				self.lock:setAlpha( 0 )
				self.clipFinished( lock, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				border:completeAnimation()
				self.border:setRGB( 0.25, 0.25, 0.25 )
				self.clipFinished( border, {} )
				emphasisBorder:completeAnimation()
				self.emphasisBorder:setAlpha( 0 )
				self.clipFinished( emphasisBorder, {} )
				heroCarouselLoadoutItemImage0:completeAnimation()
				self.heroCarouselLoadoutItemImage0:setAlpha( 0 )
				self.clipFinished( heroCarouselLoadoutItemImage0, {} )
				lock:completeAnimation()
				self.lock:setAlpha( 1 )
				self.clipFinished( lock, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 4 )
				border:completeAnimation()
				self.border:setRGB( 0.8, 0.8, 0.8 )
				self.clipFinished( border, {} )
				emphasisBorder:completeAnimation()
				self.emphasisBorder:setRGB( 0.8, 0.8, 0.8 )
				self.emphasisBorder:setAlpha( 1 )
				self.clipFinished( emphasisBorder, {} )
				heroCarouselLoadoutItemImage0:completeAnimation()
				self.heroCarouselLoadoutItemImage0:setAlpha( 0 )
				self.clipFinished( heroCarouselLoadoutItemImage0, {} )
				lock:completeAnimation()
				self.lock:setAlpha( 1 )
				self.clipFinished( lock, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsDisabled( element, controller )
			end
		}
	} )
	self:linkToElementModel( self, "disabled", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		} )
	end )
	self.close = function ( self )
		self.border:close()
		self.emphasisBorder:close()
		self.heroCarouselLoadoutItemImage0:close()
		self.loadoutName:close()
		CoD.heroCarouselLoadoutItem.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

