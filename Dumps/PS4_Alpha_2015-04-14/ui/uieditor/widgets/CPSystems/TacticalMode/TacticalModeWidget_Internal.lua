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
	GlowBack:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( GlowBack )
	self.GlowBack = GlowBack
	
	local indicator = CoD.TacticalModeStatusIndicatorWidget.new( menu, controller )
	indicator:setLeftRight( false, false, -34, 34 )
	indicator:setTopBottom( false, true, -114, -82 )
	indicator:setRGB( 1, 1, 1 )
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
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			archetypeImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( archetypeImage )
	self.archetypeImage = archetypeImage
	
	local distance = CoD.TacticalModeDistanceWidget.new( menu, controller )
	distance:setLeftRight( false, false, 3, 59 )
	distance:setTopBottom( false, true, -66, -34 )
	distance:setRGB( 1, 1, 1 )
	distance:linkToElementModel( self, nil, false, function ( model )
		distance:setModel( model, controller )
	end )
	self:addElement( distance )
	self.distance = distance
	
	local Glow = CoD.TacticalModeGlow.new( menu, controller )
	Glow:setLeftRight( true, false, -16.79, 111.21 )
	Glow:setTopBottom( true, false, -11, 117 )
	Glow:setRGB( 1, 1, 1 )
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
	
	local plus2 = LUI.UIImage.new()
	plus2:setLeftRight( false, false, -61, -53 )
	plus2:setTopBottom( false, true, -26, -18 )
	plus2:setRGB( 1, 1, 1 )
	plus2:setAlpha( 0.6 )
	plus2:setZoom( 2 )
	plus2:setImage( RegisterImage( "uie_t7_cp_hud_tacmode_pluselement" ) )
	plus2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( plus2 )
	self.plus2 = plus2
	
	local plus1 = LUI.UIImage.new()
	plus1:setLeftRight( false, false, -61, -53 )
	plus1:setTopBottom( false, true, -82, -74 )
	plus1:setRGB( 1, 1, 1 )
	plus1:setAlpha( 0.6 )
	plus1:setZoom( 2 )
	plus1:setImage( RegisterImage( "uie_t7_cp_hud_tacmode_pluselement" ) )
	plus1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( plus1 )
	self.plus1 = plus1
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
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
				plus2:completeAnimation()
				self.plus2:setAlpha( 0 )
				self.clipFinished( plus2, {} )
				plus1:completeAnimation()
				self.plus1:setAlpha( 0 )
				self.clipFinished( plus1, {} )
			end
		},
		All = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
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
				plus2:completeAnimation()
				self.plus2:setLeftRight( false, false, -63, -55 )
				self.plus2:setTopBottom( false, true, -26, -18 )
				self.plus2:setAlpha( 0.6 )
				self.clipFinished( plus2, {} )
				plus1:completeAnimation()
				self.plus1:setLeftRight( false, false, -63, -55 )
				self.plus1:setTopBottom( false, true, -82, -74 )
				self.plus1:setAlpha( 0.6 )
				self.clipFinished( plus1, {} )
			end
		},
		Damage_Archetype_Distance = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
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
				plus2:completeAnimation()
				self.plus2:setLeftRight( false, false, -62, -54 )
				self.plus2:setTopBottom( false, true, -26, -18 )
				self.plus2:setAlpha( 0.6 )
				self.clipFinished( plus2, {} )
				plus1:completeAnimation()
				self.plus1:setLeftRight( false, false, -62, -54 )
				self.plus1:setTopBottom( false, true, -82, -74 )
				self.plus1:setAlpha( 0.6 )
				self.clipFinished( plus1, {} )
			end
		},
		Damage_Archetype_Status = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
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
				plus2:completeAnimation()
				self.plus2:setLeftRight( false, false, -62, -54 )
				self.plus2:setTopBottom( false, true, -26, -18 )
				self.plus2:setAlpha( 0 )
				self.clipFinished( plus2, {} )
				plus1:completeAnimation()
				self.plus1:setLeftRight( false, false, -62, -54 )
				self.plus1:setTopBottom( false, true, -82, -74 )
				self.plus1:setAlpha( 0 )
				self.clipFinished( plus1, {} )
			end
		},
		Damage_Distance_Status = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
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
				plus2:completeAnimation()
				self.plus2:setAlpha( 0 )
				self.clipFinished( plus2, {} )
				plus1:completeAnimation()
				self.plus1:setAlpha( 0 )
				self.clipFinished( plus1, {} )
			end
		},
		Archetype_Distance_Status = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				GlowBack:completeAnimation()
				self.GlowBack:setLeftRight( true, true, -44.5, 58.5 )
				self.GlowBack:setTopBottom( true, true, -24, 35.5 )
				self.GlowBack:setAlpha( 0.2 )
				self.clipFinished( GlowBack, {} )
				indicator:completeAnimation()
				self.indicator:setLeftRight( false, false, -34, 34 )
				self.indicator:setTopBottom( false, true, -96, -64 )
				self.indicator:setAlpha( 1 )
				self.clipFinished( indicator, {} )
				enemyInfo:completeAnimation()
				self.enemyInfo:setAlpha( 0 )
				self.clipFinished( enemyInfo, {} )
				archetypeImage:completeAnimation()
				self.archetypeImage:setLeftRight( false, false, -59, 3 )
				self.archetypeImage:setTopBottom( false, true, -64, 0 )
				self.archetypeImage:setAlpha( 1 )
				self.clipFinished( archetypeImage, {} )
				distance:completeAnimation()
				self.distance:setLeftRight( false, false, 3, 59 )
				self.distance:setTopBottom( false, true, -64, 0 )
				self.distance:setAlpha( 1 )
				self.clipFinished( distance, {} )
				Glow:completeAnimation()
				self.Glow:setLeftRight( true, false, -22, 146 )
				self.Glow:setTopBottom( true, false, -14.62, 152.12 )
				self.Glow:setAlpha( 1 )
				self.clipFinished( Glow, {} )
				plus2:completeAnimation()
				self.plus2:setLeftRight( false, false, -63, -55 )
				self.plus2:setTopBottom( false, true, -8, 0 )
				self.plus2:setAlpha( 0.6 )
				self.clipFinished( plus2, {} )
				plus1:completeAnimation()
				self.plus1:setLeftRight( false, false, -63, -55 )
				self.plus1:setTopBottom( false, true, -64, -56 )
				self.plus1:setAlpha( 0.6 )
				self.clipFinished( plus1, {} )
			end
		},
		Damage_Archetype = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
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
				plus2:completeAnimation()
				self.plus2:setAlpha( 0 )
				self.clipFinished( plus2, {} )
				plus1:completeAnimation()
				self.plus1:setAlpha( 0 )
				self.clipFinished( plus1, {} )
			end
		},
		Damage_Distance = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
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
				plus2:completeAnimation()
				self.plus2:setAlpha( 0 )
				self.clipFinished( plus2, {} )
				plus1:completeAnimation()
				self.plus1:setAlpha( 0 )
				self.clipFinished( plus1, {} )
			end
		},
		Damage_Status = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				GlowBack:completeAnimation()
				self.GlowBack:setLeftRight( true, true, -43.5, 43.5 )
				self.GlowBack:setTopBottom( true, true, 24.75, 15.25 )
				self.GlowBack:setAlpha( 0.2 )
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
				plus2:completeAnimation()
				self.plus2:setAlpha( 0 )
				self.clipFinished( plus2, {} )
				plus1:completeAnimation()
				self.plus1:setAlpha( 0 )
				self.clipFinished( plus1, {} )
			end
		},
		Archetype_Distance = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				GlowBack:completeAnimation()
				self.GlowBack:setLeftRight( true, true, -51, 51 )
				self.GlowBack:setTopBottom( true, true, 10.5, 35 )
				self.GlowBack:setAlpha( 0.2 )
				self.clipFinished( GlowBack, {} )
				indicator:completeAnimation()
				self.indicator:setAlpha( 0 )
				self.clipFinished( indicator, {} )
				enemyInfo:completeAnimation()
				self.enemyInfo:setAlpha( 0 )
				self.clipFinished( enemyInfo, {} )
				archetypeImage:completeAnimation()
				self.archetypeImage:setLeftRight( false, false, -59, 3 )
				self.archetypeImage:setTopBottom( false, true, -64, 0 )
				self.archetypeImage:setAlpha( 1 )
				self.clipFinished( archetypeImage, {} )
				distance:completeAnimation()
				self.distance:setLeftRight( false, false, 3, 59 )
				self.distance:setTopBottom( false, true, -64, 0 )
				self.distance:setAlpha( 1 )
				self.clipFinished( distance, {} )
				Glow:completeAnimation()
				self.Glow:setLeftRight( true, false, -44, 155 )
				self.Glow:setTopBottom( true, false, 18, 146 )
				self.Glow:setAlpha( 1 )
				self.clipFinished( Glow, {} )
				plus2:completeAnimation()
				self.plus2:setLeftRight( false, false, -63, -55 )
				self.plus2:setTopBottom( false, true, -8, 0 )
				self.plus2:setAlpha( 0.6 )
				self.clipFinished( plus2, {} )
				plus1:completeAnimation()
				self.plus1:setLeftRight( false, false, -63, -55 )
				self.plus1:setTopBottom( false, true, -64, -56 )
				self.plus1:setAlpha( 0.6 )
				self.clipFinished( plus1, {} )
			end
		},
		Archetype_Status = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				GlowBack:completeAnimation()
				self.GlowBack:setLeftRight( true, true, -43, 59 )
				self.GlowBack:setTopBottom( true, true, 7.5, 32 )
				self.GlowBack:setAlpha( 0.2 )
				self.clipFinished( GlowBack, {} )
				indicator:completeAnimation()
				self.indicator:setLeftRight( false, false, 3, 71 )
				self.indicator:setTopBottom( false, true, -48, -16 )
				self.indicator:setAlpha( 1 )
				self.clipFinished( indicator, {} )
				enemyInfo:completeAnimation()
				self.enemyInfo:setAlpha( 0 )
				self.clipFinished( enemyInfo, {} )
				archetypeImage:completeAnimation()
				self.archetypeImage:setLeftRight( false, false, -59, 3 )
				self.archetypeImage:setTopBottom( false, true, -64, 0 )
				self.archetypeImage:setAlpha( 1 )
				self.clipFinished( archetypeImage, {} )
				distance:completeAnimation()
				self.distance:setAlpha( 0 )
				self.clipFinished( distance, {} )
				Glow:completeAnimation()
				self.Glow:setLeftRight( true, false, -40, 180 )
				self.Glow:setTopBottom( true, false, 34, 130 )
				self.Glow:setAlpha( 1 )
				self.clipFinished( Glow, {} )
				plus2:completeAnimation()
				self.plus2:setAlpha( 0 )
				self.clipFinished( plus2, {} )
				plus1:completeAnimation()
				self.plus1:setAlpha( 0 )
				self.clipFinished( plus1, {} )
			end
		},
		Distance_Status = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				GlowBack:completeAnimation()
				self.GlowBack:setLeftRight( true, true, -43, 59 )
				self.GlowBack:setTopBottom( true, true, 50, 32 )
				self.GlowBack:setAlpha( 0.2 )
				self.clipFinished( GlowBack, {} )
				indicator:completeAnimation()
				self.indicator:setLeftRight( false, false, -65, 3 )
				self.indicator:setTopBottom( false, true, -32, 0 )
				self.indicator:setAlpha( 1 )
				self.clipFinished( indicator, {} )
				enemyInfo:completeAnimation()
				self.enemyInfo:setAlpha( 0 )
				self.clipFinished( enemyInfo, {} )
				archetypeImage:completeAnimation()
				self.archetypeImage:setAlpha( 0 )
				self.clipFinished( archetypeImage, {} )
				distance:completeAnimation()
				self.distance:setLeftRight( false, false, 3, 59 )
				self.distance:setTopBottom( false, true, -32, 0 )
				self.distance:setAlpha( 1 )
				self.clipFinished( distance, {} )
				Glow:completeAnimation()
				self.Glow:setLeftRight( true, false, -28.5, 146.5 )
				self.Glow:setTopBottom( true, false, 55, 137 )
				self.Glow:setAlpha( 1 )
				self.clipFinished( Glow, {} )
				plus2:completeAnimation()
				self.plus2:setAlpha( 0 )
				self.clipFinished( plus2, {} )
				plus1:completeAnimation()
				self.plus1:setAlpha( 0 )
				self.clipFinished( plus1, {} )
			end
		},
		DamageOnly = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
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
				plus2:completeAnimation()
				self.plus2:setAlpha( 0 )
				self.clipFinished( plus2, {} )
				plus1:completeAnimation()
				self.plus1:setAlpha( 0 )
				self.clipFinished( plus1, {} )
			end
		},
		ArchetypeOnly = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				GlowBack:completeAnimation()
				self.GlowBack:setLeftRight( true, true, -48, 54 )
				self.GlowBack:setTopBottom( true, true, 8, 37 )
				self.GlowBack:setAlpha( 0.2 )
				self.clipFinished( GlowBack, {} )
				indicator:completeAnimation()
				self.indicator:setAlpha( 0 )
				self.clipFinished( indicator, {} )
				enemyInfo:completeAnimation()
				self.enemyInfo:setAlpha( 0 )
				self.clipFinished( enemyInfo, {} )
				archetypeImage:completeAnimation()
				self.archetypeImage:setLeftRight( false, false, -31, 31 )
				self.archetypeImage:setTopBottom( false, true, -64, 0 )
				self.archetypeImage:setAlpha( 1 )
				self.clipFinished( archetypeImage, {} )
				distance:completeAnimation()
				self.distance:setAlpha( 0 )
				self.clipFinished( distance, {} )
				Glow:completeAnimation()
				self.Glow:setLeftRight( true, false, -6, 137 )
				self.Glow:setTopBottom( true, false, 18, 146 )
				self.Glow:setAlpha( 1 )
				self.clipFinished( Glow, {} )
				plus2:completeAnimation()
				self.plus2:setAlpha( 0 )
				self.clipFinished( plus2, {} )
				plus1:completeAnimation()
				self.plus1:setAlpha( 0 )
				self.clipFinished( plus1, {} )
			end
		},
		DistanceOnly = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				GlowBack:completeAnimation()
				self.GlowBack:setLeftRight( true, true, -48, 54 )
				self.GlowBack:setTopBottom( true, true, 42.75, 39.25 )
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
				self.distance:setTopBottom( false, true, -37, 0 )
				self.distance:setAlpha( 1 )
				self.clipFinished( distance, {} )
				Glow:completeAnimation()
				self.Glow:setLeftRight( true, false, 0, 128 )
				self.Glow:setTopBottom( true, false, 37, 165 )
				self.Glow:setAlpha( 0.48 )
				self.clipFinished( Glow, {} )
				plus2:completeAnimation()
				self.plus2:setAlpha( 0 )
				self.clipFinished( plus2, {} )
				plus1:completeAnimation()
				self.plus1:setAlpha( 0 )
				self.clipFinished( plus1, {} )
			end
		},
		StatusOnly = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				GlowBack:completeAnimation()
				self.GlowBack:setLeftRight( true, true, -48, 54 )
				self.GlowBack:setTopBottom( true, true, 40.75, 37.25 )
				self.GlowBack:setAlpha( 0 )
				self.clipFinished( GlowBack, {} )
				indicator:completeAnimation()
				self.indicator:setLeftRight( false, false, -34, 34 )
				self.indicator:setTopBottom( false, true, -32, 0 )
				self.indicator:setAlpha( 1 )
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
				plus2:completeAnimation()
				self.plus2:setAlpha( 0 )
				self.clipFinished( plus2, {} )
				plus1:completeAnimation()
				self.plus1:setAlpha( 0 )
				self.clipFinished( plus1, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "All",
			condition = function ( menu, element, event )
				local f23_local0 = IsModelValueTrue( controller, "profile.tacticalModeShowDamage" )
				if f23_local0 then
					f23_local0 = IsModelValueTrue( controller, "profile.tacticalModeShowArchetype" )
					if f23_local0 then
						f23_local0 = IsModelValueTrue( controller, "profile.tacticalModeShowDistance" )
						if f23_local0 then
							f23_local0 = IsModelValueTrue( controller, "profile.tacticalModeShowStatus" )
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
					f24_local0 = IsModelValueTrue( controller, "profile.tacticalModeShowArchetype" )
					if f24_local0 then
						f24_local0 = IsModelValueTrue( controller, "profile.tacticalModeShowDistance" )
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
					f25_local0 = IsModelValueTrue( controller, "profile.tacticalModeShowArchetype" )
					if f25_local0 then
						f25_local0 = IsModelValueTrue( controller, "profile.tacticalModeShowStatus" )
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
					f26_local0 = IsModelValueTrue( controller, "profile.tacticalModeShowDistance" )
					if f26_local0 then
						f26_local0 = IsModelValueTrue( controller, "profile.tacticalModeShowStatus" )
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
				return IsModelValueTrue( controller, "profile.tacticalModeShowDamage" ) and IsModelValueTrue( controller, "profile.tacticalModeShowArchetype" )
			end
		},
		{
			stateName = "Damage_Distance",
			condition = function ( menu, element, event )
				return IsModelValueTrue( controller, "profile.tacticalModeShowDamage" ) and IsModelValueTrue( controller, "profile.tacticalModeShowDistance" )
			end
		},
		{
			stateName = "Damage_Status",
			condition = function ( menu, element, event )
				return IsModelValueTrue( controller, "profile.tacticalModeShowDamage" ) and IsModelValueTrue( controller, "profile.tacticalModeShowStatus" )
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
				return IsModelValueTrue( controller, "profile.tacticalModeShowDamage" )
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
	self.close = function ( self )
		self.indicator:close()
		self.enemyInfo:close()
		self.distance:close()
		self.Glow:close()
		self.archetypeImage:close()
		CoD.TacticalModeWidget_Internal.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

