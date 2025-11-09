require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.HelperWidgets.TextWithBg" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.MidLine" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.GraphArrow" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )

CoD.SPMGraphWidget = InheritFrom( LUI.UIElement )
CoD.SPMGraphWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SPMGraphWidget )
	self.id = "SPMGraphWidget"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 380 )
	self:setTopBottom( true, false, 0, 206 )
	self.anyChildUsesUpdateState = true
	
	local FEButtonPanel0 = CoD.FE_ButtonPanel.new( menu, controller )
	FEButtonPanel0:setLeftRight( true, false, 57.5, 358 )
	FEButtonPanel0:setTopBottom( true, false, 50, 148 )
	FEButtonPanel0:setRGB( 0.24, 0.24, 0.26 )
	FEButtonPanel0:setAlpha( 0.4 )
	self:addElement( FEButtonPanel0 )
	self.FEButtonPanel0 = FEButtonPanel0
	
	local GraphDesc = CoD.TextWithBg.new( menu, controller )
	GraphDesc:setLeftRight( true, false, 57.5, 358 )
	GraphDesc:setTopBottom( true, false, 148, 175 )
	GraphDesc.Bg:setAlpha( 0.4 )
	GraphDesc.Text:setText( Engine.Localize( "MENU_AAR_LAST_FIVE_GAMETYPE_GAMES" ) )
	GraphDesc.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( GraphDesc )
	self.GraphDesc = GraphDesc
	
	local LastMatchScore = LUI.UIText.new()
	LastMatchScore:setLeftRight( true, false, 317, 399 )
	LastMatchScore:setTopBottom( true, false, 13.5, 54.5 )
	LastMatchScore:setRGB( 0.95, 0.91, 0.11 )
	LastMatchScore:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	LastMatchScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	LastMatchScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LastMatchScore:subscribeToGlobalModel( controller, "AARSPMGraph", "value1", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LastMatchScore:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( LastMatchScore )
	self.LastMatchScore = LastMatchScore
	
	local SecondLastMatchScore = LUI.UIText.new()
	SecondLastMatchScore:setLeftRight( true, false, 254, 312 )
	SecondLastMatchScore:setTopBottom( true, false, 30, 48 )
	SecondLastMatchScore:setRGB( 0.88, 0.89, 0.91 )
	SecondLastMatchScore:setAlpha( 0.7 )
	SecondLastMatchScore:setTTF( "fonts/escom.ttf" )
	SecondLastMatchScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	SecondLastMatchScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	SecondLastMatchScore:subscribeToGlobalModel( controller, "AARSPMGraph", "value2", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			SecondLastMatchScore:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( SecondLastMatchScore )
	self.SecondLastMatchScore = SecondLastMatchScore
	
	local ThirdLastMatchScore = LUI.UIText.new()
	ThirdLastMatchScore:setLeftRight( true, false, 177.5, 235.5 )
	ThirdLastMatchScore:setTopBottom( true, false, 30, 48 )
	ThirdLastMatchScore:setRGB( 0.88, 0.89, 0.91 )
	ThirdLastMatchScore:setAlpha( 0.7 )
	ThirdLastMatchScore:setTTF( "fonts/escom.ttf" )
	ThirdLastMatchScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ThirdLastMatchScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	ThirdLastMatchScore:subscribeToGlobalModel( controller, "AARSPMGraph", "value3", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ThirdLastMatchScore:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( ThirdLastMatchScore )
	self.ThirdLastMatchScore = ThirdLastMatchScore
	
	local FifthLastMatchScore = LUI.UIText.new()
	FifthLastMatchScore:setLeftRight( true, false, 30, 88 )
	FifthLastMatchScore:setTopBottom( true, false, 30, 48 )
	FifthLastMatchScore:setRGB( 0.88, 0.89, 0.91 )
	FifthLastMatchScore:setAlpha( 0.7 )
	FifthLastMatchScore:setTTF( "fonts/escom.ttf" )
	FifthLastMatchScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	FifthLastMatchScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	FifthLastMatchScore:subscribeToGlobalModel( controller, "AARSPMGraph", "value5", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FifthLastMatchScore:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( FifthLastMatchScore )
	self.FifthLastMatchScore = FifthLastMatchScore
	
	local Vline4 = LUI.UIImage.new()
	Vline4:setLeftRight( true, false, 281.5, 285.5 )
	Vline4:setTopBottom( true, false, 50, 150 )
	Vline4:setAlpha( 0.5 )
	Vline4:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	Vline4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Vline4 )
	self.Vline4 = Vline4
	
	local Vline3 = LUI.UIImage.new()
	Vline3:setLeftRight( true, false, 205.5, 209.5 )
	Vline3:setTopBottom( true, false, 50, 150 )
	Vline3:setAlpha( 0.5 )
	Vline3:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	Vline3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Vline3 )
	self.Vline3 = Vline3
	
	local Vline2 = LUI.UIImage.new()
	Vline2:setLeftRight( true, false, 130.5, 134.5 )
	Vline2:setTopBottom( true, false, 50, 150 )
	Vline2:setAlpha( 0.5 )
	Vline2:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	Vline2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Vline2 )
	self.Vline2 = Vline2
	
	local MidLine = CoD.MidLine.new( menu, controller )
	MidLine:setLeftRight( true, false, 57.5, 358 )
	MidLine:setTopBottom( true, false, 98, 102 )
	self:addElement( MidLine )
	self.MidLine = MidLine
	
	local Average = CoD.GraphArrow.new( menu, controller )
	Average:setLeftRight( true, false, -41, 88 )
	Average:setTopBottom( true, false, 83, 116 )
	Average:setRGB( 0.88, 0.89, 0.91 )
	Average.Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Average:subscribeToGlobalModel( controller, "AARSPMGraph", "avgSPM", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Average.Text:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Average )
	self.Average = Average
	
	local cacButtonBoxLrgInactiveStroke0 = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	cacButtonBoxLrgInactiveStroke0:setLeftRight( true, false, 55.5, 360.27 )
	cacButtonBoxLrgInactiveStroke0:setTopBottom( true, false, 49, 177 )
	self:addElement( cacButtonBoxLrgInactiveStroke0 )
	self.cacButtonBoxLrgInactiveStroke0 = cacButtonBoxLrgInactiveStroke0
	
	local GlobalScore = LUI.UIText.new()
	GlobalScore:setLeftRight( true, false, 57.5, 358 )
	GlobalScore:setTopBottom( true, false, 180, 192 )
	GlobalScore:setRGB( 0.93, 0.74, 0.29 )
	GlobalScore:setAlpha( 0.9 )
	GlobalScore:setText( Engine.Localize( "MENU_AAR_GLOBAL_SPM" ) )
	GlobalScore:setTTF( "fonts/escom.ttf" )
	GlobalScore:setLetterSpacing( 3.5 )
	GlobalScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	GlobalScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( GlobalScore )
	self.GlobalScore = GlobalScore
	
	local FourthLastMatchScore = LUI.UIText.new()
	FourthLastMatchScore:setLeftRight( true, false, 103.5, 161.5 )
	FourthLastMatchScore:setTopBottom( true, false, 30, 48 )
	FourthLastMatchScore:setRGB( 0.88, 0.89, 0.91 )
	FourthLastMatchScore:setAlpha( 0.7 )
	FourthLastMatchScore:setTTF( "fonts/escom.ttf" )
	FourthLastMatchScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	FourthLastMatchScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	FourthLastMatchScore:subscribeToGlobalModel( controller, "AARSPMGraph", "value4", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FourthLastMatchScore:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( FourthLastMatchScore )
	self.FourthLastMatchScore = FourthLastMatchScore
	
	local MyAverageLabel = LUI.UIText.new()
	MyAverageLabel:setLeftRight( true, false, -12.5, 69.5 )
	MyAverageLabel:setTopBottom( true, false, 113, 127 )
	MyAverageLabel:setRGB( 0.88, 0.89, 0.91 )
	MyAverageLabel:setText( Engine.Localize( "MENU_MY_AVERAGE" ) )
	MyAverageLabel:setTTF( "fonts/escom.ttf" )
	MyAverageLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	MyAverageLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( MyAverageLabel )
	self.MyAverageLabel = MyAverageLabel
	
	local MyAverageLabel0 = LUI.UIText.new()
	MyAverageLabel0:setLeftRight( true, false, 317, 399 )
	MyAverageLabel0:setTopBottom( true, false, 3, 17 )
	MyAverageLabel0:setRGB( 0.88, 0.89, 0.91 )
	MyAverageLabel0:setText( Engine.Localize( "MENU_LATEST_GAME" ) )
	MyAverageLabel0:setTTF( "fonts/escom.ttf" )
	MyAverageLabel0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	MyAverageLabel0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( MyAverageLabel0 )
	self.MyAverageLabel0 = MyAverageLabel0
	
	local Segment1 = LUI.UIImage.new()
	Segment1:setLeftRight( true, false, 278, 363 )
	Segment1:setTopBottom( true, false, 50, 148 )
	Segment1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_aar_segment" ) )
	Segment1:setShaderVector( 2, 256, 256, 256, 0.4 )
	Segment1:setShaderVector( 3, 0.12, 0.1, 1, 1 )
	Segment1:subscribeToGlobalModel( controller, "AARSPMGraph", "value2Valid", function ( model )
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
	LUI.OverrideFunction_CallOriginalFirst( Segment1, "setState", function ( element, state )
		
	end )
	self:addElement( Segment1 )
	self.Segment1 = Segment1
	
	local Segment2 = LUI.UIImage.new()
	Segment2:setLeftRight( true, false, 203.5, 283.5 )
	Segment2:setTopBottom( true, false, 50, 148 )
	Segment2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_aar_segment" ) )
	Segment2:setShaderVector( 2, 256, 256, 256, 0.4 )
	Segment2:setShaderVector( 3, 0.12, 0.1, 1, 0 )
	Segment2:subscribeToGlobalModel( controller, "AARSPMGraph", "value3Valid", function ( model )
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
	
	local Segment3 = LUI.UIImage.new()
	Segment3:setLeftRight( true, false, 127.5, 207.89 )
	Segment3:setTopBottom( true, false, 50, 148 )
	Segment3:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_aar_segment" ) )
	Segment3:setShaderVector( 2, 256, 256, 256, 0.4 )
	Segment3:setShaderVector( 3, 0.12, 0.1, 1, 0 )
	Segment3:subscribeToGlobalModel( controller, "AARSPMGraph", "value4Valid", function ( model )
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
	
	local Segment4 = LUI.UIImage.new()
	Segment4:setLeftRight( true, false, 53.5, 132.5 )
	Segment4:setTopBottom( true, false, 50, 148 )
	Segment4:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_aar_segment" ) )
	Segment4:setShaderVector( 2, 256, 256, 256, 0.4 )
	Segment4:setShaderVector( 3, 0.12, 0.1, 0.04, 0 )
	Segment4:subscribeToGlobalModel( controller, "AARSPMGraph", "value5Valid", function ( model )
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
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FEButtonPanel0:close()
		self.GraphDesc:close()
		self.MidLine:close()
		self.Average:close()
		self.cacButtonBoxLrgInactiveStroke0:close()
		self.LastMatchScore:close()
		self.SecondLastMatchScore:close()
		self.ThirdLastMatchScore:close()
		self.FifthLastMatchScore:close()
		self.FourthLastMatchScore:close()
		self.Segment1:close()
		self.Segment2:close()
		self.Segment3:close()
		self.Segment4:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

