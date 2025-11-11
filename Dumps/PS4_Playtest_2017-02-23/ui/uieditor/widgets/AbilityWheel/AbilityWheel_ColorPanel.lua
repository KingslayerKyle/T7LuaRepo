CoD.AbilityWheel_ColorPanel = InheritFrom( LUI.UIElement )
CoD.AbilityWheel_ColorPanel.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AbilityWheel_ColorPanel )
	self.id = "AbilityWheel_ColorPanel"
	self.soundSet = "CAC_LethalGrenade"
	self:setLeftRight( 0, 0, 0, 180 )
	self:setTopBottom( 0, 0, 0, 180 )
	
	local PanelGlow = LUI.UIImage.new()
	PanelGlow:setLeftRight( 0, 0, -14, 164 )
	PanelGlow:setTopBottom( 0, 0, -10, 170 )
	PanelGlow:setRGB( 0.97, 0.36, 0.07 )
	PanelGlow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	PanelGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( PanelGlow )
	self.PanelGlow = PanelGlow
	
	local CyberFrame = LUI.UIImage.new()
	CyberFrame:setLeftRight( 0, 0, -5, 184 )
	CyberFrame:setTopBottom( 0, 0, -5, 184 )
	CyberFrame:setRGB( 0.96, 0.36, 0.07 )
	CyberFrame:setAlpha( 0 )
	CyberFrame:setImage( RegisterImage( "uie_cyberframe" ) )
	CyberFrame:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CyberFrame )
	self.CyberFrame = CyberFrame
	
	self.resetProperties = function ()
		PanelGlow:completeAnimation()
		CyberFrame:completeAnimation()
		PanelGlow:setRGB( 0.97, 0.36, 0.07 )
		PanelGlow:setAlpha( 1 )
		CyberFrame:setLeftRight( 0, 0, -5, 184 )
		CyberFrame:setTopBottom( 0, 0, -5, 184 )
		CyberFrame:setRGB( 0.96, 0.36, 0.07 )
		CyberFrame:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		Unavailable = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				PanelGlow:completeAnimation()
				self.PanelGlow:setAlpha( 0 )
				self.clipFinished( PanelGlow, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		ControlCore = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				PanelGlow:completeAnimation()
				self.PanelGlow:setRGB( 0.07, 0.78, 0.97 )
				self.PanelGlow:setAlpha( 0.5 )
				self.clipFinished( PanelGlow, {} )
				CyberFrame:completeAnimation()
				self.CyberFrame:setLeftRight( 0, 0, -0.5, 179.5 )
				self.CyberFrame:setTopBottom( 0, 0, -0.5, 179.5 )
				self.CyberFrame:setRGB( 0.07, 0.78, 0.96 )
				self.CyberFrame:setAlpha( 1 )
				self.clipFinished( CyberFrame, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		MartialCore = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				PanelGlow:completeAnimation()
				self.PanelGlow:setRGB( 0.33, 0.76, 0.1 )
				self.PanelGlow:setAlpha( 0.5 )
				self.clipFinished( PanelGlow, {} )
				CyberFrame:completeAnimation()
				self.CyberFrame:setLeftRight( 0, 0, -0.5, 179.5 )
				self.CyberFrame:setTopBottom( 0, 0, -0.5, 179.5 )
				self.CyberFrame:setRGB( 0.33, 0.76, 0.1 )
				self.CyberFrame:setAlpha( 1 )
				self.clipFinished( CyberFrame, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		ChaosCore = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				PanelGlow:completeAnimation()
				self.PanelGlow:setAlpha( 0.5 )
				self.clipFinished( PanelGlow, {} )
				CyberFrame:completeAnimation()
				self.CyberFrame:setLeftRight( 0, 0, -0.5, 179.5 )
				self.CyberFrame:setTopBottom( 0, 0, -0.5, 179.5 )
				self.CyberFrame:setAlpha( 1 )
				self.clipFinished( CyberFrame, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				PanelGlow:completeAnimation()
				self.PanelGlow:setAlpha( 0 )
				self.clipFinished( PanelGlow, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Unavailable",
			condition = function ( menu, element, event )
				return not IsCybercoreAbilityAvailable( element, controller )
			end
		},
		{
			stateName = "ControlCore",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "MartialCore",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "ChaosCore",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

