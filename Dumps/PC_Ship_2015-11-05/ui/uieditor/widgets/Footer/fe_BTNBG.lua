CoD.fe_BTNBG = InheritFrom( LUI.UIElement )
CoD.fe_BTNBG.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.fe_BTNBG )
	self.id = "fe_BTNBG"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 114 )
	self:setTopBottom( true, false, 0, 65 )
	
	local left = LUI.UIImage.new()
	left:setLeftRight( true, false, 0, 26 )
	left:setTopBottom( true, true, 0, 0 )
	left:setImage( RegisterImage( "uie_t7_fe_footer_btn_frame_leftshader_bg" ) )
	left:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	left:setShaderVector( 0, 0, 20, 0, 0 )
	self:addElement( left )
	self.left = left
	
	local Right = LUI.UIImage.new()
	Right:setLeftRight( false, true, -26, 0 )
	Right:setTopBottom( true, true, 0, 0 )
	Right:setImage( RegisterImage( "uie_t7_fe_footer_btn_frame_shaderrightbg" ) )
	Right:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	Right:setShaderVector( 0, 0, 20, 0, 0 )
	self:addElement( Right )
	self.Right = Right
	
	local line = LUI.UIImage.new()
	line:setLeftRight( true, true, 26, -26 )
	line:setTopBottom( true, true, 0, 0 )
	line:setImage( RegisterImage( "uie_t7_fe_footer_btn_frame_linesshadertopandbotbg" ) )
	line:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	line:setShaderVector( 0, 3, 20, 0, 0 )
	self:addElement( line )
	self.line = line
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				left:completeAnimation()
				self.left:setAlpha( 1 )
				self.clipFinished( left, {} )
				Right:completeAnimation()
				self.Right:setAlpha( 1 )
				self.clipFinished( Right, {} )
				line:completeAnimation()
				self.line:setAlpha( 1 )
				self.clipFinished( line, {} )
			end
		},
		Transparent = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				left:completeAnimation()
				self.left:setRGB( 0, 0, 0 )
				self.left:setAlpha( 1 )
				self.clipFinished( left, {} )
				Right:completeAnimation()
				self.Right:setRGB( 0, 0, 0 )
				self.Right:setAlpha( 1 )
				self.clipFinished( Right, {} )
				line:completeAnimation()
				self.line:setRGB( 0, 0, 0 )
				self.line:setAlpha( 1 )
				self.clipFinished( line, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 3 )
				local leftFrame2 = function ( left, event )
					if not event.interrupted then
						left:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					left:setRGB( 1, 1, 1 )
					left:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( left, event )
					else
						left:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				left:completeAnimation()
				self.left:setRGB( 0, 0, 0 )
				self.left:setAlpha( 1 )
				leftFrame2( left, {} )
				local RightFrame2 = function ( Right, event )
					if not event.interrupted then
						Right:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Right:setRGB( 1, 1, 1 )
					Right:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Right, event )
					else
						Right:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Right:completeAnimation()
				self.Right:setRGB( 0, 0, 0 )
				self.Right:setAlpha( 1 )
				RightFrame2( Right, {} )
				local lineFrame2 = function ( line, event )
					if not event.interrupted then
						line:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					line:setRGB( 1, 1, 1 )
					line:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( line, event )
					else
						line:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				line:completeAnimation()
				self.line:setRGB( 0, 0, 0 )
				self.line:setAlpha( 1 )
				lineFrame2( line, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Transparent",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "hideWorldForStreamer", 1 )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "hideWorldForStreamer" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hideWorldForStreamer"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

