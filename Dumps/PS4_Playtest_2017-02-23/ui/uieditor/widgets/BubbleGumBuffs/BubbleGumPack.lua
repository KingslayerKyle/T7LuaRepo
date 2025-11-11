require( "ui.uieditor.widgets.BubbleGumBuffs.BubbleGumBuff" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )

CoD.BubbleGumPack = InheritFrom( LUI.UIElement )
CoD.BubbleGumPack.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BubbleGumPack )
	self.id = "BubbleGumPack"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 552 )
	self:setTopBottom( 0, 0, 0, 223 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local FEButtonPanelShaderContainer = CoD.FE_ButtonPanelShaderContainer.new( menu, controller )
	FEButtonPanelShaderContainer:setLeftRight( 0, 1, 0, 0 )
	FEButtonPanelShaderContainer:setTopBottom( 0.5, 0.5, -105, -63 )
	FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( FEButtonPanelShaderContainer )
	self.FEButtonPanelShaderContainer = FEButtonPanelShaderContainer
	
	local Black = LUI.UIImage.new()
	Black:setLeftRight( 0, 0, 0, 552 )
	Black:setTopBottom( 0, 0, 60, 224 )
	Black:setRGB( 0, 0, 0 )
	self:addElement( Black )
	self.Black = Black
	
	local BackPanel = CoD.FE_ButtonPanel.new( menu, controller )
	BackPanel:setLeftRight( 0, 1, 12, -10 )
	BackPanel:setTopBottom( 0, 1, 70, -10 )
	BackPanel:setRGB( 0.24, 0.24, 0.26 )
	BackPanel:setAlpha( 0.4 )
	self:addElement( BackPanel )
	self.BackPanel = BackPanel
	
	local FEButtonIdle = LUI.UIImage.new()
	FEButtonIdle:setLeftRight( 0, 1, -2, 2 )
	FEButtonIdle:setTopBottom( 0.5, 0.5, -108, -60 )
	FEButtonIdle:setAlpha( 0.8 )
	FEButtonIdle:setZoom( 10 )
	FEButtonIdle:setImage( RegisterImage( "uie_t7_menu_frontend_buttonidlefull" ) )
	FEButtonIdle:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	FEButtonIdle:setShaderVector( 0, 0, 0, 0, 0 )
	FEButtonIdle:setupNineSliceShader( 12, 12 )
	self:addElement( FEButtonIdle )
	self.FEButtonIdle = FEButtonIdle
	
	local FEButtonFocus = LUI.UIImage.new()
	FEButtonFocus:setLeftRight( 0, 1, -12, 12 )
	FEButtonFocus:setTopBottom( 0.5, 0.5, -114, -54 )
	FEButtonFocus:setAlpha( 0 )
	FEButtonFocus:setZoom( 10 )
	FEButtonFocus:setImage( RegisterImage( "uie_t7_menu_frontend_buttonfocusfull" ) )
	FEButtonFocus:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	FEButtonFocus:setShaderVector( 0, 0, 0, 0.38, 0.2 )
	FEButtonFocus:setupNineSliceShader( 90, 30 )
	self:addElement( FEButtonFocus )
	self.FEButtonFocus = FEButtonFocus
	
	local BubbleGumPackLabel = LUI.UITightText.new()
	BubbleGumPackLabel:setLeftRight( 0, 0, 21, 321 )
	BubbleGumPackLabel:setTopBottom( 0, 0, 12, 42 )
	BubbleGumPackLabel:setTTF( "fonts/escom.ttf" )
	BubbleGumPackLabel:subscribeToGlobalModel( controller, "EquippedBubbleGumPack", "bgbPackIndex", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BubbleGumPackLabel:setText( Engine.Localize( GetBubbleGumPackNameFromPackIndex( controller, modelValue ) ) )
		end
	end )
	self:addElement( BubbleGumPackLabel )
	self.BubbleGumPackLabel = BubbleGumPackLabel
	
	local BubbleGumPackLabelStroke = LUI.UITightText.new()
	BubbleGumPackLabelStroke:setLeftRight( 0, 0, 21, 321 )
	BubbleGumPackLabelStroke:setTopBottom( 0, 0, 12, 42 )
	BubbleGumPackLabelStroke:setRGB( 0, 0, 0 )
	BubbleGumPackLabelStroke:setTTF( "fonts/escom.ttf" )
	BubbleGumPackLabelStroke:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	BubbleGumPackLabelStroke:setShaderVector( 0, 0.08, 0, 0, 0 )
	BubbleGumPackLabelStroke:setShaderVector( 1, 0, 0, 0, 0 )
	BubbleGumPackLabelStroke:setShaderVector( 2, 1, 0, 0, 0 )
	BubbleGumPackLabelStroke:subscribeToGlobalModel( controller, "EquippedBubbleGumPack", "bgbPackIndex", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BubbleGumPackLabelStroke:setText( Engine.Localize( GetBubbleGumPackNameFromPackIndex( controller, modelValue ) ) )
		end
	end )
	self:addElement( BubbleGumPackLabelStroke )
	self.BubbleGumPackLabelStroke = BubbleGumPackLabelStroke
	
	local BubbleGumBuffs = LUI.UIList.new( menu, controller, 14, 0, nil, false, false, 0, 0, false, false )
	BubbleGumBuffs:makeFocusable()
	BubbleGumBuffs:setLeftRight( 0, 0, 10, 546 )
	BubbleGumBuffs:setTopBottom( 0, 0, 70, 233 )
	BubbleGumBuffs:setWidgetType( CoD.BubbleGumBuff )
	BubbleGumBuffs:setHorizontalCount( 5 )
	BubbleGumBuffs:setSpacing( 14 )
	BubbleGumBuffs:setDataSource( "BubbleGumBuffs" )
	self:addElement( BubbleGumBuffs )
	self.BubbleGumBuffs = BubbleGumBuffs
	
	local HighlightFrame = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	HighlightFrame:setLeftRight( 0, 1, 0, 0 )
	HighlightFrame:setTopBottom( 0, 1, 60, 0 )
	self:addElement( HighlightFrame )
	self.HighlightFrame = HighlightFrame
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( 0, 1, -62, 84 )
	Glow:setTopBottom( 0, 0, -35, 81 )
	Glow:setRGB( 0.88, 1, 0.04 )
	Glow:setAlpha( 0 )
	Glow:setImage( RegisterImage( "uie_t7_cp_hud_enemytarget_glow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local Glow2 = LUI.UIImage.new()
	Glow2:setLeftRight( 0, 1, -43, 73 )
	Glow2:setTopBottom( 0, 0, -37, 87 )
	Glow2:setAlpha( 0 )
	Glow2:setImage( RegisterImage( "uie_t7_cp_hud_enemytarget_glow" ) )
	Glow2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow2 )
	self.Glow2 = Glow2
	
	local HighlightFrame1 = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	HighlightFrame1:setLeftRight( 0, 1, 0, 0 )
	HighlightFrame1:setTopBottom( 0, 1, 60, 0 )
	HighlightFrame1:setRGB( 1, 0.33, 0 )
	HighlightFrame1:setAlpha( 0 )
	HighlightFrame1:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( HighlightFrame1 )
	self.HighlightFrame1 = HighlightFrame1
	
	local Arrow = LUI.UIImage.new()
	Arrow:setLeftRight( 0, 0, -30, -18 )
	Arrow:setTopBottom( 0, 0, 21, 33 )
	Arrow:setAlpha( 0 )
	Arrow:setZoom( 10 )
	Arrow:setImage( RegisterImage( "uie_t7_menu_frontend_buttonfocusarrow" ) )
	Arrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Arrow )
	self.Arrow = Arrow
	
	self.resetProperties = function ()
		BubbleGumPackLabelStroke:completeAnimation()
		BubbleGumBuffs:completeAnimation()
		FEButtonFocus:completeAnimation()
		BubbleGumPackLabel:completeAnimation()
		Glow:completeAnimation()
		Glow2:completeAnimation()
		HighlightFrame:completeAnimation()
		HighlightFrame1:completeAnimation()
		Arrow:completeAnimation()
		BubbleGumPackLabelStroke:setAlpha( 1 )
		BubbleGumBuffs:setAlpha( 1 )
		FEButtonFocus:setAlpha( 0 )
		BubbleGumPackLabel:setAlpha( 1 )
		Glow:setAlpha( 0 )
		Glow2:setAlpha( 0 )
		HighlightFrame:setRGB( 1, 1, 1 )
		HighlightFrame:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
		HighlightFrame1:setAlpha( 0 )
		Arrow:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				BubbleGumPackLabelStroke:completeAnimation()
				self.BubbleGumPackLabelStroke:setAlpha( 0 )
				self.clipFinished( BubbleGumPackLabelStroke, {} )
				BubbleGumBuffs:completeAnimation()
				self.BubbleGumBuffs:setAlpha( 0.75 )
				self.clipFinished( BubbleGumBuffs, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setAlpha( 1 )
				self.clipFinished( FEButtonFocus, {} )
				BubbleGumPackLabel:completeAnimation()
				self.BubbleGumPackLabel:setAlpha( 0 )
				self.clipFinished( BubbleGumPackLabel, {} )
				HighlightFrame:completeAnimation()
				self.HighlightFrame:setRGB( 1, 0.33, 0 )
				self.HighlightFrame:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
				self.clipFinished( HighlightFrame, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0.45 )
				self.clipFinished( Glow, {} )
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 1 )
				self.clipFinished( Glow2, {} )
				HighlightFrame1:completeAnimation()
				self.HighlightFrame1:setAlpha( 1 )
				self.clipFinished( HighlightFrame1, {} )
				Arrow:completeAnimation()
				self.Arrow:setAlpha( 1 )
				self.clipFinished( Arrow, {} )
			end
		}
	}
	BubbleGumBuffs.id = "BubbleGumBuffs"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.BubbleGumBuffs:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FEButtonPanelShaderContainer:close()
		self.BackPanel:close()
		self.BubbleGumBuffs:close()
		self.HighlightFrame:close()
		self.HighlightFrame1:close()
		self.BubbleGumPackLabel:close()
		self.BubbleGumPackLabelStroke:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

