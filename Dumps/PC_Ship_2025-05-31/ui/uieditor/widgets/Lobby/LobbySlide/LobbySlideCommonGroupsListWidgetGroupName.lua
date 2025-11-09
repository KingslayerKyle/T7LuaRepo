CoD.LobbySlideCommonGroupsListWidgetGroupName = InheritFrom( LUI.UIElement )
CoD.LobbySlideCommonGroupsListWidgetGroupName.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 0
	} )
	self:setAlignment( LUI.Alignment.Left )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LobbySlideCommonGroupsListWidgetGroupName )
	self.id = "LobbySlideCommonGroupsListWidgetGroupName"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 219 )
	self:setTopBottom( true, false, 0, 20 )
	
	local Name = LUI.UITightText.new()
	Name:setLeftRight( true, false, 0, 200 )
	Name:setTopBottom( true, false, 0, 18 )
	Name:setRGB( 1, 0.83, 0.5 )
	Name:setTTF( "fonts/default.ttf" )
	self:addElement( Name )
	self.Name = Name
	
	local PrimaryGroupBadge = LUI.UIImage.new()
	PrimaryGroupBadge:setLeftRight( true, false, 200, 219 )
	PrimaryGroupBadge:setTopBottom( true, false, 0, 19 )
	PrimaryGroupBadge:setRGB( 1, 0.83, 0.5 )
	PrimaryGroupBadge:setImage( RegisterImage( "uie_t7_icon_menu_simple_groups_favorites" ) )
	self:addElement( PrimaryGroupBadge )
	self.PrimaryGroupBadge = PrimaryGroupBadge
	
	self.Name:linkToElementModel( self, "groupName", true, function ( model )
		local groupName = Engine.GetModelValue( model )
		if groupName then
			Name:setText( Engine.Localize( groupName ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Name:completeAnimation()
				self.Name:setRGB( 1, 1, 1 )
				self.Name:setAlpha( 1 )
				self.clipFinished( Name, {} )
				PrimaryGroupBadge:completeAnimation()
				self.PrimaryGroupBadge:setAlpha( 0 )
				self.clipFinished( PrimaryGroupBadge, {} )
			end,
			Active = function ()
				self:setupElementClipCounter( 2 )
				Name:completeAnimation()
				self.Name:setAlpha( 1 )
				self.clipFinished( Name, {} )
				PrimaryGroupBadge:completeAnimation()
				self.PrimaryGroupBadge:setAlpha( 0 )
				self.clipFinished( PrimaryGroupBadge, {} )
			end
		},
		PrimaryGroup = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Name:completeAnimation()
				self.Name:setRGB( 1, 0.83, 0.5 )
				self.Name:setAlpha( 1 )
				self.clipFinished( Name, {} )
				PrimaryGroupBadge:completeAnimation()
				self.PrimaryGroupBadge:setAlpha( 1 )
				self.clipFinished( PrimaryGroupBadge, {} )
			end,
			Active = function ()
				self:setupElementClipCounter( 2 )
				Name:completeAnimation()
				self.Name:setAlpha( 1 )
				self.clipFinished( Name, {} )
				PrimaryGroupBadge:completeAnimation()
				self.PrimaryGroupBadge:setAlpha( 1 )
				self.clipFinished( PrimaryGroupBadge, {} )
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
		element.Name:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

