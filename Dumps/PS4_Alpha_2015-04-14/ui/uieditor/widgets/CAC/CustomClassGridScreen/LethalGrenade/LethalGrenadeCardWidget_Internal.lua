require( "ui.uieditor.widgets.CAC.grenadeNameWidget" )
require( "ui.uieditor.widgets.CAC.gadgetImageWidget" )

CoD.LethalGrenadeCardWidget_Internal = InheritFrom( LUI.UIElement )
CoD.LethalGrenadeCardWidget_Internal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LethalGrenadeCardWidget_Internal )
	self.id = "LethalGrenadeCardWidget_Internal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 263 )
	self:setTopBottom( true, false, 0, 116 )
	self.anyChildUsesUpdateState = true
	
	local bgImage = LUI.UIImage.new()
	bgImage:setLeftRight( true, true, 0, 0 )
	bgImage:setTopBottom( true, true, 25, 0 )
	bgImage:setRGB( 0.34, 0.37, 0.46 )
	bgImage:setAlpha( 0.3 )
	bgImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( bgImage )
	self.bgImage = bgImage
	
	local grenadeNameWidget0 = CoD.grenadeNameWidget.new( menu, controller )
	grenadeNameWidget0:setLeftRight( true, true, 3, -3 )
	grenadeNameWidget0:setTopBottom( true, false, 88, 113 )
	grenadeNameWidget0:setRGB( 1, 1, 1 )
	grenadeNameWidget0:setAlpha( 0 )
	grenadeNameWidget0:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			grenadeNameWidget0.grenadeName:setText( Engine.Localize( modelValue ) )
		end
	end )
	grenadeNameWidget0:mergeStateConditions( {
		{
			stateName = "TimesTwoEquipped",
			condition = function ( menu, element, event )
				return IsCACTakeTwoPrimaryGadgetAttachmentEquipped( menu )
			end
		}
	} )
	if grenadeNameWidget0.m_eventHandlers.update_class then
		local currentEv = grenadeNameWidget0.m_eventHandlers.update_class
		grenadeNameWidget0:registerEventHandler( "update_class", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		grenadeNameWidget0:registerEventHandler( "update_class", LUI.UIElement.updateState )
	end
	self:addElement( grenadeNameWidget0 )
	self.grenadeNameWidget0 = grenadeNameWidget0
	
	local currentEv = CoD.gadgetImageWidget.new( menu, controller )
	currentEv:setLeftRight( false, false, -65, 65 )
	currentEv:setTopBottom( true, false, 29, 91 )
	currentEv:setRGB( 1, 1, 1 )
	currentEv:setAlpha( 0 )
	currentEv:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			currentEv.grenadeImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	currentEv:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			currentEv.takeTwoImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	currentEv:mergeStateConditions( {
		{
			stateName = "TakeTwo",
			condition = function ( menu, element, event )
				return IsCACTakeTwoPrimaryGadgetAttachmentEquipped( menu )
			end
		}
	} )
	if currentEv.m_eventHandlers.update_class then
		local currentEv = currentEv.m_eventHandlers.update_class
		currentEv:registerEventHandler( "update_class", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		currentEv:registerEventHandler( "update_class", LUI.UIElement.updateState )
	end
	self:addElement( currentEv )
	self.gadgetImageWidget0 = currentEv
	
	local currentEv = LUI.UIImage.new()
	currentEv:setLeftRight( true, false, 115.5, 147.5 )
	currentEv:setTopBottom( true, false, 55, 87 )
	currentEv:setRGB( 0.4, 0.44, 0.52 )
	currentEv:setAlpha( 0 )
	currentEv:setImage( RegisterImage( "uie_kd_chart_plus" ) )
	currentEv:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( currentEv )
	self.plus = currentEv
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				bgImage:completeAnimation()
				self.bgImage:setRGB( 0.34, 0.37, 0.46 )
				self.bgImage:setAlpha( 0.3 )
				self.clipFinished( bgImage, {} )
				grenadeNameWidget0:completeAnimation()
				self.grenadeNameWidget0:setRGB( 1, 1, 1 )
				self.grenadeNameWidget0:setAlpha( 1 )
				self.clipFinished( grenadeNameWidget0, {} )
				currentEv:completeAnimation()
				self.gadgetImageWidget0:setRGB( 1, 1, 1 )
				self.gadgetImageWidget0:setAlpha( 1 )
				self.clipFinished( currentEv, {} )
				currentEv:completeAnimation()
				self.plus:setAlpha( 0 )
				self.clipFinished( currentEv, {} )
			end
		},
		Unequipped = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				bgImage:completeAnimation()
				self.bgImage:setRGB( 0.34, 0.37, 0.46 )
				self.bgImage:setAlpha( 0.3 )
				self.clipFinished( bgImage, {} )
				grenadeNameWidget0:completeAnimation()
				self.grenadeNameWidget0:setRGB( 1, 1, 1 )
				self.grenadeNameWidget0:setAlpha( 0 )
				self.clipFinished( grenadeNameWidget0, {} )
				currentEv:completeAnimation()
				self.gadgetImageWidget0:setRGB( 1, 1, 1 )
				self.gadgetImageWidget0:setAlpha( 0 )
				self.clipFinished( currentEv, {} )
				currentEv:completeAnimation()
				self.plus:setRGB( 0.4, 0.44, 0.52 )
				self.plus:setAlpha( 0.3 )
				self.clipFinished( currentEv, {} )
			end
		}
	}
	self.close = function ( self )
		self.grenadeNameWidget0:close()
		self.gadgetImageWidget0:close()
		CoD.LethalGrenadeCardWidget_Internal.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

