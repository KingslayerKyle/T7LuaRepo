require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.WeaponItemModelWidget_Internal" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.ItemHintText" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.HintTextArrow" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

local PostLoadFunc = function ( self, controller, menu )
	self.itemHintText:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			local extraTextWidth = 16
			self.itemHintText.textCenterAlign:setText( Engine.Localize( modelValue ) )
			local textWidth = self.itemHintText.textCenterAlign:getTextWidth()
			self.itemHintText:setLeftRight( false, false, -textWidth / 2 - extraTextWidth, textWidth / 2 + extraTextWidth )
		end
	end )
end

CoD.OverCapacityItem = InheritFrom( LUI.UIElement )
CoD.OverCapacityItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.OverCapacityItem )
	self.id = "OverCapacityItem"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 129 )
	self:setTopBottom( true, false, 0, 129 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local header = LUI.UITightText.new()
	header:setLeftRight( true, false, 1, 52 )
	header:setTopBottom( true, false, -23, -4 )
	header:setRGB( 1, 1, 1 )
	header:setTTF( "fonts/Entovo.ttf" )
	header:linkToElementModel( self, "headerName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			header:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( header )
	self.header = header
	
	local sizeElement = CoD.WeaponItemModelWidget_Internal.new( menu, controller )
	sizeElement:setLeftRight( false, false, -64.5, 64.5 )
	sizeElement:setTopBottom( true, false, 0, 129 )
	sizeElement:setRGB( 1, 1, 1 )
	sizeElement.plusIcon:setRGB( 1, 0.41, 0 )
	sizeElement:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			sizeElement.itemImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	sizeElement:mergeStateConditions( {
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	if sizeElement.m_eventHandlers.update_class then
		local currentEv = sizeElement.m_eventHandlers.update_class
		sizeElement:registerEventHandler( "update_class", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		sizeElement:registerEventHandler( "update_class", LUI.UIElement.updateState )
	end
	sizeElement:linkToElementModel( sizeElement, "itemIndex", true, function ( model )
		menu:updateElementState( sizeElement, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( sizeElement )
	self.sizeElement = sizeElement
	
	local currentEv = LUI.UIImage.new()
	currentEv:setLeftRight( false, false, -6, 6 )
	currentEv:setTopBottom( true, false, 4, 16 )
	currentEv:setRGB( 0.25, 0.25, 0.26 )
	currentEv:setAlpha( 0 )
	currentEv:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( currentEv )
	self.opticIndicator = currentEv
	
	local itemHintText = CoD.ItemHintText.new( menu, controller )
	itemHintText:setLeftRight( false, false, -48, 48 )
	itemHintText:setTopBottom( false, true, 22, 42 )
	itemHintText:setRGB( 1, 1, 1 )
	itemHintText:setAlpha( 0 )
	itemHintText:linkToElementModel( self, nil, false, function ( model )
		itemHintText:setModel( model, controller )
	end )
	itemHintText:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemHintText.textCenterAlign:setText( Engine.Localize( modelValue ) )
		end
	end )
	itemHintText:mergeStateConditions( {
		{
			stateName = "NoHintText",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "LeftAlign",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "RightAlign",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "CenterAlign",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( itemHintText )
	self.itemHintText = itemHintText
	
	local hintArrow = CoD.HintTextArrow.new( menu, controller )
	hintArrow:setLeftRight( false, false, -5, 5 )
	hintArrow:setTopBottom( false, true, 10, 20 )
	hintArrow:setRGB( 1, 1, 1 )
	hintArrow:setAlpha( 0 )
	hintArrow:linkToElementModel( self, nil, false, function ( model )
		hintArrow:setModel( model, controller )
	end )
	hintArrow:mergeStateConditions( {
		{
			stateName = "NoHintText",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:addElement( hintArrow )
	self.hintArrow = hintArrow
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, 1, -1.5 )
	FocusBarT:setTopBottom( true, false, 0, 4 )
	FocusBarT:setRGB( 1, 1, 1 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, 1, -1.5 )
	FocusBarB:setTopBottom( false, true, -3, 1 )
	FocusBarB:setRGB( 1, 1, 1 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				currentEv:completeAnimation()
				self.opticIndicator:setAlpha( 0 )
				self.clipFinished( currentEv, {} )
				itemHintText:completeAnimation()
				self.itemHintText:setAlpha( 0 )
				self.clipFinished( itemHintText, {} )
				hintArrow:completeAnimation()
				self.hintArrow:setAlpha( 0 )
				self.clipFinished( hintArrow, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 4 )
				itemHintText:completeAnimation()
				self.itemHintText:setLeftRight( false, false, -42.5, 42.5 )
				self.itemHintText:setTopBottom( false, true, 19, 39 )
				self.itemHintText:setAlpha( 0 )
				self.clipFinished( itemHintText, {} )
				hintArrow:completeAnimation()
				self.hintArrow:setRGB( 1, 1, 1 )
				self.hintArrow:setAlpha( 0 )
				self.clipFinished( hintArrow, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end
		},
		Wildcard = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				itemHintText:completeAnimation()
				self.itemHintText:setAlpha( 0 )
				self.clipFinished( itemHintText, {} )
				hintArrow:completeAnimation()
				self.hintArrow:setAlpha( 0 )
				self.clipFinished( hintArrow, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 4 )
				itemHintText:completeAnimation()
				self.itemHintText:setAlpha( 1 )
				self.clipFinished( itemHintText, {} )
				hintArrow:completeAnimation()
				self.hintArrow:setAlpha( 0.8 )
				self.clipFinished( hintArrow, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end
		},
		Small = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( false, false, -31, 31 )
				self.sizeElement:setTopBottom( true, false, 0, 62 )
				self.clipFinished( sizeElement, {} )
				itemHintText:completeAnimation()
				self.itemHintText:setAlpha( 0 )
				self.clipFinished( itemHintText, {} )
				hintArrow:completeAnimation()
				self.hintArrow:setAlpha( 0 )
				self.clipFinished( hintArrow, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 5 )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( false, false, -31, 31 )
				self.sizeElement:setTopBottom( true, false, 0, 62 )
				self.clipFinished( sizeElement, {} )
				itemHintText:completeAnimation()
				self.itemHintText:setAlpha( 0.9 )
				self.clipFinished( itemHintText, {} )
				hintArrow:completeAnimation()
				self.hintArrow:setAlpha( 0.8 )
				self.clipFinished( hintArrow, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end
		},
		Weapon = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( false, false, -64.5, 64.5 )
				self.sizeElement:setTopBottom( true, false, 0, 129 )
				self.clipFinished( sizeElement, {} )
				itemHintText:completeAnimation()
				self.itemHintText:setAlpha( 0 )
				self.clipFinished( itemHintText, {} )
				hintArrow:completeAnimation()
				self.hintArrow:setAlpha( 0 )
				self.clipFinished( hintArrow, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 5 )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( false, false, -64.5, 64.5 )
				self.sizeElement:setTopBottom( true, false, 0, 129 )
				self.clipFinished( sizeElement, {} )
				itemHintText:completeAnimation()
				self.itemHintText:setAlpha( 0.9 )
				self.clipFinished( itemHintText, {} )
				hintArrow:completeAnimation()
				self.hintArrow:setAlpha( 0.8 )
				self.clipFinished( hintArrow, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, true, 1, -1.5 )
				self.FocusBarT:setTopBottom( true, false, 0, 4 )
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, true, 1, -1.5 )
				self.FocusBarB:setTopBottom( false, true, -3, 1 )
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Wildcard",
			condition = function ( menu, element, event )
				return IsCACSlotOvercapacityWildcard( element )
			end
		},
		{
			stateName = "Small",
			condition = function ( menu, element, event )
				return not IsCACSlotOvercapacity2by1AspectRatio( element )
			end
		},
		{
			stateName = "Weapon",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	sizeElement.id = "sizeElement"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.sizeElement:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.sizeElement:close()
		self.itemHintText:close()
		self.hintArrow:close()
		self.FocusBarT:close()
		self.FocusBarB:close()
		self.header:close()
		CoD.OverCapacityItem.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

