-- 11fb63be894f6f2fdb24f164fee2b14b
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CPSystems.TacticalMode.TacticalModeStatusIndicatorWidget" )
require( "ui.uieditor.widgets.CPSystems.TacticalMode.TacticalModeEnemyInfoWidget" )
require( "ui.uieditor.widgets.CPSystems.TacticalMode.TacticalModeDistanceWidget" )
require( "ui.uieditor.widgets.CPSystems.TacticalMode.TacticalModeGlow" )

CoD.TacticalModeWidget_Internal = InheritFrom( LUI.UIElement )
CoD.TacticalModeWidget_Internal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.TacticalModeWidget_Internal )
	self.id = "TacticalModeWidget_Internal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 118 )
	self:setTopBottom( true, false, 0, 114 )
	self.anyChildUsesUpdateState = true
	
	local GlowBack = LUI.UIImage.new()
	GlowBack:setLeftRight( true, true, -51.5, 51.5 )
	GlowBack:setTopBottom( true, true, -6.5, 20.5 )
	GlowBack:setRGB( 0, 0, 0 )
	GlowBack:setAlpha( 0.2 )
	GlowBack:setImage( RegisterImage( "uie_t7_cp_hud_commswidget_glow" ) )
	self:addElement( GlowBack )
	self.GlowBack = GlowBack
	
	local indicator = CoD.TacticalModeStatusIndicatorWidget.new( menu, controller )
	indicator:setLeftRight( false, false, -34, 34 )
	indicator:setTopBottom( false, true, -114, -82 )
	indicator:linkToElementModel( self, nil, false, function ( model )
		indicator:setModel( model, controller )
	end )
	self:addElement( indicator )
	self.indicator = indicator
	
	local enemyInfo = CoD.TacticalModeEnemyInfoWidget.new( menu, controller )
	enemyInfo:setLeftRight( false, false, -59, 59 )
	enemyInfo:setTopBottom( false, true, -18, 0 )
	enemyInfo:setRGB( 0.76, 0.79, 0.87 )
	enemyInfo:linkToElementModel( self, nil, false, function ( model )
		enemyInfo:setModel( model, controller )
	end )
	self:addElement( enemyInfo )
	self.enemyInfo = enemyInfo
	
	local archetypeImage = LUI.UIImage.new()
	archetypeImage:setLeftRight( false, false, -59, 3 )
	archetypeImage:setTopBottom( false, true, -82, -18 )
	archetypeImage:setRGB( 0.76, 0.79, 0.87 )
	archetypeImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	archetypeImage:linkToElementModel( self, "archetypeImage", true, function ( model )
		local _archetypeImage = Engine.GetModelValue( model )
		if _archetypeImage then
			archetypeImage:setImage( RegisterImage( _archetypeImage ) )
		end
	end )
	self:addElement( archetypeImage )
	self.archetypeImage = archetypeImage
	
	local distance = CoD.TacticalModeDistanceWidget.new( menu, controller )
	distance:setLeftRight( false, false, 3, 59 )
	distance:setTopBottom( false, true, -66, -34 )
	distance:linkToElementModel( self, nil, false, function ( model )
		distance:setModel( model, controller )
	end )
	self:addElement( distance )
	self.distance = distance
	
	local Glow = CoD.TacticalModeGlow.new( menu, controller )
	Glow:setLeftRight( true, false, -16.79, 111.21 )
	Glow:setTopBottom( true, false, -11, 117 )
	Glow:setAlpha( 0.7 )
	Glow:mergeStateConditions( {
		{
			stateName = "Null",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:addElement( Glow )
	self.Glow = Glow
	
	local Dots = LUI.UIImage.new()
	Dots:setLeftRight( true, false, 166.5, 230.5 )
	Dots:setTopBottom( true, false, -80.5, -16.5 )
	Dots:setAlpha( 0 )
	Dots:setImage( RegisterImage( "uie_t7_cp_hud_tacmode_framedots" ) )
	Dots:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Dots )
	self.Dots = Dots
	
	local Frame = LUI.UIImage.new()
	Frame:setLeftRight( true, false, 154.5, 238.5 )
	Frame:setTopBottom( true, false, 41, 105 )
	Frame:setAlpha( 0 )
	Frame:setImage( RegisterImage( "uie_t7_cp_hud_tacmode_frame" ) )
	Frame:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Frame )
	self.Frame = Frame
	
	local Line = LUI.UIImage.new()
	Line:setLeftRight( true, false, 166.5, 226.5 )
	Line:setTopBottom( true, false, 8, 24 )
	Line:setAlpha( 0 )
	Line:setImage( RegisterImage( "uie_t7_cp_hud_tacmode_line" ) )
	Line:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Line )
	self.Line = Line
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				GlowBack:completeAnimation()
				self.GlowBack:setAlpha( 0 )
				self.clipFinished( GlowBack, {} )
				indicator:completeAnimation()
				self.indicator:setAlpha( 0 )
				self.clipFinished( indicator, {} )
				enemyInfo:completeAnimation()
				self.enemyInfo:setAlpha( 0 )
				self.clipFinished( enemyInfo, {} )
				archetypeImage:completeAnimation()
				self.archetypeImage:setAlpha( 0 )
				self.clipFinished( archetypeImage, {} )
				distance:completeAnimation()
				self.distance:setAlpha( 0 )
				self.clipFinished( distance, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
				Dots:completeAnimation()
				self.Dots:setAlpha( 0 )
				self.clipFinished( Dots, {} )
				Frame:completeAnimation()
				self.Frame:setAlpha( 0 )
				self.clipFinished( Frame, {} )
				Line:completeAnimation()
				self.Line:setAlpha( 0 )
				self.clipFinished( Line, {} )
			end
		},
		All = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				GlowBack:completeAnimation()
				self.GlowBack:setAlpha( 0.2 )
				self.clipFinished( GlowBack, {} )
				indicator:completeAnimation()
				self.indicator:setLeftRight( false, false, -34, 34 )
				self.indicator:setTopBottom( false, true, -114, -82 )
				self.indicator:setAlpha( 1 )
				self.clipFinished( indicator, {} )
				enemyInfo:completeAnimation()
				self.enemyInfo:setLeftRight( false, false, -59, 59 )
				self.enemyInfo:setTopBottom( false, true, -18, 0 )
				self.enemyInfo:setAlpha( 1 )
				self.clipFinished( enemyInfo, {} )
				archetypeImage:completeAnimation()
				self.archetypeImage:setLeftRight( false, false, -59, 3 )
				self.archetypeImage:setTopBottom( false, true, -82, -18 )
				self.archetypeImage:setAlpha( 1 )
				self.clipFinished( archetypeImage, {} )
				distance:completeAnimation()
				self.distance:setLeftRight( false, false, 3, 59 )
				self.distance:setTopBottom( false, true, -82, -18 )
				self.distance:setAlpha( 1 )
				self.clipFinished( distance, {} )
				Glow:completeAnimation()
				self.Glow:setLeftRight( true, false, -45, 164 )
				self.Glow:setTopBottom( true, false, 2.5, 130.5 )
				self.Glow:setAlpha( 1 )
				self.clipFinished( Glow, {} )
			end
		},
		Damage_Archetype_Distance = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				GlowBack:completeAnimation()
				self.GlowBack:setLeftRight( true, true, -51.5, 51.5 )
				self.GlowBack:setTopBottom( true, true, 0, 20.5 )
				self.GlowBack:setAlpha( 0.2 )
				self.clipFinished( GlowBack, {} )
				indicator:completeAnimation()
				self.indicator:setAlpha( 0 )
				self.clipFinished( indicator, {} )
				enemyInfo:completeAnimation()
				self.enemyInfo:setLeftRight( false, false, -59, 59 )
				self.enemyInfo:setTopBottom( false, true, -18, 0 )
				self.enemyInfo:setAlpha( 1 )
				self.clipFinished( enemyInfo, {} )
				archetypeImage:completeAnimation()
				self.archetypeImage:setLeftRight( false, false, -59, 3 )
				self.archetypeImage:setTopBottom( false, true, -82, -18 )
				self.archetypeImage:setAlpha( 1 )
				self.clipFinished( archetypeImage, {} )
				distance:completeAnimation()
				self.distance:setLeftRight( false, false, 3, 59 )
				self.distance:setTopBottom( false, true, -82, -18 )
				self.distance:setAlpha( 1 )
				self.clipFinished( distance, {} )
				Glow:completeAnimation()
				self.Glow:setLeftRight( true, false, -27.79, 163.21 )
				self.Glow:setTopBottom( true, false, 0, 128 )
				self.clipFinished( Glow, {} )
			end
		},
		Damage_Archetype_Status = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				GlowBack:completeAnimation()
				self.GlowBack:setLeftRight( true, true, -51.5, 51.5 )
				self.GlowBack:setTopBottom( true, true, 0, 20.5 )
				self.GlowBack:setAlpha( 0.2 )
				self.clipFinished( GlowBack, {} )
				indicator:completeAnimation()
				self.indicator:setLeftRight( false, false, 3, 71 )
				self.indicator:setTopBottom( false, true, -66, -34 )
				self.indicator:setAlpha( 1 )
				self.clipFinished( indicator, {} )
				enemyInfo:completeAnimation()
				self.enemyInfo:setLeftRight( false, false, -59, 59 )
				self.enemyInfo:setTopBottom( false, true, -18, 0 )
				self.enemyInfo:setAlpha( 1 )
				self.clipFinished( enemyInfo, {} )
				archetypeImage:completeAnimation()
				self.archetypeImage:setLeftRight( false, false, -59, 3 )
				self.archetypeImage:setTopBottom( false, true, -82, -18 )
				self.archetypeImage:setAlpha( 1 )
				self.clipFinished( archetypeImage, {} )
				distance:completeAnimation()
				self.distance:setAlpha( 0 )
				self.clipFinished( distance, {} )
				Glow:completeAnimation()
				self.Glow:setLeftRight( true, false, -30.79, 164.21 )
				self.Glow:setTopBottom( true, false, 0, 128 )
				self.Glow:setAlpha( 1 )
				self.clipFinished( Glow, {} )
			end
		},
		Damage_Distance_Status = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				GlowBack:completeAnimation()
				self.GlowBack:setLeftRight( true, true, -48.5, 54.5 )
				self.GlowBack:setTopBottom( true, true, 28.25, 11.75 )
				self.GlowBack:setAlpha( 0.2 )
				self.clipFinished( GlowBack, {} )
				indicator:completeAnimation()
				self.indicator:setLeftRight( false, false, -68, 0 )
				self.indicator:setTopBottom( false, true, -53, -21 )
				self.indicator:setAlpha( 1 )
				self.clipFinished( indicator, {} )
				enemyInfo:completeAnimation()
				self.enemyInfo:setLeftRight( false, false, -59, 59 )
				self.enemyInfo:setTopBottom( false, true, -18, 0 )
				self.enemyInfo:setAlpha( 1 )
				self.clipFinished( enemyInfo, {} )
				archetypeImage:completeAnimation()
				self.archetypeImage:setAlpha( 0 )
				self.clipFinished( archetypeImage, {} )
				distance:completeAnimation()
				self.distance:setLeftRight( false, false, 3, 59 )
				self.distance:setTopBottom( false, true, -53, -21 )
				self.distance:setAlpha( 1 )
				self.clipFinished( distance, {} )
				Glow:completeAnimation()
				self.Glow:setLeftRight( true, false, -31.5, 155.5 )
				self.Glow:setTopBottom( true, false, 38, 122 )
				self.Glow:setAlpha( 1 )
				self.clipFinished( Glow, {} )
			end
		},
		Archetype_Distance_Status = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				GlowBack:completeAnimation()
				self.GlowBack:setLeftRight( true, true, -61.5, 41.5 )
				self.GlowBack:setTopBottom( true, true, -9, 50.5 )
				self.GlowBack:setAlpha( 0.1 )
				self.clipFinished( GlowBack, {} )
				indicator:completeAnimation()
				self.indicator:setLeftRight( false, false, 5, 57 )
				self.indicator:setTopBottom( false, true, -61.72, -37.25 )
				self.indicator:setAlpha( 1 )
				self.indicator:setScale( 0.9 )
				self.clipFinished( indicator, {} )
				enemyInfo:completeAnimation()
				self.enemyInfo:setAlpha( 0 )
				self.clipFinished( enemyInfo, {} )
				archetypeImage:completeAnimation()
				self.archetypeImage:setLeftRight( false, false, -68, -6 )
				self.archetypeImage:setTopBottom( false, true, -64, 0 )
				self.archetypeImage:setAlpha( 1 )
				self.archetypeImage:setScale( 0.7 )
				self.clipFinished( archetypeImage, {} )
				distance:completeAnimation()
				self.distance:setLeftRight( false, false, 1, 57 )
				self.distance:setTopBottom( false, true, -53, 11 )
				self.distance:setAlpha( 1 )
				self.distance:setScale( 0.8 )
				self.clipFinished( distance, {} )
				Glow:completeAnimation()
				self.Glow:setLeftRight( true, false, -24.5, 84.5 )
				self.Glow:setTopBottom( true, false, 31.56, 139.75 )
				self.Glow:setAlpha( 1 )
				self.clipFinished( Glow, {} )
				Dots:completeAnimation()
				self.Dots:setAlpha( 0 )
				self.clipFinished( Dots, {} )
				Frame:completeAnimation()
				self.Frame:setLeftRight( true, false, 34, 118 )
				self.Frame:setTopBottom( true, false, 51, 115 )
				self.Frame:setAlpha( 1 )
				self.Frame:setScale( 1.1 )
				self.clipFinished( Frame, {} )
				Line:completeAnimation()
				self.Line:setAlpha( 0 )
				self.clipFinished( Line, {} )
			end
		},
		Damage_Archetype = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				GlowBack:completeAnimation()
				self.GlowBack:setLeftRight( true, true, -44.5, 58.5 )
				self.GlowBack:setTopBottom( true, true, -24, 35.5 )
				self.GlowBack:setAlpha( 0.2 )
				self.clipFinished( GlowBack, {} )
				indicator:completeAnimation()
				self.indicator:setAlpha( 0 )
				self.clipFinished( indicator, {} )
				enemyInfo:completeAnimation()
				self.enemyInfo:setLeftRight( false, false, -59, 59 )
				self.enemyInfo:setTopBottom( false, true, -18, 0 )
				self.enemyInfo:setAlpha( 1 )
				self.clipFinished( enemyInfo, {} )
				archetypeImage:completeAnimation()
				self.archetypeImage:setLeftRight( false, false, -31, 31 )
				self.archetypeImage:setTopBottom( false, true, -82, -18 )
				self.archetypeImage:setAlpha( 1 )
				self.clipFinished( archetypeImage, {} )
				distance:completeAnimation()
				self.distance:setAlpha( 0 )
				self.clipFinished( distance, {} )
				Glow:completeAnimation()
				self.Glow:setLeftRight( true, false, -5, 123 )
				self.Glow:setTopBottom( true, false, 0, 128 )
				self.Glow:setAlpha( 1 )
				self.clipFinished( Glow, {} )
			end
		},
		Damage_Distance = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				GlowBack:completeAnimation()
				self.GlowBack:setLeftRight( true, true, -43.5, 43.5 )
				self.GlowBack:setTopBottom( true, true, 24.75, 15.25 )
				self.GlowBack:setAlpha( 0.2 )
				self.clipFinished( GlowBack, {} )
				indicator:completeAnimation()
				self.indicator:setAlpha( 0 )
				self.clipFinished( indicator, {} )
				enemyInfo:completeAnimation()
				self.enemyInfo:setLeftRight( false, false, -59, 59 )
				self.enemyInfo:setTopBottom( false, true, -18, 0 )
				self.enemyInfo:setAlpha( 1 )
				self.clipFinished( enemyInfo, {} )
				archetypeImage:completeAnimation()
				self.archetypeImage:setAlpha( 0 )
				self.clipFinished( archetypeImage, {} )
				distance:completeAnimation()
				self.distance:setLeftRight( false, false, -25, 31 )
				self.distance:setTopBottom( false, true, -57, -18 )
				self.distance:setAlpha( 1 )
				self.clipFinished( distance, {} )
				Glow:completeAnimation()
				self.Glow:setLeftRight( true, false, 0, 128 )
				self.Glow:setTopBottom( true, false, 13, 141 )
				self.Glow:setAlpha( 0.6 )
				self.clipFinished( Glow, {} )
			end
		},
		Damage_Status = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				GlowBack:completeAnimation()
				self.GlowBack:setLeftRight( true, true, -43.5, 43.5 )
				self.GlowBack:setTopBottom( true, true, 24.75, 15.25 )
				self.GlowBack:setAlpha( 0.1 )
				self.clipFinished( GlowBack, {} )
				indicator:completeAnimation()
				self.indicator:setLeftRight( false, false, -34, 34 )
				self.indicator:setTopBottom( false, true, -53, -21 )
				self.indicator:setAlpha( 1 )
				self.clipFinished( indicator, {} )
				enemyInfo:completeAnimation()
				self.enemyInfo:setLeftRight( false, false, -59, 59 )
				self.enemyInfo:setTopBottom( false, true, -18, 0 )
				self.enemyInfo:setAlpha( 1 )
				self.clipFinished( enemyInfo, {} )
				archetypeImage:completeAnimation()
				self.archetypeImage:setAlpha( 0 )
				self.clipFinished( archetypeImage, {} )
				distance:completeAnimation()
				self.distance:setAlpha( 0 )
				self.clipFinished( distance, {} )
				Glow:completeAnimation()
				self.Glow:setLeftRight( true, false, -2, 126 )
				self.Glow:setTopBottom( true, false, 13, 141 )
				self.Glow:setAlpha( 1 )
				self.clipFinished( Glow, {} )
			end
		},
		Archetype_Distance = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				GlowBack:completeAnimation()
				self.GlowBack:setLeftRight( true, true, -51, 51 )
				self.GlowBack:setTopBottom( true, true, -5.5, 19 )
				self.GlowBack:setAlpha( 0.1 )
				self.clipFinished( GlowBack, {} )
				indicator:completeAnimation()
				self.indicator:setAlpha( 0 )
				self.clipFinished( indicator, {} )
				enemyInfo:completeAnimation()
				self.enemyInfo:setAlpha( 0 )
				self.clipFinished( enemyInfo, {} )
				archetypeImage:completeAnimation()
				self.archetypeImage:setLeftRight( false, false, -31, 31 )
				self.archetypeImage:setTopBottom( false, true, -103.5, -39.5 )
				self.archetypeImage:setAlpha( 1 )
				self.archetypeImage:setScale( 0.7 )
				self.clipFinished( archetypeImage, {} )
				distance:completeAnimation()
				self.distance:setLeftRight( false, false, -27, 29 )
				self.distance:setTopBottom( false, true, -60, 4 )
				self.distance:setAlpha( 1 )
				self.distance:setScale( 0.8 )
				self.clipFinished( distance, {} )
				Glow:completeAnimation()
				self.Glow:setLeftRight( true, false, -7.25, 125.25 )
				self.Glow:setTopBottom( true, false, 3.77, 89 )
				self.Glow:setAlpha( 1 )
				self.clipFinished( Glow, {} )
				Dots:completeAnimation()
				self.Dots:setLeftRight( true, false, 164.5, 228.5 )
				self.Dots:setTopBottom( true, false, -80.5, -16.5 )
				self.Dots:setAlpha( 0 )
				self.clipFinished( Dots, {} )
				Frame:completeAnimation()
				self.Frame:setAlpha( 0 )
				self.clipFinished( Frame, {} )
				Line:completeAnimation()
				self.Line:setLeftRight( true, false, 30, 90 )
				self.Line:setTopBottom( true, false, 63.75, 79.75 )
				self.Line:setAlpha( 1 )
				self.Line:setScale( 1.1 )
				self.clipFinished( Line, {} )
			end
		},
		Archetype_Status = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				GlowBack:completeAnimation()
				self.GlowBack:setLeftRight( true, true, -53.5, 48.5 )
				self.GlowBack:setTopBottom( true, true, -12.25, 12.25 )
				self.GlowBack:setAlpha( 0.1 )
				self.clipFinished( GlowBack, {} )
				indicator:completeAnimation()
				self.indicator:setLeftRight( false, false, -33, 35 )
				self.indicator:setTopBottom( false, true, -39.25, -7.25 )
				self.indicator:setAlpha( 1 )
				self.indicator:setScale( 1 )
				self.clipFinished( indicator, {} )
				enemyInfo:completeAnimation()
				self.enemyInfo:setAlpha( 0 )
				self.clipFinished( enemyInfo, {} )
				archetypeImage:completeAnimation()
				self.archetypeImage:setLeftRight( false, false, -31, 31 )
				self.archetypeImage:setTopBottom( false, true, -103.5, -39.5 )
				self.archetypeImage:setAlpha( 1 )
				self.archetypeImage:setScale( 0.7 )
				self.clipFinished( archetypeImage, {} )
				distance:completeAnimation()
				self.distance:setAlpha( 0 )
				self.clipFinished( distance, {} )
				Glow:completeAnimation()
				self.Glow:setLeftRight( true, false, -40, 180 )
				self.Glow:setTopBottom( true, false, 34, 130 )
				self.Glow:setAlpha( 1 )
				self.clipFinished( Glow, {} )
				Dots:completeAnimation()
				self.Dots:setAlpha( 0 )
				self.clipFinished( Dots, {} )
				Frame:completeAnimation()
				self.Frame:setAlpha( 0 )
				self.clipFinished( Frame, {} )
				Line:completeAnimation()
				self.Line:setLeftRight( true, false, 30, 90 )
				self.Line:setTopBottom( true, false, 63.75, 79.75 )
				self.Line:setAlpha( 1 )
				self.Line:setScale( 1.1 )
				self.clipFinished( Line, {} )
			end
		},
		Distance_Status = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				GlowBack:completeAnimation()
				self.GlowBack:setLeftRight( true, true, -44, 58 )
				self.GlowBack:setTopBottom( true, true, 18, 0 )
				self.GlowBack:setAlpha( 0.1 )
				self.clipFinished( GlowBack, {} )
				indicator:completeAnimation()
				self.indicator:setLeftRight( false, false, -34, 34 )
				self.indicator:setTopBottom( false, true, -76.25, -44.25 )
				self.indicator:setAlpha( 1 )
				self.indicator:setScale( 0.9 )
				self.clipFinished( indicator, {} )
				enemyInfo:completeAnimation()
				self.enemyInfo:setAlpha( 0 )
				self.clipFinished( enemyInfo, {} )
				archetypeImage:completeAnimation()
				self.archetypeImage:setAlpha( 0 )
				self.clipFinished( archetypeImage, {} )
				distance:completeAnimation()
				self.distance:setLeftRight( false, false, -27, 29 )
				self.distance:setTopBottom( false, true, -48, -16 )
				self.distance:setAlpha( 1 )
				self.distance:setScale( 0.8 )
				self.clipFinished( distance, {} )
				Glow:completeAnimation()
				self.Glow:setLeftRight( true, false, -28.5, 146.5 )
				self.Glow:setTopBottom( true, false, 55, 137 )
				self.Glow:setAlpha( 1 )
				self.clipFinished( Glow, {} )
				Dots:completeAnimation()
				self.Dots:setAlpha( 0 )
				self.clipFinished( Dots, {} )
				Frame:completeAnimation()
				self.Frame:setAlpha( 0 )
				self.clipFinished( Frame, {} )
				Line:completeAnimation()
				self.Line:setLeftRight( true, false, 30, 90 )
				self.Line:setTopBottom( true, false, 63.75, 79.75 )
				self.Line:setAlpha( 1 )
				self.Line:setScale( 1.1 )
				self.clipFinished( Line, {} )
			end
		},
		DamageOnly = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				GlowBack:completeAnimation()
				self.GlowBack:setAlpha( 0 )
				self.clipFinished( GlowBack, {} )
				indicator:completeAnimation()
				self.indicator:setAlpha( 0 )
				self.clipFinished( indicator, {} )
				enemyInfo:completeAnimation()
				self.enemyInfo:setLeftRight( false, false, -59, 59 )
				self.enemyInfo:setTopBottom( false, true, -18, 0 )
				self.enemyInfo:setAlpha( 1 )
				self.clipFinished( enemyInfo, {} )
				archetypeImage:completeAnimation()
				self.archetypeImage:setAlpha( 0 )
				self.clipFinished( archetypeImage, {} )
				distance:completeAnimation()
				self.distance:setAlpha( 0 )
				self.clipFinished( distance, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
			end
		},
		ArchetypeOnly = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				GlowBack:completeAnimation()
				self.GlowBack:setLeftRight( true, true, -51, 51 )
				self.GlowBack:setTopBottom( true, true, 8, 37 )
				self.GlowBack:setAlpha( 0.1 )
				self.clipFinished( GlowBack, {} )
				indicator:completeAnimation()
				self.indicator:setAlpha( 0 )
				self.clipFinished( indicator, {} )
				enemyInfo:completeAnimation()
				self.enemyInfo:setAlpha( 0 )
				self.clipFinished( enemyInfo, {} )
				archetypeImage:completeAnimation()
				self.archetypeImage:setLeftRight( false, false, -31, 31 )
				self.archetypeImage:setTopBottom( false, true, -66, -2 )
				self.archetypeImage:setAlpha( 1 )
				self.archetypeImage:setScale( 0.7 )
				self.clipFinished( archetypeImage, {} )
				distance:completeAnimation()
				self.distance:setAlpha( 0 )
				self.clipFinished( distance, {} )
				Glow:completeAnimation()
				self.Glow:setLeftRight( true, false, -6, 137 )
				self.Glow:setTopBottom( true, false, 18, 146 )
				self.Glow:setAlpha( 1 )
				self.clipFinished( Glow, {} )
				Dots:completeAnimation()
				self.Dots:setLeftRight( true, false, 27, 91 )
				self.Dots:setTopBottom( true, false, 47.5, 111.5 )
				self.Dots:setAlpha( 1 )
				self.Dots:setScale( 0.9 )
				self.clipFinished( Dots, {} )
				Frame:completeAnimation()
				self.Frame:setAlpha( 0 )
				self.clipFinished( Frame, {} )
				Line:completeAnimation()
				self.Line:setAlpha( 0 )
				self.clipFinished( Line, {} )
			end
		},
		DistanceOnly = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				GlowBack:completeAnimation()
				self.GlowBack:setLeftRight( true, true, -48, 54 )
				self.GlowBack:setTopBottom( true, true, 24.25, 20.75 )
				self.GlowBack:setAlpha( 0 )
				self.clipFinished( GlowBack, {} )
				indicator:completeAnimation()
				self.indicator:setAlpha( 0 )
				self.clipFinished( indicator, {} )
				enemyInfo:completeAnimation()
				self.enemyInfo:setAlpha( 0 )
				self.clipFinished( enemyInfo, {} )
				archetypeImage:completeAnimation()
				self.archetypeImage:setAlpha( 0 )
				self.clipFinished( archetypeImage, {} )
				distance:completeAnimation()
				self.distance:setLeftRight( false, false, -28, 28 )
				self.distance:setTopBottom( false, true, -55, -18 )
				self.distance:setAlpha( 1 )
				self.distance:setScale( 0.8 )
				self.clipFinished( distance, {} )
				Glow:completeAnimation()
				self.Glow:setLeftRight( true, false, 0, 128 )
				self.Glow:setTopBottom( true, false, 37, 165 )
				self.Glow:setAlpha( 0.48 )
				self.clipFinished( Glow, {} )
				Dots:completeAnimation()
				self.Dots:setLeftRight( true, false, 27, 91 )
				self.Dots:setTopBottom( true, false, 47.5, 111.5 )
				self.Dots:setAlpha( 1 )
				self.Dots:setScale( 0.9 )
				self.clipFinished( Dots, {} )
				Frame:completeAnimation()
				self.Frame:setAlpha( 0 )
				self.clipFinished( Frame, {} )
				Line:completeAnimation()
				self.Line:setAlpha( 0 )
				self.clipFinished( Line, {} )
			end
		},
		StatusOnly = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				GlowBack:completeAnimation()
				self.GlowBack:setLeftRight( true, true, -51, 51 )
				self.GlowBack:setTopBottom( true, true, 24.75, 21.25 )
				self.GlowBack:setAlpha( 0.1 )
				self.clipFinished( GlowBack, {} )
				indicator:completeAnimation()
				self.indicator:setLeftRight( false, false, -34, 34 )
				self.indicator:setTopBottom( false, true, -50, -18 )
				self.indicator:setAlpha( 1 )
				self.indicator:setScale( 0.9 )
				self.clipFinished( indicator, {} )
				enemyInfo:completeAnimation()
				self.enemyInfo:setAlpha( 0 )
				self.clipFinished( enemyInfo, {} )
				archetypeImage:completeAnimation()
				self.archetypeImage:setAlpha( 0 )
				self.clipFinished( archetypeImage, {} )
				distance:completeAnimation()
				self.distance:setAlpha( 0 )
				self.clipFinished( distance, {} )
				Glow:completeAnimation()
				self.Glow:setLeftRight( true, false, -10, 118 )
				self.Glow:setTopBottom( true, false, 57.5, 152.5 )
				self.Glow:setAlpha( 0.56 )
				self.clipFinished( Glow, {} )
				Dots:completeAnimation()
				self.Dots:setLeftRight( true, false, 27, 91 )
				self.Dots:setTopBottom( true, false, 47.5, 111.5 )
				self.Dots:setAlpha( 1 )
				self.Dots:setScale( 0.9 )
				self.clipFinished( Dots, {} )
				Frame:completeAnimation()
				self.Frame:setAlpha( 0 )
				self.clipFinished( Frame, {} )
				Line:completeAnimation()
				self.Line:setAlpha( 0 )
				self.clipFinished( Line, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "All",
			condition = function ( menu, element, event )
				local f23_local0 = IsModelValueTrue( controller, "profile.tacticalModeShowDamage" )
				if f23_local0 then
					f23_local0 = IsSelfModelValueTrue( element, controller, "showDamage" )
					if f23_local0 then
						f23_local0 = IsModelValueTrue( controller, "profile.tacticalModeShowArchetype" )
						if f23_local0 then
							f23_local0 = IsModelValueTrue( controller, "profile.tacticalModeShowDistance" )
							if f23_local0 then
								f23_local0 = IsModelValueTrue( controller, "profile.tacticalModeShowStatus" )
							end
						end
					end
				end
				return f23_local0
			end
		},
		{
			stateName = "Damage_Archetype_Distance",
			condition = function ( menu, element, event )
				local f24_local0 = IsModelValueTrue( controller, "profile.tacticalModeShowDamage" )
				if f24_local0 then
					f24_local0 = IsSelfModelValueTrue( element, controller, "showDamage" )
					if f24_local0 then
						f24_local0 = IsModelValueTrue( controller, "profile.tacticalModeShowArchetype" )
						if f24_local0 then
							f24_local0 = IsModelValueTrue( controller, "profile.tacticalModeShowDistance" )
						end
					end
				end
				return f24_local0
			end
		},
		{
			stateName = "Damage_Archetype_Status",
			condition = function ( menu, element, event )
				local f25_local0 = IsModelValueTrue( controller, "profile.tacticalModeShowDamage" )
				if f25_local0 then
					f25_local0 = IsSelfModelValueTrue( element, controller, "showDamage" )
					if f25_local0 then
						f25_local0 = IsModelValueTrue( controller, "profile.tacticalModeShowArchetype" )
						if f25_local0 then
							f25_local0 = IsModelValueTrue( controller, "profile.tacticalModeShowStatus" )
						end
					end
				end
				return f25_local0
			end
		},
		{
			stateName = "Damage_Distance_Status",
			condition = function ( menu, element, event )
				local f26_local0 = IsModelValueTrue( controller, "profile.tacticalModeShowDamage" )
				if f26_local0 then
					f26_local0 = IsSelfModelValueTrue( element, controller, "showDamage" )
					if f26_local0 then
						f26_local0 = IsModelValueTrue( controller, "profile.tacticalModeShowDistance" )
						if f26_local0 then
							f26_local0 = IsModelValueTrue( controller, "profile.tacticalModeShowStatus" )
						end
					end
				end
				return f26_local0
			end
		},
		{
			stateName = "Archetype_Distance_Status",
			condition = function ( menu, element, event )
				local f27_local0 = IsModelValueTrue( controller, "profile.tacticalModeShowArchetype" )
				if f27_local0 then
					f27_local0 = IsModelValueTrue( controller, "profile.tacticalModeShowDistance" )
					if f27_local0 then
						f27_local0 = IsModelValueTrue( controller, "profile.tacticalModeShowStatus" )
					end
				end
				return f27_local0
			end
		},
		{
			stateName = "Damage_Archetype",
			condition = function ( menu, element, event )
				local f28_local0 = IsModelValueTrue( controller, "profile.tacticalModeShowDamage" )
				if f28_local0 then
					f28_local0 = IsSelfModelValueTrue( element, controller, "showDamage" )
					if f28_local0 then
						f28_local0 = IsModelValueTrue( controller, "profile.tacticalModeShowArchetype" )
					end
				end
				return f28_local0
			end
		},
		{
			stateName = "Damage_Distance",
			condition = function ( menu, element, event )
				local f29_local0 = IsModelValueTrue( controller, "profile.tacticalModeShowDamage" )
				if f29_local0 then
					f29_local0 = IsSelfModelValueTrue( element, controller, "showDamage" )
					if f29_local0 then
						f29_local0 = IsModelValueTrue( controller, "profile.tacticalModeShowDistance" )
					end
				end
				return f29_local0
			end
		},
		{
			stateName = "Damage_Status",
			condition = function ( menu, element, event )
				local f30_local0 = IsModelValueTrue( controller, "profile.tacticalModeShowDamage" )
				if f30_local0 then
					f30_local0 = IsSelfModelValueTrue( element, controller, "showDamage" )
					if f30_local0 then
						f30_local0 = IsModelValueTrue( controller, "profile.tacticalModeShowStatus" )
					end
				end
				return f30_local0
			end
		},
		{
			stateName = "Archetype_Distance",
			condition = function ( menu, element, event )
				return IsModelValueTrue( controller, "profile.tacticalModeShowArchetype" ) and IsModelValueTrue( controller, "profile.tacticalModeShowDistance" )
			end
		},
		{
			stateName = "Archetype_Status",
			condition = function ( menu, element, event )
				return IsModelValueTrue( controller, "profile.tacticalModeShowArchetype" ) and IsModelValueTrue( controller, "profile.tacticalModeShowStatus" )
			end
		},
		{
			stateName = "Distance_Status",
			condition = function ( menu, element, event )
				return IsModelValueTrue( controller, "profile.tacticalModeShowDistance" ) and IsModelValueTrue( controller, "profile.tacticalModeShowStatus" )
			end
		},
		{
			stateName = "DamageOnly",
			condition = function ( menu, element, event )
				return IsModelValueTrue( controller, "profile.tacticalModeShowDamage" ) and IsSelfModelValueTrue( element, controller, "showDamage" )
			end
		},
		{
			stateName = "ArchetypeOnly",
			condition = function ( menu, element, event )
				return IsModelValueTrue( controller, "profile.tacticalModeShowArchetype" )
			end
		},
		{
			stateName = "DistanceOnly",
			condition = function ( menu, element, event )
				return IsModelValueTrue( controller, "profile.tacticalModeShowDistance" )
			end
		},
		{
			stateName = "StatusOnly",
			condition = function ( menu, element, event )
				return IsModelValueTrue( controller, "profile.tacticalModeShowStatus" )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "profile.tacticalModeShowDamage" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "profile.tacticalModeShowDamage"
		} )
	end )
	self:linkToElementModel( self, "showDamage", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "showDamage"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "profile.tacticalModeShowArchetype" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "profile.tacticalModeShowArchetype"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "profile.tacticalModeShowDistance" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "profile.tacticalModeShowDistance"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "profile.tacticalModeShowStatus" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "profile.tacticalModeShowStatus"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.indicator:close()
		element.enemyInfo:close()
		element.distance:close()
		element.Glow:close()
		element.archetypeImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

