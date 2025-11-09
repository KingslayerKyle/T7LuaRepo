require( "ui.uieditor.widgets.CAC.GridButtonWide_Internal" )
require( "ui.uieditor.widgets.Border" )

CoD.GridButtonWide = InheritFrom( LUI.UIElement )
CoD.GridButtonWide.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GridButtonWide )
	self.id = "GridButtonWide"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 200 )
	self:setTopBottom( true, false, 0, 125 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	local gridButtonWideInternal = CoD.GridButtonWide_Internal.new( menu, controller )
	gridButtonWideInternal:setLeftRight( true, true, 0, 0 )
	gridButtonWideInternal:setTopBottom( true, true, 0, 0 )
	gridButtonWideInternal:setRGB( 1, 1, 1 )
	gridButtonWideInternal.buttonName:setRGB( 0.9, 0.9, 0.9 )
	gridButtonWideInternal:mergeStateConditions( {
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return IsCACItemEquipped( menu, element, controller )
			end
		},
		{
			stateName = "Equippable",
			condition = function ( menu, element, event )
				return IsCACItemEquippable( menu, element, event )
			end
		},
		{
			stateName = "Purchasable",
			condition = function ( menu, element, event )
				return IsCACItemPurchasable( menu, element, event )
			end
		},
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsCACItemLocked( menu, element, controller )
			end
		},
		{
			stateName = "MutuallyExclusive",
			condition = function ( menu, element, event )
				return IsCACItemMutuallyExclusiveWithSelection( element, controller )
			end
		}
	} )
	if gridButtonWideInternal.m_eventHandlers.update_class then
		local currentEv = gridButtonWideInternal.m_eventHandlers.update_class
		gridButtonWideInternal:registerEventHandler( "update_class", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		gridButtonWideInternal:registerEventHandler( "update_class", LUI.UIElement.updateState )
	end
	self:addElement( gridButtonWideInternal )
	self.gridButtonWideInternal = gridButtonWideInternal
	
	local currentEv = CoD.Border.new( menu, controller )
	currentEv:setLeftRight( true, true, 0, 0 )
	currentEv:setTopBottom( true, true, 0, 0 )
	currentEv:setRGB( 1, 0.41, 0 )
	currentEv:setAlpha( 0 )
	self:addElement( currentEv )
	self.border = currentEv
	
	self.gridButtonWideInternal:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			gridButtonWideInternal.buttonImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self.gridButtonWideInternal:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			gridButtonWideInternal.buttonName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				gridButtonWideInternal:completeAnimation()
				self.gridButtonWideInternal:setAlpha( 1 )
				self.clipFinished( gridButtonWideInternal, {} )
				currentEv:completeAnimation()
				self.border:setAlpha( 0 )
				self.clipFinished( currentEv, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 1 )
				currentEv:completeAnimation()
				self.border:setAlpha( 1 )
				self.clipFinished( currentEv, {} )
			end,
			GainFocus2 = function ()
				self:setupElementClipCounter( 2 )
				local gridButtonWideInternalFrame2 = function ( gridButtonWideInternal, event )
					if not event.interrupted then
						gridButtonWideInternal:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						gridButtonWideInternal.buttonName:beginAnimation( "subkeyframe", 200, false, false, CoD.TweenType.Linear )
					end
					gridButtonWideInternal.buttonName:setRGB( 1, 0.41, 0 )
					if event.interrupted then
						self.clipFinished( gridButtonWideInternal, event )
					else
						gridButtonWideInternal:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				gridButtonWideInternal:completeAnimation()
				gridButtonWideInternal.buttonName:completeAnimation()
				self.gridButtonWideInternal.buttonName:setRGB( 0.9, 0.9, 0.9 )
				gridButtonWideInternalFrame2( gridButtonWideInternal, {} )
				local borderFrame2 = function ( border, event )
					if not event.interrupted then
						border:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					border:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( border, event )
					else
						border:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				currentEv:completeAnimation()
				self.border:setAlpha( 0 )
				borderFrame2( currentEv, {} )
			end,
			LoseFocus2 = function ()
				self:setupElementClipCounter( 2 )
				local gridButtonWideInternalFrame2 = function ( gridButtonWideInternal, event )
					if not event.interrupted then
						gridButtonWideInternal:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						gridButtonWideInternal.buttonName:beginAnimation( "subkeyframe", 200, false, false, CoD.TweenType.Linear )
					end
					gridButtonWideInternal.buttonName:setRGB( 0.9, 0.9, 0.9 )
					if event.interrupted then
						self.clipFinished( gridButtonWideInternal, event )
					else
						gridButtonWideInternal:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				gridButtonWideInternal:completeAnimation()
				gridButtonWideInternal.buttonName:completeAnimation()
				self.gridButtonWideInternal.buttonName:setRGB( 1, 0.41, 0 )
				gridButtonWideInternalFrame2( gridButtonWideInternal, {} )
				local borderFrame2 = function ( border, event )
					if not event.interrupted then
						border:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					border:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( border, event )
					else
						border:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				currentEv:completeAnimation()
				self.border:setAlpha( 1 )
				borderFrame2( currentEv, {} )
			end
		}
	}
	self.close = function ( self )
		self.gridButtonWideInternal:close()
		self.border:close()
		CoD.GridButtonWide.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

