-- 3f09d8a214e0ba29eab0c53e851c9a3b
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CallingCards.CallingCards_SciFi_ufolights" )
require( "ui.uieditor.widgets.CallingCards.CallingCards_SciFi_Steam" )
require( "ui.uieditor.widgets.CallingCards.CallingCards_SciFi_LenseFlare" )
require( "ui.uieditor.widgets.CallingCards.CallingCards_SciFi_Headlights" )
require( "ui.uieditor.widgets.CallingCards.CallingCards_Scifi_Fog" )

CoD.CallingCards_SciFiWidget = InheritFrom( LUI.UIElement )
CoD.CallingCards_SciFiWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_SciFiWidget )
	self.id = "CallingCards_SciFiWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	self.anyChildUsesUpdateState = true
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( true, false, 0, 480 )
	BG:setTopBottom( true, false, 0, 120 )
	BG:setImage( RegisterImage( "uie_t7_callingcard_mp_scifi_lrg" ) )
	self:addElement( BG )
	self.BG = BG
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, false, 288.43, 418.57 )
	Glow:setTopBottom( true, false, -102.85, 222.85 )
	Glow:setRGB( 0.83, 0.97, 1 )
	Glow:setZRot( 90 )
	Glow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local CallingCardsSciFiufolights = CoD.CallingCards_SciFi_ufolights.new( menu, controller )
	CallingCardsSciFiufolights:setLeftRight( true, false, 123, 553.81 )
	CallingCardsSciFiufolights:setTopBottom( true, false, -12.42, 82 )
	self:addElement( CallingCardsSciFiufolights )
	self.CallingCardsSciFiufolights = CallingCardsSciFiufolights
	
	local CallingCardsSciFiSteam = CoD.CallingCards_SciFi_Steam.new( menu, controller )
	CallingCardsSciFiSteam:setLeftRight( true, false, 176, 529.81 )
	CallingCardsSciFiSteam:setTopBottom( true, false, -6.88, 126.88 )
	self:addElement( CallingCardsSciFiSteam )
	self.CallingCardsSciFiSteam = CallingCardsSciFiSteam
	
	local CallingCardsSciFiLenseFlare = CoD.CallingCards_SciFi_LenseFlare.new( menu, controller )
	CallingCardsSciFiLenseFlare:setLeftRight( true, false, -118.19, 601.81 )
	CallingCardsSciFiLenseFlare:setTopBottom( true, false, -21.21, 98.79 )
	self:addElement( CallingCardsSciFiLenseFlare )
	self.CallingCardsSciFiLenseFlare = CallingCardsSciFiLenseFlare
	
	local Aliens = LUI.UIImage.new()
	Aliens:setLeftRight( true, false, 288.43, 419.37 )
	Aliens:setTopBottom( true, false, 18.24, 118 )
	Aliens:setImage( RegisterImage( "uie_t7_callingcard_mp_scifi_aliens" ) )
	self:addElement( Aliens )
	self.Aliens = Aliens
	
	local CallingCardsSciFiHeadlights = CoD.CallingCards_SciFi_Headlights.new( menu, controller )
	CallingCardsSciFiHeadlights:setLeftRight( true, false, 29, 338.41 )
	CallingCardsSciFiHeadlights:setTopBottom( true, false, 69.12, 131 )
	self:addElement( CallingCardsSciFiHeadlights )
	self.CallingCardsSciFiHeadlights = CallingCardsSciFiHeadlights
	
	local Man = LUI.UIImage.new()
	Man:setLeftRight( true, false, 95.24, 197 )
	Man:setTopBottom( true, false, 18.24, 120 )
	Man:setImage( RegisterImage( "uie_t7_callingcard_mp_scifi_man" ) )
	self:addElement( Man )
	self.Man = Man
	
	local CallingCardsScifiFog = CoD.CallingCards_Scifi_Fog.new( menu, controller )
	CallingCardsScifiFog:setLeftRight( true, false, -171.04, 538.44 )
	CallingCardsScifiFog:setTopBottom( true, false, -52.5, 146.5 )
	self:addElement( CallingCardsScifiFog )
	self.CallingCardsScifiFog = CallingCardsScifiFog
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						local GlowFrame4 = function ( Glow, event )
							local GlowFrame5 = function ( Glow, event )
								if not event.interrupted then
									Glow:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
								end
								Glow:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( Glow, event )
								else
									Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								GlowFrame5( Glow, event )
								return 
							else
								Glow:beginAnimation( "keyframe", 1290, false, false, CoD.TweenType.Linear )
								Glow:setAlpha( 0.46 )
								Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame5 )
							end
						end
						
						if event.interrupted then
							GlowFrame4( Glow, event )
							return 
						else
							Glow:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
							Glow:setAlpha( 1 )
							Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame4 )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						Glow:setAlpha( 0.55 )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setAlpha( 1 )
				GlowFrame2( Glow, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CallingCardsSciFiufolights:close()
		element.CallingCardsSciFiSteam:close()
		element.CallingCardsSciFiLenseFlare:close()
		element.CallingCardsSciFiHeadlights:close()
		element.CallingCardsScifiFog:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

