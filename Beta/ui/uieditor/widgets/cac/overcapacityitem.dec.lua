require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.WeaponItemModelWidget_Internal" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.ItemHintText" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.HintTextArrow" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.CAC.RestrictedItemWarning" )
require( "ui.uieditor.widgets.CAC.CustomClassListScreen.Panes.CustomClassPlusSymbol" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )

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
	header:setTTF( "fonts/escom.ttf" )
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
	self:addElement( sizeElement )
	self.sizeElement = sizeElement
	
	local opticIndicator = LUI.UIImage.new()
	opticIndicator:setLeftRight( false, false, -6, 6 )
	opticIndicator:setTopBottom( true, false, 4, 16 )
	opticIndicator:setRGB( 0.25, 0.25, 0.26 )
	opticIndicator:setAlpha( 0 )
	self:addElement( opticIndicator )
	self.opticIndicator = opticIndicator
	
	local itemHintText = CoD.ItemHintText.new( menu, controller )
	itemHintText:setLeftRight( false, false, -48, 48 )
	itemHintText:setTopBottom( false, true, 22, 42 )
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
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, 1, -1.5 )
	FocusBarB:setTopBottom( false, true, -3, 1 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local RestrictedItemWarning = CoD.RestrictedItemWarning.new( menu, controller )
	RestrictedItemWarning:setLeftRight( true, false, 1, 129 )
	RestrictedItemWarning:setTopBottom( true, false, 9.23, 119.77 )
	RestrictedItemWarning:linkToElementModel( self, nil, false, function ( model )
		RestrictedItemWarning:setModel( model, controller )
	end )
	RestrictedItemWarning:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return ItemIsBanned( menu, element, controller )
			end
		}
	} )
	RestrictedItemWarning:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" ), function ( model )
		menu:updateElementState( RestrictedItemWarning, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.Update"
		} )
	end )
	self:addElement( RestrictedItemWarning )
	self.RestrictedItemWarning = RestrictedItemWarning
	
	local plusIcon = CoD.CustomClassPlusSymbol.new( menu, controller )
	plusIcon:setLeftRight( false, false, -10, 10 )
	plusIcon:setTopBottom( false, false, -10, 10 )
	plusIcon:setRGB( 1, 0.43, 0.09 )
	plusIcon:setAlpha( 0 )
	plusIcon:setZRot( 45 )
	self:addElement( plusIcon )
	self.plusIcon = plusIcon
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactiveDiag:setTopBottom( true, true, -2, 2 )
	BoxButtonLrgInactiveDiag:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				opticIndicator:completeAnimation()
				self.opticIndicator:setAlpha( 0 )
				self.clipFinished( opticIndicator, {} )
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
				self:setupElementClipCounter( 6 )
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
				plusIcon:completeAnimation()
				self.plusIcon:setAlpha( 0 )
				self.clipFinished( plusIcon, {} )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 6 )
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
				plusIcon:completeAnimation()
				self.plusIcon:setAlpha( 0 )
				self.clipFinished( plusIcon, {} )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
			end
		},
		Small = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
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
				plusIcon:completeAnimation()
				self.plusIcon:setAlpha( 0 )
				self.clipFinished( plusIcon, {} )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 7 )
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
				plusIcon:completeAnimation()
				self.plusIcon:setAlpha( 0 )
				self.clipFinished( plusIcon, {} )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
			end
		},
		Weapon = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
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
				plusIcon:completeAnimation()
				self.plusIcon:setAlpha( 0 )
				self.clipFinished( plusIcon, {} )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 7 )
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
				plusIcon:completeAnimation()
				self.plusIcon:setAlpha( 0 )
				self.clipFinished( plusIcon, {} )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.sizeElement:close()
		self.itemHintText:close()
		self.hintArrow:close()
		self.FocusBarT:close()
		self.FocusBarB:close()
		self.RestrictedItemWarning:close()
		self.plusIcon:close()
		self.BoxButtonLrgInactiveDiag:close()
		self.header:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

