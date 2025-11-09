CoD.vhud_ms_NotificationOptic = InheritFrom( LUI.UIElement )
CoD.vhud_ms_NotificationOptic.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.vhud_ms_NotificationOptic )
	self.id = "vhud_ms_NotificationOptic"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 81 )
	self:setTopBottom( true, false, 0, 30 )
	
	local GlowOrangeOver = LUI.UIImage.new()
	GlowOrangeOver:setLeftRight( true, true, 0, 0 )
	GlowOrangeOver:setTopBottom( true, true, 0, 0 )
	GlowOrangeOver:setRGB( 0, 0.87, 1 )
	GlowOrangeOver:setAlpha( 0.4 )
	GlowOrangeOver:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowOrangeOver:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowOrangeOver )
	self.GlowOrangeOver = GlowOrangeOver
	
	local NotificationAltBox0 = LUI.UIImage.new()
	NotificationAltBox0:setLeftRight( true, true, 0, 0 )
	NotificationAltBox0:setTopBottom( true, true, 0, 0 )
	NotificationAltBox0:setRGB( 0.74, 0.94, 0.99 )
	NotificationAltBox0:setAlpha( 0.08 )
	NotificationAltBox0:setYRot( -20 )
	NotificationAltBox0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_notificationsignalbox" ) )
	self:addElement( NotificationAltBox0 )
	self.NotificationAltBox0 = NotificationAltBox0
	
	local NotificationAltBox00 = LUI.UIImage.new()
	NotificationAltBox00:setLeftRight( true, true, 0, 0 )
	NotificationAltBox00:setTopBottom( true, true, 0, 0 )
	NotificationAltBox00:setRGB( 0.74, 0.94, 0.99 )
	NotificationAltBox00:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_notificationsignalbox" ) )
	self:addElement( NotificationAltBox00 )
	self.NotificationAltBox00 = NotificationAltBox00
	
	local OPTIC = LUI.UIText.new()
	OPTIC:setLeftRight( true, true, 0, 0 )
	OPTIC:setTopBottom( false, false, -8, 8 )
	OPTIC:setText( Engine.Localize( "MENU_HUD_VEHICLE_OPTIC" ) )
	OPTIC:setTTF( "fonts/default.ttf" )
	OPTIC:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_cheap_blur" ) )
	OPTIC:setShaderVector( 0, 0, 1, 0, 0 )
	OPTIC:setShaderVector( 1, 0, 0, 0, 0 )
	OPTIC:setShaderVector( 2, 0, 0, 0, 0 )
	OPTIC:setShaderVector( 3, 0, 0, 0, 0 )
	OPTIC:setShaderVector( 4, 0, 0, 0, 0 )
	OPTIC:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	OPTIC:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( OPTIC, "setText", function ( element, controller )
		ScaleWidgetToLabelCenteredWithMinimum( self, element, 25, 81 )
	end )
	self:addElement( OPTIC )
	self.OPTIC = OPTIC
	
	local arrowUp = LUI.UIImage.new()
	arrowUp:setLeftRight( false, false, -3.54, 3.54 )
	arrowUp:setTopBottom( false, false, -13.83, -9 )
	arrowUp:setAlpha( 0 )
	arrowUp:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_arrow" ) )
	arrowUp:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( arrowUp )
	self.arrowUp = arrowUp
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setAlpha( 0 )
				self.clipFinished( GlowOrangeOver, {} )
				arrowUp:completeAnimation()
				self.arrowUp:setAlpha( 0 )
				self.clipFinished( arrowUp, {} )
			end,
			StartUp = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Active = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setRGB( 0.42, 0.93, 1 )
				self.GlowOrangeOver:setAlpha( 0.4 )
				self.GlowOrangeOver:setScale( 1.2 )
				self.clipFinished( GlowOrangeOver, {} )
				arrowUp:completeAnimation()
				self.arrowUp:setAlpha( 0.6 )
				self.clipFinished( arrowUp, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

