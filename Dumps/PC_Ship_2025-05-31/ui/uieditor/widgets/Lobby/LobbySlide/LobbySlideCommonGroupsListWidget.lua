require( "ui.uieditor.widgets.Lobby.LobbySlide.LobbySlideCommonGroupsListWidgetGroupName" )

CoD.LobbySlideCommonGroupsListWidget = InheritFrom( LUI.UIElement )
CoD.LobbySlideCommonGroupsListWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LobbySlideCommonGroupsListWidget )
	self.id = "LobbySlideCommonGroupsListWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 307 )
	self:setTopBottom( true, false, 0, 20 )
	self.anyChildUsesUpdateState = true
	
	local LobbySlideCommonGroupsListWidgetGroupName = CoD.LobbySlideCommonGroupsListWidgetGroupName.new( menu, controller )
	LobbySlideCommonGroupsListWidgetGroupName:setLeftRight( true, false, 0, 219 )
	LobbySlideCommonGroupsListWidgetGroupName:setTopBottom( true, false, 0, 20 )
	LobbySlideCommonGroupsListWidgetGroupName:setRGB( 1, 0.41, 0 )
	LobbySlideCommonGroupsListWidgetGroupName:linkToElementModel( self, nil, false, function ( model )
		LobbySlideCommonGroupsListWidgetGroupName:setModel( model, controller )
	end )
	self:addElement( LobbySlideCommonGroupsListWidgetGroupName )
	self.LobbySlideCommonGroupsListWidgetGroupName = LobbySlideCommonGroupsListWidgetGroupName
	
	local PrimaryTag = LUI.UIText.new()
	PrimaryTag:setLeftRight( true, false, 0, 307 )
	PrimaryTag:setTopBottom( true, false, 0, 18 )
	PrimaryTag:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
	PrimaryTag:setText( Engine.Localize( "GROUPS_PRIMARY_TAG" ) )
	PrimaryTag:setTTF( "fonts/default.ttf" )
	PrimaryTag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	PrimaryTag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	PrimaryTag:registerEventHandler( "menu_loaded", function ( element, event )
		local f3_local0 = nil
		SetupAutoHorizontalAlignArabicText( element )
		if not f3_local0 then
			f3_local0 = element:dispatchEventToChildren( event )
		end
		return f3_local0
	end )
	self:addElement( PrimaryTag )
	self.PrimaryTag = PrimaryTag
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				LobbySlideCommonGroupsListWidgetGroupName:completeAnimation()
				self.LobbySlideCommonGroupsListWidgetGroupName:setRGB( 1, 1, 1 )
				self.clipFinished( LobbySlideCommonGroupsListWidgetGroupName, {} )
				PrimaryTag:completeAnimation()
				self.PrimaryTag:setAlpha( 0 )
				self.clipFinished( PrimaryTag, {} )
			end,
			Active = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		PrimaryGroup = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				LobbySlideCommonGroupsListWidgetGroupName:completeAnimation()
				self.LobbySlideCommonGroupsListWidgetGroupName:setRGB( 1, 0.41, 0 )
				self.clipFinished( LobbySlideCommonGroupsListWidgetGroupName, {} )
				PrimaryTag:completeAnimation()
				self.PrimaryTag:setAlpha( 1 )
				self.clipFinished( PrimaryTag, {} )
			end,
			Active = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "PrimaryGroup",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "primaryGroup" )
			end
		}
	} )
	self:linkToElementModel( self, "primaryGroup", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "primaryGroup"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LobbySlideCommonGroupsListWidgetGroupName:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

