-- c1247eb10c888312942711f3c63853dc
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidgetMP_PanelContainer" )
require( "ui.uieditor.widgets.onOffImage" )

CoD.ZMScr_ListingSm = InheritFrom( LUI.UIElement )
CoD.ZMScr_ListingSm.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ZMScr_ListingSm )
	self.id = "ZMScr_ListingSm"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 85 )
	self:setTopBottom( true, false, 0, 35 )
	self.anyChildUsesUpdateState = true
	
	local Panel = CoD.DamageWidgetMP_PanelContainer.new( menu, controller )
	Panel:setLeftRight( true, false, 0.5, 28.5 )
	Panel:setTopBottom( false, false, -15, 14 )
	Panel:setRGB( 0.61, 0.61, 0.61 )
	Panel.PanelAmmo0:setShaderVector( 0, 30, 10, 0, 0 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local Label3 = LUI.UITightText.new()
	Label3:setLeftRight( true, false, 30, 59 )
	Label3:setTopBottom( true, false, 2.25, 30.25 )
	Label3:setTTF( "fonts/WEARETRIPPINShort.ttf" )
	Label3:setLetterSpacing( 0.5 )
	Label3:linkToElementModel( self, "clientNum", true, function ( model )
		local clientNum = Engine.GetModelValue( model )
		if clientNum then
			Label3:setRGB( ZombieClientScoreboardColor( clientNum ) )
		end
	end )
	Label3:linkToElementModel( self, "playerScore", true, function ( model )
		local playerScore = Engine.GetModelValue( model )
		if playerScore then
			Label3:setText( Engine.Localize( playerScore ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( Label3, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 0 )
	end )
	self:addElement( Label3 )
	self.Label3 = Label3
	
	local portraitIcon = CoD.onOffImage.new( menu, controller )
	portraitIcon:setLeftRight( true, false, 2.28, 26 )
	portraitIcon:setTopBottom( true, false, 4.25, 27.97 )
	portraitIcon:linkToElementModel( self, nil, false, function ( model )
		portraitIcon:setModel( model, controller )
	end )
	portraitIcon:linkToElementModel( self, "zombiePlayerIcon", true, function ( model )
		local zombiePlayerIcon = Engine.GetModelValue( model )
		if zombiePlayerIcon then
			portraitIcon.image:setImage( RegisterImage( zombiePlayerIcon ) )
		end
	end )
	portraitIcon:mergeStateConditions( {
		{
			stateName = "On",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "zombieWearableIcon", "blacktransparent" )
			end
		}
	} )
	portraitIcon:linkToElementModel( portraitIcon, "zombieWearableIcon", true, function ( model )
		menu:updateElementState( portraitIcon, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zombieWearableIcon"
		} )
	end )
	self:addElement( portraitIcon )
	self.portraitIcon = portraitIcon
	
	local wearableIcon = CoD.onOffImage.new( menu, controller )
	wearableIcon:setLeftRight( true, false, 2.28, 26 )
	wearableIcon:setTopBottom( true, false, 4.25, 27.97 )
	wearableIcon:linkToElementModel( self, nil, false, function ( model )
		wearableIcon:setModel( model, controller )
	end )
	wearableIcon:linkToElementModel( self, "zombieWearableIcon", true, function ( model )
		local zombieWearableIcon = Engine.GetModelValue( model )
		if zombieWearableIcon then
			wearableIcon.image:setImage( RegisterImage( zombieWearableIcon ) )
		end
	end )
	wearableIcon:mergeStateConditions( {
		{
			stateName = "On",
			condition = function ( menu, element, event )
				return not IsSelfModelValueEqualTo( element, controller, "zombieWearableIcon", "blacktransparent" )
			end
		}
	} )
	wearableIcon:linkToElementModel( wearableIcon, "zombieWearableIcon", true, function ( model )
		menu:updateElementState( wearableIcon, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zombieWearableIcon"
		} )
	end )
	self:addElement( wearableIcon )
	self.wearableIcon = wearableIcon
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, true, 9, -5 )
	Glow:setTopBottom( true, false, 0, 34.5 )
	Glow:setAlpha( 0.2 )
	Glow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	Glow:linkToElementModel( self, "clientNum", true, function ( model )
		local clientNum = Engine.GetModelValue( model )
		if clientNum then
			Glow:setRGB( ZombieClientScoreboardGlowColor( clientNum ) )
		end
	end )
	self:addElement( Glow )
	self.Glow = Glow
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 20 )
	Image0:setTopBottom( false, true, -20, 0 )
	Image0:linkToElementModel( self, "zombieInventoryIcon", true, function ( model )
		local zombieInventoryIcon = Engine.GetModelValue( model )
		if zombieInventoryIcon then
			Image0:setImage( RegisterImage( zombieInventoryIcon ) )
		end
	end )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				Panel:completeAnimation()
				self.Panel:setAlpha( 0 )
				self.clipFinished( Panel, {} )
				Label3:completeAnimation()
				self.Label3:setAlpha( 0 )
				self.clipFinished( Label3, {} )
				portraitIcon:completeAnimation()
				self.portraitIcon:setAlpha( 0 )
				self.clipFinished( portraitIcon, {} )
				wearableIcon:completeAnimation()
				self.wearableIcon:setAlpha( 0 )
				self.clipFinished( wearableIcon, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
				Image0:completeAnimation()
				self.Image0:setLeftRight( true, false, 0, 20 )
				self.Image0:setTopBottom( false, true, -20, 0 )
				self.Image0:setAlpha( 0 )
				self.clipFinished( Image0, {} )
			end,
			Visible = function ()
				self:setupElementClipCounter( 6 )
				local PanelFrame2 = function ( Panel, event )
					if not event.interrupted then
						Panel:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					Panel:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Panel, event )
					else
						Panel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Panel:completeAnimation()
				self.Panel:setAlpha( 0 )
				PanelFrame2( Panel, {} )
				local Label3Frame2 = function ( Label3, event )
					if not event.interrupted then
						Label3:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					Label3:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Label3, event )
					else
						Label3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Label3:completeAnimation()
				self.Label3:setAlpha( 0 )
				Label3Frame2( Label3, {} )
				local portraitIconFrame2 = function ( portraitIcon, event )
					if not event.interrupted then
						portraitIcon:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					portraitIcon:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( portraitIcon, event )
					else
						portraitIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				portraitIcon:completeAnimation()
				self.portraitIcon:setAlpha( 0 )
				portraitIconFrame2( portraitIcon, {} )
				local wearableIconFrame2 = function ( wearableIcon, event )
					if not event.interrupted then
						wearableIcon:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					wearableIcon:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( wearableIcon, event )
					else
						wearableIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				wearableIcon:completeAnimation()
				self.wearableIcon:setAlpha( 0 )
				wearableIconFrame2( wearableIcon, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					Glow:setAlpha( 0.2 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
				local Image0Frame2 = function ( Image0, event )
					if not event.interrupted then
						Image0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					Image0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Image0, event )
					else
						Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				Image0Frame2( Image0, {} )
			end,
			VisibleTomb = function ()
				self:setupElementClipCounter( 6 )
				local PanelFrame2 = function ( Panel, event )
					if not event.interrupted then
						Panel:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					Panel:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Panel, event )
					else
						Panel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Panel:completeAnimation()
				self.Panel:setAlpha( 0 )
				PanelFrame2( Panel, {} )
				local Label3Frame2 = function ( Label3, event )
					if not event.interrupted then
						Label3:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					Label3:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Label3, event )
					else
						Label3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Label3:completeAnimation()
				self.Label3:setAlpha( 0 )
				Label3Frame2( Label3, {} )
				local portraitIconFrame2 = function ( portraitIcon, event )
					if not event.interrupted then
						portraitIcon:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					portraitIcon:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( portraitIcon, event )
					else
						portraitIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				portraitIcon:completeAnimation()
				self.portraitIcon:setAlpha( 0 )
				portraitIconFrame2( portraitIcon, {} )
				local wearableIconFrame2 = function ( wearableIcon, event )
					if not event.interrupted then
						wearableIcon:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					wearableIcon:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( wearableIcon, event )
					else
						wearableIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				wearableIcon:completeAnimation()
				self.wearableIcon:setAlpha( 0 )
				wearableIconFrame2( wearableIcon, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					Glow:setAlpha( 0.2 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
				local Image0Frame2 = function ( Image0, event )
					if not event.interrupted then
						Image0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					Image0:setLeftRight( true, false, -13.72, 6.28 )
					Image0:setTopBottom( false, true, -27.03, -7.03 )
					Image0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Image0, event )
					else
						Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setLeftRight( true, false, -13.72, 6.28 )
				self.Image0:setTopBottom( false, true, -27.03, -7.03 )
				self.Image0:setAlpha( 0 )
				Image0Frame2( Image0, {} )
			end
		},
		VisibleTomb = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				Panel:completeAnimation()
				self.Panel:setAlpha( 1 )
				self.clipFinished( Panel, {} )
				Label3:completeAnimation()
				self.Label3:setAlpha( 1 )
				self.clipFinished( Label3, {} )
				portraitIcon:completeAnimation()
				self.portraitIcon:setAlpha( 1 )
				self.clipFinished( portraitIcon, {} )
				wearableIcon:completeAnimation()
				self.wearableIcon:setAlpha( 1 )
				self.clipFinished( wearableIcon, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0.2 )
				self.clipFinished( Glow, {} )
				Image0:completeAnimation()
				self.Image0:setLeftRight( true, false, -13.72, 6.28 )
				self.Image0:setTopBottom( false, true, -27.03, -7.03 )
				self.Image0:setAlpha( 1 )
				self.clipFinished( Image0, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 6 )
				local PanelFrame2 = function ( Panel, event )
					if not event.interrupted then
						Panel:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Panel:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Panel, event )
					else
						Panel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Panel:completeAnimation()
				self.Panel:setAlpha( 1 )
				PanelFrame2( Panel, {} )
				local Label3Frame2 = function ( Label3, event )
					if not event.interrupted then
						Label3:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Label3:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Label3, event )
					else
						Label3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Label3:completeAnimation()
				self.Label3:setAlpha( 1 )
				Label3Frame2( Label3, {} )
				local portraitIconFrame2 = function ( portraitIcon, event )
					if not event.interrupted then
						portraitIcon:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					portraitIcon:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( portraitIcon, event )
					else
						portraitIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				portraitIcon:completeAnimation()
				self.portraitIcon:setAlpha( 1 )
				portraitIconFrame2( portraitIcon, {} )
				local wearableIconFrame2 = function ( wearableIcon, event )
					if not event.interrupted then
						wearableIcon:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					wearableIcon:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( wearableIcon, event )
					else
						wearableIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				wearableIcon:completeAnimation()
				self.wearableIcon:setAlpha( 1 )
				wearableIconFrame2( wearableIcon, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Glow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setAlpha( 0.2 )
				GlowFrame2( Glow, {} )
				local Image0Frame2 = function ( Image0, event )
					if not event.interrupted then
						Image0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Image0:setLeftRight( true, false, -13.72, 6.28 )
					Image0:setTopBottom( false, true, -27.03, -7.03 )
					Image0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Image0, event )
					else
						Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setLeftRight( true, false, -13.72, 6.28 )
				self.Image0:setTopBottom( false, true, -27.03, -7.03 )
				self.Image0:setAlpha( 1 )
				Image0Frame2( Image0, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				Panel:completeAnimation()
				self.Panel:setAlpha( 1 )
				self.clipFinished( Panel, {} )
				Label3:completeAnimation()
				self.Label3:setAlpha( 1 )
				self.clipFinished( Label3, {} )
				portraitIcon:completeAnimation()
				self.portraitIcon:setAlpha( 1 )
				self.clipFinished( portraitIcon, {} )
				wearableIcon:completeAnimation()
				self.wearableIcon:setAlpha( 1 )
				self.clipFinished( wearableIcon, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0.2 )
				self.clipFinished( Glow, {} )
				Image0:completeAnimation()
				self.Image0:setAlpha( 1 )
				self.clipFinished( Image0, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 6 )
				local PanelFrame2 = function ( Panel, event )
					if not event.interrupted then
						Panel:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Panel:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Panel, event )
					else
						Panel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Panel:completeAnimation()
				self.Panel:setAlpha( 1 )
				PanelFrame2( Panel, {} )
				local Label3Frame2 = function ( Label3, event )
					if not event.interrupted then
						Label3:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Label3:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Label3, event )
					else
						Label3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Label3:completeAnimation()
				self.Label3:setAlpha( 1 )
				Label3Frame2( Label3, {} )
				local portraitIconFrame2 = function ( portraitIcon, event )
					if not event.interrupted then
						portraitIcon:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					portraitIcon:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( portraitIcon, event )
					else
						portraitIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				portraitIcon:completeAnimation()
				self.portraitIcon:setAlpha( 1 )
				portraitIconFrame2( portraitIcon, {} )
				local wearableIconFrame2 = function ( wearableIcon, event )
					if not event.interrupted then
						wearableIcon:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					wearableIcon:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( wearableIcon, event )
					else
						wearableIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				wearableIcon:completeAnimation()
				self.wearableIcon:setAlpha( 1 )
				wearableIconFrame2( wearableIcon, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Glow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setAlpha( 0.2 )
				GlowFrame2( Glow, {} )
				local Image0Frame2 = function ( Image0, event )
					if not event.interrupted then
						Image0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Image0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Image0, event )
					else
						Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setAlpha( 1 )
				Image0Frame2( Image0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "VisibleTomb",
			condition = function ( menu, element, event )
				local f46_local0
				if not IsSelfModelValueEqualTo( element, controller, "playerScoreShown", 0 ) then
					f46_local0 = IsMapName( "zm_tomb" )
				else
					f46_local0 = false
				end
				return f46_local0
			end
		},
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return not IsSelfModelValueEqualTo( element, controller, "playerScoreShown", 0 )
			end
		}
	} )
	self:linkToElementModel( self, "playerScoreShown", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerScoreShown"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Panel:close()
		element.portraitIcon:close()
		element.wearableIcon:close()
		element.Label3:close()
		element.Glow:close()
		element.Image0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

