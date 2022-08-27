-- b9eda6acaa12c58487723ed488ea9b18
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.ItemHintText" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.HintTextArrow" )

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:setHandleMouse( true )
	f1_arg0:registerEventHandler( "mouseenter", function ( element, event )
		element:dispatchEventToParent( {
			name = "disable_mouse_button",
			controller = f1_arg1
		} )
		LUI.UIElement.mouseEnter( element, event )
	end )
	f1_arg0:registerEventHandler( "mouseleave", function ( element, event )
		element:dispatchEventToParent( {
			name = "enable_mouse_button",
			controller = f1_arg1
		} )
		LUI.UIElement.mouseLeave( element, event )
	end )
	f1_arg0:registerEventHandler( "button_action", function ( element, event )
		if event.isMouse then
			element:dispatchEventToParent( {
				name = "remove_item_from_class",
				controller = f1_arg1
			} )
			return true
		else
			
		end
	end )
end

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		f0_local0( self, controller, menu )
	end
end

CoD.RemoveItemButton = InheritFrom( LUI.UIElement )
CoD.RemoveItemButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.RemoveItemButton )
	self.id = "RemoveItemButton"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 20 )
	self:setTopBottom( true, false, 0, 20 )
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
	itemHintText:setLeftRight( false, false, -25, 25 )
	itemHintText:setTopBottom( true, false, -45, -15 )
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
				self.clipFinished( fullBacking, {} )
				RemoveIcon:completeAnimation()
				self.RemoveIcon:setRGB( 0.78, 0.78, 0.78 )
				self.RemoveIcon:setAlpha( 1 )
				self.clipFinished( RemoveIcon, {} )
				itemHintText:completeAnimation()
				itemHintText.textCenterAlign:completeAnimation()
				self.itemHintText:setAlpha( 1 )
				self.itemHintText.textCenterAlign:setText( Engine.Localize( "MENU_REMOVE" ) )
				self.clipFinished( itemHintText, {} )
				hintArrow:completeAnimation()
				self.hintArrow:setAlpha( 1 )
				self.clipFinished( hintArrow, {} )
			end,
			GainOver = function ()
				self:setupElementClipCounter( 2 )
				local fullBackingFrame2 = function ( fullBacking, event )
					if not event.interrupted then
						fullBacking:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					fullBacking:setAlpha( 0.8 )
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
						RemoveIcon:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					RemoveIcon:setRGB( 0.78, 0.78, 0.78 )
					RemoveIcon:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( RemoveIcon, event )
					else
						RemoveIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RemoveIcon:completeAnimation()
				self.RemoveIcon:setRGB( 0.2, 0.2, 0.2 )
				self.RemoveIcon:setAlpha( 0.75 )
				RemoveIconFrame2( RemoveIcon, {} )
			end,
			LoseOver = function ()
				self:setupElementClipCounter( 2 )
				local fullBackingFrame2 = function ( fullBacking, event )
					if not event.interrupted then
						fullBacking:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					fullBacking:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( fullBacking, event )
					else
						fullBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				fullBacking:completeAnimation()
				self.fullBacking:setAlpha( 0.8 )
				fullBackingFrame2( fullBacking, {} )
				local RemoveIconFrame2 = function ( RemoveIcon, event )
					if not event.interrupted then
						RemoveIcon:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					RemoveIcon:setRGB( 0.2, 0.2, 0.2 )
					RemoveIcon:setAlpha( 0.75 )
					if event.interrupted then
						self.clipFinished( RemoveIcon, event )
					else
						RemoveIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RemoveIcon:completeAnimation()
				self.RemoveIcon:setRGB( 0.78, 0.78, 0.78 )
				self.RemoveIcon:setAlpha( 1 )
				RemoveIconFrame2( RemoveIcon, {} )
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
							if not IsGamepad( controller ) then
								f21_local0 = CACShowRemovePrompt( self, element )
							else
								f21_local0 = false
							end
						end
					end
				end
				return f21_local0
			end
		}
	} )
	if self.m_eventHandlers.input_source_changed then
		local f6_local6 = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return f6_local6( element, event )
		end )
	else
		self:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.itemHintText:close()
		element.hintArrow:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

