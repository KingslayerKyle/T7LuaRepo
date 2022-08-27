-- 531ebbaf5e5912669b9a1fdd4a0d92f6
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Groups.GroupMemberSummary" )
require( "ui.uieditor.widgets.Groups.GroupsSummaryStatus" )
require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )
require( "ui.uieditor.widgets.Groups.GroupEmblemWidget" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.verticalScrollingTextBox" )
require( "ui.uieditor.widgets.Groups.GroupPrimaryWidget" )

CoD.GroupsSummary = InheritFrom( LUI.UIElement )
CoD.GroupsSummary.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GroupsSummary )
	self.id = "GroupsSummary"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 350 )
	self:setTopBottom( true, false, 0, 460 )
	self.anyChildUsesUpdateState = true
	
	local Backing = LUI.UIImage.new()
	Backing:setLeftRight( true, true, 0, 0 )
	Backing:setTopBottom( true, true, 0, 0 )
	Backing:setAlpha( 0 )
	self:addElement( Backing )
	self.Backing = Backing
	
	local GroupMemberSummary = CoD.GroupMemberSummary.new( menu, controller )
	GroupMemberSummary:setLeftRight( true, false, 18, 315 )
	GroupMemberSummary:setTopBottom( true, false, 357.5, 422.5 )
	GroupMemberSummary:setAlpha( 0 )
	GroupMemberSummary.MemberCount.Title:setText( Engine.Localize( AppendString( "_CAPS", "GROUPS_MEMBERS" ) ) )
	GroupMemberSummary.PlayingCount.Title:setText( Engine.Localize( AppendString( "_CAPS", "GROUPS_PLAYING" ) ) )
	GroupMemberSummary.OnlineCount.Title:setText( Engine.Localize( AppendString( "_CAPS", "GROUPS_ONLINE" ) ) )
	GroupMemberSummary:linkToElementModel( self, "memberCount", true, function ( model )
		local memberCount = Engine.GetModelValue( model )
		if memberCount then
			GroupMemberSummary.MemberCount.Count:setText( Engine.Localize( memberCount ) )
		end
	end )
	GroupMemberSummary:linkToElementModel( self, "inTitleCount", true, function ( model )
		local inTitleCount = Engine.GetModelValue( model )
		if inTitleCount then
			GroupMemberSummary.PlayingCount.Count:setText( Engine.Localize( inTitleCount ) )
		end
	end )
	GroupMemberSummary:linkToElementModel( self, "onlineCount", true, function ( model )
		local onlineCount = Engine.GetModelValue( model )
		if onlineCount then
			GroupMemberSummary.OnlineCount.Count:setText( Engine.Localize( onlineCount ) )
		end
	end )
	self:addElement( GroupMemberSummary )
	self.GroupMemberSummary = GroupMemberSummary
	
	local GroupsSummaryStatus0 = CoD.GroupsSummaryStatus.new( menu, controller )
	GroupsSummaryStatus0:setLeftRight( true, false, 18, 312 )
	GroupsSummaryStatus0:setTopBottom( true, false, 253.5, 270.5 )
	GroupsSummaryStatus0:setAlpha( 0 )
	GroupsSummaryStatus0:linkToElementModel( self, nil, false, function ( model )
		GroupsSummaryStatus0:setModel( model, controller )
	end )
	self:addElement( GroupsSummaryStatus0 )
	self.GroupsSummaryStatus0 = GroupsSummaryStatus0
	
	local Line1 = LUI.UIImage.new()
	Line1:setLeftRight( true, false, 17, 315 )
	Line1:setTopBottom( true, false, 247.5, 251.5 )
	Line1:setAlpha( 0 )
	Line1:setImage( RegisterImage( "uie_img_t7_menu_cacselection_itemboxlineforeh" ) )
	Line1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Line1 )
	self.Line1 = Line1
	
	local Line2 = LUI.UIImage.new()
	Line2:setLeftRight( true, false, 17, 315 )
	Line2:setTopBottom( true, false, 274.5, 278.5 )
	Line2:setAlpha( 0 )
	Line2:setImage( RegisterImage( "uie_img_t7_menu_cacselection_itemboxlineforeh" ) )
	Line2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Line2 )
	self.Line2 = Line2
	
	local cacItemTitleGlow0 = CoD.cac_ItemTitleGlow.new( menu, controller )
	cacItemTitleGlow0:setLeftRight( true, false, 17, 316 )
	cacItemTitleGlow0:setTopBottom( true, false, 5.93, 41.99 )
	cacItemTitleGlow0:setRGB( 0.9, 0.9, 0.9 )
	cacItemTitleGlow0:setAlpha( 0 )
	self:addElement( cacItemTitleGlow0 )
	self.cacItemTitleGlow0 = cacItemTitleGlow0
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, true, -52, 50 )
	Glow:setTopBottom( false, false, -242.44, -169.44 )
	Glow:setAlpha( 0 )
	Glow:setImage( RegisterImage( "uie_t7_menu_cac_glow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local GroupEmblemWidget = CoD.GroupEmblemWidget.new( menu, controller )
	GroupEmblemWidget:setLeftRight( true, false, 19, 314 )
	GroupEmblemWidget:setTopBottom( true, false, 46.5, 227.11 )
	GroupEmblemWidget:setAlpha( 0 )
	GroupEmblemWidget:linkToElementModel( self, nil, false, function ( model )
		GroupEmblemWidget:setModel( model, controller )
	end )
	GroupEmblemWidget:linkToElementModel( self, "groupId", true, function ( model )
		local groupId = Engine.GetModelValue( model )
		if groupId then
			GroupEmblemWidget.GroupEmblem:setupGroupEmblem( groupId )
		end
	end )
	self:addElement( GroupEmblemWidget )
	self.GroupEmblemWidget = GroupEmblemWidget
	
	local StartMenuframenoBG00 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG00:setLeftRight( true, false, 16, 317 )
	StartMenuframenoBG00:setTopBottom( true, false, 44.5, 230.23 )
	StartMenuframenoBG00:setAlpha( 0 )
	self:addElement( StartMenuframenoBG00 )
	self.StartMenuframenoBG00 = StartMenuframenoBG00
	
	local GroupName = LUI.UIText.new()
	GroupName:setLeftRight( true, false, 21, 310 )
	GroupName:setTopBottom( true, false, 13.56, 33.56 )
	GroupName:setRGB( 0, 0, 0 )
	GroupName:setAlpha( 0 )
	GroupName:setTTF( "fonts/escom.ttf" )
	GroupName:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	GroupName:setShaderVector( 0, 0.06, 0, 0, 0 )
	GroupName:setShaderVector( 1, 0.02, 0, 0, 0 )
	GroupName:setShaderVector( 2, 1, 0, 0, 0 )
	GroupName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	GroupName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	GroupName:linkToElementModel( self, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			GroupName:setText( name )
		end
	end )
	self:addElement( GroupName )
	self.GroupName = GroupName
	
	local DesciptionBacking = LUI.UIImage.new()
	DesciptionBacking:setLeftRight( true, false, 16, 317 )
	DesciptionBacking:setTopBottom( true, false, 284, 351 )
	DesciptionBacking:setAlpha( 0 )
	DesciptionBacking:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrginactivefull" ) )
	DesciptionBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	DesciptionBacking:setShaderVector( 0, 0.05, 0.24, 0.36, 0.36 )
	DesciptionBacking:setupNineSliceShader( 16, 16 )
	self:addElement( DesciptionBacking )
	self.DesciptionBacking = DesciptionBacking
	
	local Description = CoD.verticalScrollingTextBox.new( menu, controller )
	Description:setLeftRight( true, false, 21, 310 )
	Description:setTopBottom( true, false, 289, 346 )
	Description:setAlpha( 0 )
	Description.textBox:setTTF( "fonts/default.ttf" )
	Description.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Description:linkToElementModel( self, "description", true, function ( model )
		local description = Engine.GetModelValue( model )
		if description then
			Description.textBox:setText( description )
		end
	end )
	self:addElement( Description )
	self.Description = Description
	
	local GroupPrimaryWidget = CoD.GroupPrimaryWidget.new( menu, controller )
	GroupPrimaryWidget:setLeftRight( true, false, 9, 250 )
	GroupPrimaryWidget:setTopBottom( true, false, 428, 470 )
	GroupPrimaryWidget:setAlpha( 0 )
	GroupPrimaryWidget:linkToElementModel( self, nil, false, function ( model )
		GroupPrimaryWidget:setModel( model, controller )
	end )
	GroupPrimaryWidget:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isPrimaryGroup" )
			end
		}
	} )
	GroupPrimaryWidget:linkToElementModel( GroupPrimaryWidget, "isPrimaryGroup", true, function ( model )
		menu:updateElementState( GroupPrimaryWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isPrimaryGroup"
		} )
	end )
	self:addElement( GroupPrimaryWidget )
	self.GroupPrimaryWidget = GroupPrimaryWidget
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				Backing:completeAnimation()
				self.Backing:setAlpha( 0 )
				self.clipFinished( Backing, {} )
				GroupMemberSummary:completeAnimation()
				self.GroupMemberSummary:setAlpha( 1 )
				self.clipFinished( GroupMemberSummary, {} )
				GroupsSummaryStatus0:completeAnimation()
				self.GroupsSummaryStatus0:setAlpha( 1 )
				self.clipFinished( GroupsSummaryStatus0, {} )
				Line1:completeAnimation()
				self.Line1:setAlpha( 1 )
				self.clipFinished( Line1, {} )
				Line2:completeAnimation()
				self.Line2:setAlpha( 1 )
				self.clipFinished( Line2, {} )
				cacItemTitleGlow0:completeAnimation()
				self.cacItemTitleGlow0:setAlpha( 1 )
				self.clipFinished( cacItemTitleGlow0, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0.14 )
				self.clipFinished( Glow, {} )
				GroupEmblemWidget:completeAnimation()
				self.GroupEmblemWidget:setAlpha( 1 )
				self.clipFinished( GroupEmblemWidget, {} )
				StartMenuframenoBG00:completeAnimation()
				self.StartMenuframenoBG00:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG00, {} )
				GroupName:completeAnimation()
				self.GroupName:setAlpha( 1 )
				self.clipFinished( GroupName, {} )
				DesciptionBacking:completeAnimation()
				self.DesciptionBacking:setAlpha( 1 )
				self.clipFinished( DesciptionBacking, {} )
				Description:completeAnimation()
				self.Description:setAlpha( 1 )
				self.clipFinished( Description, {} )
				GroupPrimaryWidget:completeAnimation()
				self.GroupPrimaryWidget:setAlpha( 1 )
				self.clipFinished( GroupPrimaryWidget, {} )
			end
		},
		NoGroupSelected = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				Backing:completeAnimation()
				self.Backing:setAlpha( 0 )
				self.clipFinished( Backing, {} )
				GroupMemberSummary:completeAnimation()
				self.GroupMemberSummary:setAlpha( 0 )
				self.clipFinished( GroupMemberSummary, {} )
				GroupsSummaryStatus0:completeAnimation()
				self.GroupsSummaryStatus0:setAlpha( 0 )
				self.clipFinished( GroupsSummaryStatus0, {} )
				Line1:completeAnimation()
				self.Line1:setAlpha( 0 )
				self.clipFinished( Line1, {} )
				Line2:completeAnimation()
				self.Line2:setAlpha( 0 )
				self.clipFinished( Line2, {} )
				cacItemTitleGlow0:completeAnimation()
				self.cacItemTitleGlow0:setAlpha( 0 )
				self.clipFinished( cacItemTitleGlow0, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
				GroupEmblemWidget:completeAnimation()
				self.GroupEmblemWidget:setAlpha( 0 )
				self.clipFinished( GroupEmblemWidget, {} )
				StartMenuframenoBG00:completeAnimation()
				self.StartMenuframenoBG00:setAlpha( 0 )
				self.clipFinished( StartMenuframenoBG00, {} )
				GroupName:completeAnimation()
				self.GroupName:setAlpha( 0 )
				self.clipFinished( GroupName, {} )
				DesciptionBacking:completeAnimation()
				self.DesciptionBacking:setAlpha( 0 )
				self.clipFinished( DesciptionBacking, {} )
				Description:completeAnimation()
				self.Description:setAlpha( 0 )
				self.clipFinished( Description, {} )
				GroupPrimaryWidget:completeAnimation()
				self.GroupPrimaryWidget:setAlpha( 0 )
				self.clipFinished( GroupPrimaryWidget, {} )
			end
		},
		InvitesGroupSummary = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				Backing:completeAnimation()
				self.Backing:setAlpha( 0 )
				self.clipFinished( Backing, {} )
				GroupMemberSummary:completeAnimation()
				self.GroupMemberSummary:setAlpha( 0 )
				self.clipFinished( GroupMemberSummary, {} )
				GroupsSummaryStatus0:completeAnimation()
				self.GroupsSummaryStatus0:setAlpha( 1 )
				self.clipFinished( GroupsSummaryStatus0, {} )
				Line1:completeAnimation()
				self.Line1:setAlpha( 1 )
				self.clipFinished( Line1, {} )
				Line2:completeAnimation()
				self.Line2:setAlpha( 1 )
				self.clipFinished( Line2, {} )
				cacItemTitleGlow0:completeAnimation()
				self.cacItemTitleGlow0:setAlpha( 1 )
				self.clipFinished( cacItemTitleGlow0, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0.14 )
				self.clipFinished( Glow, {} )
				GroupEmblemWidget:completeAnimation()
				self.GroupEmblemWidget:setAlpha( 1 )
				self.clipFinished( GroupEmblemWidget, {} )
				StartMenuframenoBG00:completeAnimation()
				self.StartMenuframenoBG00:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG00, {} )
				GroupName:completeAnimation()
				self.GroupName:setAlpha( 1 )
				self.clipFinished( GroupName, {} )
				DesciptionBacking:completeAnimation()
				self.DesciptionBacking:setAlpha( 1 )
				self.clipFinished( DesciptionBacking, {} )
				Description:completeAnimation()
				self.Description:setAlpha( 1 )
				self.clipFinished( Description, {} )
				GroupPrimaryWidget:completeAnimation()
				self.GroupPrimaryWidget:setAlpha( 1 )
				self.clipFinished( GroupPrimaryWidget, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "NoGroupSelected",
			condition = function ( menu, element, event )
				return not HasSelectedGroup( element, controller )
			end
		},
		{
			stateName = "InvitesGroupSummary",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:linkToElementModel( self, "groupId", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groupId"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GroupMemberSummary:close()
		element.GroupsSummaryStatus0:close()
		element.cacItemTitleGlow0:close()
		element.GroupEmblemWidget:close()
		element.StartMenuframenoBG00:close()
		element.Description:close()
		element.GroupPrimaryWidget:close()
		element.GroupName:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

