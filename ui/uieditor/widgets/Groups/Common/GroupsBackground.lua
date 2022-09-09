-- 915996d05656135f9ef6d3861ecd55dc
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local BlackOverlay = LUI.UIImage.new()
	BlackOverlay:setLeftRight( true, false, -17.3, 1302.7 )
	BlackOverlay:setTopBottom( true, false, -13, 735 )
	BlackOverlay:setRGB( 0, 0, 0 )
	BlackOverlay:setAlpha( 0.7 )
	self:addElement( BlackOverlay )
	self.BlackOverlay = BlackOverlay
	
	local TitleBacking = LUI.UIImage.new()
	TitleBacking:setLeftRight( true, true, 0, 0 )
	TitleBacking:setTopBottom( true, false, 0, 82.67 )
	TitleBacking:setImage( RegisterImage( "uie_img_t7_menu_cacselection_titlebacking" ) )
	self:addElement( TitleBacking )
	self.TitleBacking = TitleBacking
	
	local HelpBacking = LUI.UIImage.new()
	HelpBacking:setLeftRight( true, true, 0, 0 )
	HelpBacking:setTopBottom( false, true, -66, 0 )
	HelpBacking:setImage( RegisterImage( "uie_img_t7_menu_frontend_asset_helpbacking" ) )
	self:addElement( HelpBacking )
	self.HelpBacking = HelpBacking
	
	local TitleDotsWidget = CoD.TitleDotsWidget.new( menu, controller )
	TitleDotsWidget:setLeftRight( true, false, 3, 528.34 )
	TitleDotsWidget:setTopBottom( true, false, -65.33, 92.67 )
	TitleDotsWidget:setAlpha( 0.49 )
	self:addElement( TitleDotsWidget )
	self.TitleDotsWidget = TitleDotsWidget
	
	local titleLabel = LUI.UITightText.new()
	titleLabel:setLeftRight( true, false, 64, 141 )
	titleLabel:setTopBottom( true, false, 28, 76 )
	titleLabel:setRGB( 0.87, 0.88, 0.78 )
	titleLabel:setAlpha( 0 )
	titleLabel:setText( Engine.Localize( "MENU_NEW" ) )
	titleLabel:setTTF( "fonts/escom.ttf" )
	self:addElement( titleLabel )
	self.titleLabel = titleLabel
	
	local GroupName = LUI.UITightText.new()
	GroupName:setLeftRight( true, false, 132, 132 )
	GroupName:setTopBottom( true, false, 58.67, 106.67 )
	GroupName:setRGB( 0.87, 0.88, 0.78 )
	GroupName:setAlpha( 0 )
	GroupName:setTTF( "fonts/escom.ttf" )
	GroupName:subscribeToGlobalModel( controller, "SelectedGroup", "name", function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			GroupName:setText( Engine.Localize( name ) )
		end
	end )
	self:addElement( GroupName )
	self.GroupName = GroupName
	
	local GroupsHQSubheader = CoD.GroupsHQSubheader.new( menu, controller )
	GroupsHQSubheader:setLeftRight( true, false, 132, 331 )
	GroupsHQSubheader:setTopBottom( true, false, 41, 61 )
	self:addElement( GroupsHQSubheader )
	self.GroupsHQSubheader = GroupsHQSubheader
	
	local GroupEmblemWidget = CoD.GroupEmblemWidget.new( menu, controller )
	GroupEmblemWidget:setLeftRight( true, false, 64, 128 )
	GroupEmblemWidget:setTopBottom( true, false, 36, 100 )
	GroupEmblemWidget:subscribeToGlobalModel( controller, "SelectedGroup", "groupId", function ( model )
		local groupId = Engine.GetModelValue( model )
		if groupId then
			GroupEmblemWidget.GroupEmblem:setupGroupEmblem( groupId )
		end
	end )
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
				local f5_local0
				if not IsGroupEmblemEmpty( element, controller ) then
					f5_local0 = HasSelectedGroup( element, controller )
				else
					f5_local0 = false
				end
				return f5_local0
			end
		}
	} )
	if GroupEmblemWidget.m_eventHandlers.group_emblem_updated then
		local f1_local9 = GroupEmblemWidget.m_eventHandlers.group_emblem_updated
		GroupEmblemWidget:registerEventHandler( "group_emblem_updated", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return f1_local9( element, event )
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
	self:addElement( GroupEmblemWidget )
	self.GroupEmblemWidget = GroupEmblemWidget
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				titleLabel:completeAnimation()
				self.titleLabel:setAlpha( 1 )
				self.clipFinished( titleLabel, {} )

				GroupName:completeAnimation()
				self.GroupName:setAlpha( 0 )
				self.clipFinished( GroupName, {} )

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
				self:setupElementClipCounter( 4 )

				titleLabel:completeAnimation()
				self.titleLabel:setAlpha( 0 )
				self.clipFinished( titleLabel, {} )

				GroupName:completeAnimation()
				self.GroupName:setAlpha( 1 )
				self.clipFinished( GroupName, {} )

				GroupsHQSubheader:completeAnimation()
				self.GroupsHQSubheader:setAlpha( 1 )
				self.clipFinished( GroupsHQSubheader, {} )

				GroupEmblemWidget:completeAnimation()
				self.GroupEmblemWidget:setAlpha( 1 )
				self.clipFinished( GroupEmblemWidget, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.TitleDotsWidget:close()
		element.GroupsHQSubheader:close()
		element.GroupEmblemWidget:close()
		element.GroupName:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
