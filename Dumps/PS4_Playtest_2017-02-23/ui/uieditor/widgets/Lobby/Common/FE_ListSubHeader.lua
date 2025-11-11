require( "ui.uieditor.widgets.Lobby.Common.FE_ListSubHeaderGlow" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ListSubHeaderPanelShaderContainer" )

CoD.FE_ListSubHeader = InheritFrom( LUI.UIElement )
CoD.FE_ListSubHeader.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_ListSubHeader )
	self.id = "FE_ListSubHeader"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 735 )
	self:setTopBottom( 0, 0, 0, 40 )
	
	local FEListSubHeaderPanelShaderContainer0 = CoD.FE_ListSubHeaderPanelShaderContainer.new( menu, controller )
	FEListSubHeaderPanelShaderContainer0:setLeftRight( 0, 0, 90, 612 )
	FEListSubHeaderPanelShaderContainer0:setTopBottom( 0, 0, 3, 37 )
	FEListSubHeaderPanelShaderContainer0:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( FEListSubHeaderPanelShaderContainer0 )
	self.FEListSubHeaderPanelShaderContainer0 = FEListSubHeaderPanelShaderContainer0
	
	local FEListSubHeaderGlow0 = CoD.FE_ListSubHeaderGlow.new( menu, controller )
	FEListSubHeaderGlow0:setLeftRight( 0, 0, 90, 612 )
	FEListSubHeaderGlow0:setTopBottom( 0, 0, 3, 37 )
	self:addElement( FEListSubHeaderGlow0 )
	self.FEListSubHeaderGlow0 = FEListSubHeaderGlow0
	
	local StringA = LUI.UIText.new()
	StringA:setLeftRight( 0, 0, 97, 564 )
	StringA:setTopBottom( 0, 0, 4, 34 )
	StringA:setRGB( 0, 0, 0 )
	StringA:setText( Engine.Localize( "3 Playing | 18 Max" ) )
	StringA:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	StringA:setLetterSpacing( 0.5 )
	StringA:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	StringA:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( StringA )
	self.StringA = StringA
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( 1, 1, -689, -635 )
	Image4:setTopBottom( 0.5, 0.5, -20, -15 )
	Image4:setAlpha( 0 )
	Image4:setYRot( 180 )
	Image4:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	self.resetProperties = function ()
		FEListSubHeaderPanelShaderContainer0:completeAnimation()
		FEListSubHeaderGlow0:completeAnimation()
		StringA:completeAnimation()
		FEListSubHeaderPanelShaderContainer0:setAlpha( 1 )
		FEListSubHeaderGlow0:setAlpha( 1 )
		StringA:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				FEListSubHeaderPanelShaderContainer0:completeAnimation()
				self.FEListSubHeaderPanelShaderContainer0:setAlpha( 0 )
				self.clipFinished( FEListSubHeaderPanelShaderContainer0, {} )
				FEListSubHeaderGlow0:completeAnimation()
				self.FEListSubHeaderGlow0:setAlpha( 0 )
				self.clipFinished( FEListSubHeaderGlow0, {} )
				StringA:completeAnimation()
				self.StringA:setAlpha( 0 )
				self.clipFinished( StringA, {} )
			end
		},
		PlayerCountState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		GroupCountState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FEListSubHeaderPanelShaderContainer0:close()
		self.FEListSubHeaderGlow0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

