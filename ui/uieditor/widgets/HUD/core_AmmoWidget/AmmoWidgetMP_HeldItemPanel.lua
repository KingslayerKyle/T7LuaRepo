-- 0513410a03f0677ca87caad858a237ef
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidgetMP_PanelEquipContainer" )

CoD.AmmoWidgetMP_HeldItemPanel = InheritFrom( LUI.UIElement )
CoD.AmmoWidgetMP_HeldItemPanel.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidgetMP_HeldItemPanel )
	self.id = "AmmoWidgetMP_HeldItemPanel"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 46 )
	self:setTopBottom( true, false, 0, 37 )
	self.anyChildUsesUpdateState = true
	
	local AmmoWidgetMPPanelEquipContainer0 = CoD.AmmoWidgetMP_PanelEquipContainer.new( menu, controller )
	AmmoWidgetMPPanelEquipContainer0:setLeftRight( false, false, -23.17, 23.17 )
	AmmoWidgetMPPanelEquipContainer0:setTopBottom( false, false, -18.67, 18.67 )
	AmmoWidgetMPPanelEquipContainer0:setAlpha( 0 )
	AmmoWidgetMPPanelEquipContainer0:setZoom( -10 )
	self:addElement( AmmoWidgetMPPanelEquipContainer0 )
	self.AmmoWidgetMPPanelEquipContainer0 = AmmoWidgetMPPanelEquipContainer0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				AmmoWidgetMPPanelEquipContainer0:completeAnimation()
				self.AmmoWidgetMPPanelEquipContainer0:setAlpha( 0 )
				self.clipFinished( AmmoWidgetMPPanelEquipContainer0, {} )
			end,
			Show = function ()
				self:setupElementClipCounter( 1 )
				local AmmoWidgetMPPanelEquipContainer0Frame2 = function ( AmmoWidgetMPPanelEquipContainer0, event )
					if not event.interrupted then
						AmmoWidgetMPPanelEquipContainer0:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					AmmoWidgetMPPanelEquipContainer0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( AmmoWidgetMPPanelEquipContainer0, event )
					else
						AmmoWidgetMPPanelEquipContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AmmoWidgetMPPanelEquipContainer0:completeAnimation()
				self.AmmoWidgetMPPanelEquipContainer0:setAlpha( 0 )
				AmmoWidgetMPPanelEquipContainer0Frame2( AmmoWidgetMPPanelEquipContainer0, {} )
			end
		},
		Show = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				AmmoWidgetMPPanelEquipContainer0:completeAnimation()
				self.AmmoWidgetMPPanelEquipContainer0:setAlpha( 1 )
				self.clipFinished( AmmoWidgetMPPanelEquipContainer0, {} )
			end,
			Hide = function ()
				self:setupElementClipCounter( 1 )
				local AmmoWidgetMPPanelEquipContainer0Frame2 = function ( AmmoWidgetMPPanelEquipContainer0, event )
					if not event.interrupted then
						AmmoWidgetMPPanelEquipContainer0:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					AmmoWidgetMPPanelEquipContainer0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AmmoWidgetMPPanelEquipContainer0, event )
					else
						AmmoWidgetMPPanelEquipContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AmmoWidgetMPPanelEquipContainer0:completeAnimation()
				self.AmmoWidgetMPPanelEquipContainer0:setAlpha( 1 )
				AmmoWidgetMPPanelEquipContainer0Frame2( AmmoWidgetMPPanelEquipContainer0, {} )
			end
		},
		Hide = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				AmmoWidgetMPPanelEquipContainer0:completeAnimation()
				self.AmmoWidgetMPPanelEquipContainer0:setAlpha( 0 )
				self.clipFinished( AmmoWidgetMPPanelEquipContainer0, {} )
			end,
			Show = function ()
				self:setupElementClipCounter( 1 )
				local AmmoWidgetMPPanelEquipContainer0Frame2 = function ( AmmoWidgetMPPanelEquipContainer0, event )
					if not event.interrupted then
						AmmoWidgetMPPanelEquipContainer0:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					AmmoWidgetMPPanelEquipContainer0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( AmmoWidgetMPPanelEquipContainer0, event )
					else
						AmmoWidgetMPPanelEquipContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AmmoWidgetMPPanelEquipContainer0:completeAnimation()
				self.AmmoWidgetMPPanelEquipContainer0:setAlpha( 0 )
				AmmoWidgetMPPanelEquipContainer0Frame2( AmmoWidgetMPPanelEquipContainer0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Show",
			condition = function ( menu, element, event )
				return AmICarryingEnemyFlag( controller )
			end
		},
		{
			stateName = "Hide",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CTF.enemyFlagCarrier" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CTF.enemyFlagCarrier"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "deadSpectator.playerIndex" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "deadSpectator.playerIndex"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.AmmoWidgetMPPanelEquipContainer0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

