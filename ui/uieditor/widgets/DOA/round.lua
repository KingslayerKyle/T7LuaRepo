-- bc9f6cad64c13ae2904c87466f95abc2
-- This hash is used for caching, delete to decompile the file again

CoD.round = InheritFrom( LUI.UIElement )
CoD.round.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.round )
	self.id = "round"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1152 )
	self:setTopBottom( true, false, 0, 77 )
	
	local txtRound0 = LUI.UIText.new()
	txtRound0:setLeftRight( true, true, 2, 2 )
	txtRound0:setTopBottom( true, true, 2, 2 )
	txtRound0:setRGB( 0, 0, 0 )
	txtRound0:setAlpha( 0.85 )
	txtRound0:setText( Engine.Localize( "DOA_ROUNDCOMPLETE" ) )
	txtRound0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	txtRound0:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	txtRound0:setShaderVector( 0, 0.02, 0, 0, 0 )
	txtRound0:setShaderVector( 1, 0.06, 0, 0, 0 )
	txtRound0:setShaderVector( 2, 1, 0, 0, 0 )
	txtRound0:setLetterSpacing( 1 )
	txtRound0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	txtRound0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( txtRound0 )
	self.txtRound0 = txtRound0
	
	local txtRound = LUI.UIText.new()
	txtRound:setLeftRight( true, true, 0, 0 )
	txtRound:setTopBottom( true, true, 0, 0 )
	txtRound:setText( Engine.Localize( "DOA_ROUNDCOMPLETE" ) )
	txtRound:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	txtRound:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	txtRound:setShaderVector( 0, 0.02, 0, 0, 0 )
	txtRound:setShaderVector( 1, 0.06, 0, 0, 0 )
	txtRound:setShaderVector( 2, 1, 0, 0, 0 )
	txtRound:setLetterSpacing( 1 )
	txtRound:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	txtRound:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( txtRound )
	self.txtRound = txtRound
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				local txtRound0Frame2 = function ( txtRound0, event )
					if not event.interrupted then
						txtRound0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					txtRound0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( txtRound0, event )
					else
						txtRound0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				txtRound0:completeAnimation()
				self.txtRound0:setAlpha( 0 )
				txtRound0Frame2( txtRound0, {} )
				local txtRoundFrame2 = function ( txtRound, event )
					if not event.interrupted then
						txtRound:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					txtRound:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( txtRound, event )
					else
						txtRound:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				txtRound:completeAnimation()
				self.txtRound:setAlpha( 0 )
				txtRoundFrame2( txtRound, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				txtRound0:completeAnimation()
				self.txtRound0:setAlpha( 0 )
				self.clipFinished( txtRound0, {} )

				txtRound:completeAnimation()
				self.txtRound:setAlpha( 0 )
				self.clipFinished( txtRound, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
