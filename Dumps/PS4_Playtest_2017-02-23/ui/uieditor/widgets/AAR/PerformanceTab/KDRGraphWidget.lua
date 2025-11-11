require( "ui.uieditor.widgets.AAR.PerformanceTab.GraphArrow" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.MidLine" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.HelperWidgets.TextWithBg" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )

CoD.KDRGraphWidget = InheritFrom( LUI.UIElement )
CoD.KDRGraphWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.KDRGraphWidget )
	self.id = "KDRGraphWidget"
	self.soundSet = "HUD"
	self:setLeftRight( 0, 0, 0, 570 )
	self:setTopBottom( 0, 0, 0, 309 )
	
	local FEButtonPanel0 = CoD.FE_ButtonPanel.new( menu, controller )
	FEButtonPanel0:setLeftRight( 0, 0, 86, 537 )
	FEButtonPanel0:setTopBottom( 0, 0, 75, 222 )
	FEButtonPanel0:setRGB( 0.24, 0.24, 0.26 )
	FEButtonPanel0:setAlpha( 0.4 )
	self:addElement( FEButtonPanel0 )
	self.FEButtonPanel0 = FEButtonPanel0
	
	local GraphDesc = CoD.TextWithBg.new( menu, controller )
	GraphDesc:setLeftRight( 0, 0, 86, 537 )
	GraphDesc:setTopBottom( 0, 0, 222, 262 )
	GraphDesc.Bg:setAlpha( 0.4 )
	GraphDesc.Text:setText( Engine.Localize( "MENU_AAR_LAST_FIVE_GAMETYPE_GAMES" ) )
	GraphDesc.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	GraphDesc.Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self:addElement( GraphDesc )
	self.GraphDesc = GraphDesc
	
	local LastMatchScore = LUI.UIText.new()
	LastMatchScore:setLeftRight( 0, 0, 476, 599 )
	LastMatchScore:setTopBottom( 0, 0, 22, 84 )
	LastMatchScore:setRGB( 0.95, 0.91, 0.11 )
	LastMatchScore:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	LastMatchScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	LastMatchScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LastMatchScore:subscribeToGlobalModel( controller, "AARKDRGraph", "value1", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LastMatchScore:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( LastMatchScore )
	self.LastMatchScore = LastMatchScore
	
	local SecondLastMatchScore = LUI.UIText.new()
	SecondLastMatchScore:setLeftRight( 0, 0, 379, 466 )
	SecondLastMatchScore:setTopBottom( 0, 0, 44, 71 )
	SecondLastMatchScore:setRGB( 0.88, 0.89, 0.91 )
	SecondLastMatchScore:setTTF( "fonts/escom.ttf" )
	SecondLastMatchScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	SecondLastMatchScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	SecondLastMatchScore:subscribeToGlobalModel( controller, "AARKDRGraph", "value2Valid", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			SecondLastMatchScore:setAlpha( ZeroIfEqualElseArg( 0, 0.7, modelValue ) )
		end
	end )
	SecondLastMatchScore:subscribeToGlobalModel( controller, "AARKDRGraph", "value2", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			SecondLastMatchScore:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( SecondLastMatchScore )
	self.SecondLastMatchScore = SecondLastMatchScore
	
	local ThirdLastMatchScore = LUI.UIText.new()
	ThirdLastMatchScore:setLeftRight( 0, 0, 268, 355 )
	ThirdLastMatchScore:setTopBottom( 0, 0, 44, 71 )
	ThirdLastMatchScore:setRGB( 0.88, 0.89, 0.91 )
	ThirdLastMatchScore:setTTF( "fonts/escom.ttf" )
	ThirdLastMatchScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ThirdLastMatchScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	ThirdLastMatchScore:subscribeToGlobalModel( controller, "AARKDRGraph", "value3Valid", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ThirdLastMatchScore:setAlpha( ZeroIfEqualElseArg( 0, 0.7, modelValue ) )
		end
	end )
	ThirdLastMatchScore:subscribeToGlobalModel( controller, "AARKDRGraph", "value3", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ThirdLastMatchScore:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( ThirdLastMatchScore )
	self.ThirdLastMatchScore = ThirdLastMatchScore
	
	local FourthLastMatchScore = LUI.UIText.new()
	FourthLastMatchScore:setLeftRight( 0, 0, 154, 241 )
	FourthLastMatchScore:setTopBottom( 0, 0, 44, 71 )
	FourthLastMatchScore:setRGB( 0.88, 0.89, 0.91 )
	FourthLastMatchScore:setTTF( "fonts/escom.ttf" )
	FourthLastMatchScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	FourthLastMatchScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	FourthLastMatchScore:subscribeToGlobalModel( controller, "AARKDRGraph", "value4Valid", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FourthLastMatchScore:setAlpha( ZeroIfEqualElseArg( 0, 0.7, modelValue ) )
		end
	end )
	FourthLastMatchScore:subscribeToGlobalModel( controller, "AARKDRGraph", "value4", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FourthLastMatchScore:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( FourthLastMatchScore )
	self.FourthLastMatchScore = FourthLastMatchScore
	
	local FifthLastMatchScore = LUI.UIText.new()
	FifthLastMatchScore:setLeftRight( 0, 0, 45, 132 )
	FifthLastMatchScore:setTopBottom( 0, 0, 44, 71 )
	FifthLastMatchScore:setRGB( 0.88, 0.89, 0.91 )
	FifthLastMatchScore:setTTF( "fonts/escom.ttf" )
	FifthLastMatchScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	FifthLastMatchScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	FifthLastMatchScore:subscribeToGlobalModel( controller, "AARKDRGraph", "value5Valid", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FifthLastMatchScore:setAlpha( ZeroIfEqualElseArg( 0, 0.7, modelValue ) )
		end
	end )
	FifthLastMatchScore:subscribeToGlobalModel( controller, "AARKDRGraph", "value5", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FifthLastMatchScore:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( FifthLastMatchScore )
	self.FifthLastMatchScore = FifthLastMatchScore
	
	local MyAverageLabel = LUI.UIText.new()
	MyAverageLabel:setLeftRight( 0, 0, -14, 104 )
	MyAverageLabel:setTopBottom( 0, 0, 169, 190 )
	MyAverageLabel:setRGB( 0.88, 0.89, 0.91 )
	MyAverageLabel:setText( Engine.Localize( "MENU_MY_AVERAGE" ) )
	MyAverageLabel:setTTF( "fonts/escom.ttf" )
	MyAverageLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	MyAverageLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( MyAverageLabel )
	self.MyAverageLabel = MyAverageLabel
	
	local Vline2 = LUI.UIImage.new()
	Vline2:setLeftRight( 0, 0, 196, 202 )
	Vline2:setTopBottom( 0, 0, 75, 225 )
	Vline2:setAlpha( 0.5 )
	Vline2:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	Vline2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Vline2 )
	self.Vline2 = Vline2
	
	local Vline3 = LUI.UIImage.new()
	Vline3:setLeftRight( 0, 0, 308, 314 )
	Vline3:setTopBottom( 0, 0, 75, 225 )
	Vline3:setAlpha( 0.5 )
	Vline3:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	Vline3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Vline3 )
	self.Vline3 = Vline3
	
	local Vline4 = LUI.UIImage.new()
	Vline4:setLeftRight( 0, 0, 419, 425 )
	Vline4:setTopBottom( 0, 0, 75, 225 )
	Vline4:setAlpha( 0.5 )
	Vline4:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	Vline4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Vline4 )
	self.Vline4 = Vline4
	
	local MidLine = CoD.MidLine.new( menu, controller )
	MidLine:setLeftRight( 0, 0, 86, 537 )
	MidLine:setTopBottom( 0, 0, 147, 153 )
	self:addElement( MidLine )
	self.MidLine = MidLine
	
	local Average = CoD.GraphArrow.new( menu, controller )
	Average:setLeftRight( 0, 0, -62, 132 )
	Average:setTopBottom( 0, 0, 125, 174 )
	Average:setRGB( 0.88, 0.89, 0.91 )
	Average.Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Average:subscribeToGlobalModel( controller, "AARKDRGraph", "avgKDR", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Average.Text:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Average )
	self.Average = Average
	
	local MyAverageLabel0 = LUI.UIText.new()
	MyAverageLabel0:setLeftRight( 0, 0, 486, 596 )
	MyAverageLabel0:setTopBottom( 0, 0, 7, 28 )
	MyAverageLabel0:setRGB( 0.88, 0.89, 0.91 )
	MyAverageLabel0:setText( Engine.Localize( "MENU_LATEST_GAME" ) )
	MyAverageLabel0:setTTF( "fonts/escom.ttf" )
	MyAverageLabel0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	MyAverageLabel0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( MyAverageLabel0 )
	self.MyAverageLabel0 = MyAverageLabel0
	
	local cacButtonBoxLrgInactiveStroke0 = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	cacButtonBoxLrgInactiveStroke0:setLeftRight( 0, 0, 83, 540 )
	cacButtonBoxLrgInactiveStroke0:setTopBottom( 0, 0, 74, 266 )
	self:addElement( cacButtonBoxLrgInactiveStroke0 )
	self.cacButtonBoxLrgInactiveStroke0 = cacButtonBoxLrgInactiveStroke0
	
	local GlobalScore = LUI.UIText.new()
	GlobalScore:setLeftRight( 0, 0, 86, 537 )
	GlobalScore:setTopBottom( 0, 0, 270, 288 )
	GlobalScore:setRGB( 0.93, 0.74, 0.29 )
	GlobalScore:setAlpha( 0.9 )
	GlobalScore:setText( Engine.Localize( "MENU_AAR_GLOBAL_KDR" ) )
	GlobalScore:setTTF( "fonts/escom.ttf" )
	GlobalScore:setLetterSpacing( 3.5 )
	GlobalScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	GlobalScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( GlobalScore )
	self.GlobalScore = GlobalScore
	
	local Segment4 = LUI.UIImage.new()
	Segment4:setLeftRight( 0, 0, 82, 203 )
	Segment4:setTopBottom( 0, 0, 75, 222 )
	Segment4:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_aar_segment" ) )
	Segment4:setShaderVector( 2, 256, 256, 256, 0.4 )
	Segment4:setShaderVector( 3, 0.08, 0.07, 1, 0 )
	Segment4:subscribeToGlobalModel( controller, "AARKDRGraph", "value5Valid", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Segment4:setAlpha( modelValue )
		end
	end )
	Segment4:subscribeToGlobalModel( controller, "AARKDRGraph", "graphValue5", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Segment4:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	Segment4:subscribeToGlobalModel( controller, "AARKDRGraph", "graphValue4", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Segment4:setShaderVector( 1, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	self:addElement( Segment4 )
	self.Segment4 = Segment4
	
	local Segment3 = LUI.UIImage.new()
	Segment3:setLeftRight( 0, 0, 194, 317 )
	Segment3:setTopBottom( 0, 0, 75, 222 )
	Segment3:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_aar_segment" ) )
	Segment3:setShaderVector( 2, 256, 256, 256, 0.4 )
	Segment3:setShaderVector( 3, 0.08, 0.07, 1, 0 )
	Segment3:subscribeToGlobalModel( controller, "AARKDRGraph", "value4Valid", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Segment3:setAlpha( modelValue )
		end
	end )
	Segment3:subscribeToGlobalModel( controller, "AARKDRGraph", "graphValue4", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Segment3:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	Segment3:subscribeToGlobalModel( controller, "AARKDRGraph", "graphValue3", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Segment3:setShaderVector( 1, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	self:addElement( Segment3 )
	self.Segment3 = Segment3
	
	local Segment2 = LUI.UIImage.new()
	Segment2:setLeftRight( 0, 0, 306, 428 )
	Segment2:setTopBottom( 0, 0, 75, 222 )
	Segment2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_aar_segment" ) )
	Segment2:setShaderVector( 2, 256, 256, 256, 0.4 )
	Segment2:setShaderVector( 3, 0.08, 0.07, 1, 0 )
	Segment2:subscribeToGlobalModel( controller, "AARKDRGraph", "value3Valid", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Segment2:setAlpha( modelValue )
		end
	end )
	Segment2:subscribeToGlobalModel( controller, "AARKDRGraph", "graphValue3", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Segment2:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	Segment2:subscribeToGlobalModel( controller, "AARKDRGraph", "graphValue2", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Segment2:setShaderVector( 1, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	self:addElement( Segment2 )
	self.Segment2 = Segment2
	
	local Segment1 = LUI.UIImage.new()
	Segment1:setLeftRight( 0, 0, 417, 541 )
	Segment1:setTopBottom( 0, 0, 75, 222 )
	Segment1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_aar_segment" ) )
	Segment1:setShaderVector( 2, 256, 256, 256, 0.4 )
	Segment1:setShaderVector( 3, 0.08, 0.07, 1, 1 )
	Segment1:subscribeToGlobalModel( controller, "AARKDRGraph", "value2Valid", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Segment1:setAlpha( modelValue )
		end
	end )
	Segment1:subscribeToGlobalModel( controller, "AARKDRGraph", "graphValue2", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Segment1:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	Segment1:subscribeToGlobalModel( controller, "AARKDRGraph", "graphValue1", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Segment1:setShaderVector( 1, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	self:addElement( Segment1 )
	self.Segment1 = Segment1
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FEButtonPanel0:close()
		self.GraphDesc:close()
		self.MidLine:close()
		self.Average:close()
		self.cacButtonBoxLrgInactiveStroke0:close()
		self.LastMatchScore:close()
		self.SecondLastMatchScore:close()
		self.ThirdLastMatchScore:close()
		self.FourthLastMatchScore:close()
		self.FifthLastMatchScore:close()
		self.Segment4:close()
		self.Segment3:close()
		self.Segment2:close()
		self.Segment1:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

