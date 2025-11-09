require( "ui.uieditor.widgets.HUD.MP_ScoreStreakWidget.ScrStk_ButtonInternal" )
require( "ui.uieditor.widgets.HUD.core_MapWidget.MapWidget_BarTop" )

local PostLoadFunc = function ( self, controller )
	self.m_focusable = true
	local controller = controller
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( self, state )
		if self.gridInfoTable then
			local list = self.gridInfoTable.parentGrid
			if self:hasClip( "Focus" ) then
				self:processEvent( {
					name = "gain_focus",
					controller = controller
				} )
			elseif list.activeWidget == self then
				list:getFirstSelectableItem( true )
			end
		end
	end )
	self:registerEventHandler( "gamepad_button", function ( self, event )
		if self:isInFocus() and event.button == "right" and event.down == true then
			if not self:hasClip( "Focus" ) then
				Engine.SwitchToInventoryWeapon( event.controller )
			else
				local slotIndex = Engine.GetModelValue( Engine.GetModel( self:getModel(), "rewardSlot" ) )
				if slotIndex ~= nil then
					Engine.ActionSlotSelectWeapon( event.controller, slotIndex )
				else
					Engine.SwitchToInventoryWeapon( event.controller )
				end
			end
		else
			LUI.UIElement.GamepadButton( self, event )
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
	
	local StrokeInner = LUI.UIImage.new()
	StrokeInner:setLeftRight( true, false, 7, 59 )
	StrokeInner:setTopBottom( true, false, 8, 44 )
	StrokeInner:setRGB( 1, 1, 1 )
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
	Stroke:setRGB( 1, 1, 1 )
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
	DarkGlow:setLeftRight( true, false, -8.68, 75.68 )
	DarkGlow:setTopBottom( true, false, -6, 56 )
	DarkGlow:setRGB( 0, 0, 0 )
	DarkGlow:setAlpha( 0 )
	DarkGlow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	DarkGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( DarkGlow )
	self.DarkGlow = DarkGlow
	
	local ButtonContainer = CoD.ScrStk_ButtonInternal.new( menu, controller )
	ButtonContainer:setLeftRight( true, false, 2, 71 )
	ButtonContainer:setTopBottom( true, false, -6, 57 )
	ButtonContainer:setRGB( 0.51, 0.55, 0.64 )
	ButtonContainer:setAlpha( 0.5 )
	ButtonContainer:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	ButtonContainer:setShaderVector( 0, 0, 0, 0, 0 )
	ButtonContainer:setShaderVector( 1, 0, 0, 0, 0 )
	ButtonContainer:setShaderVector( 2, 0, 0, 0, 0 )
	ButtonContainer:setShaderVector( 3, 0, 0, 0, 0 )
	ButtonContainer:setShaderVector( 4, 0, 0, 0, 0 )
	ButtonContainer.ArrowSide:setAlpha( 0 )
	ButtonContainer:linkToElementModel( self, "rewardImage", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ButtonContainer.Icon:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( ButtonContainer )
	self.ButtonContainer = ButtonContainer
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, false, -12.31, 78.31 )
	Glow:setTopBottom( true, false, -10.66, 60.66 )
	Glow:setRGB( 0.97, 1, 0 )
	Glow:setAlpha( 0 )
	Glow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local Icon = LUI.UIImage.new()
	Icon:setLeftRight( false, false, -26.5, 21.5 )
	Icon:setTopBottom( false, false, -25, 23 )
	Icon:setRGB( 0.51, 0.55, 0.64 )
	Icon:setAlpha( 0.3 )
	Icon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	Icon:linkToElementModel( self, "rewardImage", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Icon:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( Icon )
	self.Icon = Icon
	
	local BarBase = CoD.MapWidget_BarTop.new( menu, controller )
	BarBase:setLeftRight( true, false, -7, 8 )
	BarBase:setTopBottom( true, false, 24.5, 32.5 )
	BarBase:setRGB( 1, 1, 1 )
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
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				StrokeInner:completeAnimation()
				self.StrokeInner:setAlpha( 0.2 )
				self.clipFinished( StrokeInner, {} )
				Stroke:completeAnimation()
				self.Stroke:setAlpha( 0.2 )
				self.clipFinished( Stroke, {} )
				DarkGlow:completeAnimation()
				self.DarkGlow:setAlpha( 0 )
				self.clipFinished( DarkGlow, {} )
				ButtonContainer:completeAnimation()
				ButtonContainer.ArrowSide:completeAnimation()
				self.ButtonContainer:setRGB( 0.51, 0.55, 0.64 )
				self.ButtonContainer:setAlpha( 0 )
				self.ButtonContainer:setZoom( 0 )
				self.ButtonContainer.ArrowSide:setAlpha( 0 )
				self.clipFinished( ButtonContainer, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
				Icon:completeAnimation()
				self.Icon:setRGB( 0.51, 0.55, 0.64 )
				self.Icon:setAlpha( 0 )
				self.Icon:setZoom( 0 )
				self.clipFinished( Icon, {} )
				BarBase:completeAnimation()
				self.BarBase:setAlpha( 0 )
				self.clipFinished( BarBase, {} )
			end,
			Charging = function ()
				self:setupElementClipCounter( 6 )
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
				DarkGlow:completeAnimation()
				self.DarkGlow:setAlpha( 0 )
				self.clipFinished( DarkGlow, {} )
				local ButtonContainerFrame2 = function ( ButtonContainer, event )
					if not event.interrupted then
						ButtonContainer:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						ButtonContainer.ArrowSide:beginAnimation( "subkeyframe", 500, false, false, CoD.TweenType.Linear )
					end
					ButtonContainer:setRGB( 0.51, 0.55, 0.64 )
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
				local IconFrame2 = function ( Icon, event )
					if not event.interrupted then
						Icon:beginAnimation( "keyframe", 479, false, false, CoD.TweenType.Linear )
					end
					Icon:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Icon, event )
					else
						Icon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Icon:completeAnimation()
				self.Icon:setAlpha( 0 )
				IconFrame2( Icon, {} )
			end,
			ReadyMiddle = function ()
				self:setupElementClipCounter( 6 )
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
				local IconFrame2 = function ( Icon, event )
					if not event.interrupted then
						Icon:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					Icon:setRGB( 1, 1, 1 )
					Icon:setAlpha( 0.9 )
					if event.interrupted then
						self.clipFinished( Icon, event )
					else
						Icon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Icon:completeAnimation()
				self.Icon:setRGB( 0.51, 0.55, 0.64 )
				self.Icon:setAlpha( 0 )
				IconFrame2( Icon, {} )
			end
		},
		Inactive = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				StrokeInner:completeAnimation()
				self.StrokeInner:setAlpha( 0 )
				self.clipFinished( StrokeInner, {} )
				Stroke:completeAnimation()
				self.Stroke:setAlpha( 0 )
				self.clipFinished( Stroke, {} )
				DarkGlow:completeAnimation()
				self.DarkGlow:setAlpha( 0 )
				self.clipFinished( DarkGlow, {} )
				ButtonContainer:completeAnimation()
				ButtonContainer.ArrowSide:completeAnimation()
				self.ButtonContainer:setRGB( 0.51, 0.55, 0.64 )
				self.ButtonContainer:setAlpha( 0.5 )
				self.ButtonContainer:setZoom( 0 )
				self.ButtonContainer.ArrowSide:setAlpha( 0 )
				self.clipFinished( ButtonContainer, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
				Icon:completeAnimation()
				self.Icon:setRGB( 0.51, 0.55, 0.64 )
				self.Icon:setAlpha( 0.3 )
				self.Icon:setZoom( 0 )
				self.clipFinished( Icon, {} )
				BarBase:completeAnimation()
				self.BarBase:setAlpha( 0 )
				self.clipFinished( BarBase, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 6 )
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
				DarkGlow:completeAnimation()
				self.DarkGlow:setAlpha( 0 )
				self.clipFinished( DarkGlow, {} )
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
				self.ButtonContainer:setAlpha( 0.5 )
				self.ButtonContainer:setZoom( 0 )
				self.ButtonContainer.ArrowSide:setAlpha( 0 )
				ButtonContainerFrame2( ButtonContainer, {} )
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
				local IconFrame2 = function ( Icon, event )
					if not event.interrupted then
						Icon:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
					end
					Icon:setRGB( 0.51, 0.55, 0.64 )
					Icon:setAlpha( 0 )
					Icon:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( Icon, event )
					else
						Icon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Icon:completeAnimation()
				self.Icon:setRGB( 0.51, 0.55, 0.64 )
				self.Icon:setAlpha( 0.3 )
				self.Icon:setZoom( 0 )
				IconFrame2( Icon, {} )
			end,
			ReadyMiddle = function ()
				self:setupElementClipCounter( 6 )
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
				self.ButtonContainer:setAlpha( 0.5 )
				self.ButtonContainer:setZoom( 0 )
				self.ButtonContainer.ArrowSide:setAlpha( 0 )
				ButtonContainerFrame2( ButtonContainer, {} )
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
				local IconFrame2 = function ( Icon, event )
					if not event.interrupted then
						Icon:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					Icon:setRGB( 1, 1, 1 )
					Icon:setAlpha( 0.9 )
					if event.interrupted then
						self.clipFinished( Icon, event )
					else
						Icon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Icon:completeAnimation()
				self.Icon:setRGB( 0.51, 0.55, 0.64 )
				self.Icon:setAlpha( 0.3 )
				IconFrame2( Icon, {} )
			end,
			Charging = function ()
				self:setupElementClipCounter( 7 )
				local StrokeInnerFrame2 = function ( StrokeInner, event )
					if not event.interrupted then
						StrokeInner:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
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
						Stroke:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
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
						DarkGlow:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					DarkGlow:setAlpha( 0.3 )
					if event.interrupted then
						self.clipFinished( DarkGlow, event )
					else
						DarkGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DarkGlow:completeAnimation()
				self.DarkGlow:setAlpha( 0 )
				DarkGlowFrame2( DarkGlow, {} )
				local ButtonContainerFrame2 = function ( ButtonContainer, event )
					if not event.interrupted then
						ButtonContainer:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						ButtonContainer.ArrowSide:beginAnimation( "subkeyframe", 300, false, false, CoD.TweenType.Linear )
					end
					ButtonContainer:setRGB( 0.51, 0.55, 0.64 )
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
				self.ButtonContainer:setAlpha( 0.5 )
				self.ButtonContainer:setZoom( 0 )
				self.ButtonContainer.ArrowSide:setAlpha( 0 )
				ButtonContainerFrame2( ButtonContainer, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
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
				local IconFrame2 = function ( Icon, event )
					if not event.interrupted then
						Icon:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Icon:setRGB( 0.51, 0.55, 0.64 )
					Icon:setAlpha( 1 )
					Icon:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( Icon, event )
					else
						Icon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Icon:completeAnimation()
				self.Icon:setRGB( 0.51, 0.55, 0.64 )
				self.Icon:setAlpha( 0.3 )
				self.Icon:setZoom( 0 )
				IconFrame2( Icon, {} )
				local BarBaseFrame2 = function ( BarBase, event )
					if not event.interrupted then
						BarBase:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
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
			end
		},
		Charging = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				StrokeInner:completeAnimation()
				self.StrokeInner:setAlpha( 0 )
				self.clipFinished( StrokeInner, {} )
				Stroke:completeAnimation()
				self.Stroke:setAlpha( 0 )
				self.clipFinished( Stroke, {} )
				DarkGlow:completeAnimation()
				self.DarkGlow:setAlpha( 0.3 )
				self.clipFinished( DarkGlow, {} )
				ButtonContainer:completeAnimation()
				ButtonContainer.ArrowSide:completeAnimation()
				self.ButtonContainer:setRGB( 0.51, 0.55, 0.64 )
				self.ButtonContainer:setAlpha( 1 )
				self.ButtonContainer:setZoom( 0 )
				self.ButtonContainer.ArrowSide:setAlpha( 0 )
				self.clipFinished( ButtonContainer, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
				Icon:completeAnimation()
				self.Icon:setRGB( 0.51, 0.55, 0.64 )
				self.Icon:setAlpha( 1 )
				self.Icon:setZoom( 0 )
				self.clipFinished( Icon, {} )
				BarBase:completeAnimation()
				self.BarBase:setAlpha( 0.7 )
				self.clipFinished( BarBase, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 7 )
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
				self.ButtonContainer:setAlpha( 1 )
				self.ButtonContainer:setZoom( 0 )
				self.ButtonContainer.ArrowSide:setAlpha( 0 )
				ButtonContainerFrame2( ButtonContainer, {} )
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
				local IconFrame2 = function ( Icon, event )
					if not event.interrupted then
						Icon:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					Icon:setRGB( 0.51, 0.55, 0.64 )
					Icon:setAlpha( 0.3 )
					if event.interrupted then
						self.clipFinished( Icon, event )
					else
						Icon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Icon:completeAnimation()
				self.Icon:setRGB( 0.51, 0.55, 0.64 )
				self.Icon:setAlpha( 1 )
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
			end,
			ReadyMiddle = function ()
				self:setupElementClipCounter( 7 )
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
				self.ButtonContainer:setAlpha( 1 )
				self.ButtonContainer:setZoom( 0 )
				self.ButtonContainer.ArrowSide:setAlpha( 0 )
				ButtonContainerFrame2( ButtonContainer, {} )
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
				local IconFrame2 = function ( Icon, event )
					if not event.interrupted then
						Icon:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Bounce )
					end
					Icon:setRGB( 1, 1, 1 )
					Icon:setAlpha( 0.9 )
					if event.interrupted then
						self.clipFinished( Icon, event )
					else
						Icon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Icon:completeAnimation()
				self.Icon:setRGB( 0.51, 0.55, 0.64 )
				self.Icon:setAlpha( 1 )
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
			end
		},
		ReadyMiddle = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				StrokeInner:completeAnimation()
				self.StrokeInner:setAlpha( 0 )
				self.clipFinished( StrokeInner, {} )
				Stroke:completeAnimation()
				self.Stroke:setAlpha( 0 )
				self.clipFinished( Stroke, {} )
				DarkGlow:completeAnimation()
				self.DarkGlow:setAlpha( 0.4 )
				self.clipFinished( DarkGlow, {} )
				ButtonContainer:completeAnimation()
				ButtonContainer.ArrowSide:completeAnimation()
				self.ButtonContainer:setRGB( 1, 0.97, 0.35 )
				self.ButtonContainer:setAlpha( 1 )
				self.ButtonContainer:setZoom( 0 )
				self.ButtonContainer.ArrowSide:setAlpha( 0 )
				self.clipFinished( ButtonContainer, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
				Icon:completeAnimation()
				self.Icon:setRGB( 1, 1, 1 )
				self.Icon:setAlpha( 0.9 )
				self.Icon:setZoom( 0 )
				self.clipFinished( Icon, {} )
				BarBase:completeAnimation()
				self.BarBase:setAlpha( 0 )
				self.clipFinished( BarBase, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 6 )
				StrokeInner:completeAnimation()
				self.StrokeInner:setAlpha( 0 )
				self.clipFinished( StrokeInner, {} )
				Stroke:completeAnimation()
				self.Stroke:setAlpha( 0 )
				self.clipFinished( Stroke, {} )
				DarkGlow:completeAnimation()
				self.DarkGlow:setAlpha( 0.8 )
				self.clipFinished( DarkGlow, {} )
				ButtonContainer:completeAnimation()
				ButtonContainer.ArrowSide:completeAnimation()
				self.ButtonContainer:setRGB( 1, 0.97, 0.35 )
				self.ButtonContainer:setAlpha( 1 )
				self.ButtonContainer:setZoom( 20 )
				self.ButtonContainer.ArrowSide:setAlpha( 1 )
				self.clipFinished( ButtonContainer, {} )
				Glow:completeAnimation()
				self.Glow:setRGB( 1, 0.93, 0 )
				self.Glow:setAlpha( 0.8 )
				self.clipFinished( Glow, {} )
				Icon:completeAnimation()
				self.Icon:setRGB( 1, 1, 1 )
				self.Icon:setAlpha( 1 )
				self.Icon:setZoom( 20 )
				self.clipFinished( Icon, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 5 )
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
					DarkGlow:setAlpha( 0.8 )
					if event.interrupted then
						self.clipFinished( DarkGlow, event )
					else
						DarkGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DarkGlow:completeAnimation()
				self.DarkGlow:setAlpha( 0.4 )
				DarkGlowFrame2( DarkGlow, {} )
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
				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						local GlowFrame4 = function ( Glow, event )
							local GlowFrame5 = function ( Glow, event )
								local GlowFrame6 = function ( Glow, event )
									if not event.interrupted then
										Glow:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									end
									Glow:setRGB( 1, 0.93, 0 )
									Glow:setAlpha( 0.8 )
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
				local IconFrame2 = function ( Icon, event )
					if not event.interrupted then
						Icon:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Back )
					end
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
				self.Icon:setRGB( 1, 1, 1 )
				self.Icon:setAlpha( 0.9 )
				self.Icon:setZoom( 0 )
				IconFrame2( Icon, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 5 )
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
					DarkGlow:setAlpha( 0.4 )
					if event.interrupted then
						self.clipFinished( DarkGlow, event )
					else
						DarkGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DarkGlow:completeAnimation()
				self.DarkGlow:setAlpha( 0.8 )
				DarkGlowFrame2( DarkGlow, {} )
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
				self.ButtonContainer:setRGB( 1, 0.97, 0.35 )
				self.ButtonContainer:setAlpha( 1 )
				self.ButtonContainer:setZoom( 20 )
				self.ButtonContainer.ArrowSide:setAlpha( 1 )
				ButtonContainerFrame2( ButtonContainer, {} )
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
				self.Glow:setAlpha( 0.8 )
				GlowFrame2( Glow, {} )
				local IconFrame2 = function ( Icon, event )
					if not event.interrupted then
						Icon:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
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
				self.Icon:setRGB( 1, 1, 1 )
				self.Icon:setAlpha( 1 )
				self.Icon:setZoom( 20 )
				IconFrame2( Icon, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 6 )
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
						DarkGlow:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
					end
					DarkGlow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( DarkGlow, event )
					else
						DarkGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DarkGlow:completeAnimation()
				self.DarkGlow:setAlpha( 0.4 )
				DarkGlowFrame2( DarkGlow, {} )
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
				local IconFrame2 = function ( Icon, event )
					if not event.interrupted then
						Icon:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
					end
					Icon:setRGB( 1, 1, 1 )
					Icon:setAlpha( 0 )
					Icon:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( Icon, event )
					else
						Icon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Icon:completeAnimation()
				self.Icon:setRGB( 1, 1, 1 )
				self.Icon:setAlpha( 0.9 )
				self.Icon:setZoom( 0 )
				IconFrame2( Icon, {} )
			end,
			Charging = function ()
				self:setupElementClipCounter( 6 )
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
					DarkGlow:setAlpha( 0.3 )
					if event.interrupted then
						self.clipFinished( DarkGlow, event )
					else
						DarkGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DarkGlow:completeAnimation()
				self.DarkGlow:setAlpha( 0.4 )
				DarkGlowFrame2( DarkGlow, {} )
				local ButtonContainerFrame2 = function ( ButtonContainer, event )
					if not event.interrupted then
						ButtonContainer:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						ButtonContainer.ArrowSide:beginAnimation( "subkeyframe", 500, false, false, CoD.TweenType.Linear )
					end
					ButtonContainer:setRGB( 0.51, 0.55, 0.64 )
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
				self.ButtonContainer:setRGB( 1, 0.97, 0.35 )
				self.ButtonContainer:setAlpha( 1 )
				self.ButtonContainer:setZoom( 0 )
				self.ButtonContainer.ArrowSide:setAlpha( 0 )
				ButtonContainerFrame2( ButtonContainer, {} )
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
				local IconFrame2 = function ( Icon, event )
					if not event.interrupted then
						Icon:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					Icon:setRGB( 0.51, 0.55, 0.64 )
					Icon:setAlpha( 1 )
					Icon:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( Icon, event )
					else
						Icon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Icon:completeAnimation()
				self.Icon:setRGB( 1, 1, 1 )
				self.Icon:setAlpha( 0.9 )
				self.Icon:setZoom( 0 )
				IconFrame2( Icon, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Inactive",
			condition = function ( menu, element, event )
				local f100_local0 = IsSelfModelValueNonEmptyString( element, controller, "rewardImage" )
				if f100_local0 then
					f100_local0 = IsSelfModelValueEqualTo( element, controller, "rewardAmmo", 0 )
					if f100_local0 then
						f100_local0 = not EarningTowardsThisKillstreak( controller, element )
					end
				end
				return f100_local0
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
	self.close = function ( self )
		self.ButtonContainer:close()
		self.BarBase:close()
		self.Icon:close()
		CoD.ScrStk_Button.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

