-- fc1950de93bb0b3cb2fd3ebed1730505
-- This hash is used for caching, delete to decompile the file again

CoD.PerkListItemFactory = InheritFrom( LUI.UIElement )
CoD.PerkListItemFactory.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.PerkListItemFactory )
	self.id = "PerkListItemFactory"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 36 )
	self:setTopBottom( true, false, 0, 36 )
	
	local GlowOblueOver = LUI.UIImage.new()
	GlowOblueOver:setLeftRight( true, false, -7.51, 43.51 )
	GlowOblueOver:setTopBottom( true, false, -36.85, 69.85 )
	GlowOblueOver:setRGB( 0, 0.61, 1 )
	GlowOblueOver:setZRot( 90 )
	GlowOblueOver:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowOblueOver:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowOblueOver )
	self.GlowOblueOver = GlowOblueOver
	
	local GlowBlueOver0 = LUI.UIImage.new()
	GlowBlueOver0:setLeftRight( true, false, 11.49, 24.51 )
	GlowBlueOver0:setTopBottom( true, false, -36.85, 69.85 )
	GlowBlueOver0:setRGB( 0, 0.98, 1 )
	GlowBlueOver0:setAlpha( 0.62 )
	GlowBlueOver0:setZRot( 90 )
	GlowBlueOver0:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowBlueOver0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowBlueOver0 )
	self.GlowBlueOver0 = GlowBlueOver0
	
	local PerkImage = LUI.UIImage.new()
	PerkImage:setLeftRight( true, false, 0, 36 )
	PerkImage:setTopBottom( false, true, -36, 0 )
	PerkImage:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			PerkImage:setImage( RegisterImage( image ) )
		end
	end )
	self:addElement( PerkImage )
	self.PerkImage = PerkImage
	
	local GlowOrangeOver1 = LUI.UIImage.new()
	GlowOrangeOver1:setLeftRight( true, false, -7.51, 43.51 )
	GlowOrangeOver1:setTopBottom( true, false, -36.85, 69.85 )
	GlowOrangeOver1:setRGB( 1, 0.31, 0 )
	GlowOrangeOver1:setAlpha( 0.53 )
	GlowOrangeOver1:setZRot( 90 )
	GlowOrangeOver1:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowOrangeOver1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowOrangeOver1 )
	self.GlowOrangeOver1 = GlowOrangeOver1
	
	local Lightning = LUI.UIImage.new()
	Lightning:setLeftRight( true, false, -57.5, 93.5 )
	Lightning:setTopBottom( true, false, -81, 63 )
	Lightning:setAlpha( 0 )
	Lightning:setImage( RegisterImage( "uie_t7_zm_derriese_hud_notification_anim" ) )
	Lightning:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
	Lightning:setShaderVector( 0, 28, 0, 0, 0 )
	Lightning:setShaderVector( 1, 30, 0, 0, 0 )
	self:addElement( Lightning )
	self.Lightning = Lightning
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				GlowOblueOver:completeAnimation()
				self.GlowOblueOver:setAlpha( 0 )
				self.clipFinished( GlowOblueOver, {} )

				GlowBlueOver0:completeAnimation()
				self.GlowBlueOver0:setAlpha( 0 )
				self.clipFinished( GlowBlueOver0, {} )

				PerkImage:completeAnimation()
				self.PerkImage:setAlpha( 0 )
				self.clipFinished( PerkImage, {} )

				GlowOrangeOver1:completeAnimation()
				self.GlowOrangeOver1:setAlpha( 0 )
				self.clipFinished( GlowOrangeOver1, {} )

				Lightning:completeAnimation()
				self.Lightning:setAlpha( 0 )
				self.clipFinished( Lightning, {} )
			end
		},
		Enabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				GlowOblueOver:completeAnimation()
				self.GlowOblueOver:setAlpha( 0 )
				self.clipFinished( GlowOblueOver, {} )

				GlowBlueOver0:completeAnimation()
				self.GlowBlueOver0:setAlpha( 0 )
				self.clipFinished( GlowBlueOver0, {} )

				PerkImage:completeAnimation()
				self.PerkImage:setAlpha( 1 )
				self.clipFinished( PerkImage, {} )

				GlowOrangeOver1:completeAnimation()
				self.GlowOrangeOver1:setAlpha( 0 )
				self.clipFinished( GlowOrangeOver1, {} )

				Lightning:completeAnimation()
				self.Lightning:setAlpha( 0 )
				self.clipFinished( Lightning, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 5 )

				local GlowOblueOverFrame2 = function ( GlowOblueOver, event )
					local GlowOblueOverFrame3 = function ( GlowOblueOver, event )
						local GlowOblueOverFrame4 = function ( GlowOblueOver, event )
							local GlowOblueOverFrame5 = function ( GlowOblueOver, event )
								if not event.interrupted then
									GlowOblueOver:beginAnimation( "keyframe", 810, false, false, CoD.TweenType.Linear )
								end
								GlowOblueOver:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( GlowOblueOver, event )
								else
									GlowOblueOver:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								GlowOblueOverFrame5( GlowOblueOver, event )
								return 
							else
								GlowOblueOver:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								GlowOblueOver:setAlpha( 1 )
								GlowOblueOver:registerEventHandler( "transition_complete_keyframe", GlowOblueOverFrame5 )
							end
						end
						
						if event.interrupted then
							GlowOblueOverFrame4( GlowOblueOver, event )
							return 
						else
							GlowOblueOver:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							GlowOblueOver:setAlpha( 0.34 )
							GlowOblueOver:registerEventHandler( "transition_complete_keyframe", GlowOblueOverFrame4 )
						end
					end
					
					if event.interrupted then
						GlowOblueOverFrame3( GlowOblueOver, event )
						return 
					else
						GlowOblueOver:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						GlowOblueOver:setAlpha( 1 )
						GlowOblueOver:registerEventHandler( "transition_complete_keyframe", GlowOblueOverFrame3 )
					end
				end
				
				GlowOblueOver:completeAnimation()
				self.GlowOblueOver:setAlpha( 0 )
				GlowOblueOverFrame2( GlowOblueOver, {} )
				local GlowBlueOver0Frame2 = function ( GlowBlueOver0, event )
					local GlowBlueOver0Frame3 = function ( GlowBlueOver0, event )
						if not event.interrupted then
							GlowBlueOver0:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
						end
						GlowBlueOver0:setLeftRight( true, false, 11.49, 24.51 )
						GlowBlueOver0:setTopBottom( true, false, -36.85, 69.85 )
						GlowBlueOver0:setRGB( 1, 0.48, 0 )
						GlowBlueOver0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( GlowBlueOver0, event )
						else
							GlowBlueOver0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						GlowBlueOver0Frame3( GlowBlueOver0, event )
						return 
					else
						GlowBlueOver0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						GlowBlueOver0:setAlpha( 0.54 )
						GlowBlueOver0:registerEventHandler( "transition_complete_keyframe", GlowBlueOver0Frame3 )
					end
				end
				
				GlowBlueOver0:completeAnimation()
				self.GlowBlueOver0:setLeftRight( true, false, 11.49, 24.51 )
				self.GlowBlueOver0:setTopBottom( true, false, -36.85, 69.85 )
				self.GlowBlueOver0:setRGB( 1, 0.48, 0 )
				self.GlowBlueOver0:setAlpha( 0 )
				GlowBlueOver0Frame2( GlowBlueOver0, {} )
				local PerkImageFrame2 = function ( PerkImage, event )
					if not event.interrupted then
						PerkImage:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
					end
					PerkImage:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( PerkImage, event )
					else
						PerkImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PerkImage:completeAnimation()
				self.PerkImage:setAlpha( 0 )
				PerkImageFrame2( PerkImage, {} )
				local GlowOrangeOver1Frame2 = function ( GlowOrangeOver1, event )
					local GlowOrangeOver1Frame3 = function ( GlowOrangeOver1, event )
						local GlowOrangeOver1Frame4 = function ( GlowOrangeOver1, event )
							local GlowOrangeOver1Frame5 = function ( GlowOrangeOver1, event )
								if not event.interrupted then
									GlowOrangeOver1:beginAnimation( "keyframe", 639, false, false, CoD.TweenType.Linear )
								end
								GlowOrangeOver1:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( GlowOrangeOver1, event )
								else
									GlowOrangeOver1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								GlowOrangeOver1Frame5( GlowOrangeOver1, event )
								return 
							else
								GlowOrangeOver1:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								GlowOrangeOver1:setAlpha( 0.22 )
								GlowOrangeOver1:registerEventHandler( "transition_complete_keyframe", GlowOrangeOver1Frame5 )
							end
						end
						
						if event.interrupted then
							GlowOrangeOver1Frame4( GlowOrangeOver1, event )
							return 
						else
							GlowOrangeOver1:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							GlowOrangeOver1:setAlpha( 0 )
							GlowOrangeOver1:registerEventHandler( "transition_complete_keyframe", GlowOrangeOver1Frame4 )
						end
					end
					
					if event.interrupted then
						GlowOrangeOver1Frame3( GlowOrangeOver1, event )
						return 
					else
						GlowOrangeOver1:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						GlowOrangeOver1:setAlpha( 0.24 )
						GlowOrangeOver1:registerEventHandler( "transition_complete_keyframe", GlowOrangeOver1Frame3 )
					end
				end
				
				GlowOrangeOver1:completeAnimation()
				self.GlowOrangeOver1:setAlpha( 0 )
				GlowOrangeOver1Frame2( GlowOrangeOver1, {} )
				local LightningFrame2 = function ( Lightning, event )
					local LightningFrame3 = function ( Lightning, event )
						if not event.interrupted then
							Lightning:beginAnimation( "keyframe", 870, false, false, CoD.TweenType.Linear )
						end
						Lightning:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Lightning, event )
						else
							Lightning:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LightningFrame3( Lightning, event )
						return 
					else
						Lightning:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						Lightning:setAlpha( 1 )
						Lightning:registerEventHandler( "transition_complete_keyframe", LightningFrame3 )
					end
				end
				
				Lightning:completeAnimation()
				self.Lightning:setAlpha( 0 )
				LightningFrame2( Lightning, {} )
			end
		},
		Paused = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				GlowOblueOver:completeAnimation()
				self.GlowOblueOver:setAlpha( 0 )
				self.clipFinished( GlowOblueOver, {} )

				GlowBlueOver0:completeAnimation()
				self.GlowBlueOver0:setAlpha( 0 )
				self.clipFinished( GlowBlueOver0, {} )
				local f19_local0 = function ( f20_arg0, f20_arg1 )
					if not f20_arg1.interrupted then
						f20_arg0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					f20_arg0:setAlpha( 1 )
					if f20_arg1.interrupted then
						self.clipFinished( f20_arg0, f20_arg1 )
					else
						f20_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PerkImage:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
				PerkImage:setAlpha( 0 )
				PerkImage:registerEventHandler( "transition_complete_keyframe", f19_local0 )

				GlowOrangeOver1:completeAnimation()
				self.GlowOrangeOver1:setAlpha( 0 )
				self.clipFinished( GlowOrangeOver1, {} )

				Lightning:completeAnimation()
				self.Lightning:setAlpha( 0 )
				self.clipFinished( Lightning, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Enabled",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "status", 1 )
			end
		},
		{
			stateName = "Paused",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "status", 2 )
			end
		}
	} )
	self:linkToElementModel( self, "status", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "status"
		} )
	end )

	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller )
		if IsSelfModelValueTrue( element, controller, "newPerk" ) then
			PlayClip( self, "Intro", controller )
			SetSelfModelValue( self, element, controller, "newPerk", false )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.PerkImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

