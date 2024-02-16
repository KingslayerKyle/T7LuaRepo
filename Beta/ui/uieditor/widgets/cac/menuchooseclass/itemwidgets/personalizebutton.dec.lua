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
				name = "personalize_class_item",
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

CoD.PersonalizeButton = InheritFrom( LUI.UIElement )
CoD.PersonalizeButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PersonalizeButton )
	self.id = "PersonalizeButton"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 20 )
	self:setTopBottom( true, false, 0, 20 )
	self.anyChildUsesUpdateState = true
	
	local Whitebox = LUI.UIImage.new()
	Whitebox:setLeftRight( true, false, 0, 20 )
	Whitebox:setTopBottom( true, false, 0, 20 )
	Whitebox:setRGB( 0.52, 0.52, 0.52 )
	Whitebox:setAlpha( 0 )
	self:addElement( Whitebox )
	self.Whitebox = Whitebox
	
	local fullBacking = LUI.UIImage.new()
	fullBacking:setLeftRight( true, true, 0, 0 )
	fullBacking:setTopBottom( true, true, 0, 0 )
	fullBacking:setRGB( 0, 0, 0 )
	fullBacking:setAlpha( 0 )
	self:addElement( fullBacking )
	self.fullBacking = fullBacking
	
	local PersonalizeIcon = LUI.UIImage.new()
	PersonalizeIcon:setLeftRight( true, true, 0, 0 )
	PersonalizeIcon:setTopBottom( true, true, 0, 0 )
	PersonalizeIcon:setAlpha( 0 )
	PersonalizeIcon:setImage( RegisterImage( "uie_t7_menu_cacselection_personalizebutton" ) )
	self:addElement( PersonalizeIcon )
	self.PersonalizeIcon = PersonalizeIcon
	
	local itemHintText = CoD.ItemHintText.new( menu, controller )
	itemHintText:setLeftRight( true, false, -25, 52 )
	itemHintText:setTopBottom( false, true, -65, -35 )
	itemHintText:setAlpha( 0 )
	itemHintText.textCenterAlign:setText( Engine.Localize( "HEROES_PERSONALIZE" ) )
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
				PersonalizeIcon:completeAnimation()
				self.PersonalizeIcon:setAlpha( 0 )
				self.clipFinished( PersonalizeIcon, {} )
				itemHintText:completeAnimation()
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
				self.Whitebox:setAlpha( 0 )
				self.clipFinished( Whitebox, {} )
				fullBacking:completeAnimation()
				self.fullBacking:setAlpha( 0 )
				self.fullBacking:setScale( 1 )
				self.clipFinished( fullBacking, {} )
				PersonalizeIcon:completeAnimation()
				self.PersonalizeIcon:setRGB( 1, 1, 1 )
				self.PersonalizeIcon:setAlpha( 0.75 )
				self.PersonalizeIcon:setScale( 1 )
				self.clipFinished( PersonalizeIcon, {} )
				itemHintText:completeAnimation()
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
				PersonalizeIcon:completeAnimation()
				self.PersonalizeIcon:setRGB( 0.78, 0.78, 0.78 )
				self.PersonalizeIcon:setAlpha( 1 )
				self.PersonalizeIcon:setScale( 1.2 )
				self.clipFinished( PersonalizeIcon, {} )
				itemHintText:completeAnimation()
				self.itemHintText:setAlpha( 1 )
				self.clipFinished( itemHintText, {} )
				hintArrow:completeAnimation()
				self.hintArrow:setAlpha( 1 )
				self.clipFinished( hintArrow, {} )
			end,
			GainOver = function ()
				self:setupElementClipCounter( 2 )
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
				local PersonalizeIconFrame2 = function ( PersonalizeIcon, event )
					if not event.interrupted then
						PersonalizeIcon:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					PersonalizeIcon:setRGB( 0.78, 0.78, 0.78 )
					PersonalizeIcon:setAlpha( 1 )
					PersonalizeIcon:setScale( 1.2 )
					if event.interrupted then
						self.clipFinished( PersonalizeIcon, event )
					else
						PersonalizeIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PersonalizeIcon:completeAnimation()
				self.PersonalizeIcon:setRGB( 0.2, 0.2, 0.2 )
				self.PersonalizeIcon:setAlpha( 1 )
				self.PersonalizeIcon:setScale( 1 )
				PersonalizeIconFrame2( PersonalizeIcon, {} )
			end,
			LoseOver = function ()
				self:setupElementClipCounter( 2 )
				local fullBackingFrame2 = function ( fullBacking, event )
					if not event.interrupted then
						fullBacking:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					fullBacking:setAlpha( 0 )
					fullBacking:setScale( 1 )
					if event.interrupted then
						self.clipFinished( fullBacking, event )
					else
						fullBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				fullBacking:completeAnimation()
				self.fullBacking:setAlpha( 0.8 )
				self.fullBacking:setScale( 1.2 )
				fullBackingFrame2( fullBacking, {} )
				local PersonalizeIconFrame2 = function ( PersonalizeIcon, event )
					if not event.interrupted then
						PersonalizeIcon:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					PersonalizeIcon:setRGB( 0.2, 0.2, 0.2 )
					PersonalizeIcon:setAlpha( 1 )
					PersonalizeIcon:setScale( 1 )
					if event.interrupted then
						self.clipFinished( PersonalizeIcon, event )
					else
						PersonalizeIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PersonalizeIcon:completeAnimation()
				self.PersonalizeIcon:setRGB( 0.78, 0.78, 0.78 )
				self.PersonalizeIcon:setAlpha( 1 )
				self.PersonalizeIcon:setScale( 1.2 )
				PersonalizeIconFrame2( PersonalizeIcon, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f21_local0 = IsPC()
				if f21_local0 then
					f21_local0 = IsCACSlotEquipped( menu, element, controller )
					if f21_local0 then
						f21_local0 = IsCurrentMenu( menu, "CustomClass" )
						if f21_local0 then
							f21_local0 = not IsGamepad( controller )
						end
					end
				end
				return f21_local0
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

