require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.HintTextArrow" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.ItemHintText" )

local PCSpecific = function ( self, controller, menu )
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
				name = "remove_item_from_class",
				controller = controller
			} )
			return true
		else
			
		end
	end )
end

local PostLoadFunc = function ( self, controller, menu )
	if CursorInputEnabledForBuild() then
		PCSpecific( self, controller, menu )
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
	self:setLeftRight( 0, 0, 0, 30 )
	self:setTopBottom( 0, 0, 0, 30 )
	self.anyChildUsesUpdateState = true
	
	local Whitebox = LUI.UIImage.new()
	Whitebox:setLeftRight( 0, 1, 0, 0 )
	Whitebox:setTopBottom( 0, 1, 0, 0 )
	Whitebox:setRGB( 0.52, 0.52, 0.52 )
	Whitebox:setAlpha( 0.95 )
	self:addElement( Whitebox )
	self.Whitebox = Whitebox
	
	local fullBacking = LUI.UIImage.new()
	fullBacking:setLeftRight( 0, 1, 0, 0 )
	fullBacking:setTopBottom( 0, 1, 0, 0 )
	fullBacking:setRGB( 1, 0, 0 )
	fullBacking:setAlpha( 0 )
	self:addElement( fullBacking )
	self.fullBacking = fullBacking
	
	local RemoveIcon = LUI.UIImage.new()
	RemoveIcon:setLeftRight( 0, 1, 0, 0 )
	RemoveIcon:setTopBottom( 0, 1, 0, 0 )
	RemoveIcon:setAlpha( 0.75 )
	RemoveIcon:setImage( RegisterImage( "uie_t7_menu_cacselection_removebutton" ) )
	self:addElement( RemoveIcon )
	self.RemoveIcon = RemoveIcon
	
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
	itemHintText:setLeftRight( 0.5, 0.5, -37.5, 37.5 )
	itemHintText:setTopBottom( 0, 0, -67, -22 )
	itemHintText:setAlpha( 0 )
	itemHintText.textCenterAlign:setText( Engine.Localize( "MENU_REMOVE" ) )
	itemHintText.textCenterAlign:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
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
	hintArrow:setTopBottom( 0, 0, -22.5, -7.5 )
	hintArrow:setAlpha( 0 )
	hintArrow:setZRot( 180 )
	self:addElement( hintArrow )
	self.hintArrow = hintArrow
	
	self.resetProperties = function ()
		RemoveIcon:completeAnimation()
		Whitebox:completeAnimation()
		fullBacking:completeAnimation()
		hintArrow:completeAnimation()
		itemHintText:completeAnimation()
		RemoveIcon:setRGB( 1, 1, 1 )
		RemoveIcon:setAlpha( 0.75 )
		Whitebox:setAlpha( 0.95 )
		fullBacking:setAlpha( 0 )
		hintArrow:setAlpha( 0 )
		itemHintText:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				Whitebox:completeAnimation()
				self.Whitebox:setAlpha( 0 )
				self.clipFinished( Whitebox, {} )
				RemoveIcon:completeAnimation()
				self.RemoveIcon:setAlpha( 0 )
				self.clipFinished( RemoveIcon, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Over = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				fullBacking:completeAnimation()
				self.fullBacking:setAlpha( 0.8 )
				self.clipFinished( fullBacking, {} )
				RemoveIcon:completeAnimation()
				self.RemoveIcon:setRGB( 0.78, 0.78, 0.78 )
				self.RemoveIcon:setAlpha( 1 )
				self.clipFinished( RemoveIcon, {} )
				itemHintText:completeAnimation()
				self.itemHintText:setAlpha( 1 )
				self.clipFinished( itemHintText, {} )
				hintArrow:completeAnimation()
				self.hintArrow:setAlpha( 1 )
				self.clipFinished( hintArrow, {} )
			end,
			GainOver = function ()
				self.resetProperties()
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
				self.resetProperties()
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
				local f22_local0 = IsPC()
				if f22_local0 then
					f22_local0 = IsCACSlotEquipped( menu, element, controller )
					if f22_local0 then
						f22_local0 = IsCurrentMenu( menu, "CustomClass" )
						if f22_local0 then
							if not IsGamepad( controller ) then
								f22_local0 = CACShowRemovePrompt( self, element )
							else
								f22_local0 = false
							end
						end
					end
				end
				return f22_local0
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
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.itemHintText:close()
		self.hintArrow:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

