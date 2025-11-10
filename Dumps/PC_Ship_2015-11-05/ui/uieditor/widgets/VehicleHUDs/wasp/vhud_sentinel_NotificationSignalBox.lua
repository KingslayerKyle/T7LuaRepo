CoD.vhud_sentinel_NotificationSignalBox = InheritFrom( LUI.UIElement )
CoD.vhud_sentinel_NotificationSignalBox.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.vhud_sentinel_NotificationSignalBox )
	self.id = "vhud_sentinel_NotificationSignalBox"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 81 )
	self:setTopBottom( true, false, 0, 30 )
	
	local STRONG = LUI.UIText.new()
	STRONG:setLeftRight( true, true, 0, 0 )
	STRONG:setTopBottom( true, false, 7, 23 )
	STRONG:setText( Engine.Localize( "MENU_HUD_VEHICLE_STRONG" ) )
	STRONG:setTTF( "fonts/default.ttf" )
	STRONG:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_cheap_blur" ) )
	STRONG:setShaderVector( 0, 0, 1, 0, 0 )
	STRONG:setShaderVector( 1, 0, 0, 0, 0 )
	STRONG:setShaderVector( 2, 0, 0, 0, 0 )
	STRONG:setShaderVector( 3, 0, 0, 0, 0 )
	STRONG:setShaderVector( 4, 0, 0, 0, 0 )
	STRONG:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	STRONG:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( STRONG )
	self.STRONG = STRONG
	
	local STRONG0 = LUI.UIText.new()
	STRONG0:setLeftRight( true, true, 0, 0 )
	STRONG0:setTopBottom( true, false, 7, 23 )
	STRONG0:setText( Engine.Localize( "MENU_HUD_VEHICLE_STRONG" ) )
	STRONG0:setTTF( "fonts/default.ttf" )
	STRONG0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	STRONG0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	STRONG0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( STRONG0 )
	self.STRONG0 = STRONG0
	
	local WEAK = LUI.UIText.new()
	WEAK:setLeftRight( true, true, 0, 0 )
	WEAK:setTopBottom( true, false, 7, 23 )
	WEAK:setRGB( 1, 0, 0 )
	WEAK:setText( Engine.Localize( "MENU_HUD_VEHICLE_WEAK" ) )
	WEAK:setTTF( "fonts/default.ttf" )
	WEAK:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_cheap_blur" ) )
	WEAK:setShaderVector( 0, 0, 1, 0, 0 )
	WEAK:setShaderVector( 1, 0, 0, 0, 0 )
	WEAK:setShaderVector( 2, 0, 0, 0, 0 )
	WEAK:setShaderVector( 3, 0, 0, 0, 0 )
	WEAK:setShaderVector( 4, 0, 0, 0, 0 )
	WEAK:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	WEAK:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( WEAK )
	self.WEAK = WEAK
	
	local WEAK0 = LUI.UIText.new()
	WEAK0:setLeftRight( true, true, 0, 0 )
	WEAK0:setTopBottom( true, false, 7, 23 )
	WEAK0:setRGB( 1, 0, 0 )
	WEAK0:setAlpha( 0 )
	WEAK0:setText( Engine.Localize( "MENU_HUD_VEHICLE_WEAK" ) )
	WEAK0:setTTF( "fonts/default.ttf" )
	WEAK0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	WEAK0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( WEAK0 )
	self.WEAK0 = WEAK0
	
	local WEAK00 = LUI.UIText.new()
	WEAK00:setLeftRight( true, true, 0, 0 )
	WEAK00:setTopBottom( true, false, 7, 23 )
	WEAK00:setRGB( 1, 0, 0 )
	WEAK00:setText( Engine.Localize( "MENU_HUD_VEHICLE_WEAK" ) )
	WEAK00:setTTF( "fonts/default.ttf" )
	WEAK00:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	WEAK00:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	WEAK00:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( WEAK00 )
	self.WEAK00 = WEAK00
	
	local WEAK000 = LUI.UIText.new()
	WEAK000:setLeftRight( true, true, 0, 0 )
	WEAK000:setTopBottom( true, false, 7, 23 )
	WEAK000:setRGB( 1, 0, 0 )
	WEAK000:setAlpha( 0 )
	WEAK000:setText( Engine.Localize( "MENU_HUD_VEHICLE_WEAK" ) )
	WEAK000:setTTF( "fonts/default.ttf" )
	WEAK000:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	WEAK000:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	WEAK000:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( WEAK000 )
	self.WEAK000 = WEAK000
	
	local GlowOrangeOver = LUI.UIImage.new()
	GlowOrangeOver:setLeftRight( false, false, -13.96, 12 )
	GlowOrangeOver:setTopBottom( true, false, -19.85, 50.85 )
	GlowOrangeOver:setRGB( 1, 0, 0.03 )
	GlowOrangeOver:setAlpha( 0.5 )
	GlowOrangeOver:setZRot( -90 )
	GlowOrangeOver:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowOrangeOver:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowOrangeOver )
	self.GlowOrangeOver = GlowOrangeOver
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				STRONG:completeAnimation()
				self.STRONG:setAlpha( 1 )
				self.clipFinished( STRONG, {} )
				STRONG0:completeAnimation()
				self.STRONG0:setAlpha( 1 )
				self.clipFinished( STRONG0, {} )
				WEAK:completeAnimation()
				self.WEAK:setAlpha( 0 )
				self.clipFinished( WEAK, {} )
				WEAK0:completeAnimation()
				self.WEAK0:setAlpha( 0 )
				self.clipFinished( WEAK0, {} )
				WEAK00:completeAnimation()
				self.WEAK00:setAlpha( 0 )
				self.clipFinished( WEAK00, {} )
				WEAK000:completeAnimation()
				self.WEAK000:setAlpha( 0 )
				self.clipFinished( WEAK000, {} )
				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setAlpha( 0 )
				self.clipFinished( GlowOrangeOver, {} )
			end,
			StartUp = function ()
				self:setupElementClipCounter( 5 )
				WEAK:completeAnimation()
				self.WEAK:setAlpha( 0 )
				self.clipFinished( WEAK, {} )
				WEAK0:completeAnimation()
				self.WEAK0:setAlpha( 0 )
				self.clipFinished( WEAK0, {} )
				WEAK00:completeAnimation()
				self.WEAK00:setAlpha( 0 )
				self.clipFinished( WEAK00, {} )
				WEAK000:completeAnimation()
				self.WEAK000:setAlpha( 0 )
				self.clipFinished( WEAK000, {} )
				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setAlpha( 0 )
				self.clipFinished( GlowOrangeOver, {} )
			end
		},
		OutOfRange = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				STRONG:completeAnimation()
				self.STRONG:setAlpha( 0 )
				self.clipFinished( STRONG, {} )
				STRONG0:completeAnimation()
				self.STRONG0:setAlpha( 0 )
				self.clipFinished( STRONG0, {} )
				local WEAKFrame2 = function ( WEAK, event )
					local WEAKFrame3 = function ( WEAK, event )
						local WEAKFrame4 = function ( WEAK, event )
							if not event.interrupted then
								WEAK:beginAnimation( "keyframe", 199, true, false, CoD.TweenType.Linear )
							end
							WEAK:setAlpha( 0.6 )
							if event.interrupted then
								self.clipFinished( WEAK, event )
							else
								WEAK:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							WEAKFrame4( WEAK, event )
							return 
						else
							WEAK:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
							WEAK:registerEventHandler( "transition_complete_keyframe", WEAKFrame4 )
						end
					end
					
					if event.interrupted then
						WEAKFrame3( WEAK, event )
						return 
					else
						WEAK:beginAnimation( "keyframe", 209, false, true, CoD.TweenType.Linear )
						WEAK:setAlpha( 1 )
						WEAK:registerEventHandler( "transition_complete_keyframe", WEAKFrame3 )
					end
				end
				
				WEAK:completeAnimation()
				self.WEAK:setAlpha( 0.6 )
				WEAKFrame2( WEAK, {} )
				WEAK0:completeAnimation()
				self.WEAK0:setAlpha( 0 )
				self.WEAK0:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_font_cached" ) )
				self.WEAK0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				self.clipFinished( WEAK0, {} )
				local WEAK00Frame2 = function ( WEAK00, event )
					local WEAK00Frame3 = function ( WEAK00, event )
						local WEAK00Frame4 = function ( WEAK00, event )
							if not event.interrupted then
								WEAK00:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
							end
							WEAK00:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( WEAK00, event )
							else
								WEAK00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							WEAK00Frame4( WEAK00, event )
							return 
						else
							WEAK00:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
							WEAK00:registerEventHandler( "transition_complete_keyframe", WEAK00Frame4 )
						end
					end
					
					if event.interrupted then
						WEAK00Frame3( WEAK00, event )
						return 
					else
						WEAK00:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
						WEAK00:setAlpha( 1 )
						WEAK00:registerEventHandler( "transition_complete_keyframe", WEAK00Frame3 )
					end
				end
				
				WEAK00:completeAnimation()
				self.WEAK00:setAlpha( 0 )
				WEAK00Frame2( WEAK00, {} )
				local WEAK000Frame2 = function ( WEAK000, event )
					local WEAK000Frame3 = function ( WEAK000, event )
						local WEAK000Frame4 = function ( WEAK000, event )
							if not event.interrupted then
								WEAK000:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
							end
							WEAK000:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( WEAK000, event )
							else
								WEAK000:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							WEAK000Frame4( WEAK000, event )
							return 
						else
							WEAK000:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
							WEAK000:registerEventHandler( "transition_complete_keyframe", WEAK000Frame4 )
						end
					end
					
					if event.interrupted then
						WEAK000Frame3( WEAK000, event )
						return 
					else
						WEAK000:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
						WEAK000:setAlpha( 1 )
						WEAK000:registerEventHandler( "transition_complete_keyframe", WEAK000Frame3 )
					end
				end
				
				WEAK000:completeAnimation()
				self.WEAK000:setAlpha( 0 )
				WEAK000Frame2( WEAK000, {} )
				local GlowOrangeOverFrame2 = function ( GlowOrangeOver, event )
					local GlowOrangeOverFrame3 = function ( GlowOrangeOver, event )
						local GlowOrangeOverFrame4 = function ( GlowOrangeOver, event )
							if not event.interrupted then
								GlowOrangeOver:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
							end
							GlowOrangeOver:setAlpha( 0.1 )
							if event.interrupted then
								self.clipFinished( GlowOrangeOver, event )
							else
								GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							GlowOrangeOverFrame4( GlowOrangeOver, event )
							return 
						else
							GlowOrangeOver:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
							GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame4 )
						end
					end
					
					if event.interrupted then
						GlowOrangeOverFrame3( GlowOrangeOver, event )
						return 
					else
						GlowOrangeOver:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
						GlowOrangeOver:setAlpha( 0.5 )
						GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame3 )
					end
				end
				
				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setAlpha( 0.1 )
				GlowOrangeOverFrame2( GlowOrangeOver, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "OutOfRange",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "outOfRange" )
			end
		}
	} )
	self:linkToElementModel( self, "outOfRange", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "outOfRange"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

