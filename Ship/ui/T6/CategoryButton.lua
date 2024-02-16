-- 6029fb9b2bca8e7bb9a33f070f96d009
-- This hash is used for caching, delete to decompile the file again

require( "ui.T6.CoD9Button" )

CoD.CategoryButton = {}
CoD.CategoryButton.Action = function ( f1_arg0, f1_arg1 )
	if f1_arg0.actionEventName ~= nil then
		f1_arg0:dispatchEventToParent( {
			name = f1_arg0.actionEventName,
			controller = f1_arg1.controller,
			itemInfo = f1_arg0.itemInfo
		} )
	end
end

CoD.CategoryButton.GainFocus = function ( f2_arg0, f2_arg1 )
	local f2_local0 = CoD.CoD9Button.GainFocus( f2_arg0, f2_arg1 )
	if f2_arg0.gainFocusEventName ~= nil then
		f2_arg0:dispatchEventToParent( {
			name = f2_arg0.gainFocusEventName,
			controller = f2_arg1.controller,
			itemInfo = f2_arg0.itemInfo,
			owner = f2_arg0
		} )
	end
	return f2_local0
end

CoD.CategoryButton.LoseFocus = function ( f3_arg0, f3_arg1 )
	CoD.CoD9Button.LoseFocus( f3_arg0, f3_arg1 )
	if f3_arg0.loseFocusEventName ~= nil then
		f3_arg0:dispatchEventToParent( {
			name = f3_arg0.loseFocusEventName,
			controller = f3_arg1.controller
		} )
	end
end

CoD.CategoryButton.new = function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3, f4_arg4 )
	local f4_local0 = CoD.CoD9Button.new( f4_arg0, f4_arg1 )
	f4_local0.id = "CoD9Button.CategoryButton." .. f4_arg4.name
	f4_local0.gainFocusEventName = f4_arg2
	f4_local0.loseFocusEventName = f4_arg3
	f4_local0.itemInfo = f4_arg4
	f4_local0:registerEventHandler( "button_action", CoD.CategoryButton.Action )
	f4_local0:registerEventHandler( "gain_focus", CoD.CategoryButton.GainFocus )
	f4_local0:registerEventHandler( "lose_focus", CoD.CategoryButton.LoseFocus )
	return f4_local0
end

