require( "ui.uieditor.widgets.BuyablePerk.BuyablePerkButton1ListItem" )
require( "ui.uieditor.widgets.BuyablePerk.BuyablePerkButton2ListItem" )

local GetFormattedCost = function ( cost, score )
	local str = tostring( cost )
	str = str:reverse():gsub( "...", "%0,", math.floor( ( #str - 1 ) / 3 ) ):reverse()

	if cost > score then
		str = "^9" .. str
	end

	return str
end

local SetHeaderLabels = function ( self, controller )
	local controllerModel = Engine.GetModelForController( controller )
	local clientNum = Engine.GetClientNum( controller )
	local buttonListModel = self.buttonList:getModel()

	local nameModel = Engine.GetModel( buttonListModel, "name" )
	local costModel = Engine.GetModel( buttonListModel, "cost" )
	local descriptionModel = Engine.GetModel( buttonListModel, "description" )
	local hasPerkModel = Engine.GetModel( buttonListModel, "hasPerk" )
	local scoreModel = Engine.GetModel( controllerModel, "PlayerList." .. clientNum .. ".playerScore" )

	local name = Engine.GetModelValue( nameModel )
	local cost = Engine.GetModelValue( costModel )
	local description = Engine.GetModelValue( descriptionModel )
	local hasPerk = Engine.GetModelValue( hasPerkModel )
	local score = Engine.GetModelValue( scoreModel )

	if name ~= nil and cost ~= nil and description ~= nil and hasPerk ~= nil and score ~= nil then
		if self.PerkInfo ~= nil and self.Description ~= nil then
			if hasPerk == true then
				self.PerkInfo:setText( Engine.Localize( "OWNED - " .. name ) )
			else
				self.PerkInfo:setText( Engine.Localize( "BUY - " .. name .. "^7 - ^3$^7" .. GetFormattedCost( cost, score ) ) )
			end

			self.Description:setText( Engine.Localize( "[ i ] " .. description ) )
		end
	end
end

local PostLoadFunc = function ( self, controller )
	self.disableDarkenElement = true

	-- Scale images to buttonList setVerticalCount
	LUI.OverrideFunction_CallOriginalFirst( self.buttonList, "setVerticalCount", function ( element )
		if self.Header4 ~= nil and self.Background ~= nil and self.buttonList2 ~= nil then
			local backgroundTopBottom = 520

			if CoD.ZMPerks ~= nil then
				if self.buttonList.vCount ~= nil then
					if self.buttonList.vCount == 3 then
						backgroundTopBottom = backgroundTopBottom + 55
					elseif self.buttonList.vCount == 4 then
						backgroundTopBottom = backgroundTopBottom + 110
					end
				end
			end

			local exitButtonTopBottom = backgroundTopBottom - 30
			self.Header4:setTopBottom( true, false, 343.5, backgroundTopBottom )
			self.Background:setTopBottom( true, false, 246.5, backgroundTopBottom )
			self.buttonList2:setTopBottom( true, false, exitButtonTopBottom, 0 )
		end
	end )

	-- Calculate setVerticalCount for buttonList
	if CoD.ZMPerks ~= nil then
		if self.buttonList.hCount ~= nil then
			self.buttonList:setVerticalCount( math.ceil( #CoD.ZMPerks / self.buttonList.hCount ) )
		end

		-- Make it easy to identify if somebody has more than 28 perks
		if #CoD.ZMPerks > 28 then
			self.buttonList:setVerticalCount( 1 )
		end
	end

	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "forceScoreboard" ), function ( model )
		local forceScoreboard = Engine.GetModelValue( model )

		if forceScoreboard then
			if forceScoreboard == 1 then
				Engine.SendMenuResponse( controller, "BuyablePerk_Main", "close" )
			end
		end
	end )

	self:linkToElementModel( self.buttonList, "name", true, function ( model )
		SetHeaderLabels( self, controller )
	end )

	self:linkToElementModel( self.buttonList, "cost", true, function ( model )
		SetHeaderLabels( self, controller )
	end )

	self:linkToElementModel( self.buttonList, "description", true, function ( model )
		SetHeaderLabels( self, controller )
	end )

	self:linkToElementModel( self.buttonList, "hasPerk", true, function ( model )
		SetHeaderLabels( self, controller )
	end )

	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "PlayerList." .. Engine.GetClientNum( controller ) .. ".playerScore" ), function ( model )
		SetHeaderLabels( self, controller )
	end )

	local controllerModel = Engine.GetModelForController( controller )
	local perksModel = Engine.GetModel( controllerModel, "hudItems.perks" )

	if CoD.ZMPerks ~= nil then
		for index = 1, #CoD.ZMPerks do
			self:subscribeToModel( Engine.GetModel( perksModel, CoD.ZMPerks[index].clientFieldName ), function ( model )
				self.buttonList:updateDataSource()
			end )
		end
	end

	SetFocusToElement( self, "buttonList", controller )
end

DataSources.BuyablePerk = ListHelper_SetupDataSource( "BuyablePerk", function ( controller )
	local perks = {}

	local controllerModel = Engine.GetModelForController( controller )
	local perksModel = Engine.GetModel( controllerModel, "hudItems.perks" )

	if CoD.ZMPerks ~= nil then
		for index = 1, #CoD.ZMPerks do
			table.insert( perks, {
				models = {
					name = CoD.ZMPerks[index].name,
					cost = CoD.ZMPerks[index].cost,
					description = CoD.ZMPerks[index].description,
					image = CoD.ZMPerks[index].image,
					hasPerk = Engine.GetModelValue( Engine.GetModel( perksModel, CoD.ZMPerks[index].clientFieldName ) ) > 0,
					action = function ( self, element, controller, actionParam, menu )
						Engine.SendMenuResponse( controller, "BuyablePerk_Main", CoD.ZMPerks[index].cost .. "," .. CoD.ZMPerks[index].specialty )
					end
				}
			} )
		end
	end

	return perks
end, true )

DataSources.BuyablePerkExit = ListHelper_SetupDataSource( "BuyablePerkExit", function ( controller )
	local options = {}

	-- Has to be more than one thing in the datasource
	-- for the navigation handler to work for some reason
	for index = 1, 2 do
		table.insert( options, {
			models = {
				text = "EXIT",
				action = function ( self, element, controller, actionParam, menu )
					GoBack( menu, controller )
				end
			}
		} )
	end

	return options
end, true )

LUI.createMenu.BuyablePerk_Main = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "BuyablePerk_Main" )

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "BuyablePerk_Main.buttonPrompts" )
	self.anyChildUsesUpdateState = true

	self.Header1 = LUI.UIImage.new()
	self.Header1:setLeftRight( false, false, -222, 222 )
	self.Header1:setTopBottom( true, false, 246.5, 294.5 )
	self.Header1:setImage( RegisterImage( "$white" ) )
	self.Header1:setRGB( 0, 0, 0 )
	self.Header1:setAlpha( 0.75 )
	self:addElement( self.Header1 )

	self.Header2 = LUI.UIImage.new()
	self.Header2:setLeftRight( false, false, -222, 222 )
	self.Header2:setTopBottom( true, false, 294.5, 320 )
	self.Header2:setImage( RegisterImage( "$white" ) )
	self.Header2:setRGB( 0, 0, 0 )
	self.Header2:setAlpha( 0.5 )
	self:addElement( self.Header2 )

	self.Header3 = LUI.UIImage.new()
	self.Header3:setLeftRight( false, false, -222, 222 )
	self.Header3:setTopBottom( true, false, 320, 343.5 )
	self.Header3:setImage( RegisterImage( "$white" ) )
	self.Header3:setRGB( 0, 0, 0 )
	self.Header3:setAlpha( 0.75 )
	self:addElement( self.Header3 )

	self.Header4 = LUI.UIImage.new()
	self.Header4:setLeftRight( false, false, -222, 222 )
	self.Header4:setTopBottom( true, false, 0, 0 )
	self.Header4:setImage( RegisterImage( "$white" ) )
	self.Header4:setRGB( 0, 0, 0 )
	self.Header4:setAlpha( 0.5 )
	self:addElement( self.Header4 )

	self.Background = LUI.UIImage.new()
	self.Background:setLeftRight( false, false, -222, 222 )
	self.Background:setTopBottom( true, false, 0, 0 )
	self.Background:setImage( RegisterImage( "i_blood_damage_reaper_c" ) )
	self.Background:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	self.Background:setShaderVector( 0, 0, 1, 0, 0 )
	self:addElement( self.Background )

	self.Title = LUI.UIText.new()
	self.Title:setLeftRight( true, true, 0, 0 )
	self.Title:setTopBottom( true, false, 238.5, 302.5 )
	self.Title:setText( Engine.Localize( "PERK VENDING MACHINE" ) )
	self.Title:setTTF( "fonts/escom.ttf" )
	self.Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self.Title:setScale( 0.5 )
	self:addElement( self.Title )

	self.Description = LUI.UIText.new()
	self.Description:setLeftRight( true, true, 0, 0 )
	self.Description:setTopBottom( true, false, 291.5, 323 )
	self.Description:setText( Engine.Localize( "" ) )
	self.Description:setTTF( "fonts/escom.ttf" )
	self.Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self.Description:setScale( 0.5 )
	self:addElement( self.Description )

	self.PerkInfo = LUI.UIText.new()
	self.PerkInfo:setLeftRight( true, true, 0, 0 )
	self.PerkInfo:setTopBottom( true, false, 317, 346.5 )
	self.PerkInfo:setText( Engine.Localize( "" ) )
	self.PerkInfo:setTTF( "fonts/escom.ttf" )
	self.PerkInfo:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self.PerkInfo:setScale( 0.5 )
	self:addElement( self.PerkInfo )

	self.buttonList = LUI.UIList.new( self, controller, 5, 0, nil, true, false, 0, 0, false, false )
	self.buttonList:makeFocusable()
	self.buttonList:setLeftRight( false, false, -222, 222 )
	self.buttonList:setTopBottom( true, false, 365, 0 )
	self.buttonList:setWidgetType( CoD.BuyablePerkButton1ListItem )
	self.buttonList:setHorizontalCount( 7 )
	self.buttonList:setDataSource( "BuyablePerk" )
	self:AddButtonCallbackFunction( self.buttonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )

		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )

		return true
	end, false )
	self:AddButtonCallbackFunction( self.buttonList, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( menu, controller )
	
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
	
		return true
	end, false )
	self:AddButtonCallbackFunction( self.buttonList, controller, Enum.LUIButton.LUI_KEY_NONE, "ESCAPE", function ( element, menu, controller, model )
		GoBack( menu, controller )
	
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_NONE, "" )
	
		return true
	end, false )
	self:addElement( self.buttonList )

	self.buttonList2 = LUI.UIList.new( self, controller, 0, 0, nil, true, false, 0, 0, false, false )
	self.buttonList2:makeFocusable()
	self.buttonList2:setLeftRight( false, false, 0, 0 )
	self.buttonList2:setTopBottom( true, false, 0, 0 )
	self.buttonList2:setWidgetType( CoD.BuyablePerkButton2ListItem )
	self.buttonList2:setHorizontalCount( 1 )
	self.buttonList2:setDataSource( "BuyablePerkExit" )
	self:AddButtonCallbackFunction( self.buttonList2, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )

		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )

		return true
	end, false )
	self:AddButtonCallbackFunction( self.buttonList2, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( menu, controller )
	
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
	
		return true
	end, false )
	self:AddButtonCallbackFunction( self.buttonList2, controller, Enum.LUIButton.LUI_KEY_NONE, "ESCAPE", function ( element, menu, controller, model )
		GoBack( menu, controller )
	
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_NONE, "" )
	
		return true
	end, false )
	self:addElement( self.buttonList2 )

	self.buttonList.navigation = {
		down = self.buttonList2
	}

	self.buttonList2.navigation = {
		up = self.buttonList
	}

	CoD.Menu.AddNavigationHandler( self, self, controller )

	self.buttonList.id = "buttonList"
	self.buttonList2.id = "buttonList2"

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Header1:close()
		element.Header2:close()
		element.Header3:close()
		element.Header4:close()
		element.Background:close()
		element.Title:close()
		element.Description:close()
		element.PerkInfo:close()
		element.buttonList:close()
		element.buttonList2:close()

		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "BuyablePerk_Main.buttonPrompts" ) )
	end )

	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end
