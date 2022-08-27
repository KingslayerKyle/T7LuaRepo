-- 716eaeeb1858b079afeb9e60cb65bdd7
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ListSubHeaderPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ListSubHeaderGlow" )

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
	self:setLeftRight( true, false, 0, 490 )
	self:setTopBottom( true, false, 0, 27 )
	
	local FEListSubHeaderPanelShaderContainer0 = CoD.FE_ListSubHeaderPanelShaderContainer.new( menu, controller )
	FEListSubHeaderPanelShaderContainer0:setLeftRight( true, false, 60, 408 )
	FEListSubHeaderPanelShaderContainer0:setTopBottom( true, false, 1.5, 24.5 )
	FEListSubHeaderPanelShaderContainer0:setRGB( 0.5, 0.5, 0.5 )
	FEListSubHeaderPanelShaderContainer0:setZoom( 5 )
	self:addElement( FEListSubHeaderPanelShaderContainer0 )
	self.FEListSubHeaderPanelShaderContainer0 = FEListSubHeaderPanelShaderContainer0
	
	local FEListSubHeaderGlow0 = CoD.FE_ListSubHeaderGlow.new( menu, controller )
	FEListSubHeaderGlow0:setLeftRight( true, false, 60, 408 )
	FEListSubHeaderGlow0:setTopBottom( true, false, 1.5, 24.5 )
	FEListSubHeaderGlow0:setZoom( 5 )
	self:addElement( FEListSubHeaderGlow0 )
	self.FEListSubHeaderGlow0 = FEListSubHeaderGlow0
	
	local StringA = LUI.UIText.new()
	StringA:setLeftRight( true, false, 65, 376.33 )
	StringA:setTopBottom( true, false, 2.5, 22.5 )
	StringA:setRGB( 0, 0, 0 )
	StringA:setZoom( 5 )
	StringA:setText( Engine.Localize( "3 Playing | 18 Max" ) )
	StringA:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	StringA:setLetterSpacing( 0.5 )
	StringA:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	StringA:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( StringA )
	self.StringA = StringA
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, false, 406, 434 )
	Image3:setTopBottom( false, false, -13.5, -9.5 )
	Image3:setYRot( -180 )
	Image3:setZoom( 5 )
	Image3:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( false, true, -459, -423 )
	Image4:setTopBottom( false, false, -13.25, -9.75 )
	Image4:setAlpha( 0 )
	Image4:setYRot( 180 )
	Image4:setZoom( 5 )
	Image4:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
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
				self:setupElementClipCounter( 3 )
				FEListSubHeaderPanelShaderContainer0:completeAnimation()
				self.FEListSubHeaderPanelShaderContainer0:setAlpha( 1 )
				self.clipFinished( FEListSubHeaderPanelShaderContainer0, {} )
				FEListSubHeaderGlow0:completeAnimation()
				self.FEListSubHeaderGlow0:setAlpha( 1 )
				self.clipFinished( FEListSubHeaderGlow0, {} )
				StringA:completeAnimation()
				self.StringA:setAlpha( 1 )
				self.clipFinished( StringA, {} )
			end
		},
		GroupCountState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				FEListSubHeaderPanelShaderContainer0:completeAnimation()
				self.FEListSubHeaderPanelShaderContainer0:setAlpha( 1 )
				self.clipFinished( FEListSubHeaderPanelShaderContainer0, {} )
				FEListSubHeaderGlow0:completeAnimation()
				self.FEListSubHeaderGlow0:setAlpha( 1 )
				self.clipFinished( FEListSubHeaderGlow0, {} )
				StringA:completeAnimation()
				self.StringA:setAlpha( 1 )
				self.clipFinished( StringA, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEListSubHeaderPanelShaderContainer0:close()
		element.FEListSubHeaderGlow0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

