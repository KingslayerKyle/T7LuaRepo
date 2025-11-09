require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )

CoD.ScrStk_MeterPanel = InheritFrom( LUI.UIElement )
CoD.ScrStk_MeterPanel.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ScrStk_MeterPanel )
	self.id = "ScrStk_MeterPanel"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 6 )
	self:setTopBottom( true, false, 0, 120 )
	
	local Fill = LUI.UIImage.new()
	Fill:setLeftRight( true, false, 0, 6 )
	Fill:setTopBottom( false, false, 60, -60 )
	Fill:setRGB( 0, 0, 0 )
	Fill:setAlpha( 0.5 )
	Fill:setImage( RegisterImage( "uie_t7_mp_hud_scorestreak_meterfill" ) )
	Fill:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Fill )
	self.Fill = Fill
	
	local FEButtonPanel0 = CoD.FE_ButtonPanel.new( menu, controller )
	FEButtonPanel0:setLeftRight( true, false, -8, 10 )
	FEButtonPanel0:setTopBottom( true, false, 0, 120 )
	FEButtonPanel0:setRGB( 0, 0, 0 )
	FEButtonPanel0:setAlpha( 0 )
	self:addElement( FEButtonPanel0 )
	self.FEButtonPanel0 = FEButtonPanel0
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, -51, 53 )
	Image0:setTopBottom( true, false, -32.77, 146.23 )
	Image0:setRGB( 0, 0, 0 )
	Image0:setAlpha( 0 )
	Image0:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				Fill:completeAnimation()
				self.Fill:setAlpha( 0.5 )
				self.clipFinished( Fill, {} )
				FEButtonPanel0:completeAnimation()
				self.FEButtonPanel0:setAlpha( 0 )
				self.clipFinished( FEButtonPanel0, {} )
				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				self.clipFinished( Image0, {} )
			end,
			Combat = function ()
				self:setupElementClipCounter( 3 )
				local FillFrame2 = function ( Fill, event )
					if not event.interrupted then
						Fill:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Fill:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Fill, event )
					else
						Fill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Fill:completeAnimation()
				self.Fill:setAlpha( 0.5 )
				FillFrame2( Fill, {} )
				local FEButtonPanel0Frame2 = function ( FEButtonPanel0, event )
					if not event.interrupted then
						FEButtonPanel0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					FEButtonPanel0:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( FEButtonPanel0, event )
					else
						FEButtonPanel0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonPanel0:completeAnimation()
				self.FEButtonPanel0:setAlpha( 0 )
				FEButtonPanel0Frame2( FEButtonPanel0, {} )
				local Image0Frame2 = function ( Image0, event )
					if not event.interrupted then
						Image0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Image0:setAlpha( 0.26 )
					if event.interrupted then
						self.clipFinished( Image0, event )
					else
						Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				Image0Frame2( Image0, {} )
			end
		},
		Combat = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				Fill:completeAnimation()
				self.Fill:setAlpha( 0 )
				self.clipFinished( Fill, {} )
				FEButtonPanel0:completeAnimation()
				self.FEButtonPanel0:setAlpha( 0.5 )
				self.clipFinished( FEButtonPanel0, {} )
				Image0:completeAnimation()
				self.Image0:setAlpha( 0.26 )
				self.clipFinished( Image0, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 3 )
				local FillFrame2 = function ( Fill, event )
					if not event.interrupted then
						Fill:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Fill:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( Fill, event )
					else
						Fill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Fill:completeAnimation()
				self.Fill:setAlpha( 0 )
				FillFrame2( Fill, {} )
				local FEButtonPanel0Frame2 = function ( FEButtonPanel0, event )
					if not event.interrupted then
						FEButtonPanel0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					FEButtonPanel0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FEButtonPanel0, event )
					else
						FEButtonPanel0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonPanel0:completeAnimation()
				self.FEButtonPanel0:setAlpha( 0.5 )
				FEButtonPanel0Frame2( FEButtonPanel0, {} )
				local Image0Frame2 = function ( Image0, event )
					if not event.interrupted then
						Image0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Image0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Image0, event )
					else
						Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setAlpha( 0.26 )
				Image0Frame2( Image0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Combat",
			condition = function ( menu, element, event )
				return HasPerk( controller, "specialty_combat_efficiency" )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.powerRatio" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.powerRatio"
		} )
	end )
	self.close = function ( self )
		self.FEButtonPanel0:close()
		CoD.ScrStk_MeterPanel.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

