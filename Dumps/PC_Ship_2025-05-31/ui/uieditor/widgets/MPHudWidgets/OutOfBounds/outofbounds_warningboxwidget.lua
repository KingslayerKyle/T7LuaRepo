require( "ui.uieditor.widgets.MPHudWidgets.OutOfBounds.outofbounds_returnbox" )

CoD.outofbounds_warningboxwidget = InheritFrom( LUI.UIElement )
CoD.outofbounds_warningboxwidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.outofbounds_warningboxwidget )
	self.id = "outofbounds_warningboxwidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 665 )
	self:setTopBottom( true, false, 0, 189 )
	self.anyChildUsesUpdateState = true
	
	local CenterBox0 = LUI.UIImage.new()
	CenterBox0:setLeftRight( false, false, -332.38, 332.38 )
	CenterBox0:setTopBottom( false, false, -94.73, 94.73 )
	CenterBox0:setRGB( 0.73, 0, 0 )
	CenterBox0:setAlpha( 0.5 )
	CenterBox0:setZoom( -30 )
	CenterBox0:setImage( RegisterImage( "uie_t7_hud_outofbounds_centerbox" ) )
	CenterBox0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CenterBox0 )
	self.CenterBox0 = CenterBox0
	
	local CenterBox = LUI.UIImage.new()
	CenterBox:setLeftRight( false, false, -332.38, 332.38 )
	CenterBox:setTopBottom( false, false, -94.73, 94.73 )
	CenterBox:setRGB( 0.73, 0, 0 )
	CenterBox:setImage( RegisterImage( "uie_t7_hud_outofbounds_centerbox" ) )
	CenterBox:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CenterBox )
	self.CenterBox = CenterBox
	
	local TextBoxWarningText20 = LUI.UIText.new()
	TextBoxWarningText20:setLeftRight( false, false, -332.38, 332.38 )
	TextBoxWarningText20:setTopBottom( false, false, -58.5, 27.5 )
	TextBoxWarningText20:setAlpha( 0.5 )
	TextBoxWarningText20:setZoom( -30 )
	TextBoxWarningText20:setText( Engine.Localize( "MPUI_OUT_OF_BOUNDS_WARNING" ) )
	TextBoxWarningText20:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	TextBoxWarningText20:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	TextBoxWarningText20:setShaderVector( 0, 0.1, 0, 0, 0 )
	TextBoxWarningText20:setShaderVector( 1, 0, 0, 0, 0 )
	TextBoxWarningText20:setShaderVector( 2, 1, 0, 0, 0 )
	TextBoxWarningText20:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	TextBoxWarningText20:setLetterSpacing( 7.5 )
	TextBoxWarningText20:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBoxWarningText20:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBoxWarningText20 )
	self.TextBoxWarningText20 = TextBoxWarningText20
	
	local TextBoxWarningText2 = LUI.UIText.new()
	TextBoxWarningText2:setLeftRight( false, false, -332.38, 332.38 )
	TextBoxWarningText2:setTopBottom( false, false, -58.5, 27.5 )
	TextBoxWarningText2:setAlpha( 0.9 )
	TextBoxWarningText2:setText( Engine.Localize( "MPUI_OUT_OF_BOUNDS_WARNING" ) )
	TextBoxWarningText2:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	TextBoxWarningText2:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	TextBoxWarningText2:setShaderVector( 0, 0.1, 0, 0, 0 )
	TextBoxWarningText2:setShaderVector( 1, 0, 0, 0, 0 )
	TextBoxWarningText2:setShaderVector( 2, 1, 0, 0, 0 )
	TextBoxWarningText2:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	TextBoxWarningText2:setLetterSpacing( 7.5 )
	TextBoxWarningText2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBoxWarningText2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBoxWarningText2 )
	self.TextBoxWarningText2 = TextBoxWarningText2
	
	local outofboundsreturnbox = CoD.outofbounds_returnbox.new( menu, controller )
	outofboundsreturnbox:setLeftRight( false, false, -218.5, 216.5 )
	outofboundsreturnbox:setTopBottom( false, false, 23.5, 53.5 )
	self:addElement( outofboundsreturnbox )
	self.outofboundsreturnbox = outofboundsreturnbox
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				local CenterBox0Frame2 = function ( CenterBox0, event )
					local CenterBox0Frame3 = function ( CenterBox0, event )
						if not event.interrupted then
							CenterBox0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						end
						CenterBox0:setAlpha( 0.5 )
						CenterBox0:setZoom( -50 )
						if event.interrupted then
							self.clipFinished( CenterBox0, event )
						else
							CenterBox0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CenterBox0Frame3( CenterBox0, event )
						return 
					else
						CenterBox0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						CenterBox0:setAlpha( 0 )
						CenterBox0:registerEventHandler( "transition_complete_keyframe", CenterBox0Frame3 )
					end
				end
				
				CenterBox0:completeAnimation()
				self.CenterBox0:setAlpha( 0.5 )
				self.CenterBox0:setZoom( -50 )
				CenterBox0Frame2( CenterBox0, {} )
				CenterBox:completeAnimation()
				self.CenterBox:setAlpha( 1 )
				self.clipFinished( CenterBox, {} )
				local TextBoxWarningText20Frame2 = function ( TextBoxWarningText20, event )
					local TextBoxWarningText20Frame3 = function ( TextBoxWarningText20, event )
						if not event.interrupted then
							TextBoxWarningText20:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						end
						TextBoxWarningText20:setAlpha( 0.5 )
						TextBoxWarningText20:setZoom( -40 )
						if event.interrupted then
							self.clipFinished( TextBoxWarningText20, event )
						else
							TextBoxWarningText20:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						TextBoxWarningText20Frame3( TextBoxWarningText20, event )
						return 
					else
						TextBoxWarningText20:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						TextBoxWarningText20:setAlpha( 0 )
						TextBoxWarningText20:registerEventHandler( "transition_complete_keyframe", TextBoxWarningText20Frame3 )
					end
				end
				
				TextBoxWarningText20:completeAnimation()
				self.TextBoxWarningText20:setAlpha( 0.5 )
				self.TextBoxWarningText20:setZoom( -40 )
				TextBoxWarningText20Frame2( TextBoxWarningText20, {} )
				local TextBoxWarningText2Frame2 = function ( TextBoxWarningText2, event )
					local TextBoxWarningText2Frame3 = function ( TextBoxWarningText2, event )
						if not event.interrupted then
							TextBoxWarningText2:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						end
						TextBoxWarningText2:setAlpha( 0.9 )
						if event.interrupted then
							self.clipFinished( TextBoxWarningText2, event )
						else
							TextBoxWarningText2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						TextBoxWarningText2Frame3( TextBoxWarningText2, event )
						return 
					else
						TextBoxWarningText2:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						TextBoxWarningText2:setAlpha( 0.4 )
						TextBoxWarningText2:registerEventHandler( "transition_complete_keyframe", TextBoxWarningText2Frame3 )
					end
				end
				
				TextBoxWarningText2:completeAnimation()
				self.TextBoxWarningText2:setAlpha( 0.9 )
				TextBoxWarningText2Frame2( TextBoxWarningText2, {} )
				outofboundsreturnbox:completeAnimation()
				self.outofboundsreturnbox:setAlpha( 1 )
				self.clipFinished( outofboundsreturnbox, {} )
				self.nextClip = "DefaultClip"
			end
		},
		IsOutOfBounds = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				CenterBox0:completeAnimation()
				self.CenterBox0:setLeftRight( false, false, -331.38, 333.38 )
				self.CenterBox0:setTopBottom( false, false, -97.23, 92.23 )
				self.CenterBox0:setAlpha( 0.5 )
				self.clipFinished( CenterBox0, {} )
				CenterBox:completeAnimation()
				self.CenterBox:setLeftRight( false, false, -331.38, 333.38 )
				self.CenterBox:setTopBottom( false, false, -97.23, 92.23 )
				self.CenterBox:setAlpha( 1 )
				self.clipFinished( CenterBox, {} )
				TextBoxWarningText20:completeAnimation()
				self.TextBoxWarningText20:setLeftRight( false, false, -331.38, 332.5 )
				self.TextBoxWarningText20:setTopBottom( false, false, -61, 25 )
				self.TextBoxWarningText20:setAlpha( 0.5 )
				self.TextBoxWarningText20:setZoom( -30 )
				self.clipFinished( TextBoxWarningText20, {} )
				TextBoxWarningText2:completeAnimation()
				self.TextBoxWarningText2:setLeftRight( false, false, -331.38, 333.38 )
				self.TextBoxWarningText2:setTopBottom( false, false, -61, 25 )
				self.TextBoxWarningText2:setAlpha( 0.9 )
				self.TextBoxWarningText2:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
				self.TextBoxWarningText2:setShaderVector( 0, 0.1, 0, 0, 0 )
				self.TextBoxWarningText2:setShaderVector( 1, 0, 0, 0, 0 )
				self.TextBoxWarningText2:setShaderVector( 2, 1, 0, 0, 0 )
				self.TextBoxWarningText2:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
				self.clipFinished( TextBoxWarningText2, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.outofboundsreturnbox:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

