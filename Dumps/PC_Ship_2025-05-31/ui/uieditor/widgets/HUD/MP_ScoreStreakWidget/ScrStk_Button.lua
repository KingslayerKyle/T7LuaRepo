require( "ui.uieditor.widgets.HUD.MP_ScoreStreakWidget.ScrStk_ButtonInternal" )
require( "ui.uieditor.widgets.HUD.core_MapWidget.MapWidget_BarTop" )
require( "ui.uieditor.widgets.HUD.MP_ScoreStreakWidget.ScrStk_UpDownArrow" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0.m_focusable = true
	local f1_local0 = f1_arg1
	LUI.OverrideFunction_CallOriginalFirst( f1_arg0, "setState", function ( element, controller )
		if element.gridInfoTable then
			local f2_local0 = element.gridInfoTable.parentGrid
			if element:hasClip( "Focus" ) then
				element:processEvent( {
					name = "gain_focus",
					controller = f1_local0
				} )
			elseif f2_local0.activeWidget == element then
				f2_local0:getFirstSelectableItem( true )
			end
		end
	end )
end

CoD.ScrStk_Button = InheritFrom( LUI.UIElement )
CoD.ScrStk_Button.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ScrStk_Button )
	self.id = "ScrStk_Button"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 69 )
	self:setTopBottom( true, false, 0, 52 )
	self.anyChildUsesUpdateState = true
	
	local PanelDarken = LUI.UIImage.new()
	PanelDarken:setLeftRight( false, false, -29.5, 25 )
	PanelDarken:setTopBottom( false, false, -18, 17 )
	PanelDarken:setRGB( 0, 0, 0 )
	PanelDarken:setAlpha( 0 )
	PanelDarken:setImage( RegisterImage( "uie_t7_mp_hud_scorestreak_boxfill" ) )
	self:addElement( PanelDarken )
	self.PanelDarken = PanelDarken
	
	local StrokeInner = LUI.UIImage.new()
	StrokeInner:setLeftRight( true, false, 7, 59 )
	StrokeInner:setTopBottom( true, false, 8, 44 )
	StrokeInner:setAlpha( 0 )
	StrokeInner:setZoom( -10 )
	StrokeInner:setImage( RegisterImage( "uie_t7_mp_hud_scorestreak_boxcrss" ) )
	StrokeInner:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	StrokeInner:setShaderVector( 0, 0.1, 1, 0, 0 )
	StrokeInner:setShaderVector( 1, 0, 0, 0, 0 )
	StrokeInner:setShaderVector( 2, 0, 0, 0, 0 )
	StrokeInner:setShaderVector( 3, 0, 0, 0, 0 )
	StrokeInner:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( StrokeInner )
	self.StrokeInner = StrokeInner
	
	local Stroke = LUI.UIImage.new()
	Stroke:setLeftRight( true, false, 5, 61 )
	Stroke:setTopBottom( true, false, 8, 44 )
	Stroke:setAlpha( 0 )
	Stroke:setZoom( -10 )
	Stroke:setImage( RegisterImage( "uie_t7_mp_hud_scorestreak_boxstrk" ) )
	Stroke:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Stroke:setShaderVector( 0, 0.1, 1, 0, 0 )
	Stroke:setShaderVector( 1, 0, 0, 0, 0 )
	Stroke:setShaderVector( 2, 0, 0, 0, 0 )
	Stroke:setShaderVector( 3, 0, 0, 0, 0 )
	Stroke:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( Stroke )
	self.Stroke = Stroke
	
	local DarkGlow = LUI.UIImage.new()
	DarkGlow:setLeftRight( true, false, -9.18, 75.18 )
	DarkGlow:setTopBottom( true, false, -5.5, 56.5 )
	DarkGlow:setRGB( 0, 0, 0 )
	DarkGlow:setAlpha( 0 )
	DarkGlow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	self:addElement( DarkGlow )
	self.DarkGlow = DarkGlow
	
	local innerGlow = LUI.UIImage.new()
	innerGlow:setLeftRight( true, false, 10, 55 )
	innerGlow:setTopBottom( true, false, 11, 42 )
	innerGlow:setAlpha( 0 )
	innerGlow:setImage( RegisterImage( "uie_t7_mp_hud_scorestreak_boxglow" ) )
	self:addElement( innerGlow )
	self.innerGlow = innerGlow
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, false, -12.31, 78.31 )
	Glow:setTopBottom( true, false, -10.66, 60.66 )
	Glow:setRGB( ColorSet.CoreControl.r, ColorSet.CoreControl.g, ColorSet.CoreControl.b )
	Glow:setAlpha( 0 )
	Glow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local fill = LUI.UIImage.new()
	fill:setLeftRight( true, false, 4, 61 )
	fill:setTopBottom( true, false, 7, 43 )
	fill:setRGB( 0.95, 0.58, 0.19 )
	fill:setAlpha( 0 )
	fill:setZoom( 20 )
	fill:setImage( RegisterImage( "uie_t7_mp_hud_scorestreak_box_fill" ) )
	self:addElement( fill )
	self.fill = fill
	
	local ButtonContainer = CoD.ScrStk_ButtonInternal.new( menu, controller )
	ButtonContainer:setLeftRight( true, false, 2, 71 )
	ButtonContainer:setTopBottom( true, false, -6, 57 )
	ButtonContainer:setRGB( 1, 0.97, 0.35 )
	ButtonContainer:setAlpha( 0 )
	ButtonContainer:setZoom( 20 )
	ButtonContainer:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	ButtonContainer:setShaderVector( 0, 0, 0, 0, 0 )
	ButtonContainer:setShaderVector( 1, 0, 0, 0, 0 )
	ButtonContainer:setShaderVector( 2, 0, 0, 0, 0 )
	ButtonContainer:setShaderVector( 3, 0, 0, 0, 0 )
	ButtonContainer:setShaderVector( 4, 0, 0, 0, 0 )
	ButtonContainer:linkToElementModel( self, "rewardImage", true, function ( model )
		local rewardImage = Engine.GetModelValue( model )
		if rewardImage then
			ButtonContainer.Icon:setImage( RegisterImage( rewardImage ) )
		end
	end )
	self:addElement( ButtonContainer )
	self.ButtonContainer = ButtonContainer
	
	local IconDuplicateShadow = LUI.UIImage.new()
	IconDuplicateShadow:setLeftRight( false, false, -25.75, 21.25 )
	IconDuplicateShadow:setTopBottom( false, false, -24.5, 21.5 )
	IconDuplicateShadow:setRGB( 0, 0, 0 )
	IconDuplicateShadow:setAlpha( 0.4 )
	IconDuplicateShadow:setZoom( 20 )
	IconDuplicateShadow:setScale( 0.9 )
	IconDuplicateShadow:linkToElementModel( self, "rewardImage", true, function ( model )
		local rewardImage = Engine.GetModelValue( model )
		if rewardImage then
			IconDuplicateShadow:setImage( RegisterImage( rewardImage ) )
		end
	end )
	self:addElement( IconDuplicateShadow )
	self.IconDuplicateShadow = IconDuplicateShadow
	
	local Icon = LUI.UIImage.new()
	Icon:setLeftRight( false, false, -26, 22 )
	Icon:setTopBottom( false, false, -25, 22 )
	Icon:setAlpha( 0 )
	Icon:setZoom( 20 )
	Icon:setScale( 0.9 )
	Icon:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
	Icon:setShaderVector( 0, 1, 0, 0, 0 )
	Icon:linkToElementModel( self, "rewardImage", true, function ( model )
		local rewardImage = Engine.GetModelValue( model )
		if rewardImage then
			Icon:setImage( RegisterImage( rewardImage ) )
		end
	end )
	self:addElement( Icon )
	self.Icon = Icon
	
	local BarBase = CoD.MapWidget_BarTop.new( menu, controller )
	BarBase:setLeftRight( true, false, -7, 8 )
	BarBase:setTopBottom( true, false, 24.5, 32.5 )
	BarBase:setAlpha( 0 )
	BarBase:setYRot( -180 )
	BarBase:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	BarBase:setShaderVector( 0, 0.15, 1, 0, 0 )
	BarBase:setShaderVector( 1, 1, 0, 0, 0 )
	BarBase:setShaderVector( 2, 0, 0, 0, 0 )
	BarBase:setShaderVector( 3, 0, 0, 0, 0 )
	BarBase:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( BarBase )
	self.BarBase = BarBase
	
	local ScrStkUpArrow = CoD.ScrStk_UpDownArrow.new( menu, controller )
	ScrStkUpArrow:setLeftRight( true, false, 28, 36 )
	ScrStkUpArrow:setTopBottom( true, false, -2, 14 )
	ScrStkUpArrow:setRGB( 1, 0.97, 0.35 )
	ScrStkUpArrow:setAlpha( 0 )
	ScrStkUpArrow:setZoom( 20 )
	ScrStkUpArrow:mergeStateConditions( {
		{
			stateName = "Shown",
			condition = function ( menu, element, event )
				return HigherKillstreakHasAmmo( controller, element )
			end
		}
	} )
	ScrStkUpArrow:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "killstreaks.killstreak0.rewardAmmo" ), function ( model )
		menu:updateElementState( ScrStkUpArrow, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "killstreaks.killstreak0.rewardAmmo"
		} )
	end )
	ScrStkUpArrow:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "killstreaks.killstreak1.rewardAmmo" ), function ( model )
		menu:updateElementState( ScrStkUpArrow, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "killstreaks.killstreak1.rewardAmmo"
		} )
	end )
	ScrStkUpArrow:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "killstreaks.killstreak2.rewardAmmo" ), function ( model )
		menu:updateElementState( ScrStkUpArrow, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "killstreaks.killstreak2.rewardAmmo"
		} )
	end )
	ScrStkUpArrow:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "killstreaks.killstreak3.rewardAmmo" ), function ( model )
		menu:updateElementState( ScrStkUpArrow, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "killstreaks.killstreak3.rewardAmmo"
		} )
	end )
	self:addElement( ScrStkUpArrow )
	self.ScrStkUpArrow = ScrStkUpArrow
	
	local ButtonContainer0 = CoD.ScrStk_ButtonInternal.new( menu, controller )
	ButtonContainer0:setLeftRight( true, false, 2, 71 )
	ButtonContainer0:setTopBottom( true, false, -6, 57 )
	ButtonContainer0:setRGB( 1, 0.97, 0.35 )
	ButtonContainer0:setAlpha( 0 )
	ButtonContainer0:setZoom( 20 )
	ButtonContainer0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	ButtonContainer0:setShaderVector( 0, 0, 0, 0, 0 )
	ButtonContainer0:setShaderVector( 1, 0, 0, 0, 0 )
	ButtonContainer0:setShaderVector( 2, 0, 0, 0, 0 )
	ButtonContainer0:setShaderVector( 3, 0, 0, 0, 0 )
	ButtonContainer0:setShaderVector( 4, 0, 0, 0, 0 )
	ButtonContainer0:linkToElementModel( self, "rewardImage", true, function ( model )
		local rewardImage = Engine.GetModelValue( model )
		if rewardImage then
			ButtonContainer0.Icon:setImage( RegisterImage( rewardImage ) )
		end
	end )
	self:addElement( ButtonContainer0 )
	self.ButtonContainer0 = ButtonContainer0
	
	local ScrStkDownArrow = CoD.ScrStk_UpDownArrow.new( menu, controller )
	ScrStkDownArrow:setLeftRight( true, false, 28, 36 )
	ScrStkDownArrow:setTopBottom( true, false, 37, 53 )
	ScrStkDownArrow:setRGB( 1, 0.97, 0.35 )
	ScrStkDownArrow:setAlpha( 0 )
	ScrStkDownArrow:setZRot( 180 )
	ScrStkDownArrow:setZoom( 20 )
	ScrStkDownArrow:mergeStateConditions( {
		{
			stateName = "Shown",
			condition = function ( menu, element, event )
				return LowerKillstreakHasAmmo( controller, element )
			end
		}
	} )
	ScrStkDownArrow:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "killstreaks.killstreak0.rewardAmmo" ), function ( model )
		menu:updateElementState( ScrStkDownArrow, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "killstreaks.killstreak0.rewardAmmo"
		} )
	end )
	ScrStkDownArrow:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "killstreaks.killstreak1.rewardAmmo" ), function ( model )
		menu:updateElementState( ScrStkDownArrow, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "killstreaks.killstreak1.rewardAmmo"
		} )
	end )
	ScrStkDownArrow:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "killstreaks.killstreak2.rewardAmmo" ), function ( model )
		menu:updateElementState( ScrStkDownArrow, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "killstreaks.killstreak2.rewardAmmo"
		} )
	end )
	ScrStkDownArrow:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "killstreaks.killstreak3.rewardAmmo" ), function ( model )
		menu:updateElementState( ScrStkDownArrow, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "killstreaks.killstreak3.rewardAmmo"
		} )
	end )
	self:addElement( ScrStkDownArrow )
	self.ScrStkDownArrow = ScrStkDownArrow
	
	local IconDuplicateAdd = LUI.UIImage.new()
	IconDuplicateAdd:setLeftRight( false, false, -26, 22 )
	IconDuplicateAdd:setTopBottom( false, false, -25.5, 22.5 )
	IconDuplicateAdd:setAlpha( 0 )
	IconDuplicateAdd:setZoom( 20 )
	IconDuplicateAdd:setScale( 0.9 )
	IconDuplicateAdd:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	IconDuplicateAdd:linkToElementModel( self, "rewardImage", true, function ( model )
		local rewardImage = Engine.GetModelValue( model )
		if rewardImage then
			IconDuplicateAdd:setImage( RegisterImage( rewardImage ) )
		end
	end )
	self:addElement( IconDuplicateAdd )
	self.IconDuplicateAdd = IconDuplicateAdd
	
	local stroke = LUI.UIImage.new()
	stroke:setLeftRight( true, false, 4, 61 )
	stroke:setTopBottom( true, false, 7, 44 )
	stroke:setRGB( 1, 0.97, 0.35 )
	stroke:setAlpha( 0 )
	stroke:setZoom( 20 )
	stroke:setImage( RegisterImage( "uie_t7_mp_hud_scorestreak_box2" ) )
	self:addElement( stroke )
	self.stroke = stroke
	
	local stroke0 = LUI.UIImage.new()
	stroke0:setLeftRight( true, false, 4, 61 )
	stroke0:setTopBottom( true, false, 7, 44 )
	stroke0:setRGB( 1, 0.97, 0.35 )
	stroke0:setAlpha( 0 )
	stroke0:setZoom( 20 )
	stroke0:setImage( RegisterImage( "uie_t7_mp_hud_scorestreak_box2" ) )
	self:addElement( stroke0 )
	self.stroke0 = stroke0
	
	local line3 = LUI.UIImage.new()
	line3:setLeftRight( true, false, 2, 63.17 )
	line3:setTopBottom( true, false, 5, 46 )
	line3:setRGB( 0.95, 0.58, 0.19 )
	line3:setAlpha( 0 )
	line3:setZoom( 20 )
	line3:setImage( RegisterImage( "uie_t7_mp_hud_scorestreak_box3" ) )
	self:addElement( line3 )
	self.line3 = line3
	
	local glow = LUI.UIImage.new()
	glow:setLeftRight( true, false, 2, 65.58 )
	glow:setTopBottom( true, false, 5, 45.88 )
	glow:setAlpha( 0 )
	glow:setImage( RegisterImage( "uie_t7_mp_hud_scorestreak_boxglow2" ) )
	self:addElement( glow )
	self.glow = glow
	
	local Icon0 = LUI.UIImage.new()
	Icon0:setLeftRight( false, false, -26, 22 )
	Icon0:setTopBottom( false, false, -25, 22 )
	Icon0:setAlpha( 0 )
	Icon0:setZoom( 20 )
	Icon0:setScale( 0.9 )
	Icon0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
	Icon0:setShaderVector( 0, 1, 0, 0, 0 )
	Icon0:linkToElementModel( self, "rewardImage", true, function ( model )
		local rewardImage = Engine.GetModelValue( model )
		if rewardImage then
			Icon0:setImage( RegisterImage( rewardImage ) )
		end
	end )
	self:addElement( Icon0 )
	self.Icon0 = Icon0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 20 )
				PanelDarken:completeAnimation()
				self.PanelDarken:setAlpha( 0 )
				self.clipFinished( PanelDarken, {} )
				StrokeInner:completeAnimation()
				self.StrokeInner:setAlpha( 0.2 )
				self.clipFinished( StrokeInner, {} )
				Stroke:completeAnimation()
				self.Stroke:setAlpha( 0.2 )
				self.clipFinished( Stroke, {} )
				DarkGlow:completeAnimation()
				self.DarkGlow:setLeftRight( true, false, -9.18, 75.18 )
				self.DarkGlow:setTopBottom( true, false, -5.5, 56.5 )
				self.DarkGlow:setAlpha( 0 )
				self.clipFinished( DarkGlow, {} )
				innerGlow:completeAnimation()
				self.innerGlow:setLeftRight( true, false, 10, 55 )
				self.innerGlow:setTopBottom( true, false, 11, 42 )
				self.innerGlow:setRGB( 1, 1, 1 )
				self.innerGlow:setAlpha( 0 )
				self.innerGlow:setZoom( 0 )
				self.clipFinished( innerGlow, {} )
				Glow:completeAnimation()
				self.Glow:setRGB( ColorSet.CoreControl.r, ColorSet.CoreControl.g, ColorSet.CoreControl.b )
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
				fill:completeAnimation()
				self.fill:setLeftRight( true, false, 4, 61 )
				self.fill:setTopBottom( true, false, 7, 43 )
				self.fill:setRGB( 0.95, 0.58, 0.19 )
				self.fill:setAlpha( 0 )
				self.fill:setZoom( 20 )
				self.clipFinished( fill, {} )
				ButtonContainer:completeAnimation()
				ButtonContainer.ArrowSide:completeAnimation()
				self.ButtonContainer:setRGB( 0.51, 0.55, 0.64 )
				self.ButtonContainer:setAlpha( 0 )
				self.ButtonContainer:setZoom( 0 )
				self.ButtonContainer.ArrowSide:setAlpha( 0 )
				self.clipFinished( ButtonContainer, {} )
				IconDuplicateShadow:completeAnimation()
				self.IconDuplicateShadow:setLeftRight( false, false, -25.75, 21.25 )
				self.IconDuplicateShadow:setTopBottom( false, false, -24.5, 21.5 )
				self.IconDuplicateShadow:setAlpha( 0 )
				self.IconDuplicateShadow:setZoom( 20 )
				self.IconDuplicateShadow:setScale( 0.9 )
				self.IconDuplicateShadow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				self.clipFinished( IconDuplicateShadow, {} )
				Icon:completeAnimation()
				self.Icon:setLeftRight( false, false, -26, 22 )
				self.Icon:setTopBottom( false, false, -25, 22 )
				self.Icon:setRGB( 1, 1, 1 )
				self.Icon:setAlpha( 0 )
				self.Icon:setZoom( 0 )
				self.Icon:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
				self.Icon:setShaderVector( 0, 1, 0, 0, 0 )
				self.clipFinished( Icon, {} )
				BarBase:completeAnimation()
				self.BarBase:setAlpha( 0 )
				self.clipFinished( BarBase, {} )
				ScrStkUpArrow:completeAnimation()
				self.ScrStkUpArrow:setLeftRight( true, false, 28, 36 )
				self.ScrStkUpArrow:setTopBottom( true, false, -2, 14 )
				self.ScrStkUpArrow:setRGB( 1, 0.97, 0.35 )
				self.ScrStkUpArrow:setAlpha( 0 )
				self.clipFinished( ScrStkUpArrow, {} )
				ButtonContainer0:completeAnimation()
				self.ButtonContainer0:setRGB( 1, 0.97, 0.35 )
				self.ButtonContainer0:setAlpha( 0 )
				self.clipFinished( ButtonContainer0, {} )
				ScrStkDownArrow:completeAnimation()
				self.ScrStkDownArrow:setLeftRight( true, false, 28, 36 )
				self.ScrStkDownArrow:setTopBottom( true, false, 37, 53 )
				self.ScrStkDownArrow:setRGB( 1, 0.97, 0.35 )
				self.ScrStkDownArrow:setAlpha( 0 )
				self.clipFinished( ScrStkDownArrow, {} )
				IconDuplicateAdd:completeAnimation()
				self.IconDuplicateAdd:setLeftRight( false, false, -26, 22 )
				self.IconDuplicateAdd:setTopBottom( false, false, -25.5, 22.5 )
				self.IconDuplicateAdd:setAlpha( 0 )
				self.IconDuplicateAdd:setZoom( 20 )
				self.IconDuplicateAdd:setScale( 0.9 )
				self.clipFinished( IconDuplicateAdd, {} )
				stroke:completeAnimation()
				self.stroke:setLeftRight( true, false, 4, 61 )
				self.stroke:setTopBottom( true, false, 7, 44 )
				self.stroke:setRGB( 1, 0.97, 0.35 )
				self.stroke:setAlpha( 0 )
				self.stroke:setZoom( 20 )
				self.clipFinished( stroke, {} )
				stroke0:completeAnimation()
				self.stroke0:setAlpha( 0 )
				self.stroke0:setZoom( 20 )
				self.clipFinished( stroke0, {} )
				line3:completeAnimation()
				self.line3:setLeftRight( true, false, 2, 63.17 )
				self.line3:setTopBottom( true, false, 5, 46 )
				self.line3:setRGB( 0.95, 0.58, 0.19 )
				self.line3:setAlpha( 0 )
				self.line3:setZoom( 20 )
				self.clipFinished( line3, {} )
				glow:completeAnimation()
				self.glow:setLeftRight( true, false, 2, 65.58 )
				self.glow:setTopBottom( true, false, 5, 45.88 )
				self.glow:setRGB( 1, 1, 1 )
				self.glow:setAlpha( 0 )
				self.glow:setZoom( 0 )
				self.clipFinished( glow, {} )
				Icon0:completeAnimation()
				self.Icon0:setAlpha( 0 )
				self.Icon0:setZoom( 20 )
				self.clipFinished( Icon0, {} )
			end,
			Charging = function ()
				self:setupElementClipCounter( 20 )
				local PanelDarkenFrame2 = function ( PanelDarken, event )
					if not event.interrupted then
						PanelDarken:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
					end
					PanelDarken:setAlpha( 0.3 )
					if event.interrupted then
						self.clipFinished( PanelDarken, event )
					else
						PanelDarken:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PanelDarken:completeAnimation()
				self.PanelDarken:setAlpha( 0 )
				PanelDarkenFrame2( PanelDarken, {} )
				local StrokeInnerFrame2 = function ( StrokeInner, event )
					if not event.interrupted then
						StrokeInner:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					StrokeInner:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( StrokeInner, event )
					else
						StrokeInner:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				StrokeInner:completeAnimation()
				self.StrokeInner:setAlpha( 0.4 )
				StrokeInnerFrame2( StrokeInner, {} )
				local StrokeFrame2 = function ( Stroke, event )
					if not event.interrupted then
						Stroke:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					Stroke:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Stroke, event )
					else
						Stroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Stroke:completeAnimation()
				self.Stroke:setAlpha( 0.4 )
				StrokeFrame2( Stroke, {} )
				DarkGlow:completeAnimation()
				self.DarkGlow:setLeftRight( true, false, -9.18, 75.18 )
				self.DarkGlow:setTopBottom( true, false, -5.5, 56.5 )
				self.DarkGlow:setAlpha( 0.3 )
				self.clipFinished( DarkGlow, {} )
				innerGlow:completeAnimation()
				self.innerGlow:setLeftRight( true, false, 10, 55 )
				self.innerGlow:setTopBottom( true, false, 11, 42 )
				self.innerGlow:setRGB( 1, 1, 1 )
				self.innerGlow:setAlpha( 0 )
				self.innerGlow:setZoom( 0 )
				self.clipFinished( innerGlow, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					Glow:setRGB( ColorSet.CoreControl.r, ColorSet.CoreControl.g, ColorSet.CoreControl.b )
					Glow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setRGB( ColorSet.CoreControl.r, ColorSet.CoreControl.g, ColorSet.CoreControl.b )
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
				fill:completeAnimation()
				self.fill:setLeftRight( true, false, 4, 61 )
				self.fill:setTopBottom( true, false, 7, 43 )
				self.fill:setRGB( 0.95, 0.58, 0.19 )
				self.fill:setAlpha( 0 )
				self.fill:setZoom( 20 )
				self.clipFinished( fill, {} )
				local ButtonContainerFrame2 = function ( ButtonContainer, event )
					if not event.interrupted then
						ButtonContainer:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						ButtonContainer.ArrowSide:beginAnimation( "subkeyframe", 500, false, false, CoD.TweenType.Linear )
					end
					ButtonContainer:setRGB( 0.51, 0.55, 0.64 )
					ButtonContainer:setAlpha( 0.8 )
					ButtonContainer:setZoom( 0 )
					ButtonContainer.ArrowSide:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ButtonContainer, event )
					else
						ButtonContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ButtonContainer:completeAnimation()
				ButtonContainer.ArrowSide:completeAnimation()
				self.ButtonContainer:setRGB( 0.51, 0.55, 0.64 )
				self.ButtonContainer:setAlpha( 0 )
				self.ButtonContainer:setZoom( 0 )
				self.ButtonContainer.ArrowSide:setAlpha( 0 )
				ButtonContainerFrame2( ButtonContainer, {} )
				local IconDuplicateShadowFrame2 = function ( IconDuplicateShadow, event )
					if not event.interrupted then
						IconDuplicateShadow:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					IconDuplicateShadow:setLeftRight( false, false, -25.75, 21.25 )
					IconDuplicateShadow:setTopBottom( false, false, -24.5, 21.5 )
					IconDuplicateShadow:setAlpha( 0 )
					IconDuplicateShadow:setZoom( 20 )
					IconDuplicateShadow:setScale( 0.9 )
					IconDuplicateShadow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
					if event.interrupted then
						self.clipFinished( IconDuplicateShadow, event )
					else
						IconDuplicateShadow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				IconDuplicateShadow:completeAnimation()
				self.IconDuplicateShadow:setLeftRight( false, false, -25.75, 21.25 )
				self.IconDuplicateShadow:setTopBottom( false, false, -24.5, 21.5 )
				self.IconDuplicateShadow:setAlpha( 0 )
				self.IconDuplicateShadow:setZoom( 20 )
				self.IconDuplicateShadow:setScale( 0.9 )
				self.IconDuplicateShadow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				IconDuplicateShadowFrame2( IconDuplicateShadow, {} )
				local IconFrame2 = function ( Icon, event )
					if not event.interrupted then
						Icon:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					Icon:setLeftRight( false, false, -26, 22 )
					Icon:setTopBottom( false, false, -25, 22 )
					Icon:setRGB( 1, 1, 1 )
					Icon:setAlpha( 0.9 )
					Icon:setZoom( 0 )
					Icon:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
					Icon:setShaderVector( 0, 0, 0, 0, 0 )
					if event.interrupted then
						self.clipFinished( Icon, event )
					else
						Icon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Icon:completeAnimation()
				self.Icon:setLeftRight( false, false, -26, 22 )
				self.Icon:setTopBottom( false, false, -25, 22 )
				self.Icon:setRGB( 1, 1, 1 )
				self.Icon:setAlpha( 0 )
				self.Icon:setZoom( 0 )
				self.Icon:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
				self.Icon:setShaderVector( 0, 0, 0, 0, 0 )
				IconFrame2( Icon, {} )
				local BarBaseFrame2 = function ( BarBase, event )
					if not event.interrupted then
						BarBase:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					BarBase:setAlpha( 0.7 )
					if event.interrupted then
						self.clipFinished( BarBase, event )
					else
						BarBase:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BarBase:completeAnimation()
				self.BarBase:setAlpha( 0 )
				BarBaseFrame2( BarBase, {} )
				ScrStkUpArrow:completeAnimation()
				self.ScrStkUpArrow:setLeftRight( true, false, 28, 36 )
				self.ScrStkUpArrow:setTopBottom( true, false, -2, 14 )
				self.ScrStkUpArrow:setRGB( 1, 0.97, 0.35 )
				self.ScrStkUpArrow:setAlpha( 0 )
				self.clipFinished( ScrStkUpArrow, {} )
				ButtonContainer0:completeAnimation()
				self.ButtonContainer0:setRGB( 1, 0.97, 0.35 )
				self.ButtonContainer0:setAlpha( 0 )
				self.clipFinished( ButtonContainer0, {} )
				ScrStkDownArrow:completeAnimation()
				self.ScrStkDownArrow:setLeftRight( true, false, 28, 36 )
				self.ScrStkDownArrow:setTopBottom( true, false, 37, 53 )
				self.ScrStkDownArrow:setRGB( 1, 0.97, 0.35 )
				self.ScrStkDownArrow:setAlpha( 0 )
				self.clipFinished( ScrStkDownArrow, {} )
				IconDuplicateAdd:completeAnimation()
				self.IconDuplicateAdd:setLeftRight( false, false, -26, 22 )
				self.IconDuplicateAdd:setTopBottom( false, false, -25.5, 22.5 )
				self.IconDuplicateAdd:setAlpha( 0 )
				self.IconDuplicateAdd:setZoom( 20 )
				self.IconDuplicateAdd:setScale( 0.9 )
				self.clipFinished( IconDuplicateAdd, {} )
				stroke:completeAnimation()
				self.stroke:setLeftRight( true, false, 4, 61 )
				self.stroke:setTopBottom( true, false, 7, 44 )
				self.stroke:setRGB( 1, 0.97, 0.35 )
				self.stroke:setAlpha( 0 )
				self.stroke:setZoom( 20 )
				self.clipFinished( stroke, {} )
				stroke0:completeAnimation()
				self.stroke0:setAlpha( 0 )
				self.stroke0:setZoom( 20 )
				self.clipFinished( stroke0, {} )
				line3:completeAnimation()
				self.line3:setLeftRight( true, false, 2, 63.17 )
				self.line3:setTopBottom( true, false, 5, 46 )
				self.line3:setRGB( 0.95, 0.58, 0.19 )
				self.line3:setAlpha( 0 )
				self.line3:setZoom( 20 )
				self.clipFinished( line3, {} )
				glow:completeAnimation()
				self.glow:setLeftRight( true, false, 2, 65.58 )
				self.glow:setTopBottom( true, false, 5, 45.88 )
				self.glow:setRGB( 1, 1, 1 )
				self.glow:setAlpha( 0 )
				self.glow:setZoom( 0 )
				self.clipFinished( glow, {} )
				Icon0:completeAnimation()
				self.Icon0:setAlpha( 0 )
				self.Icon0:setZoom( 20 )
				self.clipFinished( Icon0, {} )
			end,
			ReadyMiddle = function ()
				self:setupElementClipCounter( 15 )
				local PanelDarkenFrame2 = function ( PanelDarken, event )
					if not event.interrupted then
						PanelDarken:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
					end
					PanelDarken:setAlpha( 0.3 )
					if event.interrupted then
						self.clipFinished( PanelDarken, event )
					else
						PanelDarken:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PanelDarken:completeAnimation()
				self.PanelDarken:setAlpha( 0 )
				PanelDarkenFrame2( PanelDarken, {} )
				local StrokeInnerFrame2 = function ( StrokeInner, event )
					if not event.interrupted then
						StrokeInner:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					StrokeInner:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( StrokeInner, event )
					else
						StrokeInner:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				StrokeInner:completeAnimation()
				self.StrokeInner:setAlpha( 0.4 )
				StrokeInnerFrame2( StrokeInner, {} )
				local StrokeFrame2 = function ( Stroke, event )
					if not event.interrupted then
						Stroke:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					Stroke:setAlpha( 0.2 )
					if event.interrupted then
						self.clipFinished( Stroke, event )
					else
						Stroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Stroke:completeAnimation()
				self.Stroke:setAlpha( 0.4 )
				StrokeFrame2( Stroke, {} )
				local DarkGlowFrame2 = function ( DarkGlow, event )
					if not event.interrupted then
						DarkGlow:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					DarkGlow:setAlpha( 0.4 )
					if event.interrupted then
						self.clipFinished( DarkGlow, event )
					else
						DarkGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DarkGlow:completeAnimation()
				self.DarkGlow:setAlpha( 0 )
				DarkGlowFrame2( DarkGlow, {} )
				innerGlow:completeAnimation()
				self.innerGlow:setAlpha( 0 )
				self.clipFinished( innerGlow, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					Glow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
				local ButtonContainerFrame2 = function ( ButtonContainer, event )
					if not event.interrupted then
						ButtonContainer:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						ButtonContainer.ArrowSide:beginAnimation( "subkeyframe", 500, false, false, CoD.TweenType.Linear )
					end
					ButtonContainer:setRGB( 1, 0.97, 0.35 )
					ButtonContainer:setAlpha( 1 )
					ButtonContainer:setZoom( 0 )
					ButtonContainer.ArrowSide:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ButtonContainer, event )
					else
						ButtonContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ButtonContainer:completeAnimation()
				ButtonContainer.ArrowSide:completeAnimation()
				self.ButtonContainer:setRGB( 0.51, 0.55, 0.64 )
				self.ButtonContainer:setAlpha( 0 )
				self.ButtonContainer:setZoom( 0 )
				self.ButtonContainer.ArrowSide:setAlpha( 0 )
				ButtonContainerFrame2( ButtonContainer, {} )
				IconDuplicateShadow:completeAnimation()
				self.IconDuplicateShadow:setAlpha( 0 )
				self.clipFinished( IconDuplicateShadow, {} )
				Icon:completeAnimation()
				self.Icon:setAlpha( 0 )
				self.clipFinished( Icon, {} )
				IconDuplicateAdd:completeAnimation()
				self.IconDuplicateAdd:setAlpha( 0 )
				self.clipFinished( IconDuplicateAdd, {} )
				stroke:completeAnimation()
				self.stroke:setAlpha( 0 )
				self.clipFinished( stroke, {} )
				stroke0:completeAnimation()
				self.stroke0:setAlpha( 0 )
				self.clipFinished( stroke0, {} )
				line3:completeAnimation()
				self.line3:setAlpha( 0 )
				self.clipFinished( line3, {} )
				glow:completeAnimation()
				self.glow:setAlpha( 0 )
				self.clipFinished( glow, {} )
				Icon0:completeAnimation()
				self.Icon0:setAlpha( 0 )
				self.clipFinished( Icon0, {} )
			end,
			Inactive = function ()
				self:setupElementClipCounter( 20 )
				local PanelDarkenFrame2 = function ( PanelDarken, event )
					local PanelDarkenFrame3 = function ( PanelDarken, event )
						if not event.interrupted then
							PanelDarken:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
						end
						PanelDarken:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( PanelDarken, event )
						else
							PanelDarken:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						PanelDarkenFrame3( PanelDarken, event )
						return 
					else
						PanelDarken:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
						PanelDarken:setAlpha( 0.3 )
						PanelDarken:registerEventHandler( "transition_complete_keyframe", PanelDarkenFrame3 )
					end
				end
				
				PanelDarken:completeAnimation()
				self.PanelDarken:setAlpha( 0 )
				PanelDarkenFrame2( PanelDarken, {} )
				local StrokeInnerFrame2 = function ( StrokeInner, event )
					if not event.interrupted then
						StrokeInner:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					StrokeInner:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( StrokeInner, event )
					else
						StrokeInner:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				StrokeInner:completeAnimation()
				self.StrokeInner:setAlpha( 0.4 )
				StrokeInnerFrame2( StrokeInner, {} )
				local StrokeFrame2 = function ( Stroke, event )
					if not event.interrupted then
						Stroke:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					Stroke:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Stroke, event )
					else
						Stroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Stroke:completeAnimation()
				self.Stroke:setAlpha( 0.4 )
				StrokeFrame2( Stroke, {} )
				local DarkGlowFrame2 = function ( DarkGlow, event )
					if not event.interrupted then
						DarkGlow:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
					end
					DarkGlow:setLeftRight( true, false, -9.18, 75.18 )
					DarkGlow:setTopBottom( true, false, -5.5, 56.5 )
					DarkGlow:setAlpha( 0.3 )
					if event.interrupted then
						self.clipFinished( DarkGlow, event )
					else
						DarkGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DarkGlow:completeAnimation()
				self.DarkGlow:setLeftRight( true, false, -9.18, 75.18 )
				self.DarkGlow:setTopBottom( true, false, -5.5, 56.5 )
				self.DarkGlow:setAlpha( 0 )
				DarkGlowFrame2( DarkGlow, {} )
				innerGlow:completeAnimation()
				self.innerGlow:setLeftRight( true, false, 10, 55 )
				self.innerGlow:setTopBottom( true, false, 11, 42 )
				self.innerGlow:setRGB( 1, 1, 1 )
				self.innerGlow:setAlpha( 0 )
				self.innerGlow:setZoom( 0 )
				self.clipFinished( innerGlow, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					Glow:setRGB( ColorSet.CoreControl.r, ColorSet.CoreControl.g, ColorSet.CoreControl.b )
					Glow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setRGB( ColorSet.CoreControl.r, ColorSet.CoreControl.g, ColorSet.CoreControl.b )
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
				fill:completeAnimation()
				self.fill:setLeftRight( true, false, 4, 61 )
				self.fill:setTopBottom( true, false, 7, 43 )
				self.fill:setRGB( 0.95, 0.58, 0.19 )
				self.fill:setAlpha( 0 )
				self.fill:setZoom( 20 )
				self.clipFinished( fill, {} )
				local ButtonContainerFrame2 = function ( ButtonContainer, event )
					if not event.interrupted then
						ButtonContainer:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						ButtonContainer.ArrowSide:beginAnimation( "subkeyframe", 500, false, false, CoD.TweenType.Linear )
					end
					ButtonContainer:setRGB( 0.51, 0.55, 0.64 )
					ButtonContainer:setAlpha( 0.8 )
					ButtonContainer:setZoom( 0 )
					ButtonContainer.ArrowSide:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ButtonContainer, event )
					else
						ButtonContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ButtonContainer:completeAnimation()
				ButtonContainer.ArrowSide:completeAnimation()
				self.ButtonContainer:setRGB( 0.51, 0.55, 0.64 )
				self.ButtonContainer:setAlpha( 0 )
				self.ButtonContainer:setZoom( 0 )
				self.ButtonContainer.ArrowSide:setAlpha( 0 )
				ButtonContainerFrame2( ButtonContainer, {} )
				local IconDuplicateShadowFrame2 = function ( IconDuplicateShadow, event )
					if not event.interrupted then
						IconDuplicateShadow:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
					end
					IconDuplicateShadow:setLeftRight( false, false, -25.75, 21.25 )
					IconDuplicateShadow:setTopBottom( false, false, -24.5, 21.5 )
					IconDuplicateShadow:setAlpha( 0 )
					IconDuplicateShadow:setZoom( 0 )
					IconDuplicateShadow:setScale( 0.9 )
					IconDuplicateShadow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
					if event.interrupted then
						self.clipFinished( IconDuplicateShadow, event )
					else
						IconDuplicateShadow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				IconDuplicateShadow:completeAnimation()
				self.IconDuplicateShadow:setLeftRight( false, false, -25.75, 21.25 )
				self.IconDuplicateShadow:setTopBottom( false, false, -24.5, 21.5 )
				self.IconDuplicateShadow:setAlpha( 0 )
				self.IconDuplicateShadow:setZoom( 0 )
				self.IconDuplicateShadow:setScale( 0.9 )
				self.IconDuplicateShadow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				IconDuplicateShadowFrame2( IconDuplicateShadow, {} )
				local IconFrame2 = function ( Icon, event )
					if not event.interrupted then
						Icon:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
					end
					Icon:setLeftRight( false, false, -26, 22 )
					Icon:setTopBottom( false, false, -25, 22 )
					Icon:setRGB( 1, 1, 1 )
					Icon:setAlpha( 0.9 )
					Icon:setZoom( 0 )
					Icon:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
					Icon:setShaderVector( 0, 0, 0, 0, 0 )
					if event.interrupted then
						self.clipFinished( Icon, event )
					else
						Icon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Icon:completeAnimation()
				self.Icon:setLeftRight( false, false, -26, 22 )
				self.Icon:setTopBottom( false, false, -25, 22 )
				self.Icon:setRGB( 1, 1, 1 )
				self.Icon:setAlpha( 0 )
				self.Icon:setZoom( 0 )
				self.Icon:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
				self.Icon:setShaderVector( 0, 0, 0, 0, 0 )
				IconFrame2( Icon, {} )
				BarBase:completeAnimation()
				self.BarBase:setAlpha( 0 )
				self.clipFinished( BarBase, {} )
				ScrStkUpArrow:completeAnimation()
				self.ScrStkUpArrow:setLeftRight( true, false, 28, 36 )
				self.ScrStkUpArrow:setTopBottom( true, false, -2, 14 )
				self.ScrStkUpArrow:setRGB( 1, 0.97, 0.35 )
				self.ScrStkUpArrow:setAlpha( 0 )
				self.clipFinished( ScrStkUpArrow, {} )
				ButtonContainer0:completeAnimation()
				self.ButtonContainer0:setRGB( 0.95, 0.58, 0.19 )
				self.ButtonContainer0:setAlpha( 0 )
				self.clipFinished( ButtonContainer0, {} )
				ScrStkDownArrow:completeAnimation()
				self.ScrStkDownArrow:setLeftRight( true, false, 28, 36 )
				self.ScrStkDownArrow:setTopBottom( true, false, 37, 53 )
				self.ScrStkDownArrow:setRGB( 1, 0.97, 0.35 )
				self.ScrStkDownArrow:setAlpha( 0 )
				self.clipFinished( ScrStkDownArrow, {} )
				local IconDuplicateAddFrame2 = function ( IconDuplicateAdd, event )
					if not event.interrupted then
						IconDuplicateAdd:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
					end
					IconDuplicateAdd:setLeftRight( false, false, -26, 22 )
					IconDuplicateAdd:setTopBottom( false, false, -25.5, 22.5 )
					IconDuplicateAdd:setAlpha( 0 )
					IconDuplicateAdd:setZoom( 20 )
					IconDuplicateAdd:setScale( 0.9 )
					if event.interrupted then
						self.clipFinished( IconDuplicateAdd, event )
					else
						IconDuplicateAdd:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				IconDuplicateAdd:completeAnimation()
				self.IconDuplicateAdd:setLeftRight( false, false, -26, 22 )
				self.IconDuplicateAdd:setTopBottom( false, false, -25.5, 22.5 )
				self.IconDuplicateAdd:setAlpha( 0 )
				self.IconDuplicateAdd:setZoom( 20 )
				self.IconDuplicateAdd:setScale( 0.9 )
				IconDuplicateAddFrame2( IconDuplicateAdd, {} )
				stroke:completeAnimation()
				self.stroke:setLeftRight( true, false, 4, 61 )
				self.stroke:setTopBottom( true, false, 7, 44 )
				self.stroke:setRGB( 1, 0.97, 0.35 )
				self.stroke:setAlpha( 0 )
				self.stroke:setZoom( 20 )
				self.clipFinished( stroke, {} )
				stroke0:completeAnimation()
				self.stroke0:setAlpha( 0 )
				self.stroke0:setZoom( 20 )
				self.clipFinished( stroke0, {} )
				local line3Frame2 = function ( line3, event )
					if not event.interrupted then
						line3:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
					end
					line3:setLeftRight( true, false, 2, 63.17 )
					line3:setTopBottom( true, false, 5, 46 )
					line3:setRGB( 0.95, 0.58, 0.19 )
					line3:setAlpha( 0 )
					line3:setZoom( 20 )
					if event.interrupted then
						self.clipFinished( line3, event )
					else
						line3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				line3:completeAnimation()
				self.line3:setLeftRight( true, false, 2, 63.17 )
				self.line3:setTopBottom( true, false, 5, 46 )
				self.line3:setRGB( 0.95, 0.58, 0.19 )
				self.line3:setAlpha( 0 )
				self.line3:setZoom( 20 )
				line3Frame2( line3, {} )
				local glowFrame2 = function ( glow, event )
					if not event.interrupted then
						glow:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
					end
					glow:setLeftRight( true, false, 2, 65.58 )
					glow:setTopBottom( true, false, 5, 45.88 )
					glow:setRGB( 1, 1, 1 )
					glow:setAlpha( 0 )
					glow:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( glow, event )
					else
						glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				glow:completeAnimation()
				self.glow:setLeftRight( true, false, 2, 65.58 )
				self.glow:setTopBottom( true, false, 5, 45.88 )
				self.glow:setRGB( 1, 1, 1 )
				self.glow:setAlpha( 0 )
				self.glow:setZoom( 0 )
				glowFrame2( glow, {} )
				local Icon0Frame2 = function ( Icon0, event )
					if not event.interrupted then
						Icon0:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
					end
					Icon0:setAlpha( 0 )
					Icon0:setZoom( 20 )
					if event.interrupted then
						self.clipFinished( Icon0, event )
					else
						Icon0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Icon0:completeAnimation()
				self.Icon0:setAlpha( 0 )
				self.Icon0:setZoom( 20 )
				Icon0Frame2( Icon0, {} )
			end
		},
		Inactive = {
			DefaultClip = function ()
				self:setupElementClipCounter( 20 )
				PanelDarken:completeAnimation()
				self.PanelDarken:setAlpha( 0 )
				self.clipFinished( PanelDarken, {} )
				StrokeInner:completeAnimation()
				self.StrokeInner:setAlpha( 0 )
				self.clipFinished( StrokeInner, {} )
				Stroke:completeAnimation()
				self.Stroke:setAlpha( 0 )
				self.clipFinished( Stroke, {} )
				DarkGlow:completeAnimation()
				self.DarkGlow:setLeftRight( true, false, -9.18, 75.18 )
				self.DarkGlow:setTopBottom( true, false, -5.5, 56.5 )
				self.DarkGlow:setAlpha( 0.3 )
				self.clipFinished( DarkGlow, {} )
				innerGlow:completeAnimation()
				self.innerGlow:setLeftRight( true, false, 10, 55 )
				self.innerGlow:setTopBottom( true, false, 11, 42 )
				self.innerGlow:setRGB( 1, 1, 1 )
				self.innerGlow:setAlpha( 0 )
				self.innerGlow:setZoom( 0 )
				self.clipFinished( innerGlow, {} )
				Glow:completeAnimation()
				self.Glow:setRGB( ColorSet.CoreControl.r, ColorSet.CoreControl.g, ColorSet.CoreControl.b )
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
				fill:completeAnimation()
				self.fill:setLeftRight( true, false, 4, 61 )
				self.fill:setTopBottom( true, false, 7, 43 )
				self.fill:setRGB( 0.95, 0.58, 0.19 )
				self.fill:setAlpha( 0 )
				self.fill:setZoom( 20 )
				self.clipFinished( fill, {} )
				ButtonContainer:completeAnimation()
				ButtonContainer.ArrowSide:completeAnimation()
				self.ButtonContainer:setRGB( 0.51, 0.55, 0.64 )
				self.ButtonContainer:setAlpha( 0.8 )
				self.ButtonContainer:setZoom( 0 )
				self.ButtonContainer.ArrowSide:setAlpha( 0 )
				self.clipFinished( ButtonContainer, {} )
				IconDuplicateShadow:completeAnimation()
				self.IconDuplicateShadow:setLeftRight( false, false, -25.75, 21.25 )
				self.IconDuplicateShadow:setTopBottom( false, false, -24.5, 21.5 )
				self.IconDuplicateShadow:setAlpha( 0 )
				self.IconDuplicateShadow:setZoom( 0 )
				self.IconDuplicateShadow:setScale( 0.9 )
				self.IconDuplicateShadow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				self.clipFinished( IconDuplicateShadow, {} )
				Icon:completeAnimation()
				self.Icon:setLeftRight( false, false, -26, 22 )
				self.Icon:setTopBottom( false, false, -25, 22 )
				self.Icon:setRGB( 1, 1, 1 )
				self.Icon:setAlpha( 0.9 )
				self.Icon:setZoom( 0 )
				self.Icon:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
				self.Icon:setShaderVector( 0, 0, 0, 0, 0 )
				self.clipFinished( Icon, {} )
				BarBase:completeAnimation()
				self.BarBase:setAlpha( 0 )
				self.clipFinished( BarBase, {} )
				ScrStkUpArrow:completeAnimation()
				self.ScrStkUpArrow:setLeftRight( true, false, 28, 36 )
				self.ScrStkUpArrow:setTopBottom( true, false, -2, 14 )
				self.ScrStkUpArrow:setRGB( 1, 0.97, 0.35 )
				self.ScrStkUpArrow:setAlpha( 0 )
				self.clipFinished( ScrStkUpArrow, {} )
				ButtonContainer0:completeAnimation()
				self.ButtonContainer0:setRGB( 0.95, 0.58, 0.19 )
				self.ButtonContainer0:setAlpha( 0 )
				self.clipFinished( ButtonContainer0, {} )
				ScrStkDownArrow:completeAnimation()
				self.ScrStkDownArrow:setLeftRight( true, false, 28, 36 )
				self.ScrStkDownArrow:setTopBottom( true, false, 37, 53 )
				self.ScrStkDownArrow:setRGB( 1, 0.97, 0.35 )
				self.ScrStkDownArrow:setAlpha( 0 )
				self.clipFinished( ScrStkDownArrow, {} )
				IconDuplicateAdd:completeAnimation()
				self.IconDuplicateAdd:setLeftRight( false, false, -26, 22 )
				self.IconDuplicateAdd:setTopBottom( false, false, -25.5, 22.5 )
				self.IconDuplicateAdd:setAlpha( 0 )
				self.IconDuplicateAdd:setZoom( 20 )
				self.IconDuplicateAdd:setScale( 0.9 )
				self.clipFinished( IconDuplicateAdd, {} )
				stroke:completeAnimation()
				self.stroke:setLeftRight( true, false, 4, 61 )
				self.stroke:setTopBottom( true, false, 7, 44 )
				self.stroke:setRGB( 1, 0.97, 0.35 )
				self.stroke:setAlpha( 0 )
				self.stroke:setZoom( 20 )
				self.clipFinished( stroke, {} )
				stroke0:completeAnimation()
				self.stroke0:setAlpha( 0 )
				self.stroke0:setZoom( 20 )
				self.clipFinished( stroke0, {} )
				line3:completeAnimation()
				self.line3:setLeftRight( true, false, 2, 63.17 )
				self.line3:setTopBottom( true, false, 5, 46 )
				self.line3:setRGB( 0.95, 0.58, 0.19 )
				self.line3:setAlpha( 0 )
				self.line3:setZoom( 20 )
				self.clipFinished( line3, {} )
				glow:completeAnimation()
				self.glow:setLeftRight( true, false, 2, 65.58 )
				self.glow:setTopBottom( true, false, 5, 45.88 )
				self.glow:setRGB( 1, 1, 1 )
				self.glow:setAlpha( 0 )
				self.glow:setZoom( 0 )
				self.clipFinished( glow, {} )
				Icon0:completeAnimation()
				self.Icon0:setAlpha( 0 )
				self.Icon0:setZoom( 20 )
				self.clipFinished( Icon0, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 16 )
				local PanelDarkenFrame2 = function ( PanelDarken, event )
					if not event.interrupted then
						PanelDarken:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
					end
					PanelDarken:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PanelDarken, event )
					else
						PanelDarken:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PanelDarken:completeAnimation()
				self.PanelDarken:setAlpha( 0.3 )
				PanelDarkenFrame2( PanelDarken, {} )
				local StrokeInnerFrame2 = function ( StrokeInner, event )
					if not event.interrupted then
						StrokeInner:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					StrokeInner:setAlpha( 0.4 )
					if event.interrupted then
						self.clipFinished( StrokeInner, event )
					else
						StrokeInner:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				StrokeInner:completeAnimation()
				self.StrokeInner:setAlpha( 0 )
				StrokeInnerFrame2( StrokeInner, {} )
				local StrokeFrame2 = function ( Stroke, event )
					if not event.interrupted then
						Stroke:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					Stroke:setAlpha( 0.4 )
					if event.interrupted then
						self.clipFinished( Stroke, event )
					else
						Stroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Stroke:completeAnimation()
				self.Stroke:setAlpha( 0 )
				StrokeFrame2( Stroke, {} )
				local DarkGlowFrame2 = function ( DarkGlow, event )
					if not event.interrupted then
						DarkGlow:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					DarkGlow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( DarkGlow, event )
					else
						DarkGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DarkGlow:completeAnimation()
				self.DarkGlow:setAlpha( 0.3 )
				DarkGlowFrame2( DarkGlow, {} )
				innerGlow:completeAnimation()
				self.innerGlow:setAlpha( 0 )
				self.clipFinished( innerGlow, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					Glow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
				local ButtonContainerFrame2 = function ( ButtonContainer, event )
					if not event.interrupted then
						ButtonContainer:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						ButtonContainer.ArrowSide:beginAnimation( "subkeyframe", 500, false, false, CoD.TweenType.Linear )
					end
					ButtonContainer:setRGB( 0.51, 0.55, 0.64 )
					ButtonContainer:setAlpha( 0 )
					ButtonContainer:setZoom( 0 )
					ButtonContainer.ArrowSide:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ButtonContainer, event )
					else
						ButtonContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ButtonContainer:completeAnimation()
				ButtonContainer.ArrowSide:completeAnimation()
				self.ButtonContainer:setRGB( 0.51, 0.55, 0.64 )
				self.ButtonContainer:setAlpha( 0.8 )
				self.ButtonContainer:setZoom( 0 )
				self.ButtonContainer.ArrowSide:setAlpha( 0 )
				ButtonContainerFrame2( ButtonContainer, {} )
				local IconDuplicateShadowFrame2 = function ( IconDuplicateShadow, event )
					if not event.interrupted then
						IconDuplicateShadow:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
					end
					IconDuplicateShadow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( IconDuplicateShadow, event )
					else
						IconDuplicateShadow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				IconDuplicateShadow:completeAnimation()
				self.IconDuplicateShadow:setAlpha( 0 )
				IconDuplicateShadowFrame2( IconDuplicateShadow, {} )
				local IconFrame2 = function ( Icon, event )
					if not event.interrupted then
						Icon:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					Icon:setLeftRight( false, false, -26, 22 )
					Icon:setTopBottom( false, false, -25, 22 )
					Icon:setRGB( 1, 1, 1 )
					Icon:setAlpha( 0 )
					Icon:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
					Icon:setShaderVector( 0, 0, 0, 0, 0 )
					if event.interrupted then
						self.clipFinished( Icon, event )
					else
						Icon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Icon:completeAnimation()
				self.Icon:setLeftRight( false, false, -26, 22 )
				self.Icon:setTopBottom( false, false, -25, 22 )
				self.Icon:setRGB( 1, 1, 1 )
				self.Icon:setAlpha( 0.6 )
				self.Icon:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
				self.Icon:setShaderVector( 0, 0, 0, 0, 0 )
				IconFrame2( Icon, {} )
				local BarBaseFrame2 = function ( BarBase, event )
					if not event.interrupted then
						BarBase:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
					end
					BarBase:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( BarBase, event )
					else
						BarBase:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BarBase:completeAnimation()
				self.BarBase:setAlpha( 0 )
				BarBaseFrame2( BarBase, {} )
				IconDuplicateAdd:completeAnimation()
				self.IconDuplicateAdd:setAlpha( 0 )
				self.clipFinished( IconDuplicateAdd, {} )
				stroke:completeAnimation()
				self.stroke:setAlpha( 0 )
				self.clipFinished( stroke, {} )
				stroke0:completeAnimation()
				self.stroke0:setAlpha( 0 )
				self.clipFinished( stroke0, {} )
				line3:completeAnimation()
				self.line3:setAlpha( 0 )
				self.clipFinished( line3, {} )
				glow:completeAnimation()
				self.glow:setAlpha( 0 )
				self.clipFinished( glow, {} )
				Icon0:completeAnimation()
				self.Icon0:setAlpha( 0 )
				self.clipFinished( Icon0, {} )
			end,
			ReadyMiddle = function ()
				self:setupElementClipCounter( 14 )
				PanelDarken:completeAnimation()
				self.PanelDarken:setAlpha( 0.3 )
				self.clipFinished( PanelDarken, {} )
				local StrokeInnerFrame2 = function ( StrokeInner, event )
					if not event.interrupted then
						StrokeInner:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Bounce )
					end
					StrokeInner:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( StrokeInner, event )
					else
						StrokeInner:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				StrokeInner:completeAnimation()
				self.StrokeInner:setAlpha( 0 )
				StrokeInnerFrame2( StrokeInner, {} )
				Stroke:completeAnimation()
				self.Stroke:setAlpha( 0 )
				self.clipFinished( Stroke, {} )
				local DarkGlowFrame2 = function ( DarkGlow, event )
					if not event.interrupted then
						DarkGlow:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
					end
					DarkGlow:setAlpha( 0.4 )
					if event.interrupted then
						self.clipFinished( DarkGlow, event )
					else
						DarkGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DarkGlow:completeAnimation()
				self.DarkGlow:setAlpha( 0.3 )
				DarkGlowFrame2( DarkGlow, {} )
				innerGlow:completeAnimation()
				self.innerGlow:setAlpha( 0 )
				self.clipFinished( innerGlow, {} )
				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						local GlowFrame4 = function ( Glow, event )
							local GlowFrame5 = function ( Glow, event )
								local GlowFrame6 = function ( Glow, event )
									local GlowFrame7 = function ( Glow, event )
										local GlowFrame8 = function ( Glow, event )
											local GlowFrame9 = function ( Glow, event )
												local GlowFrame10 = function ( Glow, event )
													local GlowFrame11 = function ( Glow, event )
														if not event.interrupted then
															Glow:beginAnimation( "keyframe", 249, false, false, CoD.TweenType.Linear )
														end
														Glow:setRGB( 1, 0.27, 0 )
														Glow:setAlpha( 0 )
														if event.interrupted then
															self.clipFinished( Glow, event )
														else
															Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														GlowFrame11( Glow, event )
														return 
													else
														Glow:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														Glow:setRGB( 0.98, 0.74, 0 )
														Glow:setAlpha( 1 )
														Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame11 )
													end
												end
												
												if event.interrupted then
													GlowFrame10( Glow, event )
													return 
												else
													Glow:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													Glow:setRGB( 0.98, 0.76, 0 )
													Glow:setAlpha( 0.5 )
													Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame10 )
												end
											end
											
											if event.interrupted then
												GlowFrame9( Glow, event )
												return 
											else
												Glow:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												Glow:setRGB( 0.98, 0.79, 0 )
												Glow:setAlpha( 0.54 )
												Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame9 )
											end
										end
										
										if event.interrupted then
											GlowFrame8( Glow, event )
											return 
										else
											Glow:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											Glow:setRGB( 0.98, 0.81, 0 )
											Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame8 )
										end
									end
									
									if event.interrupted then
										GlowFrame7( Glow, event )
										return 
									else
										Glow:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										Glow:setRGB( 0.97, 0.87, 0 )
										Glow:setAlpha( 1 )
										Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame7 )
									end
								end
								
								if event.interrupted then
									GlowFrame6( Glow, event )
									return 
								else
									Glow:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									Glow:setRGB( 0.97, 0.89, 0 )
									Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame6 )
								end
							end
							
							if event.interrupted then
								GlowFrame5( Glow, event )
								return 
							else
								Glow:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								Glow:setRGB( 0.97, 0.93, 0 )
								Glow:setAlpha( 0 )
								Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame5 )
							end
						end
						
						if event.interrupted then
							GlowFrame4( Glow, event )
							return 
						else
							Glow:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							Glow:setRGB( 0.97, 0.94, 0 )
							Glow:setAlpha( 0.95 )
							Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame4 )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						Glow:setRGB( 0.97, 0.98, 0 )
						Glow:setAlpha( 1 )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setRGB( 0.97, 1, 0 )
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
				local ButtonContainerFrame2 = function ( ButtonContainer, event )
					if not event.interrupted then
						ButtonContainer:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Bounce )
						ButtonContainer.ArrowSide:beginAnimation( "subkeyframe", 180, false, false, CoD.TweenType.Bounce )
					end
					ButtonContainer:setRGB( 1, 0.97, 0.35 )
					ButtonContainer:setAlpha( 1 )
					ButtonContainer:setZoom( 0 )
					ButtonContainer.ArrowSide:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ButtonContainer, event )
					else
						ButtonContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ButtonContainer:completeAnimation()
				ButtonContainer.ArrowSide:completeAnimation()
				self.ButtonContainer:setRGB( 0.51, 0.55, 0.64 )
				self.ButtonContainer:setAlpha( 0.8 )
				self.ButtonContainer:setZoom( 0 )
				self.ButtonContainer.ArrowSide:setAlpha( 0 )
				ButtonContainerFrame2( ButtonContainer, {} )
				local IconDuplicateShadowFrame2 = function ( IconDuplicateShadow, event )
					local IconDuplicateShadowFrame3 = function ( IconDuplicateShadow, event )
						if not event.interrupted then
							IconDuplicateShadow:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						end
						IconDuplicateShadow:setAlpha( 0.4 )
						IconDuplicateShadow:setZoom( 0 )
						if event.interrupted then
							self.clipFinished( IconDuplicateShadow, event )
						else
							IconDuplicateShadow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						IconDuplicateShadowFrame3( IconDuplicateShadow, event )
						return 
					else
						IconDuplicateShadow:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						IconDuplicateShadow:setAlpha( 1 )
						IconDuplicateShadow:registerEventHandler( "transition_complete_keyframe", IconDuplicateShadowFrame3 )
					end
				end
				
				IconDuplicateShadow:completeAnimation()
				self.IconDuplicateShadow:setAlpha( 0 )
				self.IconDuplicateShadow:setZoom( 0 )
				IconDuplicateShadowFrame2( IconDuplicateShadow, {} )
				local IconFrame2 = function ( Icon, event )
					local IconFrame3 = function ( Icon, event )
						if not event.interrupted then
							Icon:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Bounce )
						end
						Icon:setRGB( 1, 1, 1 )
						Icon:setAlpha( 0.9 )
						Icon:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
						Icon:setShaderVector( 0, 1, 0, 0, 0 )
						if event.interrupted then
							self.clipFinished( Icon, event )
						else
							Icon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						IconFrame3( Icon, event )
						return 
					else
						Icon:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						Icon:setShaderVector( 0, 1, 0, 0, 0 )
						Icon:registerEventHandler( "transition_complete_keyframe", IconFrame3 )
					end
				end
				
				Icon:completeAnimation()
				self.Icon:setRGB( 1, 1, 1 )
				self.Icon:setAlpha( 0.9 )
				self.Icon:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
				self.Icon:setShaderVector( 0, 0, 0, 0, 0 )
				IconFrame2( Icon, {} )
				local BarBaseFrame2 = function ( BarBase, event )
					if not event.interrupted then
						BarBase:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
					end
					BarBase:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( BarBase, event )
					else
						BarBase:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BarBase:completeAnimation()
				self.BarBase:setAlpha( 0 )
				BarBaseFrame2( BarBase, {} )
				stroke:completeAnimation()
				self.stroke:setAlpha( 0 )
				self.clipFinished( stroke, {} )
				line3:completeAnimation()
				self.line3:setAlpha( 0 )
				self.clipFinished( line3, {} )
				glow:completeAnimation()
				self.glow:setAlpha( 0 )
				self.clipFinished( glow, {} )
				Icon0:completeAnimation()
				self.Icon0:setAlpha( 0 )
				self.clipFinished( Icon0, {} )
			end
		},
		Charging = {
			DefaultClip = function ()
				self:setupElementClipCounter( 20 )
				PanelDarken:completeAnimation()
				self.PanelDarken:setAlpha( 0.3 )
				self.clipFinished( PanelDarken, {} )
				StrokeInner:completeAnimation()
				self.StrokeInner:setAlpha( 0 )
				self.clipFinished( StrokeInner, {} )
				Stroke:completeAnimation()
				self.Stroke:setAlpha( 0 )
				self.clipFinished( Stroke, {} )
				DarkGlow:completeAnimation()
				self.DarkGlow:setLeftRight( true, false, -9.18, 75.18 )
				self.DarkGlow:setTopBottom( true, false, -5.5, 56.5 )
				self.DarkGlow:setAlpha( 0.3 )
				self.clipFinished( DarkGlow, {} )
				innerGlow:completeAnimation()
				self.innerGlow:setLeftRight( true, false, 10, 55 )
				self.innerGlow:setTopBottom( true, false, 11, 42 )
				self.innerGlow:setRGB( 1, 1, 1 )
				self.innerGlow:setAlpha( 0 )
				self.innerGlow:setZoom( 0 )
				self.clipFinished( innerGlow, {} )
				Glow:completeAnimation()
				self.Glow:setRGB( ColorSet.CoreControl.r, ColorSet.CoreControl.g, ColorSet.CoreControl.b )
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
				fill:completeAnimation()
				self.fill:setLeftRight( true, false, 4, 61 )
				self.fill:setTopBottom( true, false, 7, 43 )
				self.fill:setRGB( 0.95, 0.58, 0.19 )
				self.fill:setAlpha( 0 )
				self.fill:setZoom( 20 )
				self.clipFinished( fill, {} )
				ButtonContainer:completeAnimation()
				ButtonContainer.ArrowSide:completeAnimation()
				self.ButtonContainer:setRGB( 0.51, 0.55, 0.64 )
				self.ButtonContainer:setAlpha( 0.8 )
				self.ButtonContainer:setZoom( 0 )
				self.ButtonContainer.ArrowSide:setAlpha( 0 )
				self.clipFinished( ButtonContainer, {} )
				IconDuplicateShadow:completeAnimation()
				self.IconDuplicateShadow:setLeftRight( false, false, -25.75, 21.25 )
				self.IconDuplicateShadow:setTopBottom( false, false, -24.5, 21.5 )
				self.IconDuplicateShadow:setAlpha( 0 )
				self.IconDuplicateShadow:setZoom( 20 )
				self.IconDuplicateShadow:setScale( 0.9 )
				self.IconDuplicateShadow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				self.clipFinished( IconDuplicateShadow, {} )
				Icon:completeAnimation()
				self.Icon:setLeftRight( false, false, -26, 22 )
				self.Icon:setTopBottom( false, false, -25, 22 )
				self.Icon:setRGB( 1, 1, 1 )
				self.Icon:setAlpha( 0.9 )
				self.Icon:setZoom( 0 )
				self.Icon:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
				self.Icon:setShaderVector( 0, 0, 0, 0, 0 )
				self.clipFinished( Icon, {} )
				BarBase:completeAnimation()
				self.BarBase:setAlpha( 0.7 )
				self.clipFinished( BarBase, {} )
				ScrStkUpArrow:completeAnimation()
				self.ScrStkUpArrow:setLeftRight( true, false, 28, 36 )
				self.ScrStkUpArrow:setTopBottom( true, false, -2, 14 )
				self.ScrStkUpArrow:setRGB( 1, 0.97, 0.35 )
				self.ScrStkUpArrow:setAlpha( 0 )
				self.clipFinished( ScrStkUpArrow, {} )
				ButtonContainer0:completeAnimation()
				self.ButtonContainer0:setRGB( 1, 0.97, 0.35 )
				self.ButtonContainer0:setAlpha( 0 )
				self.clipFinished( ButtonContainer0, {} )
				ScrStkDownArrow:completeAnimation()
				self.ScrStkDownArrow:setLeftRight( true, false, 28, 36 )
				self.ScrStkDownArrow:setTopBottom( true, false, 37, 53 )
				self.ScrStkDownArrow:setRGB( 1, 0.97, 0.35 )
				self.ScrStkDownArrow:setAlpha( 0 )
				self.clipFinished( ScrStkDownArrow, {} )
				IconDuplicateAdd:completeAnimation()
				self.IconDuplicateAdd:setLeftRight( false, false, -26, 22 )
				self.IconDuplicateAdd:setTopBottom( false, false, -25.5, 22.5 )
				self.IconDuplicateAdd:setAlpha( 0 )
				self.IconDuplicateAdd:setZoom( 20 )
				self.IconDuplicateAdd:setScale( 0.9 )
				self.clipFinished( IconDuplicateAdd, {} )
				stroke:completeAnimation()
				self.stroke:setLeftRight( true, false, 4, 61 )
				self.stroke:setTopBottom( true, false, 7, 44 )
				self.stroke:setRGB( 1, 0.97, 0.35 )
				self.stroke:setAlpha( 0 )
				self.stroke:setZoom( 20 )
				self.clipFinished( stroke, {} )
				stroke0:completeAnimation()
				self.stroke0:setAlpha( 0 )
				self.stroke0:setZoom( 20 )
				self.clipFinished( stroke0, {} )
				line3:completeAnimation()
				self.line3:setLeftRight( true, false, 2, 63.17 )
				self.line3:setTopBottom( true, false, 5, 46 )
				self.line3:setRGB( 0.95, 0.58, 0.19 )
				self.line3:setAlpha( 0 )
				self.line3:setZoom( 20 )
				self.clipFinished( line3, {} )
				glow:completeAnimation()
				self.glow:setLeftRight( true, false, 2, 65.58 )
				self.glow:setTopBottom( true, false, 5, 45.88 )
				self.glow:setRGB( 1, 1, 1 )
				self.glow:setAlpha( 0 )
				self.glow:setZoom( 0 )
				self.clipFinished( glow, {} )
				Icon0:completeAnimation()
				self.Icon0:setAlpha( 0 )
				self.Icon0:setZoom( 20 )
				self.clipFinished( Icon0, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 20 )
				local PanelDarkenFrame2 = function ( PanelDarken, event )
					if not event.interrupted then
						PanelDarken:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
					end
					PanelDarken:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PanelDarken, event )
					else
						PanelDarken:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PanelDarken:completeAnimation()
				self.PanelDarken:setAlpha( 0.3 )
				PanelDarkenFrame2( PanelDarken, {} )
				local StrokeInnerFrame2 = function ( StrokeInner, event )
					if not event.interrupted then
						StrokeInner:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					StrokeInner:setAlpha( 0.2 )
					if event.interrupted then
						self.clipFinished( StrokeInner, event )
					else
						StrokeInner:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				StrokeInner:completeAnimation()
				self.StrokeInner:setAlpha( 0 )
				StrokeInnerFrame2( StrokeInner, {} )
				local StrokeFrame2 = function ( Stroke, event )
					if not event.interrupted then
						Stroke:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					Stroke:setAlpha( 0.2 )
					if event.interrupted then
						self.clipFinished( Stroke, event )
					else
						Stroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Stroke:completeAnimation()
				self.Stroke:setAlpha( 0 )
				StrokeFrame2( Stroke, {} )
				local DarkGlowFrame2 = function ( DarkGlow, event )
					if not event.interrupted then
						DarkGlow:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					DarkGlow:setLeftRight( true, false, -9.18, 75.18 )
					DarkGlow:setTopBottom( true, false, -5.5, 56.5 )
					DarkGlow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( DarkGlow, event )
					else
						DarkGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DarkGlow:completeAnimation()
				self.DarkGlow:setLeftRight( true, false, -9.18, 75.18 )
				self.DarkGlow:setTopBottom( true, false, -5.5, 56.5 )
				self.DarkGlow:setAlpha( 0.3 )
				DarkGlowFrame2( DarkGlow, {} )
				innerGlow:completeAnimation()
				self.innerGlow:setLeftRight( true, false, 10, 55 )
				self.innerGlow:setTopBottom( true, false, 11, 42 )
				self.innerGlow:setRGB( 1, 1, 1 )
				self.innerGlow:setAlpha( 0 )
				self.innerGlow:setZoom( 0 )
				self.clipFinished( innerGlow, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					Glow:setRGB( ColorSet.CoreControl.r, ColorSet.CoreControl.g, ColorSet.CoreControl.b )
					Glow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setRGB( ColorSet.CoreControl.r, ColorSet.CoreControl.g, ColorSet.CoreControl.b )
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
				fill:completeAnimation()
				self.fill:setLeftRight( true, false, 4, 61 )
				self.fill:setTopBottom( true, false, 7, 43 )
				self.fill:setRGB( 0.95, 0.58, 0.19 )
				self.fill:setAlpha( 0 )
				self.fill:setZoom( 20 )
				self.clipFinished( fill, {} )
				local ButtonContainerFrame2 = function ( ButtonContainer, event )
					if not event.interrupted then
						ButtonContainer:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						ButtonContainer.ArrowSide:beginAnimation( "subkeyframe", 500, false, false, CoD.TweenType.Linear )
					end
					ButtonContainer:setRGB( 0.51, 0.55, 0.64 )
					ButtonContainer:setAlpha( 0 )
					ButtonContainer:setZoom( 0 )
					ButtonContainer.ArrowSide:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ButtonContainer, event )
					else
						ButtonContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ButtonContainer:completeAnimation()
				ButtonContainer.ArrowSide:completeAnimation()
				self.ButtonContainer:setRGB( 0.51, 0.55, 0.64 )
				self.ButtonContainer:setAlpha( 0.8 )
				self.ButtonContainer:setZoom( 0 )
				self.ButtonContainer.ArrowSide:setAlpha( 0 )
				ButtonContainerFrame2( ButtonContainer, {} )
				local IconDuplicateShadowFrame2 = function ( IconDuplicateShadow, event )
					if not event.interrupted then
						IconDuplicateShadow:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Linear )
					end
					IconDuplicateShadow:setLeftRight( false, false, -25.75, 21.25 )
					IconDuplicateShadow:setTopBottom( false, false, -24.5, 21.5 )
					IconDuplicateShadow:setAlpha( 0 )
					IconDuplicateShadow:setZoom( 20 )
					IconDuplicateShadow:setScale( 0.9 )
					IconDuplicateShadow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
					if event.interrupted then
						self.clipFinished( IconDuplicateShadow, event )
					else
						IconDuplicateShadow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				IconDuplicateShadow:completeAnimation()
				self.IconDuplicateShadow:setLeftRight( false, false, -25.75, 21.25 )
				self.IconDuplicateShadow:setTopBottom( false, false, -24.5, 21.5 )
				self.IconDuplicateShadow:setAlpha( 0 )
				self.IconDuplicateShadow:setZoom( 20 )
				self.IconDuplicateShadow:setScale( 0.9 )
				self.IconDuplicateShadow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				IconDuplicateShadowFrame2( IconDuplicateShadow, {} )
				local IconFrame2 = function ( Icon, event )
					local IconFrame3 = function ( Icon, event )
						if not event.interrupted then
							Icon:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
						end
						Icon:setLeftRight( false, false, -26, 22 )
						Icon:setTopBottom( false, false, -25, 22 )
						Icon:setRGB( 1, 1, 1 )
						Icon:setAlpha( 0 )
						Icon:setZoom( 0 )
						Icon:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
						Icon:setShaderVector( 0, 1, 0, 0, 0 )
						if event.interrupted then
							self.clipFinished( Icon, event )
						else
							Icon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						IconFrame3( Icon, event )
						return 
					else
						Icon:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						Icon:setAlpha( 0.79 )
						Icon:registerEventHandler( "transition_complete_keyframe", IconFrame3 )
					end
				end
				
				Icon:completeAnimation()
				self.Icon:setLeftRight( false, false, -26, 22 )
				self.Icon:setTopBottom( false, false, -25, 22 )
				self.Icon:setRGB( 1, 1, 1 )
				self.Icon:setAlpha( 0.9 )
				self.Icon:setZoom( 0 )
				self.Icon:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
				self.Icon:setShaderVector( 0, 0, 0, 0, 0 )
				IconFrame2( Icon, {} )
				local BarBaseFrame2 = function ( BarBase, event )
					if not event.interrupted then
						BarBase:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
					end
					BarBase:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( BarBase, event )
					else
						BarBase:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BarBase:completeAnimation()
				self.BarBase:setAlpha( 0.7 )
				BarBaseFrame2( BarBase, {} )
				ScrStkUpArrow:completeAnimation()
				self.ScrStkUpArrow:setLeftRight( true, false, 28, 36 )
				self.ScrStkUpArrow:setTopBottom( true, false, -2, 14 )
				self.ScrStkUpArrow:setRGB( 1, 0.97, 0.35 )
				self.ScrStkUpArrow:setAlpha( 0 )
				self.clipFinished( ScrStkUpArrow, {} )
				ButtonContainer0:completeAnimation()
				self.ButtonContainer0:setRGB( 1, 0.97, 0.35 )
				self.ButtonContainer0:setAlpha( 0 )
				self.clipFinished( ButtonContainer0, {} )
				ScrStkDownArrow:completeAnimation()
				self.ScrStkDownArrow:setLeftRight( true, false, 28, 36 )
				self.ScrStkDownArrow:setTopBottom( true, false, 37, 53 )
				self.ScrStkDownArrow:setRGB( 1, 0.97, 0.35 )
				self.ScrStkDownArrow:setAlpha( 0 )
				self.clipFinished( ScrStkDownArrow, {} )
				IconDuplicateAdd:completeAnimation()
				self.IconDuplicateAdd:setLeftRight( false, false, -26, 22 )
				self.IconDuplicateAdd:setTopBottom( false, false, -25.5, 22.5 )
				self.IconDuplicateAdd:setAlpha( 0 )
				self.IconDuplicateAdd:setZoom( 20 )
				self.IconDuplicateAdd:setScale( 0.9 )
				self.clipFinished( IconDuplicateAdd, {} )
				stroke:completeAnimation()
				self.stroke:setLeftRight( true, false, 4, 61 )
				self.stroke:setTopBottom( true, false, 7, 44 )
				self.stroke:setRGB( 1, 0.97, 0.35 )
				self.stroke:setAlpha( 0 )
				self.stroke:setZoom( 20 )
				self.clipFinished( stroke, {} )
				stroke0:completeAnimation()
				self.stroke0:setAlpha( 0 )
				self.stroke0:setZoom( 20 )
				self.clipFinished( stroke0, {} )
				line3:completeAnimation()
				self.line3:setLeftRight( true, false, 2, 63.17 )
				self.line3:setTopBottom( true, false, 5, 46 )
				self.line3:setRGB( 0.95, 0.58, 0.19 )
				self.line3:setAlpha( 0 )
				self.line3:setZoom( 20 )
				self.clipFinished( line3, {} )
				glow:completeAnimation()
				self.glow:setLeftRight( true, false, 2, 65.58 )
				self.glow:setTopBottom( true, false, 5, 45.88 )
				self.glow:setRGB( 1, 1, 1 )
				self.glow:setAlpha( 0 )
				self.glow:setZoom( 0 )
				self.clipFinished( glow, {} )
				Icon0:completeAnimation()
				self.Icon0:setAlpha( 0 )
				self.Icon0:setZoom( 20 )
				self.clipFinished( Icon0, {} )
			end,
			ReadyMiddle = function ()
				self:setupElementClipCounter( 20 )
				PanelDarken:completeAnimation()
				self.PanelDarken:setAlpha( 0 )
				self.clipFinished( PanelDarken, {} )
				local StrokeInnerFrame2 = function ( StrokeInner, event )
					if not event.interrupted then
						StrokeInner:beginAnimation( "keyframe", 180, false, true, CoD.TweenType.Bounce )
					end
					StrokeInner:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( StrokeInner, event )
					else
						StrokeInner:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				StrokeInner:completeAnimation()
				self.StrokeInner:setAlpha( 0 )
				StrokeInnerFrame2( StrokeInner, {} )
				Stroke:completeAnimation()
				self.Stroke:setAlpha( 0 )
				self.clipFinished( Stroke, {} )
				local DarkGlowFrame2 = function ( DarkGlow, event )
					if not event.interrupted then
						DarkGlow:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
					end
					DarkGlow:setLeftRight( true, false, -7.82, 72.46 )
					DarkGlow:setTopBottom( true, false, -3.5, 55.5 )
					DarkGlow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( DarkGlow, event )
					else
						DarkGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DarkGlow:completeAnimation()
				self.DarkGlow:setLeftRight( true, false, -7.82, 72.46 )
				self.DarkGlow:setTopBottom( true, false, -3.5, 55.5 )
				self.DarkGlow:setAlpha( 0.3 )
				DarkGlowFrame2( DarkGlow, {} )
				innerGlow:completeAnimation()
				self.innerGlow:setLeftRight( true, false, 10, 55 )
				self.innerGlow:setTopBottom( true, false, 11, 42 )
				self.innerGlow:setRGB( 1, 1, 1 )
				self.innerGlow:setAlpha( 0 )
				self.innerGlow:setZoom( 0 )
				self.clipFinished( innerGlow, {} )
				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						local GlowFrame4 = function ( Glow, event )
							local GlowFrame5 = function ( Glow, event )
								local GlowFrame6 = function ( Glow, event )
									local GlowFrame7 = function ( Glow, event )
										local GlowFrame8 = function ( Glow, event )
											local GlowFrame9 = function ( Glow, event )
												local GlowFrame10 = function ( Glow, event )
													local GlowFrame11 = function ( Glow, event )
														if not event.interrupted then
															Glow:beginAnimation( "keyframe", 249, false, false, CoD.TweenType.Linear )
														end
														Glow:setRGB( ColorSet.CoreControl.r, ColorSet.CoreControl.g, ColorSet.CoreControl.b )
														Glow:setAlpha( 0 )
														if event.interrupted then
															self.clipFinished( Glow, event )
														else
															Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														GlowFrame11( Glow, event )
														return 
													else
														Glow:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														Glow:setRGB( 0.98, 0.88, 0 )
														Glow:setAlpha( 1 )
														Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame11 )
													end
												end
												
												if event.interrupted then
													GlowFrame10( Glow, event )
													return 
												else
													Glow:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													Glow:setRGB( 0.98, 0.88, 0 )
													Glow:setAlpha( 0.5 )
													Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame10 )
												end
											end
											
											if event.interrupted then
												GlowFrame9( Glow, event )
												return 
											else
												Glow:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												Glow:setRGB( 0.98, 0.9, 0 )
												Glow:setAlpha( 0.54 )
												Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame9 )
											end
										end
										
										if event.interrupted then
											GlowFrame8( Glow, event )
											return 
										else
											Glow:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											Glow:setRGB( 0.98, 0.91, 0 )
											Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame8 )
										end
									end
									
									if event.interrupted then
										GlowFrame7( Glow, event )
										return 
									else
										Glow:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										Glow:setRGB( 0.97, 0.94, 0 )
										Glow:setAlpha( 1 )
										Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame7 )
									end
								end
								
								if event.interrupted then
									GlowFrame6( Glow, event )
									return 
								else
									Glow:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									Glow:setRGB( 0.97, 0.95, 0 )
									Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame6 )
								end
							end
							
							if event.interrupted then
								GlowFrame5( Glow, event )
								return 
							else
								Glow:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								Glow:setRGB( 0.97, 0.96, 0 )
								Glow:setAlpha( 0 )
								Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame5 )
							end
						end
						
						if event.interrupted then
							GlowFrame4( Glow, event )
							return 
						else
							Glow:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							Glow:setRGB( 0.97, 0.97, 0 )
							Glow:setAlpha( 0.95 )
							Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame4 )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						Glow:setRGB( 0.97, 0.99, 0 )
						Glow:setAlpha( 1 )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setRGB( 0.97, 1, 0 )
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
				fill:completeAnimation()
				self.fill:setLeftRight( true, false, 4, 61 )
				self.fill:setTopBottom( true, false, 7, 43 )
				self.fill:setRGB( 0.95, 0.58, 0.19 )
				self.fill:setAlpha( 1 )
				self.fill:setZoom( 20 )
				self.clipFinished( fill, {} )
				local ButtonContainerFrame2 = function ( ButtonContainer, event )
					if not event.interrupted then
						ButtonContainer:beginAnimation( "keyframe", 180, false, true, CoD.TweenType.Bounce )
						ButtonContainer.ArrowSide:beginAnimation( "subkeyframe", 180, false, true, CoD.TweenType.Bounce )
					end
					ButtonContainer:setRGB( 1, 0.97, 0.35 )
					ButtonContainer:setAlpha( 1 )
					ButtonContainer:setZoom( 0 )
					ButtonContainer.ArrowSide:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ButtonContainer, event )
					else
						ButtonContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ButtonContainer:completeAnimation()
				ButtonContainer.ArrowSide:completeAnimation()
				self.ButtonContainer:setRGB( 0.51, 0.55, 0.64 )
				self.ButtonContainer:setAlpha( 0.8 )
				self.ButtonContainer:setZoom( 0 )
				self.ButtonContainer.ArrowSide:setAlpha( 0 )
				ButtonContainerFrame2( ButtonContainer, {} )
				local IconDuplicateShadowFrame2 = function ( IconDuplicateShadow, event )
					if not event.interrupted then
						IconDuplicateShadow:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
					end
					IconDuplicateShadow:setLeftRight( false, false, -26, 22 )
					IconDuplicateShadow:setTopBottom( false, false, -25, 22 )
					IconDuplicateShadow:setAlpha( 0 )
					IconDuplicateShadow:setZoom( 20 )
					IconDuplicateShadow:setScale( 0.9 )
					IconDuplicateShadow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
					if event.interrupted then
						self.clipFinished( IconDuplicateShadow, event )
					else
						IconDuplicateShadow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				IconDuplicateShadow:completeAnimation()
				self.IconDuplicateShadow:setLeftRight( false, false, -26, 22 )
				self.IconDuplicateShadow:setTopBottom( false, false, -25, 22 )
				self.IconDuplicateShadow:setAlpha( 0 )
				self.IconDuplicateShadow:setZoom( 20 )
				self.IconDuplicateShadow:setScale( 0.9 )
				self.IconDuplicateShadow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				IconDuplicateShadowFrame2( IconDuplicateShadow, {} )
				local IconFrame2 = function ( Icon, event )
					local IconFrame3 = function ( Icon, event )
						if not event.interrupted then
							Icon:beginAnimation( "keyframe", 120, false, true, CoD.TweenType.Bounce )
						end
						Icon:setLeftRight( false, false, -26, 22 )
						Icon:setTopBottom( false, false, -25, 22 )
						Icon:setRGB( 1, 1, 1 )
						Icon:setAlpha( 1 )
						Icon:setZoom( 0 )
						Icon:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
						Icon:setShaderVector( 0, 1, 0, 0, 0 )
						if event.interrupted then
							self.clipFinished( Icon, event )
						else
							Icon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						IconFrame3( Icon, event )
						return 
					else
						Icon:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						Icon:setAlpha( 0.98 )
						Icon:setShaderVector( 0, 1, 0, 0, 0 )
						Icon:registerEventHandler( "transition_complete_keyframe", IconFrame3 )
					end
				end
				
				Icon:completeAnimation()
				self.Icon:setLeftRight( false, false, -26, 22 )
				self.Icon:setTopBottom( false, false, -25, 22 )
				self.Icon:setRGB( 1, 1, 1 )
				self.Icon:setAlpha( 0.9 )
				self.Icon:setZoom( 0 )
				self.Icon:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
				self.Icon:setShaderVector( 0, 0, 0, 0, 0 )
				IconFrame2( Icon, {} )
				local BarBaseFrame2 = function ( BarBase, event )
					if not event.interrupted then
						BarBase:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
					end
					BarBase:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( BarBase, event )
					else
						BarBase:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BarBase:completeAnimation()
				self.BarBase:setAlpha( 0.7 )
				BarBaseFrame2( BarBase, {} )
				ScrStkUpArrow:completeAnimation()
				self.ScrStkUpArrow:setLeftRight( true, false, 28, 36 )
				self.ScrStkUpArrow:setTopBottom( true, false, -2, 14 )
				self.ScrStkUpArrow:setRGB( 1, 0.97, 0.35 )
				self.ScrStkUpArrow:setAlpha( 0 )
				self.clipFinished( ScrStkUpArrow, {} )
				ButtonContainer0:completeAnimation()
				self.ButtonContainer0:setRGB( 0.95, 0.58, 0.19 )
				self.ButtonContainer0:setAlpha( 0 )
				self.clipFinished( ButtonContainer0, {} )
				ScrStkDownArrow:completeAnimation()
				self.ScrStkDownArrow:setLeftRight( true, false, 28, 36 )
				self.ScrStkDownArrow:setTopBottom( true, false, 37, 53 )
				self.ScrStkDownArrow:setRGB( 1, 0.97, 0.35 )
				self.ScrStkDownArrow:setAlpha( 0 )
				self.clipFinished( ScrStkDownArrow, {} )
				IconDuplicateAdd:completeAnimation()
				self.IconDuplicateAdd:setLeftRight( false, false, -26, 22 )
				self.IconDuplicateAdd:setTopBottom( false, false, -25.5, 22.5 )
				self.IconDuplicateAdd:setAlpha( 0 )
				self.IconDuplicateAdd:setZoom( 20 )
				self.IconDuplicateAdd:setScale( 1 )
				self.clipFinished( IconDuplicateAdd, {} )
				stroke:completeAnimation()
				self.stroke:setLeftRight( true, false, 4, 61 )
				self.stroke:setTopBottom( true, false, 7, 44 )
				self.stroke:setRGB( 1, 0.97, 0.35 )
				self.stroke:setAlpha( 1 )
				self.stroke:setZoom( 0 )
				self.clipFinished( stroke, {} )
				stroke0:completeAnimation()
				self.stroke0:setAlpha( 0 )
				self.stroke0:setZoom( 0 )
				self.clipFinished( stroke0, {} )
				line3:completeAnimation()
				self.line3:setLeftRight( true, false, 2, 63.17 )
				self.line3:setTopBottom( true, false, 5, 46 )
				self.line3:setRGB( 0.95, 0.58, 0.19 )
				self.line3:setAlpha( 0 )
				self.line3:setZoom( 20 )
				self.clipFinished( line3, {} )
				glow:completeAnimation()
				self.glow:setLeftRight( true, false, 2, 65.58 )
				self.glow:setTopBottom( true, false, 5, 45.88 )
				self.glow:setRGB( 1, 1, 1 )
				self.glow:setAlpha( 0 )
				self.glow:setZoom( 0 )
				self.clipFinished( glow, {} )
				Icon0:completeAnimation()
				self.Icon0:setAlpha( 0 )
				self.Icon0:setZoom( 20 )
				self.clipFinished( Icon0, {} )
			end
		},
		ReadyMiddle = {
			DefaultClip = function ()
				self:setupElementClipCounter( 20 )
				PanelDarken:completeAnimation()
				self.PanelDarken:setAlpha( 0 )
				self.clipFinished( PanelDarken, {} )
				StrokeInner:completeAnimation()
				self.StrokeInner:setAlpha( 0 )
				self.clipFinished( StrokeInner, {} )
				Stroke:completeAnimation()
				self.Stroke:setAlpha( 0 )
				self.clipFinished( Stroke, {} )
				DarkGlow:completeAnimation()
				self.DarkGlow:setLeftRight( true, false, -7.82, 72.46 )
				self.DarkGlow:setTopBottom( true, false, -3.5, 55.5 )
				self.DarkGlow:setAlpha( 0 )
				self.clipFinished( DarkGlow, {} )
				innerGlow:completeAnimation()
				self.innerGlow:setLeftRight( true, false, 10, 55 )
				self.innerGlow:setTopBottom( true, false, 11, 42 )
				self.innerGlow:setRGB( 1, 1, 1 )
				self.innerGlow:setAlpha( 0 )
				self.innerGlow:setZoom( 0 )
				self.clipFinished( innerGlow, {} )
				Glow:completeAnimation()
				self.Glow:setRGB( ColorSet.CoreControl.r, ColorSet.CoreControl.g, ColorSet.CoreControl.b )
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
				fill:completeAnimation()
				self.fill:setLeftRight( true, false, 4, 61 )
				self.fill:setTopBottom( true, false, 7, 43 )
				self.fill:setRGB( 0.95, 0.58, 0.19 )
				self.fill:setAlpha( 1 )
				self.fill:setZoom( 20 )
				self.clipFinished( fill, {} )
				ButtonContainer:completeAnimation()
				ButtonContainer.ArrowSide:completeAnimation()
				self.ButtonContainer:setRGB( 1, 0.97, 0.35 )
				self.ButtonContainer:setAlpha( 1 )
				self.ButtonContainer:setZoom( 0 )
				self.ButtonContainer.ArrowSide:setAlpha( 0 )
				self.clipFinished( ButtonContainer, {} )
				IconDuplicateShadow:completeAnimation()
				self.IconDuplicateShadow:setLeftRight( false, false, -26, 22 )
				self.IconDuplicateShadow:setTopBottom( false, false, -25, 22 )
				self.IconDuplicateShadow:setAlpha( 0 )
				self.IconDuplicateShadow:setZoom( 20 )
				self.IconDuplicateShadow:setScale( 0.9 )
				self.IconDuplicateShadow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				self.clipFinished( IconDuplicateShadow, {} )
				Icon:completeAnimation()
				self.Icon:setLeftRight( false, false, -26, 22 )
				self.Icon:setTopBottom( false, false, -25, 22 )
				self.Icon:setRGB( 1, 1, 1 )
				self.Icon:setAlpha( 1 )
				self.Icon:setZoom( 0 )
				self.Icon:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
				self.Icon:setShaderVector( 0, 1, 0, 0, 0 )
				self.clipFinished( Icon, {} )
				BarBase:completeAnimation()
				self.BarBase:setAlpha( 0 )
				self.clipFinished( BarBase, {} )
				ScrStkUpArrow:completeAnimation()
				self.ScrStkUpArrow:setLeftRight( true, false, 28, 36 )
				self.ScrStkUpArrow:setTopBottom( true, false, -2, 14 )
				self.ScrStkUpArrow:setRGB( 1, 0.97, 0.35 )
				self.ScrStkUpArrow:setAlpha( 0 )
				self.clipFinished( ScrStkUpArrow, {} )
				ButtonContainer0:completeAnimation()
				self.ButtonContainer0:setRGB( 0.95, 0.58, 0.19 )
				self.ButtonContainer0:setAlpha( 0 )
				self.clipFinished( ButtonContainer0, {} )
				ScrStkDownArrow:completeAnimation()
				self.ScrStkDownArrow:setLeftRight( true, false, 28, 36 )
				self.ScrStkDownArrow:setTopBottom( true, false, 37, 53 )
				self.ScrStkDownArrow:setRGB( 1, 0.97, 0.35 )
				self.ScrStkDownArrow:setAlpha( 0 )
				self.clipFinished( ScrStkDownArrow, {} )
				IconDuplicateAdd:completeAnimation()
				self.IconDuplicateAdd:setLeftRight( false, false, -26, 22 )
				self.IconDuplicateAdd:setTopBottom( false, false, -25.5, 22.5 )
				self.IconDuplicateAdd:setAlpha( 0 )
				self.IconDuplicateAdd:setZoom( 20 )
				self.IconDuplicateAdd:setScale( 1 )
				self.clipFinished( IconDuplicateAdd, {} )
				stroke:completeAnimation()
				self.stroke:setLeftRight( true, false, 4, 61 )
				self.stroke:setTopBottom( true, false, 7, 44 )
				self.stroke:setRGB( 1, 0.97, 0.35 )
				self.stroke:setAlpha( 1 )
				self.stroke:setZoom( 0 )
				self.clipFinished( stroke, {} )
				stroke0:completeAnimation()
				self.stroke0:setAlpha( 0 )
				self.stroke0:setZoom( 0 )
				self.clipFinished( stroke0, {} )
				line3:completeAnimation()
				self.line3:setLeftRight( true, false, 2, 63.17 )
				self.line3:setTopBottom( true, false, 5, 46 )
				self.line3:setRGB( 0.95, 0.58, 0.19 )
				self.line3:setAlpha( 0 )
				self.line3:setZoom( 20 )
				self.clipFinished( line3, {} )
				glow:completeAnimation()
				self.glow:setLeftRight( true, false, 2, 65.58 )
				self.glow:setTopBottom( true, false, 5, 45.88 )
				self.glow:setRGB( 1, 1, 1 )
				self.glow:setAlpha( 0 )
				self.glow:setZoom( 0 )
				self.clipFinished( glow, {} )
				Icon0:completeAnimation()
				self.Icon0:setAlpha( 0 )
				self.Icon0:setZoom( 20 )
				self.clipFinished( Icon0, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 18 )
				PanelDarken:completeAnimation()
				self.PanelDarken:setAlpha( 0.3 )
				self.clipFinished( PanelDarken, {} )
				StrokeInner:completeAnimation()
				self.StrokeInner:setAlpha( 0 )
				self.clipFinished( StrokeInner, {} )
				Stroke:completeAnimation()
				self.Stroke:setAlpha( 0 )
				self.clipFinished( Stroke, {} )
				DarkGlow:completeAnimation()
				self.DarkGlow:setLeftRight( true, false, -2.49, 67.74 )
				self.DarkGlow:setTopBottom( true, false, 1, 52 )
				self.DarkGlow:setAlpha( 1 )
				self.clipFinished( DarkGlow, {} )
				innerGlow:completeAnimation()
				self.innerGlow:setLeftRight( true, false, 7, 57 )
				self.innerGlow:setTopBottom( true, false, 9, 43 )
				self.innerGlow:setRGB( 1, 0.97, 0.35 )
				self.innerGlow:setAlpha( 1 )
				self.innerGlow:setZoom( 20 )
				self.clipFinished( innerGlow, {} )
				Glow:completeAnimation()
				self.Glow:setRGB( ColorSet.CoreControl.r, ColorSet.CoreControl.g, ColorSet.CoreControl.b )
				self.Glow:setAlpha( 0.35 )
				self.clipFinished( Glow, {} )
				fill:completeAnimation()
				self.fill:setLeftRight( true, false, 4, 61 )
				self.fill:setTopBottom( true, false, 7, 43 )
				self.fill:setRGB( 0.95, 0.58, 0.19 )
				self.fill:setAlpha( 1 )
				self.fill:setZoom( 20 )
				self.clipFinished( fill, {} )
				ButtonContainer:completeAnimation()
				ButtonContainer.ArrowSide:completeAnimation()
				self.ButtonContainer:setRGB( 1, 0.97, 0.35 )
				self.ButtonContainer:setAlpha( 1 )
				self.ButtonContainer:setZoom( 20 )
				self.ButtonContainer.ArrowSide:setAlpha( 1 )
				self.clipFinished( ButtonContainer, {} )
				IconDuplicateShadow:completeAnimation()
				self.IconDuplicateShadow:setLeftRight( false, false, -25.75, 21.25 )
				self.IconDuplicateShadow:setTopBottom( false, false, -24.5, 21.5 )
				self.IconDuplicateShadow:setAlpha( 0 )
				self.IconDuplicateShadow:setZoom( 20 )
				self.clipFinished( IconDuplicateShadow, {} )
				Icon:completeAnimation()
				self.Icon:setLeftRight( false, false, -26, 22 )
				self.Icon:setTopBottom( false, false, -25, 22 )
				self.Icon:setRGB( 1, 1, 1 )
				self.Icon:setAlpha( 1 )
				self.Icon:setZoom( 20 )
				self.clipFinished( Icon, {} )
				ScrStkUpArrow:completeAnimation()
				self.ScrStkUpArrow:setLeftRight( true, false, 28, 36 )
				self.ScrStkUpArrow:setTopBottom( true, false, -2, 14 )
				self.ScrStkUpArrow:setRGB( 1, 0.97, 0.35 )
				self.ScrStkUpArrow:setAlpha( 1 )
				self.clipFinished( ScrStkUpArrow, {} )
				ButtonContainer0:completeAnimation()
				self.ButtonContainer0:setRGB( 1, 0.97, 0.35 )
				self.ButtonContainer0:setAlpha( 1 )
				self.clipFinished( ButtonContainer0, {} )
				ScrStkDownArrow:completeAnimation()
				self.ScrStkDownArrow:setLeftRight( true, false, 28, 36 )
				self.ScrStkDownArrow:setTopBottom( true, false, 37, 53 )
				self.ScrStkDownArrow:setRGB( 1, 0.97, 0.35 )
				self.ScrStkDownArrow:setAlpha( 1 )
				self.clipFinished( ScrStkDownArrow, {} )
				IconDuplicateAdd:completeAnimation()
				self.IconDuplicateAdd:setLeftRight( false, false, -26, 22 )
				self.IconDuplicateAdd:setTopBottom( false, false, -25, 22 )
				self.IconDuplicateAdd:setAlpha( 0 )
				self.IconDuplicateAdd:setZoom( 20 )
				self.clipFinished( IconDuplicateAdd, {} )
				stroke:completeAnimation()
				self.stroke:setLeftRight( true, false, 4, 61 )
				self.stroke:setTopBottom( true, false, 7, 44 )
				self.stroke:setRGB( 1, 0.97, 0.35 )
				self.stroke:setAlpha( 1 )
				self.stroke:setZoom( 20 )
				self.clipFinished( stroke, {} )
				line3:completeAnimation()
				self.line3:setLeftRight( true, false, 2, 63 )
				self.line3:setTopBottom( true, false, 5, 46 )
				self.line3:setRGB( 0.95, 0.58, 0.19 )
				self.line3:setAlpha( 1 )
				self.line3:setZoom( 20 )
				self.clipFinished( line3, {} )
				glow:completeAnimation()
				self.glow:setLeftRight( true, false, 4, 61 )
				self.glow:setTopBottom( true, false, 7, 44 )
				self.glow:setRGB( 1, 0.97, 0.35 )
				self.glow:setAlpha( 1 )
				self.glow:setZoom( 20 )
				self.clipFinished( glow, {} )
				Icon0:completeAnimation()
				self.Icon0:setAlpha( 1 )
				self.Icon0:setZoom( 20 )
				self.clipFinished( Icon0, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 12 )
				local StrokeInnerFrame2 = function ( StrokeInner, event )
					if not event.interrupted then
						StrokeInner:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Back )
					end
					StrokeInner:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( StrokeInner, event )
					else
						StrokeInner:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				StrokeInner:completeAnimation()
				self.StrokeInner:setAlpha( 0 )
				StrokeInnerFrame2( StrokeInner, {} )
				local DarkGlowFrame2 = function ( DarkGlow, event )
					if not event.interrupted then
						DarkGlow:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
					end
					DarkGlow:setAlpha( 0.25 )
					if event.interrupted then
						self.clipFinished( DarkGlow, event )
					else
						DarkGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DarkGlow:completeAnimation()
				self.DarkGlow:setAlpha( 0 )
				DarkGlowFrame2( DarkGlow, {} )
				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						local GlowFrame4 = function ( Glow, event )
							local GlowFrame5 = function ( Glow, event )
								local GlowFrame6 = function ( Glow, event )
									if not event.interrupted then
										Glow:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									end
									Glow:setRGB( 1, 0.93, 0 )
									Glow:setAlpha( 0.35 )
									if event.interrupted then
										self.clipFinished( Glow, event )
									else
										Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									GlowFrame6( Glow, event )
									return 
								else
									Glow:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Bounce )
									Glow:setRGB( 1, 0.96, 0.5 )
									Glow:setAlpha( 0.55 )
									Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame6 )
								end
							end
							
							if event.interrupted then
								GlowFrame5( Glow, event )
								return 
							else
								Glow:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Bounce )
								Glow:setRGB( 1, 0.99, 0.87 )
								Glow:setAlpha( 0.25 )
								Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame5 )
							end
						end
						
						if event.interrupted then
							GlowFrame4( Glow, event )
							return 
						else
							Glow:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Glow:setAlpha( 1 )
							Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame4 )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setRGB( 1, 1, 1 )
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
				local fillFrame2 = function ( fill, event )
					if not event.interrupted then
						fill:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
					end
					fill:setLeftRight( true, false, 7, 57.5 )
					fill:setTopBottom( true, false, 9, 41.5 )
					fill:setRGB( 1, 0.97, 0.35 )
					fill:setAlpha( 1 )
					fill:setZoom( 20 )
					if event.interrupted then
						self.clipFinished( fill, event )
					else
						fill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				fill:completeAnimation()
				self.fill:setLeftRight( true, false, 7, 57.5 )
				self.fill:setTopBottom( true, false, 9, 41.5 )
				self.fill:setRGB( 1, 0.97, 0.35 )
				self.fill:setAlpha( 0.75 )
				self.fill:setZoom( 20 )
				fillFrame2( fill, {} )
				local ButtonContainerFrame2 = function ( ButtonContainer, event )
					if not event.interrupted then
						ButtonContainer:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Back )
						ButtonContainer.ArrowSide:beginAnimation( "subkeyframe", 109, false, false, CoD.TweenType.Back )
					end
					ButtonContainer:setRGB( 1, 0.97, 0.35 )
					ButtonContainer:setAlpha( 1 )
					ButtonContainer:setZoom( 20 )
					ButtonContainer.ArrowSide:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( ButtonContainer, event )
					else
						ButtonContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ButtonContainer:completeAnimation()
				ButtonContainer.ArrowSide:completeAnimation()
				self.ButtonContainer:setRGB( 1, 0.97, 0.35 )
				self.ButtonContainer:setAlpha( 1 )
				self.ButtonContainer:setZoom( 0 )
				self.ButtonContainer.ArrowSide:setAlpha( 0 )
				ButtonContainerFrame2( ButtonContainer, {} )
				local IconDuplicateShadowFrame2 = function ( IconDuplicateShadow, event )
					if not event.interrupted then
						IconDuplicateShadow:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
					end
					IconDuplicateShadow:setLeftRight( false, false, -26, 22 )
					IconDuplicateShadow:setTopBottom( false, false, -25, 22 )
					IconDuplicateShadow:setAlpha( 0 )
					IconDuplicateShadow:setZoom( 20 )
					if event.interrupted then
						self.clipFinished( IconDuplicateShadow, event )
					else
						IconDuplicateShadow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				IconDuplicateShadow:completeAnimation()
				self.IconDuplicateShadow:setLeftRight( false, false, -25, 23 )
				self.IconDuplicateShadow:setTopBottom( false, false, -26, 21 )
				self.IconDuplicateShadow:setAlpha( 0 )
				self.IconDuplicateShadow:setZoom( 20 )
				IconDuplicateShadowFrame2( IconDuplicateShadow, {} )
				local IconFrame2 = function ( Icon, event )
					if not event.interrupted then
						Icon:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Back )
					end
					Icon:setLeftRight( false, false, -26, 22 )
					Icon:setTopBottom( false, false, -25, 22 )
					Icon:setRGB( 1, 1, 1 )
					Icon:setAlpha( 1 )
					Icon:setZoom( 20 )
					if event.interrupted then
						self.clipFinished( Icon, event )
					else
						Icon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Icon:completeAnimation()
				self.Icon:setLeftRight( false, false, -26, 22 )
				self.Icon:setTopBottom( false, false, -25, 22 )
				self.Icon:setRGB( 1, 1, 1 )
				self.Icon:setAlpha( 0.9 )
				self.Icon:setZoom( 0 )
				IconFrame2( Icon, {} )
				local ButtonContainer0Frame2 = function ( ButtonContainer0, event )
					if not event.interrupted then
						ButtonContainer0:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
					end
					ButtonContainer0:setRGB( 1, 0.97, 0.35 )
					ButtonContainer0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( ButtonContainer0, event )
					else
						ButtonContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ButtonContainer0:completeAnimation()
				self.ButtonContainer0:setRGB( 1, 0.97, 0.35 )
				self.ButtonContainer0:setAlpha( 0 )
				ButtonContainer0Frame2( ButtonContainer0, {} )
				local IconDuplicateAddFrame2 = function ( IconDuplicateAdd, event )
					if not event.interrupted then
						IconDuplicateAdd:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
					end
					IconDuplicateAdd:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( IconDuplicateAdd, event )
					else
						IconDuplicateAdd:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				IconDuplicateAdd:completeAnimation()
				self.IconDuplicateAdd:setAlpha( 0 )
				IconDuplicateAddFrame2( IconDuplicateAdd, {} )
				local strokeFrame2 = function ( stroke, event )
					if not event.interrupted then
						stroke:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
					end
					stroke:setRGB( 1, 0.97, 0.35 )
					stroke:setAlpha( 1 )
					stroke:setZoom( 20 )
					if event.interrupted then
						self.clipFinished( stroke, event )
					else
						stroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				stroke:completeAnimation()
				self.stroke:setRGB( 1, 0.97, 0.35 )
				self.stroke:setAlpha( 0 )
				self.stroke:setZoom( 0 )
				strokeFrame2( stroke, {} )
				local stroke0Frame2 = function ( stroke0, event )
					if not event.interrupted then
						stroke0:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
					end
					stroke0:setZoom( 20 )
					if event.interrupted then
						self.clipFinished( stroke0, event )
					else
						stroke0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				stroke0:completeAnimation()
				self.stroke0:setZoom( 0 )
				stroke0Frame2( stroke0, {} )
				local line3Frame2 = function ( line3, event )
					if not event.interrupted then
						line3:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
					end
					line3:setAlpha( 1 )
					line3:setZoom( 20 )
					if event.interrupted then
						self.clipFinished( line3, event )
					else
						line3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				line3:completeAnimation()
				self.line3:setAlpha( 0 )
				self.line3:setZoom( 0 )
				line3Frame2( line3, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 17 )
				local StrokeInnerFrame2 = function ( StrokeInner, event )
					if not event.interrupted then
						StrokeInner:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					StrokeInner:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( StrokeInner, event )
					else
						StrokeInner:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				StrokeInner:completeAnimation()
				self.StrokeInner:setAlpha( 0 )
				StrokeInnerFrame2( StrokeInner, {} )
				local DarkGlowFrame2 = function ( DarkGlow, event )
					if not event.interrupted then
						DarkGlow:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					DarkGlow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( DarkGlow, event )
					else
						DarkGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DarkGlow:completeAnimation()
				self.DarkGlow:setAlpha( 0.25 )
				DarkGlowFrame2( DarkGlow, {} )
				innerGlow:completeAnimation()
				self.innerGlow:setAlpha( 0 )
				self.clipFinished( innerGlow, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					Glow:setRGB( 1, 0.93, 0 )
					Glow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setRGB( 1, 0.93, 0 )
				self.Glow:setAlpha( 0.18 )
				GlowFrame2( Glow, {} )
				local fillFrame2 = function ( fill, event )
					if not event.interrupted then
						fill:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					fill:setLeftRight( true, false, 5, 60.39 )
					fill:setTopBottom( true, false, 6.5, 43.5 )
					fill:setRGB( 0.95, 0.58, 0.19 )
					fill:setAlpha( 0.75 )
					fill:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( fill, event )
					else
						fill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				fill:completeAnimation()
				self.fill:setLeftRight( true, false, 5, 60.39 )
				self.fill:setTopBottom( true, false, 6.5, 43.5 )
				self.fill:setRGB( 0.95, 0.58, 0.19 )
				self.fill:setAlpha( 1 )
				self.fill:setZoom( 20 )
				fillFrame2( fill, {} )
				local ButtonContainerFrame2 = function ( ButtonContainer, event )
					if not event.interrupted then
						ButtonContainer:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
						ButtonContainer.ArrowSide:beginAnimation( "subkeyframe", 119, false, false, CoD.TweenType.Linear )
					end
					ButtonContainer:setRGB( 1, 0.97, 0.35 )
					ButtonContainer:setAlpha( 1 )
					ButtonContainer:setZoom( 0 )
					ButtonContainer.ArrowSide:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ButtonContainer, event )
					else
						ButtonContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ButtonContainer:completeAnimation()
				ButtonContainer.ArrowSide:completeAnimation()
				self.ButtonContainer:setRGB( 0.95, 0.58, 0.19 )
				self.ButtonContainer:setAlpha( 1 )
				self.ButtonContainer:setZoom( 20 )
				self.ButtonContainer.ArrowSide:setAlpha( 1 )
				ButtonContainerFrame2( ButtonContainer, {} )
				local IconDuplicateShadowFrame2 = function ( IconDuplicateShadow, event )
					if not event.interrupted then
						IconDuplicateShadow:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					IconDuplicateShadow:setLeftRight( false, false, -26, 22 )
					IconDuplicateShadow:setTopBottom( false, false, -24, 22 )
					IconDuplicateShadow:setAlpha( 0 )
					IconDuplicateShadow:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( IconDuplicateShadow, event )
					else
						IconDuplicateShadow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				IconDuplicateShadow:completeAnimation()
				self.IconDuplicateShadow:setLeftRight( false, false, -26, 22 )
				self.IconDuplicateShadow:setTopBottom( false, false, -25, 22 )
				self.IconDuplicateShadow:setAlpha( 0.4 )
				self.IconDuplicateShadow:setZoom( 20 )
				IconDuplicateShadowFrame2( IconDuplicateShadow, {} )
				local IconFrame2 = function ( Icon, event )
					if not event.interrupted then
						Icon:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					Icon:setLeftRight( false, false, -26, 22 )
					Icon:setTopBottom( false, false, -25, 22 )
					Icon:setRGB( 1, 1, 1 )
					Icon:setAlpha( 0.9 )
					Icon:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( Icon, event )
					else
						Icon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Icon:completeAnimation()
				self.Icon:setLeftRight( false, false, -26, 22 )
				self.Icon:setTopBottom( false, false, -25, 22 )
				self.Icon:setRGB( 1, 1, 1 )
				self.Icon:setAlpha( 1 )
				self.Icon:setZoom( 20 )
				IconFrame2( Icon, {} )
				ScrStkUpArrow:completeAnimation()
				self.ScrStkUpArrow:setAlpha( 0 )
				self.clipFinished( ScrStkUpArrow, {} )
				local ButtonContainer0Frame2 = function ( ButtonContainer0, event )
					if not event.interrupted then
						ButtonContainer0:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					ButtonContainer0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ButtonContainer0, event )
					else
						ButtonContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ButtonContainer0:completeAnimation()
				self.ButtonContainer0:setAlpha( 1 )
				ButtonContainer0Frame2( ButtonContainer0, {} )
				ScrStkDownArrow:completeAnimation()
				self.ScrStkDownArrow:setAlpha( 0 )
				self.clipFinished( ScrStkDownArrow, {} )
				local IconDuplicateAddFrame2 = function ( IconDuplicateAdd, event )
					if not event.interrupted then
						IconDuplicateAdd:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					IconDuplicateAdd:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( IconDuplicateAdd, event )
					else
						IconDuplicateAdd:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				IconDuplicateAdd:completeAnimation()
				self.IconDuplicateAdd:setAlpha( 0 )
				IconDuplicateAddFrame2( IconDuplicateAdd, {} )
				local strokeFrame2 = function ( stroke, event )
					if not event.interrupted then
						stroke:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					stroke:setRGB( 1, 0.97, 0.35 )
					stroke:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( stroke, event )
					else
						stroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				stroke:completeAnimation()
				self.stroke:setRGB( 1, 0.97, 0.35 )
				self.stroke:setAlpha( 1 )
				strokeFrame2( stroke, {} )
				local stroke0Frame2 = function ( stroke0, event )
					if not event.interrupted then
						stroke0:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					stroke0:setAlpha( 0 )
					stroke0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( stroke0, event )
					else
						stroke0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				stroke0:completeAnimation()
				self.stroke0:setAlpha( 0 )
				self.stroke0:setZoom( 20 )
				stroke0Frame2( stroke0, {} )
				local line3Frame2 = function ( line3, event )
					if not event.interrupted then
						line3:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					line3:setAlpha( 0 )
					line3:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( line3, event )
					else
						line3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				line3:completeAnimation()
				self.line3:setAlpha( 1 )
				self.line3:setZoom( 20 )
				line3Frame2( line3, {} )
				local glowFrame2 = function ( glow, event )
					if not event.interrupted then
						glow:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					glow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( glow, event )
					else
						glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				glow:completeAnimation()
				self.glow:setAlpha( 1 )
				glowFrame2( glow, {} )
				local Icon0Frame2 = function ( Icon0, event )
					if not event.interrupted then
						Icon0:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					Icon0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Icon0, event )
					else
						Icon0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Icon0:completeAnimation()
				self.Icon0:setAlpha( 1 )
				Icon0Frame2( Icon0, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 20 )
				local PanelDarkenFrame2 = function ( PanelDarken, event )
					if not event.interrupted then
						PanelDarken:beginAnimation( "keyframe", 419, false, false, CoD.TweenType.Linear )
					end
					PanelDarken:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PanelDarken, event )
					else
						PanelDarken:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PanelDarken:completeAnimation()
				self.PanelDarken:setAlpha( 0.3 )
				PanelDarkenFrame2( PanelDarken, {} )
				local StrokeInnerFrame2 = function ( StrokeInner, event )
					if not event.interrupted then
						StrokeInner:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					StrokeInner:setAlpha( 0.2 )
					if event.interrupted then
						self.clipFinished( StrokeInner, event )
					else
						StrokeInner:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				StrokeInner:completeAnimation()
				self.StrokeInner:setAlpha( 0 )
				StrokeInnerFrame2( StrokeInner, {} )
				local StrokeFrame2 = function ( Stroke, event )
					if not event.interrupted then
						Stroke:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					Stroke:setAlpha( 0.2 )
					if event.interrupted then
						self.clipFinished( Stroke, event )
					else
						Stroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Stroke:completeAnimation()
				self.Stroke:setAlpha( 0 )
				StrokeFrame2( Stroke, {} )
				local DarkGlowFrame2 = function ( DarkGlow, event )
					if not event.interrupted then
						DarkGlow:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
					end
					DarkGlow:setLeftRight( true, false, -9.18, 75.18 )
					DarkGlow:setTopBottom( true, false, -5.5, 56.5 )
					DarkGlow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( DarkGlow, event )
					else
						DarkGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DarkGlow:completeAnimation()
				self.DarkGlow:setLeftRight( true, false, -9.18, 75.18 )
				self.DarkGlow:setTopBottom( true, false, -5.5, 56.5 )
				self.DarkGlow:setAlpha( 0.4 )
				DarkGlowFrame2( DarkGlow, {} )
				innerGlow:completeAnimation()
				self.innerGlow:setLeftRight( true, false, 10, 55 )
				self.innerGlow:setTopBottom( true, false, 11, 42 )
				self.innerGlow:setRGB( 1, 1, 1 )
				self.innerGlow:setAlpha( 0 )
				self.innerGlow:setZoom( 0 )
				self.clipFinished( innerGlow, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					Glow:setRGB( ColorSet.CoreControl.r, ColorSet.CoreControl.g, ColorSet.CoreControl.b )
					Glow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setRGB( ColorSet.CoreControl.r, ColorSet.CoreControl.g, ColorSet.CoreControl.b )
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
				fill:completeAnimation()
				self.fill:setLeftRight( true, false, 4, 61 )
				self.fill:setTopBottom( true, false, 7, 43 )
				self.fill:setRGB( 0.95, 0.58, 0.19 )
				self.fill:setAlpha( 0 )
				self.fill:setZoom( 20 )
				self.clipFinished( fill, {} )
				local ButtonContainerFrame2 = function ( ButtonContainer, event )
					if not event.interrupted then
						ButtonContainer:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						ButtonContainer.ArrowSide:beginAnimation( "subkeyframe", 500, false, false, CoD.TweenType.Linear )
					end
					ButtonContainer:setRGB( 0.51, 0.55, 0.64 )
					ButtonContainer:setAlpha( 0 )
					ButtonContainer:setZoom( 0 )
					ButtonContainer.ArrowSide:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ButtonContainer, event )
					else
						ButtonContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ButtonContainer:completeAnimation()
				ButtonContainer.ArrowSide:completeAnimation()
				self.ButtonContainer:setRGB( 1, 0.97, 0.35 )
				self.ButtonContainer:setAlpha( 1 )
				self.ButtonContainer:setZoom( 0 )
				self.ButtonContainer.ArrowSide:setAlpha( 0 )
				ButtonContainerFrame2( ButtonContainer, {} )
				local IconDuplicateShadowFrame2 = function ( IconDuplicateShadow, event )
					if not event.interrupted then
						IconDuplicateShadow:beginAnimation( "keyframe", 419, false, false, CoD.TweenType.Linear )
					end
					IconDuplicateShadow:setLeftRight( false, false, -25.75, 21.25 )
					IconDuplicateShadow:setTopBottom( false, false, -24.5, 21.5 )
					IconDuplicateShadow:setAlpha( 0 )
					IconDuplicateShadow:setZoom( 20 )
					IconDuplicateShadow:setScale( 0.9 )
					IconDuplicateShadow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
					if event.interrupted then
						self.clipFinished( IconDuplicateShadow, event )
					else
						IconDuplicateShadow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				IconDuplicateShadow:completeAnimation()
				self.IconDuplicateShadow:setLeftRight( false, false, -25.75, 21.25 )
				self.IconDuplicateShadow:setTopBottom( false, false, -24.5, 21.5 )
				self.IconDuplicateShadow:setAlpha( 0 )
				self.IconDuplicateShadow:setZoom( 20 )
				self.IconDuplicateShadow:setScale( 0.9 )
				self.IconDuplicateShadow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				IconDuplicateShadowFrame2( IconDuplicateShadow, {} )
				local IconFrame2 = function ( Icon, event )
					if not event.interrupted then
						Icon:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
					end
					Icon:setLeftRight( false, false, -26, 22 )
					Icon:setTopBottom( false, false, -25, 22 )
					Icon:setRGB( 1, 1, 1 )
					Icon:setAlpha( 0 )
					Icon:setZoom( 0 )
					Icon:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
					Icon:setShaderVector( 0, 1, 0, 0, 0 )
					if event.interrupted then
						self.clipFinished( Icon, event )
					else
						Icon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Icon:completeAnimation()
				self.Icon:setLeftRight( false, false, -26, 22 )
				self.Icon:setTopBottom( false, false, -25, 22 )
				self.Icon:setRGB( 1, 1, 1 )
				self.Icon:setAlpha( 0.9 )
				self.Icon:setZoom( 0 )
				self.Icon:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
				self.Icon:setShaderVector( 0, 1, 0, 0, 0 )
				IconFrame2( Icon, {} )
				BarBase:completeAnimation()
				self.BarBase:setAlpha( 0 )
				self.clipFinished( BarBase, {} )
				ScrStkUpArrow:completeAnimation()
				self.ScrStkUpArrow:setLeftRight( true, false, 28, 36 )
				self.ScrStkUpArrow:setTopBottom( true, false, -2, 14 )
				self.ScrStkUpArrow:setRGB( 1, 0.97, 0.35 )
				self.ScrStkUpArrow:setAlpha( 0 )
				self.clipFinished( ScrStkUpArrow, {} )
				ButtonContainer0:completeAnimation()
				self.ButtonContainer0:setRGB( 1, 0.97, 0.35 )
				self.ButtonContainer0:setAlpha( 0 )
				self.clipFinished( ButtonContainer0, {} )
				ScrStkDownArrow:completeAnimation()
				self.ScrStkDownArrow:setLeftRight( true, false, 28, 36 )
				self.ScrStkDownArrow:setTopBottom( true, false, 37, 53 )
				self.ScrStkDownArrow:setRGB( 1, 0.97, 0.35 )
				self.ScrStkDownArrow:setAlpha( 0 )
				self.clipFinished( ScrStkDownArrow, {} )
				IconDuplicateAdd:completeAnimation()
				self.IconDuplicateAdd:setLeftRight( false, false, -26, 22 )
				self.IconDuplicateAdd:setTopBottom( false, false, -25.5, 22.5 )
				self.IconDuplicateAdd:setAlpha( 0 )
				self.IconDuplicateAdd:setZoom( 20 )
				self.IconDuplicateAdd:setScale( 0.9 )
				self.clipFinished( IconDuplicateAdd, {} )
				stroke:completeAnimation()
				self.stroke:setLeftRight( true, false, 4, 61 )
				self.stroke:setTopBottom( true, false, 7, 44 )
				self.stroke:setRGB( 1, 0.97, 0.35 )
				self.stroke:setAlpha( 0 )
				self.stroke:setZoom( 20 )
				self.clipFinished( stroke, {} )
				stroke0:completeAnimation()
				self.stroke0:setAlpha( 0 )
				self.stroke0:setZoom( 20 )
				self.clipFinished( stroke0, {} )
				line3:completeAnimation()
				self.line3:setLeftRight( true, false, 2, 63.17 )
				self.line3:setTopBottom( true, false, 5, 46 )
				self.line3:setRGB( 0.95, 0.58, 0.19 )
				self.line3:setAlpha( 0 )
				self.line3:setZoom( 20 )
				self.clipFinished( line3, {} )
				glow:completeAnimation()
				self.glow:setLeftRight( true, false, 2, 65.58 )
				self.glow:setTopBottom( true, false, 5, 45.88 )
				self.glow:setRGB( 1, 1, 1 )
				self.glow:setAlpha( 0 )
				self.glow:setZoom( 0 )
				self.clipFinished( glow, {} )
				Icon0:completeAnimation()
				self.Icon0:setAlpha( 0 )
				self.Icon0:setZoom( 20 )
				self.clipFinished( Icon0, {} )
			end,
			Charging = function ()
				self:setupElementClipCounter( 20 )
				PanelDarken:completeAnimation()
				self.PanelDarken:setAlpha( 0.3 )
				self.clipFinished( PanelDarken, {} )
				local StrokeInnerFrame2 = function ( StrokeInner, event )
					if not event.interrupted then
						StrokeInner:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					StrokeInner:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( StrokeInner, event )
					else
						StrokeInner:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				StrokeInner:completeAnimation()
				self.StrokeInner:setAlpha( 0 )
				StrokeInnerFrame2( StrokeInner, {} )
				local StrokeFrame2 = function ( Stroke, event )
					if not event.interrupted then
						Stroke:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					Stroke:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Stroke, event )
					else
						Stroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Stroke:completeAnimation()
				self.Stroke:setAlpha( 0 )
				StrokeFrame2( Stroke, {} )
				local DarkGlowFrame2 = function ( DarkGlow, event )
					if not event.interrupted then
						DarkGlow:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
					end
					DarkGlow:setLeftRight( true, false, -9.18, 75.18 )
					DarkGlow:setTopBottom( true, false, -5.5, 56.5 )
					DarkGlow:setAlpha( 0.3 )
					if event.interrupted then
						self.clipFinished( DarkGlow, event )
					else
						DarkGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DarkGlow:completeAnimation()
				self.DarkGlow:setLeftRight( true, false, -9.18, 75.18 )
				self.DarkGlow:setTopBottom( true, false, -5.5, 56.5 )
				self.DarkGlow:setAlpha( 0.4 )
				DarkGlowFrame2( DarkGlow, {} )
				innerGlow:completeAnimation()
				self.innerGlow:setLeftRight( true, false, 10, 55 )
				self.innerGlow:setTopBottom( true, false, 11, 42 )
				self.innerGlow:setRGB( 1, 1, 1 )
				self.innerGlow:setAlpha( 0 )
				self.innerGlow:setZoom( 0 )
				self.clipFinished( innerGlow, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					Glow:setRGB( ColorSet.CoreControl.r, ColorSet.CoreControl.g, ColorSet.CoreControl.b )
					Glow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setRGB( ColorSet.CoreControl.r, ColorSet.CoreControl.g, ColorSet.CoreControl.b )
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
				fill:completeAnimation()
				self.fill:setLeftRight( true, false, 4, 61 )
				self.fill:setTopBottom( true, false, 7, 43 )
				self.fill:setRGB( 0.95, 0.58, 0.19 )
				self.fill:setAlpha( 0 )
				self.fill:setZoom( 20 )
				self.clipFinished( fill, {} )
				local ButtonContainerFrame2 = function ( ButtonContainer, event )
					if not event.interrupted then
						ButtonContainer:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						ButtonContainer.ArrowSide:beginAnimation( "subkeyframe", 500, false, false, CoD.TweenType.Linear )
					end
					ButtonContainer:setRGB( 0.51, 0.55, 0.64 )
					ButtonContainer:setAlpha( 0.8 )
					ButtonContainer:setZoom( 0 )
					ButtonContainer.ArrowSide:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ButtonContainer, event )
					else
						ButtonContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ButtonContainer:completeAnimation()
				ButtonContainer.ArrowSide:completeAnimation()
				self.ButtonContainer:setRGB( 1, 0.97, 0.35 )
				self.ButtonContainer:setAlpha( 1 )
				self.ButtonContainer:setZoom( 0 )
				self.ButtonContainer.ArrowSide:setAlpha( 0 )
				ButtonContainerFrame2( ButtonContainer, {} )
				local IconDuplicateShadowFrame2 = function ( IconDuplicateShadow, event )
					if not event.interrupted then
						IconDuplicateShadow:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					IconDuplicateShadow:setLeftRight( false, false, -25.75, 21.25 )
					IconDuplicateShadow:setTopBottom( false, false, -24.5, 21.5 )
					IconDuplicateShadow:setAlpha( 0 )
					IconDuplicateShadow:setZoom( 20 )
					IconDuplicateShadow:setScale( 0.9 )
					IconDuplicateShadow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
					if event.interrupted then
						self.clipFinished( IconDuplicateShadow, event )
					else
						IconDuplicateShadow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				IconDuplicateShadow:completeAnimation()
				self.IconDuplicateShadow:setLeftRight( false, false, -25.75, 21.25 )
				self.IconDuplicateShadow:setTopBottom( false, false, -24.5, 21.5 )
				self.IconDuplicateShadow:setAlpha( 0 )
				self.IconDuplicateShadow:setZoom( 20 )
				self.IconDuplicateShadow:setScale( 0.9 )
				self.IconDuplicateShadow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				IconDuplicateShadowFrame2( IconDuplicateShadow, {} )
				local IconFrame2 = function ( Icon, event )
					if not event.interrupted then
						Icon:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					Icon:setLeftRight( false, false, -26, 22 )
					Icon:setTopBottom( false, false, -25, 22 )
					Icon:setRGB( 1, 1, 1 )
					Icon:setAlpha( 0.9 )
					Icon:setZoom( 0 )
					Icon:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
					Icon:setShaderVector( 0, 0, 0, 0, 0 )
					if event.interrupted then
						self.clipFinished( Icon, event )
					else
						Icon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Icon:completeAnimation()
				self.Icon:setLeftRight( false, false, -26, 22 )
				self.Icon:setTopBottom( false, false, -25, 22 )
				self.Icon:setRGB( 1, 1, 1 )
				self.Icon:setAlpha( 0.9 )
				self.Icon:setZoom( 0 )
				self.Icon:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
				self.Icon:setShaderVector( 0, 0, 0, 0, 0 )
				IconFrame2( Icon, {} )
				local BarBaseFrame2 = function ( BarBase, event )
					if not event.interrupted then
						BarBase:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					BarBase:setAlpha( 0.7 )
					if event.interrupted then
						self.clipFinished( BarBase, event )
					else
						BarBase:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BarBase:completeAnimation()
				self.BarBase:setAlpha( 0 )
				BarBaseFrame2( BarBase, {} )
				ScrStkUpArrow:completeAnimation()
				self.ScrStkUpArrow:setLeftRight( true, false, 28, 36 )
				self.ScrStkUpArrow:setTopBottom( true, false, -2, 14 )
				self.ScrStkUpArrow:setRGB( 1, 0.97, 0.35 )
				self.ScrStkUpArrow:setAlpha( 0 )
				self.clipFinished( ScrStkUpArrow, {} )
				ButtonContainer0:completeAnimation()
				self.ButtonContainer0:setRGB( 1, 0.97, 0.35 )
				self.ButtonContainer0:setAlpha( 0 )
				self.clipFinished( ButtonContainer0, {} )
				ScrStkDownArrow:completeAnimation()
				self.ScrStkDownArrow:setLeftRight( true, false, 28, 36 )
				self.ScrStkDownArrow:setTopBottom( true, false, 37, 53 )
				self.ScrStkDownArrow:setRGB( 1, 0.97, 0.35 )
				self.ScrStkDownArrow:setAlpha( 0 )
				self.clipFinished( ScrStkDownArrow, {} )
				IconDuplicateAdd:completeAnimation()
				self.IconDuplicateAdd:setLeftRight( false, false, -26, 22 )
				self.IconDuplicateAdd:setTopBottom( false, false, -25.5, 22.5 )
				self.IconDuplicateAdd:setAlpha( 0 )
				self.IconDuplicateAdd:setZoom( 20 )
				self.IconDuplicateAdd:setScale( 0.9 )
				self.clipFinished( IconDuplicateAdd, {} )
				stroke:completeAnimation()
				self.stroke:setLeftRight( true, false, 4, 61 )
				self.stroke:setTopBottom( true, false, 7, 44 )
				self.stroke:setRGB( 1, 0.97, 0.35 )
				self.stroke:setAlpha( 0 )
				self.stroke:setZoom( 20 )
				self.clipFinished( stroke, {} )
				stroke0:completeAnimation()
				self.stroke0:setAlpha( 0 )
				self.stroke0:setZoom( 20 )
				self.clipFinished( stroke0, {} )
				line3:completeAnimation()
				self.line3:setLeftRight( true, false, 2, 63.17 )
				self.line3:setTopBottom( true, false, 5, 46 )
				self.line3:setRGB( 0.95, 0.58, 0.19 )
				self.line3:setAlpha( 0 )
				self.line3:setZoom( 20 )
				self.clipFinished( line3, {} )
				glow:completeAnimation()
				self.glow:setLeftRight( true, false, 2, 65.58 )
				self.glow:setTopBottom( true, false, 5, 45.88 )
				self.glow:setRGB( 1, 1, 1 )
				self.glow:setAlpha( 0 )
				self.glow:setZoom( 0 )
				self.clipFinished( glow, {} )
				Icon0:completeAnimation()
				self.Icon0:setAlpha( 0 )
				self.Icon0:setZoom( 20 )
				self.clipFinished( Icon0, {} )
			end,
			Inactive = function ()
				self:setupElementClipCounter( 20 )
				PanelDarken:completeAnimation()
				self.PanelDarken:setAlpha( 0 )
				self.clipFinished( PanelDarken, {} )
				local StrokeInnerFrame2 = function ( StrokeInner, event )
					if not event.interrupted then
						StrokeInner:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					StrokeInner:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( StrokeInner, event )
					else
						StrokeInner:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				StrokeInner:completeAnimation()
				self.StrokeInner:setAlpha( 0 )
				StrokeInnerFrame2( StrokeInner, {} )
				local StrokeFrame2 = function ( Stroke, event )
					if not event.interrupted then
						Stroke:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					Stroke:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Stroke, event )
					else
						Stroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Stroke:completeAnimation()
				self.Stroke:setAlpha( 0 )
				StrokeFrame2( Stroke, {} )
				local DarkGlowFrame2 = function ( DarkGlow, event )
					if not event.interrupted then
						DarkGlow:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
					end
					DarkGlow:setLeftRight( true, false, -9.18, 75.18 )
					DarkGlow:setTopBottom( true, false, -5.5, 56.5 )
					DarkGlow:setAlpha( 0.3 )
					if event.interrupted then
						self.clipFinished( DarkGlow, event )
					else
						DarkGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DarkGlow:completeAnimation()
				self.DarkGlow:setLeftRight( true, false, -9.18, 75.18 )
				self.DarkGlow:setTopBottom( true, false, -5.5, 56.5 )
				self.DarkGlow:setAlpha( 0.4 )
				DarkGlowFrame2( DarkGlow, {} )
				innerGlow:completeAnimation()
				self.innerGlow:setLeftRight( true, false, 10, 55 )
				self.innerGlow:setTopBottom( true, false, 11, 42 )
				self.innerGlow:setRGB( 1, 1, 1 )
				self.innerGlow:setAlpha( 0 )
				self.innerGlow:setZoom( 0 )
				self.clipFinished( innerGlow, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					Glow:setRGB( ColorSet.CoreControl.r, ColorSet.CoreControl.g, ColorSet.CoreControl.b )
					Glow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setRGB( ColorSet.CoreControl.r, ColorSet.CoreControl.g, ColorSet.CoreControl.b )
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
				fill:completeAnimation()
				self.fill:setLeftRight( true, false, 4, 61 )
				self.fill:setTopBottom( true, false, 7, 43 )
				self.fill:setRGB( 0.95, 0.58, 0.19 )
				self.fill:setAlpha( 0 )
				self.fill:setZoom( 20 )
				self.clipFinished( fill, {} )
				local ButtonContainerFrame2 = function ( ButtonContainer, event )
					if not event.interrupted then
						ButtonContainer:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						ButtonContainer.ArrowSide:beginAnimation( "subkeyframe", 500, false, false, CoD.TweenType.Linear )
					end
					ButtonContainer:setRGB( 0.51, 0.55, 0.64 )
					ButtonContainer:setAlpha( 0.8 )
					ButtonContainer:setZoom( 0 )
					ButtonContainer.ArrowSide:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ButtonContainer, event )
					else
						ButtonContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ButtonContainer:completeAnimation()
				ButtonContainer.ArrowSide:completeAnimation()
				self.ButtonContainer:setRGB( 1, 0.97, 0.35 )
				self.ButtonContainer:setAlpha( 1 )
				self.ButtonContainer:setZoom( 0 )
				self.ButtonContainer.ArrowSide:setAlpha( 0 )
				ButtonContainerFrame2( ButtonContainer, {} )
				local IconDuplicateShadowFrame2 = function ( IconDuplicateShadow, event )
					if not event.interrupted then
						IconDuplicateShadow:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
					end
					IconDuplicateShadow:setLeftRight( false, false, -25.75, 21.25 )
					IconDuplicateShadow:setTopBottom( false, false, -24.5, 21.5 )
					IconDuplicateShadow:setAlpha( 0 )
					IconDuplicateShadow:setZoom( 0 )
					IconDuplicateShadow:setScale( 0.9 )
					IconDuplicateShadow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
					if event.interrupted then
						self.clipFinished( IconDuplicateShadow, event )
					else
						IconDuplicateShadow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				IconDuplicateShadow:completeAnimation()
				self.IconDuplicateShadow:setLeftRight( false, false, -25.75, 21.25 )
				self.IconDuplicateShadow:setTopBottom( false, false, -24.5, 21.5 )
				self.IconDuplicateShadow:setAlpha( 0 )
				self.IconDuplicateShadow:setZoom( 0 )
				self.IconDuplicateShadow:setScale( 0.9 )
				self.IconDuplicateShadow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				IconDuplicateShadowFrame2( IconDuplicateShadow, {} )
				local IconFrame2 = function ( Icon, event )
					if not event.interrupted then
						Icon:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					Icon:setLeftRight( false, false, -26, 22 )
					Icon:setTopBottom( false, false, -25, 22 )
					Icon:setRGB( 1, 1, 1 )
					Icon:setAlpha( 0.9 )
					Icon:setZoom( 0 )
					Icon:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
					Icon:setShaderVector( 0, 0, 0, 0, 0 )
					if event.interrupted then
						self.clipFinished( Icon, event )
					else
						Icon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Icon:completeAnimation()
				self.Icon:setLeftRight( false, false, -26, 22 )
				self.Icon:setTopBottom( false, false, -25, 22 )
				self.Icon:setRGB( 1, 1, 1 )
				self.Icon:setAlpha( 0.9 )
				self.Icon:setZoom( 0 )
				self.Icon:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
				self.Icon:setShaderVector( 0, 1, 0, 0, 0 )
				IconFrame2( Icon, {} )
				BarBase:completeAnimation()
				self.BarBase:setAlpha( 0 )
				self.clipFinished( BarBase, {} )
				ScrStkUpArrow:completeAnimation()
				self.ScrStkUpArrow:setLeftRight( true, false, 28, 36 )
				self.ScrStkUpArrow:setTopBottom( true, false, -2, 14 )
				self.ScrStkUpArrow:setRGB( 1, 0.97, 0.35 )
				self.ScrStkUpArrow:setAlpha( 0 )
				self.clipFinished( ScrStkUpArrow, {} )
				ButtonContainer0:completeAnimation()
				self.ButtonContainer0:setRGB( 0.95, 0.58, 0.19 )
				self.ButtonContainer0:setAlpha( 0 )
				self.clipFinished( ButtonContainer0, {} )
				ScrStkDownArrow:completeAnimation()
				self.ScrStkDownArrow:setLeftRight( true, false, 28, 36 )
				self.ScrStkDownArrow:setTopBottom( true, false, 37, 53 )
				self.ScrStkDownArrow:setRGB( 1, 0.97, 0.35 )
				self.ScrStkDownArrow:setAlpha( 0 )
				self.clipFinished( ScrStkDownArrow, {} )
				IconDuplicateAdd:completeAnimation()
				self.IconDuplicateAdd:setLeftRight( false, false, -26, 22 )
				self.IconDuplicateAdd:setTopBottom( false, false, -25.5, 22.5 )
				self.IconDuplicateAdd:setAlpha( 0 )
				self.IconDuplicateAdd:setZoom( 20 )
				self.IconDuplicateAdd:setScale( 0.9 )
				self.clipFinished( IconDuplicateAdd, {} )
				stroke:completeAnimation()
				self.stroke:setLeftRight( true, false, 4, 61 )
				self.stroke:setTopBottom( true, false, 7, 44 )
				self.stroke:setRGB( 1, 0.97, 0.35 )
				self.stroke:setAlpha( 0 )
				self.stroke:setZoom( 20 )
				self.clipFinished( stroke, {} )
				stroke0:completeAnimation()
				self.stroke0:setAlpha( 0 )
				self.stroke0:setZoom( 20 )
				self.clipFinished( stroke0, {} )
				line3:completeAnimation()
				self.line3:setLeftRight( true, false, 2, 63.17 )
				self.line3:setTopBottom( true, false, 5, 46 )
				self.line3:setRGB( 0.95, 0.58, 0.19 )
				self.line3:setAlpha( 0 )
				self.line3:setZoom( 20 )
				self.clipFinished( line3, {} )
				glow:completeAnimation()
				self.glow:setLeftRight( true, false, 2, 65.58 )
				self.glow:setTopBottom( true, false, 5, 45.88 )
				self.glow:setRGB( 1, 1, 1 )
				self.glow:setAlpha( 0 )
				self.glow:setZoom( 0 )
				self.clipFinished( glow, {} )
				Icon0:completeAnimation()
				self.Icon0:setAlpha( 0 )
				self.Icon0:setZoom( 20 )
				self.clipFinished( Icon0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Inactive",
			condition = function ( menu, element, event )
				local f171_local0 = IsSelfModelValueNonEmptyString( element, controller, "rewardImage" )
				if f171_local0 then
					f171_local0 = IsSelfModelValueEqualTo( element, controller, "rewardAmmo", 0 )
					if f171_local0 then
						f171_local0 = not EarningTowardsThisKillstreak( controller, element )
					end
				end
				return f171_local0
			end
		},
		{
			stateName = "Charging",
			condition = function ( menu, element, event )
				return IsSelfModelValueNonEmptyString( element, controller, "rewardImage" ) and IsSelfModelValueEqualTo( element, controller, "rewardAmmo", 0 )
			end
		},
		{
			stateName = "ReadyMiddle",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThan( element, controller, "rewardAmmo", 0 )
			end
		}
	} )
	self:linkToElementModel( self, "rewardImage", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "rewardImage"
		} )
	end )
	self:linkToElementModel( self, "rewardAmmo", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "rewardAmmo"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "rewardMomentum" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "rewardMomentum"
		} )
	end )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RIGHT, nil, function ( element, menu, controller, model )
		if IsDpadButton( model ) then
			HandleScoreStreakDpadRight( self, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsDpadButton( nil ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RIGHT, "" )
			return false
		else
			return false
		end
	end, false )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ButtonContainer:close()
		element.BarBase:close()
		element.ScrStkUpArrow:close()
		element.ButtonContainer0:close()
		element.ScrStkDownArrow:close()
		element.IconDuplicateShadow:close()
		element.Icon:close()
		element.IconDuplicateAdd:close()
		element.Icon0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

