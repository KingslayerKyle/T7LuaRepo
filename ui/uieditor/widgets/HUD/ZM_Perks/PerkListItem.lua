-- 3437ec9d6220b5241dabbbaf980a2856
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.ZM_FX.ZmFx_Spark2Ext" )

CoD.PerkListItem = InheritFrom( LUI.UIElement )
CoD.PerkListItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PerkListItem )
	self.id = "PerkListItem"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 36 )
	self:setTopBottom( true, false, 0, 36 )
	
	local ZmFxSpark2Ext000 = CoD.ZmFx_Spark2Ext.new( menu, controller )
	ZmFxSpark2Ext000:setLeftRight( true, false, -12.67, 53.33 )
	ZmFxSpark2Ext000:setTopBottom( true, false, -60, 39 )
	ZmFxSpark2Ext000:setAlpha( 0.86 )
	ZmFxSpark2Ext000:setZRot( 9 )
	ZmFxSpark2Ext000:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ZmFxSpark2Ext000 )
	self.ZmFxSpark2Ext000 = ZmFxSpark2Ext000
	
	local GlowOrangeOver = LUI.UIImage.new()
	GlowOrangeOver:setLeftRight( true, false, -7.51, 43.51 )
	GlowOrangeOver:setTopBottom( true, false, -36.85, 69.85 )
	GlowOrangeOver:setRGB( 1, 0.31, 0 )
	GlowOrangeOver:setZRot( 90 )
	GlowOrangeOver:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowOrangeOver:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowOrangeOver )
	self.GlowOrangeOver = GlowOrangeOver
	
	local GlowOrangeOver0 = LUI.UIImage.new()
	GlowOrangeOver0:setLeftRight( true, false, 11.49, 24.51 )
	GlowOrangeOver0:setTopBottom( true, false, -36.85, 69.85 )
	GlowOrangeOver0:setRGB( 1, 0.31, 0 )
	GlowOrangeOver0:setAlpha( 0.62 )
	GlowOrangeOver0:setZRot( 90 )
	GlowOrangeOver0:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowOrangeOver0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowOrangeOver0 )
	self.GlowOrangeOver0 = GlowOrangeOver0
	
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
	
	local ZmFxSpark2Ext00 = CoD.ZmFx_Spark2Ext.new( menu, controller )
	ZmFxSpark2Ext00:setLeftRight( true, false, -12.67, 53.33 )
	ZmFxSpark2Ext00:setTopBottom( true, false, -60, 39 )
	ZmFxSpark2Ext00:setAlpha( 0 )
	ZmFxSpark2Ext00:setZRot( 9 )
	ZmFxSpark2Ext00:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ZmFxSpark2Ext00 )
	self.ZmFxSpark2Ext00 = ZmFxSpark2Ext00
	
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
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				ZmFxSpark2Ext000:completeAnimation()
				self.ZmFxSpark2Ext000:setAlpha( 0 )
				self.clipFinished( ZmFxSpark2Ext000, {} )
				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setAlpha( 0 )
				self.clipFinished( GlowOrangeOver, {} )
				GlowOrangeOver0:completeAnimation()
				self.GlowOrangeOver0:setAlpha( 0 )
				self.clipFinished( GlowOrangeOver0, {} )
				PerkImage:completeAnimation()
				self.PerkImage:setAlpha( 0 )
				self.clipFinished( PerkImage, {} )
				ZmFxSpark2Ext00:completeAnimation()
				self.ZmFxSpark2Ext00:setAlpha( 0 )
				self.clipFinished( ZmFxSpark2Ext00, {} )
				GlowOrangeOver1:completeAnimation()
				self.GlowOrangeOver1:setAlpha( 0 )
				self.clipFinished( GlowOrangeOver1, {} )
			end
		},
		Enabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				ZmFxSpark2Ext000:completeAnimation()
				self.ZmFxSpark2Ext000:setAlpha( 0 )
				self.clipFinished( ZmFxSpark2Ext000, {} )
				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setAlpha( 0 )
				self.clipFinished( GlowOrangeOver, {} )
				GlowOrangeOver0:completeAnimation()
				self.GlowOrangeOver0:setAlpha( 0 )
				self.clipFinished( GlowOrangeOver0, {} )
				PerkImage:completeAnimation()
				self.PerkImage:setAlpha( 1 )
				self.clipFinished( PerkImage, {} )
				ZmFxSpark2Ext00:completeAnimation()
				self.ZmFxSpark2Ext00:setAlpha( 0 )
				self.clipFinished( ZmFxSpark2Ext00, {} )
				GlowOrangeOver1:completeAnimation()
				self.GlowOrangeOver1:setAlpha( 0 )
				self.clipFinished( GlowOrangeOver1, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 6 )
				local ZmFxSpark2Ext000Frame2 = function ( ZmFxSpark2Ext000, event )
					local ZmFxSpark2Ext000Frame3 = function ( ZmFxSpark2Ext000, event )
						if not event.interrupted then
							ZmFxSpark2Ext000:beginAnimation( "keyframe", 870, false, false, CoD.TweenType.Linear )
						end
						ZmFxSpark2Ext000:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( ZmFxSpark2Ext000, event )
						else
							ZmFxSpark2Ext000:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ZmFxSpark2Ext000Frame3( ZmFxSpark2Ext000, event )
						return 
					else
						ZmFxSpark2Ext000:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						ZmFxSpark2Ext000:setAlpha( 0.86 )
						ZmFxSpark2Ext000:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext000Frame3 )
					end
				end
				
				ZmFxSpark2Ext000:completeAnimation()
				self.ZmFxSpark2Ext000:setAlpha( 0 )
				ZmFxSpark2Ext000Frame2( ZmFxSpark2Ext000, {} )
				local GlowOrangeOverFrame2 = function ( GlowOrangeOver, event )
					local GlowOrangeOverFrame3 = function ( GlowOrangeOver, event )
						local GlowOrangeOverFrame4 = function ( GlowOrangeOver, event )
							local GlowOrangeOverFrame5 = function ( GlowOrangeOver, event )
								if not event.interrupted then
									GlowOrangeOver:beginAnimation( "keyframe", 810, false, false, CoD.TweenType.Linear )
								end
								GlowOrangeOver:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( GlowOrangeOver, event )
								else
									GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								GlowOrangeOverFrame5( GlowOrangeOver, event )
								return 
							else
								GlowOrangeOver:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								GlowOrangeOver:setAlpha( 1 )
								GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame5 )
							end
						end
						
						if event.interrupted then
							GlowOrangeOverFrame4( GlowOrangeOver, event )
							return 
						else
							GlowOrangeOver:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							GlowOrangeOver:setAlpha( 0.34 )
							GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame4 )
						end
					end
					
					if event.interrupted then
						GlowOrangeOverFrame3( GlowOrangeOver, event )
						return 
					else
						GlowOrangeOver:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						GlowOrangeOver:setAlpha( 1 )
						GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame3 )
					end
				end
				
				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setAlpha( 0 )
				GlowOrangeOverFrame2( GlowOrangeOver, {} )
				local GlowOrangeOver0Frame2 = function ( GlowOrangeOver0, event )
					local GlowOrangeOver0Frame3 = function ( GlowOrangeOver0, event )
						if not event.interrupted then
							GlowOrangeOver0:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
						end
						GlowOrangeOver0:setLeftRight( true, false, 11.49, 24.51 )
						GlowOrangeOver0:setTopBottom( true, false, -36.85, 69.85 )
						GlowOrangeOver0:setRGB( 1, 0.48, 0 )
						GlowOrangeOver0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( GlowOrangeOver0, event )
						else
							GlowOrangeOver0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						GlowOrangeOver0Frame3( GlowOrangeOver0, event )
						return 
					else
						GlowOrangeOver0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						GlowOrangeOver0:setAlpha( 0.54 )
						GlowOrangeOver0:registerEventHandler( "transition_complete_keyframe", GlowOrangeOver0Frame3 )
					end
				end
				
				GlowOrangeOver0:completeAnimation()
				self.GlowOrangeOver0:setLeftRight( true, false, 11.49, 24.51 )
				self.GlowOrangeOver0:setTopBottom( true, false, -36.85, 69.85 )
				self.GlowOrangeOver0:setRGB( 1, 0.48, 0 )
				self.GlowOrangeOver0:setAlpha( 0 )
				GlowOrangeOver0Frame2( GlowOrangeOver0, {} )
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
				local ZmFxSpark2Ext00Frame2 = function ( ZmFxSpark2Ext00, event )
					local ZmFxSpark2Ext00Frame3 = function ( ZmFxSpark2Ext00, event )
						local ZmFxSpark2Ext00Frame4 = function ( ZmFxSpark2Ext00, event )
							local ZmFxSpark2Ext00Frame5 = function ( ZmFxSpark2Ext00, event )
								local ZmFxSpark2Ext00Frame6 = function ( ZmFxSpark2Ext00, event )
									if not event.interrupted then
										ZmFxSpark2Ext00:beginAnimation( "keyframe", 539, false, false, CoD.TweenType.Linear )
									end
									ZmFxSpark2Ext00:setLeftRight( true, false, 11.51, 77.51 )
									ZmFxSpark2Ext00:setTopBottom( true, false, -83.5, 15.5 )
									ZmFxSpark2Ext00:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( ZmFxSpark2Ext00, event )
									else
										ZmFxSpark2Ext00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									ZmFxSpark2Ext00Frame6( ZmFxSpark2Ext00, event )
									return 
								else
									ZmFxSpark2Ext00:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
									ZmFxSpark2Ext00:setLeftRight( true, false, 11.51, 77.51 )
									ZmFxSpark2Ext00:setTopBottom( true, false, -56.5, 42.5 )
									ZmFxSpark2Ext00:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext00Frame6 )
								end
							end
							
							if event.interrupted then
								ZmFxSpark2Ext00Frame5( ZmFxSpark2Ext00, event )
								return 
							else
								ZmFxSpark2Ext00:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
								ZmFxSpark2Ext00:setLeftRight( true, false, -9.49, 56.51 )
								ZmFxSpark2Ext00:setTopBottom( true, false, -48, 51 )
								ZmFxSpark2Ext00:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext00Frame5 )
							end
						end
						
						if event.interrupted then
							ZmFxSpark2Ext00Frame4( ZmFxSpark2Ext00, event )
							return 
						else
							ZmFxSpark2Ext00:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
							ZmFxSpark2Ext00:setLeftRight( true, false, -24.49, 41.51 )
							ZmFxSpark2Ext00:setTopBottom( true, false, -57, 42 )
							ZmFxSpark2Ext00:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext00Frame4 )
						end
					end
					
					if event.interrupted then
						ZmFxSpark2Ext00Frame3( ZmFxSpark2Ext00, event )
						return 
					else
						ZmFxSpark2Ext00:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						ZmFxSpark2Ext00:setAlpha( 1 )
						ZmFxSpark2Ext00:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext00Frame3 )
					end
				end
				
				ZmFxSpark2Ext00:completeAnimation()
				self.ZmFxSpark2Ext00:setLeftRight( true, false, -25.49, 40.51 )
				self.ZmFxSpark2Ext00:setTopBottom( true, false, -82.5, 16.5 )
				self.ZmFxSpark2Ext00:setAlpha( 0 )
				ZmFxSpark2Ext00Frame2( ZmFxSpark2Ext00, {} )
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
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Enabled",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "status", 1 )
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
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ZmFxSpark2Ext000:close()
		element.ZmFxSpark2Ext00:close()
		element.PerkImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

