-- 886e6e7db2e24dc22e60b4b4bf95cea5
-- This hash is used for caching, delete to decompile the file again

CoD.ScrStk_CombatEfficiencyBackGlow = InheritFrom( LUI.UIElement )
CoD.ScrStk_CombatEfficiencyBackGlow.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ScrStk_CombatEfficiencyBackGlow )
	self.id = "ScrStk_CombatEfficiencyBackGlow"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 212 )
	self:setTopBottom( true, false, 0, 247 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 212 )
	Image0:setTopBottom( true, false, 0, 247 )
	Image0:setRGB( 0, 0.46, 1 )
	Image0:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				self.clipFinished( Image0, {} )
			end
		},
		CombatReady = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local Image0Frame2 = function ( Image0, event )
					local Image0Frame3 = function ( Image0, event )
						if not event.interrupted then
							Image0:beginAnimation( "keyframe", 1789, false, false, CoD.TweenType.Bounce )
						end
						Image0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Image0, event )
						else
							Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Image0Frame3( Image0, event )
						return 
					else
						Image0:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Bounce )
						Image0:setAlpha( 1 )
						Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame3 )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				Image0Frame2( Image0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "CombatReady",
			condition = function ( menu, element, event )
				return HasPerk( controller, "killstreaks.momentumPercentage" )
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
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

