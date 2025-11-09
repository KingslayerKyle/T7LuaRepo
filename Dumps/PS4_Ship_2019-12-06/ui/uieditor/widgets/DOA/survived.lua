CoD.survived = InheritFrom( LUI.UIElement )
CoD.survived.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.survived )
	self.id = "survived"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 312 )
	self:setTopBottom( true, false, 0, 60 )
	
	local txt0 = LUI.UIText.new()
	txt0:setLeftRight( true, true, 16, -12 )
	txt0:setTopBottom( true, true, 10, -6 )
	txt0:setRGB( 0, 0, 0 )
	txt0:setAlpha( 0.85 )
	txt0:setText( Engine.Localize( "DOA_SURVIVED" ) )
	txt0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	txt0:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	txt0:setShaderVector( 0, 0.02, 0, 0, 0 )
	txt0:setShaderVector( 1, 0.06, 0, 0, 0 )
	txt0:setShaderVector( 2, 1, 0, 0, 0 )
	txt0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	txt0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( txt0 )
	self.txt0 = txt0
	
	local txt = LUI.UIText.new()
	txt:setLeftRight( true, true, 14, -14 )
	txt:setTopBottom( true, true, 8, -8 )
	txt:setText( Engine.Localize( "DOA_SURVIVED" ) )
	txt:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	txt:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	txt:setShaderVector( 0, 0.02, 0, 0, 0 )
	txt:setShaderVector( 1, 0.06, 0, 0, 0 )
	txt:setShaderVector( 2, 1, 0, 0, 0 )
	txt:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	txt:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( txt )
	self.txt = txt
	
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
				
				txt0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
				self.txt0:setAlpha( 0 )
				txt0:registerEventHandler( "transition_complete_keyframe", f2_local0 )
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
				
				txt:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
				self.txt:setAlpha( 0 )
				txt:registerEventHandler( "transition_complete_keyframe", f2_local1 )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				txt0:completeAnimation()
				self.txt0:setAlpha( 0 )
				self.clipFinished( txt0, {} )
				txt:completeAnimation()
				self.txt:setAlpha( 0 )
				self.clipFinished( txt, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

