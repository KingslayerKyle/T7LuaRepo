require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.HelperWidgets.TextWithBg" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.MidLine" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.GraphArrow" )

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
	GraphDesc:setRGB( 1, 1, 1 )
	GraphDesc.Bg:setRGB( 0, 0, 0 )
	GraphDesc.Bg:setAlpha( 0.4 )
	GraphDesc.Text:setRGB( 1, 1, 1 )
	GraphDesc.Text:setText( Engine.Localize( "MENU_AAR_LAST_FIVE_GAMETYPE_GAMES" ) )
	GraphDesc.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( GraphDesc )
	self.GraphDesc = GraphDesc
	
	local LastMatchScore = LUI.UIText.new()
	LastMatchScore:setLeftRight( true, false, 52.25, 134.25 )
	LastMatchScore:setTopBottom( true, false, 13, 54 )
	LastMatchScore:setRGB( 0.95, 0.91, 0.11 )
	LastMatchScore:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	LastMatchScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
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
	SecondLastMatchScore:setLeftRight( true, false, 130, 188 )
	SecondLastMatchScore:setTopBottom( true, false, 30, 48 )
	SecondLastMatchScore:setRGB( 0.88, 0.89, 0.91 )
	SecondLastMatchScore:setAlpha( 0.7 )
	SecondLastMatchScore:setTTF( "fonts/Entovo.ttf" )
	SecondLastMatchScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	SecondLastMatchScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	SecondLastMatchScore:subscribeToGlobalModel( controller, "AARKDRGraph", "value2", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			SecondLastMatchScore:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( SecondLastMatchScore )
	self.SecondLastMatchScore = SecondLastMatchScore
	
	local ThirdLastMatchScore = LUI.UIText.new()
	ThirdLastMatchScore:setLeftRight( true, false, 204.75, 262.75 )
	ThirdLastMatchScore:setTopBottom( true, false, 30, 48 )
	ThirdLastMatchScore:setRGB( 0.88, 0.89, 0.91 )
	ThirdLastMatchScore:setAlpha( 0.7 )
	ThirdLastMatchScore:setTTF( "fonts/Entovo.ttf" )
	ThirdLastMatchScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ThirdLastMatchScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	ThirdLastMatchScore:subscribeToGlobalModel( controller, "AARKDRGraph", "value3", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ThirdLastMatchScore:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( ThirdLastMatchScore )
	self.ThirdLastMatchScore = ThirdLastMatchScore
	
	local FourthLastMatchScore = LUI.UIText.new()
	FourthLastMatchScore:setLeftRight( true, false, 279, 337 )
	FourthLastMatchScore:setTopBottom( true, false, 30, 48 )
	FourthLastMatchScore:setRGB( 0.88, 0.89, 0.91 )
	FourthLastMatchScore:setAlpha( 0.7 )
	FourthLastMatchScore:setTTF( "fonts/Entovo.ttf" )
	FourthLastMatchScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	FourthLastMatchScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	FourthLastMatchScore:subscribeToGlobalModel( controller, "AARKDRGraph", "value4", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FourthLastMatchScore:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( FourthLastMatchScore )
	self.FourthLastMatchScore = FourthLastMatchScore
	
	local Segment1 = LUI.UIImage.new()
	Segment1:setLeftRight( true, false, 57.5, 132 )
	Segment1:setTopBottom( true, false, 50, 148 )
	Segment1:setRGB( 1, 1, 1 )
	Segment1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_aar_segment" ) )
	Segment1:setShaderVector( 2, 0.84, 0.68, 0.31, 0.5 )
	Segment1:subscribeToGlobalModel( controller, "AARKDRGraph", "value2Valid", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Segment1:setAlpha( modelValue )
		end
	end )
	Segment1:subscribeToGlobalModel( controller, "AARKDRGraph", "graphValue1", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Segment1:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	Segment1:subscribeToGlobalModel( controller, "AARKDRGraph", "graphValue2", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Segment1:setShaderVector( 1, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	self:addElement( Segment1 )
	self.Segment1 = Segment1
	
	local FifthLastMatchScore = LUI.UIText.new()
	FifthLastMatchScore:setLeftRight( true, false, 356, 414 )
	FifthLastMatchScore:setTopBottom( true, false, 30, 48 )
	FifthLastMatchScore:setRGB( 0.88, 0.89, 0.91 )
	FifthLastMatchScore:setAlpha( 0.7 )
	FifthLastMatchScore:setTTF( "fonts/Entovo.ttf" )
	FifthLastMatchScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	FifthLastMatchScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	FifthLastMatchScore:subscribeToGlobalModel( controller, "AARKDRGraph", "value5", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FifthLastMatchScore:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( FifthLastMatchScore )
	self.FifthLastMatchScore = FifthLastMatchScore
	
	local Segment3 = LUI.UIImage.new()
	Segment3:setLeftRight( true, false, 208, 283 )
	Segment3:setTopBottom( true, false, 50, 148 )
	Segment3:setRGB( 1, 1, 1 )
	Segment3:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_aar_segment" ) )
	Segment3:setShaderVector( 2, 0.84, 0.68, 0.31, 0.5 )
	Segment3:subscribeToGlobalModel( controller, "AARKDRGraph", "value4Valid", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Segment3:setAlpha( modelValue )
		end
	end )
	Segment3:subscribeToGlobalModel( controller, "AARKDRGraph", "graphValue3", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Segment3:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	Segment3:subscribeToGlobalModel( controller, "AARKDRGraph", "graphValue4", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Segment3:setShaderVector( 1, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	self:addElement( Segment3 )
	self.Segment3 = Segment3
	
	local MyAverageLabel = LUI.UIText.new()
	MyAverageLabel:setLeftRight( true, false, -2.5, 51.5 )
	MyAverageLabel:setTopBottom( true, false, 119, 132 )
	MyAverageLabel:setRGB( 0.88, 0.89, 0.91 )
	MyAverageLabel:setText( Engine.Localize( "MENU_MY_AVERAGE" ) )
	MyAverageLabel:setTTF( "fonts/Entovo.ttf" )
	MyAverageLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	MyAverageLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( MyAverageLabel )
	self.MyAverageLabel = MyAverageLabel
	
	local Segment2 = LUI.UIImage.new()
	Segment2:setLeftRight( true, false, 132, 208 )
	Segment2:setTopBottom( true, false, 50, 148 )
	Segment2:setRGB( 1, 1, 1 )
	Segment2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_aar_segment" ) )
	Segment2:setShaderVector( 2, 0.84, 0.68, 0.31, 0.5 )
	Segment2:subscribeToGlobalModel( controller, "AARKDRGraph", "value3Valid", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Segment2:setAlpha( modelValue )
		end
	end )
	Segment2:subscribeToGlobalModel( controller, "AARKDRGraph", "graphValue2", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Segment2:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	Segment2:subscribeToGlobalModel( controller, "AARKDRGraph", "graphValue3", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Segment2:setShaderVector( 1, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	self:addElement( Segment2 )
	self.Segment2 = Segment2
	
	local GlobalScore = LUI.UIText.new()
	GlobalScore:setLeftRight( true, false, 57.5, 358 )
	GlobalScore:setTopBottom( true, false, 180, 192 )
	GlobalScore:setRGB( 0.93, 0.74, 0.29 )
	GlobalScore:setAlpha( 0.9 )
	GlobalScore:setText( Engine.Localize( "MENU_AAR_GLOBAL_KDR" ) )
	GlobalScore:setTTF( "fonts/Entovo.ttf" )
	GlobalScore:setLetterSpacing( 3.5 )
	GlobalScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	GlobalScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( GlobalScore )
	self.GlobalScore = GlobalScore
	
	local Segment4 = LUI.UIImage.new()
	Segment4:setLeftRight( true, false, 280, 358 )
	Segment4:setTopBottom( true, false, 50, 148 )
	Segment4:setRGB( 1, 1, 1 )
	Segment4:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_aar_segment" ) )
	Segment4:setShaderVector( 2, 0.84, 0.68, 0.31, 0.5 )
	Segment4:subscribeToGlobalModel( controller, "AARKDRGraph", "value5Valid", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Segment4:setAlpha( modelValue )
		end
	end )
	Segment4:subscribeToGlobalModel( controller, "AARKDRGraph", "graphValue4", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Segment4:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	Segment4:subscribeToGlobalModel( controller, "AARKDRGraph", "graphValue5", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Segment4:setShaderVector( 1, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	self:addElement( Segment4 )
	self.Segment4 = Segment4
	
	local Vline2 = LUI.UIImage.new()
	Vline2:setLeftRight( true, false, 130.5, 134.5 )
	Vline2:setTopBottom( true, false, 50, 150 )
	Vline2:setRGB( 1, 1, 1 )
	Vline2:setAlpha( 0.5 )
	Vline2:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	Vline2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Vline2 )
	self.Vline2 = Vline2
	
	local Vline3 = LUI.UIImage.new()
	Vline3:setLeftRight( true, false, 205.5, 209.5 )
	Vline3:setTopBottom( true, false, 50, 150 )
	Vline3:setRGB( 1, 1, 1 )
	Vline3:setAlpha( 0.5 )
	Vline3:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	Vline3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Vline3 )
	self.Vline3 = Vline3
	
	local Vline4 = LUI.UIImage.new()
	Vline4:setLeftRight( true, false, 279.5, 283.5 )
	Vline4:setTopBottom( true, false, 50, 150 )
	Vline4:setRGB( 1, 1, 1 )
	Vline4:setAlpha( 0.5 )
	Vline4:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	Vline4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Vline4 )
	self.Vline4 = Vline4
	
	local cacButtonBoxLrgInactiveStroke0 = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	cacButtonBoxLrgInactiveStroke0:setLeftRight( true, false, 55.5, 360.27 )
	cacButtonBoxLrgInactiveStroke0:setTopBottom( true, false, 49, 177 )
	cacButtonBoxLrgInactiveStroke0:setRGB( 1, 1, 1 )
	self:addElement( cacButtonBoxLrgInactiveStroke0 )
	self.cacButtonBoxLrgInactiveStroke0 = cacButtonBoxLrgInactiveStroke0
	
	local MidLine = CoD.MidLine.new( menu, controller )
	MidLine:setLeftRight( true, false, 57.5, 358 )
	MidLine:setTopBottom( true, false, 98, 102 )
	MidLine:setRGB( 1, 1, 1 )
	self:addElement( MidLine )
	self.MidLine = MidLine
	
	local Average = CoD.GraphArrow.new( menu, controller )
	Average:setLeftRight( true, false, -51, 78 )
	Average:setTopBottom( true, false, 84.18, 116.82 )
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
	
	self.close = function ( self )
		self.FEButtonPanel0:close()
		self.GraphDesc:close()
		self.cacButtonBoxLrgInactiveStroke0:close()
		self.MidLine:close()
		self.Average:close()
		self.LastMatchScore:close()
		self.SecondLastMatchScore:close()
		self.ThirdLastMatchScore:close()
		self.FourthLastMatchScore:close()
		self.Segment1:close()
		self.FifthLastMatchScore:close()
		self.Segment3:close()
		self.Segment2:close()
		self.Segment4:close()
		CoD.KDRGraphWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

