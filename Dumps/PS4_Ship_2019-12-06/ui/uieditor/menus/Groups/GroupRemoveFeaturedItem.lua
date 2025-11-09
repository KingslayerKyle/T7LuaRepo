require( "ui.uieditor.widgets.BackgroundFrames.CACFullPopupBackground" )
require( "ui.uieditor.widgets.FileShare.FileshareSelectorItemLarge_NeverNormalSize" )
require( "ui.uieditor.widgets.FileShare.FileshareSpinner" )

local PreLoadFunc = function ( self, controller )
	CoD.perController[controller].previousCategory = CoD.FileshareUtility.GetCurrentCategory()
	FileshareCategorySelectorSetToCategory( controller, "featured", true )
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	LUI.OverrideFunction_CallOriginalFirst( f2_arg0, "close", function ( element )
		if CoD.perController[f2_arg1].previousCategory then
			local f3_local0 = CoD.FileshareUtility.GetCurrentCommunityDataType()
			local f3_local1 = CoD.perController[f2_arg1].previousCategory
			CoD.perController[f2_arg1].previousCategory = nil
			FileshareCategorySelectorCategoryChanged( f2_arg1, f3_local1, f3_local0, true )
		end
	end )
end

LUI.createMenu.GroupRemoveFeaturedItem = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "GroupRemoveFeaturedItem" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC_Overcapacity"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GroupRemoveFeaturedItem.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local background = CoD.CACFullPopupBackground.new( self, controller )
	background:setLeftRight( true, false, 0, 1280 )
	background:setTopBottom( true, false, 0, 720 )
	background.StartMenuTitlePopup.StartMenuTitleContainerLOC.StartMenu3dTitle.StartMenu3dTitleLabel.Label0:setText( Engine.Localize( "MENU_TOO_MANY_FEATURED_ITEMS_CAPS" ) )
	self:addElement( background )
	self.background = background
	
	local itemList = LUI.UIList.new( self, controller, 16, 0, nil, false, false, 0, 0, false, false )
	itemList:makeFocusable()
	itemList:setLeftRight( true, false, 20.5, 1259.5 )
	itemList:setTopBottom( true, false, 284.5, 435.5 )
	itemList:setScale( 0.93 )
	itemList:setWidgetType( CoD.FileshareSelectorItemLarge_NeverNormalSize )
	itemList:setHorizontalCount( 5 )
	itemList:setSpacing( 16 )
	itemList:setDataSource( "FilesharePublishedList" )
	itemList:linkToElementModel( itemList, "featureIsProcessing", true, function ( model )
		local f5_local0 = itemList
		local f5_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "featureIsProcessing"
		}
		CoD.Menu.UpdateButtonShownState( f5_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	itemList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f6_local0 = nil
		FileshareSetSelectedItem( self, element, controller, "" )
		MediaManagerClearDisplay( self, element, controller )
		return f6_local0
	end )
	itemList:registerEventHandler( "list_item_lose_focus", function ( element, event )
		local f7_local0 = nil
		FileshareItemLoseFocus( element )
		return f7_local0
	end )
	itemList:registerEventHandler( "gain_focus", function ( element, event )
		local f8_local0 = nil
		if element.gainFocus then
			f8_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f8_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f8_local0
	end )
	itemList:registerEventHandler( "lose_focus", function ( element, event )
		local f9_local0 = nil
		if element.loseFocus then
			f9_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f9_local0 = element.super:loseFocus( event )
		end
		return f9_local0
	end )
	self:AddButtonCallbackFunction( itemList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsSelfModelValueTrue( element, controller, "featureIsProcessing" ) then
			SwitchGroupShowcaseContentFeatured( self, element, controller, menu )
			Close( self, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsSelfModelValueTrue( element, controller, "featureIsProcessing" ) then
			return true
		else
			return false
		end
	end, true )
	itemList:subscribeToGlobalModel( controller, "FileshareRoot", "dirty", function ( model )
		UpdateDataSource( self, itemList, controller )
	end )
	itemList:subscribeToGlobalModel( controller, "FileshareRoot", "ready", function ( model )
		local f13_local0 = itemList
		if FileshareIsReady( controller ) then
			UpdateDataSource( self, f13_local0, controller )
		end
	end )
	itemList:mergeStateConditions( {
		{
			stateName = "Processing",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "featureIsProcessing" )
			end
		}
	} )
	itemList:linkToElementModel( itemList, "featureIsProcessing", true, function ( model )
		self:updateElementState( itemList, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "featureIsProcessing"
		} )
	end )
	itemList:linkToElementModel( itemList, "isValid", true, function ( model )
		self:updateElementState( itemList, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isValid"
		} )
	end )
	self:addElement( itemList )
	self.itemList = itemList
	
	local FileshareSpinner = CoD.FileshareSpinner.new( self, controller )
	FileshareSpinner:setLeftRight( true, false, 466, 530 )
	FileshareSpinner:setTopBottom( true, false, 328, 392 )
	FileshareSpinner:setAlpha( 0 )
	self:addElement( FileshareSpinner )
	self.FileshareSpinner = FileshareSpinner
	
	local LoadingText = LUI.UITightText.new()
	LoadingText:setLeftRight( true, false, 530, 785 )
	LoadingText:setTopBottom( true, false, 343, 377 )
	LoadingText:setAlpha( 0 )
	LoadingText:setText( Engine.Localize( "MENU_LOADING_FEATURED_CONTENT" ) )
	LoadingText:setTTF( "fonts/default.ttf" )
	self:addElement( LoadingText )
	self.LoadingText = LoadingText
	
	local Description = LUI.UITightText.new()
	Description:setLeftRight( true, false, 73.26, 235.26 )
	Description:setTopBottom( true, false, 230.79, 270.79 )
	Description:setText( Engine.Localize( "MENU_TOO_MANY_FEATURED_ITEMS_DESC" ) )
	Description:setTTF( "fonts/default.ttf" )
	self:addElement( Description )
	self.Description = Description
	
	local EmptyListText = LUI.UIText.new()
	EmptyListText:setLeftRight( true, false, 140, 1140 )
	EmptyListText:setTopBottom( true, false, 335, 369 )
	EmptyListText:setRGB( 1, 0, 0 )
	EmptyListText:setAlpha( 0 )
	EmptyListText:setText( Engine.Localize( "GROUPS_FEATURED_ITEM_LIST_EMPTY" ) )
	EmptyListText:setTTF( "fonts/default.ttf" )
	EmptyListText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	EmptyListText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( EmptyListText )
	self.EmptyListText = EmptyListText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				itemList:completeAnimation()
				self.itemList:setAlpha( 1 )
				self.clipFinished( itemList, {} )
				FileshareSpinner:completeAnimation()
				self.FileshareSpinner:setAlpha( 0 )
				self.clipFinished( FileshareSpinner, {} )
				LoadingText:completeAnimation()
				self.LoadingText:setAlpha( 0 )
				self.clipFinished( LoadingText, {} )
				Description:completeAnimation()
				self.Description:setAlpha( 1 )
				self.clipFinished( Description, {} )
				EmptyListText:completeAnimation()
				self.EmptyListText:setAlpha( 0 )
				self.clipFinished( EmptyListText, {} )
			end
		},
		Loading = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				itemList:completeAnimation()
				self.itemList:setAlpha( 0 )
				self.clipFinished( itemList, {} )
				FileshareSpinner:completeAnimation()
				self.FileshareSpinner:setAlpha( 1 )
				self.clipFinished( FileshareSpinner, {} )
				LoadingText:completeAnimation()
				self.LoadingText:setAlpha( 1 )
				self.clipFinished( LoadingText, {} )
				Description:completeAnimation()
				self.Description:setAlpha( 0 )
				self.clipFinished( Description, {} )
				EmptyListText:completeAnimation()
				self.EmptyListText:setAlpha( 0 )
				self.clipFinished( EmptyListText, {} )
			end
		},
		EmptyList = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				itemList:completeAnimation()
				self.itemList:setAlpha( 0 )
				self.clipFinished( itemList, {} )
				FileshareSpinner:completeAnimation()
				self.FileshareSpinner:setAlpha( 0 )
				self.clipFinished( FileshareSpinner, {} )
				LoadingText:completeAnimation()
				self.LoadingText:setAlpha( 0 )
				self.clipFinished( LoadingText, {} )
				Description:completeAnimation()
				self.Description:setAlpha( 0 )
				self.clipFinished( Description, {} )
				EmptyListText:completeAnimation()
				self.EmptyListText:setAlpha( 1 )
				self.clipFinished( EmptyListText, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Loading",
			condition = function ( menu, element, event )
				return not FileshareIsReady( controller )
			end
		},
		{
			stateName = "EmptyList",
			condition = function ( menu, element, event )
				return not FileshareHasAtLeastThisManyItems( element, controller, 5 )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.ready" ), function ( model )
		self:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.ready"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.itemsCount" ), function ( model )
		self:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.itemsCount"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "FileshareRoot.PublishMode" ), function ( model )
		self:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "FileshareRoot.PublishMode"
		} )
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	background:setModel( self.buttonModel, controller )
	background.buttons:setModel( self.buttonModel, controller )
	itemList.id = "itemList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.itemList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.background:close()
		element.itemList:close()
		element.FileshareSpinner:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "GroupRemoveFeaturedItem.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

