require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidgetMP_PanelContainer" )

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
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( true, false, 2.28, 26 )
	Image:setTopBottom( true, false, 4.25, 27.97 )
	Image:linkToElementModel( self, "zombiePlayerIcon", true, function ( model )
		local zombiePlayerIcon = Engine.GetModelValue( model )
		if zombiePlayerIcon then
			Image:setImage( RegisterImage( zombiePlayerIcon ) )
		end
	end )
	self:addElement( Image )
	self.Image = Image
	
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
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				Panel:completeAnimation()
				self.Panel:setAlpha( 0 )
				self.clipFinished( Panel, {} )
				Label3:completeAnimation()
				self.Label3:setAlpha( 0 )
				self.clipFinished( Label3, {} )
				Image:completeAnimation()
				self.Image:setAlpha( 0 )
				self.clipFinished( Image, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
			end,
			Visible = function ()
				self:setupElementClipCounter( 4 )
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
				local ImageFrame2 = function ( Image, event )
					if not event.interrupted then
						Image:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					Image:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Image, event )
					else
						Image:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image:completeAnimation()
				self.Image:setAlpha( 0 )
				ImageFrame2( Image, {} )
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
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				Panel:completeAnimation()
				self.Panel:setAlpha( 1 )
				self.clipFinished( Panel, {} )
				Label3:completeAnimation()
				self.Label3:setAlpha( 1 )
				self.clipFinished( Label3, {} )
				Image:completeAnimation()
				self.Image:setAlpha( 1 )
				self.clipFinished( Image, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0.2 )
				self.clipFinished( Glow, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 4 )
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
				local ImageFrame2 = function ( Image, event )
					if not event.interrupted then
						Image:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Image:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Image, event )
					else
						Image:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image:completeAnimation()
				self.Image:setAlpha( 1 )
				ImageFrame2( Image, {} )
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
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "playerScoreShown", 1 )
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
		element.Label3:close()
		element.Image:close()
		element.Glow:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

