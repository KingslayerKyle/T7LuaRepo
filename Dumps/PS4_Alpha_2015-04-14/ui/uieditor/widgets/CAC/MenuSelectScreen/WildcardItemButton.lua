require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WildcardItemButtonImage" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WildcardInfoWidget" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.ItemHintText" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreaksArrow" )

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

CoD.WildcardItemButton = InheritFrom( LUI.UIElement )
CoD.WildcardItemButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WildcardItemButton )
	self.id = "WildcardItemButton"
	self.soundSet = "CAC_Wildcard"
	self:setLeftRight( true, false, 0, 104 )
	self:setTopBottom( true, false, 0, 142 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local image = CoD.WildcardItemButtonImage.new( menu, controller )
	image:setLeftRight( false, false, -47, 46 )
	image:setTopBottom( false, false, -58, 58 )
	image:setRGB( 1, 1, 1 )
	image:linkToElementModel( self, nil, false, function ( model )
		image:setModel( model, controller )
	end )
	image:mergeStateConditions( {
		{
			stateName = "ContextualWildcard",
			condition = function ( menu, element, event )
				return IsCACContextualWildcardOpen( controller )
			end
		}
	} )
	self:addElement( image )
	self.image = image
	
	local equippedIcon = LUI.UIImage.new()
	equippedIcon:setLeftRight( false, true, -16, -2 )
	equippedIcon:setTopBottom( true, false, 2, 16 )
	equippedIcon:setRGB( 0.55, 0.77, 0.25 )
	equippedIcon:setAlpha( 0 )
	equippedIcon:setImage( RegisterImage( "uie_t7_hud_cac_equipped_16" ) )
	equippedIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( equippedIcon )
	self.equippedIcon = equippedIcon
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( true, true, 0, 0 )
	StartMenuframenoBG0:setTopBottom( true, true, 0, -1 )
	StartMenuframenoBG0:setRGB( 1, 1, 1 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local info = CoD.WildcardInfoWidget.new( menu, controller )
	info:setLeftRight( false, false, -145.5, 145.5 )
	info:setTopBottom( false, true, 16, 128 )
	info:setRGB( 1, 1, 1 )
	info:setAlpha( 0 )
	info:linkToElementModel( self, nil, false, function ( model )
		info:setModel( model, controller )
	end )
	self:addElement( info )
	self.info = info
	
	local itemHintText = CoD.ItemHintText.new( menu, controller )
	itemHintText:setLeftRight( false, false, -68, 67 )
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
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, 0, 0 )
	FocusBarB:setTopBottom( false, true, -4, 0 )
	FocusBarB:setRGB( 1, 1, 1 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, 0, 0 )
	FocusBarT:setTopBottom( true, false, -1, 3 )
	FocusBarT:setRGB( 1, 1, 1 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local scorestreaksArrow = CoD.scorestreaksArrow.new( menu, controller )
	scorestreaksArrow:setLeftRight( true, false, 46.5, 56.5 )
	scorestreaksArrow:setTopBottom( true, false, 151, 161 )
	scorestreaksArrow:setRGB( 1, 1, 1 )
	scorestreaksArrow:setAlpha( 0 )
	scorestreaksArrow:linkToElementModel( self, nil, false, function ( model )
		scorestreaksArrow:setModel( model, controller )
	end )
	scorestreaksArrow:mergeStateConditions( {
		{
			stateName = "NoHintText",
			condition = function ( menu, element, event )
				local f14_local0
				if not HasHintText( element ) then
					f14_local0 = AlwaysFalse()
				else
					f14_local0 = false
				end
				return f14_local0
			end
		}
	} )
	scorestreaksArrow:linkToElementModel( scorestreaksArrow, nil, true, function ( model )
		menu:updateElementState( scorestreaksArrow, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		} )
	end )
	self:addElement( scorestreaksArrow )
	self.scorestreaksArrow = scorestreaksArrow
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				equippedIcon:completeAnimation()
				self.equippedIcon:setAlpha( 0 )
				self.clipFinished( equippedIcon, {} )
				info:completeAnimation()
				self.info:setAlpha( 0 )
				self.clipFinished( info, {} )
				itemHintText:completeAnimation()
				self.itemHintText:setAlpha( 0 )
				self.clipFinished( itemHintText, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				scorestreaksArrow:completeAnimation()
				self.scorestreaksArrow:setAlpha( 0 )
				self.clipFinished( scorestreaksArrow, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 7 )
				image:completeAnimation()
				self.image:setLeftRight( false, false, -43.5, 43.5 )
				self.image:setTopBottom( false, false, -58, 58 )
				self.clipFinished( image, {} )
				equippedIcon:completeAnimation()
				self.equippedIcon:setAlpha( 0 )
				self.clipFinished( equippedIcon, {} )
				info:completeAnimation()
				self.info:setLeftRight( false, false, -145.5, 145.5 )
				self.info:setTopBottom( false, true, 20, 132 )
				self.info:setAlpha( 1 )
				self.clipFinished( info, {} )
				itemHintText:completeAnimation()
				self.itemHintText:setAlpha( 0 )
				self.clipFinished( itemHintText, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				scorestreaksArrow:completeAnimation()
				self.scorestreaksArrow:setLeftRight( true, false, 46.5, 56.5 )
				self.scorestreaksArrow:setTopBottom( true, false, 153, 163 )
				self.scorestreaksArrow:setAlpha( 0.65 )
				self.clipFinished( scorestreaksArrow, {} )
			end
		},
		ContextualWildcardEquipped = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				image:completeAnimation()
				self.image:setAlpha( 1 )
				self.clipFinished( image, {} )
				equippedIcon:completeAnimation()
				self.equippedIcon:setAlpha( 0.4 )
				self.clipFinished( equippedIcon, {} )
				info:completeAnimation()
				self.info:setAlpha( 0 )
				self.clipFinished( info, {} )
				itemHintText:completeAnimation()
				self.itemHintText:setAlpha( 0 )
				self.clipFinished( itemHintText, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				scorestreaksArrow:completeAnimation()
				self.scorestreaksArrow:setAlpha( 0 )
				self.clipFinished( scorestreaksArrow, {} )
			end
		},
		ContextualWildcard = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				image:completeAnimation()
				self.image:setAlpha( 1 )
				self.clipFinished( image, {} )
				equippedIcon:completeAnimation()
				self.equippedIcon:setAlpha( 0 )
				self.clipFinished( equippedIcon, {} )
				info:completeAnimation()
				self.info:setAlpha( 0 )
				self.clipFinished( info, {} )
				itemHintText:completeAnimation()
				self.itemHintText:setAlpha( 0 )
				self.clipFinished( itemHintText, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				scorestreaksArrow:completeAnimation()
				self.scorestreaksArrow:setAlpha( 0 )
				self.clipFinished( scorestreaksArrow, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 7 )
				image:completeAnimation()
				self.image:setAlpha( 1 )
				self.clipFinished( image, {} )
				equippedIcon:completeAnimation()
				self.equippedIcon:setAlpha( 0 )
				self.clipFinished( equippedIcon, {} )
				info:completeAnimation()
				self.info:setAlpha( 1 )
				self.clipFinished( info, {} )
				itemHintText:completeAnimation()
				self.itemHintText:setAlpha( 0 )
				self.clipFinished( itemHintText, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				scorestreaksArrow:completeAnimation()
				self.scorestreaksArrow:setAlpha( 1 )
				self.clipFinished( scorestreaksArrow, {} )
			end
		},
		Equipped = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				equippedIcon:completeAnimation()
				self.equippedIcon:setAlpha( 1 )
				self.clipFinished( equippedIcon, {} )
				info:completeAnimation()
				self.info:setAlpha( 0 )
				self.clipFinished( info, {} )
				itemHintText:completeAnimation()
				self.itemHintText:setAlpha( 0 )
				self.clipFinished( itemHintText, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0.02 )
				self.clipFinished( FocusBarT, {} )
				scorestreaksArrow:completeAnimation()
				self.scorestreaksArrow:setAlpha( 0 )
				self.clipFinished( scorestreaksArrow, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 6 )
				equippedIcon:completeAnimation()
				self.equippedIcon:setAlpha( 1 )
				self.clipFinished( equippedIcon, {} )
				info:completeAnimation()
				self.info:setAlpha( 1 )
				self.clipFinished( info, {} )
				itemHintText:completeAnimation()
				self.itemHintText:setAlpha( 0 )
				self.clipFinished( itemHintText, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				scorestreaksArrow:completeAnimation()
				self.scorestreaksArrow:setAlpha( 0.8 )
				self.clipFinished( scorestreaksArrow, {} )
			end
		},
		WildcardOverCapacityEquipped = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				image:completeAnimation()
				self.image:setAlpha( 1 )
				self.clipFinished( image, {} )
				equippedIcon:completeAnimation()
				self.equippedIcon:setAlpha( 1 )
				self.clipFinished( equippedIcon, {} )
				info:completeAnimation()
				self.info:setAlpha( 0 )
				self.clipFinished( info, {} )
				itemHintText:completeAnimation()
				self.itemHintText:setAlpha( 0 )
				self.clipFinished( itemHintText, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				scorestreaksArrow:completeAnimation()
				self.scorestreaksArrow:setAlpha( 0 )
				self.clipFinished( scorestreaksArrow, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 7 )
				image:completeAnimation()
				self.image:setAlpha( 1 )
				self.clipFinished( image, {} )
				equippedIcon:completeAnimation()
				self.equippedIcon:setAlpha( 1 )
				self.clipFinished( equippedIcon, {} )
				info:completeAnimation()
				self.info:setAlpha( 0 )
				self.clipFinished( info, {} )
				itemHintText:completeAnimation()
				self.itemHintText:setAlpha( 1 )
				self.clipFinished( itemHintText, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				scorestreaksArrow:completeAnimation()
				self.scorestreaksArrow:setAlpha( 0.8 )
				self.clipFinished( scorestreaksArrow, {} )
			end
		},
		WildcardOverCapacity = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				image:completeAnimation()
				self.image:setAlpha( 1 )
				self.clipFinished( image, {} )
				equippedIcon:completeAnimation()
				self.equippedIcon:setAlpha( 0 )
				self.clipFinished( equippedIcon, {} )
				info:completeAnimation()
				self.info:setAlpha( 0 )
				self.clipFinished( info, {} )
				itemHintText:completeAnimation()
				self.itemHintText:setAlpha( 0 )
				self.clipFinished( itemHintText, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				scorestreaksArrow:completeAnimation()
				self.scorestreaksArrow:setAlpha( 0 )
				self.clipFinished( scorestreaksArrow, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 7 )
				image:completeAnimation()
				self.image:setAlpha( 1 )
				self.clipFinished( image, {} )
				equippedIcon:completeAnimation()
				self.equippedIcon:setAlpha( 0 )
				self.clipFinished( equippedIcon, {} )
				info:completeAnimation()
				self.info:setAlpha( 0 )
				self.clipFinished( info, {} )
				itemHintText:completeAnimation()
				self.itemHintText:setAlpha( 0.9 )
				self.clipFinished( itemHintText, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				scorestreaksArrow:completeAnimation()
				self.scorestreaksArrow:setAlpha( 0.75 )
				self.clipFinished( scorestreaksArrow, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "ContextualWildcardEquipped",
			condition = function ( menu, element, event )
				return IsCACItemEquipped( menu, element, controller ) and IsCACContextualWildcardOpen( controller )
			end
		},
		{
			stateName = "ContextualWildcard",
			condition = function ( menu, element, event )
				return IsCACContextualWildcardOpen( controller )
			end
		},
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return IsCACItemEquipped( menu, element, controller )
			end
		},
		{
			stateName = "WildcardOverCapacityEquipped",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "WildcardOverCapacity",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	if self.m_eventHandlers.update_class then
		local currentEv = self.m_eventHandlers.update_class
		self:registerEventHandler( "update_class", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		self:registerEventHandler( "update_class", LUI.UIElement.updateState )
	end
	image.id = "image"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.image:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.image:close()
		self.StartMenuframenoBG0:close()
		self.info:close()
		self.itemHintText:close()
		self.FocusBarB:close()
		self.FocusBarT:close()
		self.scorestreaksArrow:close()
		CoD.WildcardItemButton.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

