-- 0906726fc5028d4b0f429eaf376dd9cd
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.ZM_Panels.ZmPanel_AmmoExt" )
require( "ui.uieditor.widgets.HUD.ZM_AmmoWidget.ZmAmmo_Prop" )
require( "ui.uieditor.widgets.HUD.ZM_AmmoWidget.ZmAmmo_ClipInfo" )
require( "ui.uieditor.widgets.HUD.ZM_AmmoWidget.ZmAmmo_EquipContainer" )
require( "ui.uieditor.widgets.HUD.ZM_AmmoWidget.ZmAmmo_AttachmentInfo" )
require( "ui.uieditor.widgets.HUD.ZM_AmmoWidget.ZmAmmo_BBGumMeterWidget" )

local PreLoadFunc = function ( self, controller )
	Engine.CreateModel( Engine.GetModelForController( controller ), "currentWeapon.aatIcon" )
end

local PostLoadFunc = function ( self, controller, menu )
	if not Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "currentWeapon.aatIcon" ) ) then
		self.AATIcon:setImage( RegisterImage( "blacktransparent" ) )
	end
end

CoD.ZmAmmo = InheritFrom( LUI.UIElement )
CoD.ZmAmmo.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ZmAmmo )
	self.id = "ZmAmmo"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 430 )
	self:setTopBottom( true, false, 0, 247 )
	self.anyChildUsesUpdateState = true
	
	local ZmPanelAmmoInt0 = CoD.ZmPanel_AmmoExt.new( menu, controller )
	ZmPanelAmmoInt0:setLeftRight( true, false, 102, 430 )
	ZmPanelAmmoInt0:setTopBottom( true, false, 34, 250 )
	ZmPanelAmmoInt0:setRGB( 0.61, 0.61, 0.61 )
	ZmPanelAmmoInt0:setScale( 1.25 )
	self:addElement( ZmPanelAmmoInt0 )
	self.ZmPanelAmmoInt0 = ZmPanelAmmoInt0
	
	local GlowOrange = LUI.UIImage.new()
	GlowOrange:setLeftRight( true, false, 174, 492 )
	GlowOrange:setTopBottom( true, false, 42.5, 262 )
	GlowOrange:setRGB( 1, 0.31, 0 )
	GlowOrange:setAlpha( 0.23 )
	GlowOrange:setZRot( -4 )
	GlowOrange:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	self:addElement( GlowOrange )
	self.GlowOrange = GlowOrange
	
	local GlowMultiply = LUI.UIImage.new()
	GlowMultiply:setLeftRight( true, false, 54, 515 )
	GlowMultiply:setTopBottom( true, false, 52.25, 215.75 )
	GlowMultiply:setRGB( 0.37, 0.41, 0.47 )
	GlowMultiply:setAlpha( 0.4 )
	GlowMultiply:setZRot( -4 )
	GlowMultiply:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowMultiply:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiply" ) )
	self:addElement( GlowMultiply )
	self.GlowMultiply = GlowMultiply
	
	local ZmAmmoProp0 = CoD.ZmAmmo_Prop.new( menu, controller )
	ZmAmmoProp0:setLeftRight( true, false, 164.69, 398 )
	ZmAmmoProp0:setTopBottom( true, false, 62, 206 )
	self:addElement( ZmAmmoProp0 )
	self.ZmAmmoProp0 = ZmAmmoProp0
	
	local ZmAmmoClipInfo0 = CoD.ZmAmmo_ClipInfo.new( menu, controller )
	ZmAmmoClipInfo0:setLeftRight( true, false, 162.34, 297.34 )
	ZmAmmoClipInfo0:setTopBottom( true, false, 117.5, 174.5 )
	ZmAmmoClipInfo0:setYRot( -30 )
	self:addElement( ZmAmmoClipInfo0 )
	self.ZmAmmoClipInfo0 = ZmAmmoClipInfo0
	
	local ZmAmmoEquipContainer0 = CoD.ZmAmmo_EquipContainer.new( menu, controller )
	ZmAmmoEquipContainer0:setLeftRight( true, false, 226.35, 298.5 )
	ZmAmmoEquipContainer0:setTopBottom( true, false, 94.93, 146.15 )
	ZmAmmoEquipContainer0:setYRot( -30 )
	self:addElement( ZmAmmoEquipContainer0 )
	self.ZmAmmoEquipContainer0 = ZmAmmoEquipContainer0
	
	local Grid = LUI.UIImage.new()
	Grid:setLeftRight( true, false, 174, 326 )
	Grid:setTopBottom( true, false, 93, 181 )
	Grid:setRGB( 1, 0.42, 0.22 )
	Grid:setAlpha( 0.72 )
	Grid:setImage( RegisterImage( "uie_t7_zm_hud_ammo_grid" ) )
	Grid:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiply" ) )
	self:addElement( Grid )
	self.Grid = Grid
	
	local ZmAmmoAttachmentInfo0 = CoD.ZmAmmo_AttachmentInfo.new( menu, controller )
	ZmAmmoAttachmentInfo0:setLeftRight( true, false, -40, 276 )
	ZmAmmoAttachmentInfo0:setTopBottom( true, false, 148, 186 )
	ZmAmmoAttachmentInfo0:setYRot( -40 )
	self:addElement( ZmAmmoAttachmentInfo0 )
	self.ZmAmmoAttachmentInfo0 = ZmAmmoAttachmentInfo0
	
	local AmmoGlow = LUI.UIImage.new()
	AmmoGlow:setLeftRight( true, false, 72.5, 430 )
	AmmoGlow:setTopBottom( true, false, -8.96, 266.04 )
	AmmoGlow:setImage( RegisterImage( "uie_t7_zm_hud_ammo_glowfilm" ) )
	AmmoGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( AmmoGlow )
	self.AmmoGlow = AmmoGlow
	
	local GlowNotif = LUI.UIImage.new()
	GlowNotif:setLeftRight( true, false, 14.35, 465.42 )
	GlowNotif:setTopBottom( true, false, -22.12, 238.12 )
	GlowNotif:setAlpha( 0 )
	GlowNotif:setImage( RegisterImage( "uie_t7_zm_hud_notif_glowfilm" ) )
	GlowNotif:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowNotif )
	self.GlowNotif = GlowNotif
	
	local Flsh = LUI.UIImage.new()
	Flsh:setLeftRight( true, false, 14.35, 423.34 )
	Flsh:setTopBottom( true, false, 103.25, 176 )
	Flsh:setRGB( 0.62, 0.22, 0 )
	Flsh:setAlpha( 0 )
	Flsh:setImage( RegisterImage( "uie_t7_zm_hud_notif_txtstreak" ) )
	Flsh:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Flsh )
	self.Flsh = Flsh
	
	local ZmAmmoBBGumMeterWidget = CoD.ZmAmmo_BBGumMeterWidget.new( menu, controller )
	ZmAmmoBBGumMeterWidget:setLeftRight( true, false, 320, 373 )
	ZmAmmoBBGumMeterWidget:setTopBottom( true, false, 16, 69 )
	ZmAmmoBBGumMeterWidget:setScale( 1.4 )
	self:addElement( ZmAmmoBBGumMeterWidget )
	self.ZmAmmoBBGumMeterWidget = ZmAmmoBBGumMeterWidget
	
	local AATIcon = LUI.UIImage.new()
	AATIcon:setLeftRight( true, false, 277.34, 325.34 )
	AATIcon:setTopBottom( true, false, 193, 241 )
	AATIcon:setYRot( -40 )
	AATIcon:setScale( 0.7 )
	AATIcon:subscribeToGlobalModel( controller, "CurrentWeapon", "aatIcon", function ( model )
		local aatIcon = Engine.GetModelValue( model )
		if aatIcon then
			AATIcon:setImage( RegisterImage( aatIcon ) )
		end
	end )
	self:addElement( AATIcon )
	self.AATIcon = AATIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )

				ZmPanelAmmoInt0:completeAnimation()
				self.ZmPanelAmmoInt0:setAlpha( 0 )
				self.clipFinished( ZmPanelAmmoInt0, {} )

				GlowOrange:completeAnimation()
				self.GlowOrange:setAlpha( 0 )
				self.clipFinished( GlowOrange, {} )

				GlowMultiply:completeAnimation()
				self.GlowMultiply:setAlpha( 0 )
				self.clipFinished( GlowMultiply, {} )

				ZmAmmoProp0:completeAnimation()
				self.ZmAmmoProp0:setLeftRight( true, false, 164.69, 398 )
				self.ZmAmmoProp0:setTopBottom( true, false, 62, 206 )
				self.ZmAmmoProp0:setRGB( 0.65, 0.53, 0.43 )
				self.ZmAmmoProp0:setAlpha( 0 )
				self.clipFinished( ZmAmmoProp0, {} )

				ZmAmmoClipInfo0:completeAnimation()

				ZmAmmoClipInfo0.Clip:completeAnimation()

				ZmAmmoClipInfo0.TotalAmmo:completeAnimation()

				ZmAmmoClipInfo0.Sword:completeAnimation()

				ZmAmmoClipInfo0.ClipDual:completeAnimation()
				self.ZmAmmoClipInfo0.Clip:setAlpha( 0 )
				self.ZmAmmoClipInfo0.TotalAmmo:setAlpha( 0 )
				self.ZmAmmoClipInfo0.Sword:setAlpha( 0 )
				self.ZmAmmoClipInfo0.ClipDual:setAlpha( 0 )
				self.clipFinished( ZmAmmoClipInfo0, {} )

				ZmAmmoEquipContainer0:completeAnimation()
				self.ZmAmmoEquipContainer0:setAlpha( 0 )
				self.clipFinished( ZmAmmoEquipContainer0, {} )

				Grid:completeAnimation()
				self.Grid:setAlpha( 0 )
				self.clipFinished( Grid, {} )

				ZmAmmoAttachmentInfo0:completeAnimation()
				self.ZmAmmoAttachmentInfo0:setLeftRight( true, false, 0, 316 )
				self.ZmAmmoAttachmentInfo0:setTopBottom( true, false, 163, 201 )
				self.ZmAmmoAttachmentInfo0:setAlpha( 0 )
				self.clipFinished( ZmAmmoAttachmentInfo0, {} )

				AmmoGlow:completeAnimation()
				self.AmmoGlow:setAlpha( 0 )
				self.clipFinished( AmmoGlow, {} )

				GlowNotif:completeAnimation()
				self.GlowNotif:setAlpha( 0 )
				self.clipFinished( GlowNotif, {} )

				Flsh:completeAnimation()
				self.Flsh:setAlpha( 0 )
				self.clipFinished( Flsh, {} )

				ZmAmmoBBGumMeterWidget:completeAnimation()
				self.ZmAmmoBBGumMeterWidget:setAlpha( 0 )
				self.clipFinished( ZmAmmoBBGumMeterWidget, {} )

				AATIcon:completeAnimation()
				self.AATIcon:setAlpha( 0 )
				self.clipFinished( AATIcon, {} )
			end,
			HudStart = function ()
				self:setupElementClipCounter( 13 )

				local ZmPanelAmmoInt0Frame2 = function ( ZmPanelAmmoInt0, event )
					if not event.interrupted then
						ZmPanelAmmoInt0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					ZmPanelAmmoInt0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( ZmPanelAmmoInt0, event )
					else
						ZmPanelAmmoInt0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ZmPanelAmmoInt0:completeAnimation()
				self.ZmPanelAmmoInt0:setAlpha( 0 )
				ZmPanelAmmoInt0Frame2( ZmPanelAmmoInt0, {} )
				local GlowOrangeFrame2 = function ( GlowOrange, event )
					local GlowOrangeFrame3 = function ( GlowOrange, event )
						if not event.interrupted then
							GlowOrange:beginAnimation( "keyframe", 579, false, false, CoD.TweenType.Linear )
						end
						GlowOrange:setAlpha( 0.23 )
						if event.interrupted then
							self.clipFinished( GlowOrange, event )
						else
							GlowOrange:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						GlowOrangeFrame3( GlowOrange, event )
						return 
					else
						GlowOrange:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
						GlowOrange:registerEventHandler( "transition_complete_keyframe", GlowOrangeFrame3 )
					end
				end
				
				GlowOrange:completeAnimation()
				self.GlowOrange:setAlpha( 0 )
				GlowOrangeFrame2( GlowOrange, {} )
				local GlowMultiplyFrame2 = function ( GlowMultiply, event )
					local GlowMultiplyFrame3 = function ( GlowMultiply, event )
						if not event.interrupted then
							GlowMultiply:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						end
						GlowMultiply:setAlpha( 0.4 )
						if event.interrupted then
							self.clipFinished( GlowMultiply, event )
						else
							GlowMultiply:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						GlowMultiplyFrame3( GlowMultiply, event )
						return 
					else
						GlowMultiply:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
						GlowMultiply:registerEventHandler( "transition_complete_keyframe", GlowMultiplyFrame3 )
					end
				end
				
				GlowMultiply:completeAnimation()
				self.GlowMultiply:setAlpha( 0 )
				GlowMultiplyFrame2( GlowMultiply, {} )
				local ZmAmmoProp0Frame2 = function ( ZmAmmoProp0, event )
					local ZmAmmoProp0Frame3 = function ( ZmAmmoProp0, event )
						if not event.interrupted then
							ZmAmmoProp0:beginAnimation( "keyframe", 640, false, true, CoD.TweenType.Linear )
						end
						ZmAmmoProp0:setLeftRight( true, false, 164.69, 398 )
						ZmAmmoProp0:setTopBottom( true, false, 62, 206 )
						ZmAmmoProp0:setRGB( 1, 1, 1 )
						ZmAmmoProp0:setAlpha( 1 )
						ZmAmmoProp0:setZoom( 0 )
						if event.interrupted then
							self.clipFinished( ZmAmmoProp0, event )
						else
							ZmAmmoProp0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ZmAmmoProp0Frame3( ZmAmmoProp0, event )
						return 
					else
						ZmAmmoProp0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						ZmAmmoProp0:registerEventHandler( "transition_complete_keyframe", ZmAmmoProp0Frame3 )
					end
				end
				
				ZmAmmoProp0:completeAnimation()
				self.ZmAmmoProp0:setLeftRight( true, false, 196.69, 430 )
				self.ZmAmmoProp0:setTopBottom( true, false, 45.54, 189.54 )
				self.ZmAmmoProp0:setRGB( 0.28, 0.16, 0.05 )
				self.ZmAmmoProp0:setAlpha( 0 )
				self.ZmAmmoProp0:setZoom( -46 )
				ZmAmmoProp0Frame2( ZmAmmoProp0, {} )
				local ZmAmmoClipInfo0Frame2 = function ( ZmAmmoClipInfo0, event )
					local ZmAmmoClipInfo0Frame3 = function ( ZmAmmoClipInfo0, event )
						local ZmAmmoClipInfo0Frame4 = function ( ZmAmmoClipInfo0, event )
							local ZmAmmoClipInfo0Frame5 = function ( ZmAmmoClipInfo0, event )
								if not event.interrupted then
									ZmAmmoClipInfo0:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Bounce )
									ZmAmmoClipInfo0.Clip:beginAnimation( "subkeyframe", 220, false, false, CoD.TweenType.Bounce )
									ZmAmmoClipInfo0.TotalAmmo:beginAnimation( "subkeyframe", 220, false, false, CoD.TweenType.Bounce )
									ZmAmmoClipInfo0.Sword:beginAnimation( "subkeyframe", 220, false, false, CoD.TweenType.Bounce )
									ZmAmmoClipInfo0.ClipDual:beginAnimation( "subkeyframe", 220, false, false, CoD.TweenType.Bounce )
								end
								ZmAmmoClipInfo0.Clip:setAlpha( 1 )
								ZmAmmoClipInfo0.TotalAmmo:setAlpha( 1 )
								ZmAmmoClipInfo0.Sword:setAlpha( 1 )
								ZmAmmoClipInfo0.ClipDual:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( ZmAmmoClipInfo0, event )
								else
									ZmAmmoClipInfo0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								ZmAmmoClipInfo0Frame5( ZmAmmoClipInfo0, event )
								return 
							else
								ZmAmmoClipInfo0:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Bounce )
								ZmAmmoClipInfo0.TotalAmmo:beginAnimation( "subkeyframe", 240, false, false, CoD.TweenType.Bounce )
								ZmAmmoClipInfo0.TotalAmmo:setAlpha( 1 )
								ZmAmmoClipInfo0:registerEventHandler( "transition_complete_keyframe", ZmAmmoClipInfo0Frame5 )
							end
						end
						
						if event.interrupted then
							ZmAmmoClipInfo0Frame4( ZmAmmoClipInfo0, event )
							return 
						else
							ZmAmmoClipInfo0:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Bounce )
							ZmAmmoClipInfo0.Clip:beginAnimation( "subkeyframe", 259, false, false, CoD.TweenType.Bounce )
							ZmAmmoClipInfo0.Sword:beginAnimation( "subkeyframe", 259, false, false, CoD.TweenType.Bounce )
							ZmAmmoClipInfo0.Clip:setAlpha( 1 )
							ZmAmmoClipInfo0.Sword:setAlpha( 1 )
							ZmAmmoClipInfo0:registerEventHandler( "transition_complete_keyframe", ZmAmmoClipInfo0Frame4 )
						end
					end
					
					if event.interrupted then
						ZmAmmoClipInfo0Frame3( ZmAmmoClipInfo0, event )
						return 
					else
						ZmAmmoClipInfo0:beginAnimation( "keyframe", 720, false, false, CoD.TweenType.Linear )
						ZmAmmoClipInfo0:registerEventHandler( "transition_complete_keyframe", ZmAmmoClipInfo0Frame3 )
					end
				end
				
				ZmAmmoClipInfo0:completeAnimation()

				ZmAmmoClipInfo0.Clip:completeAnimation()

				ZmAmmoClipInfo0.TotalAmmo:completeAnimation()

				ZmAmmoClipInfo0.Sword:completeAnimation()

				ZmAmmoClipInfo0.ClipDual:completeAnimation()
				self.ZmAmmoClipInfo0.Clip:setAlpha( 0 )
				self.ZmAmmoClipInfo0.TotalAmmo:setAlpha( 0 )
				self.ZmAmmoClipInfo0.Sword:setAlpha( 0 )
				self.ZmAmmoClipInfo0.ClipDual:setAlpha( 0 )
				ZmAmmoClipInfo0Frame2( ZmAmmoClipInfo0, {} )
				local ZmAmmoEquipContainer0Frame2 = function ( ZmAmmoEquipContainer0, event )
					local ZmAmmoEquipContainer0Frame3 = function ( ZmAmmoEquipContainer0, event )
						if not event.interrupted then
							ZmAmmoEquipContainer0:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Bounce )
						end
						ZmAmmoEquipContainer0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( ZmAmmoEquipContainer0, event )
						else
							ZmAmmoEquipContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ZmAmmoEquipContainer0Frame3( ZmAmmoEquipContainer0, event )
						return 
					else
						ZmAmmoEquipContainer0:beginAnimation( "keyframe", 1210, false, false, CoD.TweenType.Linear )
						ZmAmmoEquipContainer0:registerEventHandler( "transition_complete_keyframe", ZmAmmoEquipContainer0Frame3 )
					end
				end
				
				ZmAmmoEquipContainer0:completeAnimation()
				self.ZmAmmoEquipContainer0:setAlpha( 0 )
				ZmAmmoEquipContainer0Frame2( ZmAmmoEquipContainer0, {} )
				local GridFrame2 = function ( Grid, event )
					local GridFrame3 = function ( Grid, event )
						if not event.interrupted then
							Grid:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
						end
						Grid:setAlpha( 0.72 )
						if event.interrupted then
							self.clipFinished( Grid, event )
						else
							Grid:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						GridFrame3( Grid, event )
						return 
					else
						Grid:beginAnimation( "keyframe", 720, false, false, CoD.TweenType.Linear )
						Grid:registerEventHandler( "transition_complete_keyframe", GridFrame3 )
					end
				end
				
				Grid:completeAnimation()
				self.Grid:setAlpha( 0 )
				GridFrame2( Grid, {} )
				local ZmAmmoAttachmentInfo0Frame2 = function ( ZmAmmoAttachmentInfo0, event )
					local ZmAmmoAttachmentInfo0Frame3 = function ( ZmAmmoAttachmentInfo0, event )
						if not event.interrupted then
							ZmAmmoAttachmentInfo0:beginAnimation( "keyframe", 199, false, true, CoD.TweenType.Linear )
						end
						ZmAmmoAttachmentInfo0:setLeftRight( true, false, -40, 276 )
						ZmAmmoAttachmentInfo0:setTopBottom( true, false, 148, 186 )
						ZmAmmoAttachmentInfo0:setAlpha( 1 )
						ZmAmmoAttachmentInfo0:setZoom( 0 )
						if event.interrupted then
							self.clipFinished( ZmAmmoAttachmentInfo0, event )
						else
							ZmAmmoAttachmentInfo0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ZmAmmoAttachmentInfo0Frame3( ZmAmmoAttachmentInfo0, event )
						return 
					else
						ZmAmmoAttachmentInfo0:beginAnimation( "keyframe", 1360, false, false, CoD.TweenType.Linear )
						ZmAmmoAttachmentInfo0:setLeftRight( true, false, 50, 366 )
						ZmAmmoAttachmentInfo0:setTopBottom( true, false, 138, 176 )
						ZmAmmoAttachmentInfo0:registerEventHandler( "transition_complete_keyframe", ZmAmmoAttachmentInfo0Frame3 )
					end
				end
				
				ZmAmmoAttachmentInfo0:completeAnimation()
				self.ZmAmmoAttachmentInfo0:setLeftRight( true, false, 40, 356 )
				self.ZmAmmoAttachmentInfo0:setTopBottom( true, false, 153, 191 )
				self.ZmAmmoAttachmentInfo0:setAlpha( 0 )
				self.ZmAmmoAttachmentInfo0:setZoom( -41 )
				ZmAmmoAttachmentInfo0Frame2( ZmAmmoAttachmentInfo0, {} )
				local AmmoGlowFrame2 = function ( AmmoGlow, event )
					local AmmoGlowFrame3 = function ( AmmoGlow, event )
						if not event.interrupted then
							AmmoGlow:beginAnimation( "keyframe", 669, false, false, CoD.TweenType.Bounce )
						end
						AmmoGlow:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( AmmoGlow, event )
						else
							AmmoGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						AmmoGlowFrame3( AmmoGlow, event )
						return 
					else
						AmmoGlow:beginAnimation( "keyframe", 730, false, false, CoD.TweenType.Linear )
						AmmoGlow:registerEventHandler( "transition_complete_keyframe", AmmoGlowFrame3 )
					end
				end
				
				AmmoGlow:completeAnimation()
				self.AmmoGlow:setAlpha( 0 )
				AmmoGlowFrame2( AmmoGlow, {} )
				local GlowNotifFrame2 = function ( GlowNotif, event )
					local GlowNotifFrame3 = function ( GlowNotif, event )
						local GlowNotifFrame4 = function ( GlowNotif, event )
							if not event.interrupted then
								GlowNotif:beginAnimation( "keyframe", 269, false, false, CoD.TweenType.Bounce )
							end
							GlowNotif:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( GlowNotif, event )
							else
								GlowNotif:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							GlowNotifFrame4( GlowNotif, event )
							return 
						else
							GlowNotif:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Bounce )
							GlowNotif:setAlpha( 1 )
							GlowNotif:registerEventHandler( "transition_complete_keyframe", GlowNotifFrame4 )
						end
					end
					
					if event.interrupted then
						GlowNotifFrame3( GlowNotif, event )
						return 
					else
						GlowNotif:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						GlowNotif:registerEventHandler( "transition_complete_keyframe", GlowNotifFrame3 )
					end
				end
				
				GlowNotif:completeAnimation()
				self.GlowNotif:setAlpha( 0 )
				GlowNotifFrame2( GlowNotif, {} )
				local FlshFrame2 = function ( Flsh, event )
					local FlshFrame3 = function ( Flsh, event )
						local FlshFrame4 = function ( Flsh, event )
							if not event.interrupted then
								Flsh:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Linear )
							end
							Flsh:setLeftRight( true, false, 14.35, 423.34 )
							Flsh:setTopBottom( true, false, 103.25, 176 )
							Flsh:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Flsh, event )
							else
								Flsh:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							FlshFrame4( Flsh, event )
							return 
						else
							Flsh:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
							Flsh:setLeftRight( true, false, 14.35, 423.34 )
							Flsh:setTopBottom( true, false, 103.25, 176 )
							Flsh:setAlpha( 1 )
							Flsh:registerEventHandler( "transition_complete_keyframe", FlshFrame4 )
						end
					end
					
					if event.interrupted then
						FlshFrame3( Flsh, event )
						return 
					else
						Flsh:beginAnimation( "keyframe", 939, false, false, CoD.TweenType.Linear )
						Flsh:registerEventHandler( "transition_complete_keyframe", FlshFrame3 )
					end
				end
				
				Flsh:completeAnimation()
				self.Flsh:setLeftRight( true, false, 223.01, 287 )
				self.Flsh:setTopBottom( true, false, 108, 171.5 )
				self.Flsh:setAlpha( 0 )
				FlshFrame2( Flsh, {} )
				local ZmAmmoBBGumMeterWidgetFrame2 = function ( ZmAmmoBBGumMeterWidget, event )
					local ZmAmmoBBGumMeterWidgetFrame3 = function ( ZmAmmoBBGumMeterWidget, event )
						if not event.interrupted then
							ZmAmmoBBGumMeterWidget:beginAnimation( "keyframe", 269, false, false, CoD.TweenType.Linear )
						end
						ZmAmmoBBGumMeterWidget:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( ZmAmmoBBGumMeterWidget, event )
						else
							ZmAmmoBBGumMeterWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ZmAmmoBBGumMeterWidgetFrame3( ZmAmmoBBGumMeterWidget, event )
						return 
					else
						ZmAmmoBBGumMeterWidget:beginAnimation( "keyframe", 870, false, false, CoD.TweenType.Linear )
						ZmAmmoBBGumMeterWidget:registerEventHandler( "transition_complete_keyframe", ZmAmmoBBGumMeterWidgetFrame3 )
					end
				end
				
				ZmAmmoBBGumMeterWidget:completeAnimation()
				self.ZmAmmoBBGumMeterWidget:setAlpha( 0 )
				ZmAmmoBBGumMeterWidgetFrame2( ZmAmmoBBGumMeterWidget, {} )
				local AATIconFrame2 = function ( AATIcon, event )
					local AATIconFrame3 = function ( AATIcon, event )
						if not event.interrupted then
							AATIcon:beginAnimation( "keyframe", 240, true, false, CoD.TweenType.Bounce )
						end
						AATIcon:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( AATIcon, event )
						else
							AATIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						AATIconFrame3( AATIcon, event )
						return 
					else
						AATIcon:beginAnimation( "keyframe", 1379, false, false, CoD.TweenType.Linear )
						AATIcon:registerEventHandler( "transition_complete_keyframe", AATIconFrame3 )
					end
				end
				
				AATIcon:completeAnimation()
				self.AATIcon:setAlpha( 0 )
				AATIconFrame2( AATIcon, {} )
			end,
			HudStart_NoAmmo = function ()
				self:setupElementClipCounter( 12 )

				local ZmPanelAmmoInt0Frame2 = function ( ZmPanelAmmoInt0, event )
					if not event.interrupted then
						ZmPanelAmmoInt0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					ZmPanelAmmoInt0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( ZmPanelAmmoInt0, event )
					else
						ZmPanelAmmoInt0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ZmPanelAmmoInt0:completeAnimation()
				self.ZmPanelAmmoInt0:setAlpha( 0 )
				ZmPanelAmmoInt0Frame2( ZmPanelAmmoInt0, {} )
				local GlowOrangeFrame2 = function ( GlowOrange, event )
					local GlowOrangeFrame3 = function ( GlowOrange, event )
						if not event.interrupted then
							GlowOrange:beginAnimation( "keyframe", 579, false, false, CoD.TweenType.Linear )
						end
						GlowOrange:setAlpha( 0.23 )
						if event.interrupted then
							self.clipFinished( GlowOrange, event )
						else
							GlowOrange:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						GlowOrangeFrame3( GlowOrange, event )
						return 
					else
						GlowOrange:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
						GlowOrange:registerEventHandler( "transition_complete_keyframe", GlowOrangeFrame3 )
					end
				end
				
				GlowOrange:completeAnimation()
				self.GlowOrange:setAlpha( 0 )
				GlowOrangeFrame2( GlowOrange, {} )
				local GlowMultiplyFrame2 = function ( GlowMultiply, event )
					local GlowMultiplyFrame3 = function ( GlowMultiply, event )
						if not event.interrupted then
							GlowMultiply:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						end
						GlowMultiply:setAlpha( 0.4 )
						if event.interrupted then
							self.clipFinished( GlowMultiply, event )
						else
							GlowMultiply:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						GlowMultiplyFrame3( GlowMultiply, event )
						return 
					else
						GlowMultiply:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
						GlowMultiply:registerEventHandler( "transition_complete_keyframe", GlowMultiplyFrame3 )
					end
				end
				
				GlowMultiply:completeAnimation()
				self.GlowMultiply:setAlpha( 0 )
				GlowMultiplyFrame2( GlowMultiply, {} )
				local ZmAmmoProp0Frame2 = function ( ZmAmmoProp0, event )
					local ZmAmmoProp0Frame3 = function ( ZmAmmoProp0, event )
						if not event.interrupted then
							ZmAmmoProp0:beginAnimation( "keyframe", 640, false, true, CoD.TweenType.Linear )
						end
						ZmAmmoProp0:setLeftRight( true, false, 164.69, 398 )
						ZmAmmoProp0:setTopBottom( true, false, 62, 206 )
						ZmAmmoProp0:setRGB( 1, 1, 1 )
						ZmAmmoProp0:setAlpha( 1 )
						ZmAmmoProp0:setZoom( 0 )
						if event.interrupted then
							self.clipFinished( ZmAmmoProp0, event )
						else
							ZmAmmoProp0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ZmAmmoProp0Frame3( ZmAmmoProp0, event )
						return 
					else
						ZmAmmoProp0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						ZmAmmoProp0:registerEventHandler( "transition_complete_keyframe", ZmAmmoProp0Frame3 )
					end
				end
				
				ZmAmmoProp0:completeAnimation()
				self.ZmAmmoProp0:setLeftRight( true, false, 196.69, 430 )
				self.ZmAmmoProp0:setTopBottom( true, false, 45.54, 189.54 )
				self.ZmAmmoProp0:setRGB( 0.28, 0.16, 0.05 )
				self.ZmAmmoProp0:setAlpha( 0 )
				self.ZmAmmoProp0:setZoom( -46 )
				ZmAmmoProp0Frame2( ZmAmmoProp0, {} )
				local ZmAmmoEquipContainer0Frame2 = function ( ZmAmmoEquipContainer0, event )
					local ZmAmmoEquipContainer0Frame3 = function ( ZmAmmoEquipContainer0, event )
						if not event.interrupted then
							ZmAmmoEquipContainer0:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Bounce )
						end
						ZmAmmoEquipContainer0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( ZmAmmoEquipContainer0, event )
						else
							ZmAmmoEquipContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ZmAmmoEquipContainer0Frame3( ZmAmmoEquipContainer0, event )
						return 
					else
						ZmAmmoEquipContainer0:beginAnimation( "keyframe", 1210, false, false, CoD.TweenType.Linear )
						ZmAmmoEquipContainer0:registerEventHandler( "transition_complete_keyframe", ZmAmmoEquipContainer0Frame3 )
					end
				end
				
				ZmAmmoEquipContainer0:completeAnimation()
				self.ZmAmmoEquipContainer0:setAlpha( 0 )
				ZmAmmoEquipContainer0Frame2( ZmAmmoEquipContainer0, {} )
				local GridFrame2 = function ( Grid, event )
					local GridFrame3 = function ( Grid, event )
						if not event.interrupted then
							Grid:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
						end
						Grid:setAlpha( 0.72 )
						if event.interrupted then
							self.clipFinished( Grid, event )
						else
							Grid:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						GridFrame3( Grid, event )
						return 
					else
						Grid:beginAnimation( "keyframe", 720, false, false, CoD.TweenType.Linear )
						Grid:registerEventHandler( "transition_complete_keyframe", GridFrame3 )
					end
				end
				
				Grid:completeAnimation()
				self.Grid:setAlpha( 0 )
				GridFrame2( Grid, {} )
				local ZmAmmoAttachmentInfo0Frame2 = function ( ZmAmmoAttachmentInfo0, event )
					local ZmAmmoAttachmentInfo0Frame3 = function ( ZmAmmoAttachmentInfo0, event )
						if not event.interrupted then
							ZmAmmoAttachmentInfo0:beginAnimation( "keyframe", 199, false, true, CoD.TweenType.Linear )
						end
						ZmAmmoAttachmentInfo0:setLeftRight( true, false, -40, 276 )
						ZmAmmoAttachmentInfo0:setTopBottom( true, false, 148, 186 )
						ZmAmmoAttachmentInfo0:setAlpha( 1 )
						ZmAmmoAttachmentInfo0:setZoom( 0 )
						if event.interrupted then
							self.clipFinished( ZmAmmoAttachmentInfo0, event )
						else
							ZmAmmoAttachmentInfo0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ZmAmmoAttachmentInfo0Frame3( ZmAmmoAttachmentInfo0, event )
						return 
					else
						ZmAmmoAttachmentInfo0:beginAnimation( "keyframe", 1360, false, false, CoD.TweenType.Linear )
						ZmAmmoAttachmentInfo0:setLeftRight( true, false, 50, 366 )
						ZmAmmoAttachmentInfo0:setTopBottom( true, false, 138, 176 )
						ZmAmmoAttachmentInfo0:registerEventHandler( "transition_complete_keyframe", ZmAmmoAttachmentInfo0Frame3 )
					end
				end
				
				ZmAmmoAttachmentInfo0:completeAnimation()
				self.ZmAmmoAttachmentInfo0:setLeftRight( true, false, 40, 356 )
				self.ZmAmmoAttachmentInfo0:setTopBottom( true, false, 153, 191 )
				self.ZmAmmoAttachmentInfo0:setAlpha( 0 )
				self.ZmAmmoAttachmentInfo0:setZoom( -41 )
				ZmAmmoAttachmentInfo0Frame2( ZmAmmoAttachmentInfo0, {} )
				local AmmoGlowFrame2 = function ( AmmoGlow, event )
					local AmmoGlowFrame3 = function ( AmmoGlow, event )
						if not event.interrupted then
							AmmoGlow:beginAnimation( "keyframe", 669, false, false, CoD.TweenType.Bounce )
						end
						AmmoGlow:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( AmmoGlow, event )
						else
							AmmoGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						AmmoGlowFrame3( AmmoGlow, event )
						return 
					else
						AmmoGlow:beginAnimation( "keyframe", 730, false, false, CoD.TweenType.Linear )
						AmmoGlow:registerEventHandler( "transition_complete_keyframe", AmmoGlowFrame3 )
					end
				end
				
				AmmoGlow:completeAnimation()
				self.AmmoGlow:setAlpha( 0 )
				AmmoGlowFrame2( AmmoGlow, {} )
				local GlowNotifFrame2 = function ( GlowNotif, event )
					local GlowNotifFrame3 = function ( GlowNotif, event )
						local GlowNotifFrame4 = function ( GlowNotif, event )
							if not event.interrupted then
								GlowNotif:beginAnimation( "keyframe", 269, false, false, CoD.TweenType.Bounce )
							end
							GlowNotif:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( GlowNotif, event )
							else
								GlowNotif:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							GlowNotifFrame4( GlowNotif, event )
							return 
						else
							GlowNotif:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Bounce )
							GlowNotif:setAlpha( 1 )
							GlowNotif:registerEventHandler( "transition_complete_keyframe", GlowNotifFrame4 )
						end
					end
					
					if event.interrupted then
						GlowNotifFrame3( GlowNotif, event )
						return 
					else
						GlowNotif:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						GlowNotif:registerEventHandler( "transition_complete_keyframe", GlowNotifFrame3 )
					end
				end
				
				GlowNotif:completeAnimation()
				self.GlowNotif:setAlpha( 0 )
				GlowNotifFrame2( GlowNotif, {} )
				local FlshFrame2 = function ( Flsh, event )
					local FlshFrame3 = function ( Flsh, event )
						local FlshFrame4 = function ( Flsh, event )
							if not event.interrupted then
								Flsh:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Linear )
							end
							Flsh:setLeftRight( true, false, 14.35, 423.34 )
							Flsh:setTopBottom( true, false, 103.25, 176 )
							Flsh:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Flsh, event )
							else
								Flsh:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							FlshFrame4( Flsh, event )
							return 
						else
							Flsh:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
							Flsh:setLeftRight( true, false, 14.35, 423.34 )
							Flsh:setTopBottom( true, false, 103.25, 176 )
							Flsh:setAlpha( 1 )
							Flsh:registerEventHandler( "transition_complete_keyframe", FlshFrame4 )
						end
					end
					
					if event.interrupted then
						FlshFrame3( Flsh, event )
						return 
					else
						Flsh:beginAnimation( "keyframe", 939, false, false, CoD.TweenType.Linear )
						Flsh:registerEventHandler( "transition_complete_keyframe", FlshFrame3 )
					end
				end
				
				Flsh:completeAnimation()
				self.Flsh:setLeftRight( true, false, 223.01, 287 )
				self.Flsh:setTopBottom( true, false, 108, 171.5 )
				self.Flsh:setAlpha( 0 )
				FlshFrame2( Flsh, {} )
				local ZmAmmoBBGumMeterWidgetFrame2 = function ( ZmAmmoBBGumMeterWidget, event )
					local ZmAmmoBBGumMeterWidgetFrame3 = function ( ZmAmmoBBGumMeterWidget, event )
						if not event.interrupted then
							ZmAmmoBBGumMeterWidget:beginAnimation( "keyframe", 269, false, false, CoD.TweenType.Linear )
						end
						ZmAmmoBBGumMeterWidget:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( ZmAmmoBBGumMeterWidget, event )
						else
							ZmAmmoBBGumMeterWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ZmAmmoBBGumMeterWidgetFrame3( ZmAmmoBBGumMeterWidget, event )
						return 
					else
						ZmAmmoBBGumMeterWidget:beginAnimation( "keyframe", 870, false, false, CoD.TweenType.Linear )
						ZmAmmoBBGumMeterWidget:registerEventHandler( "transition_complete_keyframe", ZmAmmoBBGumMeterWidgetFrame3 )
					end
				end
				
				ZmAmmoBBGumMeterWidget:completeAnimation()
				self.ZmAmmoBBGumMeterWidget:setAlpha( 0 )
				ZmAmmoBBGumMeterWidgetFrame2( ZmAmmoBBGumMeterWidget, {} )
				local AATIconFrame2 = function ( AATIcon, event )
					local AATIconFrame3 = function ( AATIcon, event )
						if not event.interrupted then
							AATIcon:beginAnimation( "keyframe", 240, true, false, CoD.TweenType.Bounce )
						end
						AATIcon:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( AATIcon, event )
						else
							AATIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						AATIconFrame3( AATIcon, event )
						return 
					else
						AATIcon:beginAnimation( "keyframe", 1379, false, false, CoD.TweenType.Linear )
						AATIcon:registerEventHandler( "transition_complete_keyframe", AATIconFrame3 )
					end
				end
				
				AATIcon:completeAnimation()
				self.AATIcon:setAlpha( 0 )
				AATIconFrame2( AATIcon, {} )
			end
		},
		HudStart = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )

				ZmPanelAmmoInt0:completeAnimation()
				self.ZmPanelAmmoInt0:setAlpha( 1 )
				self.clipFinished( ZmPanelAmmoInt0, {} )

				GlowOrange:completeAnimation()
				self.GlowOrange:setAlpha( 0.23 )
				self.clipFinished( GlowOrange, {} )

				GlowMultiply:completeAnimation()
				self.GlowMultiply:setAlpha( 0.4 )
				self.clipFinished( GlowMultiply, {} )

				ZmAmmoProp0:completeAnimation()
				self.ZmAmmoProp0:setLeftRight( true, false, 164.69, 398 )
				self.ZmAmmoProp0:setTopBottom( true, false, 62, 206 )
				self.ZmAmmoProp0:setRGB( 1, 1, 1 )
				self.ZmAmmoProp0:setAlpha( 1 )
				self.ZmAmmoProp0:setZoom( 0 )
				self.clipFinished( ZmAmmoProp0, {} )

				ZmAmmoClipInfo0:completeAnimation()

				ZmAmmoClipInfo0.Clip:completeAnimation()

				ZmAmmoClipInfo0.TotalAmmo:completeAnimation()

				ZmAmmoClipInfo0.Sword:completeAnimation()

				ZmAmmoClipInfo0.ClipDual:completeAnimation()
				self.ZmAmmoClipInfo0.Clip:setAlpha( 1 )
				self.ZmAmmoClipInfo0.TotalAmmo:setAlpha( 1 )
				self.ZmAmmoClipInfo0.Sword:setAlpha( 1 )
				self.ZmAmmoClipInfo0.ClipDual:setAlpha( 1 )
				self.clipFinished( ZmAmmoClipInfo0, {} )

				ZmAmmoEquipContainer0:completeAnimation()
				self.ZmAmmoEquipContainer0:setAlpha( 1 )
				self.clipFinished( ZmAmmoEquipContainer0, {} )

				Grid:completeAnimation()
				self.Grid:setAlpha( 0.72 )
				self.clipFinished( Grid, {} )

				ZmAmmoAttachmentInfo0:completeAnimation()
				self.ZmAmmoAttachmentInfo0:setLeftRight( true, false, -40, 276 )
				self.ZmAmmoAttachmentInfo0:setTopBottom( true, false, 148, 186 )
				self.ZmAmmoAttachmentInfo0:setAlpha( 1 )
				self.ZmAmmoAttachmentInfo0:setZoom( 0 )
				self.clipFinished( ZmAmmoAttachmentInfo0, {} )

				AmmoGlow:completeAnimation()
				self.AmmoGlow:setLeftRight( true, false, 72.5, 430 )
				self.AmmoGlow:setTopBottom( true, false, -8.96, 266.04 )
				self.AmmoGlow:setAlpha( 1 )
				self.clipFinished( AmmoGlow, {} )

				GlowNotif:completeAnimation()
				self.GlowNotif:setAlpha( 0 )
				self.clipFinished( GlowNotif, {} )

				Flsh:completeAnimation()
				self.Flsh:setAlpha( 0 )
				self.clipFinished( Flsh, {} )

				ZmAmmoBBGumMeterWidget:completeAnimation()
				self.ZmAmmoBBGumMeterWidget:setAlpha( 1 )
				self.clipFinished( ZmAmmoBBGumMeterWidget, {} )

				AATIcon:completeAnimation()
				self.AATIcon:setAlpha( 1 )
				self.clipFinished( AATIcon, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 11 )

				local ZmPanelAmmoInt0Frame2 = function ( ZmPanelAmmoInt0, event )
					if not event.interrupted then
						ZmPanelAmmoInt0:beginAnimation( "keyframe", 889, false, false, CoD.TweenType.Linear )
					end
					ZmPanelAmmoInt0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ZmPanelAmmoInt0, event )
					else
						ZmPanelAmmoInt0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ZmPanelAmmoInt0:completeAnimation()
				self.ZmPanelAmmoInt0:setAlpha( 1 )
				ZmPanelAmmoInt0Frame2( ZmPanelAmmoInt0, {} )
				local GlowOrangeFrame2 = function ( GlowOrange, event )
					if not event.interrupted then
						GlowOrange:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Linear )
					end
					GlowOrange:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( GlowOrange, event )
					else
						GlowOrange:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GlowOrange:completeAnimation()
				self.GlowOrange:setAlpha( 0.23 )
				GlowOrangeFrame2( GlowOrange, {} )
				local GlowMultiplyFrame2 = function ( GlowMultiply, event )
					if not event.interrupted then
						GlowMultiply:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Linear )
					end
					GlowMultiply:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( GlowMultiply, event )
					else
						GlowMultiply:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GlowMultiply:completeAnimation()
				self.GlowMultiply:setAlpha( 0.4 )
				GlowMultiplyFrame2( GlowMultiply, {} )
				local ZmAmmoProp0Frame2 = function ( ZmAmmoProp0, event )
					if not event.interrupted then
						ZmAmmoProp0:beginAnimation( "keyframe", 779, true, false, CoD.TweenType.Linear )
					end
					ZmAmmoProp0:setLeftRight( true, false, 196.69, 430 )
					ZmAmmoProp0:setTopBottom( true, false, 45.54, 189.54 )
					ZmAmmoProp0:setRGB( 0.28, 0.16, 0.05 )
					ZmAmmoProp0:setAlpha( 0 )
					ZmAmmoProp0:setZoom( -46 )
					if event.interrupted then
						self.clipFinished( ZmAmmoProp0, event )
					else
						ZmAmmoProp0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ZmAmmoProp0:completeAnimation()
				self.ZmAmmoProp0:setLeftRight( true, false, 164.69, 398 )
				self.ZmAmmoProp0:setTopBottom( true, false, 62, 206 )
				self.ZmAmmoProp0:setRGB( 1, 1, 1 )
				self.ZmAmmoProp0:setAlpha( 1 )
				self.ZmAmmoProp0:setZoom( 0 )
				ZmAmmoProp0Frame2( ZmAmmoProp0, {} )
				local ZmAmmoClipInfo0Frame2 = function ( ZmAmmoClipInfo0, event )
					local ZmAmmoClipInfo0Frame3 = function ( ZmAmmoClipInfo0, event )
						local ZmAmmoClipInfo0Frame4 = function ( ZmAmmoClipInfo0, event )
							if not event.interrupted then
								ZmAmmoClipInfo0:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Bounce )
								ZmAmmoClipInfo0.Clip:beginAnimation( "subkeyframe", 140, false, false, CoD.TweenType.Bounce )
								ZmAmmoClipInfo0.TotalAmmo:beginAnimation( "subkeyframe", 140, false, false, CoD.TweenType.Bounce )
								ZmAmmoClipInfo0.Sword:beginAnimation( "subkeyframe", 140, false, false, CoD.TweenType.Bounce )
								ZmAmmoClipInfo0.ClipDual:beginAnimation( "subkeyframe", 140, false, false, CoD.TweenType.Bounce )
							end
							ZmAmmoClipInfo0.Clip:setAlpha( 0 )
							ZmAmmoClipInfo0.TotalAmmo:setAlpha( 0 )
							ZmAmmoClipInfo0.Sword:setAlpha( 0 )
							ZmAmmoClipInfo0.ClipDual:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( ZmAmmoClipInfo0, event )
							else
								ZmAmmoClipInfo0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ZmAmmoClipInfo0Frame4( ZmAmmoClipInfo0, event )
							return 
						else
							ZmAmmoClipInfo0:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Bounce )
							ZmAmmoClipInfo0.TotalAmmo:beginAnimation( "subkeyframe", 120, false, false, CoD.TweenType.Bounce )
							ZmAmmoClipInfo0.ClipDual:beginAnimation( "subkeyframe", 120, false, false, CoD.TweenType.Bounce )
							ZmAmmoClipInfo0.TotalAmmo:setAlpha( 0 )
							ZmAmmoClipInfo0.ClipDual:setAlpha( 0.28 )
							ZmAmmoClipInfo0:registerEventHandler( "transition_complete_keyframe", ZmAmmoClipInfo0Frame4 )
						end
					end
					
					if event.interrupted then
						ZmAmmoClipInfo0Frame3( ZmAmmoClipInfo0, event )
						return 
					else
						ZmAmmoClipInfo0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						ZmAmmoClipInfo0.Clip:beginAnimation( "subkeyframe", 79, false, false, CoD.TweenType.Linear )
						ZmAmmoClipInfo0.TotalAmmo:beginAnimation( "subkeyframe", 79, false, false, CoD.TweenType.Linear )
						ZmAmmoClipInfo0.Sword:beginAnimation( "subkeyframe", 79, false, false, CoD.TweenType.Linear )
						ZmAmmoClipInfo0.ClipDual:beginAnimation( "subkeyframe", 79, false, false, CoD.TweenType.Linear )
						ZmAmmoClipInfo0.Clip:setAlpha( 0 )
						ZmAmmoClipInfo0.TotalAmmo:setAlpha( 0.11 )
						ZmAmmoClipInfo0.Sword:setAlpha( 0 )
						ZmAmmoClipInfo0.ClipDual:setAlpha( 0.58 )
						ZmAmmoClipInfo0:registerEventHandler( "transition_complete_keyframe", ZmAmmoClipInfo0Frame3 )
					end
				end
				
				ZmAmmoClipInfo0:completeAnimation()

				ZmAmmoClipInfo0.Clip:completeAnimation()

				ZmAmmoClipInfo0.TotalAmmo:completeAnimation()

				ZmAmmoClipInfo0.Sword:completeAnimation()

				ZmAmmoClipInfo0.ClipDual:completeAnimation()
				self.ZmAmmoClipInfo0.Clip:setAlpha( 1 )
				self.ZmAmmoClipInfo0.TotalAmmo:setAlpha( 1 )
				self.ZmAmmoClipInfo0.Sword:setAlpha( 1 )
				self.ZmAmmoClipInfo0.ClipDual:setAlpha( 1 )
				ZmAmmoClipInfo0Frame2( ZmAmmoClipInfo0, {} )
				local ZmAmmoEquipContainer0Frame2 = function ( ZmAmmoEquipContainer0, event )
					if not event.interrupted then
						ZmAmmoEquipContainer0:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Bounce )
					end
					ZmAmmoEquipContainer0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ZmAmmoEquipContainer0, event )
					else
						ZmAmmoEquipContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ZmAmmoEquipContainer0:completeAnimation()
				self.ZmAmmoEquipContainer0:setAlpha( 1 )
				ZmAmmoEquipContainer0Frame2( ZmAmmoEquipContainer0, {} )
				local GridFrame2 = function ( Grid, event )
					if not event.interrupted then
						Grid:beginAnimation( "keyframe", 469, false, false, CoD.TweenType.Linear )
					end
					Grid:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Grid, event )
					else
						Grid:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Grid:completeAnimation()
				self.Grid:setAlpha( 0.72 )
				GridFrame2( Grid, {} )
				local ZmAmmoAttachmentInfo0Frame2 = function ( ZmAmmoAttachmentInfo0, event )
					if not event.interrupted then
						ZmAmmoAttachmentInfo0:beginAnimation( "keyframe", 370, true, false, CoD.TweenType.Linear )
					end
					ZmAmmoAttachmentInfo0:setLeftRight( true, false, 50, 366 )
					ZmAmmoAttachmentInfo0:setTopBottom( true, false, 138, 176 )
					ZmAmmoAttachmentInfo0:setAlpha( 0 )
					ZmAmmoAttachmentInfo0:setZoom( -41 )
					if event.interrupted then
						self.clipFinished( ZmAmmoAttachmentInfo0, event )
					else
						ZmAmmoAttachmentInfo0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ZmAmmoAttachmentInfo0:completeAnimation()
				self.ZmAmmoAttachmentInfo0:setLeftRight( true, false, -40, 276 )
				self.ZmAmmoAttachmentInfo0:setTopBottom( true, false, 148, 186 )
				self.ZmAmmoAttachmentInfo0:setAlpha( 1 )
				self.ZmAmmoAttachmentInfo0:setZoom( 0 )
				ZmAmmoAttachmentInfo0Frame2( ZmAmmoAttachmentInfo0, {} )
				local AmmoGlowFrame2 = function ( AmmoGlow, event )
					if not event.interrupted then
						AmmoGlow:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
					end
					AmmoGlow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AmmoGlow, event )
					else
						AmmoGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AmmoGlow:completeAnimation()
				self.AmmoGlow:setAlpha( 1 )
				AmmoGlowFrame2( AmmoGlow, {} )
				local ZmAmmoBBGumMeterWidgetFrame2 = function ( ZmAmmoBBGumMeterWidget, event )
					if not event.interrupted then
						ZmAmmoBBGumMeterWidget:beginAnimation( "keyframe", 810, false, false, CoD.TweenType.Linear )
					end
					ZmAmmoBBGumMeterWidget:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ZmAmmoBBGumMeterWidget, event )
					else
						ZmAmmoBBGumMeterWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ZmAmmoBBGumMeterWidget:completeAnimation()
				self.ZmAmmoBBGumMeterWidget:setAlpha( 1 )
				ZmAmmoBBGumMeterWidgetFrame2( ZmAmmoBBGumMeterWidget, {} )
				local AATIconFrame2 = function ( AATIcon, event )
					if not event.interrupted then
						AATIcon:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
					end
					AATIcon:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AATIcon, event )
					else
						AATIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AATIcon:completeAnimation()
				self.AATIcon:setAlpha( 1 )
				AATIconFrame2( AATIcon, {} )
			end
		},
		HudStart_NoAmmo = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )

				ZmPanelAmmoInt0:completeAnimation()
				self.ZmPanelAmmoInt0:setAlpha( 1 )
				self.clipFinished( ZmPanelAmmoInt0, {} )

				GlowOrange:completeAnimation()
				self.GlowOrange:setAlpha( 0.23 )
				self.clipFinished( GlowOrange, {} )

				GlowMultiply:completeAnimation()
				self.GlowMultiply:setAlpha( 0.4 )
				self.clipFinished( GlowMultiply, {} )

				ZmAmmoProp0:completeAnimation()
				self.ZmAmmoProp0:setLeftRight( true, false, 164.69, 398 )
				self.ZmAmmoProp0:setTopBottom( true, false, 62, 206 )
				self.ZmAmmoProp0:setRGB( 1, 1, 1 )
				self.ZmAmmoProp0:setAlpha( 1 )
				self.ZmAmmoProp0:setZoom( 0 )
				self.clipFinished( ZmAmmoProp0, {} )

				ZmAmmoEquipContainer0:completeAnimation()
				self.ZmAmmoEquipContainer0:setAlpha( 1 )
				self.clipFinished( ZmAmmoEquipContainer0, {} )

				Grid:completeAnimation()
				self.Grid:setAlpha( 0.72 )
				self.clipFinished( Grid, {} )

				ZmAmmoAttachmentInfo0:completeAnimation()
				self.ZmAmmoAttachmentInfo0:setLeftRight( true, false, -40, 276 )
				self.ZmAmmoAttachmentInfo0:setTopBottom( true, false, 148, 186 )
				self.ZmAmmoAttachmentInfo0:setAlpha( 1 )
				self.ZmAmmoAttachmentInfo0:setZoom( 0 )
				self.clipFinished( ZmAmmoAttachmentInfo0, {} )

				AmmoGlow:completeAnimation()
				self.AmmoGlow:setLeftRight( true, false, 72.5, 430 )
				self.AmmoGlow:setTopBottom( true, false, -8.96, 266.04 )
				self.AmmoGlow:setAlpha( 1 )
				self.clipFinished( AmmoGlow, {} )

				GlowNotif:completeAnimation()
				self.GlowNotif:setAlpha( 0 )
				self.clipFinished( GlowNotif, {} )

				Flsh:completeAnimation()
				self.Flsh:setAlpha( 0 )
				self.clipFinished( Flsh, {} )

				ZmAmmoBBGumMeterWidget:completeAnimation()
				self.ZmAmmoBBGumMeterWidget:setAlpha( 1 )
				self.clipFinished( ZmAmmoBBGumMeterWidget, {} )

				AATIcon:completeAnimation()
				self.AATIcon:setAlpha( 1 )
				self.clipFinished( AATIcon, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 10 )

				local ZmPanelAmmoInt0Frame2 = function ( ZmPanelAmmoInt0, event )
					if not event.interrupted then
						ZmPanelAmmoInt0:beginAnimation( "keyframe", 889, false, false, CoD.TweenType.Linear )
					end
					ZmPanelAmmoInt0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ZmPanelAmmoInt0, event )
					else
						ZmPanelAmmoInt0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ZmPanelAmmoInt0:completeAnimation()
				self.ZmPanelAmmoInt0:setAlpha( 1 )
				ZmPanelAmmoInt0Frame2( ZmPanelAmmoInt0, {} )
				local GlowOrangeFrame2 = function ( GlowOrange, event )
					if not event.interrupted then
						GlowOrange:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Linear )
					end
					GlowOrange:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( GlowOrange, event )
					else
						GlowOrange:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GlowOrange:completeAnimation()
				self.GlowOrange:setAlpha( 0.23 )
				GlowOrangeFrame2( GlowOrange, {} )
				local GlowMultiplyFrame2 = function ( GlowMultiply, event )
					if not event.interrupted then
						GlowMultiply:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Linear )
					end
					GlowMultiply:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( GlowMultiply, event )
					else
						GlowMultiply:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GlowMultiply:completeAnimation()
				self.GlowMultiply:setAlpha( 0.4 )
				GlowMultiplyFrame2( GlowMultiply, {} )
				local ZmAmmoProp0Frame2 = function ( ZmAmmoProp0, event )
					if not event.interrupted then
						ZmAmmoProp0:beginAnimation( "keyframe", 779, true, false, CoD.TweenType.Linear )
					end
					ZmAmmoProp0:setLeftRight( true, false, 196.69, 430 )
					ZmAmmoProp0:setTopBottom( true, false, 45.54, 189.54 )
					ZmAmmoProp0:setRGB( 0.28, 0.16, 0.05 )
					ZmAmmoProp0:setAlpha( 0 )
					ZmAmmoProp0:setZoom( -46 )
					if event.interrupted then
						self.clipFinished( ZmAmmoProp0, event )
					else
						ZmAmmoProp0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ZmAmmoProp0:completeAnimation()
				self.ZmAmmoProp0:setLeftRight( true, false, 164.69, 398 )
				self.ZmAmmoProp0:setTopBottom( true, false, 62, 206 )
				self.ZmAmmoProp0:setRGB( 1, 1, 1 )
				self.ZmAmmoProp0:setAlpha( 1 )
				self.ZmAmmoProp0:setZoom( 0 )
				ZmAmmoProp0Frame2( ZmAmmoProp0, {} )
				local ZmAmmoEquipContainer0Frame2 = function ( ZmAmmoEquipContainer0, event )
					if not event.interrupted then
						ZmAmmoEquipContainer0:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Bounce )
					end
					ZmAmmoEquipContainer0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ZmAmmoEquipContainer0, event )
					else
						ZmAmmoEquipContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ZmAmmoEquipContainer0:completeAnimation()
				self.ZmAmmoEquipContainer0:setAlpha( 1 )
				ZmAmmoEquipContainer0Frame2( ZmAmmoEquipContainer0, {} )
				local GridFrame2 = function ( Grid, event )
					if not event.interrupted then
						Grid:beginAnimation( "keyframe", 469, false, false, CoD.TweenType.Linear )
					end
					Grid:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Grid, event )
					else
						Grid:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Grid:completeAnimation()
				self.Grid:setAlpha( 0.72 )
				GridFrame2( Grid, {} )
				local ZmAmmoAttachmentInfo0Frame2 = function ( ZmAmmoAttachmentInfo0, event )
					if not event.interrupted then
						ZmAmmoAttachmentInfo0:beginAnimation( "keyframe", 370, true, false, CoD.TweenType.Linear )
					end
					ZmAmmoAttachmentInfo0:setLeftRight( true, false, 50, 366 )
					ZmAmmoAttachmentInfo0:setTopBottom( true, false, 138, 176 )
					ZmAmmoAttachmentInfo0:setAlpha( 0 )
					ZmAmmoAttachmentInfo0:setZoom( -41 )
					if event.interrupted then
						self.clipFinished( ZmAmmoAttachmentInfo0, event )
					else
						ZmAmmoAttachmentInfo0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ZmAmmoAttachmentInfo0:completeAnimation()
				self.ZmAmmoAttachmentInfo0:setLeftRight( true, false, -40, 276 )
				self.ZmAmmoAttachmentInfo0:setTopBottom( true, false, 148, 186 )
				self.ZmAmmoAttachmentInfo0:setAlpha( 1 )
				self.ZmAmmoAttachmentInfo0:setZoom( 0 )
				ZmAmmoAttachmentInfo0Frame2( ZmAmmoAttachmentInfo0, {} )
				local AmmoGlowFrame2 = function ( AmmoGlow, event )
					if not event.interrupted then
						AmmoGlow:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
					end
					AmmoGlow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AmmoGlow, event )
					else
						AmmoGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AmmoGlow:completeAnimation()
				self.AmmoGlow:setAlpha( 1 )
				AmmoGlowFrame2( AmmoGlow, {} )
				local ZmAmmoBBGumMeterWidgetFrame2 = function ( ZmAmmoBBGumMeterWidget, event )
					if not event.interrupted then
						ZmAmmoBBGumMeterWidget:beginAnimation( "keyframe", 810, false, false, CoD.TweenType.Linear )
					end
					ZmAmmoBBGumMeterWidget:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ZmAmmoBBGumMeterWidget, event )
					else
						ZmAmmoBBGumMeterWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ZmAmmoBBGumMeterWidget:completeAnimation()
				self.ZmAmmoBBGumMeterWidget:setAlpha( 1 )
				ZmAmmoBBGumMeterWidgetFrame2( ZmAmmoBBGumMeterWidget, {} )
				local AATIconFrame2 = function ( AATIcon, event )
					if not event.interrupted then
						AATIcon:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
					end
					AATIcon:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AATIcon, event )
					else
						AATIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AATIcon:completeAnimation()
				self.AATIcon:setAlpha( 1 )
				AATIconFrame2( AATIcon, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "HudStart_NoAmmo",
			condition = function ( menu, element, event )
				return not WeaponUsesAmmo( controller )
			end
		},
		{
			stateName = "HudStart",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.weapon" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.weapon"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.equippedWeaponReference" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.equippedWeaponReference"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ZmPanelAmmoInt0:close()
		element.ZmAmmoProp0:close()
		element.ZmAmmoClipInfo0:close()
		element.ZmAmmoEquipContainer0:close()
		element.ZmAmmoAttachmentInfo0:close()
		element.ZmAmmoBBGumMeterWidget:close()
		element.AATIcon:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
