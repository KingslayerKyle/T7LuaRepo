require( "ui.uieditor.widgets.Border" )
require( "ui.uieditor.widgets.Heroes.heroCarouselSelectionItemLoadoutInfo" )
require( "ui.uieditor.widgets.BorderThin" )

CoD.heroCarouselSelectionItem = InheritFrom( LUI.UIElement )
CoD.heroCarouselSelectionItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.heroCarouselSelectionItem )
	self.id = "heroCarouselSelectionItem"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 222 )
	self:setTopBottom( true, false, 0, 200 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local buttonBacking = LUI.UIImage.new()
	buttonBacking:setLeftRight( true, false, 0, 222 )
	buttonBacking:setTopBottom( true, false, 0, 35 )
	buttonBacking:setRGB( 1, 1, 1 )
	buttonBacking:setAlpha( 0.2 )
	buttonBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( buttonBacking )
	self.buttonBacking = buttonBacking
	
	local sizeElement = CoD.Border.new( menu, controller )
	sizeElement:setLeftRight( true, false, 0, 222 )
	sizeElement:setTopBottom( true, false, 0, 35 )
	sizeElement:setRGB( 1, 1, 1 )
	sizeElement:setAlpha( 0 )
	self:addElement( sizeElement )
	self.sizeElement = sizeElement
	
	local buttonText = LUI.UIText.new()
	buttonText:setLeftRight( true, false, 5, 216 )
	buttonText:setTopBottom( true, false, 5, 30 )
	buttonText:setRGB( 1, 1, 1 )
	buttonText:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	buttonText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	buttonText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	buttonText:linkToElementModel( self, "displayText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			buttonText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( buttonText )
	self.buttonText = buttonText
	
	local loadoutInfo = CoD.heroCarouselSelectionItemLoadoutInfo.new( menu, controller )
	loadoutInfo:setLeftRight( true, false, 0, 222 )
	loadoutInfo:setTopBottom( true, false, 36, 193 )
	loadoutInfo:setRGB( 1, 1, 1 )
	loadoutInfo:setAlpha( 0 )
	loadoutInfo:linkToElementModel( self, nil, false, function ( model )
		loadoutInfo:setModel( model, controller )
	end )
	loadoutInfo:mergeStateConditions( {
		{
			stateName = "UsingWeapon",
			condition = function ( menu, element, event )
				return HeroUsingWeapon( self, controller )
			end
		}
	} )
	loadoutInfo:linkToElementModel( loadoutInfo, nil, true, function ( model )
		menu:updateElementState( loadoutInfo, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		} )
	end )
	self:addElement( loadoutInfo )
	self.loadoutInfo = loadoutInfo
	
	local BorderThin0 = CoD.BorderThin.new( menu, controller )
	BorderThin0:setLeftRight( true, false, 0, 222 )
	BorderThin0:setTopBottom( true, false, 0, 35 )
	BorderThin0:setRGB( 1, 1, 1 )
	self:addElement( BorderThin0 )
	self.BorderThin0 = BorderThin0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				buttonBacking:completeAnimation()
				self.buttonBacking:setLeftRight( true, false, 0, 222 )
				self.buttonBacking:setTopBottom( true, false, 0, 35 )
				self.buttonBacking:setRGB( 1, 1, 1 )
				self.clipFinished( buttonBacking, {} )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( true, false, 0, 222 )
				self.sizeElement:setTopBottom( true, false, 0, 35 )
				self.sizeElement:setRGB( 1, 1, 1 )
				self.sizeElement:setAlpha( 0 )
				self.clipFinished( sizeElement, {} )
				buttonText:completeAnimation()
				self.buttonText:setRGB( 1, 1, 1 )
				self.clipFinished( buttonText, {} )
				loadoutInfo:completeAnimation()
				self.loadoutInfo:setAlpha( 0 )
				self.clipFinished( loadoutInfo, {} )
				BorderThin0:completeAnimation()
				self.BorderThin0:setLeftRight( true, false, 0, 222 )
				self.BorderThin0:setTopBottom( true, false, 0, 35 )
				self.BorderThin0:setRGB( 1, 1, 1 )
				self.BorderThin0:setAlpha( 1 )
				self.clipFinished( BorderThin0, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 4 )
				buttonBacking:completeAnimation()
				self.buttonBacking:setLeftRight( true, false, 0, 222 )
				self.buttonBacking:setTopBottom( true, false, 0, 35 )
				self.buttonBacking:setRGB( 1, 1, 1 )
				self.clipFinished( buttonBacking, {} )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( true, false, 0, 222 )
				self.sizeElement:setTopBottom( true, false, 0, 35 )
				self.sizeElement:setRGB( 1, 0.41, 0 )
				self.sizeElement:setAlpha( 1 )
				self.clipFinished( sizeElement, {} )
				buttonText:completeAnimation()
				self.buttonText:setRGB( 1, 0.41, 0 )
				self.clipFinished( buttonText, {} )
				BorderThin0:completeAnimation()
				self.BorderThin0:setLeftRight( true, false, 0, 222 )
				self.BorderThin0:setTopBottom( true, false, 0, 35 )
				self.BorderThin0:setRGB( 1, 0.41, 0 )
				self.BorderThin0:setAlpha( 0 )
				self.clipFinished( BorderThin0, {} )
			end
		},
		LoadoutButton = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				buttonBacking:completeAnimation()
				self.buttonBacking:setLeftRight( true, false, 0, 222 )
				self.buttonBacking:setTopBottom( true, false, 0, 200 )
				self.buttonBacking:setRGB( 1, 1, 1 )
				self.clipFinished( buttonBacking, {} )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( true, false, 0, 222 )
				self.sizeElement:setTopBottom( true, false, 0, 200 )
				self.sizeElement:setRGB( 1, 1, 1 )
				self.sizeElement:setAlpha( 0 )
				self.clipFinished( sizeElement, {} )
				buttonText:completeAnimation()
				self.buttonText:setRGB( 1, 1, 1 )
				self.clipFinished( buttonText, {} )
				loadoutInfo:completeAnimation()
				self.loadoutInfo:setAlpha( 1 )
				self.clipFinished( loadoutInfo, {} )
				BorderThin0:completeAnimation()
				self.BorderThin0:setLeftRight( true, false, 0, 222 )
				self.BorderThin0:setTopBottom( true, false, 0, 200 )
				self.BorderThin0:setRGB( 1, 1, 1 )
				self.BorderThin0:setAlpha( 1 )
				self.clipFinished( BorderThin0, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 4 )
				buttonBacking:completeAnimation()
				self.buttonBacking:setLeftRight( true, false, 0, 222 )
				self.buttonBacking:setTopBottom( true, false, 0, 200 )
				self.buttonBacking:setRGB( 1, 1, 1 )
				self.clipFinished( buttonBacking, {} )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( true, false, 0, 222 )
				self.sizeElement:setTopBottom( true, false, 0, 200 )
				self.sizeElement:setRGB( 1, 0.41, 0 )
				self.sizeElement:setAlpha( 1 )
				self.clipFinished( sizeElement, {} )
				buttonText:completeAnimation()
				self.buttonText:setRGB( 1, 0.41, 0 )
				self.clipFinished( buttonText, {} )
				BorderThin0:completeAnimation()
				self.BorderThin0:setLeftRight( true, false, 0, 222 )
				self.BorderThin0:setTopBottom( true, false, 0, 200 )
				self.BorderThin0:setRGB( 1, 1, 1 )
				self.BorderThin0:setAlpha( 0 )
				self.clipFinished( BorderThin0, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				buttonBacking:completeAnimation()
				self.buttonBacking:setLeftRight( true, false, 0, 222 )
				self.buttonBacking:setTopBottom( true, false, 0, 35 )
				self.buttonBacking:setRGB( 1, 1, 1 )
				self.clipFinished( buttonBacking, {} )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( true, false, 0, 222 )
				self.sizeElement:setTopBottom( true, false, 0, 35 )
				self.sizeElement:setRGB( 0.44, 0.44, 0.44 )
				self.sizeElement:setAlpha( 0 )
				self.clipFinished( sizeElement, {} )
				buttonText:completeAnimation()
				self.buttonText:setRGB( 0.44, 0.44, 0.44 )
				self.buttonText:setAlpha( 1 )
				self.clipFinished( buttonText, {} )
				loadoutInfo:completeAnimation()
				self.loadoutInfo:setAlpha( 0 )
				self.clipFinished( loadoutInfo, {} )
				BorderThin0:completeAnimation()
				self.BorderThin0:setLeftRight( true, false, 0, 222 )
				self.BorderThin0:setTopBottom( true, false, 0, 35 )
				self.BorderThin0:setRGB( 0.44, 0.44, 0.44 )
				self.BorderThin0:setAlpha( 1 )
				self.clipFinished( BorderThin0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "LoadoutButton",
			condition = function ( menu, element, event )
				return IsLoadoutSelectionSlot( element ) and not IsDisabled( element, controller )
			end
		},
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
		self.sizeElement:close()
		self.loadoutInfo:close()
		self.BorderThin0:close()
		self.buttonText:close()
		CoD.heroCarouselSelectionItem.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

