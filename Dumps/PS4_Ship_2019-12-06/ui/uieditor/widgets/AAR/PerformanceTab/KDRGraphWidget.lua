require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.HelperWidgets.TextWithBg" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.MidLine" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.GraphArrow" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )

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
	GraphDesc.Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self:addElement( GraphDesc )
	self.GraphDesc = GraphDesc
	
	local LastMatchScore = LUI.UIText.new()
	LastMatchScore:setLeftRight( true, false, 317, 399 )
	LastMatchScore:setTopBottom( true, false, 15, 56 )
	LastMatchScore:setRGB( 0.95, 0.91, 0.11 )
	LastMatchScore:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	LastMatchScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	LastMatchScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LastMatchScore:subscribeToGlobalModel( controller, "AARKDRGraph", "value1", function ( model )
		local value1 = Engine.GetModelValue( model )
		if value1 then
			LastMatchScore:setText( Engine.Localize( value1 ) )
		end
	end )
	self:addElement( LastMatchScore )
	self.LastMatchScore = LastMatchScore
	
	local SecondLastMatchScore = LUI.UIText.new()
	SecondLastMatchScore:setLeftRight( true, false, 252.5, 310.5 )
	SecondLastMatchScore:setTopBottom( true, false, 29, 47 )
	SecondLastMatchScore:setRGB( 0.88, 0.89, 0.91 )
	SecondLastMatchScore:setTTF( "fonts/escom.ttf" )
	SecondLastMatchScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	SecondLastMatchScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	SecondLastMatchScore:subscribeToGlobalModel( controller, "AARKDRGraph", "value2Valid", function ( model )
		local value2Valid = Engine.GetModelValue( model )
		if value2Valid then
			SecondLastMatchScore:setAlpha( ZeroIfEqualElseArg( 0, 0.7, value2Valid ) )
		end
	end )
	SecondLastMatchScore:subscribeToGlobalModel( controller, "AARKDRGraph", "value2", function ( model )
		local value2 = Engine.GetModelValue( model )
		if value2 then
			SecondLastMatchScore:setText( Engine.Localize( value2 ) )
		end
	end )
	self:addElement( SecondLastMatchScore )
	self.SecondLastMatchScore = SecondLastMatchScore
	
	local ThirdLastMatchScore = LUI.UIText.new()
	ThirdLastMatchScore:setLeftRight( true, false, 178.75, 236.75 )
	ThirdLastMatchScore:setTopBottom( true, false, 29, 47 )
	ThirdLastMatchScore:setRGB( 0.88, 0.89, 0.91 )
	ThirdLastMatchScore:setTTF( "fonts/escom.ttf" )
	ThirdLastMatchScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ThirdLastMatchScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	ThirdLastMatchScore:subscribeToGlobalModel( controller, "AARKDRGraph", "value3Valid", function ( model )
		local value3Valid = Engine.GetModelValue( model )
		if value3Valid then
			ThirdLastMatchScore:setAlpha( ZeroIfEqualElseArg( 0, 0.7, value3Valid ) )
		end
	end )
	ThirdLastMatchScore:subscribeToGlobalModel( controller, "AARKDRGraph", "value3", function ( model )
		local value3 = Engine.GetModelValue( model )
		if value3 then
			ThirdLastMatchScore:setText( Engine.Localize( value3 ) )
		end
	end )
	self:addElement( ThirdLastMatchScore )
	self.ThirdLastMatchScore = ThirdLastMatchScore
	
	local FourthLastMatchScore = LUI.UIText.new()
	FourthLastMatchScore:setLeftRight( true, false, 103, 161 )
	FourthLastMatchScore:setTopBottom( true, false, 29, 47 )
	FourthLastMatchScore:setRGB( 0.88, 0.89, 0.91 )
	FourthLastMatchScore:setTTF( "fonts/escom.ttf" )
	FourthLastMatchScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	FourthLastMatchScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	FourthLastMatchScore:subscribeToGlobalModel( controller, "AARKDRGraph", "value4Valid", function ( model )
		local value4Valid = Engine.GetModelValue( model )
		if value4Valid then
			FourthLastMatchScore:setAlpha( ZeroIfEqualElseArg( 0, 0.7, value4Valid ) )
		end
	end )
	FourthLastMatchScore:subscribeToGlobalModel( controller, "AARKDRGraph", "value4", function ( model )
		local value4 = Engine.GetModelValue( model )
		if value4 then
			FourthLastMatchScore:setText( Engine.Localize( value4 ) )
		end
	end )
	self:addElement( FourthLastMatchScore )
	self.FourthLastMatchScore = FourthLastMatchScore
	
	local FifthLastMatchScore = LUI.UIText.new()
	FifthLastMatchScore:setLeftRight( true, false, 30, 88 )
	FifthLastMatchScore:setTopBottom( true, false, 29, 47 )
	FifthLastMatchScore:setRGB( 0.88, 0.89, 0.91 )
	FifthLastMatchScore:setTTF( "fonts/escom.ttf" )
	FifthLastMatchScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	FifthLastMatchScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	FifthLastMatchScore:subscribeToGlobalModel( controller, "AARKDRGraph", "value5Valid", function ( model )
		local value5Valid = Engine.GetModelValue( model )
		if value5Valid then
			FifthLastMatchScore:setAlpha( ZeroIfEqualElseArg( 0, 0.7, value5Valid ) )
		end
	end )
	FifthLastMatchScore:subscribeToGlobalModel( controller, "AARKDRGraph", "value5", function ( model )
		local value5 = Engine.GetModelValue( model )
		if value5 then
			FifthLastMatchScore:setText( Engine.Localize( value5 ) )
		end
	end )
	self:addElement( FifthLastMatchScore )
	self.FifthLastMatchScore = FifthLastMatchScore
	
	local MyAverageLabel = LUI.UIText.new()
	MyAverageLabel:setLeftRight( true, false, -9.5, 69.5 )
	MyAverageLabel:setTopBottom( true, false, 113, 127 )
	MyAverageLabel:setRGB( 0.88, 0.89, 0.91 )
	MyAverageLabel:setText( Engine.Localize( "MENU_MY_AVERAGE" ) )
	MyAverageLabel:setTTF( "fonts/escom.ttf" )
	MyAverageLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	MyAverageLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( MyAverageLabel )
	self.MyAverageLabel = MyAverageLabel
	
	local Vline2 = LUI.UIImage.new()
	Vline2:setLeftRight( true, false, 130.5, 134.5 )
	Vline2:setTopBottom( true, false, 50, 150 )
	Vline2:setAlpha( 0.5 )
	Vline2:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	Vline2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Vline2 )
	self.Vline2 = Vline2
	
	local Vline3 = LUI.UIImage.new()
	Vline3:setLeftRight( true, false, 205.5, 209.5 )
	Vline3:setTopBottom( true, false, 50, 150 )
	Vline3:setAlpha( 0.5 )
	Vline3:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	Vline3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Vline3 )
	self.Vline3 = Vline3
	
	local Vline4 = LUI.UIImage.new()
	Vline4:setLeftRight( true, false, 279.5, 283.5 )
	Vline4:setTopBottom( true, false, 50, 150 )
	Vline4:setAlpha( 0.5 )
	Vline4:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	Vline4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Vline4 )
	self.Vline4 = Vline4
	
	local MidLine = CoD.MidLine.new( menu, controller )
	MidLine:setLeftRight( true, false, 57.5, 358 )
	MidLine:setTopBottom( true, false, 98, 102 )
	self:addElement( MidLine )
	self.MidLine = MidLine
	
	local Average = CoD.GraphArrow.new( menu, controller )
	Average:setLeftRight( true, false, -41, 88 )
	Average:setTopBottom( true, false, 83.18, 115.82 )
	Average:setRGB( 0.88, 0.89, 0.91 )
	Average.Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Average:subscribeToGlobalModel( controller, "AARKDRGraph", "avgKDR", function ( model )
		local avgKDR = Engine.GetModelValue( model )
		if avgKDR then
			Average.Text:setText( Engine.Localize( avgKDR ) )
		end
	end )
	self:addElement( Average )
	self.Average = Average
	
	local MyAverageLabel0 = LUI.UIText.new()
	MyAverageLabel0:setLeftRight( true, false, 324, 397 )
	MyAverageLabel0:setTopBottom( true, false, 5, 19 )
	MyAverageLabel0:setRGB( 0.88, 0.89, 0.91 )
	MyAverageLabel0:setText( Engine.Localize( "MENU_LATEST_GAME" ) )
	MyAverageLabel0:setTTF( "fonts/escom.ttf" )
	MyAverageLabel0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	MyAverageLabel0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( MyAverageLabel0 )
	self.MyAverageLabel0 = MyAverageLabel0
	
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
	GlobalScore:setText( Engine.Localize( "MENU_AAR_GLOBAL_KDR" ) )
	GlobalScore:setTTF( "fonts/escom.ttf" )
	GlobalScore:setLetterSpacing( 3.5 )
	GlobalScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	GlobalScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( GlobalScore )
	self.GlobalScore = GlobalScore
	
	local Segment4 = LUI.UIImage.new()
	Segment4:setLeftRight( true, false, 54.5, 135 )
	Segment4:setTopBottom( true, false, 50, 148 )
	Segment4:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_aar_segment" ) )
	Segment4:setShaderVector( 2, 256, 256, 256, 0.4 )
	Segment4:setShaderVector( 3, 0.08, 0.07, 1, 0 )
	Segment4:subscribeToGlobalModel( controller, "AARKDRGraph", "value5Valid", function ( model )
		local value5Valid = Engine.GetModelValue( model )
		if value5Valid then
			Segment4:setAlpha( value5Valid )
		end
	end )
	Segment4:subscribeToGlobalModel( controller, "AARKDRGraph", "graphValue5", function ( model )
		local graphValue5 = Engine.GetModelValue( model )
		if graphValue5 then
			Segment4:setShaderVector( 0, CoD.GetVectorComponentFromString( graphValue5, 1 ), CoD.GetVectorComponentFromString( graphValue5, 2 ), CoD.GetVectorComponentFromString( graphValue5, 3 ), CoD.GetVectorComponentFromString( graphValue5, 4 ) )
		end
	end )
	Segment4:subscribeToGlobalModel( controller, "AARKDRGraph", "graphValue4", function ( model )
		local graphValue4 = Engine.GetModelValue( model )
		if graphValue4 then
			Segment4:setShaderVector( 1, CoD.GetVectorComponentFromString( graphValue4, 1 ), CoD.GetVectorComponentFromString( graphValue4, 2 ), CoD.GetVectorComponentFromString( graphValue4, 3 ), CoD.GetVectorComponentFromString( graphValue4, 4 ) )
		end
	end )
	self:addElement( Segment4 )
	self.Segment4 = Segment4
	
	local Segment3 = LUI.UIImage.new()
	Segment3:setLeftRight( true, false, 129, 211 )
	Segment3:setTopBottom( true, false, 50, 148 )
	Segment3:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_aar_segment" ) )
	Segment3:setShaderVector( 2, 256, 256, 256, 0.4 )
	Segment3:setShaderVector( 3, 0.08, 0.07, 1, 0 )
	Segment3:subscribeToGlobalModel( controller, "AARKDRGraph", "value4Valid", function ( model )
		local value4Valid = Engine.GetModelValue( model )
		if value4Valid then
			Segment3:setAlpha( value4Valid )
		end
	end )
	Segment3:subscribeToGlobalModel( controller, "AARKDRGraph", "graphValue4", function ( model )
		local graphValue4 = Engine.GetModelValue( model )
		if graphValue4 then
			Segment3:setShaderVector( 0, CoD.GetVectorComponentFromString( graphValue4, 1 ), CoD.GetVectorComponentFromString( graphValue4, 2 ), CoD.GetVectorComponentFromString( graphValue4, 3 ), CoD.GetVectorComponentFromString( graphValue4, 4 ) )
		end
	end )
	Segment3:subscribeToGlobalModel( controller, "AARKDRGraph", "graphValue3", function ( model )
		local graphValue3 = Engine.GetModelValue( model )
		if graphValue3 then
			Segment3:setShaderVector( 1, CoD.GetVectorComponentFromString( graphValue3, 1 ), CoD.GetVectorComponentFromString( graphValue3, 2 ), CoD.GetVectorComponentFromString( graphValue3, 3 ), CoD.GetVectorComponentFromString( graphValue3, 4 ) )
		end
	end )
	self:addElement( Segment3 )
	self.Segment3 = Segment3
	
	local Segment2 = LUI.UIImage.new()
	Segment2:setLeftRight( true, false, 204, 285 )
	Segment2:setTopBottom( true, false, 50, 148 )
	Segment2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_aar_segment" ) )
	Segment2:setShaderVector( 2, 256, 256, 256, 0.4 )
	Segment2:setShaderVector( 3, 0.08, 0.07, 1, 0 )
	Segment2:subscribeToGlobalModel( controller, "AARKDRGraph", "value3Valid", function ( model )
		local value3Valid = Engine.GetModelValue( model )
		if value3Valid then
			Segment2:setAlpha( value3Valid )
		end
	end )
	Segment2:subscribeToGlobalModel( controller, "AARKDRGraph", "graphValue3", function ( model )
		local graphValue3 = Engine.GetModelValue( model )
		if graphValue3 then
			Segment2:setShaderVector( 0, CoD.GetVectorComponentFromString( graphValue3, 1 ), CoD.GetVectorComponentFromString( graphValue3, 2 ), CoD.GetVectorComponentFromString( graphValue3, 3 ), CoD.GetVectorComponentFromString( graphValue3, 4 ) )
		end
	end )
	Segment2:subscribeToGlobalModel( controller, "AARKDRGraph", "graphValue2", function ( model )
		local graphValue2 = Engine.GetModelValue( model )
		if graphValue2 then
			Segment2:setShaderVector( 1, CoD.GetVectorComponentFromString( graphValue2, 1 ), CoD.GetVectorComponentFromString( graphValue2, 2 ), CoD.GetVectorComponentFromString( graphValue2, 3 ), CoD.GetVectorComponentFromString( graphValue2, 4 ) )
		end
	end )
	self:addElement( Segment2 )
	self.Segment2 = Segment2
	
	local Segment1 = LUI.UIImage.new()
	Segment1:setLeftRight( true, false, 278, 361 )
	Segment1:setTopBottom( true, false, 50, 148 )
	Segment1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_aar_segment" ) )
	Segment1:setShaderVector( 2, 256, 256, 256, 0.4 )
	Segment1:setShaderVector( 3, 0.08, 0.07, 1, 1 )
	Segment1:subscribeToGlobalModel( controller, "AARKDRGraph", "value2Valid", function ( model )
		local value2Valid = Engine.GetModelValue( model )
		if value2Valid then
			Segment1:setAlpha( value2Valid )
		end
	end )
	Segment1:subscribeToGlobalModel( controller, "AARKDRGraph", "graphValue2", function ( model )
		local graphValue2 = Engine.GetModelValue( model )
		if graphValue2 then
			Segment1:setShaderVector( 0, CoD.GetVectorComponentFromString( graphValue2, 1 ), CoD.GetVectorComponentFromString( graphValue2, 2 ), CoD.GetVectorComponentFromString( graphValue2, 3 ), CoD.GetVectorComponentFromString( graphValue2, 4 ) )
		end
	end )
	Segment1:subscribeToGlobalModel( controller, "AARKDRGraph", "graphValue1", function ( model )
		local graphValue1 = Engine.GetModelValue( model )
		if graphValue1 then
			Segment1:setShaderVector( 1, CoD.GetVectorComponentFromString( graphValue1, 1 ), CoD.GetVectorComponentFromString( graphValue1, 2 ), CoD.GetVectorComponentFromString( graphValue1, 3 ), CoD.GetVectorComponentFromString( graphValue1, 4 ) )
		end
	end )
	self:addElement( Segment1 )
	self.Segment1 = Segment1
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEButtonPanel0:close()
		element.GraphDesc:close()
		element.MidLine:close()
		element.Average:close()
		element.cacButtonBoxLrgInactiveStroke0:close()
		element.LastMatchScore:close()
		element.SecondLastMatchScore:close()
		element.ThirdLastMatchScore:close()
		element.FourthLastMatchScore:close()
		element.FifthLastMatchScore:close()
		element.Segment4:close()
		element.Segment3:close()
		element.Segment2:close()
		element.Segment1:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

