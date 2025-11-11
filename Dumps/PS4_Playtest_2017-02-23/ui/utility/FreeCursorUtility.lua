CoD.FreeCursorUtility = {}
CoD.FreeCursorUtility.SetAllowFreeCursor = function ( booleanArg )
	if Engine.UsingFreeCursor() then
		Dvar.ui_usingFreeCursor:set( booleanArg )
	end
end

CoD.FreeCursorUtility.RegisterFlyout = function ( menu, element, controller, focusableElementName, listElementName )
	CoD.FreeCursorUtility.RegisterFlyoutAdvanced( menu, element, controller, focusableElementName, listElementName, "DefaultState", "FlyOut" )
end

CoD.FreeCursorUtility.RegisterFlyoutAdvanced = function ( menu, element, controller, childButtonElementName, childListElementName, baseState, flyoutState )
	local button = LUI.getTableFromPath( childButtonElementName, element )
	local list = LUI.getTableFromPath( childListElementName, element )
	if button and list then
		element.handleMouseMove = true
		MakeNotFocusable( list )
		local oldGainFocusHandler = button.m_eventHandlers.gain_focus
		button:registerEventHandler( "gain_focus", function ( button, event )
			if oldGainFocusHandler( button, event ) then
				element:setForceMouseEventDispatch( true )
				element:setState( flyoutState )
				MakeFocusable( list )
				list:updateLayout()
				local root = element:getRoot()
				if element.cursorSubscription ~= nil then
					element:removeSubscription( element.cursorSubscription )
					element.cursorSubscription = nil
				end
				element.cursorSubscription = element:subscribeToGlobalModel( controller, "FreeCursor", "position", function ( model )
					if element.cursorSubscription then
						local x, y = model:get()
						local fakeEvent = {
							rootName = root.name,
							x = x,
							y = y,
							controller = controller
						}
						if not LUI.currentMouseFocus or not element:isParentOf( LUI.currentMouseFocus ) then
							element:setForceMouseEventDispatch( false )
							element:removeSubscription( element.cursorSubscription )
							element.cursorSubscription = nil
							element:setState( baseState )
							list:processEvent( {
								name = "lose_focus",
								controller = controller
							} )
							MakeNotFocusable( list )
						end
					end
				end, false )
				return true
			else
				
			end
		end )
	end
end

CoD.FreeCursorUtility.RegisterButtonFlyout = function ( menu, element, controller, focusableElementName, ... )
	CoD.FreeCursorUtility.RegisterButtonFlyoutAdvanced( menu, element, controller, "DefaultState", "Flyout", focusableElementName, ... )
end

CoD.FreeCursorUtility.RegisterButtonFlyoutAdvanced = function ( menu, element, controller, baseState, flyoutState, childButtonElementName, ... )
	local button = LUI.getTableFromPath( childButtonElementName, element )
	local childElements = {
		n = select( "#", ... ),
		...
	}
	if button and #childElements > 0 then
		element.handleMouseMove = true
		for _, elem in ipairs( childElements ) do
			MakeNotFocusable( elem )
		end
		f7_local0 = button.m_eventHandlers.gain_focus
		button:registerEventHandler( "gain_focus", function ( button, event )
			if f7_local0( button, event ) then
				element:setForceMouseEventDispatch( true )
				element:setState( flyoutState )
				for _, elem in ipairs( childElements ) do
					MakeFocusable( elem )
				end
				f8_local0 = element:getRoot()
				element.cursorSubscription = element:subscribeToGlobalModel( controller, "FreeCursor", "position", function ( model )
					if element.cursorSubscription then
						local x, y = model:get()
						local fakeEvent = {
							rootName = f8_local0.name,
							x = x,
							y = y,
							controller = controller
						}
						if not LUI.currentMouseFocus or not element:isParentOf( LUI.currentMouseFocus ) then
							element:setForceMouseEventDispatch( false )
							element:removeSubscription( element.cursorSubscription )
							element.cursorSubscription = nil
							element:setState( baseState )
							for _, elem in ipairs( childElements ) do
								elem:processEvent( {
									name = "lose_focus",
									controller = controller
								} )
								MakeNotFocusable( elem )
							end
						end
					end
				end, false )
				return true
			else
				
			end
		end )
	end
end

DataSources.FreeCursor = {
	getModel = function ( controller )
		if not DataSources.FreeCursor.models[controller] then
			local f10_local0 = Engine.GetModelForController( controller )
			local model = f10_local0:create( "FreeCursor" )
			local f10_local1 = model:create( "hasFocus" )
			f10_local1:set( false )
			model:create( "position" )
			f10_local1 = model:create( "hidden" )
			f10_local1:set( 0 )
			local contextualInfo = model:create( "contextualInfo" )
			contextualInfo:create( "buttonPrompts" )
			contextualInfo:create( "updateActivePrompts" )
			for _, info in ipairs( DataSources.FreeCursor.modelDefs ) do
				local f10_local5 = contextualInfo:create( info.name )
				f10_local5:set( info.default )
			end
			DataSources.FreeCursor.models[controller] = model
		end
		return DataSources.FreeCursor.models[controller]
	end,
	setupContext = function ( controller, model )
		local f11_local0 = DataSources.FreeCursor.getModel( controller )
		local contextualInfo = f11_local0.contextualInfo
		local f11_local1 = model
		local f11_local2 = model.noContextWidget
		if f11_local2 then
			f11_local2 = f11_local1 and model.noContextWidget:get() == true
		end
		for _, info in ipairs( DataSources.FreeCursor.modelDefs ) do
			local contextModel = contextualInfo[info.name]
			if contextModel then
				local result = info.default
				if not f11_local2 and model then
					for __, path in ipairs( info.paths ) do
						local subModel = model[path]
						if subModel then
							result = subModel:get()
							break
						end
					end
				end
				contextModel:set( result )
			end
		end
	end,
	registerButtonPrompts = function ( controller, buttonPromptModel )
		local f12_local0 = DataSources.FreeCursor.getModel( controller )
		f12_local0.contextualInfo.buttonPrompts:set( buttonPromptModel )
		DataSources.FreeCursor.updateActivePrompts( controller )
	end,
	updateActivePrompts = function ( controller )
		if IsLuaCodeVersionAtLeast( 26 ) then
			local f13_local0 = DataSources.FreeCursor.getModel( controller )
			f13_local0.contextualInfo.updateActivePrompts:forceNotifySubscriptions()
		end
	end,
	models = {},
	modelDefs = {
		{
			name = "title",
			paths = {
				"name",
				"freeCursorTitle"
			},
			default = ""
		},
		{
			name = "description",
			paths = {
				"desc",
				"description"
			},
			default = ""
		},
		{
			name = "header",
			paths = {
				"headerName"
			},
			default = ""
		},
		{
			name = "attachmentDataSource",
			paths = {
				"attachmentDataSource"
			},
			default = ""
		},
		{
			name = "loadout",
			paths = {
				"loadout",
				"loadoutSlot"
			},
			default = -1
		},
		{
			name = "cost",
			paths = {
				"cost"
			},
			default = -1
		},
		{
			name = "unlockDescription",
			paths = {
				"unlockDescription",
				"levelUnlockDescription"
			},
			default = ""
		},
		{
			name = "characterIndex",
			paths = {
				"characterIndex"
			},
			default = 0
		},
		{
			name = "characterTraitSummary",
			paths = {
				"characterTraitSummary"
			},
			default = ""
		},
		{
			name = "characterTraitsDatasource",
			paths = {
				"characterTraitsDatasource"
			},
			default = ""
		},
		{
			name = "clientNum",
			paths = {
				"clientNum"
			},
			default = -1
		}
	}
}
