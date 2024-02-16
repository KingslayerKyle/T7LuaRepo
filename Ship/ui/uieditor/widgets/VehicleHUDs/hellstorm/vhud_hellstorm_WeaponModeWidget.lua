-- 474418e740004bd23ef997b746bb793f
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.VehicleHUDs.hellstorm.vhud_hellstorm_NotificationArmed" )
require( "ui.uieditor.widgets.VehicleHUDs.hellstorm.vhud_hellstorm_NotificationCluster" )

CoD.vhud_hellstorm_WeaponModeWidget = InheritFrom( LUI.UIElement )
CoD.vhud_hellstorm_WeaponModeWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.vhud_hellstorm_WeaponModeWidget )
	self.id = "vhud_hellstorm_WeaponModeWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 80 )
	self:setTopBottom( true, false, 0, 49 )
	
	local vhudhellstormNotificationArmed = CoD.vhud_hellstorm_NotificationArmed.new( menu, controller )
	vhudhellstormNotificationArmed:setLeftRight( true, false, -1, 80 )
	vhudhellstormNotificationArmed:setTopBottom( true, false, 0, 30 )
	vhudhellstormNotificationArmed:setRGB( 1, 0, 0 )
	self:addElement( vhudhellstormNotificationArmed )
	self.vhudhellstormNotificationArmed = vhudhellstormNotificationArmed
	
	local vhudhellstormNotificationCluster = CoD.vhud_hellstorm_NotificationCluster.new( menu, controller )
	vhudhellstormNotificationCluster:setLeftRight( true, false, -1, 80 )
	vhudhellstormNotificationCluster:setTopBottom( true, false, 19, 49 )
	self:addElement( vhudhellstormNotificationCluster )
	self.vhudhellstormNotificationCluster = vhudhellstormNotificationCluster
	
	local GlowOrangeOver = LUI.UIImage.new()
	GlowOrangeOver:setLeftRight( true, false, 26.54, 52.5 )
	GlowOrangeOver:setTopBottom( true, false, -19.85, 50.85 )
	GlowOrangeOver:setRGB( 1, 0, 0.03 )
	GlowOrangeOver:setAlpha( 0.4 )
	GlowOrangeOver:setZRot( -90 )
	GlowOrangeOver:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowOrangeOver:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowOrangeOver )
	self.GlowOrangeOver = GlowOrangeOver
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				local vhudhellstormNotificationArmedFrame2 = function ( vhudhellstormNotificationArmed, event )
					local vhudhellstormNotificationArmedFrame3 = function ( vhudhellstormNotificationArmed, event )
						if not event.interrupted then
							vhudhellstormNotificationArmed:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
						vhudhellstormNotificationArmed:setRGB( 1, 0, 0 )
						vhudhellstormNotificationArmed:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( vhudhellstormNotificationArmed, event )
						else
							vhudhellstormNotificationArmed:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						vhudhellstormNotificationArmedFrame3( vhudhellstormNotificationArmed, event )
						return 
					else
						vhudhellstormNotificationArmed:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						vhudhellstormNotificationArmed:setAlpha( 0.5 )
						vhudhellstormNotificationArmed:registerEventHandler( "transition_complete_keyframe", vhudhellstormNotificationArmedFrame3 )
					end
				end
				
				vhudhellstormNotificationArmed:completeAnimation()
				self.vhudhellstormNotificationArmed:setRGB( 1, 0, 0 )
				self.vhudhellstormNotificationArmed:setAlpha( 1 )
				vhudhellstormNotificationArmedFrame2( vhudhellstormNotificationArmed, {} )

				vhudhellstormNotificationCluster:completeAnimation()
				self.vhudhellstormNotificationCluster:setRGB( 1, 1, 1 )
				self.vhudhellstormNotificationCluster:setAlpha( 1 )
				self.clipFinished( vhudhellstormNotificationCluster, {} )
				local GlowOrangeOverFrame2 = function ( GlowOrangeOver, event )
					local GlowOrangeOverFrame3 = function ( GlowOrangeOver, event )
						if not event.interrupted then
							GlowOrangeOver:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
						GlowOrangeOver:setLeftRight( true, false, 26.54, 52.5 )
						GlowOrangeOver:setTopBottom( true, false, -19.85, 50.85 )
						GlowOrangeOver:setAlpha( 0.4 )
						if event.interrupted then
							self.clipFinished( GlowOrangeOver, event )
						else
							GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						GlowOrangeOverFrame3( GlowOrangeOver, event )
						return 
					else
						GlowOrangeOver:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						GlowOrangeOver:setAlpha( 0.2 )
						GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame3 )
					end
				end
				
				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setLeftRight( true, false, 26.54, 52.5 )
				self.GlowOrangeOver:setTopBottom( true, false, -19.85, 50.85 )
				self.GlowOrangeOver:setAlpha( 0.4 )
				GlowOrangeOverFrame2( GlowOrangeOver, {} )
			end
		},
		Cluster = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				vhudhellstormNotificationArmed:completeAnimation()
				self.vhudhellstormNotificationArmed:setRGB( 1, 1, 1 )
				self.vhudhellstormNotificationArmed:setAlpha( 1 )
				self.clipFinished( vhudhellstormNotificationArmed, {} )
				local vhudhellstormNotificationClusterFrame2 = function ( vhudhellstormNotificationCluster, event )
					local vhudhellstormNotificationClusterFrame3 = function ( vhudhellstormNotificationCluster, event )
						if not event.interrupted then
							vhudhellstormNotificationCluster:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
						vhudhellstormNotificationCluster:setRGB( 1, 0, 0 )
						vhudhellstormNotificationCluster:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( vhudhellstormNotificationCluster, event )
						else
							vhudhellstormNotificationCluster:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						vhudhellstormNotificationClusterFrame3( vhudhellstormNotificationCluster, event )
						return 
					else
						vhudhellstormNotificationCluster:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						vhudhellstormNotificationCluster:setAlpha( 0.5 )
						vhudhellstormNotificationCluster:registerEventHandler( "transition_complete_keyframe", vhudhellstormNotificationClusterFrame3 )
					end
				end
				
				vhudhellstormNotificationCluster:completeAnimation()
				self.vhudhellstormNotificationCluster:setRGB( 1, 0, 0 )
				self.vhudhellstormNotificationCluster:setAlpha( 1 )
				vhudhellstormNotificationClusterFrame2( vhudhellstormNotificationCluster, {} )
				local GlowOrangeOverFrame2 = function ( GlowOrangeOver, event )
					local GlowOrangeOverFrame3 = function ( GlowOrangeOver, event )
						if not event.interrupted then
							GlowOrangeOver:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
						GlowOrangeOver:setLeftRight( true, false, 26.52, 52.48 )
						GlowOrangeOver:setTopBottom( true, false, -1.35, 69.35 )
						GlowOrangeOver:setAlpha( 0.4 )
						if event.interrupted then
							self.clipFinished( GlowOrangeOver, event )
						else
							GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						GlowOrangeOverFrame3( GlowOrangeOver, event )
						return 
					else
						GlowOrangeOver:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						GlowOrangeOver:setAlpha( 0.2 )
						GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame3 )
					end
				end
				
				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setLeftRight( true, false, 26.52, 52.48 )
				self.GlowOrangeOver:setTopBottom( true, false, -1.35, 69.35 )
				self.GlowOrangeOver:setAlpha( 0.4 )
				GlowOrangeOverFrame2( GlowOrangeOver, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Cluster",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "ammo", 0 )
			end
		}
	} )
	self:linkToElementModel( self, "ammo", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "ammo"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.vhudhellstormNotificationArmed:close()
		element.vhudhellstormNotificationCluster:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
