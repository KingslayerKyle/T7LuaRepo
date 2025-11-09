require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.ItemHintText" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.HintTextArrow" )

local PCSpecific = function ( self, controller )
	self:setHandleMouse( true )
	self:registerEventHandler( "mouseenter", function ( self, event )
		self:dispatchEventToParent( {
			name = "disable_mouse_button",
			controller = controller
		} )
		LUI.UIElement.mouseEnter( self, event )
	end )
	self:registerEventHandler( "mouseleave", function ( self, event )
		self:dispatchEventToParent( {
			name = "enable_mouse_button",
			controller = controller
		} )
		LUI.UIElement.mouseLeave( self, event )
	end )
	self:registerEventHandler( "button_action", function ( self, event )
		if event.isMouse then
			self:dispatchEventToParent( {
				name = "gunsmith_remove_item",
				controller = controller
			} )
		end
	end )
end

local PostLoadFunc = function ( self, controller )
	if CoD.isPC then
		PCSpecific( self, controller )
	end
end

CoD.GunsmithRemoveButton = InheritFrom( LUI.UIElement )
CoD.GunsmithRemoveButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GunsmithRemoveButton )
	self.id = "GunsmithRemoveButton"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 15 )
	self:setTopBottom( true, false, 0, 15 )
	self.anyChildUsesUpdateState = true
	
	local Whitebox = LUI.UIImage.new()
	Whitebox:setLeftRight( true, true, 0, 0 )
	Whitebox:setTopBottom( true, true, 0, 0 )
	Whitebox:setRGB( 0.52, 0.52, 0.52 )
	Whitebox:setAlpha( 0.95 )
	self:addElement( Whitebox )
	self.Whitebox = Whitebox
	
	local fullBacking = LUI.UIImage.new()
	fullBacking:setLeftRight( true, true, 0, 0 )
	fullBacking:setTopBottom( true, true, 0, 0 )
	fullBacking:setRGB( 1, 0, 0 )
	fullBacking:setAlpha( 0 )
	self:addElement( fullBacking )
	self.fullBacking = fullBacking
	
	local RemoveIcon = LUI.UIImage.new()
	RemoveIcon:setLeftRight( true, true, 0, 0 )
	RemoveIcon:setTopBottom( true, true, 0, 0 )
	RemoveIcon:setAlpha( 0.75 )
	RemoveIcon:setImage( RegisterImage( "uie_t7_menu_cacselection_removebutton" ) )
	self:addElement( RemoveIcon )
	self.RemoveIcon = RemoveIcon
	
	local itemHintText = CoD.ItemHintText.new( menu, controller )
	itemHintText:setLeftRight( true, false, -50, 14 )
	itemHintText:setTopBottom( false, true, 0, 30 )
	itemHintText:setAlpha( 0 )
	itemHintText.textCenterAlign:setText( Engine.Localize( "MENU_REMOVE" ) )
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
	hintArrow:setTopBottom( true, false, -15, -5 )
	hintArrow:setAlpha( 0 )
	hintArrow:setZRot( 180 )
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
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				Whitebox:completeAnimation()
				self.Whitebox:setAlpha( 0 )
				self.clipFinished( Whitebox, {} )
				fullBacking:completeAnimation()
				self.fullBacking:setAlpha( 0 )
				self.clipFinished( fullBacking, {} )
				RemoveIcon:completeAnimation()
				self.RemoveIcon:setAlpha( 0 )
				self.clipFinished( RemoveIcon, {} )
				itemHintText:completeAnimation()
				self.itemHintText:setLeftRight( true, false, -56, 15 )
				self.itemHintText:setTopBottom( false, true, 0, 30 )
				self.itemHintText:setAlpha( 0 )
				self.clipFinished( itemHintText, {} )
				hintArrow:completeAnimation()
				self.hintArrow:setAlpha( 0 )
				self.clipFinished( hintArrow, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				Whitebox:completeAnimation()
				self.Whitebox:setAlpha( 0.95 )
				self.clipFinished( Whitebox, {} )
				fullBacking:completeAnimation()
				self.fullBacking:setAlpha( 0 )
				self.fullBacking:setScale( 1 )
				self.clipFinished( fullBacking, {} )
				RemoveIcon:completeAnimation()
				self.RemoveIcon:setRGB( 1, 1, 1 )
				self.RemoveIcon:setAlpha( 0.75 )
				self.RemoveIcon:setScale( 1 )
				self.clipFinished( RemoveIcon, {} )
				itemHintText:completeAnimation()
				self.itemHintText:setLeftRight( true, false, -56, 15 )
				self.itemHintText:setTopBottom( false, true, 0, 30 )
				self.itemHintText:setAlpha( 0 )
				self.clipFinished( itemHintText, {} )
				hintArrow:completeAnimation()
				self.hintArrow:setAlpha( 0 )
				self.clipFinished( hintArrow, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 4 )
				fullBacking:completeAnimation()
				self.fullBacking:setAlpha( 0.8 )
				self.fullBacking:setScale( 1.2 )
				self.clipFinished( fullBacking, {} )
				RemoveIcon:completeAnimation()
				self.RemoveIcon:setRGB( 0.78, 0.78, 0.78 )
				self.RemoveIcon:setAlpha( 1 )
				self.RemoveIcon:setScale( 1.2 )
				self.clipFinished( RemoveIcon, {} )
				itemHintText:completeAnimation()
				itemHintText.textCenterAlign:completeAnimation()
				self.itemHintText:setLeftRight( true, false, -56, 16 )
				self.itemHintText:setTopBottom( false, true, 2, 32 )
				self.itemHintText:setAlpha( 1 )
				self.itemHintText.textCenterAlign:setText( Engine.Localize( "MENU_REMOVE" ) )
				self.clipFinished( itemHintText, {} )
				hintArrow:completeAnimation()
				self.hintArrow:setAlpha( 0 )
				self.clipFinished( hintArrow, {} )
			end,
			GainOver = function ()
				self:setupElementClipCounter( 3 )
				local fullBackingFrame2 = function ( fullBacking, event )
					if not event.interrupted then
						fullBacking:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					fullBacking:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( fullBacking, event )
					else
						fullBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				fullBacking:completeAnimation()
				self.fullBacking:setAlpha( 0 )
				fullBackingFrame2( fullBacking, {} )
				local RemoveIconFrame2 = function ( RemoveIcon, event )
					if not event.interrupted then
						RemoveIcon:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					RemoveIcon:setRGB( 0.78, 0.78, 0.78 )
					RemoveIcon:setAlpha( 1 )
					RemoveIcon:setScale( 1.2 )
					if event.interrupted then
						self.clipFinished( RemoveIcon, event )
					else
						RemoveIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RemoveIcon:completeAnimation()
				self.RemoveIcon:setRGB( 0.2, 0.2, 0.2 )
				self.RemoveIcon:setAlpha( 1 )
				self.RemoveIcon:setScale( 1 )
				RemoveIconFrame2( RemoveIcon, {} )
				itemHintText:completeAnimation()
				self.itemHintText:setLeftRight( true, false, -56, 14 )
				self.itemHintText:setTopBottom( false, true, 0, 30 )
				self.clipFinished( itemHintText, {} )
			end,
			LoseOver = function ()
				self:setupElementClipCounter( 3 )
				local fullBackingFrame2 = function ( fullBacking, event )
					if not event.interrupted then
						fullBacking:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					fullBacking:setAlpha( 0 )
					fullBacking:setScale( 1.2 )
					if event.interrupted then
						self.clipFinished( fullBacking, event )
					else
						fullBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				fullBacking:completeAnimation()
				self.fullBacking:setAlpha( 1 )
				self.fullBacking:setScale( 1.2 )
				fullBackingFrame2( fullBacking, {} )
				local RemoveIconFrame2 = function ( RemoveIcon, event )
					if not event.interrupted then
						RemoveIcon:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					RemoveIcon:setRGB( 0.2, 0.2, 0.2 )
					RemoveIcon:setAlpha( 1 )
					RemoveIcon:setScale( 1 )
					if event.interrupted then
						self.clipFinished( RemoveIcon, event )
					else
						RemoveIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RemoveIcon:completeAnimation()
				self.RemoveIcon:setRGB( 0.78, 0.78, 0.78 )
				self.RemoveIcon:setAlpha( 1 )
				self.RemoveIcon:setScale( 1.2 )
				RemoveIconFrame2( RemoveIcon, {} )
				itemHintText:completeAnimation()
				self.itemHintText:setLeftRight( true, false, -56, 16 )
				self.itemHintText:setTopBottom( false, true, 2, 32 )
				self.clipFinished( itemHintText, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsPC() and not IsGamepad( controller )
			end
		}
	} )
	if self.m_eventHandlers.input_source_changed then
		local currentEv = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		self:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.itemHintText:close()
		self.hintArrow:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

