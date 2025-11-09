require( "ui.uieditor.widgets.MPHudWidgets.cursorhint_text" )
require( "ui.uieditor.widgets.MPHudWidgets.cursorhint_image" )

CoD.CursorHint = InheritFrom( LUI.UIElement )
CoD.CursorHint.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 0
	} )
	self:setAlignment( LUI.Alignment.Center )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CursorHint )
	self.id = "CursorHint"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 500 )
	self:setTopBottom( true, false, 0, 90 )
	self.anyChildUsesUpdateState = true
	
	local cursorhinttext0 = CoD.cursorhint_text.new( menu, controller )
	cursorhinttext0:setLeftRight( true, false, 71.33, 306.33 )
	cursorhinttext0:setTopBottom( true, false, 0, 19 )
	cursorhinttext0:setRGB( 1, 1, 1 )
	cursorhinttext0.FEButtonPanel0:setRGB( 0, 0, 0 )
	cursorhinttext0.FEButtonPanel0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( cursorhinttext0 )
	self.cursorhinttext0 = cursorhinttext0
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 306.33, 320.67 )
	Image0:setTopBottom( true, false, -46.37, 81.63 )
	Image0:setRGB( 1, 1, 1 )
	Image0:setAlpha( 0 )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local cursorhintimage0 = CoD.cursorhint_image.new( menu, controller )
	cursorhintimage0:setLeftRight( true, false, 320.67, 428.67 )
	cursorhintimage0:setTopBottom( true, false, -17.5, 36.5 )
	cursorhintimage0:setRGB( 1, 1, 1 )
	cursorhintimage0:subscribeToGlobalModel( controller, "HUDItems", "cursorHintImage", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			cursorhintimage0.c1x1:setImage( RegisterImage( modelValue ) )
		end
	end )
	cursorhintimage0:subscribeToGlobalModel( controller, "HUDItems", "cursorHintImage", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			cursorhintimage0.x1x4:setImage( RegisterImage( modelValue ) )
		end
	end )
	cursorhintimage0:subscribeToGlobalModel( controller, "HUDItems", "cursorHintImage", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			cursorhintimage0.c1x2:setImage( RegisterImage( modelValue ) )
		end
	end )
	cursorhintimage0:mergeStateConditions( {
		{
			stateName = "Active_1x1",
			condition = function ( menu, element, event )
				local f5_local0 = IsCursorHintActive( controller )
				if f5_local0 then
					if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING ) or Engine.GetModelValue( Engine.GetModel( DataSources.HUDItems.getModel( controller ), "cursorHintIconRatio" ) ) ~= 1 then
						f5_local0 = false
					else
						f5_local0 = true
					end
				end
				return f5_local0
			end
		},
		{
			stateName = "Active_2x1",
			condition = function ( menu, element, event )
				local f6_local0 = IsCursorHintActive( controller )
				if f6_local0 then
					if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING ) or Engine.GetModelValue( Engine.GetModel( DataSources.HUDItems.getModel( controller ), "cursorHintIconRatio" ) ) ~= 2 then
						f6_local0 = false
					else
						f6_local0 = true
					end
				end
				return f6_local0
			end
		},
		{
			stateName = "Active_4x1",
			condition = function ( menu, element, event )
				local f7_local0 = IsCursorHintActive( controller )
				if f7_local0 then
					if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING ) or Engine.GetModelValue( Engine.GetModel( DataSources.HUDItems.getModel( controller ), "cursorHintIconRatio" ) ) ~= 4 then
						f7_local0 = false
					else
						f7_local0 = true
					end
				end
				return f7_local0
			end
		}
	} )
	cursorhintimage0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.showCursorHint" ), function ( model )
		menu:updateElementState( cursorhintimage0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.showCursorHint"
		} )
	end )
	if cursorhintimage0.m_eventHandlers.hud_update_refresh then
		local currentEv = cursorhintimage0.m_eventHandlers.hud_update_refresh
		cursorhintimage0:registerEventHandler( "hud_update_refresh", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		cursorhintimage0:registerEventHandler( "hud_update_refresh", LUI.UIElement.updateState )
	end
	cursorhintimage0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ), function ( model )
		menu:updateElementState( cursorhintimage0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED
		} )
	end )
	cursorhintimage0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), function ( model )
		menu:updateElementState( cursorhintimage0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE
		} )
	end )
	cursorhintimage0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ), function ( model )
		menu:updateElementState( cursorhintimage0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT
		} )
	end )
	cursorhintimage0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), function ( model )
		menu:updateElementState( cursorhintimage0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE
		} )
	end )
	cursorhintimage0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK ), function ( model )
		menu:updateElementState( cursorhintimage0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK
		} )
	end )
	cursorhintimage0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING ), function ( model )
		menu:updateElementState( cursorhintimage0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING
		} )
	end )
	self:addElement( cursorhintimage0 )
	self.cursorhintimage0 = cursorhintimage0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				cursorhinttext0:completeAnimation()
				self.cursorhinttext0:setAlpha( 0 )
				self.clipFinished( cursorhinttext0, {} )
				cursorhintimage0:completeAnimation()
				self.cursorhintimage0:setAlpha( 0 )
				self.clipFinished( cursorhintimage0, {} )
			end
		},
		Active_1x1 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local cursorhinttext0Frame2 = function ( cursorhinttext0, event )
					if not event.interrupted then
						cursorhinttext0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					cursorhinttext0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( cursorhinttext0, event )
					else
						cursorhinttext0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				cursorhinttext0:completeAnimation()
				self.cursorhinttext0:setAlpha( 0.44 )
				cursorhinttext0Frame2( cursorhinttext0, {} )
				local cursorhintimage0Frame2 = function ( cursorhintimage0, event )
					if not event.interrupted then
						cursorhintimage0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					cursorhintimage0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( cursorhintimage0, event )
					else
						cursorhintimage0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				cursorhintimage0:completeAnimation()
				self.cursorhintimage0:setAlpha( 0.36 )
				cursorhintimage0Frame2( cursorhintimage0, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 2 )
				local cursorhinttext0Frame2 = function ( cursorhinttext0, event )
					if not event.interrupted then
						cursorhinttext0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Bounce )
					end
					cursorhinttext0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( cursorhinttext0, event )
					else
						cursorhinttext0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				cursorhinttext0:completeAnimation()
				self.cursorhinttext0:setAlpha( 1 )
				cursorhinttext0Frame2( cursorhinttext0, {} )
				local cursorhintimage0Frame2 = function ( cursorhintimage0, event )
					if not event.interrupted then
						cursorhintimage0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Bounce )
					end
					cursorhintimage0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( cursorhintimage0, event )
					else
						cursorhintimage0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				cursorhintimage0:completeAnimation()
				self.cursorhintimage0:setAlpha( 1 )
				cursorhintimage0Frame2( cursorhintimage0, {} )
			end
		},
		Active_2x1 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local cursorhinttext0Frame2 = function ( cursorhinttext0, event )
					if not event.interrupted then
						cursorhinttext0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					cursorhinttext0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( cursorhinttext0, event )
					else
						cursorhinttext0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				cursorhinttext0:completeAnimation()
				self.cursorhinttext0:setAlpha( 0.41 )
				cursorhinttext0Frame2( cursorhinttext0, {} )
				local cursorhintimage0Frame2 = function ( cursorhintimage0, event )
					if not event.interrupted then
						cursorhintimage0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					cursorhintimage0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( cursorhintimage0, event )
					else
						cursorhintimage0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				cursorhintimage0:completeAnimation()
				self.cursorhintimage0:setAlpha( 0.37 )
				cursorhintimage0Frame2( cursorhintimage0, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 2 )
				local cursorhinttext0Frame2 = function ( cursorhinttext0, event )
					if not event.interrupted then
						cursorhinttext0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Bounce )
					end
					cursorhinttext0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( cursorhinttext0, event )
					else
						cursorhinttext0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				cursorhinttext0:completeAnimation()
				self.cursorhinttext0:setAlpha( 1 )
				cursorhinttext0Frame2( cursorhinttext0, {} )
				local cursorhintimage0Frame2 = function ( cursorhintimage0, event )
					if not event.interrupted then
						cursorhintimage0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Bounce )
					end
					cursorhintimage0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( cursorhintimage0, event )
					else
						cursorhintimage0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				cursorhintimage0:completeAnimation()
				self.cursorhintimage0:setAlpha( 1 )
				cursorhintimage0Frame2( cursorhintimage0, {} )
			end
		},
		Active_4x1 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local cursorhinttext0Frame2 = function ( cursorhinttext0, event )
					if not event.interrupted then
						cursorhinttext0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					cursorhinttext0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( cursorhinttext0, event )
					else
						cursorhinttext0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				cursorhinttext0:completeAnimation()
				self.cursorhinttext0:setAlpha( 0.45 )
				cursorhinttext0Frame2( cursorhinttext0, {} )
				local cursorhintimage0Frame2 = function ( cursorhintimage0, event )
					if not event.interrupted then
						cursorhintimage0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					cursorhintimage0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( cursorhintimage0, event )
					else
						cursorhintimage0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				cursorhintimage0:completeAnimation()
				self.cursorhintimage0:setAlpha( 0.32 )
				cursorhintimage0Frame2( cursorhintimage0, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 2 )
				local cursorhinttext0Frame2 = function ( cursorhinttext0, event )
					if not event.interrupted then
						cursorhinttext0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Bounce )
					end
					cursorhinttext0:setAlpha( 0.45 )
					if event.interrupted then
						self.clipFinished( cursorhinttext0, event )
					else
						cursorhinttext0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				cursorhinttext0:completeAnimation()
				self.cursorhinttext0:setAlpha( 1 )
				cursorhinttext0Frame2( cursorhinttext0, {} )
				local cursorhintimage0Frame2 = function ( cursorhintimage0, event )
					if not event.interrupted then
						cursorhintimage0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Bounce )
					end
					cursorhintimage0:setAlpha( 0.32 )
					if event.interrupted then
						self.clipFinished( cursorhintimage0, event )
					else
						cursorhintimage0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				cursorhintimage0:completeAnimation()
				self.cursorhintimage0:setAlpha( 1 )
				cursorhintimage0Frame2( cursorhintimage0, {} )
			end
		},
		Out = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local cursorhinttext0Frame2 = function ( cursorhinttext0, event )
					if not event.interrupted then
						cursorhinttext0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Bounce )
					end
					cursorhinttext0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( cursorhinttext0, event )
					else
						cursorhinttext0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				cursorhinttext0:completeAnimation()
				self.cursorhinttext0:setAlpha( 1 )
				cursorhinttext0Frame2( cursorhinttext0, {} )
				local cursorhintimage0Frame2 = function ( cursorhintimage0, event )
					if not event.interrupted then
						cursorhintimage0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Bounce )
					end
					cursorhintimage0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( cursorhintimage0, event )
					else
						cursorhintimage0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				cursorhintimage0:completeAnimation()
				self.cursorhintimage0:setAlpha( 1 )
				cursorhintimage0Frame2( cursorhintimage0, {} )
			end
		}
	}
	self.close = function ( self )
		self.cursorhinttext0:close()
		self.cursorhintimage0:close()
		CoD.CursorHint.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

