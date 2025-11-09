require( "ui.uieditor.widgets.CAC.ItemGridButtonWide_Internal" )
require( "ui.uieditor.widgets.Border" )

CoD.ItemGridButtonWide = InheritFrom( LUI.UIElement )
CoD.ItemGridButtonWide.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ItemGridButtonWide )
	self.id = "ItemGridButtonWide"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 190 )
	self:setTopBottom( true, false, 0, 90 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	local itemButtom = CoD.ItemGridButtonWide_Internal.new( menu, controller )
	itemButtom:setLeftRight( true, false, 0, 190 )
	itemButtom:setTopBottom( true, false, 0, 90 )
	itemButtom:setRGB( 1, 1, 1 )
	itemButtom:setZoom( 25 )
	itemButtom:mergeStateConditions( {
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return IsCACItemEquipped( menu, element, controller )
			end
		},
		{
			stateName = "MutuallyExclusive",
			condition = function ( menu, element, event )
				return IsCACItemMutuallyExclusiveWithSelection( element, controller )
			end
		}
	} )
	if itemButtom.m_eventHandlers.update_class then
		local currentEv = itemButtom.m_eventHandlers.update_class
		itemButtom:registerEventHandler( "update_class", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		itemButtom:registerEventHandler( "update_class", LUI.UIElement.updateState )
	end
	self:addElement( itemButtom )
	self.itemButtom = itemButtom
	
	local currentEv = CoD.Border.new( menu, controller )
	currentEv:setLeftRight( true, true, 0, 0 )
	currentEv:setTopBottom( true, true, 0, 0 )
	currentEv:setRGB( 1, 0.41, 0 )
	currentEv:setAlpha( 0 )
	currentEv:setZoom( 25 )
	self:addElement( currentEv )
	self.border = currentEv
	
	self.itemButtom:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemButtom.nameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.itemButtom:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemButtom.itemImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				itemButtom:completeAnimation()
				self.itemButtom:setRGB( 1, 1, 1 )
				self.itemButtom:setZoom( 0 )
				self.clipFinished( itemButtom, {} )
				currentEv:completeAnimation()
				self.border:setAlpha( 0 )
				self.border:setZoom( 0 )
				self.clipFinished( currentEv, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 2 )
				itemButtom:completeAnimation()
				self.itemButtom:setZoom( 25 )
				self.clipFinished( itemButtom, {} )
				currentEv:completeAnimation()
				self.border:setAlpha( 1 )
				self.border:setZoom( 25 )
				self.clipFinished( currentEv, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 2 )
				local itemButtomFrame2 = function ( itemButtom, event )
					if not event.interrupted then
						itemButtom:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					itemButtom:setAlpha( 1 )
					itemButtom:setZoom( 25 )
					if event.interrupted then
						self.clipFinished( itemButtom, event )
					else
						itemButtom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemButtom:completeAnimation()
				self.itemButtom:setAlpha( 1 )
				self.itemButtom:setZoom( 0 )
				itemButtomFrame2( itemButtom, {} )
				local borderFrame2 = function ( border, event )
					if not event.interrupted then
						border:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					border:setAlpha( 1 )
					border:setZoom( 25 )
					if event.interrupted then
						self.clipFinished( border, event )
					else
						border:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				currentEv:completeAnimation()
				self.border:setAlpha( 1 )
				self.border:setZoom( 0 )
				borderFrame2( currentEv, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 2 )
				local itemButtomFrame2 = function ( itemButtom, event )
					if not event.interrupted then
						itemButtom:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					itemButtom:setAlpha( 1 )
					itemButtom:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( itemButtom, event )
					else
						itemButtom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemButtom:completeAnimation()
				self.itemButtom:setAlpha( 1 )
				self.itemButtom:setZoom( 25 )
				itemButtomFrame2( itemButtom, {} )
				local borderFrame2 = function ( border, event )
					if not event.interrupted then
						border:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					border:setRGB( 1, 0.41, 0 )
					border:setAlpha( 0 )
					border:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( border, event )
					else
						border:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				currentEv:completeAnimation()
				self.border:setRGB( 1, 0.41, 0 )
				self.border:setAlpha( 1 )
				self.border:setZoom( 25 )
				borderFrame2( currentEv, {} )
			end
		}
	}
	self.close = function ( self )
		self.itemButtom:close()
		self.border:close()
		CoD.ItemGridButtonWide.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

