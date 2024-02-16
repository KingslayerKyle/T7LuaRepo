-- c7fb0ca8f1f8337eb71e28200692c8a2
-- This hash is used for caching, delete to decompile the file again

CoD.teleporter = InheritFrom( LUI.UIElement )
CoD.teleporter.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.teleporter )
	self.id = "teleporter"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 312 )
	self:setTopBottom( true, false, 0, 60 )
	
	local textshadow = LUI.UIText.new()
	textshadow:setLeftRight( true, true, -318, 344 )
	textshadow:setTopBottom( true, true, 10, -6 )
	textshadow:setRGB( 0, 0, 0 )
	textshadow:setAlpha( 0.85 )
	textshadow:setText( Engine.Localize( "DOA_TELEPORTER" ) )
	textshadow:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	textshadow:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	textshadow:setShaderVector( 0, 0.02, 0, 0, 0 )
	textshadow:setShaderVector( 1, 0.06, 0, 0, 0 )
	textshadow:setShaderVector( 2, 1, 0, 0, 0 )
	textshadow:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	textshadow:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( textshadow )
	self.textshadow = textshadow
	
	local text = LUI.UIText.new()
	text:setLeftRight( true, true, -318, 344 )
	text:setTopBottom( true, true, 8, -8 )
	text:setText( Engine.Localize( "DOA_TELEPORTER" ) )
	text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	text:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	text:setShaderVector( 0, 0.02, 0, 0, 0 )
	text:setShaderVector( 1, 0.06, 0, 0, 0 )
	text:setShaderVector( 2, 1, 0, 0, 0 )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( text )
	self.text = text
	
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
				
				textshadow:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
				self.textshadow:setAlpha( 0 )
				textshadow:registerEventHandler( "transition_complete_keyframe", f2_local0 )
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
				
				text:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
				self.text:setAlpha( 0 )
				text:registerEventHandler( "transition_complete_keyframe", f2_local1 )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				textshadow:completeAnimation()
				self.textshadow:setAlpha( 0 )
				self.clipFinished( textshadow, {} )

				text:completeAnimation()
				self.text:setAlpha( 0 )
				self.clipFinished( text, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
