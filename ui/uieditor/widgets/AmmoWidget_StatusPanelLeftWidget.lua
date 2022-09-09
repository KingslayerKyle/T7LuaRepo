-- 5d28140f11ab2b6038a4f10657b0e86b
-- This hash is used for caching, delete to decompile the file again

CoD.AmmoWidget_StatusPanelLeftWidget = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_StatusPanelLeftWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_StatusPanelLeftWidget )
	self.id = "AmmoWidget_StatusPanelLeftWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 48 )
	self:setTopBottom( true, false, 0, 48 )
	
	local StatusPanel = LUI.UIImage.new()
	StatusPanel:setLeftRight( true, false, 0, 47.5 )
	StatusPanel:setTopBottom( true, false, 0, 47.5 )
	StatusPanel:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_statuspanel" ) )
	StatusPanel:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	StatusPanel:setShaderVector( 0, 30, 20, 0, 0 )
	self:addElement( StatusPanel )
	self.StatusPanel = StatusPanel
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			HudStart = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Activated = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return HideCyberCoreWidget( controller )
			end
		},
		{
			stateName = "Activated",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "hudItems.tacticalModeActivated", 1 )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.tacticalModeActivated" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.tacticalModeActivated"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
