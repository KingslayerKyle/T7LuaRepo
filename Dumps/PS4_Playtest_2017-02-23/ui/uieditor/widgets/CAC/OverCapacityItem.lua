require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.CAC.CustomClassListScreen.Panes.CustomClassPlusSymbol" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.HintTextArrow" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.ItemHintText" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.WeaponItemModelWidget_Internal" )
require( "ui.uieditor.widgets.CAC.RestrictedItemWarning" )
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
	self:setLeftRight( 0, 0, 0, 193 )
	self:setTopBottom( 0, 0, 0, 193 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local header = LUI.UITightText.new()
	header:setLeftRight( 0, 0, 2, 78 )
	header:setTopBottom( 0, 0, -34, -6 )
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
	sizeElement:mergeStateConditions( {
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	sizeElement:setLeftRight( 0.5, 0.5, -97, 97 )
	sizeElement:setTopBottom( 0, 0, 0, 194 )
	sizeElement:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			sizeElement.itemImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( sizeElement )
	self.sizeElement = sizeElement
	
	local opticIndicator = LUI.UIImage.new()
	opticIndicator:setLeftRight( 0.5, 0.5, -9, 9 )
	opticIndicator:setTopBottom( 0, 0, 6, 24 )
	opticIndicator:setRGB( 0.25, 0.25, 0.26 )
	opticIndicator:setAlpha( 0 )
	self:addElement( opticIndicator )
	self.opticIndicator = opticIndicator
	
	local itemHintText = CoD.ItemHintText.new( menu, controller )
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
	itemHintText:setLeftRight( 0.5, 0.5, -72, 72 )
	itemHintText:setTopBottom( 1, 1, 33, 63 )
	itemHintText:setAlpha( 0 )
	itemHintText.textCenterAlign:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	itemHintText:linkToElementModel( self, nil, false, function ( model )
		itemHintText:setModel( model, controller )
	end )
	itemHintText:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemHintText.textCenterAlign:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( itemHintText )
	self.itemHintText = itemHintText
	
	local hintArrow = CoD.HintTextArrow.new( menu, controller )
	hintArrow:mergeStateConditions( {
		{
			stateName = "NoHintText",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	hintArrow:setLeftRight( 0.5, 0.5, -7.5, 7.5 )
	hintArrow:setTopBottom( 1, 1, 14.5, 29.5 )
	hintArrow:setAlpha( 0 )
	hintArrow:linkToElementModel( self, nil, false, function ( model )
		hintArrow:setModel( model, controller )
	end )
	self:addElement( hintArrow )
	self.hintArrow = hintArrow
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( 0, 1, 2, -2 )
	FocusBarT:setTopBottom( 0, 0, 0, 6 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( 0, 1, 2, -2 )
	FocusBarB:setTopBottom( 1, 1, -5, 1 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local RestrictedItemWarning = CoD.RestrictedItemWarning.new( menu, controller )
	RestrictedItemWarning:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return ItemIsBanned( menu, element, controller )
			end
		}
	} )
	RestrictedItemWarning:linkToElementModel( RestrictedItemWarning, nil, true, function ( model )
		menu:updateElementState( RestrictedItemWarning, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		} )
	end )
	RestrictedItemWarning:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" ), function ( model )
		menu:updateElementState( RestrictedItemWarning, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.Update"
		} )
	end )
	RestrictedItemWarning:setLeftRight( 0, 0, 2, 194 )
	RestrictedItemWarning:setTopBottom( 0, 0, 14, 180 )
	RestrictedItemWarning:linkToElementModel( self, nil, false, function ( model )
		RestrictedItemWarning:setModel( model, controller )
	end )
	self:addElement( RestrictedItemWarning )
	self.RestrictedItemWarning = RestrictedItemWarning
	
	local plusIcon = CoD.CustomClassPlusSymbol.new( menu, controller )
	plusIcon:setLeftRight( 0.5, 0.5, -15, 15 )
	plusIcon:setTopBottom( 0.5, 0.5, -15, 15 )
	plusIcon:setRGB( 1, 0.43, 0.09 )
	plusIcon:setAlpha( 0 )
	plusIcon:setZRot( 45 )
	self:addElement( plusIcon )
	self.plusIcon = plusIcon
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( 0, 1, -3, 3 )
	BoxButtonLrgInactiveDiag:setTopBottom( 0, 1, -3, 3 )
	BoxButtonLrgInactiveDiag:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	self.resetProperties = function ()
		itemHintText:completeAnimation()
		FocusBarB:completeAnimation()
		FocusBarT:completeAnimation()
		hintArrow:completeAnimation()
		sizeElement:completeAnimation()
		itemHintText:setLeftRight( 0.5, 0.5, -72, 72 )
		itemHintText:setTopBottom( 1, 1, 33, 63 )
		itemHintText:setAlpha( 0 )
		FocusBarB:setAlpha( 0 )
		FocusBarT:setAlpha( 0 )
		hintArrow:setAlpha( 0 )
		sizeElement:setLeftRight( 0.5, 0.5, -97, 97 )
		sizeElement:setTopBottom( 0, 0, 0, 194 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				itemHintText:completeAnimation()
				self.itemHintText:setLeftRight( 0.5, 0.5, -64, 64 )
				self.itemHintText:setTopBottom( 1, 1, 29, 59 )
				self.clipFinished( itemHintText, {} )
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
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self.resetProperties()
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
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( 0.5, 0.5, -46.5, 46.5 )
				self.sizeElement:setTopBottom( 0, 0, -0.5, 92.5 )
				self.clipFinished( sizeElement, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( 0.5, 0.5, -46.5, 46.5 )
				self.sizeElement:setTopBottom( 0, 0, -0.5, 92.5 )
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
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
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

