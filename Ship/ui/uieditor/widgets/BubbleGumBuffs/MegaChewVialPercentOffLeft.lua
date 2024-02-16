-- 800be7886ada757530405afdf06f855b
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BubbleGumBuffs.MegaChewVialPercentOffBacking" )

CoD.MegaChewVialPercentOffLeft = InheritFrom( LUI.UIElement )
CoD.MegaChewVialPercentOffLeft.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.MegaChewVialPercentOffLeft )
	self.id = "MegaChewVialPercentOffLeft"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 500 )
	self:setTopBottom( true, false, 0, 22 )
	self.anyChildUsesUpdateState = true
	
	local MegaChewVialPercentOffBacking = CoD.MegaChewVialPercentOffBacking.new( menu, controller )
	MegaChewVialPercentOffBacking:setLeftRight( true, true, 0, 0 )
	MegaChewVialPercentOffBacking:setTopBottom( true, true, 0, 0 )
	self:addElement( MegaChewVialPercentOffBacking )
	self.MegaChewVialPercentOffBacking = MegaChewVialPercentOffBacking
	
	local GlowBlueOver = LUI.UIImage.new()
	GlowBlueOver:setLeftRight( false, false, -27, 27 )
	GlowBlueOver:setTopBottom( true, true, -114.85, 114.85 )
	GlowBlueOver:setRGB( 0, 0.55, 1 )
	GlowBlueOver:setZRot( 90 )
	GlowBlueOver:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowBlueOver:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowBlueOver )
	self.GlowBlueOver = GlowBlueOver
	
	local GlowBlueOver0 = LUI.UIImage.new()
	GlowBlueOver0:setLeftRight( false, false, -27, 27 )
	GlowBlueOver0:setTopBottom( true, true, -114.85, 114.85 )
	GlowBlueOver0:setRGB( 0, 0.55, 1 )
	GlowBlueOver0:setAlpha( 0.2 )
	GlowBlueOver0:setZRot( 90 )
	GlowBlueOver0:setScale( 2 )
	GlowBlueOver0:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowBlueOver0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowBlueOver0 )
	self.GlowBlueOver0 = GlowBlueOver0
	
	local nameText = LUI.UIText.new()
	nameText:setLeftRight( true, true, 7, -7 )
	nameText:setTopBottom( false, false, -11, 11 )
	nameText:setText( Engine.Localize( "ZMUI_SPEICAL_PROMOTION_CAPS" ) )
	nameText:setTTF( "fonts/escom.ttf" )
	nameText:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	nameText:setShaderVector( 0, 0.09, 0, 0, 0 )
	nameText:setShaderVector( 1, 0.06, 0, 0, 0 )
	nameText:setShaderVector( 2, 1, 0, 0, 0 )
	nameText:setLetterSpacing( 2 )
	nameText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	nameText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	nameText:registerEventHandler( "menu_loaded", function ( element, event )
		local f2_local0 = nil
		SetupAutoHorizontalAlignArabicText( element )
		if not f2_local0 then
			f2_local0 = element:dispatchEventToChildren( event )
		end
		return f2_local0
	end )

	LUI.OverrideFunction_CallOriginalFirst( nameText, "setText", function ( element, controller )
		ScaleWidgetToLabelLeftJustify( self, element, 0 )
	end )
	self:addElement( nameText )
	self.nameText = nameText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				MegaChewVialPercentOffBacking:completeAnimation()
				self.MegaChewVialPercentOffBacking:setAlpha( 0 )
				self.clipFinished( MegaChewVialPercentOffBacking, {} )

				GlowBlueOver:completeAnimation()
				self.GlowBlueOver:setAlpha( 0 )
				self.clipFinished( GlowBlueOver, {} )

				GlowBlueOver0:completeAnimation()
				self.GlowBlueOver0:setAlpha( 0 )
				self.clipFinished( GlowBlueOver0, {} )

				nameText:completeAnimation()
				self.nameText:setAlpha( 0 )
				self.clipFinished( nameText, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				MegaChewVialPercentOffBacking:completeAnimation()
				self.MegaChewVialPercentOffBacking:setAlpha( 1 )
				self.clipFinished( MegaChewVialPercentOffBacking, {} )
				local GlowBlueOverFrame2 = function ( GlowBlueOver, event )
					local GlowBlueOverFrame3 = function ( GlowBlueOver, event )
						local GlowBlueOverFrame4 = function ( GlowBlueOver, event )
							if not event.interrupted then
								GlowBlueOver:beginAnimation( "keyframe", 910, false, false, CoD.TweenType.Linear )
							end
							GlowBlueOver:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( GlowBlueOver, event )
							else
								GlowBlueOver:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							GlowBlueOverFrame4( GlowBlueOver, event )
							return 
						else
							GlowBlueOver:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Linear )
							GlowBlueOver:registerEventHandler( "transition_complete_keyframe", GlowBlueOverFrame4 )
						end
					end
					
					if event.interrupted then
						GlowBlueOverFrame3( GlowBlueOver, event )
						return 
					else
						GlowBlueOver:beginAnimation( "keyframe", 1159, false, false, CoD.TweenType.Linear )
						GlowBlueOver:setAlpha( 0.7 )
						GlowBlueOver:registerEventHandler( "transition_complete_keyframe", GlowBlueOverFrame3 )
					end
				end
				
				GlowBlueOver:completeAnimation()
				self.GlowBlueOver:setAlpha( 0 )
				GlowBlueOverFrame2( GlowBlueOver, {} )
				local GlowBlueOver0Frame2 = function ( GlowBlueOver0, event )
					local GlowBlueOver0Frame3 = function ( GlowBlueOver0, event )
						local GlowBlueOver0Frame4 = function ( GlowBlueOver0, event )
							if not event.interrupted then
								GlowBlueOver0:beginAnimation( "keyframe", 690, false, false, CoD.TweenType.Linear )
							end
							GlowBlueOver0:setAlpha( 0 )
							GlowBlueOver0:setScale( 2 )
							if event.interrupted then
								self.clipFinished( GlowBlueOver0, event )
							else
								GlowBlueOver0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							GlowBlueOver0Frame4( GlowBlueOver0, event )
							return 
						else
							GlowBlueOver0:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Linear )
							GlowBlueOver0:setAlpha( 0.3 )
							GlowBlueOver0:setScale( 1.32 )
							GlowBlueOver0:registerEventHandler( "transition_complete_keyframe", GlowBlueOver0Frame4 )
						end
					end
					
					if event.interrupted then
						GlowBlueOver0Frame3( GlowBlueOver0, event )
						return 
					else
						GlowBlueOver0:beginAnimation( "keyframe", 1159, false, false, CoD.TweenType.Linear )
						GlowBlueOver0:setAlpha( 0.2 )
						GlowBlueOver0:registerEventHandler( "transition_complete_keyframe", GlowBlueOver0Frame3 )
					end
				end
				
				GlowBlueOver0:completeAnimation()
				self.GlowBlueOver0:setAlpha( 0 )
				self.GlowBlueOver0:setScale( 1 )
				GlowBlueOver0Frame2( GlowBlueOver0, {} )

				nameText:completeAnimation()
				self.nameText:setAlpha( 1 )
				self.clipFinished( nameText, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return ShouldShowLiquidDiviniumPromoBanner( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "autoevents.cycled" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "autoevents.cycled"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.MegaChewVialPercentOffBacking:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
