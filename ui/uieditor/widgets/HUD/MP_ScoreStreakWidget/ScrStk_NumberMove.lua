-- c3c04b8b93ff977d59795ab294981772
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidgetMP_PanelContainer" )

CoD.ScrStk_NumberMove = InheritFrom( LUI.UIElement )
CoD.ScrStk_NumberMove.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ScrStk_NumberMove )
	self.id = "ScrStk_NumberMove"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 55 )
	self:setTopBottom( true, false, 0, 22 )
	self.anyChildUsesUpdateState = true
	
	local PanelAmmo = CoD.DamageWidgetMP_PanelContainer.new( menu, controller )
	PanelAmmo:setLeftRight( false, false, -24.5, 10.5 )
	PanelAmmo:setTopBottom( false, false, -10.75, 10.75 )
	PanelAmmo:setRGB( 0.55, 0.58, 0.6 )
	PanelAmmo:setZoom( -4 )
	PanelAmmo.PanelAmmo0:setShaderVector( 0, 30, 10, 0, 0 )
	self:addElement( PanelAmmo )
	self.PanelAmmo = PanelAmmo
	
	local NumberFrame = LUI.UIImage.new()
	NumberFrame:setLeftRight( true, false, 7, 55 )
	NumberFrame:setTopBottom( true, false, 2.5, 18.5 )
	NumberFrame:setAlpha( 0 )
	NumberFrame:setImage( RegisterImage( "uie_t7_mp_hud_scorestreak_nmbrbox" ) )
	NumberFrame:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	NumberFrame:setShaderVector( 0, 0.1, 1, 0, 0 )
	NumberFrame:setShaderVector( 1, 0, 0, 0, 0 )
	NumberFrame:setShaderVector( 2, 0, 0, 0, 0 )
	NumberFrame:setShaderVector( 3, 0, 0, 0, 0 )
	NumberFrame:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( NumberFrame )
	self.NumberFrame = NumberFrame
	
	local TextBox = LUI.UIText.new()
	TextBox:setLeftRight( true, false, 0, 40 )
	TextBox:setTopBottom( true, false, 2.75, 18.75 )
	TextBox:setTTF( "fonts/default.ttf" )
	TextBox:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	TextBox:setShaderVector( 0, 0, 0.5, 0, 0 )
	TextBox:setShaderVector( 1, 0, 0, 0, 0 )
	TextBox:setShaderVector( 2, 0, 0, 0, 0 )
	TextBox:setShaderVector( 3, 0, 0, 0, 0 )
	TextBox:setShaderVector( 4, 0, 0, 0, 0 )
	TextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TextBox:subscribeToGlobalModel( controller, "KillstreakRewards", "targetMomentum", function ( model )
		local targetMomentum = Engine.GetModelValue( model )
		if targetMomentum then
			TextBox:setText( Engine.Localize( targetMomentum ) )
		end
	end )
	self:addElement( TextBox )
	self.TextBox = TextBox
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				PanelAmmo:completeAnimation()
				self.PanelAmmo:setLeftRight( false, false, -24.5, 10.5 )
				self.PanelAmmo:setTopBottom( false, false, -10.75, 10.75 )
				self.clipFinished( PanelAmmo, {} )

				NumberFrame:completeAnimation()
				self.NumberFrame:setLeftRight( true, false, 7, 55 )
				self.NumberFrame:setTopBottom( true, false, 2.5, 18.5 )
				self.clipFinished( NumberFrame, {} )

				TextBox:completeAnimation()
				self.TextBox:setLeftRight( true, false, 0, 40 )
				self.TextBox:setTopBottom( true, false, 2.75, 18.75 )
				self.clipFinished( TextBox, {} )
			end,
			Combat = function ()
				self:setupElementClipCounter( 3 )

				local PanelAmmoFrame2 = function ( PanelAmmo, event )
					if not event.interrupted then
						PanelAmmo:beginAnimation( "keyframe", 200, true, true, CoD.TweenType.Linear )
					end
					PanelAmmo:setLeftRight( false, false, -29.5, 5.5 )
					PanelAmmo:setTopBottom( false, false, -10.75, 10.75 )
					if event.interrupted then
						self.clipFinished( PanelAmmo, event )
					else
						PanelAmmo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PanelAmmo:completeAnimation()
				self.PanelAmmo:setLeftRight( false, false, -24.5, 10.5 )
				self.PanelAmmo:setTopBottom( false, false, -10.75, 10.75 )
				PanelAmmoFrame2( PanelAmmo, {} )
				local NumberFrameFrame2 = function ( NumberFrame, event )
					if not event.interrupted then
						NumberFrame:beginAnimation( "keyframe", 200, true, true, CoD.TweenType.Linear )
					end
					NumberFrame:setLeftRight( true, false, 2, 50 )
					NumberFrame:setTopBottom( true, false, 2.5, 18.5 )
					if event.interrupted then
						self.clipFinished( NumberFrame, event )
					else
						NumberFrame:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				NumberFrame:completeAnimation()
				self.NumberFrame:setLeftRight( true, false, 7, 55 )
				self.NumberFrame:setTopBottom( true, false, 2.5, 18.5 )
				NumberFrameFrame2( NumberFrame, {} )
				local TextBoxFrame2 = function ( TextBox, event )
					if not event.interrupted then
						TextBox:beginAnimation( "keyframe", 200, true, true, CoD.TweenType.Linear )
					end
					TextBox:setLeftRight( true, false, -5, 35 )
					TextBox:setTopBottom( true, false, 3.75, 17.75 )
					if event.interrupted then
						self.clipFinished( TextBox, event )
					else
						TextBox:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TextBox:completeAnimation()
				self.TextBox:setLeftRight( true, false, 0, 40 )
				self.TextBox:setTopBottom( true, false, 3.75, 17.75 )
				TextBoxFrame2( TextBox, {} )
			end
		},
		Combat = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				PanelAmmo:completeAnimation()
				self.PanelAmmo:setLeftRight( false, false, -29.5, 5.5 )
				self.PanelAmmo:setTopBottom( false, false, -10.75, 10.75 )
				self.clipFinished( PanelAmmo, {} )

				NumberFrame:completeAnimation()
				self.NumberFrame:setLeftRight( true, false, 2, 50 )
				self.NumberFrame:setTopBottom( true, false, 2.5, 18.5 )
				self.clipFinished( NumberFrame, {} )

				TextBox:completeAnimation()
				self.TextBox:setLeftRight( true, false, -5, 35 )
				self.TextBox:setTopBottom( true, false, 2.75, 18.75 )
				self.clipFinished( TextBox, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 3 )

				local PanelAmmoFrame2 = function ( PanelAmmo, event )
					if not event.interrupted then
						PanelAmmo:beginAnimation( "keyframe", 349, true, true, CoD.TweenType.Linear )
					end
					PanelAmmo:setLeftRight( false, false, -24.5, 10.5 )
					PanelAmmo:setTopBottom( false, false, -10.75, 10.75 )
					if event.interrupted then
						self.clipFinished( PanelAmmo, event )
					else
						PanelAmmo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PanelAmmo:completeAnimation()
				self.PanelAmmo:setLeftRight( false, false, -29.5, 5.5 )
				self.PanelAmmo:setTopBottom( false, false, -10.75, 10.75 )
				PanelAmmoFrame2( PanelAmmo, {} )
				local NumberFrameFrame2 = function ( NumberFrame, event )
					if not event.interrupted then
						NumberFrame:beginAnimation( "keyframe", 349, true, true, CoD.TweenType.Linear )
					end
					NumberFrame:setLeftRight( true, false, 7, 55 )
					NumberFrame:setTopBottom( true, false, 2.5, 18.5 )
					if event.interrupted then
						self.clipFinished( NumberFrame, event )
					else
						NumberFrame:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				NumberFrame:completeAnimation()
				self.NumberFrame:setLeftRight( true, false, 2, 50 )
				self.NumberFrame:setTopBottom( true, false, 2.5, 18.5 )
				NumberFrameFrame2( NumberFrame, {} )
				local TextBoxFrame2 = function ( TextBox, event )
					if not event.interrupted then
						TextBox:beginAnimation( "keyframe", 349, true, true, CoD.TweenType.Linear )
					end
					TextBox:setLeftRight( true, false, 0, 40 )
					TextBox:setTopBottom( true, false, 3.75, 17.75 )
					if event.interrupted then
						self.clipFinished( TextBox, event )
					else
						TextBox:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TextBox:completeAnimation()
				self.TextBox:setLeftRight( true, false, -5, 35 )
				self.TextBox:setTopBottom( true, false, 3.75, 17.75 )
				TextBoxFrame2( TextBox, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Combat",
			condition = function ( menu, element, event )
				return HasPerk( controller, "speciality_combat_efficiency" )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.isInUse" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.isInUse"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.PanelAmmo:close()
		element.TextBox:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

