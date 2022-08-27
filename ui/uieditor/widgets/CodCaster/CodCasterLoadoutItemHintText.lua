-- 3f8613c53eef3314f4413298c58e9b38
-- This hash is used for caching, delete to decompile the file again

CoD.CodCasterLoadoutItemHintText = InheritFrom( LUI.UIElement )
CoD.CodCasterLoadoutItemHintText.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CodCasterLoadoutItemHintText )
	self.id = "CodCasterLoadoutItemHintText"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 260 )
	self:setTopBottom( true, false, 0, 20 )
	
	local arrowUp = LUI.UIImage.new()
	arrowUp:setLeftRight( false, false, -7.5, 7.5 )
	arrowUp:setTopBottom( false, false, 10, 18 )
	arrowUp:setZRot( 180 )
	arrowUp:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_arrow" ) )
	arrowUp:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( arrowUp )
	self.arrowUp = arrowUp
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, true, 0, 0 )
	bg:setTopBottom( true, false, 6, 20 )
	bg:setImage( RegisterImage( "uie_t7_hud_waypoints_namebg_left_mp" ) )
	self:addElement( bg )
	self.bg = bg
	
	local text = LUI.UIText.new()
	text:setLeftRight( false, false, -230, 230 )
	text:setTopBottom( true, false, 6, 20 )
	text:setText( Engine.Localize( "MENU_NEW" ) )
	text:setTTF( "fonts/escom.ttf" )
	text:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	text:setShaderVector( 0, 0.06, 0, 0, 0 )
	text:setShaderVector( 1, 0.02, 0, 0, 0 )
	text:setShaderVector( 2, 1, 0, 0, 0 )
	text:setLetterSpacing( 1 )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( text, "setText", function ( element, controller )
		ScaleWidgetToLabelCenteredWrapped( self, element, 4, 4 )
	end )
	self:addElement( text )
	self.text = text
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				arrowUp:completeAnimation()
				self.arrowUp:setAlpha( 0 )
				self.clipFinished( arrowUp, {} )
				bg:completeAnimation()
				self.bg:setAlpha( 0 )
				self.clipFinished( bg, {} )
				text:completeAnimation()
				self.text:setAlpha( 0 )
				self.clipFinished( text, {} )
			end,
			HintMulti = function ()
				self:setupElementClipCounter( 3 )
				arrowUp:completeAnimation()
				self.arrowUp:setAlpha( 1 )
				self.clipFinished( arrowUp, {} )
				local bgFrame2 = function ( bg, event )
					local bgFrame3 = function ( bg, event )
						local bgFrame4 = function ( bg, event )
							if not event.interrupted then
								bg:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							end
							bg:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( bg, event )
							else
								bg:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							bgFrame4( bg, event )
							return 
						else
							bg:beginAnimation( "keyframe", 950, false, false, CoD.TweenType.Linear )
							bg:registerEventHandler( "transition_complete_keyframe", bgFrame4 )
						end
					end
					
					if event.interrupted then
						bgFrame3( bg, event )
						return 
					else
						bg:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						bg:setAlpha( 1 )
						bg:registerEventHandler( "transition_complete_keyframe", bgFrame3 )
					end
				end
				
				bg:completeAnimation()
				self.bg:setAlpha( 0 )
				bgFrame2( bg, {} )
				local textFrame2 = function ( text, event )
					local textFrame3 = function ( text, event )
						local textFrame4 = function ( text, event )
							if not event.interrupted then
								text:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							end
							text:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( text, event )
							else
								text:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							textFrame4( text, event )
							return 
						else
							text:beginAnimation( "keyframe", 950, false, false, CoD.TweenType.Linear )
							text:registerEventHandler( "transition_complete_keyframe", textFrame4 )
						end
					end
					
					if event.interrupted then
						textFrame3( text, event )
						return 
					else
						text:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						text:setAlpha( 1 )
						text:registerEventHandler( "transition_complete_keyframe", textFrame3 )
					end
				end
				
				text:completeAnimation()
				self.text:setAlpha( 0 )
				textFrame2( text, {} )
			end,
			HintSingle = function ()
				self:setupElementClipCounter( 3 )
				arrowUp:completeAnimation()
				self.arrowUp:setAlpha( 1 )
				self.clipFinished( arrowUp, {} )
				bg:completeAnimation()
				self.bg:setAlpha( 1 )
				self.clipFinished( bg, {} )
				text:completeAnimation()
				self.text:setAlpha( 1 )
				self.clipFinished( text, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

