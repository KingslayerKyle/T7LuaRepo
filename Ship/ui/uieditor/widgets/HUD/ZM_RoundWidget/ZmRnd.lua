-- 345072548129c9a111b5fdbd02271654
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.ZM_Panels.ZmPanel_RndExt" )
require( "ui.uieditor.widgets.HUD.ZM_RoundWidget.ZmRndDigits" )
require( "ui.uieditor.widgets.HUD.ZM_FX.ZmFx_Flsh1" )
require( "ui.uieditor.widgets.HUD.ZM_FX.ZmFx_Spark2Ext" )
require( "ui.uieditor.widgets.HUD.ZM_FX.ZmFx_Spark2" )

CoD.ZmRnd = InheritFrom( LUI.UIElement )
CoD.ZmRnd.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ZmRnd )
	self.id = "ZmRnd"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 224 )
	self:setTopBottom( true, false, 0, 200 )
	self.anyChildUsesUpdateState = true
	
	local Panel = CoD.ZmPanel_RndExt.new( menu, controller )
	Panel:setLeftRight( true, false, 0, 224 )
	Panel:setTopBottom( true, false, 0, 200 )
	Panel:setRGB( 0.61, 0.61, 0.61 )
	Panel:setAlpha( 0 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local RndDigits = CoD.ZmRndDigits.new( menu, controller )
	RndDigits:setLeftRight( true, false, 44, 150 )
	RndDigits:setTopBottom( true, false, 84, 164 )
	RndDigits:linkToElementModel( self, nil, false, function ( model )
		RndDigits:setModel( model, controller )
	end )
	self:addElement( RndDigits )
	self.RndDigits = RndDigits
	
	local Mrk1Def = LUI.UIImage.new()
	Mrk1Def:setLeftRight( true, false, 40, 72 )
	Mrk1Def:setTopBottom( true, false, 84, 172 )
	Mrk1Def:setImage( RegisterImage( "uie_t7_zm_hud_rnd_mrk1def" ) )
	self:addElement( Mrk1Def )
	self.Mrk1Def = Mrk1Def
	
	local Mrk2Def = LUI.UIImage.new()
	Mrk2Def:setLeftRight( true, false, 65, 89 )
	Mrk2Def:setTopBottom( true, false, 75, 163 )
	Mrk2Def:setImage( RegisterImage( "uie_t7_zm_hud_rnd_mrk2def" ) )
	self:addElement( Mrk2Def )
	self.Mrk2Def = Mrk2Def
	
	local Mrk3Def = LUI.UIImage.new()
	Mrk3Def:setLeftRight( true, false, 85, 109 )
	Mrk3Def:setTopBottom( true, false, 80, 168 )
	Mrk3Def:setImage( RegisterImage( "uie_t7_zm_hud_rnd_mrk3def" ) )
	self:addElement( Mrk3Def )
	self.Mrk3Def = Mrk3Def
	
	local Mrk4Def = LUI.UIImage.new()
	Mrk4Def:setLeftRight( true, false, 105, 129 )
	Mrk4Def:setTopBottom( true, false, 80, 152 )
	Mrk4Def:setAlpha( 0 )
	Mrk4Def:setImage( RegisterImage( "uie_t7_zm_hud_rnd_mrk4def" ) )
	self:addElement( Mrk4Def )
	self.Mrk4Def = Mrk4Def
	
	local Mrk5Def = LUI.UIImage.new()
	Mrk5Def:setLeftRight( true, false, 40, 136 )
	Mrk5Def:setTopBottom( true, false, 88, 160 )
	Mrk5Def:setAlpha( 0 )
	Mrk5Def:setImage( RegisterImage( "uie_t7_zm_hud_rnd_mrk5def" ) )
	self:addElement( Mrk5Def )
	self.Mrk5Def = Mrk5Def
	
	local Mrk1Act = LUI.UIImage.new()
	Mrk1Act:setLeftRight( true, false, 40, 72 )
	Mrk1Act:setTopBottom( true, false, 84, 172 )
	Mrk1Act:setAlpha( 0 )
	Mrk1Act:setImage( RegisterImage( "uie_t7_zm_hud_rnd_mrk1act" ) )
	Mrk1Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	Mrk1Act:setShaderVector( 0, 1, 0, 0, 0 )
	Mrk1Act:setShaderVector( 1, 0, 0, 0, 0 )
	Mrk1Act:setShaderVector( 2, 1.25, 0, 0, 0 )
	Mrk1Act:setShaderVector( 3, 0.21, 0, 0, 0 )
	self:addElement( Mrk1Act )
	self.Mrk1Act = Mrk1Act
	
	local Mrk2Act = LUI.UIImage.new()
	Mrk2Act:setLeftRight( true, false, 65, 89 )
	Mrk2Act:setTopBottom( true, false, 75, 163 )
	Mrk2Act:setAlpha( 0 )
	Mrk2Act:setImage( RegisterImage( "uie_t7_zm_hud_rnd_mrk2act" ) )
	Mrk2Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	Mrk2Act:setShaderVector( 0, 1, 0, 0, 0 )
	Mrk2Act:setShaderVector( 1, 0, 0, 0, 0 )
	Mrk2Act:setShaderVector( 2, 1.08, 0, 0, 0 )
	Mrk2Act:setShaderVector( 3, 0.21, 0, 0, 0 )
	self:addElement( Mrk2Act )
	self.Mrk2Act = Mrk2Act
	
	local Mrk3Act = LUI.UIImage.new()
	Mrk3Act:setLeftRight( true, false, 85, 109 )
	Mrk3Act:setTopBottom( true, false, 80, 168 )
	Mrk3Act:setAlpha( 0 )
	Mrk3Act:setImage( RegisterImage( "uie_t7_zm_hud_rnd_mrk3act" ) )
	Mrk3Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	Mrk3Act:setShaderVector( 0, 1, 0, 0, 0 )
	Mrk3Act:setShaderVector( 1, 0, 0, 0, 0 )
	Mrk3Act:setShaderVector( 2, 1.15, 0, 0, 0 )
	Mrk3Act:setShaderVector( 3, 0.26, 0, 0, 0 )
	self:addElement( Mrk3Act )
	self.Mrk3Act = Mrk3Act
	
	local Mrk4Act = LUI.UIImage.new()
	Mrk4Act:setLeftRight( true, false, 105, 129 )
	Mrk4Act:setTopBottom( true, false, 80, 152 )
	Mrk4Act:setAlpha( 0 )
	Mrk4Act:setImage( RegisterImage( "uie_t7_zm_hud_rnd_mrk4act" ) )
	Mrk4Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	Mrk4Act:setShaderVector( 0, 1, 0, 0, 0 )
	Mrk4Act:setShaderVector( 1, 0, 0, 0, 0 )
	Mrk4Act:setShaderVector( 2, 1, 0, 0, 0 )
	Mrk4Act:setShaderVector( 3, 0.35, 0, 0, 0 )
	self:addElement( Mrk4Act )
	self.Mrk4Act = Mrk4Act
	
	local Mrk5Act = LUI.UIImage.new()
	Mrk5Act:setLeftRight( true, false, 40, 136 )
	Mrk5Act:setTopBottom( true, false, 88, 160 )
	Mrk5Act:setAlpha( 0 )
	Mrk5Act:setImage( RegisterImage( "uie_t7_zm_hud_rnd_mrk5act" ) )
	Mrk5Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	Mrk5Act:setShaderVector( 0, -0.13, 0, 0, 0 )
	Mrk5Act:setShaderVector( 1, 0.35, 0, 0, 0 )
	Mrk5Act:setShaderVector( 2, 1, 0, 0, 0 )
	Mrk5Act:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( Mrk5Act )
	self.Mrk5Act = Mrk5Act
	
	local GlowOrangeOver = LUI.UIImage.new()
	GlowOrangeOver:setLeftRight( true, false, 43, 152 )
	GlowOrangeOver:setTopBottom( true, false, 104.5, 137.5 )
	GlowOrangeOver:setRGB( 1, 0.31, 0 )
	GlowOrangeOver:setAlpha( 0 )
	GlowOrangeOver:setZRot( -84 )
	GlowOrangeOver:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowOrangeOver:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowOrangeOver )
	self.GlowOrangeOver = GlowOrangeOver
	
	local ZmFxFlsh10 = CoD.ZmFx_Flsh1.new( menu, controller )
	ZmFxFlsh10:setLeftRight( true, false, -57.5, 257.5 )
	ZmFxFlsh10:setTopBottom( true, false, 0, 216 )
	ZmFxFlsh10:setRGB( 0, 0, 0 )
	ZmFxFlsh10:setAlpha( 0 )
	ZmFxFlsh10:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ZmFxFlsh10 )
	self.ZmFxFlsh10 = ZmFxFlsh10
	
	local ZmFxSpark2Ext0 = CoD.ZmFx_Spark2Ext.new( menu, controller )
	ZmFxSpark2Ext0:setLeftRight( true, false, 54, 166 )
	ZmFxSpark2Ext0:setTopBottom( true, false, 12, 180 )
	ZmFxSpark2Ext0:setAlpha( 0 )
	ZmFxSpark2Ext0:setZRot( 9 )
	self:addElement( ZmFxSpark2Ext0 )
	self.ZmFxSpark2Ext0 = ZmFxSpark2Ext0
	
	local ZmFxSpark20 = CoD.ZmFx_Spark2.new( menu, controller )
	ZmFxSpark20:setLeftRight( true, false, 32, 162 )
	ZmFxSpark20:setTopBottom( true, false, -33, 183 )
	ZmFxSpark20:setAlpha( 0 )
	ZmFxSpark20:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	ZmFxSpark20.Image0:setShaderVector( 1, 0, 1.37, 0, 0 )
	ZmFxSpark20.Image00:setShaderVector( 1, 0, -0.62, 0, 0 )
	self:addElement( ZmFxSpark20 )
	self.ZmFxSpark20 = ZmFxSpark20
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 16 )

				Panel:completeAnimation()
				self.Panel:setAlpha( 0 )
				self.clipFinished( Panel, {} )

				RndDigits:completeAnimation()
				self.RndDigits:setAlpha( 0 )
				self.clipFinished( RndDigits, {} )

				Mrk1Def:completeAnimation()
				self.Mrk1Def:setAlpha( 0 )
				self.clipFinished( Mrk1Def, {} )

				Mrk2Def:completeAnimation()
				self.Mrk2Def:setAlpha( 0 )
				self.clipFinished( Mrk2Def, {} )

				Mrk3Def:completeAnimation()
				self.Mrk3Def:setAlpha( 0 )
				self.clipFinished( Mrk3Def, {} )

				Mrk4Def:completeAnimation()
				self.Mrk4Def:setAlpha( 0 )
				self.clipFinished( Mrk4Def, {} )

				Mrk5Def:completeAnimation()
				self.Mrk5Def:setAlpha( 0 )
				self.clipFinished( Mrk5Def, {} )

				Mrk1Act:completeAnimation()
				self.Mrk1Act:setAlpha( 1 )
				self.Mrk1Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk1Act:setShaderVector( 0, 1, 0, 0, 0 )
				self.Mrk1Act:setShaderVector( 1, 0, 0, 0, 0 )
				self.Mrk1Act:setShaderVector( 2, 0, 0, 0, 0 )
				self.Mrk1Act:setShaderVector( 3, 0.21, 0, 0, 0 )
				self.clipFinished( Mrk1Act, {} )

				Mrk2Act:completeAnimation()
				self.Mrk2Act:setAlpha( 0 )
				self.Mrk2Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk2Act:setShaderVector( 0, 1, 0, 0, 0 )
				self.Mrk2Act:setShaderVector( 1, 0, 0, 0, 0 )
				self.Mrk2Act:setShaderVector( 2, 0, 0, 0, 0 )
				self.Mrk2Act:setShaderVector( 3, 0.21, 0, 0, 0 )
				self.clipFinished( Mrk2Act, {} )

				Mrk3Act:completeAnimation()
				self.Mrk3Act:setAlpha( 0 )
				self.Mrk3Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk3Act:setShaderVector( 0, 1, 0, 0, 0 )
				self.Mrk3Act:setShaderVector( 1, 0, 0, 0, 0 )
				self.Mrk3Act:setShaderVector( 2, 0, 0, 0, 0 )
				self.Mrk3Act:setShaderVector( 3, 0.26, 0, 0, 0 )
				self.clipFinished( Mrk3Act, {} )

				Mrk4Act:completeAnimation()
				self.Mrk4Act:setAlpha( 0 )
				self.Mrk4Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk4Act:setShaderVector( 0, 1, 0, 0, 0 )
				self.Mrk4Act:setShaderVector( 1, 0, 0, 0, 0 )
				self.Mrk4Act:setShaderVector( 2, 0, 0, 0, 0 )
				self.Mrk4Act:setShaderVector( 3, 0.35, 0, 0, 0 )
				self.clipFinished( Mrk4Act, {} )

				Mrk5Act:completeAnimation()
				self.Mrk5Act:setAlpha( 0 )
				self.Mrk5Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk5Act:setShaderVector( 0, -0.13, 0, 0, 0 )
				self.Mrk5Act:setShaderVector( 1, 0.35, 0, 0, 0 )
				self.Mrk5Act:setShaderVector( 2, 1, 0, 0, 0 )
				self.Mrk5Act:setShaderVector( 3, 0, 0, 0, 0 )
				self.clipFinished( Mrk5Act, {} )

				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setLeftRight( true, false, 1.5, 110.5 )
				self.GlowOrangeOver:setTopBottom( true, false, 107.5, 140.5 )
				self.GlowOrangeOver:setAlpha( 0 )
				self.GlowOrangeOver:setZRot( -79 )
				self.clipFinished( GlowOrangeOver, {} )

				ZmFxFlsh10:completeAnimation()
				self.ZmFxFlsh10:setAlpha( 0 )
				self.clipFinished( ZmFxFlsh10, {} )

				ZmFxSpark2Ext0:completeAnimation()
				self.ZmFxSpark2Ext0:setLeftRight( true, false, 5, 117 )
				self.ZmFxSpark2Ext0:setTopBottom( true, false, -40, 128 )
				self.ZmFxSpark2Ext0:setAlpha( 0 )
				self.clipFinished( ZmFxSpark2Ext0, {} )

				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )
			end,
			Rnd1 = function ()
				self:setupElementClipCounter( 16 )

				Panel:completeAnimation()
				self.Panel:setAlpha( 0 )
				self.clipFinished( Panel, {} )

				RndDigits:completeAnimation()
				self.RndDigits:setAlpha( 0 )
				self.clipFinished( RndDigits, {} )
				local Mrk1DefFrame2 = function ( Mrk1Def, event )
					local Mrk1DefFrame3 = function ( Mrk1Def, event )
						if not event.interrupted then
							Mrk1Def:beginAnimation( "keyframe", 789, false, false, CoD.TweenType.Linear )
						end
						Mrk1Def:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Mrk1Def, event )
						else
							Mrk1Def:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Mrk1DefFrame3( Mrk1Def, event )
						return 
					else
						Mrk1Def:beginAnimation( "keyframe", 1320, false, false, CoD.TweenType.Linear )
						Mrk1Def:registerEventHandler( "transition_complete_keyframe", Mrk1DefFrame3 )
					end
				end
				
				Mrk1Def:completeAnimation()
				self.Mrk1Def:setAlpha( 0 )
				Mrk1DefFrame2( Mrk1Def, {} )

				Mrk2Def:completeAnimation()
				self.Mrk2Def:setAlpha( 0 )
				self.clipFinished( Mrk2Def, {} )

				Mrk3Def:completeAnimation()
				self.Mrk3Def:setAlpha( 0 )
				self.clipFinished( Mrk3Def, {} )

				Mrk4Def:completeAnimation()
				self.Mrk4Def:setAlpha( 0 )
				self.clipFinished( Mrk4Def, {} )

				Mrk5Def:completeAnimation()
				self.Mrk5Def:setAlpha( 0 )
				self.clipFinished( Mrk5Def, {} )
				local Mrk1ActFrame2 = function ( Mrk1Act, event )
					local Mrk1ActFrame3 = function ( Mrk1Act, event )
						local Mrk1ActFrame4 = function ( Mrk1Act, event )
							if not event.interrupted then
								Mrk1Act:beginAnimation( "keyframe", 1009, false, false, CoD.TweenType.Linear )
							end
							Mrk1Act:setAlpha( 0 )
							Mrk1Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
							Mrk1Act:setShaderVector( 0, 1, 0, 0, 0 )
							Mrk1Act:setShaderVector( 1, 0, 0, 0, 0 )
							Mrk1Act:setShaderVector( 2, 1.25, 0, 0, 0 )
							Mrk1Act:setShaderVector( 3, 0.21, 0, 0, 0 )
							if event.interrupted then
								self.clipFinished( Mrk1Act, event )
							else
								Mrk1Act:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Mrk1ActFrame4( Mrk1Act, event )
							return 
						else
							Mrk1Act:beginAnimation( "keyframe", 1209, false, false, CoD.TweenType.Linear )
							Mrk1Act:registerEventHandler( "transition_complete_keyframe", Mrk1ActFrame4 )
						end
					end
					
					if event.interrupted then
						Mrk1ActFrame3( Mrk1Act, event )
						return 
					else
						Mrk1Act:beginAnimation( "keyframe", 899, false, true, CoD.TweenType.Linear )
						Mrk1Act:setShaderVector( 2, 1.25, 0, 0, 0 )
						Mrk1Act:registerEventHandler( "transition_complete_keyframe", Mrk1ActFrame3 )
					end
				end
				
				Mrk1Act:completeAnimation()
				self.Mrk1Act:setAlpha( 1 )
				self.Mrk1Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk1Act:setShaderVector( 0, 1, 0, 0, 0 )
				self.Mrk1Act:setShaderVector( 1, 0, 0, 0, 0 )
				self.Mrk1Act:setShaderVector( 2, 0, 0, 0, 0 )
				self.Mrk1Act:setShaderVector( 3, 0.21, 0, 0, 0 )
				Mrk1ActFrame2( Mrk1Act, {} )

				Mrk2Act:completeAnimation()
				self.Mrk2Act:setAlpha( 0 )
				self.Mrk2Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk2Act:setShaderVector( 0, 1, 0, 0, 0 )
				self.Mrk2Act:setShaderVector( 1, 0, 0, 0, 0 )
				self.Mrk2Act:setShaderVector( 2, 0, 0, 0, 0 )
				self.Mrk2Act:setShaderVector( 3, 0.21, 0, 0, 0 )
				self.clipFinished( Mrk2Act, {} )

				Mrk3Act:completeAnimation()
				self.Mrk3Act:setAlpha( 0 )
				self.Mrk3Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk3Act:setShaderVector( 0, 1, 0, 0, 0 )
				self.Mrk3Act:setShaderVector( 1, 0, 0, 0, 0 )
				self.Mrk3Act:setShaderVector( 2, 0, 0, 0, 0 )
				self.Mrk3Act:setShaderVector( 3, 0.26, 0, 0, 0 )
				self.clipFinished( Mrk3Act, {} )

				Mrk4Act:completeAnimation()
				self.Mrk4Act:setAlpha( 0 )
				self.Mrk4Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk4Act:setShaderVector( 0, 1, 0, 0, 0 )
				self.Mrk4Act:setShaderVector( 1, 0, 0, 0, 0 )
				self.Mrk4Act:setShaderVector( 2, 0, 0, 0, 0 )
				self.Mrk4Act:setShaderVector( 3, 0.35, 0, 0, 0 )
				self.clipFinished( Mrk4Act, {} )

				Mrk5Act:completeAnimation()
				self.Mrk5Act:setAlpha( 0 )
				self.Mrk5Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk5Act:setShaderVector( 0, -0.13, 0, 0, 0 )
				self.Mrk5Act:setShaderVector( 1, 0.35, 0, 0, 0 )
				self.Mrk5Act:setShaderVector( 2, 1, 0, 0, 0 )
				self.Mrk5Act:setShaderVector( 3, 0, 0, 0, 0 )
				self.clipFinished( Mrk5Act, {} )
				local GlowOrangeOverFrame2 = function ( GlowOrangeOver, event )
					local GlowOrangeOverFrame3 = function ( GlowOrangeOver, event )
						local GlowOrangeOverFrame4 = function ( GlowOrangeOver, event )
							if not event.interrupted then
								GlowOrangeOver:beginAnimation( "keyframe", 1019, false, false, CoD.TweenType.Linear )
							end
							GlowOrangeOver:setLeftRight( true, false, 1.5, 110.5 )
							GlowOrangeOver:setTopBottom( true, false, 107.5, 140.5 )
							GlowOrangeOver:setAlpha( 0 )
							GlowOrangeOver:setZRot( -79 )
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
							GlowOrangeOver:beginAnimation( "keyframe", 2230, false, false, CoD.TweenType.Linear )
							GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame4 )
						end
					end
					
					if event.interrupted then
						GlowOrangeOverFrame3( GlowOrangeOver, event )
						return 
					else
						GlowOrangeOver:beginAnimation( "keyframe", 889, false, false, CoD.TweenType.Bounce )
						GlowOrangeOver:setAlpha( 1 )
						GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame3 )
					end
				end
				
				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setLeftRight( true, false, 1.5, 110.5 )
				self.GlowOrangeOver:setTopBottom( true, false, 107.5, 140.5 )
				self.GlowOrangeOver:setAlpha( 0 )
				self.GlowOrangeOver:setZRot( -79 )
				GlowOrangeOverFrame2( GlowOrangeOver, {} )
				local ZmFxFlsh10Frame2 = function ( ZmFxFlsh10, event )
					local ZmFxFlsh10Frame3 = function ( ZmFxFlsh10, event )
						if not event.interrupted then
							ZmFxFlsh10:beginAnimation( "keyframe", 1110, false, false, CoD.TweenType.Linear )
						end
						ZmFxFlsh10:setRGB( 0, 0, 0 )
						ZmFxFlsh10:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( ZmFxFlsh10, event )
						else
							ZmFxFlsh10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ZmFxFlsh10Frame3( ZmFxFlsh10, event )
						return 
					else
						ZmFxFlsh10:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
						ZmFxFlsh10:setRGB( 0.9, 0.73, 0.68 )
						ZmFxFlsh10:registerEventHandler( "transition_complete_keyframe", ZmFxFlsh10Frame3 )
					end
				end
				
				ZmFxFlsh10:completeAnimation()
				self.ZmFxFlsh10:setRGB( 0, 0, 0 )
				self.ZmFxFlsh10:setAlpha( 1 )
				ZmFxFlsh10Frame2( ZmFxFlsh10, {} )
				local ZmFxSpark2Ext0Frame2 = function ( ZmFxSpark2Ext0, event )
					local ZmFxSpark2Ext0Frame3 = function ( ZmFxSpark2Ext0, event )
						if not event.interrupted then
							ZmFxSpark2Ext0:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
						end
						ZmFxSpark2Ext0:setLeftRight( true, false, 17, 129 )
						ZmFxSpark2Ext0:setTopBottom( true, false, 19, 187 )
						ZmFxSpark2Ext0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( ZmFxSpark2Ext0, event )
						else
							ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ZmFxSpark2Ext0Frame3( ZmFxSpark2Ext0, event )
						return 
					else
						ZmFxSpark2Ext0:beginAnimation( "keyframe", 680, false, false, CoD.TweenType.Linear )
						ZmFxSpark2Ext0:setLeftRight( true, false, 17, 129 )
						ZmFxSpark2Ext0:setTopBottom( true, false, 19, 187 )
						ZmFxSpark2Ext0:setAlpha( 1 )
						ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame3 )
					end
				end
				
				ZmFxSpark2Ext0:completeAnimation()
				self.ZmFxSpark2Ext0:setLeftRight( true, false, 5, 117 )
				self.ZmFxSpark2Ext0:setTopBottom( true, false, -40, 128 )
				self.ZmFxSpark2Ext0:setAlpha( 0 )
				ZmFxSpark2Ext0Frame2( ZmFxSpark2Ext0, {} )

				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )
			end
		},
		Rnd1 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 16 )

				Panel:completeAnimation()
				self.Panel:setAlpha( 0 )
				self.clipFinished( Panel, {} )

				RndDigits:completeAnimation()
				self.RndDigits:setAlpha( 0 )
				self.clipFinished( RndDigits, {} )

				Mrk1Def:completeAnimation()
				self.Mrk1Def:setAlpha( 1 )
				self.clipFinished( Mrk1Def, {} )

				Mrk2Def:completeAnimation()
				self.Mrk2Def:setAlpha( 0 )
				self.clipFinished( Mrk2Def, {} )

				Mrk3Def:completeAnimation()
				self.Mrk3Def:setAlpha( 0 )
				self.clipFinished( Mrk3Def, {} )

				Mrk4Def:completeAnimation()
				self.Mrk4Def:setAlpha( 0 )
				self.clipFinished( Mrk4Def, {} )

				Mrk5Def:completeAnimation()
				self.Mrk5Def:setAlpha( 0 )
				self.clipFinished( Mrk5Def, {} )

				Mrk1Act:completeAnimation()
				self.Mrk1Act:setAlpha( 0 )
				self.Mrk1Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk1Act:setShaderVector( 0, 1, 0, 0, 0 )
				self.Mrk1Act:setShaderVector( 1, 0, 0, 0, 0 )
				self.Mrk1Act:setShaderVector( 2, 1.25, 0, 0, 0 )
				self.Mrk1Act:setShaderVector( 3, 0.21, 0, 0, 0 )
				self.clipFinished( Mrk1Act, {} )

				Mrk2Act:completeAnimation()
				self.Mrk2Act:setAlpha( 0 )
				self.Mrk2Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk2Act:setShaderVector( 0, 1, 0, 0, 0 )
				self.Mrk2Act:setShaderVector( 1, 0, 0, 0, 0 )
				self.Mrk2Act:setShaderVector( 2, 0, 0, 0, 0 )
				self.Mrk2Act:setShaderVector( 3, 0.21, 0, 0, 0 )
				self.clipFinished( Mrk2Act, {} )

				Mrk3Act:completeAnimation()
				self.Mrk3Act:setAlpha( 0 )
				self.Mrk3Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk3Act:setShaderVector( 0, 1, 0, 0, 0 )
				self.Mrk3Act:setShaderVector( 1, 0, 0, 0, 0 )
				self.Mrk3Act:setShaderVector( 2, 0, 0, 0, 0 )
				self.Mrk3Act:setShaderVector( 3, 0.26, 0, 0, 0 )
				self.clipFinished( Mrk3Act, {} )

				Mrk4Act:completeAnimation()
				self.Mrk4Act:setAlpha( 0 )
				self.Mrk4Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk4Act:setShaderVector( 0, 1, 0, 0, 0 )
				self.Mrk4Act:setShaderVector( 1, 0, 0, 0, 0 )
				self.Mrk4Act:setShaderVector( 2, 0, 0, 0, 0 )
				self.Mrk4Act:setShaderVector( 3, 0.35, 0, 0, 0 )
				self.clipFinished( Mrk4Act, {} )

				Mrk5Act:completeAnimation()
				self.Mrk5Act:setAlpha( 0 )
				self.Mrk5Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk5Act:setShaderVector( 0, -0.13, 0, 0, 0 )
				self.Mrk5Act:setShaderVector( 1, 0.35, 0, 0, 0 )
				self.Mrk5Act:setShaderVector( 2, 1, 0, 0, 0 )
				self.Mrk5Act:setShaderVector( 3, 0, 0, 0, 0 )
				self.clipFinished( Mrk5Act, {} )

				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setLeftRight( true, false, 1.5, 110.5 )
				self.GlowOrangeOver:setTopBottom( true, false, 107.5, 140.5 )
				self.GlowOrangeOver:setAlpha( 0 )
				self.GlowOrangeOver:setZRot( -79 )
				self.clipFinished( GlowOrangeOver, {} )

				ZmFxFlsh10:completeAnimation()
				self.ZmFxFlsh10:setAlpha( 0 )
				self.clipFinished( ZmFxFlsh10, {} )

				ZmFxSpark2Ext0:completeAnimation()
				self.ZmFxSpark2Ext0:setLeftRight( true, false, 17, 129 )
				self.ZmFxSpark2Ext0:setTopBottom( true, false, 19, 187 )
				self.ZmFxSpark2Ext0:setAlpha( 0 )
				self.clipFinished( ZmFxSpark2Ext0, {} )

				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )
			end,
			Rnd2 = function ()
				self:setupElementClipCounter( 16 )

				Panel:completeAnimation()
				self.Panel:setAlpha( 0 )
				self.clipFinished( Panel, {} )

				RndDigits:completeAnimation()
				self.RndDigits:setAlpha( 0 )
				self.clipFinished( RndDigits, {} )

				Mrk1Def:completeAnimation()
				self.Mrk1Def:setAlpha( 1 )
				self.clipFinished( Mrk1Def, {} )
				local Mrk2DefFrame2 = function ( Mrk2Def, event )
					local Mrk2DefFrame3 = function ( Mrk2Def, event )
						if not event.interrupted then
							Mrk2Def:beginAnimation( "keyframe", 869, false, false, CoD.TweenType.Linear )
						end
						Mrk2Def:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Mrk2Def, event )
						else
							Mrk2Def:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Mrk2DefFrame3( Mrk2Def, event )
						return 
					else
						Mrk2Def:beginAnimation( "keyframe", 1240, false, false, CoD.TweenType.Linear )
						Mrk2Def:registerEventHandler( "transition_complete_keyframe", Mrk2DefFrame3 )
					end
				end
				
				Mrk2Def:completeAnimation()
				self.Mrk2Def:setAlpha( 0 )
				Mrk2DefFrame2( Mrk2Def, {} )

				Mrk3Def:completeAnimation()
				self.Mrk3Def:setAlpha( 0 )
				self.clipFinished( Mrk3Def, {} )

				Mrk4Def:completeAnimation()
				self.Mrk4Def:setAlpha( 0 )
				self.clipFinished( Mrk4Def, {} )

				Mrk5Def:completeAnimation()
				self.Mrk5Def:setAlpha( 0 )
				self.clipFinished( Mrk5Def, {} )

				Mrk1Act:completeAnimation()
				self.Mrk1Act:setAlpha( 0 )
				self.Mrk1Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk1Act:setShaderVector( 0, 1, 0, 0, 0 )
				self.Mrk1Act:setShaderVector( 1, 0, 0, 0, 0 )
				self.Mrk1Act:setShaderVector( 2, 1.25, 0, 0, 0 )
				self.Mrk1Act:setShaderVector( 3, 0.21, 0, 0, 0 )
				self.clipFinished( Mrk1Act, {} )
				local Mrk2ActFrame2 = function ( Mrk2Act, event )
					local Mrk2ActFrame3 = function ( Mrk2Act, event )
						local Mrk2ActFrame4 = function ( Mrk2Act, event )
							if not event.interrupted then
								Mrk2Act:beginAnimation( "keyframe", 1009, false, false, CoD.TweenType.Linear )
							end
							Mrk2Act:setAlpha( 0 )
							Mrk2Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
							Mrk2Act:setShaderVector( 0, 1, 0, 0, 0 )
							Mrk2Act:setShaderVector( 1, 0, 0, 0, 0 )
							Mrk2Act:setShaderVector( 2, 1.08, 0, 0, 0 )
							Mrk2Act:setShaderVector( 3, 0.21, 0, 0, 0 )
							if event.interrupted then
								self.clipFinished( Mrk2Act, event )
							else
								Mrk2Act:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Mrk2ActFrame4( Mrk2Act, event )
							return 
						else
							Mrk2Act:beginAnimation( "keyframe", 1429, false, false, CoD.TweenType.Linear )
							Mrk2Act:registerEventHandler( "transition_complete_keyframe", Mrk2ActFrame4 )
						end
					end
					
					if event.interrupted then
						Mrk2ActFrame3( Mrk2Act, event )
						return 
					else
						Mrk2Act:beginAnimation( "keyframe", 680, false, true, CoD.TweenType.Linear )
						Mrk2Act:setShaderVector( 2, 1.08, 0, 0, 0 )
						Mrk2Act:registerEventHandler( "transition_complete_keyframe", Mrk2ActFrame3 )
					end
				end
				
				Mrk2Act:completeAnimation()
				self.Mrk2Act:setAlpha( 1 )
				self.Mrk2Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk2Act:setShaderVector( 0, 1, 0, 0, 0 )
				self.Mrk2Act:setShaderVector( 1, 0, 0, 0, 0 )
				self.Mrk2Act:setShaderVector( 2, 0, 0, 0, 0 )
				self.Mrk2Act:setShaderVector( 3, 0.21, 0, 0, 0 )
				Mrk2ActFrame2( Mrk2Act, {} )

				Mrk3Act:completeAnimation()
				self.Mrk3Act:setAlpha( 0 )
				self.Mrk3Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk3Act:setShaderVector( 0, 1, 0, 0, 0 )
				self.Mrk3Act:setShaderVector( 1, 0, 0, 0, 0 )
				self.Mrk3Act:setShaderVector( 2, 0, 0, 0, 0 )
				self.Mrk3Act:setShaderVector( 3, 0.26, 0, 0, 0 )
				self.clipFinished( Mrk3Act, {} )

				Mrk4Act:completeAnimation()
				self.Mrk4Act:setAlpha( 0 )
				self.Mrk4Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk4Act:setShaderVector( 0, 1, 0, 0, 0 )
				self.Mrk4Act:setShaderVector( 1, 0, 0, 0, 0 )
				self.Mrk4Act:setShaderVector( 2, 0, 0, 0, 0 )
				self.Mrk4Act:setShaderVector( 3, 0.35, 0, 0, 0 )
				self.clipFinished( Mrk4Act, {} )

				Mrk5Act:completeAnimation()
				self.Mrk5Act:setAlpha( 0 )
				self.Mrk5Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk5Act:setShaderVector( 0, -0.13, 0, 0, 0 )
				self.Mrk5Act:setShaderVector( 1, 0.35, 0, 0, 0 )
				self.Mrk5Act:setShaderVector( 2, 1, 0, 0, 0 )
				self.Mrk5Act:setShaderVector( 3, 0, 0, 0, 0 )
				self.clipFinished( Mrk5Act, {} )
				local GlowOrangeOverFrame2 = function ( GlowOrangeOver, event )
					local GlowOrangeOverFrame3 = function ( GlowOrangeOver, event )
						local GlowOrangeOverFrame4 = function ( GlowOrangeOver, event )
							if not event.interrupted then
								GlowOrangeOver:beginAnimation( "keyframe", 1019, false, false, CoD.TweenType.Linear )
							end
							GlowOrangeOver:setLeftRight( true, false, 23, 132 )
							GlowOrangeOver:setTopBottom( true, false, 99.5, 132.5 )
							GlowOrangeOver:setAlpha( 0 )
							GlowOrangeOver:setZRot( -82 )
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
							GlowOrangeOver:beginAnimation( "keyframe", 2230, false, false, CoD.TweenType.Linear )
							GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame4 )
						end
					end
					
					if event.interrupted then
						GlowOrangeOverFrame3( GlowOrangeOver, event )
						return 
					else
						GlowOrangeOver:beginAnimation( "keyframe", 889, false, false, CoD.TweenType.Bounce )
						GlowOrangeOver:setAlpha( 1 )
						GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame3 )
					end
				end
				
				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setLeftRight( true, false, 23, 132 )
				self.GlowOrangeOver:setTopBottom( true, false, 99.5, 132.5 )
				self.GlowOrangeOver:setAlpha( 0 )
				self.GlowOrangeOver:setZRot( -82 )
				GlowOrangeOverFrame2( GlowOrangeOver, {} )
				local ZmFxFlsh10Frame2 = function ( ZmFxFlsh10, event )
					local ZmFxFlsh10Frame3 = function ( ZmFxFlsh10, event )
						if not event.interrupted then
							ZmFxFlsh10:beginAnimation( "keyframe", 1110, false, false, CoD.TweenType.Linear )
						end
						ZmFxFlsh10:setRGB( 0, 0, 0 )
						ZmFxFlsh10:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( ZmFxFlsh10, event )
						else
							ZmFxFlsh10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ZmFxFlsh10Frame3( ZmFxFlsh10, event )
						return 
					else
						ZmFxFlsh10:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
						ZmFxFlsh10:setRGB( 0.9, 0.73, 0.68 )
						ZmFxFlsh10:registerEventHandler( "transition_complete_keyframe", ZmFxFlsh10Frame3 )
					end
				end
				
				ZmFxFlsh10:completeAnimation()
				self.ZmFxFlsh10:setRGB( 0, 0, 0 )
				self.ZmFxFlsh10:setAlpha( 1 )
				ZmFxFlsh10Frame2( ZmFxFlsh10, {} )
				local ZmFxSpark2Ext0Frame2 = function ( ZmFxSpark2Ext0, event )
					local ZmFxSpark2Ext0Frame3 = function ( ZmFxSpark2Ext0, event )
						local ZmFxSpark2Ext0Frame4 = function ( ZmFxSpark2Ext0, event )
							if not event.interrupted then
								ZmFxSpark2Ext0:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
							end
							ZmFxSpark2Ext0:setLeftRight( true, false, 38, 150 )
							ZmFxSpark2Ext0:setTopBottom( true, false, 12, 180 )
							ZmFxSpark2Ext0:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( ZmFxSpark2Ext0, event )
							else
								ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ZmFxSpark2Ext0Frame4( ZmFxSpark2Ext0, event )
							return 
						else
							ZmFxSpark2Ext0:beginAnimation( "keyframe", 620, false, true, CoD.TweenType.Linear )
							ZmFxSpark2Ext0:setLeftRight( true, false, 38, 150 )
							ZmFxSpark2Ext0:setTopBottom( true, false, 12, 180 )
							ZmFxSpark2Ext0:setAlpha( 1 )
							ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame4 )
						end
					end
					
					if event.interrupted then
						ZmFxSpark2Ext0Frame3( ZmFxSpark2Ext0, event )
						return 
					else
						ZmFxSpark2Ext0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						ZmFxSpark2Ext0:setLeftRight( true, false, 29.79, 141.79 )
						ZmFxSpark2Ext0:setTopBottom( true, false, -44.53, 123.47 )
						ZmFxSpark2Ext0:setAlpha( 0.45 )
						ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame3 )
					end
				end
				
				ZmFxSpark2Ext0:completeAnimation()
				self.ZmFxSpark2Ext0:setLeftRight( true, false, 29, 141 )
				self.ZmFxSpark2Ext0:setTopBottom( true, false, -50, 118 )
				self.ZmFxSpark2Ext0:setAlpha( 0 )
				ZmFxSpark2Ext0Frame2( ZmFxSpark2Ext0, {} )

				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )
			end
		},
		Rnd2 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 16 )

				Panel:completeAnimation()
				self.Panel:setAlpha( 0 )
				self.clipFinished( Panel, {} )

				RndDigits:completeAnimation()
				self.RndDigits:setAlpha( 0 )
				self.clipFinished( RndDigits, {} )

				Mrk1Def:completeAnimation()
				self.Mrk1Def:setAlpha( 1 )
				self.clipFinished( Mrk1Def, {} )

				Mrk2Def:completeAnimation()
				self.Mrk2Def:setAlpha( 1 )
				self.clipFinished( Mrk2Def, {} )

				Mrk3Def:completeAnimation()
				self.Mrk3Def:setAlpha( 0 )
				self.clipFinished( Mrk3Def, {} )

				Mrk4Def:completeAnimation()
				self.Mrk4Def:setAlpha( 0 )
				self.clipFinished( Mrk4Def, {} )

				Mrk5Def:completeAnimation()
				self.Mrk5Def:setAlpha( 0 )
				self.clipFinished( Mrk5Def, {} )

				Mrk1Act:completeAnimation()
				self.Mrk1Act:setAlpha( 0 )
				self.Mrk1Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk1Act:setShaderVector( 0, 1, 0, 0, 0 )
				self.Mrk1Act:setShaderVector( 1, 0, 0, 0, 0 )
				self.Mrk1Act:setShaderVector( 2, 1.25, 0, 0, 0 )
				self.Mrk1Act:setShaderVector( 3, 0.21, 0, 0, 0 )
				self.clipFinished( Mrk1Act, {} )

				Mrk2Act:completeAnimation()
				self.Mrk2Act:setAlpha( 0 )
				self.Mrk2Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk2Act:setShaderVector( 0, 1, 0, 0, 0 )
				self.Mrk2Act:setShaderVector( 1, 0, 0, 0, 0 )
				self.Mrk2Act:setShaderVector( 2, 1.08, 0, 0, 0 )
				self.Mrk2Act:setShaderVector( 3, 0.21, 0, 0, 0 )
				self.clipFinished( Mrk2Act, {} )

				Mrk3Act:completeAnimation()
				self.Mrk3Act:setAlpha( 0 )
				self.Mrk3Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk3Act:setShaderVector( 0, 1, 0, 0, 0 )
				self.Mrk3Act:setShaderVector( 1, 0, 0, 0, 0 )
				self.Mrk3Act:setShaderVector( 2, 0, 0, 0, 0 )
				self.Mrk3Act:setShaderVector( 3, 0.26, 0, 0, 0 )
				self.clipFinished( Mrk3Act, {} )

				Mrk4Act:completeAnimation()
				self.Mrk4Act:setAlpha( 0 )
				self.Mrk4Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk4Act:setShaderVector( 0, 1, 0, 0, 0 )
				self.Mrk4Act:setShaderVector( 1, 0, 0, 0, 0 )
				self.Mrk4Act:setShaderVector( 2, 0, 0, 0, 0 )
				self.Mrk4Act:setShaderVector( 3, 0.35, 0, 0, 0 )
				self.clipFinished( Mrk4Act, {} )

				Mrk5Act:completeAnimation()
				self.Mrk5Act:setAlpha( 0 )
				self.Mrk5Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk5Act:setShaderVector( 0, -0.13, 0, 0, 0 )
				self.Mrk5Act:setShaderVector( 1, 0.35, 0, 0, 0 )
				self.Mrk5Act:setShaderVector( 2, 1, 0, 0, 0 )
				self.Mrk5Act:setShaderVector( 3, 0, 0, 0, 0 )
				self.clipFinished( Mrk5Act, {} )

				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setLeftRight( true, false, 23, 132 )
				self.GlowOrangeOver:setTopBottom( true, false, 99.5, 132.5 )
				self.GlowOrangeOver:setAlpha( 0 )
				self.GlowOrangeOver:setZRot( -82 )
				self.clipFinished( GlowOrangeOver, {} )

				ZmFxFlsh10:completeAnimation()
				self.ZmFxFlsh10:setAlpha( 0 )
				self.clipFinished( ZmFxFlsh10, {} )

				ZmFxSpark2Ext0:completeAnimation()
				self.ZmFxSpark2Ext0:setLeftRight( true, false, 38, 150 )
				self.ZmFxSpark2Ext0:setTopBottom( true, false, 12, 180 )
				self.ZmFxSpark2Ext0:setAlpha( 0 )
				self.clipFinished( ZmFxSpark2Ext0, {} )

				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )
			end,
			Rnd3 = function ()
				self:setupElementClipCounter( 15 )

				Panel:completeAnimation()
				self.Panel:setAlpha( 0 )
				self.clipFinished( Panel, {} )

				RndDigits:completeAnimation()
				self.RndDigits:setAlpha( 0 )
				self.clipFinished( RndDigits, {} )

				Mrk1Def:completeAnimation()
				self.Mrk1Def:setAlpha( 1 )
				self.clipFinished( Mrk1Def, {} )

				Mrk2Def:completeAnimation()
				self.Mrk2Def:setAlpha( 1 )
				self.clipFinished( Mrk2Def, {} )
				local Mrk3DefFrame2 = function ( Mrk3Def, event )
					local Mrk3DefFrame3 = function ( Mrk3Def, event )
						if not event.interrupted then
							Mrk3Def:beginAnimation( "keyframe", 869, false, false, CoD.TweenType.Linear )
						end
						Mrk3Def:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Mrk3Def, event )
						else
							Mrk3Def:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Mrk3DefFrame3( Mrk3Def, event )
						return 
					else
						Mrk3Def:beginAnimation( "keyframe", 1240, false, false, CoD.TweenType.Linear )
						Mrk3Def:registerEventHandler( "transition_complete_keyframe", Mrk3DefFrame3 )
					end
				end
				
				Mrk3Def:completeAnimation()
				self.Mrk3Def:setAlpha( 0 )
				Mrk3DefFrame2( Mrk3Def, {} )

				Mrk4Def:completeAnimation()
				self.Mrk4Def:setAlpha( 0 )
				self.clipFinished( Mrk4Def, {} )

				Mrk5Def:completeAnimation()
				self.Mrk5Def:setAlpha( 0 )
				self.clipFinished( Mrk5Def, {} )

				Mrk1Act:completeAnimation()
				self.Mrk1Act:setAlpha( 0 )
				self.Mrk1Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk1Act:setShaderVector( 0, 1, 0, 0, 0 )
				self.Mrk1Act:setShaderVector( 1, 0, 0, 0, 0 )
				self.Mrk1Act:setShaderVector( 2, 1.25, 0, 0, 0 )
				self.Mrk1Act:setShaderVector( 3, 0.21, 0, 0, 0 )
				self.clipFinished( Mrk1Act, {} )

				Mrk2Act:completeAnimation()
				self.Mrk2Act:setAlpha( 0 )
				self.Mrk2Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk2Act:setShaderVector( 0, 1, 0, 0, 0 )
				self.Mrk2Act:setShaderVector( 1, 0, 0, 0, 0 )
				self.Mrk2Act:setShaderVector( 2, 1.08, 0, 0, 0 )
				self.Mrk2Act:setShaderVector( 3, 0.21, 0, 0, 0 )
				self.clipFinished( Mrk2Act, {} )
				local Mrk3ActFrame2 = function ( Mrk3Act, event )
					local Mrk3ActFrame3 = function ( Mrk3Act, event )
						local Mrk3ActFrame4 = function ( Mrk3Act, event )
							if not event.interrupted then
								Mrk3Act:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
							end
							Mrk3Act:setAlpha( 0 )
							Mrk3Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
							Mrk3Act:setShaderVector( 0, 1, 0, 0, 0 )
							Mrk3Act:setShaderVector( 1, 0, 0, 0, 0 )
							Mrk3Act:setShaderVector( 2, 1.15, 0, 0, 0 )
							Mrk3Act:setShaderVector( 3, 0.26, 0, 0, 0 )
							if event.interrupted then
								self.clipFinished( Mrk3Act, event )
							else
								Mrk3Act:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Mrk3ActFrame4( Mrk3Act, event )
							return 
						else
							Mrk3Act:beginAnimation( "keyframe", 1439, false, false, CoD.TweenType.Linear )
							Mrk3Act:registerEventHandler( "transition_complete_keyframe", Mrk3ActFrame4 )
						end
					end
					
					if event.interrupted then
						Mrk3ActFrame3( Mrk3Act, event )
						return 
					else
						Mrk3Act:beginAnimation( "keyframe", 680, false, true, CoD.TweenType.Linear )
						Mrk3Act:setShaderVector( 2, 1.15, 0, 0, 0 )
						Mrk3Act:registerEventHandler( "transition_complete_keyframe", Mrk3ActFrame3 )
					end
				end
				
				Mrk3Act:completeAnimation()
				self.Mrk3Act:setAlpha( 1 )
				self.Mrk3Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk3Act:setShaderVector( 0, 1, 0, 0, 0 )
				self.Mrk3Act:setShaderVector( 1, 0, 0, 0, 0 )
				self.Mrk3Act:setShaderVector( 2, 0, 0, 0, 0 )
				self.Mrk3Act:setShaderVector( 3, 0.26, 0, 0, 0 )
				Mrk3ActFrame2( Mrk3Act, {} )

				Mrk4Act:completeAnimation()
				self.Mrk4Act:setAlpha( 0 )
				self.Mrk4Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk4Act:setShaderVector( 0, 1, 0, 0, 0 )
				self.Mrk4Act:setShaderVector( 1, 0, 0, 0, 0 )
				self.Mrk4Act:setShaderVector( 2, 0, 0, 0, 0 )
				self.Mrk4Act:setShaderVector( 3, 0.35, 0, 0, 0 )
				self.clipFinished( Mrk4Act, {} )

				Mrk5Act:completeAnimation()
				self.Mrk5Act:setAlpha( 0 )
				self.Mrk5Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk5Act:setShaderVector( 0, -0.13, 0, 0, 0 )
				self.Mrk5Act:setShaderVector( 1, 0.35, 0, 0, 0 )
				self.Mrk5Act:setShaderVector( 2, 1, 0, 0, 0 )
				self.Mrk5Act:setShaderVector( 3, 0, 0, 0, 0 )
				self.clipFinished( Mrk5Act, {} )
				local GlowOrangeOverFrame2 = function ( GlowOrangeOver, event )
					local GlowOrangeOverFrame3 = function ( GlowOrangeOver, event )
						local GlowOrangeOverFrame4 = function ( GlowOrangeOver, event )
							if not event.interrupted then
								GlowOrangeOver:beginAnimation( "keyframe", 1019, false, false, CoD.TweenType.Linear )
							end
							GlowOrangeOver:setLeftRight( true, false, 43, 152 )
							GlowOrangeOver:setTopBottom( true, false, 104.5, 137.5 )
							GlowOrangeOver:setAlpha( 0 )
							GlowOrangeOver:setZRot( -84 )
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
							GlowOrangeOver:beginAnimation( "keyframe", 2230, false, false, CoD.TweenType.Linear )
							GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame4 )
						end
					end
					
					if event.interrupted then
						GlowOrangeOverFrame3( GlowOrangeOver, event )
						return 
					else
						GlowOrangeOver:beginAnimation( "keyframe", 889, false, false, CoD.TweenType.Bounce )
						GlowOrangeOver:setAlpha( 1 )
						GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame3 )
					end
				end
				
				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setLeftRight( true, false, 43, 152 )
				self.GlowOrangeOver:setTopBottom( true, false, 104.5, 137.5 )
				self.GlowOrangeOver:setAlpha( 0 )
				self.GlowOrangeOver:setZRot( -84 )
				GlowOrangeOverFrame2( GlowOrangeOver, {} )
				local ZmFxFlsh10Frame2 = function ( ZmFxFlsh10, event )
					local ZmFxFlsh10Frame3 = function ( ZmFxFlsh10, event )
						if not event.interrupted then
							ZmFxFlsh10:beginAnimation( "keyframe", 1110, false, false, CoD.TweenType.Linear )
						end
						ZmFxFlsh10:setRGB( 0, 0, 0 )
						ZmFxFlsh10:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( ZmFxFlsh10, event )
						else
							ZmFxFlsh10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ZmFxFlsh10Frame3( ZmFxFlsh10, event )
						return 
					else
						ZmFxFlsh10:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
						ZmFxFlsh10:setRGB( 0.9, 0.73, 0.68 )
						ZmFxFlsh10:registerEventHandler( "transition_complete_keyframe", ZmFxFlsh10Frame3 )
					end
				end
				
				ZmFxFlsh10:completeAnimation()
				self.ZmFxFlsh10:setRGB( 0, 0, 0 )
				self.ZmFxFlsh10:setAlpha( 1 )
				ZmFxFlsh10Frame2( ZmFxFlsh10, {} )
				local ZmFxSpark2Ext0Frame2 = function ( ZmFxSpark2Ext0, event )
					local ZmFxSpark2Ext0Frame3 = function ( ZmFxSpark2Ext0, event )
						local ZmFxSpark2Ext0Frame4 = function ( ZmFxSpark2Ext0, event )
							if not event.interrupted then
								ZmFxSpark2Ext0:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
							end
							ZmFxSpark2Ext0:setLeftRight( true, false, 54, 166 )
							ZmFxSpark2Ext0:setTopBottom( true, false, 12, 180 )
							ZmFxSpark2Ext0:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( ZmFxSpark2Ext0, event )
							else
								ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ZmFxSpark2Ext0Frame4( ZmFxSpark2Ext0, event )
							return 
						else
							ZmFxSpark2Ext0:beginAnimation( "keyframe", 620, false, true, CoD.TweenType.Linear )
							ZmFxSpark2Ext0:setLeftRight( true, false, 54, 166 )
							ZmFxSpark2Ext0:setTopBottom( true, false, 12, 180 )
							ZmFxSpark2Ext0:setAlpha( 1 )
							ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame4 )
						end
					end
					
					if event.interrupted then
						ZmFxSpark2Ext0Frame3( ZmFxSpark2Ext0, event )
						return 
					else
						ZmFxSpark2Ext0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						ZmFxSpark2Ext0:setLeftRight( true, false, 49.44, 161.44 )
						ZmFxSpark2Ext0:setTopBottom( true, false, -43.62, 124.38 )
						ZmFxSpark2Ext0:setAlpha( 0.45 )
						ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame3 )
					end
				end
				
				ZmFxSpark2Ext0:completeAnimation()
				self.ZmFxSpark2Ext0:setLeftRight( true, false, 49, 161 )
				self.ZmFxSpark2Ext0:setTopBottom( true, false, -49, 119 )
				self.ZmFxSpark2Ext0:setAlpha( 0 )
				ZmFxSpark2Ext0Frame2( ZmFxSpark2Ext0, {} )
			end
		},
		Rnd3 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 15 )

				Panel:completeAnimation()
				self.Panel:setAlpha( 0 )
				self.clipFinished( Panel, {} )

				RndDigits:completeAnimation()
				self.RndDigits:setAlpha( 0 )
				self.clipFinished( RndDigits, {} )

				Mrk1Def:completeAnimation()
				self.Mrk1Def:setAlpha( 1 )
				self.clipFinished( Mrk1Def, {} )

				Mrk2Def:completeAnimation()
				self.Mrk2Def:setAlpha( 1 )
				self.clipFinished( Mrk2Def, {} )

				Mrk3Def:completeAnimation()
				self.Mrk3Def:setAlpha( 1 )
				self.clipFinished( Mrk3Def, {} )

				Mrk4Def:completeAnimation()
				self.Mrk4Def:setAlpha( 0 )
				self.clipFinished( Mrk4Def, {} )

				Mrk5Def:completeAnimation()
				self.Mrk5Def:setAlpha( 0 )
				self.clipFinished( Mrk5Def, {} )

				Mrk1Act:completeAnimation()
				self.Mrk1Act:setAlpha( 0 )
				self.Mrk1Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk1Act:setShaderVector( 0, 1, 0, 0, 0 )
				self.Mrk1Act:setShaderVector( 1, 0, 0, 0, 0 )
				self.Mrk1Act:setShaderVector( 2, 1.25, 0, 0, 0 )
				self.Mrk1Act:setShaderVector( 3, 0.21, 0, 0, 0 )
				self.clipFinished( Mrk1Act, {} )

				Mrk2Act:completeAnimation()
				self.Mrk2Act:setAlpha( 0 )
				self.Mrk2Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk2Act:setShaderVector( 0, 1, 0, 0, 0 )
				self.Mrk2Act:setShaderVector( 1, 0, 0, 0, 0 )
				self.Mrk2Act:setShaderVector( 2, 1.08, 0, 0, 0 )
				self.Mrk2Act:setShaderVector( 3, 0.21, 0, 0, 0 )
				self.clipFinished( Mrk2Act, {} )

				Mrk3Act:completeAnimation()
				self.Mrk3Act:setAlpha( 0 )
				self.Mrk3Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk3Act:setShaderVector( 0, 1, 0, 0, 0 )
				self.Mrk3Act:setShaderVector( 1, 0, 0, 0, 0 )
				self.Mrk3Act:setShaderVector( 2, 1.15, 0, 0, 0 )
				self.Mrk3Act:setShaderVector( 3, 0.26, 0, 0, 0 )
				self.clipFinished( Mrk3Act, {} )

				Mrk4Act:completeAnimation()
				self.Mrk4Act:setAlpha( 0 )
				self.Mrk4Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk4Act:setShaderVector( 0, 1, 0, 0, 0 )
				self.Mrk4Act:setShaderVector( 1, 0, 0, 0, 0 )
				self.Mrk4Act:setShaderVector( 2, 0, 0, 0, 0 )
				self.Mrk4Act:setShaderVector( 3, 0.35, 0, 0, 0 )
				self.clipFinished( Mrk4Act, {} )

				Mrk5Act:completeAnimation()
				self.Mrk5Act:setAlpha( 0 )
				self.Mrk5Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk5Act:setShaderVector( 0, -0.13, 0, 0, 0 )
				self.Mrk5Act:setShaderVector( 1, 0.35, 0, 0, 0 )
				self.Mrk5Act:setShaderVector( 2, 1, 0, 0, 0 )
				self.Mrk5Act:setShaderVector( 3, 0, 0, 0, 0 )
				self.clipFinished( Mrk5Act, {} )

				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setLeftRight( true, false, 43, 152 )
				self.GlowOrangeOver:setTopBottom( true, false, 104.5, 137.5 )
				self.GlowOrangeOver:setAlpha( 0 )
				self.GlowOrangeOver:setZRot( -84 )
				self.clipFinished( GlowOrangeOver, {} )

				ZmFxFlsh10:completeAnimation()
				self.ZmFxFlsh10:setAlpha( 0 )
				self.clipFinished( ZmFxFlsh10, {} )

				ZmFxSpark2Ext0:completeAnimation()
				self.ZmFxSpark2Ext0:setLeftRight( true, false, 54, 166 )
				self.ZmFxSpark2Ext0:setTopBottom( true, false, 12, 180 )
				self.ZmFxSpark2Ext0:setAlpha( 0 )
				self.clipFinished( ZmFxSpark2Ext0, {} )
			end,
			Rnd4 = function ()
				self:setupElementClipCounter( 16 )

				Panel:completeAnimation()
				self.Panel:setAlpha( 0 )
				self.clipFinished( Panel, {} )

				RndDigits:completeAnimation()
				self.RndDigits:setAlpha( 0 )
				self.clipFinished( RndDigits, {} )

				Mrk1Def:completeAnimation()
				self.Mrk1Def:setAlpha( 1 )
				self.clipFinished( Mrk1Def, {} )

				Mrk2Def:completeAnimation()
				self.Mrk2Def:setAlpha( 1 )
				self.clipFinished( Mrk2Def, {} )

				Mrk3Def:completeAnimation()
				self.Mrk3Def:setAlpha( 1 )
				self.clipFinished( Mrk3Def, {} )
				local Mrk4DefFrame2 = function ( Mrk4Def, event )
					local Mrk4DefFrame3 = function ( Mrk4Def, event )
						if not event.interrupted then
							Mrk4Def:beginAnimation( "keyframe", 869, false, false, CoD.TweenType.Linear )
						end
						Mrk4Def:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Mrk4Def, event )
						else
							Mrk4Def:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Mrk4DefFrame3( Mrk4Def, event )
						return 
					else
						Mrk4Def:beginAnimation( "keyframe", 1240, false, false, CoD.TweenType.Linear )
						Mrk4Def:registerEventHandler( "transition_complete_keyframe", Mrk4DefFrame3 )
					end
				end
				
				Mrk4Def:completeAnimation()
				self.Mrk4Def:setAlpha( 0 )
				Mrk4DefFrame2( Mrk4Def, {} )

				Mrk5Def:completeAnimation()
				self.Mrk5Def:setAlpha( 0 )
				self.clipFinished( Mrk5Def, {} )

				Mrk1Act:completeAnimation()
				self.Mrk1Act:setAlpha( 0 )
				self.Mrk1Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk1Act:setShaderVector( 0, 1, 0, 0, 0 )
				self.Mrk1Act:setShaderVector( 1, 0, 0, 0, 0 )
				self.Mrk1Act:setShaderVector( 2, 1.25, 0, 0, 0 )
				self.Mrk1Act:setShaderVector( 3, 0.21, 0, 0, 0 )
				self.clipFinished( Mrk1Act, {} )

				Mrk2Act:completeAnimation()
				self.Mrk2Act:setAlpha( 0 )
				self.Mrk2Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk2Act:setShaderVector( 0, 1, 0, 0, 0 )
				self.Mrk2Act:setShaderVector( 1, 0, 0, 0, 0 )
				self.Mrk2Act:setShaderVector( 2, 1.08, 0, 0, 0 )
				self.Mrk2Act:setShaderVector( 3, 0.21, 0, 0, 0 )
				self.clipFinished( Mrk2Act, {} )

				Mrk3Act:completeAnimation()
				self.Mrk3Act:setAlpha( 0 )
				self.Mrk3Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk3Act:setShaderVector( 0, 1, 0, 0, 0 )
				self.Mrk3Act:setShaderVector( 1, 0, 0, 0, 0 )
				self.Mrk3Act:setShaderVector( 2, 1.15, 0, 0, 0 )
				self.Mrk3Act:setShaderVector( 3, 0.26, 0, 0, 0 )
				self.clipFinished( Mrk3Act, {} )
				local Mrk4ActFrame2 = function ( Mrk4Act, event )
					local Mrk4ActFrame3 = function ( Mrk4Act, event )
						local Mrk4ActFrame4 = function ( Mrk4Act, event )
							if not event.interrupted then
								Mrk4Act:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
							end
							Mrk4Act:setAlpha( 0 )
							Mrk4Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
							Mrk4Act:setShaderVector( 0, 1, 0, 0, 0 )
							Mrk4Act:setShaderVector( 1, 0, 0, 0, 0 )
							Mrk4Act:setShaderVector( 2, 1.12, 0, 0, 0 )
							Mrk4Act:setShaderVector( 3, 0.35, 0, 0, 0 )
							if event.interrupted then
								self.clipFinished( Mrk4Act, event )
							else
								Mrk4Act:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Mrk4ActFrame4( Mrk4Act, event )
							return 
						else
							Mrk4Act:beginAnimation( "keyframe", 1439, false, false, CoD.TweenType.Linear )
							Mrk4Act:registerEventHandler( "transition_complete_keyframe", Mrk4ActFrame4 )
						end
					end
					
					if event.interrupted then
						Mrk4ActFrame3( Mrk4Act, event )
						return 
					else
						Mrk4Act:beginAnimation( "keyframe", 680, false, false, CoD.TweenType.Linear )
						Mrk4Act:setShaderVector( 2, 1.12, 0, 0, 0 )
						Mrk4Act:registerEventHandler( "transition_complete_keyframe", Mrk4ActFrame3 )
					end
				end
				
				Mrk4Act:completeAnimation()
				self.Mrk4Act:setAlpha( 1 )
				self.Mrk4Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk4Act:setShaderVector( 0, 1, 0, 0, 0 )
				self.Mrk4Act:setShaderVector( 1, 0, 0, 0, 0 )
				self.Mrk4Act:setShaderVector( 2, 0, 0, 0, 0 )
				self.Mrk4Act:setShaderVector( 3, 0.35, 0, 0, 0 )
				Mrk4ActFrame2( Mrk4Act, {} )

				Mrk5Act:completeAnimation()
				self.Mrk5Act:setAlpha( 0 )
				self.Mrk5Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk5Act:setShaderVector( 0, -0.13, 0, 0, 0 )
				self.Mrk5Act:setShaderVector( 1, 0.35, 0, 0, 0 )
				self.Mrk5Act:setShaderVector( 2, 1, 0, 0, 0 )
				self.Mrk5Act:setShaderVector( 3, 0, 0, 0, 0 )
				self.clipFinished( Mrk5Act, {} )
				local GlowOrangeOverFrame2 = function ( GlowOrangeOver, event )
					local GlowOrangeOverFrame3 = function ( GlowOrangeOver, event )
						local GlowOrangeOverFrame4 = function ( GlowOrangeOver, event )
							if not event.interrupted then
								GlowOrangeOver:beginAnimation( "keyframe", 1019, false, false, CoD.TweenType.Linear )
							end
							GlowOrangeOver:setLeftRight( true, false, 76, 160 )
							GlowOrangeOver:setTopBottom( true, false, 95, 128 )
							GlowOrangeOver:setAlpha( 0 )
							GlowOrangeOver:setZRot( -93 )
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
							GlowOrangeOver:beginAnimation( "keyframe", 2230, false, false, CoD.TweenType.Linear )
							GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame4 )
						end
					end
					
					if event.interrupted then
						GlowOrangeOverFrame3( GlowOrangeOver, event )
						return 
					else
						GlowOrangeOver:beginAnimation( "keyframe", 889, false, false, CoD.TweenType.Bounce )
						GlowOrangeOver:setAlpha( 1 )
						GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame3 )
					end
				end
				
				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setLeftRight( true, false, 76, 160 )
				self.GlowOrangeOver:setTopBottom( true, false, 95, 128 )
				self.GlowOrangeOver:setAlpha( 0 )
				self.GlowOrangeOver:setZRot( -93 )
				GlowOrangeOverFrame2( GlowOrangeOver, {} )
				local ZmFxFlsh10Frame2 = function ( ZmFxFlsh10, event )
					local ZmFxFlsh10Frame3 = function ( ZmFxFlsh10, event )
						if not event.interrupted then
							ZmFxFlsh10:beginAnimation( "keyframe", 1110, false, false, CoD.TweenType.Linear )
						end
						ZmFxFlsh10:setRGB( 0, 0, 0 )
						ZmFxFlsh10:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( ZmFxFlsh10, event )
						else
							ZmFxFlsh10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ZmFxFlsh10Frame3( ZmFxFlsh10, event )
						return 
					else
						ZmFxFlsh10:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
						ZmFxFlsh10:setRGB( 0.9, 0.73, 0.68 )
						ZmFxFlsh10:registerEventHandler( "transition_complete_keyframe", ZmFxFlsh10Frame3 )
					end
				end
				
				ZmFxFlsh10:completeAnimation()
				self.ZmFxFlsh10:setRGB( 0, 0, 0 )
				self.ZmFxFlsh10:setAlpha( 1 )
				ZmFxFlsh10Frame2( ZmFxFlsh10, {} )
				local ZmFxSpark2Ext0Frame2 = function ( ZmFxSpark2Ext0, event )
					local ZmFxSpark2Ext0Frame3 = function ( ZmFxSpark2Ext0, event )
						local ZmFxSpark2Ext0Frame4 = function ( ZmFxSpark2Ext0, event )
							if not event.interrupted then
								ZmFxSpark2Ext0:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
							end
							ZmFxSpark2Ext0:setLeftRight( true, false, 71.5, 183.5 )
							ZmFxSpark2Ext0:setTopBottom( true, false, -4, 164 )
							ZmFxSpark2Ext0:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( ZmFxSpark2Ext0, event )
							else
								ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ZmFxSpark2Ext0Frame4( ZmFxSpark2Ext0, event )
							return 
						else
							ZmFxSpark2Ext0:beginAnimation( "keyframe", 620, false, true, CoD.TweenType.Linear )
							ZmFxSpark2Ext0:setLeftRight( true, false, 71.5, 183.5 )
							ZmFxSpark2Ext0:setTopBottom( true, false, -4, 164 )
							ZmFxSpark2Ext0:setAlpha( 1 )
							ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame4 )
						end
					end
					
					if event.interrupted then
						ZmFxSpark2Ext0Frame3( ZmFxSpark2Ext0, event )
						return 
					else
						ZmFxSpark2Ext0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						ZmFxSpark2Ext0:setLeftRight( true, false, 73.78, 185.78 )
						ZmFxSpark2Ext0:setTopBottom( true, false, -45.03, 122.97 )
						ZmFxSpark2Ext0:setAlpha( 0.45 )
						ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame3 )
					end
				end
				
				ZmFxSpark2Ext0:completeAnimation()
				self.ZmFxSpark2Ext0:setLeftRight( true, false, 74, 186 )
				self.ZmFxSpark2Ext0:setTopBottom( true, false, -49, 119 )
				self.ZmFxSpark2Ext0:setAlpha( 0 )
				ZmFxSpark2Ext0Frame2( ZmFxSpark2Ext0, {} )

				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )
			end
		},
		Rnd4 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 16 )

				Panel:completeAnimation()
				self.Panel:setAlpha( 0 )
				self.clipFinished( Panel, {} )

				RndDigits:completeAnimation()
				self.RndDigits:setAlpha( 0 )
				self.clipFinished( RndDigits, {} )

				Mrk1Def:completeAnimation()
				self.Mrk1Def:setAlpha( 1 )
				self.clipFinished( Mrk1Def, {} )

				Mrk2Def:completeAnimation()
				self.Mrk2Def:setAlpha( 1 )
				self.clipFinished( Mrk2Def, {} )

				Mrk3Def:completeAnimation()
				self.Mrk3Def:setAlpha( 1 )
				self.clipFinished( Mrk3Def, {} )

				Mrk4Def:completeAnimation()
				self.Mrk4Def:setAlpha( 1 )
				self.clipFinished( Mrk4Def, {} )

				Mrk5Def:completeAnimation()
				self.Mrk5Def:setAlpha( 0 )
				self.clipFinished( Mrk5Def, {} )

				Mrk1Act:completeAnimation()
				self.Mrk1Act:setAlpha( 0 )
				self.Mrk1Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk1Act:setShaderVector( 0, 1, 0, 0, 0 )
				self.Mrk1Act:setShaderVector( 1, 0, 0, 0, 0 )
				self.Mrk1Act:setShaderVector( 2, 1.25, 0, 0, 0 )
				self.Mrk1Act:setShaderVector( 3, 0.21, 0, 0, 0 )
				self.clipFinished( Mrk1Act, {} )

				Mrk2Act:completeAnimation()
				self.Mrk2Act:setAlpha( 0 )
				self.Mrk2Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk2Act:setShaderVector( 0, 1, 0, 0, 0 )
				self.Mrk2Act:setShaderVector( 1, 0, 0, 0, 0 )
				self.Mrk2Act:setShaderVector( 2, 1.08, 0, 0, 0 )
				self.Mrk2Act:setShaderVector( 3, 0.21, 0, 0, 0 )
				self.clipFinished( Mrk2Act, {} )

				Mrk3Act:completeAnimation()
				self.Mrk3Act:setAlpha( 0 )
				self.Mrk3Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk3Act:setShaderVector( 0, 1, 0, 0, 0 )
				self.Mrk3Act:setShaderVector( 1, 0, 0, 0, 0 )
				self.Mrk3Act:setShaderVector( 2, 1.15, 0, 0, 0 )
				self.Mrk3Act:setShaderVector( 3, 0.26, 0, 0, 0 )
				self.clipFinished( Mrk3Act, {} )

				Mrk4Act:completeAnimation()
				self.Mrk4Act:setAlpha( 0 )
				self.Mrk4Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk4Act:setShaderVector( 0, 1, 0, 0, 0 )
				self.Mrk4Act:setShaderVector( 1, 0, 0, 0, 0 )
				self.Mrk4Act:setShaderVector( 2, 0, 0, 0, 0 )
				self.Mrk4Act:setShaderVector( 3, 0.35, 0, 0, 0 )
				self.clipFinished( Mrk4Act, {} )

				Mrk5Act:completeAnimation()
				self.Mrk5Act:setAlpha( 0 )
				self.Mrk5Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk5Act:setShaderVector( 0, -0.13, 0, 0, 0 )
				self.Mrk5Act:setShaderVector( 1, 0.35, 0, 0, 0 )
				self.Mrk5Act:setShaderVector( 2, 1, 0, 0, 0 )
				self.Mrk5Act:setShaderVector( 3, 0, 0, 0, 0 )
				self.clipFinished( Mrk5Act, {} )

				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setLeftRight( true, false, 76, 160 )
				self.GlowOrangeOver:setTopBottom( true, false, 95, 128 )
				self.GlowOrangeOver:setAlpha( 0 )
				self.GlowOrangeOver:setZRot( -93 )
				self.clipFinished( GlowOrangeOver, {} )

				ZmFxFlsh10:completeAnimation()
				self.ZmFxFlsh10:setRGB( 0, 0, 0 )
				self.ZmFxFlsh10:setAlpha( 0 )
				self.clipFinished( ZmFxFlsh10, {} )

				ZmFxSpark2Ext0:completeAnimation()
				self.ZmFxSpark2Ext0:setLeftRight( true, false, 71.5, 183.5 )
				self.ZmFxSpark2Ext0:setTopBottom( true, false, -4, 164 )
				self.ZmFxSpark2Ext0:setAlpha( 0 )
				self.clipFinished( ZmFxSpark2Ext0, {} )

				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )
			end,
			Rnd5 = function ()
				self:setupElementClipCounter( 16 )

				Panel:completeAnimation()
				self.Panel:setAlpha( 0 )
				self.clipFinished( Panel, {} )

				RndDigits:completeAnimation()
				self.RndDigits:setAlpha( 0 )
				self.clipFinished( RndDigits, {} )

				Mrk1Def:completeAnimation()
				self.Mrk1Def:setAlpha( 1 )
				self.clipFinished( Mrk1Def, {} )

				Mrk2Def:completeAnimation()
				self.Mrk2Def:setAlpha( 1 )
				self.clipFinished( Mrk2Def, {} )

				Mrk3Def:completeAnimation()
				self.Mrk3Def:setAlpha( 1 )
				self.clipFinished( Mrk3Def, {} )

				Mrk4Def:completeAnimation()
				self.Mrk4Def:setAlpha( 1 )
				self.clipFinished( Mrk4Def, {} )
				local Mrk5DefFrame2 = function ( Mrk5Def, event )
					local Mrk5DefFrame3 = function ( Mrk5Def, event )
						if not event.interrupted then
							Mrk5Def:beginAnimation( "keyframe", 869, false, false, CoD.TweenType.Linear )
						end
						Mrk5Def:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Mrk5Def, event )
						else
							Mrk5Def:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Mrk5DefFrame3( Mrk5Def, event )
						return 
					else
						Mrk5Def:beginAnimation( "keyframe", 1240, false, false, CoD.TweenType.Linear )
						Mrk5Def:registerEventHandler( "transition_complete_keyframe", Mrk5DefFrame3 )
					end
				end
				
				Mrk5Def:completeAnimation()
				self.Mrk5Def:setAlpha( 0 )
				Mrk5DefFrame2( Mrk5Def, {} )

				Mrk1Act:completeAnimation()
				self.Mrk1Act:setAlpha( 0 )
				self.Mrk1Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk1Act:setShaderVector( 0, 1, 0, 0, 0 )
				self.Mrk1Act:setShaderVector( 1, 0, 0, 0, 0 )
				self.Mrk1Act:setShaderVector( 2, 1.25, 0, 0, 0 )
				self.Mrk1Act:setShaderVector( 3, 0.21, 0, 0, 0 )
				self.clipFinished( Mrk1Act, {} )

				Mrk2Act:completeAnimation()
				self.Mrk2Act:setAlpha( 0 )
				self.Mrk2Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk2Act:setShaderVector( 0, 1, 0, 0, 0 )
				self.Mrk2Act:setShaderVector( 1, 0, 0, 0, 0 )
				self.Mrk2Act:setShaderVector( 2, 1.08, 0, 0, 0 )
				self.Mrk2Act:setShaderVector( 3, 0.21, 0, 0, 0 )
				self.clipFinished( Mrk2Act, {} )

				Mrk3Act:completeAnimation()
				self.Mrk3Act:setAlpha( 0 )
				self.Mrk3Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk3Act:setShaderVector( 0, 1, 0, 0, 0 )
				self.Mrk3Act:setShaderVector( 1, 0, 0, 0, 0 )
				self.Mrk3Act:setShaderVector( 2, 1.15, 0, 0, 0 )
				self.Mrk3Act:setShaderVector( 3, 0.26, 0, 0, 0 )
				self.clipFinished( Mrk3Act, {} )

				Mrk4Act:completeAnimation()
				self.Mrk4Act:setAlpha( 0 )
				self.Mrk4Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk4Act:setShaderVector( 0, 1, 0, 0, 0 )
				self.Mrk4Act:setShaderVector( 1, 0, 0, 0, 0 )
				self.Mrk4Act:setShaderVector( 2, 1.12, 0, 0, 0 )
				self.Mrk4Act:setShaderVector( 3, 0.35, 0, 0, 0 )
				self.clipFinished( Mrk4Act, {} )
				local Mrk5ActFrame2 = function ( Mrk5Act, event )
					local Mrk5ActFrame3 = function ( Mrk5Act, event )
						local Mrk5ActFrame4 = function ( Mrk5Act, event )
							if not event.interrupted then
								Mrk5Act:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
							end
							Mrk5Act:setAlpha( 0 )
							Mrk5Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
							Mrk5Act:setShaderVector( 0, 1.15, 0, 0, 0 )
							Mrk5Act:setShaderVector( 1, 0.22, 0, 0, 0 )
							Mrk5Act:setShaderVector( 2, 1, 0, 0, 0 )
							Mrk5Act:setShaderVector( 3, 0, 0, 0, 0 )
							if event.interrupted then
								self.clipFinished( Mrk5Act, event )
							else
								Mrk5Act:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Mrk5ActFrame4( Mrk5Act, event )
							return 
						else
							Mrk5Act:beginAnimation( "keyframe", 1439, false, false, CoD.TweenType.Linear )
							Mrk5Act:registerEventHandler( "transition_complete_keyframe", Mrk5ActFrame4 )
						end
					end
					
					if event.interrupted then
						Mrk5ActFrame3( Mrk5Act, event )
						return 
					else
						Mrk5Act:beginAnimation( "keyframe", 680, false, false, CoD.TweenType.Linear )
						Mrk5Act:setShaderVector( 0, 1.15, 0, 0, 0 )
						Mrk5Act:setShaderVector( 1, 0.22, 0, 0, 0 )
						Mrk5Act:registerEventHandler( "transition_complete_keyframe", Mrk5ActFrame3 )
					end
				end
				
				Mrk5Act:completeAnimation()
				self.Mrk5Act:setAlpha( 1 )
				self.Mrk5Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk5Act:setShaderVector( 0, -0.13, 0, 0, 0 )
				self.Mrk5Act:setShaderVector( 1, 0.11, 0, 0, 0 )
				self.Mrk5Act:setShaderVector( 2, 1, 0, 0, 0 )
				self.Mrk5Act:setShaderVector( 3, 0, 0, 0, 0 )
				Mrk5ActFrame2( Mrk5Act, {} )
				local GlowOrangeOverFrame2 = function ( GlowOrangeOver, event )
					local GlowOrangeOverFrame3 = function ( GlowOrangeOver, event )
						local GlowOrangeOverFrame4 = function ( GlowOrangeOver, event )
							if not event.interrupted then
								GlowOrangeOver:beginAnimation( "keyframe", 1019, false, false, CoD.TweenType.Linear )
							end
							GlowOrangeOver:setLeftRight( true, false, 20, 158 )
							GlowOrangeOver:setTopBottom( true, false, 107.25, 140.25 )
							GlowOrangeOver:setAlpha( 0 )
							GlowOrangeOver:setZRot( -214 )
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
							GlowOrangeOver:beginAnimation( "keyframe", 2230, false, false, CoD.TweenType.Linear )
							GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame4 )
						end
					end
					
					if event.interrupted then
						GlowOrangeOverFrame3( GlowOrangeOver, event )
						return 
					else
						GlowOrangeOver:beginAnimation( "keyframe", 889, false, false, CoD.TweenType.Bounce )
						GlowOrangeOver:setAlpha( 1 )
						GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame3 )
					end
				end
				
				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setLeftRight( true, false, 20, 158 )
				self.GlowOrangeOver:setTopBottom( true, false, 107.25, 140.25 )
				self.GlowOrangeOver:setAlpha( 0 )
				self.GlowOrangeOver:setZRot( -214 )
				GlowOrangeOverFrame2( GlowOrangeOver, {} )
				local ZmFxFlsh10Frame2 = function ( ZmFxFlsh10, event )
					local ZmFxFlsh10Frame3 = function ( ZmFxFlsh10, event )
						if not event.interrupted then
							ZmFxFlsh10:beginAnimation( "keyframe", 1110, false, false, CoD.TweenType.Linear )
						end
						ZmFxFlsh10:setRGB( 0, 0, 0 )
						ZmFxFlsh10:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( ZmFxFlsh10, event )
						else
							ZmFxFlsh10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ZmFxFlsh10Frame3( ZmFxFlsh10, event )
						return 
					else
						ZmFxFlsh10:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
						ZmFxFlsh10:setRGB( 0.9, 0.73, 0.68 )
						ZmFxFlsh10:registerEventHandler( "transition_complete_keyframe", ZmFxFlsh10Frame3 )
					end
				end
				
				ZmFxFlsh10:completeAnimation()
				self.ZmFxFlsh10:setRGB( 0, 0, 0 )
				self.ZmFxFlsh10:setAlpha( 1 )
				ZmFxFlsh10Frame2( ZmFxFlsh10, {} )
				local ZmFxSpark2Ext0Frame2 = function ( ZmFxSpark2Ext0, event )
					local ZmFxSpark2Ext0Frame3 = function ( ZmFxSpark2Ext0, event )
						local ZmFxSpark2Ext0Frame4 = function ( ZmFxSpark2Ext0, event )
							if not event.interrupted then
								ZmFxSpark2Ext0:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
							end
							ZmFxSpark2Ext0:setLeftRight( true, false, 85, 197 )
							ZmFxSpark2Ext0:setTopBottom( true, false, 8, 176 )
							ZmFxSpark2Ext0:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( ZmFxSpark2Ext0, event )
							else
								ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ZmFxSpark2Ext0Frame4( ZmFxSpark2Ext0, event )
							return 
						else
							ZmFxSpark2Ext0:beginAnimation( "keyframe", 620, false, true, CoD.TweenType.Linear )
							ZmFxSpark2Ext0:setLeftRight( true, false, 85, 197 )
							ZmFxSpark2Ext0:setTopBottom( true, false, 8, 176 )
							ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame4 )
						end
					end
					
					if event.interrupted then
						ZmFxSpark2Ext0Frame3( ZmFxSpark2Ext0, event )
						return 
					else
						ZmFxSpark2Ext0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						ZmFxSpark2Ext0:setLeftRight( true, false, -0.71, 111.29 )
						ZmFxSpark2Ext0:setTopBottom( true, false, -41.24, 126.76 )
						ZmFxSpark2Ext0:setAlpha( 1 )
						ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame3 )
					end
				end
				
				ZmFxSpark2Ext0:completeAnimation()
				self.ZmFxSpark2Ext0:setLeftRight( true, false, -9, 103 )
				self.ZmFxSpark2Ext0:setTopBottom( true, false, -46, 122 )
				self.ZmFxSpark2Ext0:setAlpha( 0 )
				ZmFxSpark2Ext0Frame2( ZmFxSpark2Ext0, {} )

				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )
			end
		},
		Rnd5 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 16 )

				Panel:completeAnimation()
				self.Panel:setAlpha( 0 )
				self.clipFinished( Panel, {} )

				RndDigits:completeAnimation()
				self.RndDigits:setAlpha( 0 )
				self.clipFinished( RndDigits, {} )

				Mrk1Def:completeAnimation()
				self.Mrk1Def:setAlpha( 1 )
				self.clipFinished( Mrk1Def, {} )

				Mrk2Def:completeAnimation()
				self.Mrk2Def:setAlpha( 1 )
				self.clipFinished( Mrk2Def, {} )

				Mrk3Def:completeAnimation()
				self.Mrk3Def:setAlpha( 1 )
				self.clipFinished( Mrk3Def, {} )

				Mrk4Def:completeAnimation()
				self.Mrk4Def:setAlpha( 1 )
				self.clipFinished( Mrk4Def, {} )

				Mrk5Def:completeAnimation()
				self.Mrk5Def:setAlpha( 1 )
				self.clipFinished( Mrk5Def, {} )

				Mrk1Act:completeAnimation()
				self.Mrk1Act:setAlpha( 0 )
				self.Mrk1Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk1Act:setShaderVector( 0, 1, 0, 0, 0 )
				self.Mrk1Act:setShaderVector( 1, 0, 0, 0, 0 )
				self.Mrk1Act:setShaderVector( 2, 1.25, 0, 0, 0 )
				self.Mrk1Act:setShaderVector( 3, 0.21, 0, 0, 0 )
				self.clipFinished( Mrk1Act, {} )

				Mrk2Act:completeAnimation()
				self.Mrk2Act:setAlpha( 0 )
				self.Mrk2Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk2Act:setShaderVector( 0, 1, 0, 0, 0 )
				self.Mrk2Act:setShaderVector( 1, 0, 0, 0, 0 )
				self.Mrk2Act:setShaderVector( 2, 1.08, 0, 0, 0 )
				self.Mrk2Act:setShaderVector( 3, 0.21, 0, 0, 0 )
				self.clipFinished( Mrk2Act, {} )

				Mrk3Act:completeAnimation()
				self.Mrk3Act:setAlpha( 0 )
				self.Mrk3Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk3Act:setShaderVector( 0, 1, 0, 0, 0 )
				self.Mrk3Act:setShaderVector( 1, 0, 0, 0, 0 )
				self.Mrk3Act:setShaderVector( 2, 1.15, 0, 0, 0 )
				self.Mrk3Act:setShaderVector( 3, 0.26, 0, 0, 0 )
				self.clipFinished( Mrk3Act, {} )

				Mrk4Act:completeAnimation()
				self.Mrk4Act:setAlpha( 0 )
				self.Mrk4Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk4Act:setShaderVector( 0, 1, 0, 0, 0 )
				self.Mrk4Act:setShaderVector( 1, 0, 0, 0, 0 )
				self.Mrk4Act:setShaderVector( 2, 1.12, 0, 0, 0 )
				self.Mrk4Act:setShaderVector( 3, 0.35, 0, 0, 0 )
				self.clipFinished( Mrk4Act, {} )

				Mrk5Act:completeAnimation()
				self.Mrk5Act:setAlpha( 0 )
				self.Mrk5Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk5Act:setShaderVector( 0, -0.13, 0, 0, 0 )
				self.Mrk5Act:setShaderVector( 1, 0.11, 0, 0, 0 )
				self.Mrk5Act:setShaderVector( 2, 1, 0, 0, 0 )
				self.Mrk5Act:setShaderVector( 3, 0, 0, 0, 0 )
				self.clipFinished( Mrk5Act, {} )

				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setLeftRight( true, false, 20, 158 )
				self.GlowOrangeOver:setTopBottom( true, false, 107.25, 140.25 )
				self.GlowOrangeOver:setAlpha( 0 )
				self.GlowOrangeOver:setZRot( -214 )
				self.clipFinished( GlowOrangeOver, {} )

				ZmFxFlsh10:completeAnimation()
				self.ZmFxFlsh10:setRGB( 0, 0, 0 )
				self.ZmFxFlsh10:setAlpha( 0 )
				self.clipFinished( ZmFxFlsh10, {} )

				ZmFxSpark2Ext0:completeAnimation()
				self.ZmFxSpark2Ext0:setLeftRight( true, false, 85, 197 )
				self.ZmFxSpark2Ext0:setTopBottom( true, false, 8, 176 )
				self.ZmFxSpark2Ext0:setAlpha( 0 )
				self.clipFinished( ZmFxSpark2Ext0, {} )

				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )
			end,
			Digits = function ()
				self:setupElementClipCounter( 16 )

				Panel:completeAnimation()
				self.Panel:setAlpha( 0 )
				self.clipFinished( Panel, {} )
				local RndDigitsFrame2 = function ( RndDigits, event )
					local RndDigitsFrame3 = function ( RndDigits, event )
						if not event.interrupted then
							RndDigits:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
						end
						RndDigits:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( RndDigits, event )
						else
							RndDigits:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						RndDigitsFrame3( RndDigits, event )
						return 
					else
						RndDigits:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
						RndDigits:registerEventHandler( "transition_complete_keyframe", RndDigitsFrame3 )
					end
				end
				
				RndDigits:completeAnimation()
				self.RndDigits:setAlpha( 0 )
				RndDigitsFrame2( RndDigits, {} )
				local Mrk1DefFrame2 = function ( Mrk1Def, event )
					if not event.interrupted then
						Mrk1Def:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					Mrk1Def:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Mrk1Def, event )
					else
						Mrk1Def:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Mrk1Def:completeAnimation()
				self.Mrk1Def:setAlpha( 1 )
				Mrk1DefFrame2( Mrk1Def, {} )
				local Mrk2DefFrame2 = function ( Mrk2Def, event )
					local Mrk2DefFrame3 = function ( Mrk2Def, event )
						if not event.interrupted then
							Mrk2Def:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						end
						Mrk2Def:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Mrk2Def, event )
						else
							Mrk2Def:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Mrk2DefFrame3( Mrk2Def, event )
						return 
					else
						Mrk2Def:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
						Mrk2Def:registerEventHandler( "transition_complete_keyframe", Mrk2DefFrame3 )
					end
				end
				
				Mrk2Def:completeAnimation()
				self.Mrk2Def:setAlpha( 1 )
				Mrk2DefFrame2( Mrk2Def, {} )
				local Mrk3DefFrame2 = function ( Mrk3Def, event )
					local Mrk3DefFrame3 = function ( Mrk3Def, event )
						if not event.interrupted then
							Mrk3Def:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						end
						Mrk3Def:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Mrk3Def, event )
						else
							Mrk3Def:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Mrk3DefFrame3( Mrk3Def, event )
						return 
					else
						Mrk3Def:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
						Mrk3Def:registerEventHandler( "transition_complete_keyframe", Mrk3DefFrame3 )
					end
				end
				
				Mrk3Def:completeAnimation()
				self.Mrk3Def:setAlpha( 1 )
				Mrk3DefFrame2( Mrk3Def, {} )
				local Mrk4DefFrame2 = function ( Mrk4Def, event )
					local Mrk4DefFrame3 = function ( Mrk4Def, event )
						if not event.interrupted then
							Mrk4Def:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						end
						Mrk4Def:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Mrk4Def, event )
						else
							Mrk4Def:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Mrk4DefFrame3( Mrk4Def, event )
						return 
					else
						Mrk4Def:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
						Mrk4Def:registerEventHandler( "transition_complete_keyframe", Mrk4DefFrame3 )
					end
				end
				
				Mrk4Def:completeAnimation()
				self.Mrk4Def:setAlpha( 1 )
				Mrk4DefFrame2( Mrk4Def, {} )
				local Mrk5DefFrame2 = function ( Mrk5Def, event )
					local Mrk5DefFrame3 = function ( Mrk5Def, event )
						if not event.interrupted then
							Mrk5Def:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
						end
						Mrk5Def:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Mrk5Def, event )
						else
							Mrk5Def:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Mrk5DefFrame3( Mrk5Def, event )
						return 
					else
						Mrk5Def:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
						Mrk5Def:registerEventHandler( "transition_complete_keyframe", Mrk5DefFrame3 )
					end
				end
				
				Mrk5Def:completeAnimation()
				self.Mrk5Def:setAlpha( 1 )
				Mrk5DefFrame2( Mrk5Def, {} )

				Mrk1Act:completeAnimation()
				self.Mrk1Act:setAlpha( 0 )
				self.Mrk1Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk1Act:setShaderVector( 0, 1, 0, 0, 0 )
				self.Mrk1Act:setShaderVector( 1, 0, 0, 0, 0 )
				self.Mrk1Act:setShaderVector( 2, 1.25, 0, 0, 0 )
				self.Mrk1Act:setShaderVector( 3, 0.21, 0, 0, 0 )
				self.clipFinished( Mrk1Act, {} )

				Mrk2Act:completeAnimation()
				self.Mrk2Act:setAlpha( 0 )
				self.Mrk2Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk2Act:setShaderVector( 0, 1, 0, 0, 0 )
				self.Mrk2Act:setShaderVector( 1, 0, 0, 0, 0 )
				self.Mrk2Act:setShaderVector( 2, 1.08, 0, 0, 0 )
				self.Mrk2Act:setShaderVector( 3, 0.21, 0, 0, 0 )
				self.clipFinished( Mrk2Act, {} )

				Mrk3Act:completeAnimation()
				self.Mrk3Act:setAlpha( 0 )
				self.Mrk3Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk3Act:setShaderVector( 0, 1, 0, 0, 0 )
				self.Mrk3Act:setShaderVector( 1, 0, 0, 0, 0 )
				self.Mrk3Act:setShaderVector( 2, 1.15, 0, 0, 0 )
				self.Mrk3Act:setShaderVector( 3, 0.26, 0, 0, 0 )
				self.clipFinished( Mrk3Act, {} )

				Mrk4Act:completeAnimation()
				self.Mrk4Act:setAlpha( 0 )
				self.Mrk4Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk4Act:setShaderVector( 0, 1, 0, 0, 0 )
				self.Mrk4Act:setShaderVector( 1, 0, 0, 0, 0 )
				self.Mrk4Act:setShaderVector( 2, 1.12, 0, 0, 0 )
				self.Mrk4Act:setShaderVector( 3, 0.35, 0, 0, 0 )
				self.clipFinished( Mrk4Act, {} )

				Mrk5Act:completeAnimation()
				self.Mrk5Act:setAlpha( 0 )
				self.Mrk5Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk5Act:setShaderVector( 0, 1.15, 0, 0, 0 )
				self.Mrk5Act:setShaderVector( 1, 0.22, 0, 0, 0 )
				self.Mrk5Act:setShaderVector( 2, 1, 0, 0, 0 )
				self.Mrk5Act:setShaderVector( 3, 0, 0, 0, 0 )
				self.clipFinished( Mrk5Act, {} )
				local GlowOrangeOverFrame2 = function ( GlowOrangeOver, event )
					local GlowOrangeOverFrame3 = function ( GlowOrangeOver, event )
						if not event.interrupted then
							GlowOrangeOver:beginAnimation( "keyframe", 1320, false, false, CoD.TweenType.Linear )
						end
						GlowOrangeOver:setLeftRight( true, false, 25, 163 )
						GlowOrangeOver:setTopBottom( true, false, 58.5, 179.5 )
						GlowOrangeOver:setAlpha( 0 )
						GlowOrangeOver:setZRot( 0 )
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
						GlowOrangeOver:beginAnimation( "keyframe", 620, false, false, CoD.TweenType.Bounce )
						GlowOrangeOver:setAlpha( 1 )
						GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame3 )
					end
				end
				
				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setLeftRight( true, false, 25, 163 )
				self.GlowOrangeOver:setTopBottom( true, false, 58.5, 179.5 )
				self.GlowOrangeOver:setAlpha( 0 )
				self.GlowOrangeOver:setZRot( 0 )
				GlowOrangeOverFrame2( GlowOrangeOver, {} )
				local ZmFxFlsh10Frame2 = function ( ZmFxFlsh10, event )
					local ZmFxFlsh10Frame3 = function ( ZmFxFlsh10, event )
						if not event.interrupted then
							ZmFxFlsh10:beginAnimation( "keyframe", 1110, false, false, CoD.TweenType.Linear )
						end
						ZmFxFlsh10:setRGB( 0, 0, 0 )
						ZmFxFlsh10:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( ZmFxFlsh10, event )
						else
							ZmFxFlsh10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ZmFxFlsh10Frame3( ZmFxFlsh10, event )
						return 
					else
						ZmFxFlsh10:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
						ZmFxFlsh10:setRGB( 0.9, 0.73, 0.68 )
						ZmFxFlsh10:registerEventHandler( "transition_complete_keyframe", ZmFxFlsh10Frame3 )
					end
				end
				
				ZmFxFlsh10:completeAnimation()
				self.ZmFxFlsh10:setRGB( 0, 0, 0 )
				self.ZmFxFlsh10:setAlpha( 1 )
				ZmFxFlsh10Frame2( ZmFxFlsh10, {} )
				local ZmFxSpark2Ext0Frame2 = function ( ZmFxSpark2Ext0, event )
					local ZmFxSpark2Ext0Frame3 = function ( ZmFxSpark2Ext0, event )
						local ZmFxSpark2Ext0Frame4 = function ( ZmFxSpark2Ext0, event )
							if not event.interrupted then
								ZmFxSpark2Ext0:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
							end
							ZmFxSpark2Ext0:setLeftRight( true, false, 77, 189 )
							ZmFxSpark2Ext0:setTopBottom( true, false, 9, 177 )
							ZmFxSpark2Ext0:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( ZmFxSpark2Ext0, event )
							else
								ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ZmFxSpark2Ext0Frame4( ZmFxSpark2Ext0, event )
							return 
						else
							ZmFxSpark2Ext0:beginAnimation( "keyframe", 620, false, true, CoD.TweenType.Linear )
							ZmFxSpark2Ext0:setLeftRight( true, false, 77, 189 )
							ZmFxSpark2Ext0:setTopBottom( true, false, 9, 177 )
							ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame4 )
						end
					end
					
					if event.interrupted then
						ZmFxSpark2Ext0Frame3( ZmFxSpark2Ext0, event )
						return 
					else
						ZmFxSpark2Ext0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						ZmFxSpark2Ext0:setLeftRight( true, false, 11.35, 123.35 )
						ZmFxSpark2Ext0:setTopBottom( true, false, 8.09, 176.09 )
						ZmFxSpark2Ext0:setAlpha( 1 )
						ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame3 )
					end
				end
				
				ZmFxSpark2Ext0:completeAnimation()
				self.ZmFxSpark2Ext0:setLeftRight( true, false, 5, 117 )
				self.ZmFxSpark2Ext0:setTopBottom( true, false, 8, 176 )
				self.ZmFxSpark2Ext0:setAlpha( 0 )
				ZmFxSpark2Ext0Frame2( ZmFxSpark2Ext0, {} )
				local ZmFxSpark20Frame2 = function ( ZmFxSpark20, event )
					local ZmFxSpark20Frame3 = function ( ZmFxSpark20, event )
						local ZmFxSpark20Frame4 = function ( ZmFxSpark20, event )
							if not event.interrupted then
								ZmFxSpark20:beginAnimation( "keyframe", 780, false, false, CoD.TweenType.Linear )
							end
							ZmFxSpark20:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( ZmFxSpark20, event )
							else
								ZmFxSpark20:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ZmFxSpark20Frame4( ZmFxSpark20, event )
							return 
						else
							ZmFxSpark20:beginAnimation( "keyframe", 779, false, false, CoD.TweenType.Linear )
							ZmFxSpark20:registerEventHandler( "transition_complete_keyframe", ZmFxSpark20Frame4 )
						end
					end
					
					if event.interrupted then
						ZmFxSpark20Frame3( ZmFxSpark20, event )
						return 
					else
						ZmFxSpark20:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
						ZmFxSpark20:setAlpha( 1 )
						ZmFxSpark20:registerEventHandler( "transition_complete_keyframe", ZmFxSpark20Frame3 )
					end
				end
				
				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				ZmFxSpark20Frame2( ZmFxSpark20, {} )
			end
		},
		Digits = {
			DefaultClip = function ()
				self:setupElementClipCounter( 16 )

				Panel:completeAnimation()
				self.Panel:setAlpha( 0 )
				self.clipFinished( Panel, {} )

				RndDigits:completeAnimation()
				self.RndDigits:setAlpha( 1 )
				self.clipFinished( RndDigits, {} )

				Mrk1Def:completeAnimation()
				self.Mrk1Def:setAlpha( 0 )
				self.clipFinished( Mrk1Def, {} )

				Mrk2Def:completeAnimation()
				self.Mrk2Def:setAlpha( 0 )
				self.clipFinished( Mrk2Def, {} )

				Mrk3Def:completeAnimation()
				self.Mrk3Def:setAlpha( 0 )
				self.clipFinished( Mrk3Def, {} )

				Mrk4Def:completeAnimation()
				self.Mrk4Def:setAlpha( 0 )
				self.clipFinished( Mrk4Def, {} )

				Mrk5Def:completeAnimation()
				self.Mrk5Def:setAlpha( 0 )
				self.clipFinished( Mrk5Def, {} )

				Mrk1Act:completeAnimation()
				self.Mrk1Act:setAlpha( 0 )
				self.Mrk1Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk1Act:setShaderVector( 0, 1, 0, 0, 0 )
				self.Mrk1Act:setShaderVector( 1, 0, 0, 0, 0 )
				self.Mrk1Act:setShaderVector( 2, 1.25, 0, 0, 0 )
				self.Mrk1Act:setShaderVector( 3, 0.21, 0, 0, 0 )
				self.clipFinished( Mrk1Act, {} )

				Mrk2Act:completeAnimation()
				self.Mrk2Act:setAlpha( 0 )
				self.Mrk2Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk2Act:setShaderVector( 0, 1, 0, 0, 0 )
				self.Mrk2Act:setShaderVector( 1, 0, 0, 0, 0 )
				self.Mrk2Act:setShaderVector( 2, 1.08, 0, 0, 0 )
				self.Mrk2Act:setShaderVector( 3, 0.21, 0, 0, 0 )
				self.clipFinished( Mrk2Act, {} )

				Mrk3Act:completeAnimation()
				self.Mrk3Act:setAlpha( 0 )
				self.Mrk3Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk3Act:setShaderVector( 0, 1, 0, 0, 0 )
				self.Mrk3Act:setShaderVector( 1, 0, 0, 0, 0 )
				self.Mrk3Act:setShaderVector( 2, 1.15, 0, 0, 0 )
				self.Mrk3Act:setShaderVector( 3, 0.26, 0, 0, 0 )
				self.clipFinished( Mrk3Act, {} )

				Mrk4Act:completeAnimation()
				self.Mrk4Act:setAlpha( 0 )
				self.Mrk4Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk4Act:setShaderVector( 0, 1, 0, 0, 0 )
				self.Mrk4Act:setShaderVector( 1, 0, 0, 0, 0 )
				self.Mrk4Act:setShaderVector( 2, 1.12, 0, 0, 0 )
				self.Mrk4Act:setShaderVector( 3, 0.35, 0, 0, 0 )
				self.clipFinished( Mrk4Act, {} )

				Mrk5Act:completeAnimation()
				self.Mrk5Act:setAlpha( 0 )
				self.Mrk5Act:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Mrk5Act:setShaderVector( 0, 1.15, 0, 0, 0 )
				self.Mrk5Act:setShaderVector( 1, 0.22, 0, 0, 0 )
				self.Mrk5Act:setShaderVector( 2, 1, 0, 0, 0 )
				self.Mrk5Act:setShaderVector( 3, 0, 0, 0, 0 )
				self.clipFinished( Mrk5Act, {} )

				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setLeftRight( true, false, 25, 163 )
				self.GlowOrangeOver:setTopBottom( true, false, 58.5, 179.5 )
				self.GlowOrangeOver:setAlpha( 0 )
				self.GlowOrangeOver:setZRot( 0 )
				self.clipFinished( GlowOrangeOver, {} )

				ZmFxFlsh10:completeAnimation()
				self.ZmFxFlsh10:setRGB( 0, 0, 0 )
				self.ZmFxFlsh10:setAlpha( 0 )
				self.clipFinished( ZmFxFlsh10, {} )

				ZmFxSpark2Ext0:completeAnimation()
				self.ZmFxSpark2Ext0:setLeftRight( true, false, 77, 189 )
				self.ZmFxSpark2Ext0:setTopBottom( true, false, 9, 177 )
				self.ZmFxSpark2Ext0:setAlpha( 0 )
				self.clipFinished( ZmFxSpark2Ext0, {} )

				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Rnd1",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "roundsPlayed", Engine.GetGametypeSetting( "startRound" ) + 1 )
			end
		},
		{
			stateName = "Rnd2",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "roundsPlayed", Engine.GetGametypeSetting( "startRound" ) + 2 )
			end
		},
		{
			stateName = "Rnd3",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "roundsPlayed", Engine.GetGametypeSetting( "startRound" ) + 3 )
			end
		},
		{
			stateName = "Rnd4",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "roundsPlayed", Engine.GetGametypeSetting( "startRound" ) + 4 )
			end
		},
		{
			stateName = "Rnd5",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "roundsPlayed", Engine.GetGametypeSetting( "startRound" ) + 5 )
			end
		},
		{
			stateName = "Digits",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThanOrEqualTo( element, controller, "roundsPlayed", Engine.GetGametypeSetting( "startRound" ) + 6 )
			end
		}
	} )
	self:linkToElementModel( self, "roundsPlayed", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "roundsPlayed"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Panel:close()
		element.RndDigits:close()
		element.ZmFxFlsh10:close()
		element.ZmFxSpark2Ext0:close()
		element.ZmFxSpark20:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
