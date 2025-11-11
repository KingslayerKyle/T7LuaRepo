require( "ui.uieditor.menus.FileShare.Popups.FileshareOptions" )
require( "ui.uieditor.widgets.FileShare.FileshareNoContent" )
require( "ui.uieditor.widgets.FileShare.FileshareSelectorItemLarge" )
require( "ui.uieditor.widgets.FileshareNoContentGraphic" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )

CoD.FileshareCategoryContentList = InheritFrom( LUI.UIElement )
CoD.FileshareCategoryContentList.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FileshareCategoryContentList )
	self.id = "FileshareCategoryContentList"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1155 )
	self:setTopBottom( 0, 0, 0, 787 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local FileshareNoContentGraphic = CoD.FileshareNoContentGraphic.new( menu, controller )
	FileshareNoContentGraphic:setLeftRight( 0, 0, 17, 1141 )
	FileshareNoContentGraphic:setTopBottom( 0, 0, 1.5, 718.5 )
	self:addElement( FileshareNoContentGraphic )
	self.FileshareNoContentGraphic = FileshareNoContentGraphic
	
	local verticalCounter = CoD.verticalCounter.new( menu, controller )
	verticalCounter:setLeftRight( 0, 0, 428, 728 )
	verticalCounter:setTopBottom( 0, 0, 723, 761 )
	verticalCounter:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SetAsListVerticalCounter( self, element, "contentList" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( verticalCounter )
	self.verticalCounter = verticalCounter
	
	local contentList = LUI.UIList.new( menu, controller, 15, 0, nil, false, false, 0, 0, false, false )
	contentList:makeFocusable()
	contentList:setLeftRight( 0, 0, 16, 1147 )
	contentList:setTopBottom( 0, 0, 2, 721 )
	contentList:setWidgetType( CoD.FileshareSelectorItemLarge )
	contentList:setHorizontalCount( 3 )
	contentList:setSpacing( 15 )
	contentList:setDataSource( "FilesharePublishedList" )
	contentList:subscribeToGlobalModel( controller, "FileshareRoot", "listVerticalCount", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			contentList:setVerticalCount( modelValue )
		end
	end )
	contentList:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		if FileshareIsCommunityMode( element, controller ) then
			SetElementDataSource( self, "contentList", "FileshareCommunityList" )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	contentList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		FileshareSetSelectedItem( self, element, controller, "" )
		MediaManagerClearDisplay( self, element, controller )
		return retVal
	end )
	contentList:registerEventHandler( "list_item_lose_focus", function ( element, event )
		local retVal = nil
		FileshareItemLoseFocus( element )
		return retVal
	end )
	contentList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_START )
		return retVal
	end )
	contentList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( contentList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	menu:AddButtonCallbackFunction( contentList, controller, Enum.LUIButton.LUI_KEY_START, nil, function ( element, menu, controller, model )
		if FileshareCanShowOptionsMenu( controller ) then
			OpenPopup( self, "FileshareOptions", controller, "", "" )
			PreserveThumbnails( controller, true )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if FileshareCanShowOptionsMenu( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS", nil )
			return true
		else
			return false
		end
	end, false )
	contentList:subscribeToGlobalModel( controller, "FileshareRoot", "dirty", function ( model )
		local element = contentList
		UpdateDataSource( self, element, controller )
	end )
	contentList:subscribeToGlobalModel( controller, "FileshareRoot", "ready", function ( model )
		local element = contentList
		if FileshareIsReady( controller ) then
			UpdateDataSource( self, element, controller )
		end
	end )
	self:addElement( contentList )
	self.contentList = contentList
	
	local FileshareNoContent = CoD.FileshareNoContent.new( menu, controller )
	FileshareNoContent:setLeftRight( 0, 0, 387, 768 )
	FileshareNoContent:setTopBottom( 0, 0, 337, 382 )
	self:addElement( FileshareNoContent )
	self.FileshareNoContent = FileshareNoContent
	
	FileshareNoContent:linkToElementModel( contentList, nil, false, function ( model )
		FileshareNoContent:setModel( model, controller )
	end )
	verticalCounter.navigation = {
		up = contentList
	}
	contentList.navigation = {
		down = verticalCounter
	}
	self.resetProperties = function ()
		contentList:completeAnimation()
		FileshareNoContentGraphic:completeAnimation()
		FileshareNoContent:completeAnimation()
		verticalCounter:completeAnimation()
		contentList:setLeftRight( 0, 0, 16, 1147 )
		contentList:setTopBottom( 0, 0, 2, 721 )
		FileshareNoContentGraphic:setLeftRight( 0, 0, 17, 1141 )
		FileshareNoContentGraphic:setTopBottom( 0, 0, 1.5, 718.5 )
		FileshareNoContent:setLeftRight( 0, 0, 387, 768 )
		FileshareNoContent:setTopBottom( 0, 0, 337, 382 )
		verticalCounter:setLeftRight( 0, 0, 428, 728 )
		verticalCounter:setTopBottom( 0, 0, 723, 761 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				contentList:completeAnimation()
				self.contentList:setLeftRight( 0, 0, 15.5, 1147.5 )
				self.contentList:setTopBottom( 0, 0, 1.5, 721.5 )
				self.clipFinished( contentList, {} )
			end
		},
		GroupsOverviewRecentShowcase = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				FileshareNoContentGraphic:completeAnimation()
				self.FileshareNoContentGraphic:setLeftRight( 0, 0, 17, 387 )
				self.FileshareNoContentGraphic:setTopBottom( 0, 0, 1.5, 718.5 )
				self.clipFinished( FileshareNoContentGraphic, {} )
				verticalCounter:completeAnimation()
				self.verticalCounter:setLeftRight( 0, 0, 52, 352 )
				self.verticalCounter:setTopBottom( 0, 0, 721, 759 )
				self.clipFinished( verticalCounter, {} )
				contentList:completeAnimation()
				self.contentList:setLeftRight( 0, 0, 16, 387 )
				self.contentList:setTopBottom( 0, 0, 1.5, 1111.5 )
				self.clipFinished( contentList, {} )
				FileshareNoContent:completeAnimation()
				self.FileshareNoContent:setLeftRight( 0, 0, 17, 398 )
				self.FileshareNoContent:setTopBottom( 0, 0, 337, 382 )
				self.clipFinished( FileshareNoContent, {} )
			end
		}
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	verticalCounter.id = "verticalCounter"
	contentList.id = "contentList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.contentList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FileshareNoContentGraphic:close()
		self.verticalCounter:close()
		self.contentList:close()
		self.FileshareNoContent:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

