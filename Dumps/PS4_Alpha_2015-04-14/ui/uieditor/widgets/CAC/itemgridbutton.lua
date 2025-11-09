require( "ui.uieditor.widgets.CAC.ItemGridButtom_Internal" )
require( "ui.uieditor.widgets.Border" )

CoD.ItemGridButton = InheritFrom( LUI.UIElement )
CoD.ItemGridButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ItemGridButton )
	self.id = "ItemGridButton"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 160 )
	self:setTopBottom( true, false, 0, 90 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	local itemGridButtom = CoD.ItemGridButtom_Internal.new( menu, controller )
	itemGridButtom:setLeftRight( false, false, -80, 80 )
	itemGridButtom:setTopBottom( false, false, -45, 45 )
	itemGridButtom:setRGB( 1, 1, 1 )
	itemGridButtom:mergeStateConditions( {
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
	if itemGridButtom.m_eventHandlers.update_class then
		local currentEv = itemGridButtom.m_eventHandlers.update_class
		itemGridButtom:registerEventHandler( "update_class", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		itemGridButtom:registerEventHandler( "update_class", LUI.UIElement.updateState )
	end
	self:addElement( itemGridButtom )
	self.itemGridButtom = itemGridButtom
	
	local currentEv = CoD.Border.new( menu, controller )
	currentEv:setLeftRight( false, false, -80, 80 )
	currentEv:setTopBottom( false, false, -45, 45 )
	currentEv:setRGB( 1, 0.41, 0 )
	currentEv:setAlpha( 0 )
	self:addElement( currentEv )
	self.border = currentEv
	
	self.itemGridButtom:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemGridButtom.nameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.itemGridButtom:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemGridButtom.itemImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				itemGridButtom:completeAnimation()
				self.itemGridButtom:setRGB( 1, 1, 1 )
				self.itemGridButtom:setZoom( 0 )
				self.clipFinished( itemGridButtom, {} )
				currentEv:completeAnimation()
				self.border:setAlpha( 0 )
				self.border:setZoom( 0 )
				self.clipFinished( currentEv, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 2 )
				itemGridButtom:completeAnimation()
				self.itemGridButtom:setZoom( 25 )
				self.clipFinished( itemGridButtom, {} )
				currentEv:completeAnimation()
				self.border:setAlpha( 1 )
				self.border:setZoom( 25 )
				self.clipFinished( currentEv, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 2 )
				local itemGridButtomFrame2 = function ( itemGridButtom, event )
					if not event.interrupted then
						itemGridButtom:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					itemGridButtom:setZoom( 25 )
					if event.interrupted then
						self.clipFinished( itemGridButtom, event )
					else
						itemGridButtom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemGridButtom:completeAnimation()
				self.itemGridButtom:setZoom( 0 )
				itemGridButtomFrame2( itemGridButtom, {} )
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
				local itemGridButtomFrame2 = function ( itemGridButtom, event )
					if not event.interrupted then
						itemGridButtom:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					itemGridButtom:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( itemGridButtom, event )
					else
						itemGridButtom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemGridButtom:completeAnimation()
				self.itemGridButtom:setZoom( 25 )
				itemGridButtomFrame2( itemGridButtom, {} )
				local borderFrame2 = function ( border, event )
					if not event.interrupted then
						border:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					border:setAlpha( 0 )
					border:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( border, event )
					else
						border:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				currentEv:completeAnimation()
				self.border:setAlpha( 1 )
				self.border:setZoom( 25 )
				borderFrame2( currentEv, {} )
			end
		}
	}
	self.close = function ( self )
		self.itemGridButtom:close()
		self.border:close()
		CoD.ItemGridButton.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

