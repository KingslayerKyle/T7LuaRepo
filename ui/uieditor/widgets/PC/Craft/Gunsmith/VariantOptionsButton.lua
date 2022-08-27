-- 4e09f10fb69e10a5c2846cfeac43d2d0
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.ItemHintText" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.HintTextArrow" )

local f0_local0 = function ( f1_arg0, f1_arg1 )
	f1_arg0:setHandleMouse( true )
	f1_arg0:registerEventHandler( "mouseenter", function ( element, event )
		element:dispatchEventToParent( {
			name = "disable_mouse_button",
			controller = f1_arg1
		} )
		if element:playClip( "GainOver" ) then
			element.nextClip = "Over"
		else
			element:playClip( "Over" )
		end
	end )
	f1_arg0:registerEventHandler( "mouseleave", function ( element, event )
		element:dispatchEventToParent( {
			name = "enable_mouse_button",
			controller = f1_arg1
		} )
		if not element:isInFocus() then
			if element:playClip( "LoseOver" ) then
				element.nextClip = "DefaultClip"
			else
				element:playClip( "DefaultClip" )
			end
		end
	end )
	f1_arg0:registerEventHandler( "button_action", function ( element, event )
		if event.isMouse then
			element:dispatchEventToParent( {
				name = "personalize_class_item",
				controller = f1_arg1
			} )
		end
	end )
end

local PostLoadFunc = function ( f5_arg0, f5_arg1 )
	if CoD.isPC then
		f0_local0( f5_arg0, f5_arg1 )
	end
end

CoD.VariantOptionsButton = InheritFrom( LUI.UIElement )
CoD.VariantOptionsButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.VariantOptionsButton )
	self.id = "VariantOptionsButton"
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
	
	local imageIcon = LUI.UIImage.new()
	imageIcon:setLeftRight( true, true, 0, 0 )
	imageIcon:setTopBottom( true, true, 0, 0 )
	imageIcon:setAlpha( 0 )
	imageIcon:setImage( RegisterImage( "uie_t7_menu_cacselection_personalizebutton" ) )
	self:addElement( imageIcon )
	self.imageIcon = imageIcon
	
	local itemHintText = CoD.ItemHintText.new( menu, controller )
	itemHintText:setLeftRight( true, false, -90, 20 )
	itemHintText:setTopBottom( false, true, 0, 30 )
	itemHintText:setAlpha( 0 )
	itemHintText.textCenterAlign:setText( Engine.Localize( "MENU_GUNSMITH_VARIANT_OPTIONS" ) )
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
				imageIcon:completeAnimation()
				self.imageIcon:setAlpha( 0 )
				self.clipFinished( imageIcon, {} )
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
				imageIcon:completeAnimation()
				self.imageIcon:setRGB( 1, 1, 1 )
				self.imageIcon:setAlpha( 0.75 )
				self.imageIcon:setScale( 1 )
				self.clipFinished( imageIcon, {} )
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
				imageIcon:completeAnimation()
				self.imageIcon:setRGB( 0.78, 0.78, 0.78 )
				self.imageIcon:setAlpha( 1 )
				self.imageIcon:setScale( 1.2 )
				self.clipFinished( imageIcon, {} )
				itemHintText:completeAnimation()
				self.itemHintText:setLeftRight( true, false, -91, 22 )
				self.itemHintText:setTopBottom( false, true, 3, 33 )
				self.itemHintText:setAlpha( 1 )
				self.clipFinished( itemHintText, {} )
				hintArrow:completeAnimation()
				self.hintArrow:setAlpha( 0 )
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
				local imageIconFrame2 = function ( imageIcon, event )
					if not event.interrupted then
						imageIcon:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					imageIcon:setRGB( 0.78, 0.78, 0.78 )
					imageIcon:setAlpha( 1 )
					imageIcon:setScale( 1.2 )
					if event.interrupted then
						self.clipFinished( imageIcon, event )
					else
						imageIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				imageIcon:completeAnimation()
				self.imageIcon:setRGB( 0.2, 0.2, 0.2 )
				self.imageIcon:setAlpha( 1 )
				self.imageIcon:setScale( 1 )
				imageIconFrame2( imageIcon, {} )
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
				local imageIconFrame2 = function ( imageIcon, event )
					if not event.interrupted then
						imageIcon:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					imageIcon:setRGB( 0.2, 0.2, 0.2 )
					imageIcon:setAlpha( 1 )
					imageIcon:setScale( 1 )
					if event.interrupted then
						self.clipFinished( imageIcon, event )
					else
						imageIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				imageIcon:completeAnimation()
				self.imageIcon:setRGB( 0.78, 0.78, 0.78 )
				self.imageIcon:setAlpha( 1 )
				self.imageIcon:setScale( 1.2 )
				imageIconFrame2( imageIcon, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f21_local0 = IsPC()
				if f21_local0 then
					if not IsGamepad( controller ) then
						f21_local0 = Gunsmith_IsVariantOccupied( element, controller )
					else
						f21_local0 = false
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.itemHintText:close()
		element.hintArrow:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

