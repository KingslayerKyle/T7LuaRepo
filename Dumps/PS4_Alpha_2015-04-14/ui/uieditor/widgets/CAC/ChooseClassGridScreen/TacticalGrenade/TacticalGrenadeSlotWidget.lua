require( "ui.uieditor.widgets.CAC.gadgetImageWidget" )
require( "ui.uieditor.widgets.CAC.grenadeNameWidget" )

CoD.TacticalGrenadeSlotWidget = InheritFrom( LUI.UIElement )
CoD.TacticalGrenadeSlotWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.TacticalGrenadeSlotWidget )
	self.id = "TacticalGrenadeSlotWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 240 )
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
	
	local groupNameLabel = LUI.UITightText.new()
	groupNameLabel:setLeftRight( true, false, 2, 106 )
	groupNameLabel:setTopBottom( true, false, 0, 25 )
	groupNameLabel:setRGB( 0.4, 0.44, 0.52 )
	groupNameLabel:setTTF( "fonts/default.ttf" )
	groupNameLabel:linkToElementModel( self, "headerName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			groupNameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( groupNameLabel )
	self.groupNameLabel = groupNameLabel
	
	local gadgetImageWidget0 = CoD.gadgetImageWidget.new( menu, controller )
	gadgetImageWidget0:setLeftRight( false, false, -65, 65 )
	gadgetImageWidget0:setTopBottom( true, false, 28, 90 )
	gadgetImageWidget0:setRGB( 1, 1, 1 )
	gadgetImageWidget0:setAlpha( 0 )
	gadgetImageWidget0:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			gadgetImageWidget0.grenadeImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	gadgetImageWidget0:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			gadgetImageWidget0.takeTwoImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	gadgetImageWidget0:mergeStateConditions( {
		{
			stateName = "TakeTwo",
			condition = function ( menu, element, event )
				return IsCACTakeTwoSecondaryGadgetAttachmentEquipped( menu )
			end
		}
	} )
	if gadgetImageWidget0.m_eventHandlers.update_class then
		local currentEv = gadgetImageWidget0.m_eventHandlers.update_class
		gadgetImageWidget0:registerEventHandler( "update_class", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		gadgetImageWidget0:registerEventHandler( "update_class", LUI.UIElement.updateState )
	end
	self:addElement( gadgetImageWidget0 )
	self.gadgetImageWidget0 = gadgetImageWidget0
	
	local currentEv = CoD.grenadeNameWidget.new( menu, controller )
	currentEv:setLeftRight( true, true, 3, -3 )
	currentEv:setTopBottom( true, false, 88, 113 )
	currentEv:setRGB( 1, 1, 1 )
	currentEv:setAlpha( 0 )
	currentEv:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			currentEv.grenadeName:setText( Engine.Localize( modelValue ) )
		end
	end )
	currentEv:mergeStateConditions( {
		{
			stateName = "TimesTwoEquipped",
			condition = function ( menu, element, event )
				return IsCACTakeTwoSecondaryGadgetAttachmentEquipped( menu )
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
	self.grenadeNameWidget0 = currentEv
	
	local currentEv = LUI.UIImage.new()
	currentEv:setLeftRight( false, false, -16, 16 )
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
				self:setupElementClipCounter( 5 )
				bgImage:completeAnimation()
				self.bgImage:setRGB( 0.34, 0.37, 0.46 )
				self.bgImage:setAlpha( 0.3 )
				self.clipFinished( bgImage, {} )
				groupNameLabel:completeAnimation()
				self.groupNameLabel:setRGB( 0.4, 0.44, 0.52 )
				self.groupNameLabel:setAlpha( 1 )
				self.clipFinished( groupNameLabel, {} )
				gadgetImageWidget0:completeAnimation()
				self.gadgetImageWidget0:setAlpha( 1 )
				self.clipFinished( gadgetImageWidget0, {} )
				currentEv:completeAnimation()
				self.grenadeNameWidget0:setAlpha( 1 )
				self.clipFinished( currentEv, {} )
				currentEv:completeAnimation()
				self.plus:setAlpha( 0 )
				self.clipFinished( currentEv, {} )
			end
		},
		Unequipped = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				bgImage:completeAnimation()
				self.bgImage:setRGB( 0.34, 0.37, 0.46 )
				self.bgImage:setAlpha( 0.3 )
				self.clipFinished( bgImage, {} )
				groupNameLabel:completeAnimation()
				self.groupNameLabel:setRGB( 0.4, 0.44, 0.52 )
				self.groupNameLabel:setAlpha( 1 )
				self.clipFinished( groupNameLabel, {} )
				gadgetImageWidget0:completeAnimation()
				self.gadgetImageWidget0:setRGB( 1, 1, 1 )
				self.gadgetImageWidget0:setAlpha( 0 )
				self.clipFinished( gadgetImageWidget0, {} )
				currentEv:completeAnimation()
				self.grenadeNameWidget0:setRGB( 1, 1, 1 )
				self.grenadeNameWidget0:setAlpha( 0 )
				self.clipFinished( currentEv, {} )
				currentEv:completeAnimation()
				self.plus:setRGB( 0.4, 0.44, 0.52 )
				self.plus:setAlpha( 0.3 )
				self.clipFinished( currentEv, {} )
			end
		}
	}
	self.close = function ( self )
		self.gadgetImageWidget0:close()
		self.grenadeNameWidget0:close()
		self.groupNameLabel:close()
		CoD.TacticalGrenadeSlotWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

