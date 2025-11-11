require( "ui.uieditor.widgets.CAC.TitleDotsWidget" )
require( "ui.uieditor.widgets.Groups.Common.GroupsHQSubheader" )
require( "ui.uieditor.widgets.Groups.GroupEmblemWidget" )

CoD.GroupsBackground = InheritFrom( LUI.UIElement )
CoD.GroupsBackground.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GroupsBackground )
	self.id = "GroupsBackground"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 1080 )
	self.anyChildUsesUpdateState = true
	
	local BlackOverlay = LUI.UIImage.new()
	BlackOverlay:setLeftRight( 0, 0, -26, 1954 )
	BlackOverlay:setTopBottom( 0, 0, -19, 1103 )
	BlackOverlay:setRGB( 0, 0, 0 )
	BlackOverlay:setAlpha( 0.7 )
	self:addElement( BlackOverlay )
	self.BlackOverlay = BlackOverlay
	
	local TitleBacking = LUI.UIImage.new()
	TitleBacking:setLeftRight( 0, 1, 0, 0 )
	TitleBacking:setTopBottom( 0, 0, 0, 124 )
	TitleBacking:setImage( RegisterImage( "uie_img_t7_menu_cacselection_titlebacking" ) )
	self:addElement( TitleBacking )
	self.TitleBacking = TitleBacking
	
	local HelpBacking = LUI.UIImage.new()
	HelpBacking:setLeftRight( 0, 1, 0, 0 )
	HelpBacking:setTopBottom( 1, 1, -99, 0 )
	self:addElement( HelpBacking )
	self.HelpBacking = HelpBacking
	
	local TitleDotsWidget = CoD.TitleDotsWidget.new( menu, controller )
	TitleDotsWidget:setLeftRight( 0, 0, 5, 793 )
	TitleDotsWidget:setTopBottom( 0, 0, -97.5, 139.5 )
	TitleDotsWidget:setAlpha( 0.49 )
	self:addElement( TitleDotsWidget )
	self.TitleDotsWidget = TitleDotsWidget
	
	local titleLabel = LUI.UITightText.new()
	titleLabel:setLeftRight( 0, 0, 96, 212 )
	titleLabel:setTopBottom( 0, 0, 42, 114 )
	titleLabel:setRGB( 0.87, 0.88, 0.78 )
	titleLabel:setAlpha( 0 )
	titleLabel:setText( Engine.Localize( "MENU_NEW" ) )
	titleLabel:setTTF( "fonts/escom.ttf" )
	self:addElement( titleLabel )
	self.titleLabel = titleLabel
	
	local GroupName = LUI.UITightText.new()
	GroupName:setLeftRight( 0, 0, 198, 198 )
	GroupName:setTopBottom( 0, 0, 88, 160 )
	GroupName:setRGB( 0.87, 0.88, 0.78 )
	GroupName:setAlpha( 0 )
	GroupName:setTTF( "fonts/escom.ttf" )
	GroupName:subscribeToGlobalModel( controller, "SelectedGroup", "name", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GroupName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( GroupName )
	self.GroupName = GroupName
	
	local GroupsHQSubheader = CoD.GroupsHQSubheader.new( menu, controller )
	GroupsHQSubheader:setLeftRight( 0, 0, 198, 496 )
	GroupsHQSubheader:setTopBottom( 0, 0, 62, 92 )
	self:addElement( GroupsHQSubheader )
	self.GroupsHQSubheader = GroupsHQSubheader
	
	local GroupEmblemWidget = CoD.GroupEmblemWidget.new( menu, controller )
	GroupEmblemWidget:mergeStateConditions( {
		{
			stateName = "DefaultGroupEmblem",
			condition = function ( menu, element, event )
				return IsGroupEmblemEmpty( element, controller ) and HasSelectedGroup( element, controller )
			end
		},
		{
			stateName = "ShowGroupEmblem",
			condition = function ( menu, element, event )
				local f4_local0
				if not IsGroupEmblemEmpty( element, controller ) then
					f4_local0 = HasSelectedGroup( element, controller )
				else
					f4_local0 = false
				end
				return f4_local0
			end
		}
	} )
	if GroupEmblemWidget.m_eventHandlers.group_emblem_updated then
		local currentEv = GroupEmblemWidget.m_eventHandlers.group_emblem_updated
		GroupEmblemWidget:registerEventHandler( "group_emblem_updated", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		GroupEmblemWidget:registerEventHandler( "group_emblem_updated", LUI.UIElement.updateState )
	end
	GroupEmblemWidget:linkToElementModel( GroupEmblemWidget, "groupId", true, function ( model )
		menu:updateElementState( GroupEmblemWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groupId"
		} )
	end )
	GroupEmblemWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.selectedGroup" ), function ( model )
		menu:updateElementState( GroupEmblemWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.selectedGroup"
		} )
	end )
	GroupEmblemWidget:setLeftRight( 0, 0, 96, 192 )
	GroupEmblemWidget:setTopBottom( 0, 0, 54, 150 )
	GroupEmblemWidget:subscribeToGlobalModel( controller, "SelectedGroup", "groupId", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GroupEmblemWidget.GroupEmblem:setupGroupEmblem( modelValue )
		end
	end )
	self:addElement( GroupEmblemWidget )
	self.GroupEmblemWidget = GroupEmblemWidget
	
	self.resetProperties = function ()
		GroupsHQSubheader:completeAnimation()
		titleLabel:completeAnimation()
		GroupEmblemWidget:completeAnimation()
		GroupName:completeAnimation()
		GroupsHQSubheader:setAlpha( 1 )
		titleLabel:setAlpha( 0 )
		GroupEmblemWidget:setAlpha( 1 )
		GroupName:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				titleLabel:completeAnimation()
				self.titleLabel:setAlpha( 1 )
				self.clipFinished( titleLabel, {} )
				GroupsHQSubheader:completeAnimation()
				self.GroupsHQSubheader:setAlpha( 0 )
				self.clipFinished( GroupsHQSubheader, {} )
				GroupEmblemWidget:completeAnimation()
				self.GroupEmblemWidget:setAlpha( 0 )
				self.clipFinished( GroupEmblemWidget, {} )
			end
		},
		SelectedGroup = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				GroupName:completeAnimation()
				self.GroupName:setAlpha( 1 )
				self.clipFinished( GroupName, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.TitleDotsWidget:close()
		self.GroupsHQSubheader:close()
		self.GroupEmblemWidget:close()
		self.GroupName:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

