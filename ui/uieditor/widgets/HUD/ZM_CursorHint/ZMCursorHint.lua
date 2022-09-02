-- 631a4a037e03328519afe07dc0ba9e37
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.ZM_Notif.ZmNotif1_CursorHint" )
require( "ui.uieditor.widgets.MPHudWidgets.cursorhint_image" )

CoD.ZMCursorHint = InheritFrom( LUI.UIElement )
CoD.ZMCursorHint.new = function ( menu, controller )
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
	self:setClass( CoD.ZMCursorHint )
	self.id = "ZMCursorHint"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 500 )
	self:setTopBottom( true, false, 0, 90 )
	self.anyChildUsesUpdateState = true
	
	local cursorhinttext0 = CoD.ZmNotif1_CursorHint.new( menu, controller )
	cursorhinttext0:setLeftRight( false, false, -242.5, 120.17 )
	cursorhinttext0:setTopBottom( true, false, 0, 19 )
	cursorhinttext0:subscribeToGlobalModel( controller, "HUDItems", "cursorHintText", function ( model )
		local cursorHintText = Engine.GetModelValue( model )
		if cursorHintText then
			cursorhinttext0.CursorHintText:setText( Engine.Localize( cursorHintText ) )
		end
	end )
	self:addElement( cursorhinttext0 )
	self.cursorhinttext0 = cursorhinttext0
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 370.17, 384.5 )
	Image0:setTopBottom( true, false, -46.37, 81.63 )
	Image0:setAlpha( 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local cursorhintimage0 = CoD.cursorhint_image.new( menu, controller )
	cursorhintimage0:setLeftRight( false, false, 134.5, 242.5 )
	cursorhintimage0:setTopBottom( true, false, -17.5, 36.5 )
	cursorhintimage0:subscribeToGlobalModel( controller, "HUDItems", "cursorHintImage", function ( model )
		local cursorHintImage = Engine.GetModelValue( model )
		if cursorHintImage then
			cursorhintimage0.c1x1:setImage( RegisterImage( cursorHintImage ) )
		end
	end )
	cursorhintimage0:subscribeToGlobalModel( controller, "HUDItems", "cursorHintImage", function ( model )
		local cursorHintImage = Engine.GetModelValue( model )
		if cursorHintImage then
			cursorhintimage0.x1x4:setImage( RegisterImage( cursorHintImage ) )
		end
	end )
	cursorhintimage0:subscribeToGlobalModel( controller, "HUDItems", "cursorHintImage", function ( model )
		local cursorHintImage = Engine.GetModelValue( model )
		if cursorHintImage then
			cursorhintimage0.c1x2:setImage( RegisterImage( cursorHintImage ) )
		end
	end )
	cursorhintimage0:mergeStateConditions( {
		{
			stateName = "Active_1x1",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "hudItems.cursorHintIconRatio", 1 )
			end
		},
		{
			stateName = "Active_2x1",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "hudItems.cursorHintIconRatio", 2 )
			end
		},
		{
			stateName = "Active_4x1",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "hudItems.cursorHintIconRatio", 4 )
			end
		}
	} )
	cursorhintimage0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.cursorHintIconRatio" ), function ( model )
		menu:updateElementState( cursorhintimage0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.cursorHintIconRatio"
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
				self.cursorhintimage0:setLeftRight( false, false, 120.17, 228.17 )
				self.cursorhintimage0:setTopBottom( true, false, -17.5, 36.5 )
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
					cursorhintimage0:setLeftRight( false, false, 120.17, 228.17 )
					cursorhintimage0:setTopBottom( true, false, -17.5, 36.5 )
					cursorhintimage0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( cursorhintimage0, event )
					else
						cursorhintimage0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				cursorhintimage0:completeAnimation()
				self.cursorhintimage0:setLeftRight( false, false, 120.17, 228.17 )
				self.cursorhintimage0:setTopBottom( true, false, -17.5, 36.5 )
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
					cursorhintimage0:setLeftRight( false, false, 120.17, 228.17 )
					cursorhintimage0:setTopBottom( true, false, -17.5, 36.5 )
					cursorhintimage0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( cursorhintimage0, event )
					else
						cursorhintimage0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				cursorhintimage0:completeAnimation()
				self.cursorhintimage0:setLeftRight( false, false, 120.17, 228.17 )
				self.cursorhintimage0:setTopBottom( true, false, -17.5, 36.5 )
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
					cursorhintimage0:setLeftRight( false, false, 120.17, 228.17 )
					cursorhintimage0:setTopBottom( true, false, -17.5, 36.5 )
					cursorhintimage0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( cursorhintimage0, event )
					else
						cursorhintimage0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				cursorhintimage0:completeAnimation()
				self.cursorhintimage0:setLeftRight( false, false, 120.17, 228.17 )
				self.cursorhintimage0:setTopBottom( true, false, -17.5, 36.5 )
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
		Active_NoImage = {
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

				cursorhintimage0:completeAnimation()
				self.cursorhintimage0:setLeftRight( false, false, 120.17, 120.17 )
				self.cursorhintimage0:setTopBottom( true, false, -17.5, 36.5 )
				self.clipFinished( cursorhintimage0, {} )
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.cursorhinttext0:close()
		element.cursorhintimage0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

