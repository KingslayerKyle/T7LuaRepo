require( "ui.uieditor.widgets.ZM_Cookbook.GenericMenuFrame_Cookbook" )
require( "ui.uieditor.widgets.BubbleGumBuffs.GobbleGumCookbookDistillsBalance" )
require( "ui.uieditor.widgets.BubbleGumBuffs.GobbleGumCookbookRemainingTime" )
require( "ui.uieditor.widgets.BubbleGumBuffs.GobbleGumRecipeListItem" )
require( "ui.uieditor.widgets.ZM_Cookbook.Cookbook_Flipbook" )
require( "ui.uieditor.widgets.ZM_Cookbook.Cookbook_Indicator_Triangle" )
require( "ui.uieditor.widgets.ZM_Cookbook.Cookboook_ResultListItem" )
require( "ui.uieditor.widgets.ZM_Cookbook.Cookbook_Main" )
require( "ui.uieditor.widgets.ZM_Cookbook.Cookbook_Main_Result" )
require( "ui.uieditor.widgets.ZM_Cookbook.Cookbook_Distills_Required" )

CoD.BubbleGumBuffUtility.CookGobbleGumRecipe = function ( f1_arg0, f1_arg1 )
	local f1_local0 = function ( f2_arg0, f2_arg1 )
		f2_arg0:registerEventHandler( "clip_over", nil )
		f2_arg0:setState( "DefaultState" )
		f2_arg0.playedClip = nil
		CoD.Menu.UpdateAllButtonPrompts( f2_arg0, f2_arg1 )
	end
	
	if f1_arg0.currentState == "Cooking" then
		return 
	end
	local f1_local1 = Engine.GetModelValue( Engine.GetModel( CoD.BubbleGumBuffUtility.GetGobbleGumRecipeInfoModel( f1_arg1 ), "recipeIndex" ) )
	local f1_local2 = CoD.BubbleGumBuffUtility.GetGobbleGumRecipeForIndex( f1_arg1, f1_local1 )
	if not f1_local2.haveAllIngredients then
		OpenSystemOverlay( f1_arg0, f1_arg0, f1_arg1, "NotEnoughIngredients", nil )
		return 
	end
	LUI.CoDMetrics.CookGobbleGumRecipeEvent( f1_arg1, f1_local1 )
	f1_arg0:setState( "Cooking" )
	CoD.Menu.UpdateAllButtonPrompts( f1_arg0, f1_arg1 )
	if CoD.BubbleGumBuffUtility.IsDebuggingEnabled() then
		f1_arg0.PipeAnimLeft:AnimateAllPipes()
		f1_arg0:DrainIngredientsAnimation()
		f1_arg0:playClip( "StartCooking" )
		f1_arg0.nextClip = "Cooking"
		f1_arg0.playedClip = false
		f1_arg0:registerEventHandler( "clip_over", function ( element, event )
			if f1_arg0.playedClip == false then
				LUI.UIElement.clipOver( element, event )
				f1_arg0.playedClip = true
			else
				f1_arg0.CookboookResultListItem:playClip( "Animate" )
				f1_arg0.PipeAnimResult:playClip( "Animate" )
				f1_arg0:playClip( "EndCooking" )
				f1_arg0:addElement( LUI.UITimer.newElementTimer( 1950, true, function ()
					local f4_local0 = Engine.CreateModel( CoD.BubbleGumBuffUtility.GetGobbleGumRecipeInfoModel( f1_arg1 ), "update" )
					if not Engine.SetModelValue( f4_local0, 1 ) then
						Engine.ForceNotifyModelSubscriptions( f4_local0 )
					end
					f1_arg0:RefillIngredientsAnimation()
				end ) )
				f1_arg0:registerEventHandler( "clip_over", function ( element, event )
					CoD.BubbleGumBuffUtility.SpendDistill( f1_arg1 )
					DataSources.GobbleGumDistills.getModel( f1_arg1 )
					f1_local0( f1_arg0, f1_arg1 )
					CoD.Menu.UpdateAllButtonPrompts( f1_arg0, f1_arg1 )
				end )
			end
		end )
		return 
	end
	local f1_local3 = CoD.BubbleGumBuffUtility.PaidDistillOffset
	if CoD.BubbleGumBuffUtility.GetRemainingUsesForDistill( f1_arg1, CoD.BubbleGumBuffUtility.FREE_DISTILL ) >= CoD.BubbleGumBuffUtility.GetRecipeDistillCost() then
		f1_local3 = CoD.BubbleGumBuffUtility.FreeDistillOffset
	end
	if Engine.CookGobbleGumRecipe( f1_arg1, f1_local1, f1_local3 ) == false then
		GoBack( f1_arg0, f1_arg1 )
		LuaUtils.UI_ShowErrorMessageDialog( f1_arg1, "ZMUI_COOKBOOK_RECIPE_FAILED" )
		return 
	end
	f1_arg0.PipeAnimLeft:AnimateAllPipes()
	f1_arg0:DrainIngredientsAnimation()
	f1_arg0:playClip( "StartCooking" )
	f1_arg0.nextClip = "Cooking"
	f1_arg0:registerEventHandler( "clip_over", function ( element, event )
		if not Engine.LootResultsReady( f1_arg1 ) or not Engine.IsLootReady( f1_arg1 ) or Engine.IsInventoryBusy( f1_arg1 ) then
			LUI.UIElement.clipOver( element, event )
		elseif Engine.LootFailureReason( f1_arg1 ) == Enum.LootResultType.LOOT_RESULT_SUCCESS then
			f1_arg0.CookboookResultListItem:playClip( "Animate" )
			f1_arg0.PipeAnimResult:playClip( "Animate" )
			f1_arg0:playClip( "EndCooking" )
			f1_arg0:addElement( LUI.UITimer.newElementTimer( 1950, true, function ()
				local f7_local0 = Engine.CreateModel( CoD.BubbleGumBuffUtility.GetGobbleGumRecipeInfoModel( f1_arg1 ), "update" )
				if not Engine.SetModelValue( f7_local0, 1 ) then
					Engine.ForceNotifyModelSubscriptions( f7_local0 )
				end
				f1_arg0:RefillIngredientsAnimation()
			end ) )
			f1_arg0:registerEventHandler( "clip_over", function ( element, event )
				f1_local0( f1_arg0, f1_arg1 )
				CoD.Menu.UpdateAllButtonPrompts( f1_arg0, f1_arg1 )
			end )
		else
			GoBack( f1_arg0, f1_arg1 )
			LuaUtils.UI_ShowErrorMessageDialog( f1_arg1, "ZMUI_COOKBOOK_RECIPE_FAILED" )
			return 
		end
	end )
end

CoD.OverlayUtility.AddSystemOverlay( "NotEnoughIngredients", {
	menuName = "SystemOverlay_Compact",
	title = "ZMUI_COOKBOOK_NOT_ENOUGH_GOBBLEGUM_CAPS",
	description = "ZMUI_COOKBOOK_NOT_ENOUGH_GOBBLEGUM_DESC",
	categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
	listDatasource = function ( f9_arg0, f9_arg1 )
		DataSources.NotEnoughIngredientsItemList = DataSourceHelpers.ListSetup( "NotEnoughIngredientsItemList", function ( f10_arg0, f10_arg1 )
			local f10_local0 = {}
			local f10_local1 = function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3, f11_arg4 )
				local f11_local0 = GoBack( f11_arg4, f11_arg2 )
			end
			
			local f10_local2 = function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3, f12_arg4 )
				return {
					models = {
						displayText = f12_arg3
					},
					properties = {
						action = f12_arg1,
						actionParam = f12_arg2,
						selectIndex = f12_arg4
					}
				}
			end
			
			table.insert( f10_local0, f10_local2( f10_arg0, f10_local1, {}, "MENU_OK", true ) )
			return f10_local0
		end, true )
		return "NotEnoughIngredientsItemList"
	end,
	[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
} )
local PostLoadFunc = function ( f13_arg0, f13_arg1 )
	f13_arg0:addElement( LUI.UITimer.newElementTimer( 100, false, function ()
		CoD.BubbleGumBuffUtility.ScheduleTimerTick( f13_arg1 )
	end ) )
	f13_arg0:subscribeToModel( Engine.GetModel( CoD.BubbleGumBuffUtility.GetGobbleGumRecipeInfoModel( f13_arg1 ), "scheduleIndex" ), function ( model )
		DelayGoBack( f13_arg0, f13_arg1 )
	end, false )
	local f13_local0 = f13_arg0.IngredientList:getItemAtPosition( 1, 1 )
	if f13_local0 then
		f13_arg0.PipeAnimLeft.CookbookFlowAnimTopBg:setModel( f13_local0:getModel() )
	end
	local f13_local1 = f13_arg0.IngredientList:getItemAtPosition( 2, 1 )
	if f13_local1 then
		f13_arg0.PipeAnimLeft.CookbookFlowAnimMiddleBg:setModel( f13_local1:getModel() )
	end
	local f13_local2 = f13_arg0.IngredientList:getItemAtPosition( 3, 1 )
	if f13_local2 then
		f13_arg0.PipeAnimLeft.CookbookFlowAnimBottomBg:setModel( f13_local2:getModel() )
	end
	f13_arg0.DrainIngredientsAnimation = function ( f16_arg0 )
		if f16_arg0.IngredientList then
			for f16_local0 = 1, f16_arg0.IngredientList.itemCount, 1 do
				local f16_local3 = f16_arg0.IngredientList:getItemAtPosition( f16_local0, 1 )
				f16_local3.CookbookRecipeFill:playClip( "Drain" )
			end
		end
	end
	
	f13_arg0.RefillIngredientsAnimation = function ( f17_arg0 )
		if f17_arg0.IngredientList then
			for f17_local0 = 1, f17_arg0.IngredientList.itemCount, 1 do
				local f17_local3 = f17_arg0.IngredientList:getItemAtPosition( f17_local0, 1 )
				f17_local3 = f17_local3.CookbookRecipeFill
				local f17_local4 = Engine.GetModelValue( Engine.GetModel( f17_local3:getModel(), "itemIndex" ) )
				local f17_local5 = Engine.GetModelValue( Engine.GetModel( f17_local3:getModel(), "count" ) )
				local f17_local6 = math.min( GetConsumableCountFromIndex( f13_arg1, f17_local4 ), f17_local5 ) / f17_local5
				f17_local3.fill:setAlpha( 1 )
				f17_local3.fillAnimated:setAlpha( 0 )
				local f17_local7 = 750
				f17_local3.fill:setShaderVector( 0, 0, 0, 0, 0 )
				f17_local3.fill:beginAnimation( "fill_bar", f17_local7, true, true )
				f17_local3.fill:setShaderVector( 0, f17_local6, 0, 0, 0 )
			end
		end
	end
	
end

LUI.createMenu.GobbleGumRecipe = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "GobbleGumRecipe" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "AbilityWheel"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GobbleGumRecipe.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( true, false, 0, 1280 )
	BG:setTopBottom( true, false, 0, 720 )
	BG:setImage( RegisterImage( "uie_t7_zm_cookbook_bg" ) )
	self:addElement( BG )
	self.BG = BG
	
	local Drawing = LUI.UIImage.new()
	Drawing:setLeftRight( true, false, 0, 1280 )
	Drawing:setTopBottom( true, false, 0, 720 )
	Drawing:setImage( RegisterImage( "uie_t7_zm_cookbook_bg_receipe" ) )
	self:addElement( Drawing )
	self.Drawing = Drawing
	
	local GenericMenuFrameCookbook = CoD.GenericMenuFrame_Cookbook.new( self, controller )
	GenericMenuFrameCookbook:setLeftRight( true, false, 0, 1280 )
	GenericMenuFrameCookbook:setTopBottom( true, false, 0, 720 )
	GenericMenuFrameCookbook.titleLabel:setText( Engine.Localize( "MENU_NEW" ) )
	self:addElement( GenericMenuFrameCookbook )
	self.GenericMenuFrameCookbook = GenericMenuFrameCookbook
	
	local Backing = LUI.UIImage.new()
	Backing:setLeftRight( false, false, 355, 578 )
	Backing:setTopBottom( false, false, -290.34, -160.38 )
	Backing:setAlpha( 0.8 )
	Backing:setImage( RegisterImage( "uie_t7_zm_cookbook_timeframe" ) )
	self:addElement( Backing )
	self.Backing = Backing
	
	local DistillTextBox = LUI.UIText.new()
	DistillTextBox:setLeftRight( true, false, 569, 769 )
	DistillTextBox:setTopBottom( true, false, 163.24, 197.24 )
	DistillTextBox:setRGB( 0.3, 0.2, 0.14 )
	DistillTextBox:setAlpha( 0.7 )
	DistillTextBox:setText( LocalizeToUpperString( "ZMUI_COOKBOOK_DISTILL" ) )
	DistillTextBox:setTTF( "fonts/default.ttf" )
	DistillTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	DistillTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( DistillTextBox )
	self.DistillTextBox = DistillTextBox
	
	local ResultTextBox = LUI.UIText.new()
	ResultTextBox:setLeftRight( true, false, 910, 1110 )
	ResultTextBox:setTopBottom( true, false, 163.24, 197.24 )
	ResultTextBox:setRGB( 0.3, 0.2, 0.14 )
	ResultTextBox:setAlpha( 0.7 )
	ResultTextBox:setText( LocalizeToUpperString( "ZMUI_COOKBOOK_RESULT" ) )
	ResultTextBox:setTTF( "fonts/default.ttf" )
	ResultTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ResultTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ResultTextBox )
	self.ResultTextBox = ResultTextBox
	
	local GobbleGumCookbookDistillsBalance = CoD.GobbleGumCookbookDistillsBalance.new( self, controller )
	GobbleGumCookbookDistillsBalance:setLeftRight( true, false, 1065, 1170 )
	GobbleGumCookbookDistillsBalance:setTopBottom( true, false, 96.66, 121.66 )
	self:addElement( GobbleGumCookbookDistillsBalance )
	self.GobbleGumCookbookDistillsBalance = GobbleGumCookbookDistillsBalance
	
	local GobbleGumCookbookRemainingTime = CoD.GobbleGumCookbookRemainingTime.new( self, controller )
	GobbleGumCookbookRemainingTime:setLeftRight( true, false, 1016, 1170 )
	GobbleGumCookbookRemainingTime:setTopBottom( true, false, 125.83, 150.83 )
	GobbleGumCookbookRemainingTime:setRGB( 0.3, 0.2, 0.14 )
	GobbleGumCookbookRemainingTime:setAlpha( 0.7 )
	GobbleGumCookbookRemainingTime:setScale( 0.8 )
	self:addElement( GobbleGumCookbookRemainingTime )
	self.GobbleGumCookbookRemainingTime = GobbleGumCookbookRemainingTime
	
	local IngredientList = LUI.GridLayout.new( self, controller, false, 0, 0, 31, 0, nil, nil, false, false, 0, 0, false, false )
	IngredientList:setLeftRight( true, false, 187.57, 295.57 )
	IngredientList:setTopBottom( true, false, 97.14, 639.14 )
	IngredientList:setWidgetType( CoD.GobbleGumRecipeListItem )
	IngredientList:setVerticalCount( 3 )
	IngredientList:setSpacing( 31 )
	IngredientList:setDataSource( "GobbleGumRecipeIngredientList" )
	self:addElement( IngredientList )
	self.IngredientList = IngredientList
	
	local CookbookFlipbook0 = CoD.Cookbook_Flipbook.new( self, controller )
	CookbookFlipbook0:setLeftRight( true, false, 618, 714 )
	CookbookFlipbook0:setTopBottom( true, false, 297, 393 )
	CookbookFlipbook0:setAlpha( 0 )
	self:addElement( CookbookFlipbook0 )
	self.CookbookFlipbook0 = CookbookFlipbook0
	
	local CookbookIndicatorTriangleTopLeft = CoD.Cookbook_Indicator_Triangle.new( self, controller )
	CookbookIndicatorTriangleTopLeft:setLeftRight( true, false, 598.77, 622.77 )
	CookbookIndicatorTriangleTopLeft:setTopBottom( true, false, 269.24, 293.24 )
	CookbookIndicatorTriangleTopLeft:setScale( 0.7 )
	self:addElement( CookbookIndicatorTriangleTopLeft )
	self.CookbookIndicatorTriangleTopLeft = CookbookIndicatorTriangleTopLeft
	
	local CookbookIndicatorTriangleTopRight = CoD.Cookbook_Indicator_Triangle.new( self, controller )
	CookbookIndicatorTriangleTopRight:setLeftRight( true, false, 710, 734 )
	CookbookIndicatorTriangleTopRight:setTopBottom( true, false, 269.24, 293.24 )
	CookbookIndicatorTriangleTopRight:setYRot( -180 )
	CookbookIndicatorTriangleTopRight:setScale( 0.7 )
	self:addElement( CookbookIndicatorTriangleTopRight )
	self.CookbookIndicatorTriangleTopRight = CookbookIndicatorTriangleTopRight
	
	local CookbookIndicatorTriangleBottomRight = CoD.Cookbook_Indicator_Triangle.new( self, controller )
	CookbookIndicatorTriangleBottomRight:setLeftRight( true, false, 710, 734 )
	CookbookIndicatorTriangleBottomRight:setTopBottom( true, false, 402.24, 426.24 )
	CookbookIndicatorTriangleBottomRight:setXRot( -180 )
	CookbookIndicatorTriangleBottomRight:setYRot( -180 )
	CookbookIndicatorTriangleBottomRight:setScale( 0.7 )
	self:addElement( CookbookIndicatorTriangleBottomRight )
	self.CookbookIndicatorTriangleBottomRight = CookbookIndicatorTriangleBottomRight
	
	local CookbookIndicatorTriangleBottomLeft = CoD.Cookbook_Indicator_Triangle.new( self, controller )
	CookbookIndicatorTriangleBottomLeft:setLeftRight( true, false, 598.77, 622.77 )
	CookbookIndicatorTriangleBottomLeft:setTopBottom( true, false, 402.24, 426.24 )
	CookbookIndicatorTriangleBottomLeft:setXRot( -180 )
	CookbookIndicatorTriangleBottomLeft:setScale( 0.7 )
	self:addElement( CookbookIndicatorTriangleBottomLeft )
	self.CookbookIndicatorTriangleBottomLeft = CookbookIndicatorTriangleBottomLeft
	
	local CookboookResultListItem = CoD.Cookboook_ResultListItem.new( self, controller )
	CookboookResultListItem:setLeftRight( true, false, 858.5, 1158.5 )
	CookboookResultListItem:setTopBottom( true, false, 201.8, 541.8 )
	CookboookResultListItem:subscribeToGlobalModel( controller, "GobbleGumRecipeResult", nil, function ( model )
		CookboookResultListItem:setModel( model, controller )
	end )
	self:addElement( CookboookResultListItem )
	self.CookboookResultListItem = CookboookResultListItem
	
	local PipeAnimLeft = CoD.Cookbook_Main.new( self, controller )
	PipeAnimLeft:setLeftRight( true, false, 435.52, 531.87 )
	PipeAnimLeft:setTopBottom( true, false, 144.49, 543.51 )
	self:addElement( PipeAnimLeft )
	self.PipeAnimLeft = PipeAnimLeft
	
	local PipeAnimResult = CoD.Cookbook_Main_Result.new( self, controller )
	PipeAnimResult:setLeftRight( true, false, 797.4, 887.4 )
	PipeAnimResult:setTopBottom( true, false, 267.5, 420.5 )
	PipeAnimResult:subscribeToGlobalModel( controller, "GobbleGumRecipeResult", nil, function ( model )
		PipeAnimResult:setModel( model, controller )
	end )
	self:addElement( PipeAnimResult )
	self.PipeAnimResult = PipeAnimResult
	
	local CookbookDistillsRequired = CoD.Cookbook_Distills_Required.new( self, controller )
	CookbookDistillsRequired:setLeftRight( true, false, 631, 710 )
	CookbookDistillsRequired:setTopBottom( true, false, 221.14, 252.14 )
	self:addElement( CookbookDistillsRequired )
	self.CookbookDistillsRequired = CookbookDistillsRequired
	
	local Title0 = LUI.UIText.new()
	Title0:setLeftRight( true, false, 129, 466 )
	Title0:setTopBottom( true, false, 52.66, 77.66 )
	Title0:setRGB( 0.3, 0.2, 0.14 )
	Title0:setZRot( -1.5 )
	Title0:setText( Engine.Localize( "MENU_NEWTONS_COOKBOOK_CAPS" ) )
	Title0:setTTF( "fonts/default.ttf" )
	Title0:setLetterSpacing( 2.8 )
	Title0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Title0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Title0 )
	self.Title0 = Title0
	
	local Audio = LUI.UIElement.new()
	Audio:setLeftRight( true, false, -48, 0 )
	Audio:setTopBottom( true, false, 29.66, 77.66 )
	self:addElement( Audio )
	self.Audio = Audio
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				GobbleGumCookbookDistillsBalance:completeAnimation()
				self.GobbleGumCookbookDistillsBalance:setLeftRight( true, false, 1065, 1170 )
				self.GobbleGumCookbookDistillsBalance:setTopBottom( true, false, 96.66, 121.66 )
				self.clipFinished( GobbleGumCookbookDistillsBalance, {} )
				CookbookFlipbook0:completeAnimation()
				self.CookbookFlipbook0:setAlpha( 0 )
				self.clipFinished( CookbookFlipbook0, {} )
			end
		},
		Cooking = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				CookbookFlipbook0:completeAnimation()
				self.CookbookFlipbook0:setLeftRight( true, false, 617, 713 )
				self.CookbookFlipbook0:setTopBottom( true, false, 297, 393 )
				self.CookbookFlipbook0:setAlpha( 0 )
				self.clipFinished( CookbookFlipbook0, {} )
			end,
			StartCooking = function ()
				self:setupElementClipCounter( 2 )
				local CookbookFlipbook0Frame2 = function ( CookbookFlipbook0, event )
					local CookbookFlipbook0Frame3 = function ( CookbookFlipbook0, event )
						if not event.interrupted then
							CookbookFlipbook0:beginAnimation( "keyframe", 179, false, false, CoD.TweenType.Linear )
						end
						CookbookFlipbook0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( CookbookFlipbook0, event )
						else
							CookbookFlipbook0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CookbookFlipbook0Frame3( CookbookFlipbook0, event )
						return 
					else
						CookbookFlipbook0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						CookbookFlipbook0:registerEventHandler( "transition_complete_keyframe", CookbookFlipbook0Frame3 )
					end
				end
				
				CookbookFlipbook0:completeAnimation()
				self.CookbookFlipbook0:setAlpha( 0 )
				CookbookFlipbook0Frame2( CookbookFlipbook0, {} )
				Audio:completeAnimation()
				self.Audio:setPlaySoundDirect( true )
				self.Audio:playSound( "uin_cookbook_mix_1", controller )
				self.clipFinished( Audio, {} )
			end,
			Cooking = function ()
				self:setupElementClipCounter( 2 )
				local CookbookFlipbook0Frame2 = function ( CookbookFlipbook0, event )
					if not event.interrupted then
						CookbookFlipbook0:beginAnimation( "keyframe", 1500, false, false, CoD.TweenType.Linear )
					end
					CookbookFlipbook0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( CookbookFlipbook0, event )
					else
						CookbookFlipbook0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CookbookFlipbook0:completeAnimation()
				self.CookbookFlipbook0:setAlpha( 1 )
				CookbookFlipbook0Frame2( CookbookFlipbook0, {} )
				Audio:completeAnimation()
				self.Audio:setPlaySoundDirect( true )
				self.Audio:playSound( "uin_cookbook_mix_2", controller )
				self.clipFinished( Audio, {} )
				self.nextClip = "Cooking"
			end,
			EndCooking = function ()
				self:setupElementClipCounter( 2 )
				local CookbookFlipbook0Frame2 = function ( CookbookFlipbook0, event )
					local CookbookFlipbook0Frame3 = function ( CookbookFlipbook0, event )
						local CookbookFlipbook0Frame4 = function ( CookbookFlipbook0, event )
							if not event.interrupted then
								CookbookFlipbook0:beginAnimation( "keyframe", 1540, false, false, CoD.TweenType.Linear )
							end
							CookbookFlipbook0:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( CookbookFlipbook0, event )
							else
								CookbookFlipbook0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							CookbookFlipbook0Frame4( CookbookFlipbook0, event )
							return 
						else
							CookbookFlipbook0:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
							CookbookFlipbook0:setAlpha( 0 )
							CookbookFlipbook0:registerEventHandler( "transition_complete_keyframe", CookbookFlipbook0Frame4 )
						end
					end
					
					if event.interrupted then
						CookbookFlipbook0Frame3( CookbookFlipbook0, event )
						return 
					else
						CookbookFlipbook0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						CookbookFlipbook0:registerEventHandler( "transition_complete_keyframe", CookbookFlipbook0Frame3 )
					end
				end
				
				CookbookFlipbook0:completeAnimation()
				self.CookbookFlipbook0:setAlpha( 1 )
				CookbookFlipbook0Frame2( CookbookFlipbook0, {} )
				Audio:completeAnimation()
				self.Audio:setPlaySoundDirect( true )
				self.Audio:playSound( "uin_cookbook_mix_3", controller )
				self.clipFinished( Audio, {} )
			end
		}
	}
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "GobbleGumDistills.totalDistills" ), function ( model )
		local f32_local0 = self
		local f32_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "GobbleGumDistills.totalDistills"
		}
		CoD.Menu.UpdateButtonShownState( f32_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "GobbleGumRecipeInfo.haveAllIngredients" ), function ( model )
		local f33_local0 = self
		local f33_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "GobbleGumRecipeInfo.haveAllIngredients"
		}
		CoD.Menu.UpdateButtonShownState( f33_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	self:registerEventHandler( "menu_opened", function ( self, event )
		local f34_local0 = nil
		if not HasSeenNewtonsCookbookFirstTimePopup( controller ) then
			OpenSystemOverlay( self, self, controller, "NewtonsCookbookWelcomePopup", "" )
		elseif HasSeenNewtonsCookbookFirstTimePopup( controller ) and CanGetFreeGobblegumCookbookUses( controller ) and IsPerControllerTablePropertyValue( controller, "came_from_lobby", true ) then
			OpenSystemOverlay( self, self, controller, "PurchaseDistills", nil )
		end
		if not f34_local0 then
			f34_local0 = self:dispatchEventToChildren( event )
		end
		return f34_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "ESCAPE", function ( element, menu, controller, model )
		if not IsSelfInState( self, "Cooking" ) then
			GoBack( self, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		if not IsSelfInState( self, "Cooking" ) then
			return true
		else
			return false
		end
	end, true )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsSelfInState( self, "Cooking" ) and not HasGobbleGumCookbookUses( controller ) then
			OpenSystemOverlay( self, menu, controller, "PurchaseDistills", nil )
			return true
		elseif not IsSelfInState( self, "Cooking" ) and not HasGobbleGumCookbookIngredients( controller ) then
			OpenSystemOverlay( self, menu, controller, "NotEnoughIngredients", "" )
			return true
		elseif not IsSelfInState( self, "Cooking" ) then
			CookGobbleGumRecipe( self, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ZMUI_COOKBOOK_ACTIVATE_RECIPE" )
		if not IsSelfInState( self, "Cooking" ) and not HasGobbleGumCookbookUses( controller ) then
			return true
		elseif not IsSelfInState( self, "Cooking" ) and not HasGobbleGumCookbookIngredients( controller ) then
			return true
		elseif not IsSelfInState( self, "Cooking" ) then
			return true
		else
			return false
		end
	end, true )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, nil, function ( element, menu, controller, model )
		if not IsSelfInState( self, "Cooking" ) then
			OpenSystemOverlay( self, menu, controller, "PurchaseDistills", nil )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "ZMUI_COOKBOOK_BUY_DISTILLS" )
		if not IsSelfInState( self, "Cooking" ) then
			return true
		else
			return false
		end
	end, true )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		SetPerControllerTableProperty( controller, "came_from_lobby", nil )
	end )
	GenericMenuFrameCookbook:setModel( self.buttonModel, controller )
	CookboookResultListItem.id = "CookboookResultListItem"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.CookboookResultListItem:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GenericMenuFrameCookbook:close()
		element.GobbleGumCookbookDistillsBalance:close()
		element.GobbleGumCookbookRemainingTime:close()
		element.IngredientList:close()
		element.CookbookFlipbook0:close()
		element.CookbookIndicatorTriangleTopLeft:close()
		element.CookbookIndicatorTriangleTopRight:close()
		element.CookbookIndicatorTriangleBottomRight:close()
		element.CookbookIndicatorTriangleBottomLeft:close()
		element.CookboookResultListItem:close()
		element.PipeAnimLeft:close()
		element.PipeAnimResult:close()
		element.CookbookDistillsRequired:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "GobbleGumRecipe.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

