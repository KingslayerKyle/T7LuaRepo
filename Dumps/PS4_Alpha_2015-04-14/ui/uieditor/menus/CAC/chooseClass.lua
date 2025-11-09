require( "ui.uieditor.menus.CAC.Popups.ClassOptions" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.chooseClassWidget" )
require( "ui.uieditor.menus.CAC.CustomClass" )
require( "ui.uieditor.widgets.CAC.List1ButtonChooseClass" )
require( "ui.uieditor.widgets.BackgroundFrames.CACBackgroundNew" )
require( "ui.uieditor.widgets.buttonprompt_small" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideListCustomClass" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfopanePreviewWidget" )

local PreLoadFunc = function ( self, controller )
	self.disableBlur = true
	LUI.OverrideFunction_CallOriginalFirst( self, "setModel", function ( menu, model )
		Engine.PIXBeginEvent( "chooseClass model change" )
		menu:processEvent( {
			name = "update_state",
			menu = menu
		} )
		Engine.PIXEndEvent()
	end )
end

local PostLoadFunc = function ( self, controller )
	if CoD.CACUtility.FromCustomClass then
		self:playSound( "cac_reenter" )
		CoD.CACUtility.FromCustomClass = false
	else
		self:playSound( "cac_enter" )
	end
	self.chooseClassWidget:subscribeToElementModel( self.buttonList, nil, function ( model )
		self.chooseClassWidget:setModel( model, controller )
	end )
	self:processEvent( {
		name = "update_state",
		controller = controller
	} )
	SendLobbyMenuResponse( self, controller, "chooseClass" )
	self.buttonList.navigation = {
		right = nil
	}
	local heroIndex = Engine.GetEquippedHero( controller )
	Engine.SendClientScriptNotify( controller, "choose_class_preview", "opened", heroIndex )
end

LUI.createMenu.chooseClass = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "chooseClass" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( true, false, 64, 378 )
	LeftPanel:setTopBottom( true, false, 78, 667 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	LeftPanel.FEButtonPanel:setShaderVector( 0, 24.98, 25, 0, 0 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local chooseClassWidget = CoD.chooseClassWidget.new( self, controller )
	chooseClassWidget:setLeftRight( true, false, 395.5, 736.5 )
	chooseClassWidget:setTopBottom( true, false, 80, 663 )
	chooseClassWidget:setRGB( 1, 1, 1 )
	self:addElement( chooseClassWidget )
	self.chooseClassWidget = chooseClassWidget
	
	local buttonList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	buttonList:makeFocusable()
	buttonList:setLeftRight( true, false, 77, 357 )
	buttonList:setTopBottom( true, false, 136, 304 )
	buttonList:setRGB( 1, 1, 1 )
	buttonList:setDataSource( "ChooseClassList" )
	buttonList:setWidgetType( CoD.List1ButtonChooseClass )
	buttonList:setVerticalCount( 5 )
	buttonList:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		SetCustomClassNum( self, element, controller )
		NavigateToMenu( self, "CustomClass", true, controller )
		CloseChooseClassMenu( self, controller, "0" )
		return retVal
	end )
	buttonList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		SetCustomClassNum( self, element, controller )
		ResetCustomClassStartingFocus( self, element, controller, false )
		return retVal
	end )
	self:addElement( buttonList )
	self.buttonList = buttonList
	
	local background = CoD.CACBackgroundNew.new( self, controller )
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background:setRGB( 1, 1, 1 )
	background.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MPUI_CHOOSE_CLASS_CAPS" ) )
	self:addElement( background )
	self.background = background
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, -11, 2 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local classOptionsPrompt = CoD.buttonprompt_small.new( self, controller )
	classOptionsPrompt:setLeftRight( true, false, 389, 603 )
	classOptionsPrompt:setTopBottom( false, true, -56, -25 )
	classOptionsPrompt:setRGB( 1, 1, 1 )
	classOptionsPrompt.label:setText( Engine.Localize( "MENU_CLASS_OPTIONS" ) )
	classOptionsPrompt:subscribeToGlobalModel( controller, "Controller", "alt1_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			classOptionsPrompt.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( classOptionsPrompt )
	self.classOptionsPrompt = classOptionsPrompt
	
	local cacElemsSideListCustomClass0 = CoD.cac_ElemsSideListCustomClass.new( self, controller )
	cacElemsSideListCustomClass0:setLeftRight( true, false, 19, 417 )
	cacElemsSideListCustomClass0:setTopBottom( true, false, -12, 658 )
	cacElemsSideListCustomClass0:setRGB( 1, 1, 1 )
	cacElemsSideListCustomClass0.Image10:setAlpha( 0 )
	cacElemsSideListCustomClass0.Image101:setAlpha( 0 )
	self:addElement( cacElemsSideListCustomClass0 )
	self.cacElemsSideListCustomClass0 = cacElemsSideListCustomClass0
	
	local CustomClasspreviewWidget = CoD.InfopanePreviewWidget.new( self, controller )
	CustomClasspreviewWidget:setLeftRight( false, true, -567, 283 )
	CustomClasspreviewWidget:setTopBottom( false, true, -596, 0 )
	CustomClasspreviewWidget:setRGB( 1, 1, 1 )
	CustomClasspreviewWidget:setAlpha( 0 )
	CustomClasspreviewWidget:linkToElementModel( self, nil, false, function ( model )
		CustomClasspreviewWidget:setModel( model, controller )
	end )
	self:addElement( CustomClasspreviewWidget )
	self.CustomClasspreviewWidget = CustomClasspreviewWidget
	
	local CustomClassselectPrompt = CoD.buttonprompt_small.new( self, controller )
	CustomClassselectPrompt:setLeftRight( true, false, 65, 279 )
	CustomClassselectPrompt:setTopBottom( false, true, -1, 30 )
	CustomClassselectPrompt:setRGB( 1, 1, 1 )
	CustomClassselectPrompt:setAlpha( 0 )
	CustomClassselectPrompt.label:setText( Engine.Localize( "MENU_SELECT" ) )
	CustomClassselectPrompt:subscribeToGlobalModel( controller, "Controller", "primary_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CustomClassselectPrompt.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( CustomClassselectPrompt )
	self.CustomClassselectPrompt = CustomClassselectPrompt
	
	local CustomClassbackPrompt = CoD.buttonprompt_small.new( self, controller )
	CustomClassbackPrompt:setLeftRight( true, false, 146, 360 )
	CustomClassbackPrompt:setTopBottom( false, true, -2, 29 )
	CustomClassbackPrompt:setRGB( 1, 1, 1 )
	CustomClassbackPrompt:setAlpha( 0 )
	CustomClassbackPrompt.label:setText( Engine.Localize( "MENU_BACK" ) )
	CustomClassbackPrompt:subscribeToGlobalModel( controller, "Controller", "secondary_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CustomClassbackPrompt.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( CustomClassbackPrompt )
	self.CustomClassbackPrompt = CustomClassbackPrompt
	
	background:linkToElementModel( buttonList, nil, false, function ( model )
		background:setModel( model, controller )
	end )
	chooseClassWidget.navigation = {
		left = buttonList
	}
	buttonList.navigation = {
		right = chooseClassWidget
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( true, false, 64, 378 )
				self.LeftPanel:setTopBottom( true, false, 78, 667 )
				self.LeftPanel:setAlpha( 1 )
				self.clipFinished( LeftPanel, {} )
				chooseClassWidget:completeAnimation()
				self.chooseClassWidget:setLeftRight( true, false, 395.5, 736.5 )
				self.chooseClassWidget:setTopBottom( true, false, 80, 663 )
				self.chooseClassWidget:setAlpha( 1 )
				self.chooseClassWidget:setZoom( 0 )
				self.clipFinished( chooseClassWidget, {} )
				buttonList:completeAnimation()
				self.buttonList:setLeftRight( true, false, 77, 357 )
				self.buttonList:setTopBottom( true, false, 136, 304 )
				self.buttonList:setAlpha( 1 )
				self.buttonList:setZoom( 0 )
				self.clipFinished( buttonList, {} )
				CategoryListLine:completeAnimation()
				self.CategoryListLine:setLeftRight( true, false, -11, 1293 )
				self.CategoryListLine:setTopBottom( true, false, 80, 88 )
				self.clipFinished( CategoryListLine, {} )
				classOptionsPrompt:completeAnimation()
				self.classOptionsPrompt:setLeftRight( true, false, 389, 603 )
				self.classOptionsPrompt:setTopBottom( false, true, -56, -25 )
				self.classOptionsPrompt:setAlpha( 1 )
				self.clipFinished( classOptionsPrompt, {} )
				CustomClasspreviewWidget:completeAnimation()
				self.CustomClasspreviewWidget:setAlpha( 0 )
				self.clipFinished( CustomClasspreviewWidget, {} )
				CustomClassselectPrompt:completeAnimation()
				self.CustomClassselectPrompt:setAlpha( 0 )
				self.clipFinished( CustomClassselectPrompt, {} )
				CustomClassbackPrompt:completeAnimation()
				self.CustomClassbackPrompt:setAlpha( 0 )
				self.clipFinished( CustomClassbackPrompt, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 5 )
				local LeftPanelFrame2 = function ( LeftPanel, event )
					local LeftPanelFrame3 = function ( LeftPanel, event )
						if not event.interrupted then
							LeftPanel:beginAnimation( "keyframe", 539, false, true, CoD.TweenType.Linear )
						end
						LeftPanel:setLeftRight( true, false, 64, 378 )
						LeftPanel:setTopBottom( true, false, 78, 667 )
						LeftPanel:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( LeftPanel, event )
						else
							LeftPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LeftPanelFrame3( LeftPanel, event )
						return 
					else
						LeftPanel:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
						LeftPanel:registerEventHandler( "transition_complete_keyframe", LeftPanelFrame3 )
					end
				end
				
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( true, false, 64, 378 )
				self.LeftPanel:setTopBottom( true, false, 78, 84 )
				self.LeftPanel:setAlpha( 0 )
				LeftPanelFrame2( LeftPanel, {} )
				local chooseClassWidgetFrame2 = function ( chooseClassWidget, event )
					local chooseClassWidgetFrame3 = function ( chooseClassWidget, event )
						local chooseClassWidgetFrame4 = function ( chooseClassWidget, event )
							local chooseClassWidgetFrame5 = function ( chooseClassWidget, event )
								if not event.interrupted then
									chooseClassWidget:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Bounce )
								end
								chooseClassWidget:setLeftRight( true, false, 395.5, 736.5 )
								chooseClassWidget:setTopBottom( true, false, 80, 663 )
								chooseClassWidget:setAlpha( 1 )
								chooseClassWidget:setZoom( 0 )
								if event.interrupted then
									self.clipFinished( chooseClassWidget, event )
								else
									chooseClassWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								chooseClassWidgetFrame5( chooseClassWidget, event )
								return 
							else
								chooseClassWidget:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
								chooseClassWidget:setAlpha( 0.23 )
								chooseClassWidget:registerEventHandler( "transition_complete_keyframe", chooseClassWidgetFrame5 )
							end
						end
						
						if event.interrupted then
							chooseClassWidgetFrame4( chooseClassWidget, event )
							return 
						else
							chooseClassWidget:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Bounce )
							chooseClassWidget:setAlpha( 0.99 )
							chooseClassWidget:registerEventHandler( "transition_complete_keyframe", chooseClassWidgetFrame4 )
						end
					end
					
					if event.interrupted then
						chooseClassWidgetFrame3( chooseClassWidget, event )
						return 
					else
						chooseClassWidget:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
						chooseClassWidget:registerEventHandler( "transition_complete_keyframe", chooseClassWidgetFrame3 )
					end
				end
				
				chooseClassWidget:completeAnimation()
				self.chooseClassWidget:setLeftRight( true, false, 395.5, 736.5 )
				self.chooseClassWidget:setTopBottom( true, false, 80, 663 )
				self.chooseClassWidget:setAlpha( 0 )
				self.chooseClassWidget:setZoom( 0 )
				chooseClassWidgetFrame2( chooseClassWidget, {} )
				local buttonListFrame2 = function ( buttonList, event )
					local buttonListFrame3 = function ( buttonList, event )
						if not event.interrupted then
							buttonList:beginAnimation( "keyframe", 560, false, false, CoD.TweenType.Bounce )
						end
						buttonList:setLeftRight( true, false, 77, 357 )
						buttonList:setTopBottom( true, false, 136, 304 )
						buttonList:setAlpha( 1 )
						buttonList:setZoom( 0 )
						if event.interrupted then
							self.clipFinished( buttonList, event )
						else
							buttonList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						buttonListFrame3( buttonList, event )
						return 
					else
						buttonList:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
						buttonList:registerEventHandler( "transition_complete_keyframe", buttonListFrame3 )
					end
				end
				
				buttonList:completeAnimation()
				self.buttonList:setLeftRight( true, false, 77, 357 )
				self.buttonList:setTopBottom( true, false, 136, 304 )
				self.buttonList:setAlpha( 0 )
				self.buttonList:setZoom( 0 )
				buttonListFrame2( buttonList, {} )
				local CategoryListLineFrame2 = function ( CategoryListLine, event )
					if not event.interrupted then
						CategoryListLine:beginAnimation( "keyframe", 1750, false, true, CoD.TweenType.Linear )
					end
					CategoryListLine:setLeftRight( true, false, -11, 1293 )
					CategoryListLine:setTopBottom( true, false, 80, 88 )
					if event.interrupted then
						self.clipFinished( CategoryListLine, event )
					else
						CategoryListLine:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CategoryListLine:completeAnimation()
				self.CategoryListLine:setLeftRight( true, false, -11, 2 )
				self.CategoryListLine:setTopBottom( true, false, 80, 88 )
				CategoryListLineFrame2( CategoryListLine, {} )
				local classOptionsPromptFrame2 = function ( classOptionsPrompt, event )
					if not event.interrupted then
						classOptionsPrompt:beginAnimation( "keyframe", 460, false, true, CoD.TweenType.Linear )
					end
					classOptionsPrompt:setLeftRight( true, false, 389, 603 )
					classOptionsPrompt:setTopBottom( false, true, -56, -25 )
					classOptionsPrompt:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( classOptionsPrompt, event )
					else
						classOptionsPrompt:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				classOptionsPrompt:completeAnimation()
				self.classOptionsPrompt:setLeftRight( true, false, 395.5, 609.5 )
				self.classOptionsPrompt:setTopBottom( false, true, 19, 50 )
				self.classOptionsPrompt:setAlpha( 0 )
				classOptionsPromptFrame2( classOptionsPrompt, {} )
			end,
			Back = function ()
				self:setupElementClipCounter( 7 )
				local LeftPanelFrame2 = function ( LeftPanel, event )
					if not event.interrupted then
						LeftPanel:beginAnimation( "keyframe", 1000, true, true, CoD.TweenType.Linear )
					end
					LeftPanel:setLeftRight( true, false, 64, 378 )
					LeftPanel:setTopBottom( true, false, 78, 667 )
					LeftPanel:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LeftPanel, event )
					else
						LeftPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( true, false, 64, 428 )
				self.LeftPanel:setTopBottom( true, false, 78, 667 )
				self.LeftPanel:setAlpha( 1 )
				LeftPanelFrame2( LeftPanel, {} )
				local chooseClassWidgetFrame2 = function ( chooseClassWidget, event )
					if not event.interrupted then
						chooseClassWidget:beginAnimation( "keyframe", 1000, true, true, CoD.TweenType.Linear )
					end
					chooseClassWidget:setLeftRight( true, false, 395.5, 736.5 )
					chooseClassWidget:setTopBottom( true, false, 80, 663 )
					chooseClassWidget:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( chooseClassWidget, event )
					else
						chooseClassWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				chooseClassWidget:completeAnimation()
				self.chooseClassWidget:setLeftRight( true, false, -3, 497 )
				self.chooseClassWidget:setTopBottom( true, false, 80, 663 )
				self.chooseClassWidget:setAlpha( 1 )
				chooseClassWidgetFrame2( chooseClassWidget, {} )
				local buttonListFrame2 = function ( buttonList, event )
					local buttonListFrame3 = function ( buttonList, event )
						if not event.interrupted then
							buttonList:beginAnimation( "keyframe", 519, false, true, CoD.TweenType.Linear )
						end
						buttonList:setLeftRight( true, false, 77, 357 )
						buttonList:setTopBottom( true, false, 136, 304 )
						buttonList:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( buttonList, event )
						else
							buttonList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						buttonListFrame3( buttonList, event )
						return 
					else
						buttonList:beginAnimation( "keyframe", 479, false, false, CoD.TweenType.Linear )
						buttonList:registerEventHandler( "transition_complete_keyframe", buttonListFrame3 )
					end
				end
				
				buttonList:completeAnimation()
				self.buttonList:setLeftRight( true, false, -446, -166 )
				self.buttonList:setTopBottom( true, false, 136, 304 )
				self.buttonList:setAlpha( 1 )
				buttonListFrame2( buttonList, {} )
				local classOptionsPromptFrame2 = function ( classOptionsPrompt, event )
					local classOptionsPromptFrame3 = function ( classOptionsPrompt, event )
						local classOptionsPromptFrame4 = function ( classOptionsPrompt, event )
							local classOptionsPromptFrame5 = function ( classOptionsPrompt, event )
								if not event.interrupted then
									classOptionsPrompt:beginAnimation( "keyframe", 329, true, true, CoD.TweenType.Linear )
								end
								classOptionsPrompt:setLeftRight( true, false, 389, 603 )
								classOptionsPrompt:setTopBottom( false, true, -56, -25 )
								classOptionsPrompt:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( classOptionsPrompt, event )
								else
									classOptionsPrompt:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								classOptionsPromptFrame5( classOptionsPrompt, event )
								return 
							else
								classOptionsPrompt:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								classOptionsPrompt:setLeftRight( true, false, 352.23, 566.23 )
								classOptionsPrompt:setAlpha( 1 )
								classOptionsPrompt:registerEventHandler( "transition_complete_keyframe", classOptionsPromptFrame5 )
							end
						end
						
						if event.interrupted then
							classOptionsPromptFrame4( classOptionsPrompt, event )
							return 
						else
							classOptionsPrompt:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							classOptionsPrompt:setLeftRight( true, false, 351, 565 )
							classOptionsPrompt:setAlpha( 0 )
							classOptionsPrompt:registerEventHandler( "transition_complete_keyframe", classOptionsPromptFrame4 )
						end
					end
					
					if event.interrupted then
						classOptionsPromptFrame3( classOptionsPrompt, event )
						return 
					else
						classOptionsPrompt:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						classOptionsPrompt:setLeftRight( true, false, 350.57, 564.57 )
						classOptionsPrompt:setAlpha( 1 )
						classOptionsPrompt:registerEventHandler( "transition_complete_keyframe", classOptionsPromptFrame3 )
					end
				end
				
				classOptionsPrompt:completeAnimation()
				self.classOptionsPrompt:setLeftRight( true, false, 350, 564 )
				self.classOptionsPrompt:setTopBottom( false, true, -56, -25 )
				self.classOptionsPrompt:setAlpha( 0 )
				classOptionsPromptFrame2( classOptionsPrompt, {} )
				local CustomClasspreviewWidgetFrame2 = function ( CustomClasspreviewWidget, event )
					if not event.interrupted then
						CustomClasspreviewWidget:beginAnimation( "keyframe", 370, true, false, CoD.TweenType.Linear )
					end
					CustomClasspreviewWidget:setLeftRight( false, true, -567, 283 )
					CustomClasspreviewWidget:setTopBottom( false, true, -596, 0 )
					CustomClasspreviewWidget:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( CustomClasspreviewWidget, event )
					else
						CustomClasspreviewWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CustomClasspreviewWidget:completeAnimation()
				self.CustomClasspreviewWidget:setLeftRight( false, true, -850, 0 )
				self.CustomClasspreviewWidget:setTopBottom( false, true, -596, 0 )
				self.CustomClasspreviewWidget:setAlpha( 1 )
				CustomClasspreviewWidgetFrame2( CustomClasspreviewWidget, {} )
				local CustomClassselectPromptFrame2 = function ( CustomClassselectPrompt, event )
					if not event.interrupted then
						CustomClassselectPrompt:beginAnimation( "keyframe", 209, true, false, CoD.TweenType.Linear )
					end
					CustomClassselectPrompt:setLeftRight( true, false, 65, 279 )
					CustomClassselectPrompt:setTopBottom( false, true, -1, 30 )
					CustomClassselectPrompt:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( CustomClassselectPrompt, event )
					else
						CustomClassselectPrompt:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CustomClassselectPrompt:completeAnimation()
				self.CustomClassselectPrompt:setLeftRight( true, false, 65, 279 )
				self.CustomClassselectPrompt:setTopBottom( false, true, -56, -25 )
				self.CustomClassselectPrompt:setAlpha( 1 )
				CustomClassselectPromptFrame2( CustomClassselectPrompt, {} )
				local CustomClassbackPromptFrame2 = function ( CustomClassbackPrompt, event )
					local CustomClassbackPromptFrame3 = function ( CustomClassbackPrompt, event )
						if not event.interrupted then
							CustomClassbackPrompt:beginAnimation( "keyframe", 310, true, false, CoD.TweenType.Linear )
						end
						CustomClassbackPrompt:setLeftRight( true, false, 146, 360 )
						CustomClassbackPrompt:setTopBottom( false, true, -2, 29 )
						CustomClassbackPrompt:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( CustomClassbackPrompt, event )
						else
							CustomClassbackPrompt:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CustomClassbackPromptFrame3( CustomClassbackPrompt, event )
						return 
					else
						CustomClassbackPrompt:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						CustomClassbackPrompt:registerEventHandler( "transition_complete_keyframe", CustomClassbackPromptFrame3 )
					end
				end
				
				CustomClassbackPrompt:completeAnimation()
				self.CustomClassbackPrompt:setLeftRight( true, false, 146, 360 )
				self.CustomClassbackPrompt:setTopBottom( false, true, -57, -26 )
				self.CustomClassbackPrompt:setAlpha( 1 )
				CustomClassbackPromptFrame2( CustomClassbackPrompt, {} )
			end
		}
	}
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.primary = function ( menu, element, event )
		menu:addButtonPrompt( "primary", Engine.Localize( "MENU_SELECT" ), "ENTER", element )
		return true
	end
	
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		if IsInGame() then
			menu:addButtonPrompt( "secondary", Engine.Localize( "MP_BACK" ), "ESCAPE", element )
			return true
		else
			menu:addButtonPrompt( "secondary", Engine.Localize( "MP_BACK" ), "ESCAPE", element )
			return true
		end
	end
	
	self.buttonPromptAddFunctions.alt1 = function ( menu, element, event )
		return true
	end
	
	self.buttonPromptAddFunctions.primary( self, self, {
		controller = controller
	} )
	self.buttonPromptAddFunctions.secondary( self, self, {
		controller = controller
	} )
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and event.button ~= "primary" and event.button == "key_shortcut" and event.key == "ENTER" then
			
		else
			
		end
		if not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESCAPE") then
			if IsInGame() then
				SendOwnMenuResponse( self, controller, "closed" )
				Close( self, controller )
				ClearSavedState( self, controller )
				SaveLoadout( self, controller )
				ResetCustomClassStartingFocus( self, element, controller, true )
				CloseChooseClassMenu( self, controller, "1" )
				LockInput( self, controller, false )
			else
				PartyHostSetState( self, controller, CoD.PARTYHOST_STATE_NONE )
				GoBack( self, controller )
				ClearSavedState( self, controller )
				SaveLoadout( self, controller )
				ResetCustomClassStartingFocus( self, element, controller, true )
				CloseChooseClassMenu( self, controller, "1" )
				SavePaintshopData( self, controller )
			end
		end
		if not self.occludedBy and (event.button == "alt1" or event.button == "key_shortcut" and event.key == "O") then
			NavigateToMenu( self, "ClassOptions", true, controller )
			PlaySoundSetSound( self, "menu_sub" )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "update_class", function ( element, event )
		local retVal = nil
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "menu_opened", function ( element, event )
		local retVal = nil
		LobbySetLeaderActivity( self, controller, "MODIFYING_CAC" )
		SetElementStateByElementName( self, "background", controller, "Intro" )
		PlayClipOnElement( self, {
			elementName = "cacElemsSideListCustomClass0",
			clipName = "Intro"
		}, controller )
		PlayClip( self, "Intro", controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		if IsInGame() then
			SetElementStateByElementName( self, "background", controller, "Update" )
			PlayClip( self, "Back", controller )
			LockInput( self, controller, true )
		else
			SetElementStateByElementName( self, "background", controller, "Update" )
			PlayClip( self, "Back", controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	chooseClassWidget.id = "chooseClassWidget"
	buttonList.id = "buttonList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.buttonList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.LeftPanel:close()
		self.chooseClassWidget:close()
		self.buttonList:close()
		self.background:close()
		self.classOptionsPrompt:close()
		self.cacElemsSideListCustomClass0:close()
		self.CustomClasspreviewWidget:close()
		self.CustomClassselectPrompt:close()
		self.CustomClassbackPrompt:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

