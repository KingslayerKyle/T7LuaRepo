require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.HintTextArrow" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.ItemHintText" )

local PCSpecific = function ( self, controller )
	self:setHandleMouse( true )
	self:registerEventHandler( "mouseenter", function ( self, event )
		self:dispatchEventToParent( {
			name = "disable_mouse_button",
			controller = controller
		} )
		if self:playClip( "GainOver" ) then
			self.nextClip = "Over"
		else
			self:playClip( "Over" )
		end
	end )
	self:registerEventHandler( "mouseleave", function ( self, event )
		self:dispatchEventToParent( {
			name = "enable_mouse_button",
			controller = controller
		} )
		if not self:isInFocus() then
			if self:playClip( "LoseOver" ) then
				self.nextClip = "DefaultClip"
			else
				self:playClip( "DefaultClip" )
			end
		end
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
	self:setLeftRight( 0, 0, 0, 30 )
	self:setTopBottom( 0, 0, 0, 30 )
	self.anyChildUsesUpdateState = true
	
	local Whitebox = LUI.UIImage.new()
	Whitebox:setLeftRight( 0, 0, 0, 30 )
	Whitebox:setTopBottom( 0, 0, 0, 30 )
	Whitebox:setRGB( 0.52, 0.52, 0.52 )
	Whitebox:setAlpha( 0 )
	self:addElement( Whitebox )
	self.Whitebox = Whitebox
	
	local fullBacking = LUI.UIImage.new()
	fullBacking:setLeftRight( 0, 1, 0, 0 )
	fullBacking:setTopBottom( 0, 1, 0, 0 )
	fullBacking:setRGB( 0, 0, 0 )
	fullBacking:setAlpha( 0 )
	self:addElement( fullBacking )
	self.fullBacking = fullBacking
	
	local imageIcon = LUI.UIImage.new()
	imageIcon:setLeftRight( 0, 1, 0, 0 )
	imageIcon:setTopBottom( 0, 1, 0, 0 )
	imageIcon:setAlpha( 0 )
	imageIcon:setImage( RegisterImage( "uie_t7_menu_cacselection_personalizebutton" ) )
	self:addElement( imageIcon )
	self.imageIcon = imageIcon
	
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
	itemHintText:setLeftRight( 0, 0, -135, 30 )
	itemHintText:setTopBottom( 1, 1, 0, 45 )
	itemHintText:setAlpha( 0 )
	itemHintText.textCenterAlign:setText( Engine.Localize( "MENU_GUNSMITH_VARIANT_OPTIONS" ) )
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
		imageIcon:completeAnimation()
		fullBacking:completeAnimation()
		itemHintText:completeAnimation()
		imageIcon:setRGB( 1, 1, 1 )
		imageIcon:setAlpha( 0 )
		imageIcon:setScale( 1 )
		fullBacking:setAlpha( 0 )
		fullBacking:setScale( 1 )
		itemHintText:setLeftRight( 0, 0, -135, 30 )
		itemHintText:setTopBottom( 1, 1, 0, 45 )
		itemHintText:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Visible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				imageIcon:completeAnimation()
				self.imageIcon:setAlpha( 0.75 )
				self.clipFinished( imageIcon, {} )
			end,
			Over = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
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
				self.itemHintText:setLeftRight( 0, 0, -136.5, 33.5 )
				self.itemHintText:setTopBottom( 1, 1, 5, 50 )
				self.itemHintText:setAlpha( 1 )
				self.clipFinished( itemHintText, {} )
			end,
			GainOver = function ()
				self.resetProperties()
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
				self.resetProperties()
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
				local f22_local0 = IsPC()
				if f22_local0 then
					if not IsGamepad( controller ) then
						f22_local0 = Gunsmith_IsVariantOccupied( element, controller )
					else
						f22_local0 = false
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

