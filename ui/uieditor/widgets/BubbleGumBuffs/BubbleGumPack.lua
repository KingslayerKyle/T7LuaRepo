-- 47f2ffc5b350e596cd1002bedea8e052
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.BubbleGumBuffs.BubbleGumBuff" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )

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
	self:setLeftRight( true, false, 0, 368 )
	self:setTopBottom( true, false, 0, 149 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local FEButtonPanelShaderContainer = CoD.FE_ButtonPanelShaderContainer.new( menu, controller )
	FEButtonPanelShaderContainer:setLeftRight( true, true, 0, 0 )
	FEButtonPanelShaderContainer:setTopBottom( false, false, -70, -42 )
	FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( FEButtonPanelShaderContainer )
	self.FEButtonPanelShaderContainer = FEButtonPanelShaderContainer
	
	local Black = LUI.UIImage.new()
	Black:setLeftRight( true, false, 0, 368 )
	Black:setTopBottom( true, false, 40, 149 )
	Black:setRGB( 0, 0, 0 )
	self:addElement( Black )
	self.Black = Black
	
	local BackPanel = CoD.FE_ButtonPanel.new( menu, controller )
	BackPanel:setLeftRight( true, true, 8, -6.89 )
	BackPanel:setTopBottom( true, true, 46.48, -6.48 )
	BackPanel:setRGB( 0.24, 0.24, 0.26 )
	BackPanel:setAlpha( 0.4 )
	self:addElement( BackPanel )
	self.BackPanel = BackPanel
	
	local FEButtonIdle = LUI.UIImage.new()
	FEButtonIdle:setLeftRight( true, true, -1, 1 )
	FEButtonIdle:setTopBottom( false, false, -72, -40 )
	FEButtonIdle:setAlpha( 0.8 )
	FEButtonIdle:setZoom( 10 )
	FEButtonIdle:setImage( RegisterImage( "uie_t7_menu_frontend_buttonidlefull" ) )
	FEButtonIdle:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	FEButtonIdle:setShaderVector( 0, 0.08, 0.25, 0, 0 )
	FEButtonIdle:setupNineSliceShader( 8, 8 )
	self:addElement( FEButtonIdle )
	self.FEButtonIdle = FEButtonIdle
	
	local FEButtonFocus = LUI.UIImage.new()
	FEButtonFocus:setLeftRight( true, true, -8, 8 )
	FEButtonFocus:setTopBottom( false, false, -76, -36 )
	FEButtonFocus:setAlpha( 0 )
	FEButtonFocus:setZoom( 10 )
	FEButtonFocus:setImage( RegisterImage( "uie_t7_menu_frontend_buttonfocusfull" ) )
	FEButtonFocus:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	FEButtonFocus:setShaderVector( 0, 0.16, 0.5, 0.38, 0.2 )
	FEButtonFocus:setupNineSliceShader( 60, 20 )
	self:addElement( FEButtonFocus )
	self.FEButtonFocus = FEButtonFocus
	
	local BubbleGumPackNameTextBox = LUI.UIText.new()
	BubbleGumPackNameTextBox:setLeftRight( true, false, 14, 214 )
	BubbleGumPackNameTextBox:setTopBottom( true, false, 8, 28 )
	BubbleGumPackNameTextBox:setAlpha( 0 )
	BubbleGumPackNameTextBox:setTTF( "fonts/escom.ttf" )
	BubbleGumPackNameTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	BubbleGumPackNameTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	BubbleGumPackNameTextBox:subscribeToGlobalModel( controller, "EquippedBubbleGumPack", "bgbPackIndex", function ( model )
		local bgbPackIndex = Engine.GetModelValue( model )
		if bgbPackIndex then
			BubbleGumPackNameTextBox:setText( GetBubbleGumPackNameFromPackIndex( controller, bgbPackIndex ) )
		end
	end )
	self:addElement( BubbleGumPackNameTextBox )
	self.BubbleGumPackNameTextBox = BubbleGumPackNameTextBox
	
	local BubbleGumPackLabel = LUI.UITightText.new()
	BubbleGumPackLabel:setLeftRight( true, false, 14, 214 )
	BubbleGumPackLabel:setTopBottom( true, false, 8, 28 )
	BubbleGumPackLabel:setTTF( "fonts/escom.ttf" )
	BubbleGumPackLabel:subscribeToGlobalModel( controller, "EquippedBubbleGumPack", "bgbPackIndex", function ( model )
		local bgbPackIndex = Engine.GetModelValue( model )
		if bgbPackIndex then
			BubbleGumPackLabel:setText( GetBubbleGumPackNameFromPackIndex( controller, bgbPackIndex ) )
		end
	end )
	self:addElement( BubbleGumPackLabel )
	self.BubbleGumPackLabel = BubbleGumPackLabel
	
	local BubbleGumPackLabelStroke = LUI.UITightText.new()
	BubbleGumPackLabelStroke:setLeftRight( true, false, 14, 214 )
	BubbleGumPackLabelStroke:setTopBottom( true, false, 8, 28 )
	BubbleGumPackLabelStroke:setRGB( 0, 0, 0 )
	BubbleGumPackLabelStroke:setTTF( "fonts/escom.ttf" )
	BubbleGumPackLabelStroke:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	BubbleGumPackLabelStroke:setShaderVector( 0, 0.08, 0, 0, 0 )
	BubbleGumPackLabelStroke:setShaderVector( 1, 0, 0, 0, 0 )
	BubbleGumPackLabelStroke:setShaderVector( 2, 1, 0, 0, 0 )
	BubbleGumPackLabelStroke:subscribeToGlobalModel( controller, "EquippedBubbleGumPack", "bgbPackIndex", function ( model )
		local bgbPackIndex = Engine.GetModelValue( model )
		if bgbPackIndex then
			BubbleGumPackLabelStroke:setText( GetBubbleGumPackNameFromPackIndex( controller, bgbPackIndex ) )
		end
	end )
	self:addElement( BubbleGumPackLabelStroke )
	self.BubbleGumPackLabelStroke = BubbleGumPackLabelStroke
	
	local BubbleGumBuffs = LUI.UIList.new( menu, controller, 9, 0, nil, false, false, 0, 0, false, false )
	BubbleGumBuffs:makeFocusable()
	BubbleGumBuffs:setLeftRight( true, false, 7, 363 )
	BubbleGumBuffs:setTopBottom( true, false, 46.48, 155.48 )
	BubbleGumBuffs:setWidgetType( CoD.BubbleGumBuff )
	BubbleGumBuffs:setHorizontalCount( 5 )
	BubbleGumBuffs:setSpacing( 9 )
	BubbleGumBuffs:setDataSource( "BubbleGumBuffs" )
	self:addElement( BubbleGumBuffs )
	self.BubbleGumBuffs = BubbleGumBuffs
	
	local HighlightFrame = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	HighlightFrame:setLeftRight( true, true, 0, 0 )
	HighlightFrame:setTopBottom( true, true, 40, 0 )
	self:addElement( HighlightFrame )
	self.HighlightFrame = HighlightFrame
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, true, -41, 56 )
	Glow:setTopBottom( true, false, -23, 54 )
	Glow:setRGB( 0.88, 1, 0.04 )
	Glow:setAlpha( 0 )
	Glow:setImage( RegisterImage( "uie_t7_cp_hud_enemytarget_glow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local Glow2 = LUI.UIImage.new()
	Glow2:setLeftRight( true, true, -29, 49 )
	Glow2:setTopBottom( true, false, -24.29, 58.12 )
	Glow2:setAlpha( 0 )
	Glow2:setImage( RegisterImage( "uie_t7_cp_hud_enemytarget_glow" ) )
	Glow2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow2 )
	self.Glow2 = Glow2
	
	local HighlightFrame1 = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	HighlightFrame1:setLeftRight( true, true, 0, 0 )
	HighlightFrame1:setTopBottom( true, true, 40, 0 )
	HighlightFrame1:setRGB( 1, 0.33, 0 )
	HighlightFrame1:setAlpha( 0 )
	HighlightFrame1:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( HighlightFrame1 )
	self.HighlightFrame1 = HighlightFrame1
	
	local Arrow = LUI.UIImage.new()
	Arrow:setLeftRight( true, false, -20, -12 )
	Arrow:setTopBottom( true, false, 14, 22 )
	Arrow:setAlpha( 0 )
	Arrow:setZoom( 10 )
	Arrow:setImage( RegisterImage( "uie_t7_menu_frontend_buttonfocusarrow" ) )
	Arrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Arrow )
	self.Arrow = Arrow
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )

				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
				self.clipFinished( FEButtonPanelShaderContainer, {} )

				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setAlpha( 0 )
				self.clipFinished( FEButtonFocus, {} )

				BubbleGumPackNameTextBox:completeAnimation()
				self.BubbleGumPackNameTextBox:setAlpha( 0 )
				self.clipFinished( BubbleGumPackNameTextBox, {} )

				BubbleGumPackLabel:completeAnimation()
				self.BubbleGumPackLabel:setAlpha( 1 )
				self.clipFinished( BubbleGumPackLabel, {} )

				BubbleGumPackLabelStroke:completeAnimation()
				self.BubbleGumPackLabelStroke:setAlpha( 0 )
				self.clipFinished( BubbleGumPackLabelStroke, {} )

				BubbleGumBuffs:completeAnimation()
				self.BubbleGumBuffs:setAlpha( 0.75 )
				self.clipFinished( BubbleGumBuffs, {} )

				HighlightFrame:completeAnimation()
				self.HighlightFrame:setRGB( 1, 1, 1 )
				self.HighlightFrame:setAlpha( 1 )
				self.clipFinished( HighlightFrame, {} )

				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )

				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0 )
				self.clipFinished( Glow2, {} )

				HighlightFrame1:completeAnimation()
				self.HighlightFrame1:setRGB( 1, 0.33, 0 )
				self.HighlightFrame1:setAlpha( 0 )
				self.clipFinished( HighlightFrame1, {} )

				Arrow:completeAnimation()
				self.Arrow:setAlpha( 0 )
				self.clipFinished( Arrow, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 9 )

				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setAlpha( 1 )
				self.clipFinished( FEButtonFocus, {} )

				BubbleGumPackLabel:completeAnimation()
				self.BubbleGumPackLabel:setAlpha( 0 )
				self.clipFinished( BubbleGumPackLabel, {} )

				BubbleGumPackLabelStroke:completeAnimation()
				self.BubbleGumPackLabelStroke:setAlpha( 1 )
				self.BubbleGumPackLabelStroke:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
				self.BubbleGumPackLabelStroke:setShaderVector( 0, 0.08, 0, 0, 0 )
				self.BubbleGumPackLabelStroke:setShaderVector( 1, 0, 0, 0, 0 )
				self.BubbleGumPackLabelStroke:setShaderVector( 2, 1, 0, 0, 0 )
				self.BubbleGumPackLabelStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				self.clipFinished( BubbleGumPackLabelStroke, {} )

				BubbleGumBuffs:completeAnimation()
				self.BubbleGumBuffs:setAlpha( 1 )
				self.clipFinished( BubbleGumBuffs, {} )

				HighlightFrame:completeAnimation()
				self.HighlightFrame:setRGB( 1, 0.33, 0 )
				self.HighlightFrame:setAlpha( 1 )
				self.HighlightFrame:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
				self.clipFinished( HighlightFrame, {} )

				Glow:completeAnimation()
				self.Glow:setAlpha( 0.45 )
				self.clipFinished( Glow, {} )

				Glow2:completeAnimation()
				self.Glow2:setAlpha( 1 )
				self.clipFinished( Glow2, {} )

				HighlightFrame1:completeAnimation()
				self.HighlightFrame1:setRGB( 1, 0.33, 0 )
				self.HighlightFrame1:setAlpha( 1 )
				self.clipFinished( HighlightFrame1, {} )

				Arrow:completeAnimation()
				self.Arrow:setAlpha( 1 )
				self.clipFinished( Arrow, {} )
			end
		},
		InGame = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )

				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setRGB( 0, 0, 0 )
				self.FEButtonPanelShaderContainer:setAlpha( 0.8 )
				self.clipFinished( FEButtonPanelShaderContainer, {} )

				FEButtonIdle:completeAnimation()
				self.FEButtonIdle:setAlpha( 0 )
				self.clipFinished( FEButtonIdle, {} )

				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setAlpha( 0 )
				self.clipFinished( FEButtonFocus, {} )

				BubbleGumPackNameTextBox:completeAnimation()
				self.BubbleGumPackNameTextBox:setLeftRight( true, false, 0, 368 )
				self.BubbleGumPackNameTextBox:setTopBottom( true, false, 8, 28 )
				self.BubbleGumPackNameTextBox:setAlpha( 1 )
				self.BubbleGumPackNameTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
				self.clipFinished( BubbleGumPackNameTextBox, {} )

				BubbleGumPackLabel:completeAnimation()
				self.BubbleGumPackLabel:setAlpha( 0 )
				self.clipFinished( BubbleGumPackLabel, {} )

				BubbleGumPackLabelStroke:completeAnimation()
				self.BubbleGumPackLabelStroke:setAlpha( 0 )
				self.clipFinished( BubbleGumPackLabelStroke, {} )

				BubbleGumBuffs:completeAnimation()
				self.BubbleGumBuffs:setAlpha( 1 )
				self.clipFinished( BubbleGumBuffs, {} )

				HighlightFrame:completeAnimation()
				self.HighlightFrame:setRGB( 1, 1, 1 )
				self.HighlightFrame:setAlpha( 1 )
				self.clipFinished( HighlightFrame, {} )

				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )

				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0 )
				self.clipFinished( Glow2, {} )

				HighlightFrame1:completeAnimation()
				self.HighlightFrame1:setRGB( 1, 0.33, 0 )
				self.HighlightFrame1:setAlpha( 0 )
				self.clipFinished( HighlightFrame1, {} )

				Arrow:completeAnimation()
				self.Arrow:setAlpha( 0 )
				self.clipFinished( Arrow, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 9 )

				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setAlpha( 1 )
				self.clipFinished( FEButtonFocus, {} )

				BubbleGumPackLabel:completeAnimation()
				self.BubbleGumPackLabel:setAlpha( 0 )
				self.clipFinished( BubbleGumPackLabel, {} )

				BubbleGumPackLabelStroke:completeAnimation()
				self.BubbleGumPackLabelStroke:setAlpha( 1 )
				self.BubbleGumPackLabelStroke:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
				self.BubbleGumPackLabelStroke:setShaderVector( 0, 0.08, 0, 0, 0 )
				self.BubbleGumPackLabelStroke:setShaderVector( 1, 0, 0, 0, 0 )
				self.BubbleGumPackLabelStroke:setShaderVector( 2, 1, 0, 0, 0 )
				self.BubbleGumPackLabelStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				self.clipFinished( BubbleGumPackLabelStroke, {} )

				BubbleGumBuffs:completeAnimation()
				self.BubbleGumBuffs:setAlpha( 1 )
				self.clipFinished( BubbleGumBuffs, {} )

				HighlightFrame:completeAnimation()
				self.HighlightFrame:setRGB( 1, 0.33, 0 )
				self.HighlightFrame:setAlpha( 1 )
				self.HighlightFrame:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
				self.clipFinished( HighlightFrame, {} )

				Glow:completeAnimation()
				self.Glow:setAlpha( 0.45 )
				self.clipFinished( Glow, {} )

				Glow2:completeAnimation()
				self.Glow2:setAlpha( 1 )
				self.clipFinished( Glow2, {} )

				HighlightFrame1:completeAnimation()
				self.HighlightFrame1:setRGB( 1, 0.33, 0 )
				self.HighlightFrame1:setAlpha( 1 )
				self.clipFinished( HighlightFrame1, {} )

				Arrow:completeAnimation()
				self.Arrow:setAlpha( 1 )
				self.clipFinished( Arrow, {} )
			end
		}
	}
	BubbleGumBuffs.id = "BubbleGumBuffs"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.BubbleGumBuffs:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEButtonPanelShaderContainer:close()
		element.BackPanel:close()
		element.BubbleGumBuffs:close()
		element.HighlightFrame:close()
		element.HighlightFrame1:close()
		element.BubbleGumPackNameTextBox:close()
		element.BubbleGumPackLabel:close()
		element.BubbleGumPackLabelStroke:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

