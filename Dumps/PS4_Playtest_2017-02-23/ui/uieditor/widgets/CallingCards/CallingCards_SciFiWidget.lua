require( "ui.uieditor.widgets.CallingCards.CallingCards_Scifi_Fog" )
require( "ui.uieditor.widgets.CallingCards.CallingCards_SciFi_Headlights" )
require( "ui.uieditor.widgets.CallingCards.CallingCards_SciFi_LenseFlare" )
require( "ui.uieditor.widgets.CallingCards.CallingCards_SciFi_Steam" )
require( "ui.uieditor.widgets.CallingCards.CallingCards_SciFi_ufolights" )

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
	self:setLeftRight( 0, 0, 0, 720 )
	self:setTopBottom( 0, 0, 0, 180 )
	self.anyChildUsesUpdateState = true
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( 0, 0, 0, 720 )
	BG:setTopBottom( 0, 0, 0, 180 )
	BG:setImage( RegisterImage( "uie_t7_callingcard_mp_scifi_lrg" ) )
	self:addElement( BG )
	self.BG = BG
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( 0, 0, 433, 628 )
	Glow:setTopBottom( 0, 0, -154, 335 )
	Glow:setRGB( 0.83, 0.97, 1 )
	Glow:setZRot( 90 )
	Glow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local CallingCardsSciFiufolights = CoD.CallingCards_SciFi_ufolights.new( menu, controller )
	CallingCardsSciFiufolights:setLeftRight( 0, 0, 185, 831 )
	CallingCardsSciFiufolights:setTopBottom( 0, 0, -19, 123 )
	self:addElement( CallingCardsSciFiufolights )
	self.CallingCardsSciFiufolights = CallingCardsSciFiufolights
	
	local CallingCardsSciFiSteam = CoD.CallingCards_SciFi_Steam.new( menu, controller )
	CallingCardsSciFiSteam:setLeftRight( 0, 0, 264, 795 )
	CallingCardsSciFiSteam:setTopBottom( 0, 0, -10, 191 )
	self:addElement( CallingCardsSciFiSteam )
	self.CallingCardsSciFiSteam = CallingCardsSciFiSteam
	
	local CallingCardsSciFiLenseFlare = CoD.CallingCards_SciFi_LenseFlare.new( menu, controller )
	CallingCardsSciFiLenseFlare:setLeftRight( 0, 0, -177, 903 )
	CallingCardsSciFiLenseFlare:setTopBottom( 0, 0, -32, 148 )
	self:addElement( CallingCardsSciFiLenseFlare )
	self.CallingCardsSciFiLenseFlare = CallingCardsSciFiLenseFlare
	
	local Aliens = LUI.UIImage.new()
	Aliens:setLeftRight( 0, 0, 433, 629 )
	Aliens:setTopBottom( 0, 0, 27, 177 )
	Aliens:setImage( RegisterImage( "uie_t7_callingcard_mp_scifi_aliens" ) )
	self:addElement( Aliens )
	self.Aliens = Aliens
	
	local CallingCardsSciFiHeadlights = CoD.CallingCards_SciFi_Headlights.new( menu, controller )
	CallingCardsSciFiHeadlights:setLeftRight( 0, 0, 44, 508 )
	CallingCardsSciFiHeadlights:setTopBottom( 0, 0, 104, 197 )
	self:addElement( CallingCardsSciFiHeadlights )
	self.CallingCardsSciFiHeadlights = CallingCardsSciFiHeadlights
	
	local Man = LUI.UIImage.new()
	Man:setLeftRight( 0, 0, 143, 296 )
	Man:setTopBottom( 0, 0, 27, 180 )
	Man:setImage( RegisterImage( "uie_t7_callingcard_mp_scifi_man" ) )
	self:addElement( Man )
	self.Man = Man
	
	local CallingCardsScifiFog = CoD.CallingCards_Scifi_Fog.new( menu, controller )
	CallingCardsScifiFog:setLeftRight( 0, 0, -256, 808 )
	CallingCardsScifiFog:setTopBottom( 0, 0, -79, 219 )
	self:addElement( CallingCardsScifiFog )
	self.CallingCardsScifiFog = CallingCardsScifiFog
	
	self.resetProperties = function ()
		Glow:completeAnimation()
		Glow:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.CallingCardsSciFiufolights:close()
		self.CallingCardsSciFiSteam:close()
		self.CallingCardsSciFiLenseFlare:close()
		self.CallingCardsSciFiHeadlights:close()
		self.CallingCardsScifiFog:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

