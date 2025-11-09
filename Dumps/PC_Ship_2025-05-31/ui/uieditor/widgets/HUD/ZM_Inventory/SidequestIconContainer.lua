local f0_local0 = require
f0_local0( "ui.uieditor.widgets.ZM_InventoryFactory.SidequestIconNotificationWidget" )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4 )
	if f1_arg4.clientfield then
		f1_arg1:subscribeToModel( Engine.GetModel( f1_arg2, f1_arg4.clientfield .. ".icon" ), function ( model )
			local modelValue = Engine.GetModelValue( model )
			Engine.SetModelValue( Engine.GetModel( f1_arg3, "icon" ), f1_arg4.icon )
			Engine.SetModelValue( Engine.GetModel( f1_arg3, "newIcon" ), modelValue )
		end, true )
		f1_arg1:subscribeToModel( Engine.GetModel( f1_arg2, f1_arg4.clientfield .. ".notification" ), function ( model )
			Engine.SetModelValue( Engine.GetModel( f1_arg3, "show_notification" ), Engine.GetModelValue( model ) )
		end, false )
	else
		for f1_local3, f1_local4 in ipairs( f1_arg4 ) do
			f0_local0( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_local4 )
		end
	end
end

DataSources.ZMSidequestIconList = {
	prepare = function ( f4_arg0, f4_arg1, f4_arg2 )
		if not f4_arg1.sidequestIcons then
			f4_arg1.sidequestIcons = {}
		end
		if not CoD.Zombie.SidequestIcons then
			return f4_arg1.sidequestIcons
		end
		local f4_local0 = Engine.GetModel( Engine.GetModelForController( f4_arg0 ), "sidequestIcons" )
		if not f4_local0 then
			return f4_arg1.sidequestIcons
		end
		local f4_local1 = Engine.CreateModel( Engine.GetModelForController( f4_arg0 ), "ZMSidequestIcon" )
		for f4_local5, f4_local6 in ipairs( CoD.Zombie.SidequestIcons ) do
			local f4_local7 = Engine.CreateModel( f4_local1, "sidequestIcon" .. f4_local5 )
			Engine.SetModelValue( Engine.CreateModel( f4_local7, "icon" ), f4_local6.icon and f4_local6.icon or f4_local6[1].icon )
			Engine.SetModelValue( Engine.CreateModel( f4_local7, "newIcon" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( f4_local7, "show_notification" ), 0 )
			table.insert( f4_arg1.sidequestIcons, f4_local7 )
			f0_local0( f4_arg0, f4_arg1, f4_local0, f4_local7, f4_local6 )
		end
		return f4_local1
	end,
	getCount = function ( f5_arg0 )
		return #f5_arg0.sidequestIcons
	end,
	getItem = function ( f6_arg0, f6_arg1, f6_arg2 )
		return f6_arg1.sidequestIcons[f6_arg2]
	end
}
CoD.SidequestIconContainer = InheritFrom( LUI.UIElement )
CoD.SidequestIconContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SidequestIconContainer )
	self.id = "SidequestIconContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 390 )
	self:setTopBottom( true, false, 0, 89 )
	self.anyChildUsesUpdateState = true
	
	local SidequestIconList = LUI.GridLayout.new( menu, controller, false, 0, 0, 2, 0, nil, nil, false, false, 0, 0, false, false )
	SidequestIconList:setLeftRight( false, false, -195, 195 )
	SidequestIconList:setTopBottom( false, false, -48, 48 )
	SidequestIconList:setWidgetType( CoD.SidequestIconNotificationWidget )
	SidequestIconList:setHorizontalCount( 4 )
	SidequestIconList:setDataSource( "ZMSidequestIconList" )
	SidequestIconList:mergeStateConditions( {
		{
			stateName = "Scoreboard",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( SidequestIconList )
	self.SidequestIconList = SidequestIconList
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				SidequestIconList:completeAnimation()
				self.SidequestIconList:setAlpha( 1 )
				self.clipFinished( SidequestIconList, {} )
			end,
			Hidden = function ()
				self:setupElementClipCounter( 1 )
				local SidequestIconListFrame2 = function ( SidequestIconList, event )
					if not event.interrupted then
						SidequestIconList:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					SidequestIconList:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( SidequestIconList, event )
					else
						SidequestIconList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				SidequestIconList:completeAnimation()
				self.SidequestIconList:setAlpha( 1 )
				SidequestIconListFrame2( SidequestIconList, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				SidequestIconList:completeAnimation()
				self.SidequestIconList:setAlpha( 0 )
				self.clipFinished( SidequestIconList, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 1 )
				local SidequestIconListFrame2 = function ( SidequestIconList, event )
					if not event.interrupted then
						SidequestIconList:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					SidequestIconList:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( SidequestIconList, event )
					else
						SidequestIconList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				SidequestIconList:completeAnimation()
				self.SidequestIconList:setAlpha( 0 )
				SidequestIconListFrame2( SidequestIconList, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.SidequestIconList:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

