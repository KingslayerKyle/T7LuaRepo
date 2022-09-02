-- 252ef7d02e071383c51bb84014c25ea2
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.ZMInventory.ZMMapSelection.ZMLobbyEEWidget" )

CoD.ZMLobbyEEWidgetSmall = InheritFrom( LUI.UIElement )
CoD.ZMLobbyEEWidgetSmall.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ZMLobbyEEWidgetSmall )
	self.id = "ZMLobbyEEWidgetSmall"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 42 )
	self:setTopBottom( true, false, 0, 42 )
	self.anyChildUsesUpdateState = true
	
	local ZMLobbyEEWidget0 = CoD.ZMLobbyEEWidget.new( menu, controller )
	ZMLobbyEEWidget0:setLeftRight( true, true, 0, 0 )
	ZMLobbyEEWidget0:setTopBottom( true, true, 0, 0 )
	ZMLobbyEEWidget0:linkToElementModel( self, nil, false, function ( model )
		ZMLobbyEEWidget0:setModel( model, controller )
	end )
	ZMLobbyEEWidget0:mergeStateConditions( {
		{
			stateName = "AllCompleteSummoningKey",
			condition = function ( menu, element, event )
				local f3_local0 = IsZombies()
				if f3_local0 then
					f3_local0 = IsSelfModelValueTrue( element, controller, "visible" )
					if f3_local0 then
						f3_local0 = IsSelfModelValueTrue( element, controller, "completed" )
						if f3_local0 then
							f3_local0 = IsGlobalModelValueTrue( element, controller, "eeGateworm.allComplete" )
							if f3_local0 then
								f3_local0 = IsSelfModelValueEqualTo( element, controller, "mapRef", "ZM_ZOD" )
								if f3_local0 then
									f3_local0 = IsSelfModelValueTrue( element, controller, "showingAll" )
									if f3_local0 then
										f3_local0 = ShouldShowLobbyEE()
									end
								end
							end
						end
					end
				end
				return f3_local0
			end
		},
		{
			stateName = "AllCompleteGateworm",
			condition = function ( menu, element, event )
				local f4_local0 = IsZombies()
				if f4_local0 then
					f4_local0 = IsSelfModelValueTrue( element, controller, "visible" )
					if f4_local0 then
						f4_local0 = IsSelfModelValueTrue( element, controller, "completed" )
						if f4_local0 then
							f4_local0 = IsGlobalModelValueTrue( element, controller, "eeGateworm.allComplete" )
							if f4_local0 then
								f4_local0 = IsSelfModelValueTrue( element, controller, "showingAll" )
								if f4_local0 then
									f4_local0 = ShouldShowLobbyEE()
								end
							end
						end
					end
				end
				return f4_local0
			end
		},
		{
			stateName = "VisibleGateworm",
			condition = function ( menu, element, event )
				local f5_local0 = IsZombies()
				if f5_local0 then
					f5_local0 = IsSelfModelValueTrue( element, controller, "visible" )
					if f5_local0 then
						if not IsSelfModelValueTrue( element, controller, "completed" ) and not IsSelfModelValueEqualTo( element, controller, "mapRef", "ZM_ZOD" ) then
							f5_local0 = ShouldShowLobbyEE()
						else
							f5_local0 = false
						end
					end
				end
				return f5_local0
			end
		},
		{
			stateName = "CompleteGateworm",
			condition = function ( menu, element, event )
				local f6_local0 = IsZombies()
				if f6_local0 then
					f6_local0 = IsSelfModelValueTrue( element, controller, "visible" )
					if f6_local0 then
						f6_local0 = IsSelfModelValueTrue( element, controller, "completed" )
						if f6_local0 then
							if not IsSelfModelValueEqualTo( element, controller, "mapRef", "ZM_ZOD" ) then
								f6_local0 = ShouldShowLobbyEE()
							else
								f6_local0 = false
							end
						end
					end
				end
				return f6_local0
			end
		},
		{
			stateName = "VisibleSummoningKey",
			condition = function ( menu, element, event )
				local f7_local0 = IsZombies()
				if f7_local0 then
					f7_local0 = IsSelfModelValueTrue( element, controller, "visible" )
					if f7_local0 then
						if not IsSelfModelValueTrue( element, controller, "completed" ) then
							f7_local0 = ShouldShowLobbyEE()
						else
							f7_local0 = false
						end
					end
				end
				return f7_local0
			end
		},
		{
			stateName = "CompleteSummoningKey",
			condition = function ( menu, element, event )
				local f8_local0 = IsZombies()
				if f8_local0 then
					f8_local0 = IsSelfModelValueTrue( element, controller, "visible" )
					if f8_local0 then
						f8_local0 = IsSelfModelValueTrue( element, controller, "completed" )
						if f8_local0 then
							f8_local0 = ShouldShowLobbyEE()
						end
					end
				end
				return f8_local0
			end
		}
	} )
	ZMLobbyEEWidget0:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( ZMLobbyEEWidget0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	ZMLobbyEEWidget0:linkToElementModel( ZMLobbyEEWidget0, "visible", true, function ( model )
		menu:updateElementState( ZMLobbyEEWidget0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "visible"
		} )
	end )
	ZMLobbyEEWidget0:linkToElementModel( ZMLobbyEEWidget0, "completed", true, function ( model )
		menu:updateElementState( ZMLobbyEEWidget0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "completed"
		} )
	end )
	ZMLobbyEEWidget0:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "eeGateworm.allComplete" ), function ( model )
		menu:updateElementState( ZMLobbyEEWidget0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "eeGateworm.allComplete"
		} )
	end )
	ZMLobbyEEWidget0:linkToElementModel( ZMLobbyEEWidget0, "mapRef", true, function ( model )
		menu:updateElementState( ZMLobbyEEWidget0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "mapRef"
		} )
	end )
	ZMLobbyEEWidget0:linkToElementModel( ZMLobbyEEWidget0, "showingAll", true, function ( model )
		menu:updateElementState( ZMLobbyEEWidget0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "showingAll"
		} )
	end )
	self:addElement( ZMLobbyEEWidget0 )
	self.ZMLobbyEEWidget0 = ZMLobbyEEWidget0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ZMLobbyEEWidget0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

