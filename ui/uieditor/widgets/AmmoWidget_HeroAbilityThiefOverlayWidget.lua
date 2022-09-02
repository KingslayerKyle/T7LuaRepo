-- d90947d4cbc0208850cefdabe106ed63
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )

CoD.AmmoWidget_HeroAbilityThiefOverlayWidget = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_HeroAbilityThiefOverlayWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_HeroAbilityThiefOverlayWidget )
	self.id = "AmmoWidget_HeroAbilityThiefOverlayWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 143 )
	self:setTopBottom( true, false, 0, 16 )
	
	local FEButtonPanel0 = CoD.FE_ButtonPanel.new( menu, controller )
	FEButtonPanel0:setLeftRight( true, true, -1, 1 )
	FEButtonPanel0:setTopBottom( true, true, 0, 0 )
	FEButtonPanel0:setRGB( 0, 0, 0 )
	FEButtonPanel0:setAlpha( 0.4 )
	self:addElement( FEButtonPanel0 )
	self.FEButtonPanel0 = FEButtonPanel0
	
	local box = LUI.UIImage.new()
	box:setLeftRight( true, true, 0, 0 )
	box:setTopBottom( true, true, 0, 0 )
	box:setRGB( 0, 0, 0 )
	box:setAlpha( 0 )
	box:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	box:setShaderVector( 0, 0.01, 0.02, 0.01, 0.02 )
	self:addElement( box )
	self.box = box
	
	local rerollInstruction = LUI.UIText.new()
	rerollInstruction:setLeftRight( true, false, -3, 116 )
	rerollInstruction:setTopBottom( true, false, 0, 16 )
	rerollInstruction:setScale( 0.9 )
	rerollInstruction:setText( Engine.Localize( "REDRAW" ) )
	rerollInstruction:setTTF( "fonts/escom.ttf" )
	rerollInstruction:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	rerollInstruction:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )

	LUI.OverrideFunction_CallOriginalFirst( rerollInstruction, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 10 )
	end )
	self:addElement( rerollInstruction )
	self.rerollInstruction = rerollInstruction
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, true, -17, 23 )
	Glow:setTopBottom( false, false, -16.3, 16.3 )
	Glow:setRGB( 0.3, 0.23, 0.2 )
	Glow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				box:completeAnimation()
				self.box:setAlpha( 0 )
				self.clipFinished( box, {} )

				rerollInstruction:completeAnimation()
				self.rerollInstruction:setAlpha( 1 )
				self.clipFinished( rerollInstruction, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEButtonPanel0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

