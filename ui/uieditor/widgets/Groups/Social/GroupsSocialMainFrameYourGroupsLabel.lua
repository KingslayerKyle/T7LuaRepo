-- 2e27265bdf449d844da0f27a0b2a5f21
-- This hash is used for caching, delete to decompile the file again

CoD.GroupsSocialMainFrameYourGroupsLabel = InheritFrom( LUI.UIElement )
CoD.GroupsSocialMainFrameYourGroupsLabel.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.GroupsSocialMainFrameYourGroupsLabel )
	self.id = "GroupsSocialMainFrameYourGroupsLabel"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 374 )
	self:setTopBottom( true, false, 0, 19 )
	
	local SelfGroupsLabel = LUI.UIText.new()
	SelfGroupsLabel:setLeftRight( true, false, 0, 374 )
	SelfGroupsLabel:setTopBottom( true, false, 0, 19 )
	SelfGroupsLabel:setRGB( ColorSet.FocusColor.r, ColorSet.FocusColor.g, ColorSet.FocusColor.b )
	SelfGroupsLabel:setText( Engine.Localize( "GROUPS_YOUR_GROUPS" ) )
	SelfGroupsLabel:setTTF( "fonts/default.ttf" )
	SelfGroupsLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	SelfGroupsLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SelfGroupsLabel )
	self.SelfGroupsLabel = SelfGroupsLabel
	
	local FriendsGroupsLabel = LUI.UIText.new()
	FriendsGroupsLabel:setLeftRight( true, false, 0, 374 )
	FriendsGroupsLabel:setTopBottom( true, false, 0, 19 )
	FriendsGroupsLabel:setRGB( ColorSet.FocusColor.r, ColorSet.FocusColor.g, ColorSet.FocusColor.b )
	FriendsGroupsLabel:setAlpha( 0 )
	FriendsGroupsLabel:setText( Engine.Localize( "GROUPS_FRIENDS_GROUPS" ) )
	FriendsGroupsLabel:setTTF( "fonts/default.ttf" )
	FriendsGroupsLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	FriendsGroupsLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( FriendsGroupsLabel )
	self.FriendsGroupsLabel = FriendsGroupsLabel
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				SelfGroupsLabel:completeAnimation()
				self.SelfGroupsLabel:setAlpha( 0 )
				self.clipFinished( SelfGroupsLabel, {} )

				FriendsGroupsLabel:completeAnimation()
				self.FriendsGroupsLabel:setAlpha( 0 )
				self.clipFinished( FriendsGroupsLabel, {} )
			end
		},
		YourGroups = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				SelfGroupsLabel:completeAnimation()
				self.SelfGroupsLabel:setLeftRight( true, false, 0, 374 )
				self.SelfGroupsLabel:setTopBottom( true, false, 0, 19 )
				self.SelfGroupsLabel:setRGB( ColorSet.FocusColor.r, ColorSet.FocusColor.g, ColorSet.FocusColor.b )
				self.SelfGroupsLabel:setAlpha( 1 )
				self.clipFinished( SelfGroupsLabel, {} )

				FriendsGroupsLabel:completeAnimation()
				self.FriendsGroupsLabel:setAlpha( 0 )
				self.clipFinished( FriendsGroupsLabel, {} )
			end
		},
		FriendsGroups = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				SelfGroupsLabel:completeAnimation()
				self.SelfGroupsLabel:setAlpha( 0 )
				self.clipFinished( SelfGroupsLabel, {} )

				FriendsGroupsLabel:completeAnimation()
				self.FriendsGroupsLabel:setAlpha( 1 )
				self.clipFinished( FriendsGroupsLabel, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "YourGroups",
			condition = function ( menu, element, event )
				return IsModelValueGreaterThan( controller, "groups.groupCount_self", 0 )
			end
		},
		{
			stateName = "FriendsGroups",
			condition = function ( menu, element, event )
				local f6_local0 = IsModelValueEqualTo( controller, "groups.groupCount_self", 0 )
				if f6_local0 then
					f6_local0 = IsModelValueGreaterThan( controller, "groups.groupCount_search", 0 )
					if f6_local0 then
						f6_local0 = not IsModelValueTrue( controller, "groups.searchGroupsInProgress" )
					end
				end
				return f6_local0
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.groupCount_self" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.groupCount_self"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.groupCount_search" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.groupCount_search"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.searchGroupsInProgress" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.searchGroupsInProgress"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

