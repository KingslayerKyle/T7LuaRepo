-- 7e94fc6aef1137f5e28b4a9ed46a8062
-- This hash is used for caching, delete to decompile the file again

CoD.choosepath = InheritFrom( LUI.UIElement )
CoD.choosepath.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.choosepath )
	self.id = "choosepath"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 312 )
	self:setTopBottom( true, false, 0, 60 )
	
	local txtChoosePath0 = LUI.UIText.new()
	txtChoosePath0:setLeftRight( true, true, 16, -12 )
	txtChoosePath0:setTopBottom( true, true, 10, -6 )
	txtChoosePath0:setRGB( 0, 0, 0 )
	txtChoosePath0:setAlpha( 0.85 )
	txtChoosePath0:setText( Engine.Localize( "DOA_CHOOSEPATH" ) )
	txtChoosePath0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	txtChoosePath0:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	txtChoosePath0:setShaderVector( 0, 0.02, 0, 0, 0 )
	txtChoosePath0:setShaderVector( 1, 0.06, 0, 0, 0 )
	txtChoosePath0:setShaderVector( 2, 1, 0, 0, 0 )
	txtChoosePath0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	txtChoosePath0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( txtChoosePath0 )
	self.txtChoosePath0 = txtChoosePath0
	
	local txtChoosePath = LUI.UIText.new()
	txtChoosePath:setLeftRight( true, true, 14, -14 )
	txtChoosePath:setTopBottom( true, true, 8, -8 )
	txtChoosePath:setText( Engine.Localize( "DOA_CHOOSEPATH" ) )
	txtChoosePath:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	txtChoosePath:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	txtChoosePath:setShaderVector( 0, 0.02, 0, 0, 0 )
	txtChoosePath:setShaderVector( 1, 0.06, 0, 0, 0 )
	txtChoosePath:setShaderVector( 2, 1, 0, 0, 0 )
	txtChoosePath:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	txtChoosePath:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( txtChoosePath )
	self.txtChoosePath = txtChoosePath
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local f2_local0 = function ( f3_arg0, f3_arg1 )
					if not f3_arg1.interrupted then
						f3_arg0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					f3_arg0:setAlpha( 0.85 )
					if f3_arg1.interrupted then
						self.clipFinished( f3_arg0, f3_arg1 )
					else
						f3_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				txtChoosePath0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
				self.txtChoosePath0:setAlpha( 0 )
				txtChoosePath0:registerEventHandler( "transition_complete_keyframe", f2_local0 )
				local f2_local1 = function ( f4_arg0, f4_arg1 )
					if not f4_arg1.interrupted then
						f4_arg0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					f4_arg0:setAlpha( 1 )
					if f4_arg1.interrupted then
						self.clipFinished( f4_arg0, f4_arg1 )
					else
						f4_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				txtChoosePath:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
				self.txtChoosePath:setAlpha( 0 )
				txtChoosePath:registerEventHandler( "transition_complete_keyframe", f2_local1 )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				txtChoosePath0:completeAnimation()
				self.txtChoosePath0:setAlpha( 0 )
				self.clipFinished( txtChoosePath0, {} )
				txtChoosePath:completeAnimation()
				self.txtChoosePath:setAlpha( 0 )
				self.clipFinished( txtChoosePath, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

